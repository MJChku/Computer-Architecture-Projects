.text
lui $a0, 0x1000
 li $t0, 0x12345678
 sw $t0, 0($a0)
 li $t0, 0
li $t1, 0
li $t2, 0
li $t3, 0
li $t4, 0
li $t5, 0
li $t6, 0
li $t7, 10
 Loop:
 sh   $t5 , 0x0($a0) 
 sb   $t4 , 0x60($a0) 
 sw   $t5 , 0x40($a0) 
 sh   $t3 , 0xa0($a0) 
 lb   $t4 , 0x80($a0) 
 lhu   $t6 , 0xe0($a0) 
 sh   $t6 , 0xc0($a0) 
 lbu   $t6 , 0x120($a0) 
 sw   $t0 , 0x100($a0) 
 sw   $t4 , 0x160($a0) 
 sw   $t3 , 0x140($a0) 
 sw   $t2 , 0x1a0($a0) 
 lbu   $t2 , 0x180($a0) 
 sh   $t6 , 0x1e0($a0) 
 lb   $t2 , 0x1c0($a0) 
 sb   $t3 , 0x220($a0) 
 lbu   $t6 , 0x200($a0) 
 sh   $t1 , 0x260($a0) 
 lb   $t0 , 0x240($a0) 
 sb   $t6 , 0x2a0($a0) 
 sh   $t2 , 0x280($a0) 
 lbu   $t1 , 0x2e0($a0) 
 sw   $t6 , 0x2c0($a0) 
 lhu   $t0 , 0x320($a0) 
 sh   $t6 , 0x300($a0) 
 sh   $t6 , 0x360($a0) 
 sw   $t5 , 0x340($a0) 
 lhu   $t1 , 0x3a0($a0) 
 sh   $t1 , 0x380($a0) 
 sb   $t3 , 0x3e0($a0) 
 sw   $t1 , 0x3c0($a0) 
 sh   $t3 , 0x420($a0) 
 lb   $t1 , 0x400($a0) 
 lh   $t3 , 0x460($a0) 
 lhu   $t2 , 0x440($a0) 
 lbu   $t6 , 0x4a0($a0) 
 lw   $t3 , 0x480($a0) 
 sh   $t5 , 0x4e0($a0) 
 lh   $t4 , 0x4c0($a0) 
 lw   $t0 , 0x520($a0) 
 lhu   $t2 , 0x500($a0) 
 sb   $t4 , 0x560($a0) 
 sw   $t3 , 0x540($a0) 
 sh   $t1 , 0x5a0($a0) 
 sh   $t6 , 0x580($a0) 
 lb   $t1 , 0x5e0($a0) 
 lw   $t0 , 0x5c0($a0) 
 sw   $t0 , 0x620($a0) 
 lw   $t3 , 0x600($a0) 
 lhu   $t6 , 0x660($a0) 
 lhu   $t2 , 0x640($a0) 
 lbu   $t6 , 0x6a0($a0) 
 sb   $t4 , 0x680($a0) 
 lhu   $t6 , 0x6e0($a0) 
 lb   $t1 , 0x6c0($a0) 
 sw   $t6 , 0x720($a0) 
 sh   $t4 , 0x700($a0) 
 sh   $t3 , 0x760($a0) 
 sw   $t0 , 0x740($a0) 
 lhu   $t0 , 0x7a0($a0) 
 sb   $t1 , 0x780($a0) 
 sb   $t1 , 0x7e0($a0) 
 lhu   $t5 , 0x7c0($a0) 
 sw   $t0 , 0x820($a0) 
 sh   $t5 , 0x800($a0) 
 lb   $t2 , 0x860($a0) 
 lw   $t1 , 0x840($a0) 
 lw   $t3 , 0x8a0($a0) 
 sw   $t2 , 0x880($a0) 
 sb   $t2 , 0x8e0($a0) 
 lhu   $t0 , 0x8c0($a0) 
 lhu   $t1 , 0x920($a0) 
 lw   $t4 , 0x900($a0) 
 sb   $t3 , 0x960($a0) 
 lbu   $t3 , 0x940($a0) 
 lw   $t4 , 0x9a0($a0) 
 sb   $t2 , 0x980($a0) 
 lb   $t3 , 0x9e0($a0) 
 lb   $t0 , 0x9c0($a0) 
 sb   $t0 , 0xa20($a0) 
 lb   $t4 , 0xa00($a0) 
 sh   $t1 , 0xa60($a0) 
 sb   $t3 , 0xa40($a0) 
 lbu   $t4 , 0xaa0($a0) 
 sw   $t6 , 0xa80($a0) 
 lw   $t5 , 0xae0($a0) 
 lhu   $t6 , 0xac0($a0) 
 lh   $t6 , 0xb20($a0) 
 lw   $t4 , 0xb00($a0) 
 lb   $t3 , 0xb60($a0) 
 lb   $t5 , 0xb40($a0) 
 lb   $t5 , 0xba0($a0) 
 sb   $t6 , 0xb80($a0) 
 sb   $t0 , 0xbe0($a0) 
 lw   $t4 , 0xbc0($a0) 
 sw   $t0 , 0xc20($a0) 
 lbu   $t1 , 0xc00($a0) 
 sh   $t0 , 0xc60($a0) 
 lbu   $t5 , 0xc40($a0) 
 sb   $t0 , 0xca0($a0) 
 sb   $t4 , 0xc80($a0) 
 lw   $t2 , 0xce0($a0) 
 sw   $t0 , 0xcc0($a0) 
 sb   $t4 , 0xd20($a0) 
 sh   $t6 , 0xd00($a0) 
 lb   $t4 , 0xd60($a0) 
 sh   $t4 , 0xd40($a0) 
 lhu   $t2 , 0xda0($a0) 
 lhu   $t4 , 0xd80($a0) 
 lb   $t2 , 0xde0($a0) 
 lhu   $t6 , 0xdc0($a0) 
 sw   $t1 , 0xe20($a0) 
 sw   $t0 , 0xe00($a0) 
 lh   $t4 , 0xe60($a0) 
 lbu   $t1 , 0xe40($a0) 
 lh   $t6 , 0xea0($a0) 
 lw   $t1 , 0xe80($a0) 
 lb   $t3 , 0xee0($a0) 
 lw   $t5 , 0xec0($a0) 
 lbu   $t5 , 0xf20($a0) 
 sb   $t0 , 0xf00($a0) 
 lbu   $t3 , 0xf60($a0) 
 sw   $t6 , 0xf40($a0) 
 sw   $t6 , 0xfa0($a0) 
 sw   $t2 , 0xf80($a0) 
 lb   $t2 , 0xfe0($a0) 
 sb   $t6 , 0xfc0($a0) 
 lw   $t1 , 0x1020($a0) 
 sb   $t0 , 0x1000($a0) 
 sb   $t1 , 0x1060($a0) 
 sb   $t2 , 0x1040($a0) 
 sb   $t3 , 0x10a0($a0) 
 sb   $t1 , 0x1080($a0) 
 lbu   $t6 , 0x10e0($a0) 
 sh   $t2 , 0x10c0($a0) 
 sb   $t3 , 0x1120($a0) 
 sb   $t1 , 0x1100($a0) 
 sb   $t4 , 0x1160($a0) 
 sh   $t1 , 0x1140($a0) 
 lb   $t0 , 0x11a0($a0) 
 lw   $t4 , 0x1180($a0) 
 lbu   $t5 , 0x11e0($a0) 
 lbu   $t6 , 0x11c0($a0) 
 lhu   $t4 , 0x1220($a0) 
 lh   $t6 , 0x1200($a0) 
 lh   $t3 , 0x1260($a0) 
 lw   $t4 , 0x1240($a0) 
 sw   $t3 , 0x12a0($a0) 
 lb   $t6 , 0x1280($a0) 
 lh   $t0 , 0x12e0($a0) 
 sw   $t1 , 0x12c0($a0) 
 lw   $t5 , 0x1320($a0) 
 lb   $t5 , 0x1300($a0) 
 sb   $t1 , 0x1360($a0) 
 lhu   $t4 , 0x1340($a0) 
 lw   $t0 , 0x13a0($a0) 
 sb   $t2 , 0x1380($a0) 
 lb   $t3 , 0x13e0($a0) 
 lhu   $t6 , 0x13c0($a0) 
 sw   $t5 , 0x1420($a0) 
 lbu   $t0 , 0x1400($a0) 
 sb   $t1 , 0x1460($a0) 
 lbu   $t3 , 0x1440($a0) 
 sw   $t1 , 0x14a0($a0) 
 sh   $t5 , 0x1480($a0) 
 lbu   $t5 , 0x14e0($a0) 
 sh   $t0 , 0x14c0($a0) 
 lbu   $t0 , 0x1520($a0) 
 lb   $t3 , 0x1500($a0) 
 sh   $t6 , 0x1560($a0) 
 sh   $t0 , 0x1540($a0) 
 sb   $t3 , 0x15a0($a0) 
 sw   $t5 , 0x1580($a0) 
 sb   $t1 , 0x15e0($a0) 
 sb   $t2 , 0x15c0($a0) 
 lhu   $t3 , 0x1620($a0) 
 sb   $t6 , 0x1600($a0) 
 sw   $t1 , 0x1660($a0) 
 lbu   $t4 , 0x1640($a0) 
 sb   $t3 , 0x16a0($a0) 
 lh   $t4 , 0x1680($a0) 
 sw   $t1 , 0x16e0($a0) 
 sh   $t2 , 0x16c0($a0) 
 sb   $t1 , 0x1720($a0) 
 sh   $t2 , 0x1700($a0) 
 sb   $t2 , 0x1760($a0) 
 sw   $t0 , 0x1740($a0) 
 lhu   $t3 , 0x17a0($a0) 
 lh   $t3 , 0x1780($a0) 
 lhu   $t2 , 0x17e0($a0) 
 sb   $t4 , 0x17c0($a0) 
 sb   $t0 , 0x1820($a0) 
 sw   $t4 , 0x1800($a0) 
 lw   $t6 , 0x1860($a0) 
 sw   $t6 , 0x1840($a0) 
 lhu   $t5 , 0x18a0($a0) 
 lhu   $t5 , 0x1880($a0) 
 sb   $t2 , 0x18e0($a0) 
 sw   $t5 , 0x18c0($a0) 
 sh   $t1 , 0x1920($a0) 
 sw   $t3 , 0x1900($a0) 
 lh   $t0 , 0x1960($a0) 
 sb   $t1 , 0x1940($a0) 
 lbu   $t5 , 0x19a0($a0) 
 sh   $t6 , 0x1980($a0) 
 sw   $t3 , 0x19e0($a0) 
 sh   $t3 , 0x19c0($a0) 
 sw   $t3 , 0x1a20($a0) 
 lb   $t6 , 0x1a00($a0) 
 lh   $t6 , 0x1a60($a0) 
 lw   $t4 , 0x1a40($a0) 
 lbu   $t4 , 0x1aa0($a0) 
 lb   $t5 , 0x1a80($a0) 
 sb   $t2 , 0x1ae0($a0) 
 lh   $t4 , 0x1ac0($a0) 
 lbu   $t3 , 0x1b20($a0) 
 lhu   $t4 , 0x1b00($a0) 
 lhu   $t2 , 0x1b60($a0) 
 sh   $t5 , 0x1b40($a0) 
 sh   $t4 , 0x1ba0($a0) 
 lhu   $t0 , 0x1b80($a0) 
 sb   $t3 , 0x1be0($a0) 
 lh   $t1 , 0x1bc0($a0) 
 sb   $t2 , 0x1c20($a0) 
 sb   $t4 , 0x1c00($a0) 
 sw   $t4 , 0x1c60($a0) 
 lbu   $t3 , 0x1c40($a0) 
 lh   $t2 , 0x1ca0($a0) 
 sw   $t4 , 0x1c80($a0) 
 lhu   $t1 , 0x1ce0($a0) 
 lbu   $t6 , 0x1cc0($a0) 
 lb   $t1 , 0x1d20($a0) 
 sw   $t2 , 0x1d00($a0) 
 lbu   $t2 , 0x1d60($a0) 
 lw   $t1 , 0x1d40($a0) 
 lh   $t3 , 0x1da0($a0) 
 sb   $t6 , 0x1d80($a0) 
 sb   $t3 , 0x1de0($a0) 
 lhu   $t5 , 0x1dc0($a0) 
 sh   $t0 , 0x1e20($a0) 
 lw   $t4 , 0x1e00($a0) 
 lb   $t1 , 0x1e60($a0) 
 sb   $t0 , 0x1e40($a0) 
 lh   $t6 , 0x1ea0($a0) 
 sw   $t6 , 0x1e80($a0) 
 sh   $t6 , 0x1ee0($a0) 
 lbu   $t5 , 0x1ec0($a0) 
 sb   $t3 , 0x1f20($a0) 
 sb   $t4 , 0x1f00($a0) 
 lw   $t1 , 0x1f60($a0) 
 sw   $t0 , 0x1f40($a0) 
 sh   $t4 , 0x1fa0($a0) 
 sb   $t2 , 0x1f80($a0) 
 lw   $t0 , 0x1fe0($a0) 
 lhu   $t1 , 0x1fc0($a0) 
 sb   $t6 , 0x2020($a0) 
 sw   $t2 , 0x2000($a0) 
 sh   $t3 , 0x2060($a0) 
 sw   $t1 , 0x2040($a0) 
 sh   $t4 , 0x20a0($a0) 
 sw   $t2 , 0x2080($a0) 
 sw   $t3 , 0x20e0($a0) 
 sh   $t5 , 0x20c0($a0) 
 sw   $t5 , 0x2120($a0) 
 sb   $t5 , 0x2100($a0) 
 lhu   $t4 , 0x2160($a0) 
 sb   $t6 , 0x2140($a0) 
 lhu   $t3 , 0x21a0($a0) 
 lw   $t2 , 0x2180($a0) 
 sh   $t0 , 0x21e0($a0) 
 lb   $t0 , 0x21c0($a0) 
 sw   $t2 , 0x2220($a0) 
 lh   $t6 , 0x2200($a0) 
 lhu   $t4 , 0x2260($a0) 
 lbu   $t1 , 0x2240($a0) 
 lb   $t6 , 0x22a0($a0) 
 lbu   $t2 , 0x2280($a0) 
 sh   $t1 , 0x22e0($a0) 
 lhu   $t6 , 0x22c0($a0) 
 sb   $t5 , 0x2320($a0) 
 lh   $t0 , 0x2300($a0) 
 sw   $t3 , 0x2360($a0) 
 lbu   $t3 , 0x2340($a0) 
 sh   $t3 , 0x23a0($a0) 
 lb   $t6 , 0x2380($a0) 
 sb   $t0 , 0x23e0($a0) 
 lw   $t1 , 0x23c0($a0) 
 sb   $t2 , 0x2420($a0) 
 sb   $t3 , 0x2400($a0) 
 lh   $t6 , 0x2460($a0) 
 sh   $t2 , 0x2440($a0) 
 lhu   $t0 , 0x24a0($a0) 
 lb   $t6 , 0x2480($a0) 
 lbu   $t5 , 0x24e0($a0) 
 lw   $t4 , 0x24c0($a0) 
 sh   $t4 , 0x2520($a0) 
 sh   $t6 , 0x2500($a0) 
 lb   $t5 , 0x2560($a0) 
 sb   $t6 , 0x2540($a0) 
 sw   $t2 , 0x25a0($a0) 
 lbu   $t4 , 0x2580($a0) 
 lb   $t6 , 0x25e0($a0) 
 sw   $t6 , 0x25c0($a0) 
 lb   $t6 , 0x2620($a0) 
 lh   $t6 , 0x2600($a0) 
 lw   $t1 , 0x2660($a0) 
 lh   $t3 , 0x2640($a0) 
 lb   $t1 , 0x26a0($a0) 
 lb   $t5 , 0x2680($a0) 
 sb   $t2 , 0x26e0($a0) 
 sw   $t4 , 0x26c0($a0) 
 lw   $t5 , 0x2720($a0) 
 sh   $t6 , 0x2700($a0) 
 sh   $t3 , 0x2760($a0) 
 lb   $t5 , 0x2740($a0) 
 sb   $t1 , 0x27a0($a0) 
 lbu   $t4 , 0x2780($a0) 
 lh   $t6 , 0x27e0($a0) 
 sb   $t3 , 0x27c0($a0) 
 sw   $t2 , 0x2820($a0) 
 lb   $t6 , 0x2800($a0) 
 lhu   $t4 , 0x2860($a0) 
 sh   $t1 , 0x2840($a0) 
 lhu   $t0 , 0x28a0($a0) 
 lhu   $t6 , 0x2880($a0) 
 sh   $t5 , 0x28e0($a0) 
 sw   $t2 , 0x28c0($a0) 
 lw   $t0 , 0x2920($a0) 
 sb   $t0 , 0x2900($a0) 
 sw   $t0 , 0x2960($a0) 
 lh   $t2 , 0x2940($a0) 
 lbu   $t0 , 0x29a0($a0) 
 sh   $t0 , 0x2980($a0) 
 lb   $t6 , 0x29e0($a0) 
 sb   $t0 , 0x29c0($a0) 
 lh   $t4 , 0x2a20($a0) 
 lh   $t4 , 0x2a00($a0) 
 sw   $t6 , 0x2a60($a0) 
 sh   $t0 , 0x2a40($a0) 
 sb   $t5 , 0x2aa0($a0) 
 sh   $t0 , 0x2a80($a0) 
 sb   $t5 , 0x2ae0($a0) 
 lhu   $t4 , 0x2ac0($a0) 
 sb   $t3 , 0x2b20($a0) 
 lbu   $t0 , 0x2b00($a0) 
 lhu   $t3 , 0x2b60($a0) 
 lw   $t2 , 0x2b40($a0) 
 lw   $t6 , 0x2ba0($a0) 
 sh   $t0 , 0x2b80($a0) 
 lhu   $t5 , 0x2be0($a0) 
 sw   $t6 , 0x2bc0($a0) 
 sh   $t2 , 0x2c20($a0) 
 lbu   $t1 , 0x2c00($a0) 
 sw   $t5 , 0x2c60($a0) 
 sh   $t4 , 0x2c40($a0) 
 lw   $t4 , 0x2ca0($a0) 
 lw   $t3 , 0x2c80($a0) 
 sw   $t1 , 0x2ce0($a0) 
 lhu   $t2 , 0x2cc0($a0) 
 sb   $t5 , 0x2d20($a0) 
 sh   $t1 , 0x2d00($a0) 
 sb   $t4 , 0x2d60($a0) 
 lhu   $t5 , 0x2d40($a0) 
 lh   $t5 , 0x2da0($a0) 
 sw   $t5 , 0x2d80($a0) 
 sb   $t0 , 0x2de0($a0) 
 sh   $t4 , 0x2dc0($a0) 
 sb   $t6 , 0x2e20($a0) 
 lw   $t1 , 0x2e00($a0) 
 lw   $t2 , 0x2e60($a0) 
 lb   $t5 , 0x2e40($a0) 
 sw   $t2 , 0x2ea0($a0) 
 sw   $t6 , 0x2e80($a0) 
 lw   $t4 , 0x2ee0($a0) 
 lb   $t1 , 0x2ec0($a0) 
 sw   $t0 , 0x2f20($a0) 
 lb   $t2 , 0x2f00($a0) 
 sb   $t3 , 0x2f60($a0) 
 sb   $t5 , 0x2f40($a0) 
 sh   $t5 , 0x2fa0($a0) 
 sb   $t2 , 0x2f80($a0) 
 lbu   $t1 , 0x2fe0($a0) 
 lw   $t2 , 0x2fc0($a0) 
 sw   $t5 , 0x3020($a0) 
 sw   $t0 , 0x3000($a0) 
 sh   $t5 , 0x3060($a0) 
 sb   $t0 , 0x3040($a0) 
 lh   $t6 , 0x30a0($a0) 
 sb   $t3 , 0x3080($a0) 
 lbu   $t0 , 0x30e0($a0) 
 sb   $t2 , 0x30c0($a0) 
 sh   $t1 , 0x3120($a0) 
 sw   $t5 , 0x3100($a0) 
 lbu   $t4 , 0x3160($a0) 
 sh   $t0 , 0x3140($a0) 
 lbu   $t6 , 0x31a0($a0) 
 lbu   $t5 , 0x3180($a0) 
 sh   $t6 , 0x31e0($a0) 
 lhu   $t0 , 0x31c0($a0) 
 lhu   $t6 , 0x3220($a0) 
 sh   $t3 , 0x3200($a0) 
 sh   $t2 , 0x3260($a0) 
 sh   $t0 , 0x3240($a0) 
 lbu   $t3 , 0x32a0($a0) 
 sw   $t0 , 0x3280($a0) 
 lw   $t3 , 0x32e0($a0) 
 lbu   $t0 , 0x32c0($a0) 
 sb   $t3 , 0x3320($a0) 
 sh   $t2 , 0x3300($a0) 
 lh   $t3 , 0x3360($a0) 
 lbu   $t0 , 0x3340($a0) 
 sb   $t6 , 0x33a0($a0) 
 sh   $t0 , 0x3380($a0) 
 lhu   $t1 , 0x33e0($a0) 
 lb   $t5 , 0x33c0($a0) 
 lh   $t4 , 0x3420($a0) 
 lh   $t6 , 0x3400($a0) 
 lh   $t2 , 0x3460($a0) 
 sb   $t2 , 0x3440($a0) 
 lbu   $t4 , 0x34a0($a0) 
 sw   $t1 , 0x3480($a0) 
 sw   $t2 , 0x34e0($a0) 
 lw   $t1 , 0x34c0($a0) 
 lw   $t5 , 0x3520($a0) 
 lbu   $t4 , 0x3500($a0) 
 sw   $t2 , 0x3560($a0) 
 sh   $t3 , 0x3540($a0) 
 sw   $t6 , 0x35a0($a0) 
 sb   $t3 , 0x3580($a0) 
 lhu   $t2 , 0x35e0($a0) 
 sw   $t1 , 0x35c0($a0) 
 lh   $t6 , 0x3620($a0) 
 sb   $t5 , 0x3600($a0) 
 lh   $t3 , 0x3660($a0) 
 sw   $t5 , 0x3640($a0) 
 sw   $t3 , 0x36a0($a0) 
 sh   $t2 , 0x3680($a0) 
 lb   $t4 , 0x36e0($a0) 
 lh   $t6 , 0x36c0($a0) 
 sw   $t2 , 0x3720($a0) 
 sb   $t0 , 0x3700($a0) 
 sw   $t4 , 0x3760($a0) 
 lw   $t4 , 0x3740($a0) 
 lh   $t2 , 0x37a0($a0) 
 sh   $t1 , 0x3780($a0) 
 lb   $t0 , 0x37e0($a0) 
 sh   $t6 , 0x37c0($a0) 
 sh   $t2 , 0x3820($a0) 
 sh   $t0 , 0x3800($a0) 
 sh   $t3 , 0x3860($a0) 
 sb   $t1 , 0x3840($a0) 
 sh   $t1 , 0x38a0($a0) 
 lw   $t0 , 0x3880($a0) 
 lh   $t1 , 0x38e0($a0) 
 sh   $t1 , 0x38c0($a0) 
 sw   $t3 , 0x3920($a0) 
 sh   $t0 , 0x3900($a0) 
 sh   $t2 , 0x3960($a0) 
 lbu   $t0 , 0x3940($a0) 
 sw   $t2 , 0x39a0($a0) 
 sh   $t5 , 0x3980($a0) 
 sb   $t5 , 0x39e0($a0) 
 sb   $t0 , 0x39c0($a0) 
 lhu   $t3 , 0x3a20($a0) 
 lb   $t1 , 0x3a00($a0) 
 lhu   $t4 , 0x3a60($a0) 
 sh   $t2 , 0x3a40($a0) 
 lhu   $t4 , 0x3aa0($a0) 
 lb   $t2 , 0x3a80($a0) 
 sb   $t3 , 0x3ae0($a0) 
 sb   $t5 , 0x3ac0($a0) 
 lw   $t4 , 0x3b20($a0) 
 lbu   $t6 , 0x3b00($a0) 
 sh   $t3 , 0x3b60($a0) 
 sw   $t3 , 0x3b40($a0) 
 sh   $t4 , 0x3ba0($a0) 
 lw   $t1 , 0x3b80($a0) 
 lw   $t5 , 0x3be0($a0) 
 sw   $t6 , 0x3bc0($a0) 
 sb   $t2 , 0x3c20($a0) 
 lb   $t0 , 0x3c00($a0) 
 lhu   $t0 , 0x3c60($a0) 
 sh   $t0 , 0x3c40($a0) 
 sh   $t2 , 0x3ca0($a0) 
 sw   $t6 , 0x3c80($a0) 
 lb   $t0 , 0x3ce0($a0) 
 lbu   $t6 , 0x3cc0($a0) 
 sw   $t5 , 0x3d20($a0) 
 sw   $t1 , 0x3d00($a0) 
 sb   $t5 , 0x3d60($a0) 
 lhu   $t1 , 0x3d40($a0) 
 sh   $t6 , 0x3da0($a0) 
 sw   $t5 , 0x3d80($a0) 
 sh   $t2 , 0x3de0($a0) 
 sw   $t4 , 0x3dc0($a0) 
 sb   $t5 , 0x3e20($a0) 
 sh   $t4 , 0x3e00($a0) 
 sw   $t0 , 0x3e60($a0) 
 sh   $t4 , 0x3e40($a0) 
 lb   $t3 , 0x3ea0($a0) 
 lb   $t0 , 0x3e80($a0) 
 sh   $t6 , 0x3ee0($a0) 
 sh   $t3 , 0x3ec0($a0) 
 sb   $t3 , 0x3f20($a0) 
 lhu   $t5 , 0x3f00($a0) 
 sw   $t4 , 0x3f60($a0) 
 sh   $t1 , 0x3f40($a0) 
 lw   $t0 , 0x3fa0($a0) 
 lb   $t4 , 0x3f80($a0) 
 sw   $t6 , 0x3fe0($a0) 
 lb   $t3 , 0x3fc0($a0) 
 sw   $t5 , 0x4020($a0) 
 lh   $t2 , 0x4000($a0) 
 lhu   $t5 , 0x4060($a0) 
 lh   $t4 , 0x4040($a0) 
 lw   $t4 , 0x40a0($a0) 
 lw   $t1 , 0x4080($a0) 
 sw   $t3 , 0x40e0($a0) 
 sb   $t6 , 0x40c0($a0) 
 lhu   $t4 , 0x4120($a0) 
 sb   $t5 , 0x4100($a0) 
 lw   $t2 , 0x4160($a0) 
 lbu   $t3 , 0x4140($a0) 
 lbu   $t6 , 0x41a0($a0) 
 lh   $t3 , 0x4180($a0) 
 lbu   $t4 , 0x41e0($a0) 
 sw   $t1 , 0x41c0($a0) 
 sw   $t4 , 0x4220($a0) 
 sw   $t0 , 0x4200($a0) 
 lhu   $t5 , 0x4260($a0) 
 sh   $t6 , 0x4240($a0) 
 lhu   $t3 , 0x42a0($a0) 
 lbu   $t1 , 0x4280($a0) 
 sw   $t0 , 0x42e0($a0) 
 sb   $t0 , 0x42c0($a0) 
 sw   $t6 , 0x4320($a0) 
 sw   $t6 , 0x4300($a0) 
 sw   $t5 , 0x4360($a0) 
 lb   $t0 , 0x4340($a0) 
 lhu   $t4 , 0x43a0($a0) 
 lhu   $t2 , 0x4380($a0) 
 sb   $t5 , 0x43e0($a0) 
 sb   $t1 , 0x43c0($a0) 
 sb   $t5 , 0x4420($a0) 
 lh   $t1 , 0x4400($a0) 
 sw   $t6 , 0x4460($a0) 
 lbu   $t5 , 0x4440($a0) 
 sb   $t5 , 0x44a0($a0) 
 lhu   $t6 , 0x4480($a0) 
 sw   $t1 , 0x44e0($a0) 
 lbu   $t0 , 0x44c0($a0) 
 lh   $t5 , 0x4520($a0) 
 lhu   $t3 , 0x4500($a0) 
 sw   $t2 , 0x4560($a0) 
 sw   $t2 , 0x4540($a0) 
 sb   $t5 , 0x45a0($a0) 
 lb   $t1 , 0x4580($a0) 
 lbu   $t3 , 0x45e0($a0) 
 lhu   $t6 , 0x45c0($a0) 
 lbu   $t6 , 0x4620($a0) 
 sw   $t6 , 0x4600($a0) 
 lh   $t4 , 0x4660($a0) 
 lw   $t2 , 0x4640($a0) 
 sb   $t3 , 0x46a0($a0) 
 sw   $t6 , 0x4680($a0) 
 lw   $t0 , 0x46e0($a0) 
 lhu   $t0 , 0x46c0($a0) 
 sh   $t2 , 0x4720($a0) 
 sw   $t6 , 0x4700($a0) 
 sh   $t6 , 0x4760($a0) 
 lb   $t1 , 0x4740($a0) 
 lh   $t4 , 0x47a0($a0) 
 lh   $t0 , 0x4780($a0) 
 sh   $t0 , 0x47e0($a0) 
 sb   $t3 , 0x47c0($a0) 
 lb   $t5 , 0x4820($a0) 
 sb   $t1 , 0x4800($a0) 
 lw   $t6 , 0x4860($a0) 
 lb   $t2 , 0x4840($a0) 
 lhu   $t6 , 0x48a0($a0) 
 lbu   $t4 , 0x4880($a0) 
 sb   $t0 , 0x48e0($a0) 
 lbu   $t4 , 0x48c0($a0) 
 lb   $t1 , 0x4920($a0) 
 sb   $t3 , 0x4900($a0) 
 sw   $t2 , 0x4960($a0) 
 sb   $t0 , 0x4940($a0) 
 sw   $t4 , 0x49a0($a0) 
 lbu   $t1 , 0x4980($a0) 
 lhu   $t6 , 0x49e0($a0) 
 lh   $t1 , 0x49c0($a0) 
 lhu   $t5 , 0x4a20($a0) 
 lw   $t5 , 0x4a00($a0) 
 lhu   $t3 , 0x4a60($a0) 
 lhu   $t2 , 0x4a40($a0) 
 sw   $t4 , 0x4aa0($a0) 
 lw   $t2 , 0x4a80($a0) 
 lw   $t1 , 0x4ae0($a0) 
 sh   $t2 , 0x4ac0($a0) 
 lw   $t2 , 0x4b20($a0) 
 lhu   $t6 , 0x4b00($a0) 
 lw   $t4 , 0x4b60($a0) 
 sh   $t0 , 0x4b40($a0) 
 sb   $t5 , 0x4ba0($a0) 
 lhu   $t3 , 0x4b80($a0) 
 sb   $t4 , 0x4be0($a0) 
 sh   $t0 , 0x4bc0($a0) 
 lhu   $t4 , 0x4c20($a0) 
 sh   $t1 , 0x4c00($a0) 
 sw   $t4 , 0x4c60($a0) 
 sh   $t3 , 0x4c40($a0) 
 lbu   $t5 , 0x4ca0($a0) 
 lbu   $t0 , 0x4c80($a0) 
 sw   $t0 , 0x4ce0($a0) 
 lbu   $t0 , 0x4cc0($a0) 
 lhu   $t2 , 0x4d20($a0) 
 lbu   $t5 , 0x4d00($a0) 
 lh   $t6 , 0x4d60($a0) 
 sb   $t6 , 0x4d40($a0) 
 lbu   $t6 , 0x4da0($a0) 
 lhu   $t6 , 0x4d80($a0) 
 sw   $t3 , 0x4de0($a0) 
 lhu   $t4 , 0x4dc0($a0) 
 lw   $t1 , 0x4e20($a0) 
 sw   $t5 , 0x4e00($a0) 
 lbu   $t3 , 0x4e60($a0) 
 sb   $t0 , 0x4e40($a0) 
 lb   $t3 , 0x4ea0($a0) 
 sb   $t5 , 0x4e80($a0) 
 lb   $t4 , 0x4ee0($a0) 
 lhu   $t6 , 0x4ec0($a0) 
 sw   $t6 , 0x4f20($a0) 
 sh   $t0 , 0x4f00($a0) 
 lhu   $t0 , 0x4f60($a0) 
 lhu   $t3 , 0x4f40($a0) 
 sb   $t3 , 0x4fa0($a0) 
 sh   $t5 , 0x4f80($a0) 
 lb   $t5 , 0x4fe0($a0) 
 lbu   $t1 , 0x4fc0($a0) 
 sw   $t4 , 0x5020($a0) 
 lbu   $t5 , 0x5000($a0) 
 lbu   $t5 , 0x5060($a0) 
 sw   $t3 , 0x5040($a0) 
 lhu   $t5 , 0x50a0($a0) 
 sh   $t4 , 0x5080($a0) 
 lbu   $t2 , 0x50e0($a0) 
 sh   $t3 , 0x50c0($a0) 
 lbu   $t0 , 0x5120($a0) 
 lhu   $t0 , 0x5100($a0) 
 sb   $t0 , 0x5160($a0) 
 sw   $t2 , 0x5140($a0) 
 sb   $t4 , 0x51a0($a0) 
 lh   $t4 , 0x5180($a0) 
 lbu   $t6 , 0x51e0($a0) 
 sw   $t0 , 0x51c0($a0) 
 sh   $t5 , 0x5220($a0) 
 lw   $t0 , 0x5200($a0) 
 lb   $t5 , 0x5260($a0) 
 lb   $t2 , 0x5240($a0) 
 lhu   $t2 , 0x52a0($a0) 
 sw   $t1 , 0x5280($a0) 
 sb   $t1 , 0x52e0($a0) 
 sw   $t3 , 0x52c0($a0) 
 sh   $t2 , 0x5320($a0) 
 sb   $t0 , 0x5300($a0) 
 sw   $t0 , 0x5360($a0) 
 sw   $t0 , 0x5340($a0) 
 lhu   $t5 , 0x53a0($a0) 
 sb   $t1 , 0x5380($a0) 
 sh   $t6 , 0x53e0($a0) 
 sh   $t5 , 0x53c0($a0) 
 sb   $t4 , 0x5420($a0) 
 lw   $t5 , 0x5400($a0) 
 lhu   $t5 , 0x5460($a0) 
 lb   $t1 , 0x5440($a0) 
 sh   $t4 , 0x54a0($a0) 
 lb   $t6 , 0x5480($a0) 
 sb   $t5 , 0x54e0($a0) 
 lbu   $t5 , 0x54c0($a0) 
 lb   $t3 , 0x5520($a0) 
 lb   $t3 , 0x5500($a0) 
 sh   $t2 , 0x5560($a0) 
 sb   $t6 , 0x5540($a0) 
 lw   $t6 , 0x55a0($a0) 
 lb   $t5 , 0x5580($a0) 
 sh   $t5 , 0x55e0($a0) 
 sb   $t3 , 0x55c0($a0) 
 sw   $t6 , 0x5620($a0) 
 lbu   $t6 , 0x5600($a0) 
 lw   $t2 , 0x5660($a0) 
 lh   $t1 , 0x5640($a0) 
 sh   $t4 , 0x56a0($a0) 
 lbu   $t4 , 0x5680($a0) 
 lbu   $t0 , 0x56e0($a0) 
 lhu   $t6 , 0x56c0($a0) 
 lbu   $t5 , 0x5720($a0) 
 lbu   $t4 , 0x5700($a0) 
 sw   $t3 , 0x5760($a0) 
 sh   $t6 , 0x5740($a0) 
 lh   $t1 , 0x57a0($a0) 
 sw   $t2 , 0x5780($a0) 
 sb   $t2 , 0x57e0($a0) 
 sw   $t4 , 0x57c0($a0) 
 sh   $t0 , 0x5820($a0) 
 sb   $t4 , 0x5800($a0) 
 sw   $t6 , 0x5860($a0) 
 lw   $t2 , 0x5840($a0) 
 sb   $t4 , 0x58a0($a0) 
 sh   $t3 , 0x5880($a0) 
 sw   $t3 , 0x58e0($a0) 
 lhu   $t2 , 0x58c0($a0) 
 sh   $t4 , 0x5920($a0) 
 lh   $t1 , 0x5900($a0) 
 lw   $t3 , 0x5960($a0) 
 sw   $t5 , 0x5940($a0) 
 sb   $t5 , 0x59a0($a0) 
 sw   $t1 , 0x5980($a0) 
 sb   $t0 , 0x59e0($a0) 
 lb   $t0 , 0x59c0($a0) 
 sw   $t5 , 0x5a20($a0) 
 sh   $t1 , 0x5a00($a0) 
 sh   $t0 , 0x5a60($a0) 
 sh   $t4 , 0x5a40($a0) 
 sb   $t5 , 0x5aa0($a0) 
 sb   $t5 , 0x5a80($a0) 
 sb   $t6 , 0x5ae0($a0) 
 lb   $t5 , 0x5ac0($a0) 
 lh   $t0 , 0x5b20($a0) 
 sh   $t3 , 0x5b00($a0) 
 sw   $t3 , 0x5b60($a0) 
 sw   $t1 , 0x5b40($a0) 
 lhu   $t5 , 0x5ba0($a0) 
 sw   $t0 , 0x5b80($a0) 
 lh   $t2 , 0x5be0($a0) 
 lbu   $t1 , 0x5bc0($a0) 
 sh   $t1 , 0x5c20($a0) 
 lw   $t0 , 0x5c00($a0) 
 sh   $t4 , 0x5c60($a0) 
 lb   $t1 , 0x5c40($a0) 
 lw   $t6 , 0x5ca0($a0) 
 lb   $t1 , 0x5c80($a0) 
 lw   $t2 , 0x5ce0($a0) 
 sb   $t6 , 0x5cc0($a0) 
 lhu   $t2 , 0x5d20($a0) 
 sw   $t1 , 0x5d00($a0) 
 lw   $t2 , 0x5d60($a0) 
 sh   $t5 , 0x5d40($a0) 
 sw   $t1 , 0x5da0($a0) 
 lw   $t0 , 0x5d80($a0) 
 lw   $t1 , 0x5de0($a0) 
 sb   $t6 , 0x5dc0($a0) 
 lbu   $t2 , 0x5e20($a0) 
 sw   $t6 , 0x5e00($a0) 
 sb   $t0 , 0x5e60($a0) 
 lw   $t5 , 0x5e40($a0) 
 sb   $t2 , 0x5ea0($a0) 
 sw   $t5 , 0x5e80($a0) 
 sb   $t1 , 0x5ee0($a0) 
 sw   $t5 , 0x5ec0($a0) 
 lhu   $t6 , 0x5f20($a0) 
 sw   $t0 , 0x5f00($a0) 
 sw   $t0 , 0x5f60($a0) 
 sw   $t1 , 0x5f40($a0) 
 sb   $t4 , 0x5fa0($a0) 
 sh   $t3 , 0x5f80($a0) 
 sh   $t6 , 0x5fe0($a0) 
 lbu   $t0 , 0x5fc0($a0) 
 lb   $t0 , 0x6020($a0) 
 sw   $t6 , 0x6000($a0) 
 sw   $t2 , 0x6060($a0) 
 lhu   $t5 , 0x6040($a0) 
 lb   $t1 , 0x60a0($a0) 
 lbu   $t0 , 0x6080($a0) 
 sb   $t2 , 0x60e0($a0) 
 lh   $t3 , 0x60c0($a0) 
 lhu   $t1 , 0x6120($a0) 
 sb   $t1 , 0x6100($a0) 
 lb   $t3 , 0x6160($a0) 
 lw   $t5 , 0x6140($a0) 
 sb   $t2 , 0x61a0($a0) 
 sw   $t3 , 0x6180($a0) 
 sw   $t6 , 0x61e0($a0) 
 lbu   $t0 , 0x61c0($a0) 
 lbu   $t5 , 0x6220($a0) 
 sb   $t0 , 0x6200($a0) 
 sw   $t0 , 0x6260($a0) 
 sw   $t0 , 0x6240($a0) 
 lhu   $t0 , 0x62a0($a0) 
 lw   $t6 , 0x6280($a0) 
 lhu   $t5 , 0x62e0($a0) 
 lw   $t5 , 0x62c0($a0) 
 sw   $t2 , 0x6320($a0) 
 sw   $t2 , 0x6300($a0) 
 lw   $t2 , 0x6360($a0) 
 sw   $t1 , 0x6340($a0) 
 lhu   $t4 , 0x63a0($a0) 
 lbu   $t2 , 0x6380($a0) 
 sb   $t2 , 0x63e0($a0) 
 lhu   $t5 , 0x63c0($a0) 
 sw   $t2 , 0x6420($a0) 
 lbu   $t2 , 0x6400($a0) 
 lhu   $t5 , 0x6460($a0) 
 sw   $t0 , 0x6440($a0) 
 lb   $t6 , 0x64a0($a0) 
 sb   $t6 , 0x6480($a0) 
 sb   $t3 , 0x64e0($a0) 
 sb   $t5 , 0x64c0($a0) 
 lh   $t6 , 0x6520($a0) 
 sh   $t0 , 0x6500($a0) 
 lhu   $t2 , 0x6560($a0) 
 sb   $t5 , 0x6540($a0) 
 lhu   $t5 , 0x65a0($a0) 
 lh   $t4 , 0x6580($a0) 
 sb   $t3 , 0x65e0($a0) 
 sw   $t4 , 0x65c0($a0) 
 lw   $t5 , 0x6620($a0) 
 lhu   $t3 , 0x6600($a0) 
 sh   $t2 , 0x6660($a0) 
 lh   $t6 , 0x6640($a0) 
 lb   $t2 , 0x66a0($a0) 
 sb   $t3 , 0x6680($a0) 
 lb   $t6 , 0x66e0($a0) 
 sh   $t1 , 0x66c0($a0) 
 lh   $t3 , 0x6720($a0) 
 lw   $t1 , 0x6700($a0) 
 sh   $t5 , 0x6760($a0) 
 lhu   $t1 , 0x6740($a0) 
 sh   $t6 , 0x67a0($a0) 
 sw   $t6 , 0x6780($a0) 
 sh   $t5 , 0x67e0($a0) 
 sh   $t5 , 0x67c0($a0) 
 lw   $t4 , 0x6820($a0) 
 sh   $t3 , 0x6800($a0) 
 lb   $t3 , 0x6860($a0) 
 lhu   $t4 , 0x6840($a0) 
 sw   $t3 , 0x68a0($a0) 
 sw   $t6 , 0x6880($a0) 
 sb   $t4 , 0x68e0($a0) 
 sw   $t3 , 0x68c0($a0) 
 sw   $t0 , 0x6920($a0) 
 lbu   $t5 , 0x6900($a0) 
 lw   $t5 , 0x6960($a0) 
 sh   $t0 , 0x6940($a0) 
 sh   $t2 , 0x69a0($a0) 
 sb   $t4 , 0x6980($a0) 
 lh   $t2 , 0x69e0($a0) 
 sb   $t5 , 0x69c0($a0) 
 sw   $t4 , 0x6a20($a0) 
 sb   $t3 , 0x6a00($a0) 
 lb   $t1 , 0x6a60($a0) 
 sh   $t5 , 0x6a40($a0) 
 lh   $t0 , 0x6aa0($a0) 
 sw   $t3 , 0x6a80($a0) 
 sw   $t1 , 0x6ae0($a0) 
 lh   $t1 , 0x6ac0($a0) 
 sh   $t2 , 0x6b20($a0) 
 lh   $t4 , 0x6b00($a0) 
 lh   $t4 , 0x6b60($a0) 
 sb   $t4 , 0x6b40($a0) 
 lb   $t3 , 0x6ba0($a0) 
 sh   $t0 , 0x6b80($a0) 
 lbu   $t6 , 0x6be0($a0) 
 sw   $t6 , 0x6bc0($a0) 
 lhu   $t1 , 0x6c20($a0) 
 sh   $t1 , 0x6c00($a0) 
 sh   $t4 , 0x6c60($a0) 
 lb   $t0 , 0x6c40($a0) 
 lhu   $t2 , 0x6ca0($a0) 
 lh   $t4 , 0x6c80($a0) 
 lb   $t1 , 0x6ce0($a0) 
 sh   $t5 , 0x6cc0($a0) 
 sb   $t4 , 0x6d20($a0) 
 sw   $t4 , 0x6d00($a0) 
 lh   $t1 , 0x6d60($a0) 
 lh   $t6 , 0x6d40($a0) 
 sh   $t3 , 0x6da0($a0) 
 sh   $t0 , 0x6d80($a0) 
 lh   $t1 , 0x6de0($a0) 
 sh   $t3 , 0x6dc0($a0) 
 lh   $t4 , 0x6e20($a0) 
 lb   $t5 , 0x6e00($a0) 
 lbu   $t5 , 0x6e60($a0) 
 lb   $t5 , 0x6e40($a0) 
 lbu   $t6 , 0x6ea0($a0) 
 sh   $t6 , 0x6e80($a0) 
 lhu   $t2 , 0x6ee0($a0) 
 lhu   $t3 , 0x6ec0($a0) 
 sh   $t5 , 0x6f20($a0) 
 lhu   $t3 , 0x6f00($a0) 
 lbu   $t6 , 0x6f60($a0) 
 lw   $t6 , 0x6f40($a0) 
 lw   $t3 , 0x6fa0($a0) 
 lh   $t3 , 0x6f80($a0) 
 sw   $t4 , 0x6fe0($a0) 
 lh   $t0 , 0x6fc0($a0) 
 lb   $t0 , 0x7020($a0) 
 lw   $t3 , 0x7000($a0) 
 sw   $t0 , 0x7060($a0) 
 lh   $t3 , 0x7040($a0) 
 lbu   $t0 , 0x70a0($a0) 
 sb   $t2 , 0x7080($a0) 
 lb   $t3 , 0x70e0($a0) 
 lhu   $t5 , 0x70c0($a0) 
 lbu   $t4 , 0x7120($a0) 
 lbu   $t6 , 0x7100($a0) 
 lh   $t1 , 0x7160($a0) 
 lhu   $t6 , 0x7140($a0) 
 sh   $t6 , 0x71a0($a0) 
 lb   $t2 , 0x7180($a0) 
 lb   $t3 , 0x71e0($a0) 
 lbu   $t5 , 0x71c0($a0) 
 lbu   $t1 , 0x7220($a0) 
 lh   $t2 , 0x7200($a0) 
 sw   $t6 , 0x7260($a0) 
 lb   $t4 , 0x7240($a0) 
 sw   $t0 , 0x72a0($a0) 
 lh   $t6 , 0x7280($a0) 
 sb   $t2 , 0x72e0($a0) 
 sh   $t3 , 0x72c0($a0) 
 lbu   $t1 , 0x7320($a0) 
 lh   $t3 , 0x7300($a0) 
 sh   $t3 , 0x7360($a0) 
 lbu   $t4 , 0x7340($a0) 
 lh   $t6 , 0x73a0($a0) 
 sw   $t4 , 0x7380($a0) 
 lhu   $t4 , 0x73e0($a0) 
 lhu   $t1 , 0x73c0($a0) 
 sh   $t0 , 0x7420($a0) 
 sw   $t6 , 0x7400($a0) 
 lb   $t5 , 0x7460($a0) 
 sh   $t2 , 0x7440($a0) 
 sb   $t2 , 0x74a0($a0) 
 lb   $t0 , 0x7480($a0) 
 lb   $t2 , 0x74e0($a0) 
 lb   $t5 , 0x74c0($a0) 
 sw   $t2 , 0x7520($a0) 
 sw   $t1 , 0x7500($a0) 
 lb   $t3 , 0x7560($a0) 
 lhu   $t0 , 0x7540($a0) 
 sh   $t2 , 0x75a0($a0) 
 sw   $t4 , 0x7580($a0) 
 sb   $t4 , 0x75e0($a0) 
 sh   $t3 , 0x75c0($a0) 
 sw   $t5 , 0x7620($a0) 
 sh   $t1 , 0x7600($a0) 
 sh   $t5 , 0x7660($a0) 
 lhu   $t0 , 0x7640($a0) 
 sb   $t4 , 0x76a0($a0) 
 sh   $t4 , 0x7680($a0) 
 sw   $t1 , 0x76e0($a0) 
 sh   $t0 , 0x76c0($a0) 
 lh   $t6 , 0x7720($a0) 
 lbu   $t0 , 0x7700($a0) 
 lb   $t3 , 0x7760($a0) 
 sw   $t1 , 0x7740($a0) 
 sh   $t4 , 0x77a0($a0) 
 lhu   $t1 , 0x7780($a0) 
 lhu   $t6 , 0x77e0($a0) 
 sw   $t6 , 0x77c0($a0) 
 sh   $t4 , 0x7820($a0) 
 lh   $t4 , 0x7800($a0) 
 sh   $t4 , 0x7860($a0) 
 sb   $t2 , 0x7840($a0) 
 lhu   $t6 , 0x78a0($a0) 
 sw   $t2 , 0x7880($a0) 
 sb   $t3 , 0x78e0($a0) 
 lhu   $t3 , 0x78c0($a0) 
 lw   $t3 , 0x7920($a0) 
 sw   $t4 , 0x7900($a0) 
 lb   $t2 , 0x7960($a0) 
 lbu   $t2 , 0x7940($a0) 
 lw   $t2 , 0x79a0($a0) 
 sw   $t2 , 0x7980($a0) 
 sh   $t1 , 0x79e0($a0) 
 lhu   $t0 , 0x79c0($a0) 
 lhu   $t0 , 0x7a20($a0) 
 lbu   $t5 , 0x7a00($a0) 
 lw   $t0 , 0x7a60($a0) 
 lh   $t1 , 0x7a40($a0) 
 sh   $t4 , 0x7aa0($a0) 
 lbu   $t6 , 0x7a80($a0) 
 sb   $t3 , 0x7ae0($a0) 
 lhu   $t1 , 0x7ac0($a0) 
 sh   $t3 , 0x7b20($a0) 
 lhu   $t1 , 0x7b00($a0) 
 lb   $t5 , 0x7b60($a0) 
 lbu   $t6 , 0x7b40($a0) 
 sw   $t0 , 0x7ba0($a0) 
 sh   $t4 , 0x7b80($a0) 
 lb   $t1 , 0x7be0($a0) 
 sb   $t5 , 0x7bc0($a0) 
 sw   $t0 , 0x7c20($a0) 
 sh   $t2 , 0x7c00($a0) 
 sb   $t2 , 0x7c60($a0) 
 lbu   $t5 , 0x7c40($a0) 
 sh   $t2 , 0x7ca0($a0) 
 sw   $t3 , 0x7c80($a0) 
 lw   $t1 , 0x7ce0($a0) 
 sw   $t1 , 0x7cc0($a0) 
 sb   $t5 , 0x20($a0) 
 addiu $t7, $t7, -1
 bne $t7, $0, Loop
 addiu $v0, $0, 10
 syscall
