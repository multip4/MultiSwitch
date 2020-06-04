"""
This file contains enqueue/dequeue agents,
both are individual thread process.

The Role of EnqueueAgent is
 - flow classification
 - packet prioritization
 - enqueue packet to the target queue

The Role of DequeueAgent is
 - Next queue selection
 - dequeue packet from the qeueue
 - transmit the packet(in this simulator, just sleep T time, where T = port_throughput / packet_length.
"""

import threading
import time
from timeit import default_timer as timer
from PacketGen.TrafficInterpreter import TrafficInterpreter
from SchedulingMachine.PIFO_Queue import PIFO_Queue
from rank_calc_algorithms.Scheduling import *
from PacketGen.Packet import PacketMetadata

"""
Single Queue Enqueue Agent
"""
class EnqueueAgent(threading.Thread):
    def __init__(self, packet_in_list, algorithm, pifo_queue):
        """
        class constructor
        :param packet_in_list: the list of Packet, sorted by parameter:[receive time]
        :param algorithm: Algorithm Object from Scheduling.py.
        :param pifo_queue: PIFO_Queue Object
        """
        threading.Thread.__init__(self)
        self.packet_list = packet_in_list
        self.algorithm = algorithm
        self.pifo_queue = pifo_queue

    def run(self):
        """
        thread function.
        read packet in time and enqueue to the queue.
        :return:
        """
        print "[debug] Enqueue Agent: Start Threading"
        #get start_time
        start_time = timer()

        while(len(self.packet_list) > 0):
            current_time = timer() - start_time

            top_packet = self.packet_list[0]
            if current_time < top_packet.get_receive_time():
                # mean no packet have received.
                continue
            else:

                # try to put packet to the dedicated queue.

                # 1. remove packet from list.
                packet = self.packet_list.pop(0)
                print "[debug] Enqueue Agent: Receive Packet." + packet.to_string()

                # 2. flow classification / queue mapping
                key = self.algorithm.get_flow_by_key(packet)

                # 3. packet prioritization.
                rank = self.algorithm.rank_calc(packet, None)

                if rank == "-1": # means drop rank
                    print "[debug] Enqueue Agent: Drop the Packet."
                else:
                    # 4. put packet to the dedicated queue.
                    self.pifo_queue.push_in(rank, packet)

        print "[debug] Enqueue Agent: Enqueue Agent is Done."

"""
Single Queue Dequeue Agent
"""
class DequeueAgent(threading.Thread):
    def __init__(self, algorithm, pifo_queue, port_throughput, is_work_conserving = True):
        """
        :param algorithm:
        :param pifo_queue:
        :param port_throughput:
        :param is_work_conserving: True for work-conserving, False for non work-conserving
        """
        threading.Thread.__init__(self)
        self.algorithm = algorithm
        self.pifo_queue = pifo_queue
        self.port_throughput = port_throughput
        self.is_work_conserving = is_work_conserving
        self.start_time = timer()

    def run(self):
        """
        Running Function. Dequeue packet from the queue,
        wait T time where T = port_throughput / packet_length.
        :return:
        """
        print "[debug] Dequeue Agent: Start Threading"
        dequeue_list = []


        while(True):
            if(self.pifo_queue.get_size() == 0):
                continue

            current_time = timer() - self.start_time

            rank, packet = self.pifo_queue.top()
            if(not self.is_work_conserving and current_time < rank):
                continue

            rank, packet = self.pifo_queue.pop()
            print "[debug] Dequeue Agent: Pop Packet from the queue. " + packet.to_string()
            dequeue_list.append(packet)

            self.print_dequeue_result(dequeue_list)

            #special function for round robin.
            self.algorithm.update_global_counter(rank)

            packet_meta = PacketMetadata()
            packet_meta.add_meta("rank", rank)

            self.algorithm.after_dequeue_process(packet, packet_meta)

            sleep_time = packet.get_length() / float(self.port_throughput)
            time.sleep(sleep_time)

    def print_dequeue_result(self, dequeue_list):
        """
        print dequeue result.
        :param dequeue_list: a list contains Packet object in sequence
        :return:
        """
        result_str = ""
        for packet in dequeue_list:
            result_str += str(packet.get_key()) + str(packet.get_index()) + ","

        print "[debug] Dequeue Agent: Print Dequeue List: " + result_str


if __name__ == '__main__':

    start_time = timer()

    time.sleep(0.1)

    finish_time = timer()

    print finish_time - start_time

    print "test code"

    queue = PIFO_Queue()
    rr = RoundRobin()
    wrr = WeightedRoundRobin()
    drr = DeficitRoundRobin()
    cq = CalendarQueue()

    # Round Robin Test
    # packet_list = TrafficInterpreter().JSON_to_List("a.json")
    # enqueue_agent = EnqueueAgent(packet_list, rr, queue)
    # enqueue_agent.start()
    #
    # dequeue_agent = DequeueAgent(algorithm = wrr, pifo_queue = queue, port_throughput = 64)
    # dequeue_agent.start()

    # Weighted Round Robin Test
    # packet_list = TrafficInterpreter().JSON_to_List("wrr_data.json")
    # enqueue_agent = EnqueueAgent(packet_in_list = packet_list, algorithm = wrr, pifo_queue = queue)
    # enqueue_agent.start()
    #
    # dequeue_agent = DequeueAgent(algorithm = wrr, pifo_queue = queue, port_throughput = 64)
    # dequeue_agent.start()

    # Deficit Round Robin Test
    # packet_list = TrafficInterpreter().JSON_to_List("a.json")
    # enqueue_agent = EnqueueAgent(packet_in_list = packet_list, algorithm = drr, pifo_queue = queue)
    # enqueue_agent.start()
    #
    # dequeue_agent = DequeueAgent(algorithm = drr, pifo_queue = queue, port_throughput = 64)
    # dequeue_agent.start()

    # Calendar Queue Test
    packet_list = TrafficInterpreter().JSON_to_List("calendar_data.json")
    enqueue_agent = EnqueueAgent(packet_in_list = packet_list, algorithm = cq, pifo_queue = queue)
    enqueue_agent.start()
    dequeue_agent = DequeueAgent(algorithm = cq, pifo_queue = queue, port_throughput = 64, is_work_conserving = False)
    dequeue_agent.start()