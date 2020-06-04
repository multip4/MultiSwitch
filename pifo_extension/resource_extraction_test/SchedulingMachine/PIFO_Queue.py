class PIFO_Queue:
    """
    Class for PIFO Queue

    push-in with rank order,
    enqueue element is (rank, Packet)
    """

    def __init__(self):
        self.queue = []

    def get_size(self):
        """
        get current queue size.
        :return: length value of queue
        """
        return len(self.queue)

    def print_queue_rank_list(self):
        """
        print queue element's rank information.
        :return: None
        """
        result = []
        for val in self.queue:
            result.append(str(val[0]).ljust(4))

        print "[debug] PIFO_Queue: print_queue_rank_list ".ljust(80) + str(result)

    def print_queue_flow_list(self):
        """
        print queue element's flow information
        :return: None
        """
        result = []
        for val in self.queue:
            result.append(str(val[1].get_key()).ljust(4))
        print "[debug] PIFO_Queue: print_queue_flow_list ".ljust(80) + str(result)

    def print_queue_index_list(self):
        """
        print queue element's sequence(index) information
        :return:
        """
        result = []
        for val in self.queue:
            result.append(str(val[1].get_index()).ljust(4))
        print "[debug] PIFO_Queue: print_queue_index_list ".ljust(80) + str(result)

    def print_queue(self):
        """
        print queue element's rank and packet information
        :return:
        """
        for val in self.queue:
            print "[debug] PIFO_Queue:Print Queue. Rank:" + str(val[0]) + "  " + val[1].to_string()

    def push_in(self, rank, pkt):
        """
        push_in function. push the element(<rank, packet>) into the queue, in order.
        :param rank: rank value
        :param pkt: packet object
        :return: None
        """

        # insert the packet to position i,
        # where rank[i-1] <= rank < rank[i]
        for index, val in enumerate(self.queue):
            if(rank < val[0]):
                self.queue.insert(index, (rank, pkt))
                print "[debug] PIFO_Queue: push_in. insert packet({} rank {}) into position {}".format(pkt.get_name(), rank, index).ljust(80) \
                      + val[1].to_string()
                return

        # if the packet is not inserted. then push to the end
        self.queue.append((rank, pkt))

        print "[debug] PIFO_Queue: push_in. insert packet({} rank {}) into last position".format(pkt.get_name(), rank).ljust(80) \
              + pkt.to_string()


    def pop(self):
        """
        pop first element from the queue.
        :return:
        """
        val = self.queue.pop(0) # val = (rank, packet)
        print "[debug] PIFO_Queue: pop. pop packet: rank({})".format(val[0]).ljust(80) + val[1].to_string()
        return val

    def top(self):
        """
        pop first element from the queue.
        :return:
        """
        val = self.queue[0] # val = (rank, packet)
        return val






