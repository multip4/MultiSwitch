class Packet:
    """
    Class for Packet.
    Parameters:
        Key: key for flow(or class) classification
        Index: index for the flow
        Message: payload for the packet
    """
    def __init__(self):
        print "init packet"

    def __init__(self, key, index, message="default message"):
        self.key = key
        self.index = index
        self.message = message

    def print_packet(self):
        print "Print Packet: [Key]: {} | [Index]: {} | [Message]: {}".format(self.key, self.index, self.message)

    def get_key(self):
        return self.key

    def get_index(self):
        return self.index

    def get_payload(self):
        return self.message



class PacketMetadata:
    """
    Class for Packet Metadata
    :param self.meta: a dictionary for packet metadata
    """

    def __init__(self):
        print "init packet metadata"

    def __init__(self, meta_dict):
        self.meta = meta_dict

    def add_meta(self, key, value):
        self.meta[key] = value

    def delete_meta(self, key):
        self.meta.pop(key, None)
