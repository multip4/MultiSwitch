class Packet:
    """
    Class for Packet.
    Parameters:
        Key: key for flow(or class) classification
        Index: index for the flow
        Message: payload for the packet
        length: length of packet
        receive_time: receive time.

    """
    def __init__(self):
        print "init packet"

    def __init__(self, key, index, message="default message"):
        self.key = key
        self.index = index
        self.message = message

    def __init__(self, key, index, length, receive_time, message = "default message"):
        self.key = key
        self.index = index
        self.length = length
        self.receive_time = receive_time
        self.message = message

    def print_packet(self):
        print "Print Packet: [Key]: {} | [Index]: {} | [Message]: {}".format(self.key, self.index, self.message)

    def to_string(self):
        return "Packet: [Key]: {} | [Index]: {} | [Length]: {} | [Receive_time]:{} | [Message]: {}"\
            .format(self.key, self.index, self.length, self.receive_time, self.message)

    """
    Get Functions:
    """

    def get_key(self):
        return self.key

    def get_index(self):
        return self.index

    def get_payload(self):
        return self.message

    def get_length(self):
        return self.length

    def get_receive_time(self):
        return self.receive_time

    def get_name(self):
        return self.get_key() + str(self.get_index())



class PacketMetadata:
    """
    Class for Packet Metadata
    :param self.meta: a dictionary for packet metadata
    """

    def __init__(self):
        print "init packet metadata"
        self.meta = {}

    def add_meta(self, key, value):
        self.meta[key] = value

    def delete_meta(self, key):
        self.meta.pop(key, None)

    def get_value(self, key):
        return self.meta[key]
