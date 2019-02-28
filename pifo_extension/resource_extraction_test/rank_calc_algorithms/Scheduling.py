from SchedulingMachine.PIFO_Interface import PifoInterface


class RoundRobin(PifoInterface):
    """
    Class for Round Robin Implementation.
    """
    def __init__(self):
        super(RoundRobin, self).__init__()
        print "init Round Robin Class"
        # self.local_counter = {}
        # self.flow = 0
        # self.lc = 0
        # self.gc = 0  # global counter

    def get_flow_by_key(self, pkt):
        return pkt.get_key()

    def rank_calc(self, pkt, pkt_meta):
        """
        Override the super class
        calculate the packet rank for each packet.

        #algorithm
        # flow = get_flow(packet)
        # lc(flow) = max(lc(flow),gc) + 1
        # rank = lc(flow)
        :return:
        """

        flow_table = {
            "A": 1,
            "B": 2,
            "C": 3,
            "D": 4
        }

        # flow = get_flow(packet)
        # flow_id = self.get_flow_by_key(pkt) # return int value
        flow_id = self.table_lookup(pkt.get_key(), flow_table, default_result = 9)

        # get local counter
        # if not exist, then init with the key.

        if flow_id not in self.local_counter_list:
            self.local_counter_list[flow_id] = 0

        self.lc = self.local_counter_list[flow_id]

        # update local counter,
        # lc(flow) = max(lc(flow),gc) + 1
        self.lc = self.action_logic_unit(self.lc, self.gc, "max")
        self.lc = self.action_logic_unit(self.lc, 1, "+")

        # update local counter
        self.local_counter_list[flow_id] = self.lc

        # the rank value format is minimum 2 digit value => [lc][flow_id]
        # with this format, always dequeue the lowest flow_id'w packet.
        # ex. dequeue sequence => flow 1, flow 2, flow 3.

        rank = self.action_logic_unit(self.lc, 10, "*")
        rank = self.action_logic_unit(rank, flow_id, "+")

        return rank

    def update_global_counter(self, rank):
        """
        update global counter,
        the global counter is same as the last dequeued packet's rank
        :param rank: last dequeued packet's rank
        :return: none
        """
        ## self.gc = rank / 10
        self.action_logic_unit(self.gc, 10, "/")

class WeightedRoundRobin(PifoInterface):
    """
    Class for Packet by Packet Weighted Round Robin Implementation.
    Assume run this algorithm among three flow: flow1, flow2, flow3
    Where each weight is 2:1:1,
    Then the dequeue sequence is flow1, flow1, flow2, flow3.
    """
    def __init__(self):
        super(WeightedRoundRobin, self).__init__()
        print "init Weighted Round Robin Class"
        # self.local_counter = {}
        # self.flow = 0
        # self.gc = 0  # global counter

        self.flow_table = {
            "A": 1,
            "B": 2,
            "C": 3,
            "D": 4
        }

        self.weight_table = {
            1: 1,
            2: 2,
            3: 4,
            4: 2
        }

        self.remain_weight_table = {
            1: 0,
            2: 0,
            3: 0,
            4: 0,
            9: 0,  # default flow.
        }


    def rank_calc(self, pkt, pkt_meta):

        # get flow id
        flow_id = self.table_lookup(key = pkt.get_key(), table = self.flow_table, default_result = 9)

        # get flow weight
        weight = self.table_lookup(key = flow_id, table = self.weight_table, default_result = 1)

        # get flow remain weight
        # consider that, there is no default result for remain_weight
        remain_weight = self.table_lookup(key = flow_id, table = self.remain_weight_table, default_result = "None")

        # get local counter
        # if no existing flow key, then init it.
        if flow_id not in self.local_counter_list:
            self.local_counter_list[flow_id] = 0

        # get local counter value.
        local_counter = self.local_counter_list[flow_id]

        # start to calculate the rank

        # check out-age condition, if true, then update local counter and remain weight.
        is_out_age = self.action_logic_unit(local_counter, self.gc, "<")
        if is_out_age:
            local_counter = self.gc
            remain_weight = weight

        # check remain-weight condition, if true, then reset remain weight and add local counter.
        is_no_remain_weight = self.action_logic_unit(remain_weight, 0, "==")
        if is_no_remain_weight:
            local_counter = self.action_logic_unit(local_counter, 1, "+")
            remain_weight = weight

        rank = self.action_logic_unit(local_counter, 10, "*")
        rank = self.action_logic_unit(rank, flow_id, "+")
        remain_weight = self.action_logic_unit(remain_weight, 1, "-")

        # update local counter and remain weight
        self.local_counter_list[flow_id] = local_counter
        self.remain_weight_table[flow_id] = remain_weight

        return rank


    def update_global_counter(self, rank):
        """
        update global counter,
        the global counter is same as the last dequeued packet's rank
        :param rank: last dequeued packet's rank
        :return: none
        """
        self.gc = rank / 10

    def after_dequeue_process(self, packet, packet_meta):
        pass


