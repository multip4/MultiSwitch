class PIFO_Queue:
    """
    Class for PIFO Queue

    push-in with rank order,
    enqueue element is (rank, Packet)
    """

    def __init__(self):
        self.queue = []

    def get_size(self):
        return len(self.queue)

    def print_queue_rank_list(self):
        result = []
        for val in self.queue:
            result.append(str(val[0]).ljust(4))

        print "[debug][pifo_queue: print_queue_rank_list] ".ljust(80) + str(result)

    def print_queue_flow_list(self):
        result = []
        for val in self.queue:
            result.append(str(val[1].get_key()).ljust(4))
        print "[debug][pifo_queue: print_queue_flow_list] ".ljust(80) + str(result)

    def print_queue_index_list(self):
        result = []
        for val in self.queue:
            result.append(str(val[1].get_index()).ljust(4))
        print "[debug][pifo_queue: print_queue_index_list] ".ljust(80) + str(result)

    def print_queue(self):
        for val in self.queue:
            print "Rank" + str(val[0]) + val[1].to_string()

    def push_in(self, rank, pkt):

        # insert the packet to position i,
        # where rank[i-1] <= rank < rank[i]
        for index, val in enumerate(self.queue):
            if(rank < val[0]):
                self.queue.insert(index, (rank, pkt))
                print "[debug][pifo_queue: push_in] insert packet(rank {}) into position {}".format(rank, index).ljust(80) \
                      + val[1].to_string()
                return

        # if the packet is not inserted. then push to the end
        self.queue.append((rank, pkt))
        print "[debug][pifo_queue: push_in] insert packet(rank {}) into last position {}".format(rank, len(self.queue)-1).ljust(80) \
              + pkt.to_string()


    def pop(self):
        val = self.queue.pop(0) # val = (rank, packet)
        print "[debug][pifo_queue: pop] pop packet: rank({})".format(val[0]).ljust(80) + val[1].to_string()
        return val







