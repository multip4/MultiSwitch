from rank_calc_algorithms.PIFO_Interface import PifoInterface


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

        # flow = get_flow(packet)
        flow_id = self.get_flow_by_key(pkt) # return int value

        # get local counter
        # if not exist, then init with the key.

        if flow_id not in self.local_counter:
            self.local_counter[flow_id] = 0

        self.lc = self.local_counter[flow_id]

        # update local counter,
        # lc(flow) = max(lc(flow),gc) + 1

        self.lc = max(self.lc, self.gc) + 1

        # update local counter
        self.local_counter[flow_id] = self.lc

        # the rank value format is minimum 2 digit value => [lc][flow_id]
        # with this format, always dequeue the lowest flow_id'w packet.
        # ex. dequeue sequence => flow 1, flow 2, flow 3.
        rank = self.lc * 10 + flow_id
        return rank

    def update_global_counter(self, rank):
        """
        update global counter,
        the global counter is same as the last dequeued packet's rank
        :param rank: last dequeued packet's rank
        :return: none
        """
        self.gc = rank

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
        # self.lc = 0
        # self.gc = 0  # global counter