class DeficitRoundRobin(PifoInterface):
    """
    Class for Deficit Round Robin Implementation. aka. token based round robin.
    Assume run this algorithm among three flow: flow1, flow2, flow3
    Where each weight is 150:100:100,
    Then the dequeue packet until remain token is less than packet length.
    """
    def __init__(self):
        super(DeficitRoundRobin, self).__init__()
        print "init Deficit Round Robin Class"
        # self.local_counter = {}
        # self.flow = 0
        # self.gc = 0  # global counter

        self.flow_table = {
            "A": 1,
            "B": 2,
            "C": 3,
            "D": 4
        }

        self.weight_table = {
            1: 200,
            2: 100,
            3: 100,
            4: 50
        }

        self.remain_weight_table = {
            1: 0,
            2: 0,
            3: 0,
            4: 0,
            9: 0,  # default flow.
        }

        self.enqueue_counter_table = {
            1: 0,
            2: 0,
            3: 0,
            4: 0,
        }

        self.dequeue_counter_table = {
            1: 0,
            2: 0,
            3: 0,
            4: 0,
        }



    def rank_calc(self, pkt, pkt_meta):

        # get flow id
        flow_id = self.table_lookup(key = pkt.get_key(), table = self.flow_table, default_result = 9)

        # get flow weight
        weight = self.table_lookup(key = flow_id, table = self.weight_table, default_result = 1)

        # get flow remain weight
        # consider that, there is no default result for remain_weight
        remain_weight = self.table_lookup(key = flow_id, table = self.remain_weight_table, default_result = "None")

        # get packet counter
        packet_counter = self.table_lookup(key = flow_id, table = self.enqueue_counter_table, default_result = "None")

        # get local counter
        # if no existing flow key, then init it.
        if flow_id not in self.local_counter_list:
            self.local_counter_list[flow_id] = 0

        # get local counter value.
        local_counter = self.local_counter_list[flow_id]

        # start to calculate the rank

        # check out-age condition, if true, then update local counter and remain weight.
        is_out_age = self.action_logic_unit(local_counter, self.gc, "<")
        if is_out_age:
            local_counter = self.gc
            remain_weight = weight

        # check remain-weight condition, if true, then reset remain weight and add local counter.
        is_not_engough_remain_weight = self.action_logic_unit(remain_weight, pkt.get_length(), "<")
        if is_not_engough_remain_weight:
            # in this condition, try to calculate how many rounds of token needed for sending current packet.
            remain_bytes_to_handle = self.action_logic_unit(pkt.get_length(), remain_weight, "-")
            rounds_needed = self.action_logic_unit(remain_bytes_to_handle, weight, "/+")

            local_counter = self.action_logic_unit(local_counter, rounds_needed, "+")
            weight_add = self.action_logic_unit(weight, rounds_needed, "*")
            remain_weight = self.action_logic_unit(remain_weight, weight_add, "+")

        rank = self.action_logic_unit(local_counter, 10, "*")
        rank = self.action_logic_unit(rank, flow_id, "+")
        remain_weight = self.action_logic_unit(remain_weight, pkt.get_length(), "-")
        packet_counter = self.action_logic_unit(packet_counter, 1, "+")


        # update local counter and remain weight
        self.local_counter_list[flow_id] = local_counter
        self.remain_weight_table[flow_id] = remain_weight
        self.enqueue_counter_table[flow_id] = packet_counter

        return rank


    def update_global_counter(self, rank):
        """
        update global counter,
        the global counter is same as the last dequeued packet's rank
        :param rank: last dequeued packet's rank
        :return: none
        """
        self.gc = rank / 10


    def after_dequeue_process(self, packet, packet_meta):
        """
        Process after dequeue.
        stateful data update
        :param packet:
        :param packet_meta:
        :return:
        """

        # get flow id
        flow_id = self.table_lookup(key = packet.get_key(), table = self.flow_table, default_result = 9)
        # get packet counter
        packet_enqueue_count = self.table_lookup(key = flow_id, table = self.enqueue_counter_table,
                                                 default_result = "None")

        packet_sent_count = self.table_lookup(key = flow_id, table = self.dequeue_counter_table,
                                              default_result = "None")
        remain_weight = self.table_lookup(key = flow_id, table = self.remain_weight_table,
                                              default_result = "None")

        packet_sent_count = self.action_logic_unit(packet_sent_count, 1, "+")
        self.dequeue_counter_table[flow_id] = packet_sent_count

        is_queue_empty = self.action_logic_unit(packet_enqueue_count, packet_sent_count, "==")
        print "======== is_queue_empty ? {} =>  packet_enqueue_count {} == packet_sent_count {} "\
            .format(str(is_queue_empty), packet_enqueue_count, packet_sent_count)
        # if no flow_id's packet in the queue, reset the remain weight.
        if is_queue_empty:
            print "[debug] Deficit Round Robin: Reset the Remain Weight Flow {}, Weight {} => 0 " \
                  "due to no more packet for flow ".format(packet.get_key(), remain_weight)
            self.remain_weight_table[flow_id] = 0


