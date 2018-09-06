# Programmable Data Plane Virtualization (PDP Virtualization)
One of the possible solutions to support multiple P4 programs to be ran on a single physical switch is PDP virtualization.
Inspired by prior works to PDP virtualization([Hyper4](https://dl.acm.org/citation.cfm?id=2999607) and [HyperV](https://ieeexplore.ieee.org/stamp/stamp.jsp?arnumber=8038396) ), we make a step further to provide practical data plane virtualization solution by designing and developing an optimized high-performance data plane hypervisor program.

## On-going Work
- **Idea # 1** : we propose a description header which consists of information about the number of header stacks and header length to support efficient packet processing model in hypervisor pipeline. As an initial trial of developing data plane hypervisor, we provide P4 programmable parser which extract packet headers by refferring to description header information and we also provide abstracted hypervisor pipeline model.

- **Idea # 2** : What type of hypervisor design  (e.g., number of stages, stage components, etc.) provides the appropriate abstraction for emulating different P4 programs?

## Test code 
- For now, we implement simple_hpv_l2.p4 and metatest.p4 based on P4-16 specification with BMV2 v1model target to demonstrate the idea # 1.

## Test Environment
- We emulate L2 switch function as flow table entries on both simple_hpv_l2.p4 and metatest.p4 (see command directory).


This repository is a playground for developing data plane hypervisor, a P4 program capable of emulating other P4 programs.

## Authors
- Seokwon Jang (imsoboy2@korea.ac.kr)
- Sol Han (hs1087@korea.ac.kr)
- Hongrok Choi (ghdfhrooo@korea.ac.kr)
- Hochan Lee (ghcks1000@korea.ac.kr)
- Sangheon Pack (shpack@korea.ac.kr)

