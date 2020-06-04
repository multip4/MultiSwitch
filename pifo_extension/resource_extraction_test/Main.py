import random

from SchedulingMachine.PIFO_Queue import PIFO_Queue
from rank_calc_algorithms.Scheduling import RoundRobin

from PacketGen.Packet import Packet


def packet_gen(flow_range, total_packet):
    result = []
    #reset parameters
    flow_index = {}

    for i in range(0, flow_range):
        flow_index[i] = 0

    for i in range(0, total_packet):
        flow_id = random.randint(0, flow_range - 1)
        print flow_id
        pkt = Packet(flow_id, flow_index[flow_id], message="payload")
        flow_index[flow_id] += 1
        result.append(pkt)

    return result


if __name__ == '__main__':

    queue = PIFO_Queue()
    scheduling = RoundRobin()
    packet_list = packet_gen(4, 200)

    # scheduling.update_global_counter(10)

    for pkt in packet_list:
        rank = scheduling.rank_calc(pkt, None)
        queue.push_in(rank, pkt)

    queue.print_queue_flow_list()
    queue.print_queue_index_list()
    queue.print_queue_rank_list()

    print "Start to Dequeue ================== "

    while (queue.get_size() > 0):
        queue.pop()








