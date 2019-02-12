from rank_calc_algorithms.PIFO_Interface import PifoInterface
from rank_calc_algorithms.Packet import Packet
from rank_calc_algorithms.PIFO_Queue import PIFO_Queue


class RoundRobin(PifoInterface):

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
        flow = self.get_flow_by_key(pkt)

        # get local counter
        # if not exist, then init with the key.

        if flow not in self.local_counter:
            self.local_counter[flow] = 0

        self.lc = self.local_counter[flow]

        # update local counter,
        # lc(flow) = max(lc(flow),gc) + 1

        self.lc = max(self.lc, self.gc) + 1

        # update local counter
        self.local_counter[flow] = self.lc

        rank = self.lc
        return rank


    def update_global_counter(self, rank):
        """
        update global counter,
        the global counter is same as the last dequeued packet's rank
        :param rank: last dequeued packet's rank
        :return: none
        """
        self.gc = rank

