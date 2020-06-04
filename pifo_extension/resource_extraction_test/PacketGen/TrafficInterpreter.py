"""
Traffic Interpreter convert Json format input file to Packet List.

InputFile is JSON.

{
 {
  flow: A,
  count: 5,
  receive_time: [0.1,0.2,0.3,0.4,0.5]
 }
 {
  flow: B,
  count: 3,
  receive_time: [0.1,0.2,0.3]
 }
 {
  flow: C,
  count: 3,
  receive_time: [0.1,1.2,2.3]
 }
}

"""
from Packet import Packet
import json


class TrafficInterpreter:
    def __init__(self):
        print "init Traffic Interpreter"

    def JSON_to_List(self, json_name):
        """
        Read JSON file to make list.
        :param json_name:
        :return: A list contains files that in sorted.
        """
        #read json
        with open(json_name) as f:
            data = json.load(f)

        # read json message and init packet
        # add each packet object to packet_list.

        packet_list = []
        for flow in data:
            # Exception Validation: Compare count and length of time
            if flow["count"] != len(flow["receive_time"]):
                print "[Error] TrafficInterpreter.JSON_to_List, Length and Count Mis-match"
                print flow
                exit()

            # generate Packet object by json message.

            for i in range(0, flow["count"]):
                packet = Packet(key=flow["flow"],
                                index=i,
                                length=flow["length"][i],
                                receive_time=flow["receive_time"][i])
                packet_list.append(packet)


        print "[Debug] TrafficInterpreter.JSON_to_List, Print Packet List"

        for packet in packet_list:
            print packet.to_string()

        #sort list element by receive_time
        packet_list.sort(key = lambda x: x.receive_time)

        print "[Debug] TrafficInterpreter.JSON_to_List, Print Packet List After Sorting"

        for packet in packet_list:
            print packet.to_string()

        # return packet list
        return packet_list


if __name__ == '__main__':

    ti = TrafficInterpreter()
    ti.JSON_to_List("a.json")

    print "test code"

