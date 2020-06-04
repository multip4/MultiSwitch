class PifoInterface(object):
    """
    Interface Class for PIFO Machine Model
    """

    def __init__(self):
        print "init PIFO Interface"
        self.local_counter_list = {}
        self.flow = 0
        self.lc = 0
        self.gc = 0  # global counter

    def table_lookup(self, key, table, default_result):
        """
        table lookup function.
        :param key: key value
        :param table: table dictionary
        :param default_result: return value if no key matched.
        :return:
        """
        return table.get(key, default_result)

    def action_logic_unit(self, param1, param2, operand):
        alu_dict = {
            "+": self.action_add,
            "-": self.action_sub,
            "*": self.action_mul,
            "/": self.action_div,
            "%": self.action_mod,
            "<": self.action_compare_s,    # small
            ">": self.action_compare_l,    # large
            "==": self.action_compare_e,   # equal
            "<=": self.action_compare_se,  # small equal
            ">=": self.action_compare_le,  # large equal
            "max": self.action_max,
            "min": self.action_min,
            "/+": self.action_div_plus

            # for new operation logics, append below.

        }
        # Get the function from switcher dictionary
        func = alu_dict.get(operand, "no-op")
        # Execute the function

        if(func == "no-op"):
            print "[Error] PIFO_Interface: No Operand in ALU: [{}]".format(operand)
        else:
            return func(param1, param2)

    def action_compare_s(self, param1, param2):
        return param1 < param2

    def action_compare_se(self, param1, param2):
        return param1 <= param2

    def action_compare_l(self, param1, param2):
        return param1 > param2

    def action_compare_le(self, param1, param2):
        return param1 >= param2

    def action_compare_e(self, param1, param2):
        return param1 == param2

    def action_add(self, param1, param2):
        return param1 + param2

    def action_sub(self, param1, param2):
        return param1 - param2

    def action_mul(self, param1, param2):
        return param1 * param2

    def action_div(self, param1, param2):
        return param1 / param2

    def action_mod(self, param1, param2):
        return param1 % param2

    def action_max(self, param1, param2):
        return max(param1, param2)

    def action_min(self, param1, param2):
        return min(param1, param2)

    def action_div_plus(self, param1, param2):
        """
        division plus version, if modular operation has value then add 1 to divide result.
        for example: action_div_plus(5, 2) => 3, because 5%2 = 1 where > 0. hence, 5/2 + 1 = 2 + 1 = 3

        TODO: if there are better term for this operation, will rename it later.
        """
        if param1 % param2 > 0:
            return param1 / param2 + 1
        else:
            return param1 / param2

    def action_no_op(self, param1, param2):
        print "[Error] PIFO_Interface: No Operation in ALU"

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
