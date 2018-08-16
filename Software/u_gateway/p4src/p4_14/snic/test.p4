

header_type my_nsh_t {
    fields {
        ver : 2;
        oam : 1;
        context : 1;
        length : 6;
        MDtype : 8;
        NextProto: 16;
        spid : 24;
        sidx : 8;
    }
}
