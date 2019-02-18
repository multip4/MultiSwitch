class PifoInterface(object):
    """
    Interface Class for PIFO Machine Model
    """

    def __init__(self):
        print "init PIFO Interface"
        self.local_counter = {}
        self.flow = 0
        self.lc = 0
        self.gc = 0  # global counter

    def get_flow_by_key(self, pkt):
        """
        get flow information by key value,
        the key value is provided by packet itself or packet metadata.
        :return: flow id
        """
        pass

    def get_flow_by_hash(self):
        """
        get flow information by hash,
        :return: flow_id
        """
        pass

    def flow_queue_mapping(self):
        """
        map flow id and queue
        :return:
        """
        pass

    def rank_calc(self, pkt, pkt_meta):
        """
        calculate packet rank.
        :return:
        """
        pass

    def enqueue(self):
        """
        enqueue process
        :return:
        """
        pass

    def dequeue(self):
        """
        dequeue process
        :return:
        """
        pass