class CalendarQueue(PifoInterface):
    """
    Class for CalendarQueue Implementation.

    """
    def __init__(self):
        super(CalendarQueue, self).__init__()
        print "init Deficit Round Robin Class"
        # self.local_counter = {}
        # self.flow = 0
        # self.gc = 0  # global counter

        self.flow_table = {
            "A": 1,
            "B": 2,
            "C": 3,
            "D": 4
        }

        self.weight_table = {
            1: 16,
            2: 32,
            3: 8,
            4: 8
        }

        self.flow_last_dequeue_round_table = {
            1: 0,
            2: 0,
            3: 0,
            4: 0,
            9: 0,  # default flow.
        }

        self.flow_remain_bucket_table = {
            1: [],
            2: [],
            3: [],
            4: [],
            9: [],  # default flow.
        }

        self.global_remain_bucket_table = []

        self.link_capacity = 64
        self.queue_size = 4
        self.queue_length = 128
        self.calendar_max_round = 4  # allowed maximum future round value, drop any further packets.
        self.calendar_queue_duration = 1  # time duration for each queue in single round.
        self.last_dequeue_rank = 0

        self.calendar_queue_round_buffer = self.link_capacity * self.calendar_queue_duration

        # init remain_bucket_table
        for i in range(0, self.queue_size * self.calendar_max_round):
            for j in range(1, 5):
                self.flow_remain_bucket_table[j].append(self.weight_table[j])


    def rank_calc(self, pkt, pkt_meta):
        """
        Rank Calculation Logic for Calendar Queue/ Non work-conserving.
        :param pkt:
        :param pkt_meta:
        :return:
        """

        # Algorithm Start.

        # step1. packet classification, and get flow id
        # step2. get flow's  last_dequeue_round
        # step3. get current dequeue round. by packet receive_time.
        # step4. calculate start_round.
        # step5. get start_round's flow_remain_bucket.
        # step6. check if the remain_bucket has enough space for enqueue the packet; packet.length
        # step7. if available, then set packet's rank to the start_time of the round,
        # step8. (from step6) if not, then add round to 1
        # step9. get the flow_remain_bucket
        # step10. set the packet's rank with the start_time of the round,
        # step11. drop packet if the round is too far away from current.
        # step12. else, update the flow_remain_bucket
        # step13. return packet rank.
        # ===========================================================================================

        # Code Start

        # step1. packet classification, and get flow id
        flow_id = self.table_lookup(key = pkt.get_key(), table = self.flow_table, default_result = 9)
        print "[debug] Calendar Queue: Step 1. packet classification, flow_id = {}".format(flow_id)
        # step2. get flow's  last_dequeue_round
        flow_last_dequeue_round = self.table_lookup(key = flow_id, table = self.flow_last_dequeue_round_table, default_result = "None")
        print "[debug] Calendar Queue: Step 2. get flow{}'s last_dequeue_round = {}".format(flow_id, flow_last_dequeue_round)

        # step3. get current dequeue round. by packet receive_time.
        # round = receive_time / queue_duration.
        current_dequeue_round = int(self.action_logic_unit(pkt.get_receive_time(), self.calendar_queue_duration, "/"))
        print "[debug] Calendar Queue: Step 3. get current dequeue round = {}, by packet receive time = {}"\
            .format(current_dequeue_round, pkt.get_receive_time())

        # step4. calculate start_round.
        start_round = self.action_logic_unit(flow_last_dequeue_round, (current_dequeue_round + 1), "max")
        print "[debug] Calendar Queue: Step 4. Start Round = {}".format(start_round)

        # step5. get start_round's flow_remain_bucket.
        flow_bucket_list = self.table_lookup(key = flow_id, table = self.flow_remain_bucket_table, default_result = "None")
        max_round = self.action_logic_unit(self.queue_size, self.calendar_max_round, "*")
        index = self.action_logic_unit(start_round, max_round, "%")
        remain_flow_bucket = flow_bucket_list[index]
        print "[debug] Calendar Queue: Step 5. Remain_flow_bucket = {}".format(remain_flow_bucket)

        # step6. check if the remain_bucket has enough space for enqueue the packet; packet.length
        is_enough_space = self.action_logic_unit(remain_flow_bucket, pkt.get_length(), ">=")
        print "[debug] Calendar Queue: Step 6. is enough space = {}, remain_flow_bucket = {}, packet_length = {}"\
            .format(remain_flow_bucket,remain_flow_bucket, pkt.get_length())

        # step7. if available, then set packet's rank to the start_time of the round,
        if is_enough_space:
            rank = self.action_logic_unit(start_round, self.calendar_queue_duration, "*")
            print "[debug] Calendar Queue: Step 7. rank = {}".format(rank)

        # step8. (from step6) if not, then add round to 1
        else:
            start_round = self.action_logic_unit(start_round, 1, "+")
            print "[debug] Calendar Queue: Step 8. new start_round = {}".format(start_round)

        # step9. get the flow_remain_bucket
            index = self.action_logic_unit(start_round, max_round, "%")
            remain_flow_bucket = flow_bucket_list[index]
            print "[debug] Calendar Queue: Step 9. flow_remain_bucket = {} of  start_round = {}"\
                .format(remain_flow_bucket, start_round)

            # step10. set the packet's rank with the start_time of the round,
            rank = self.action_logic_unit(start_round, self.calendar_queue_duration, "*")
            print "[debug] Calendar Queue: Step 10. rank = {}".format(rank)

        # step11. drop packet if the round is too far away from current.
        further_round = self.action_logic_unit(start_round, current_dequeue_round, "-")
        is_too_far = self.action_logic_unit(further_round, max_round, ">")
        print "[debug] Calendar Queue: Step 11. is too far?, due to start_round= {}, current_round={}" \
            .format(start_round, current_dequeue_round)
        if is_too_far:
            #Drop Packet,
            print "[debug] Calendar Queue: Step 11. Drop the Packet, due to start_round= {}, current_round={}" \
                .format(start_round, current_dequeue_round)
            return "-1"  # indicates drop.
        else:
            # step12. update flow_remain_bucket.
            remain_flow_bucket = self.action_logic_unit(remain_flow_bucket, pkt.get_length(), "-")
            self.flow_remain_bucket_table[flow_id][index] = remain_flow_bucket
            self.flow_last_dequeue_round_table[flow_id] = start_round
            print "[debug] Calendar Queue: Step 12. Update remain_flow_bucket= {}, target_round={}, table_index={}" \
                .format(remain_flow_bucket, start_round, index)
            # step13. return packet rank.

            print "[debug] Calendar Queue: Step 13. return rank={}".format(rank)

            return rank
    def update_global_counter(self, rank):
        """
        update global counter,
        the global counter is same as the last dequeued packet's rank
        :param rank: last dequeued packet's rank
        :return: none
        """
        # self.gc = rank / 10


    def after_dequeue_process(self, packet, packet_meta):
        """
        Process after dequeue.
        Update each flow's remain_bucket, when a round is finished
        we can infer the round change information by comparing
        last dequeued packet's rank and current packet's rank.
        if different, it means, the previous round is finished.

        :param packet:
        :param packet_meta:
        :return:
        """

        rank = packet_meta.get_value("rank")
        is_new_round = self.action_logic_unit(rank, self.last_dequeue_rank, "==")

        print "[debug] Calendar Queue: after_dequeue_process() check if is new round rank = {}, last_rank = {}, result = {}"\
        .format(rank, self.last_dequeue_rank, is_new_round)
        if not is_new_round:
            # update previous buckets
            max_round = self.action_logic_unit(self.queue_size, self.calendar_max_round, "*")
            index = self.action_logic_unit(self.last_dequeue_rank, max_round, "%")


            #TODO: Need better algorithm?

            self.flow_remain_bucket_table[1][index] = self.weight_table[1]
            self.flow_remain_bucket_table[2][index] = self.weight_table[2]
            self.flow_remain_bucket_table[3][index] = self.weight_table[3]
            self.flow_remain_bucket_table[4][index] = self.weight_table[4]
            print "[debug] Calendar Queue: after_dequeue_process() Update all flow buckets={} {} {} {} at index {}"\
                .format(self.flow_remain_bucket_table[1][index],
                        self.flow_remain_bucket_table[2][index],
                        self.flow_remain_bucket_table[3][index],
                        self.flow_remain_bucket_table[4][index],
                        index)
            print self.flow_remain_bucket_table

            self.last_dequeue_rank = rank

class LeakyBucket(PifoInterface):
    """
    Class for LeakyBucket Implementation.
    """
    def __init__(self):
        super(LeakyBucket, self).__init__()
        print "init Weighted Round Robin Class"
        # self.local_counter = {}
        # self.flow = 0
        # self.gc = 0  # global counter

        self.flow_table = {
            "A": 1,
            "B": 2,
            "C": 3,
            "D": 4
        }

        self.weight_table = {
            1: 16,
            2: 32,
            3: 8,
            4: 8
        }

        self.flow_last_dequeue_table = {
            1: 0,
            2: 0,
            3: 0,
            4: 0,
        }


    def rank_calc(self, pkt, pkt_meta):

        # get flow id
        flow_id = self.table_lookup(key = pkt.get_key(), table = self.flow_table, default_result = 9)

        # get local counter
        # if not exist, then init with the key.

        if flow_id not in self.local_counter_list:
            self.local_counter_list[flow_id] = 0

        self.lc = self.local_counter_list[flow_id]

        # update local counter,
        # lc(flow) = max(lc(flow),gc) + 1
        self.lc = self.action_logic_unit(self.lc, pkt.get_receive_time(), "max")

        # get flow weight
        rate = self.table_lookup(key = flow_id, table = self.weight_table, default_result = 1)

        rank = self.action_logic_unit(pkt.get_length(), rate, "/+")

        self.lc = self.action_logic_unit(self.lc, rank, "+")

        self.local_counter_list[flow_id] = self.lc

        return rank


    def update_global_counter(self, rank):
        """
        update global counter,
        the global counter is same as the last dequeued packet's rank
        :param rank: last dequeued packet's rank
        :return: none
        """
        pass

    def after_dequeue_process(self, packet, packet_meta):
        pass
