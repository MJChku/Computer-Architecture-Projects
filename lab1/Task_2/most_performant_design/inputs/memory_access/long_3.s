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
 sw   $t1 , 0x9($a0) 
 sw   $t5 , 0x0($a0) 
 lw   $t6 , 0x3($a0) 
 sb   $t1 , 0x12($a0) 
 lbu   $t5 , 0x15($a0) 
 sw   $t0 , 0xc($a0) 
 sb   $t3 , 0xf($a0) 
 lbu   $t6 , 0x1e($a0) 
 sw   $t6 , 0x21($a0) 
 lh   $t1 , 0x18($a0) 
 lh   $t4 , 0x1b($a0) 
 lh   $t4 , 0x2a($a0) 
 lhu   $t5 , 0x2d($a0) 
 lh   $t3 , 0x24($a0) 
 lw   $t4 , 0x27($a0) 
 lw   $t0 , 0x36($a0) 
 lh   $t4 , 0x39($a0) 
 sh   $t1 , 0x30($a0) 
 sb   $t6 , 0x33($a0) 
 lbu   $t2 , 0x42($a0) 
 sb   $t1 , 0x45($a0) 
 sh   $t0 , 0x3c($a0) 
 sw   $t3 , 0x3f($a0) 
 lhu   $t0 , 0x4e($a0) 
 sb   $t4 , 0x51($a0) 
 lb   $t0 , 0x48($a0) 
 lb   $t3 , 0x4b($a0) 
 lbu   $t0 , 0x5a($a0) 
 lh   $t1 , 0x5d($a0) 
 sb   $t1 , 0x54($a0) 
 lh   $t5 , 0x57($a0) 
 sh   $t3 , 0x66($a0) 
 sb   $t0 , 0x69($a0) 
 sb   $t4 , 0x60($a0) 
 lw   $t2 , 0x63($a0) 
 lw   $t2 , 0x72($a0) 
 sw   $t2 , 0x75($a0) 
 lb   $t3 , 0x6c($a0) 
 lb   $t6 , 0x6f($a0) 
 lhu   $t3 , 0x7e($a0) 
 lhu   $t2 , 0x81($a0) 
 sh   $t1 , 0x78($a0) 
 sb   $t3 , 0x7b($a0) 
 lbu   $t0 , 0x8a($a0) 
 sw   $t1 , 0x8d($a0) 
 sb   $t6 , 0x84($a0) 
 sw   $t4 , 0x87($a0) 
 sw   $t6 , 0x96($a0) 
 sw   $t0 , 0x99($a0) 
 lhu   $t3 , 0x90($a0) 
 sh   $t5 , 0x93($a0) 
 lb   $t4 , 0xa2($a0) 
 sh   $t6 , 0xa5($a0) 
 lbu   $t1 , 0x9c($a0) 
 lw   $t6 , 0x9f($a0) 
 lh   $t1 , 0xae($a0) 
 lw   $t3 , 0xb1($a0) 
 sh   $t3 , 0xa8($a0) 
 lb   $t0 , 0xab($a0) 
 lb   $t5 , 0xba($a0) 
 sb   $t0 , 0xbd($a0) 
 sw   $t2 , 0xb4($a0) 
 lw   $t6 , 0xb7($a0) 
 sh   $t0 , 0xc6($a0) 
 sw   $t5 , 0xc9($a0) 
 lhu   $t0 , 0xc0($a0) 
 sw   $t3 , 0xc3($a0) 
 sh   $t1 , 0xd2($a0) 
 lbu   $t3 , 0xd5($a0) 
 sh   $t1 , 0xcc($a0) 
 sh   $t6 , 0xcf($a0) 
 lw   $t3 , 0xde($a0) 
 sw   $t3 , 0xe1($a0) 
 lw   $t6 , 0xd8($a0) 
 sb   $t5 , 0xdb($a0) 
 lw   $t2 , 0xea($a0) 
 sb   $t4 , 0xed($a0) 
 lw   $t1 , 0xe4($a0) 
 lbu   $t5 , 0xe7($a0) 
 sb   $t1 , 0xf6($a0) 
 lw   $t1 , 0xf9($a0) 
 lw   $t4 , 0xf0($a0) 
 sh   $t3 , 0xf3($a0) 
 sb   $t2 , 0x102($a0) 
 sw   $t0 , 0x105($a0) 
 sw   $t5 , 0xfc($a0) 
 sb   $t5 , 0xff($a0) 
 sw   $t6 , 0x10e($a0) 
 lbu   $t4 , 0x111($a0) 
 sh   $t5 , 0x108($a0) 
 lbu   $t2 , 0x10b($a0) 
 sw   $t1 , 0x11a($a0) 
 sb   $t0 , 0x11d($a0) 
 sb   $t1 , 0x114($a0) 
 sw   $t4 , 0x117($a0) 
 sb   $t3 , 0x126($a0) 
 lhu   $t1 , 0x129($a0) 
 sb   $t2 , 0x120($a0) 
 lw   $t5 , 0x123($a0) 
 lw   $t2 , 0x132($a0) 
 sh   $t0 , 0x135($a0) 
 sb   $t4 , 0x12c($a0) 
 sb   $t5 , 0x12f($a0) 
 sb   $t5 , 0x13e($a0) 
 lw   $t5 , 0x141($a0) 
 lh   $t1 , 0x138($a0) 
 lh   $t6 , 0x13b($a0) 
 lb   $t6 , 0x14a($a0) 
 sh   $t2 , 0x14d($a0) 
 sh   $t3 , 0x144($a0) 
 lhu   $t0 , 0x147($a0) 
 lhu   $t1 , 0x156($a0) 
 lh   $t1 , 0x159($a0) 
 sw   $t6 , 0x150($a0) 
 sw   $t4 , 0x153($a0) 
 sh   $t6 , 0x162($a0) 
 lb   $t1 , 0x165($a0) 
 lw   $t6 , 0x15c($a0) 
 lw   $t4 , 0x15f($a0) 
 lw   $t1 , 0x16e($a0) 
 sh   $t3 , 0x171($a0) 
 sh   $t4 , 0x168($a0) 
 sh   $t4 , 0x16b($a0) 
 lh   $t4 , 0x17a($a0) 
 sb   $t3 , 0x17d($a0) 
 lh   $t0 , 0x174($a0) 
 sh   $t1 , 0x177($a0) 
 lw   $t1 , 0x186($a0) 
 sw   $t4 , 0x189($a0) 
 lb   $t6 , 0x180($a0) 
 sb   $t0 , 0x183($a0) 
 lw   $t3 , 0x192($a0) 
 lw   $t4 , 0x195($a0) 
 lb   $t1 , 0x18c($a0) 
 lhu   $t5 , 0x18f($a0) 
 lbu   $t6 , 0x19e($a0) 
 sh   $t1 , 0x1a1($a0) 
 lw   $t1 , 0x198($a0) 
 lbu   $t1 , 0x19b($a0) 
 sw   $t5 , 0x1aa($a0) 
 sb   $t1 , 0x1ad($a0) 
 lw   $t6 , 0x1a4($a0) 
 sh   $t2 , 0x1a7($a0) 
 lw   $t3 , 0x1b6($a0) 
 sw   $t0 , 0x1b9($a0) 
 sw   $t3 , 0x1b0($a0) 
 sw   $t5 , 0x1b3($a0) 
 sw   $t6 , 0x1c2($a0) 
 lh   $t6 , 0x1c5($a0) 
 lh   $t3 , 0x1bc($a0) 
 sw   $t5 , 0x1bf($a0) 
 lh   $t3 , 0x1ce($a0) 
 lh   $t0 , 0x1d1($a0) 
 sh   $t5 , 0x1c8($a0) 
 lh   $t4 , 0x1cb($a0) 
 lhu   $t0 , 0x1da($a0) 
 sb   $t5 , 0x1dd($a0) 
 lhu   $t0 , 0x1d4($a0) 
 lbu   $t3 , 0x1d7($a0) 
 lw   $t5 , 0x1e6($a0) 
 sb   $t0 , 0x1e9($a0) 
 lhu   $t4 , 0x1e0($a0) 
 lbu   $t6 , 0x1e3($a0) 
 lhu   $t3 , 0x1f2($a0) 
 sh   $t4 , 0x1f5($a0) 
 lw   $t1 , 0x1ec($a0) 
 lhu   $t0 , 0x1ef($a0) 
 sh   $t4 , 0x1fe($a0) 
 sb   $t5 , 0x201($a0) 
 sb   $t6 , 0x1f8($a0) 
 lh   $t4 , 0x1fb($a0) 
 sw   $t4 , 0x20a($a0) 
 sh   $t3 , 0x20d($a0) 
 sw   $t2 , 0x204($a0) 
 sb   $t1 , 0x207($a0) 
 sb   $t1 , 0x216($a0) 
 sw   $t4 , 0x219($a0) 
 lb   $t3 , 0x210($a0) 
 sw   $t3 , 0x213($a0) 
 sw   $t1 , 0x222($a0) 
 sw   $t2 , 0x225($a0) 
 lhu   $t5 , 0x21c($a0) 
 lw   $t6 , 0x21f($a0) 
 sw   $t6 , 0x22e($a0) 
 lhu   $t6 , 0x231($a0) 
 lw   $t3 , 0x228($a0) 
 sw   $t0 , 0x22b($a0) 
 lbu   $t6 , 0x23a($a0) 
 lw   $t3 , 0x23d($a0) 
 lbu   $t3 , 0x234($a0) 
 sh   $t2 , 0x237($a0) 
 sw   $t1 , 0x246($a0) 
 lhu   $t6 , 0x249($a0) 
 lh   $t0 , 0x240($a0) 
 lhu   $t6 , 0x243($a0) 
 lb   $t0 , 0x252($a0) 
 lh   $t6 , 0x255($a0) 
 sb   $t4 , 0x24c($a0) 
 lb   $t0 , 0x24f($a0) 
 lw   $t0 , 0x25e($a0) 
 sw   $t3 , 0x261($a0) 
 lb   $t6 , 0x258($a0) 
 sb   $t5 , 0x25b($a0) 
 sb   $t4 , 0x26a($a0) 
 sb   $t2 , 0x26d($a0) 
 lb   $t3 , 0x264($a0) 
 lb   $t2 , 0x267($a0) 
 lb   $t3 , 0x276($a0) 
 lbu   $t5 , 0x279($a0) 
 lhu   $t5 , 0x270($a0) 
 lw   $t3 , 0x273($a0) 
 sb   $t4 , 0x282($a0) 
 lhu   $t3 , 0x285($a0) 
 sh   $t3 , 0x27c($a0) 
 lbu   $t0 , 0x27f($a0) 
 lbu   $t0 , 0x28e($a0) 
 lh   $t2 , 0x291($a0) 
 lb   $t1 , 0x288($a0) 
 lb   $t3 , 0x28b($a0) 
 sw   $t3 , 0x29a($a0) 
 lh   $t3 , 0x29d($a0) 
 sb   $t5 , 0x294($a0) 
 lhu   $t6 , 0x297($a0) 
 sh   $t0 , 0x2a6($a0) 
 lbu   $t6 , 0x2a9($a0) 
 sh   $t1 , 0x2a0($a0) 
 lhu   $t5 , 0x2a3($a0) 
 lw   $t5 , 0x2b2($a0) 
 lh   $t4 , 0x2b5($a0) 
 sb   $t3 , 0x2ac($a0) 
 sh   $t1 , 0x2af($a0) 
 lw   $t3 , 0x2be($a0) 
 sw   $t5 , 0x2c1($a0) 
 sb   $t4 , 0x2b8($a0) 
 lhu   $t0 , 0x2bb($a0) 
 sh   $t5 , 0x2ca($a0) 
 sw   $t1 , 0x2cd($a0) 
 sw   $t3 , 0x2c4($a0) 
 sh   $t4 , 0x2c7($a0) 
 lb   $t2 , 0x2d6($a0) 
 sw   $t6 , 0x2d9($a0) 
 lhu   $t5 , 0x2d0($a0) 
 sw   $t4 , 0x2d3($a0) 
 sb   $t6 , 0x2e2($a0) 
 lw   $t5 , 0x2e5($a0) 
 lhu   $t5 , 0x2dc($a0) 
 sb   $t3 , 0x2df($a0) 
 sw   $t0 , 0x2ee($a0) 
 lh   $t2 , 0x2f1($a0) 
 lh   $t5 , 0x2e8($a0) 
 sw   $t0 , 0x2eb($a0) 
 lbu   $t3 , 0x2fa($a0) 
 sb   $t5 , 0x2fd($a0) 
 lbu   $t6 , 0x2f4($a0) 
 lbu   $t0 , 0x2f7($a0) 
 lb   $t4 , 0x306($a0) 
 lhu   $t5 , 0x309($a0) 
 sw   $t3 , 0x300($a0) 
 sb   $t5 , 0x303($a0) 
 lbu   $t5 , 0x312($a0) 
 lhu   $t1 , 0x315($a0) 
 lbu   $t6 , 0x30c($a0) 
 lhu   $t1 , 0x30f($a0) 
 sh   $t2 , 0x31e($a0) 
 lhu   $t4 , 0x321($a0) 
 sw   $t1 , 0x318($a0) 
 sw   $t6 , 0x31b($a0) 
 sh   $t1 , 0x32a($a0) 
 lh   $t1 , 0x32d($a0) 
 lw   $t0 , 0x324($a0) 
 lw   $t4 , 0x327($a0) 
 sh   $t4 , 0x336($a0) 
 sh   $t1 , 0x339($a0) 
 sb   $t3 , 0x330($a0) 
 lh   $t6 , 0x333($a0) 
 sh   $t4 , 0x342($a0) 
 lb   $t0 , 0x345($a0) 
 sb   $t4 , 0x33c($a0) 
 lhu   $t5 , 0x33f($a0) 
 lw   $t5 , 0x34e($a0) 
 lw   $t4 , 0x351($a0) 
 lw   $t3 , 0x348($a0) 
 sh   $t5 , 0x34b($a0) 
 sh   $t2 , 0x35a($a0) 
 lh   $t1 , 0x35d($a0) 
 lhu   $t2 , 0x354($a0) 
 sb   $t2 , 0x357($a0) 
 sh   $t0 , 0x366($a0) 
 lb   $t5 , 0x369($a0) 
 lb   $t0 , 0x360($a0) 
 lw   $t5 , 0x363($a0) 
 sb   $t0 , 0x372($a0) 
 sh   $t0 , 0x375($a0) 
 lh   $t5 , 0x36c($a0) 
 lw   $t6 , 0x36f($a0) 
 sh   $t5 , 0x37e($a0) 
 sw   $t5 , 0x381($a0) 
 sw   $t3 , 0x378($a0) 
 lbu   $t5 , 0x37b($a0) 
 sh   $t1 , 0x38a($a0) 
 lb   $t5 , 0x38d($a0) 
 sb   $t0 , 0x384($a0) 
 sh   $t2 , 0x387($a0) 
 sw   $t1 , 0x396($a0) 
 lbu   $t0 , 0x399($a0) 
 sh   $t5 , 0x390($a0) 
 lbu   $t4 , 0x393($a0) 
 lb   $t2 , 0x3a2($a0) 
 sw   $t2 , 0x3a5($a0) 
 sh   $t6 , 0x39c($a0) 
 sh   $t0 , 0x39f($a0) 
 lhu   $t5 , 0x3ae($a0) 
 sw   $t6 , 0x3b1($a0) 
 lw   $t6 , 0x3a8($a0) 
 lb   $t0 , 0x3ab($a0) 
 sw   $t1 , 0x3ba($a0) 
 sh   $t2 , 0x3bd($a0) 
 lw   $t4 , 0x3b4($a0) 
 sw   $t2 , 0x3b7($a0) 
 lhu   $t4 , 0x3c6($a0) 
 sw   $t0 , 0x3c9($a0) 
 sh   $t1 , 0x3c0($a0) 
 lbu   $t0 , 0x3c3($a0) 
 lhu   $t2 , 0x3d2($a0) 
 sb   $t5 , 0x3d5($a0) 
 lb   $t1 , 0x3cc($a0) 
 sh   $t5 , 0x3cf($a0) 
 sh   $t4 , 0x3de($a0) 
 sw   $t0 , 0x3e1($a0) 
 sh   $t0 , 0x3d8($a0) 
 sw   $t3 , 0x3db($a0) 
 sh   $t4 , 0x3ea($a0) 
 lb   $t0 , 0x3ed($a0) 
 sb   $t5 , 0x3e4($a0) 
 lw   $t0 , 0x3e7($a0) 
 lbu   $t4 , 0x3f6($a0) 
 sh   $t2 , 0x3f9($a0) 
 sh   $t0 , 0x3f0($a0) 
 sw   $t1 , 0x3f3($a0) 
 lh   $t3 , 0x402($a0) 
 sw   $t6 , 0x405($a0) 
 sw   $t2 , 0x3fc($a0) 
 sw   $t2 , 0x3ff($a0) 
 sh   $t4 , 0x40e($a0) 
 lbu   $t6 , 0x411($a0) 
 lb   $t3 , 0x408($a0) 
 lw   $t0 , 0x40b($a0) 
 lw   $t3 , 0x41a($a0) 
 lhu   $t1 , 0x41d($a0) 
 sw   $t4 , 0x414($a0) 
 lbu   $t3 , 0x417($a0) 
 lhu   $t4 , 0x426($a0) 
 lbu   $t2 , 0x429($a0) 
 lhu   $t0 , 0x420($a0) 
 lh   $t3 , 0x423($a0) 
 lhu   $t4 , 0x432($a0) 
 sh   $t3 , 0x435($a0) 
 sw   $t1 , 0x42c($a0) 
 sw   $t4 , 0x42f($a0) 
 sh   $t2 , 0x43e($a0) 
 sb   $t3 , 0x441($a0) 
 lw   $t4 , 0x438($a0) 
 sh   $t1 , 0x43b($a0) 
 lh   $t2 , 0x44a($a0) 
 sh   $t5 , 0x44d($a0) 
 lbu   $t4 , 0x444($a0) 
 lw   $t0 , 0x447($a0) 
 lhu   $t6 , 0x456($a0) 
 sw   $t5 , 0x459($a0) 
 lhu   $t1 , 0x450($a0) 
 lb   $t1 , 0x453($a0) 
 sh   $t1 , 0x462($a0) 
 lhu   $t3 , 0x465($a0) 
 lh   $t4 , 0x45c($a0) 
 lh   $t5 , 0x45f($a0) 
 lbu   $t3 , 0x46e($a0) 
 sh   $t0 , 0x471($a0) 
 lb   $t6 , 0x468($a0) 
 sh   $t1 , 0x46b($a0) 
 lh   $t2 , 0x47a($a0) 
 sh   $t6 , 0x47d($a0) 
 sb   $t5 , 0x474($a0) 
 sh   $t5 , 0x477($a0) 
 sw   $t6 , 0x486($a0) 
 sh   $t1 , 0x489($a0) 
 sh   $t6 , 0x480($a0) 
 lw   $t0 , 0x483($a0) 
 sb   $t0 , 0x492($a0) 
 sh   $t5 , 0x495($a0) 
 sb   $t3 , 0x48c($a0) 
 lbu   $t6 , 0x48f($a0) 
 lw   $t3 , 0x49e($a0) 
 sh   $t4 , 0x4a1($a0) 
 lb   $t6 , 0x498($a0) 
 lhu   $t3 , 0x49b($a0) 
 lbu   $t5 , 0x4aa($a0) 
 sh   $t6 , 0x4ad($a0) 
 sb   $t6 , 0x4a4($a0) 
 sh   $t5 , 0x4a7($a0) 
 lb   $t4 , 0x4b6($a0) 
 sw   $t5 , 0x4b9($a0) 
 lw   $t0 , 0x4b0($a0) 
 sw   $t4 , 0x4b3($a0) 
 lb   $t6 , 0x4c2($a0) 
 lw   $t4 , 0x4c5($a0) 
 lb   $t4 , 0x4bc($a0) 
 sb   $t1 , 0x4bf($a0) 
 sw   $t1 , 0x4ce($a0) 
 sh   $t0 , 0x4d1($a0) 
 lhu   $t1 , 0x4c8($a0) 
 sw   $t0 , 0x4cb($a0) 
 lb   $t3 , 0x4da($a0) 
 sw   $t4 , 0x4dd($a0) 
 sw   $t4 , 0x4d4($a0) 
 lbu   $t3 , 0x4d7($a0) 
 lhu   $t6 , 0x4e6($a0) 
 lb   $t3 , 0x4e9($a0) 
 sb   $t3 , 0x4e0($a0) 
 lbu   $t5 , 0x4e3($a0) 
 lbu   $t5 , 0x4f2($a0) 
 sh   $t5 , 0x4f5($a0) 
 sw   $t6 , 0x4ec($a0) 
 lw   $t1 , 0x4ef($a0) 
 lb   $t4 , 0x4fe($a0) 
 sw   $t1 , 0x501($a0) 
 lh   $t3 , 0x4f8($a0) 
 lb   $t5 , 0x4fb($a0) 
 sb   $t4 , 0x50a($a0) 
 lhu   $t3 , 0x50d($a0) 
 sw   $t6 , 0x504($a0) 
 sb   $t1 , 0x507($a0) 
 sh   $t5 , 0x516($a0) 
 sw   $t3 , 0x519($a0) 
 sh   $t2 , 0x510($a0) 
 sw   $t5 , 0x513($a0) 
 lw   $t6 , 0x522($a0) 
 sb   $t5 , 0x525($a0) 
 lbu   $t0 , 0x51c($a0) 
 lhu   $t4 , 0x51f($a0) 
 sw   $t1 , 0x52e($a0) 
 lw   $t4 , 0x531($a0) 
 lh   $t6 , 0x528($a0) 
 lbu   $t1 , 0x52b($a0) 
 sh   $t6 , 0x53a($a0) 
 sb   $t3 , 0x53d($a0) 
 sb   $t5 , 0x534($a0) 
 sw   $t3 , 0x537($a0) 
 lb   $t5 , 0x546($a0) 
 lw   $t2 , 0x549($a0) 
 lb   $t0 , 0x540($a0) 
 sb   $t4 , 0x543($a0) 
 sb   $t3 , 0x552($a0) 
 sb   $t6 , 0x555($a0) 
 sw   $t1 , 0x54c($a0) 
 lbu   $t4 , 0x54f($a0) 
 lhu   $t0 , 0x55e($a0) 
 sb   $t2 , 0x561($a0) 
 sw   $t2 , 0x558($a0) 
 sb   $t6 , 0x55b($a0) 
 sw   $t1 , 0x56a($a0) 
 lhu   $t0 , 0x56d($a0) 
 sw   $t1 , 0x564($a0) 
 lb   $t6 , 0x567($a0) 
 lh   $t6 , 0x576($a0) 
 lh   $t6 , 0x579($a0) 
 sw   $t2 , 0x570($a0) 
 lw   $t1 , 0x573($a0) 
 sb   $t6 , 0x582($a0) 
 lh   $t3 , 0x585($a0) 
 sw   $t4 , 0x57c($a0) 
 sh   $t1 , 0x57f($a0) 
 lhu   $t3 , 0x58e($a0) 
 lb   $t2 , 0x591($a0) 
 sw   $t4 , 0x588($a0) 
 lbu   $t6 , 0x58b($a0) 
 lw   $t3 , 0x59a($a0) 
 sb   $t1 , 0x59d($a0) 
 lb   $t2 , 0x594($a0) 
 lbu   $t0 , 0x597($a0) 
 sh   $t1 , 0x5a6($a0) 
 sb   $t4 , 0x5a9($a0) 
 sw   $t1 , 0x5a0($a0) 
 lw   $t4 , 0x5a3($a0) 
 lw   $t0 , 0x5b2($a0) 
 sh   $t3 , 0x5b5($a0) 
 lh   $t6 , 0x5ac($a0) 
 lb   $t2 , 0x5af($a0) 
 sb   $t3 , 0x5be($a0) 
 lw   $t2 , 0x5c1($a0) 
 sb   $t0 , 0x5b8($a0) 
 sw   $t6 , 0x5bb($a0) 
 lbu   $t1 , 0x5ca($a0) 
 sh   $t5 , 0x5cd($a0) 
 lbu   $t3 , 0x5c4($a0) 
 sh   $t6 , 0x5c7($a0) 
 sh   $t0 , 0x5d6($a0) 
 sw   $t4 , 0x5d9($a0) 
 lb   $t3 , 0x5d0($a0) 
 sh   $t6 , 0x5d3($a0) 
 sw   $t5 , 0x5e2($a0) 
 lw   $t5 , 0x5e5($a0) 
 lbu   $t1 , 0x5dc($a0) 
 lh   $t1 , 0x5df($a0) 
 lw   $t1 , 0x5ee($a0) 
 sw   $t6 , 0x5f1($a0) 
 sb   $t1 , 0x5e8($a0) 
 lb   $t0 , 0x5eb($a0) 
 lh   $t1 , 0x5fa($a0) 
 lh   $t4 , 0x5fd($a0) 
 sw   $t2 , 0x5f4($a0) 
 sw   $t2 , 0x5f7($a0) 
 lbu   $t2 , 0x606($a0) 
 sh   $t6 , 0x609($a0) 
 lw   $t2 , 0x600($a0) 
 sh   $t0 , 0x603($a0) 
 lh   $t4 , 0x612($a0) 
 lh   $t1 , 0x615($a0) 
 sb   $t2 , 0x60c($a0) 
 lw   $t4 , 0x60f($a0) 
 sh   $t5 , 0x61e($a0) 
 sb   $t5 , 0x621($a0) 
 lbu   $t4 , 0x618($a0) 
 sb   $t5 , 0x61b($a0) 
 lb   $t6 , 0x62a($a0) 
 lh   $t1 , 0x62d($a0) 
 lh   $t5 , 0x624($a0) 
 sw   $t4 , 0x627($a0) 
 sb   $t1 , 0x636($a0) 
 lw   $t2 , 0x639($a0) 
 sh   $t2 , 0x630($a0) 
 sw   $t2 , 0x633($a0) 
 lh   $t2 , 0x642($a0) 
 lb   $t1 , 0x645($a0) 
 lhu   $t5 , 0x63c($a0) 
 sw   $t6 , 0x63f($a0) 
 lbu   $t4 , 0x64e($a0) 
 sw   $t3 , 0x651($a0) 
 lh   $t4 , 0x648($a0) 
 sw   $t6 , 0x64b($a0) 
 sw   $t1 , 0x65a($a0) 
 sw   $t1 , 0x65d($a0) 
 sb   $t1 , 0x654($a0) 
 sw   $t6 , 0x657($a0) 
 sh   $t6 , 0x666($a0) 
 lhu   $t4 , 0x669($a0) 
 sb   $t1 , 0x660($a0) 
 lh   $t5 , 0x663($a0) 
 sh   $t1 , 0x672($a0) 
 lw   $t3 , 0x675($a0) 
 sb   $t6 , 0x66c($a0) 
 lb   $t6 , 0x66f($a0) 
 sb   $t1 , 0x67e($a0) 
 lh   $t5 , 0x681($a0) 
 sw   $t4 , 0x678($a0) 
 lbu   $t3 , 0x67b($a0) 
 lw   $t2 , 0x68a($a0) 
 lb   $t6 , 0x68d($a0) 
 lb   $t5 , 0x684($a0) 
 lbu   $t2 , 0x687($a0) 
 sb   $t6 , 0x696($a0) 
 sb   $t3 , 0x699($a0) 
 lbu   $t2 , 0x690($a0) 
 lh   $t3 , 0x693($a0) 
 sw   $t0 , 0x6a2($a0) 
 lhu   $t4 , 0x6a5($a0) 
 sw   $t6 , 0x69c($a0) 
 sb   $t3 , 0x69f($a0) 
 sw   $t6 , 0x6ae($a0) 
 sh   $t3 , 0x6b1($a0) 
 lb   $t1 , 0x6a8($a0) 
 sb   $t0 , 0x6ab($a0) 
 sb   $t4 , 0x6ba($a0) 
 lb   $t3 , 0x6bd($a0) 
 sh   $t6 , 0x6b4($a0) 
 lb   $t6 , 0x6b7($a0) 
 sh   $t6 , 0x6c6($a0) 
 sh   $t1 , 0x6c9($a0) 
 sw   $t1 , 0x6c0($a0) 
 sb   $t5 , 0x6c3($a0) 
 sb   $t4 , 0x6d2($a0) 
 lb   $t0 , 0x6d5($a0) 
 sh   $t1 , 0x6cc($a0) 
 lb   $t6 , 0x6cf($a0) 
 sw   $t6 , 0x6de($a0) 
 sb   $t3 , 0x6e1($a0) 
 sb   $t4 , 0x6d8($a0) 
 sb   $t4 , 0x6db($a0) 
 sb   $t3 , 0x6ea($a0) 
 lb   $t4 , 0x6ed($a0) 
 sw   $t5 , 0x6e4($a0) 
 sb   $t2 , 0x6e7($a0) 
 lbu   $t3 , 0x6f6($a0) 
 lb   $t6 , 0x6f9($a0) 
 sb   $t4 , 0x6f0($a0) 
 lbu   $t3 , 0x6f3($a0) 
 lh   $t1 , 0x702($a0) 
 sw   $t5 , 0x705($a0) 
 sw   $t1 , 0x6fc($a0) 
 sb   $t2 , 0x6ff($a0) 
 lbu   $t2 , 0x70e($a0) 
 lh   $t6 , 0x711($a0) 
 sh   $t4 , 0x708($a0) 
 sb   $t2 , 0x70b($a0) 
 sh   $t3 , 0x71a($a0) 
 sb   $t2 , 0x71d($a0) 
 lb   $t4 , 0x714($a0) 
 lhu   $t0 , 0x717($a0) 
 lhu   $t0 , 0x726($a0) 
 sw   $t2 , 0x729($a0) 
 lb   $t4 , 0x720($a0) 
 sh   $t1 , 0x723($a0) 
 sh   $t6 , 0x732($a0) 
 sb   $t4 , 0x735($a0) 
 lw   $t6 , 0x72c($a0) 
 sh   $t2 , 0x72f($a0) 
 lbu   $t5 , 0x73e($a0) 
 sw   $t2 , 0x741($a0) 
 lb   $t6 , 0x738($a0) 
 sh   $t2 , 0x73b($a0) 
 lbu   $t4 , 0x74a($a0) 
 lh   $t4 , 0x74d($a0) 
 sw   $t6 , 0x744($a0) 
 sb   $t4 , 0x747($a0) 
 lhu   $t4 , 0x756($a0) 
 lhu   $t4 , 0x759($a0) 
 sw   $t3 , 0x750($a0) 
 lhu   $t6 , 0x753($a0) 
 sh   $t1 , 0x762($a0) 
 lw   $t4 , 0x765($a0) 
 lw   $t4 , 0x75c($a0) 
 lbu   $t2 , 0x75f($a0) 
 lh   $t5 , 0x76e($a0) 
 sb   $t3 , 0x771($a0) 
 sb   $t2 , 0x768($a0) 
 lbu   $t3 , 0x76b($a0) 
 lhu   $t6 , 0x77a($a0) 
 lhu   $t0 , 0x77d($a0) 
 sw   $t5 , 0x774($a0) 
 lw   $t2 , 0x777($a0) 
 sw   $t2 , 0x786($a0) 
 lhu   $t5 , 0x789($a0) 
 sw   $t1 , 0x780($a0) 
 lb   $t6 , 0x783($a0) 
 sw   $t0 , 0x792($a0) 
 lw   $t1 , 0x795($a0) 
 sw   $t3 , 0x78c($a0) 
 sh   $t3 , 0x78f($a0) 
 lw   $t0 , 0x79e($a0) 
 lhu   $t6 , 0x7a1($a0) 
 lbu   $t4 , 0x798($a0) 
 sh   $t0 , 0x79b($a0) 
 lhu   $t1 , 0x7aa($a0) 
 lh   $t6 , 0x7ad($a0) 
 sb   $t0 , 0x7a4($a0) 
 lb   $t0 , 0x7a7($a0) 
 sb   $t3 , 0x7b6($a0) 
 lbu   $t5 , 0x7b9($a0) 
 lh   $t5 , 0x7b0($a0) 
 sb   $t1 , 0x7b3($a0) 
 lw   $t4 , 0x7c2($a0) 
 sh   $t6 , 0x7c5($a0) 
 lh   $t3 , 0x7bc($a0) 
 lb   $t2 , 0x7bf($a0) 
 lw   $t1 , 0x7ce($a0) 
 lbu   $t4 , 0x7d1($a0) 
 sb   $t0 , 0x7c8($a0) 
 lh   $t2 , 0x7cb($a0) 
 sw   $t5 , 0x7da($a0) 
 lw   $t6 , 0x7dd($a0) 
 lhu   $t0 , 0x7d4($a0) 
 sh   $t3 , 0x7d7($a0) 
 lh   $t0 , 0x7e6($a0) 
 sb   $t6 , 0x7e9($a0) 
 lh   $t1 , 0x7e0($a0) 
 sw   $t1 , 0x7e3($a0) 
 sw   $t6 , 0x7f2($a0) 
 lhu   $t6 , 0x7f5($a0) 
 lhu   $t2 , 0x7ec($a0) 
 sh   $t1 , 0x7ef($a0) 
 sh   $t2 , 0x7fe($a0) 
 sw   $t4 , 0x801($a0) 
 lbu   $t0 , 0x7f8($a0) 
 sw   $t0 , 0x7fb($a0) 
 lw   $t4 , 0x80a($a0) 
 lhu   $t6 , 0x80d($a0) 
 lb   $t3 , 0x804($a0) 
 lh   $t4 , 0x807($a0) 
 sw   $t0 , 0x816($a0) 
 lhu   $t3 , 0x819($a0) 
 sb   $t6 , 0x810($a0) 
 lb   $t4 , 0x813($a0) 
 lhu   $t1 , 0x822($a0) 
 sh   $t6 , 0x825($a0) 
 sb   $t0 , 0x81c($a0) 
 lh   $t5 , 0x81f($a0) 
 lbu   $t0 , 0x82e($a0) 
 sh   $t3 , 0x831($a0) 
 sh   $t2 , 0x828($a0) 
 lw   $t0 , 0x82b($a0) 
 lb   $t5 , 0x83a($a0) 
 lb   $t0 , 0x83d($a0) 
 lw   $t2 , 0x834($a0) 
 lbu   $t4 , 0x837($a0) 
 sb   $t2 , 0x846($a0) 
 lhu   $t1 , 0x849($a0) 
 lhu   $t2 , 0x840($a0) 
 lh   $t0 , 0x843($a0) 
 sh   $t3 , 0x852($a0) 
 sw   $t6 , 0x855($a0) 
 lh   $t5 , 0x84c($a0) 
 lb   $t0 , 0x84f($a0) 
 sb   $t4 , 0x85e($a0) 
 sb   $t3 , 0x861($a0) 
 lbu   $t4 , 0x858($a0) 
 sw   $t6 , 0x85b($a0) 
 lbu   $t4 , 0x86a($a0) 
 lhu   $t3 , 0x86d($a0) 
 lb   $t4 , 0x864($a0) 
 sh   $t4 , 0x867($a0) 
 lb   $t5 , 0x876($a0) 
 lh   $t0 , 0x879($a0) 
 lh   $t6 , 0x870($a0) 
 lhu   $t6 , 0x873($a0) 
 sh   $t1 , 0x882($a0) 
 lhu   $t4 , 0x885($a0) 
 lhu   $t3 , 0x87c($a0) 
 lb   $t2 , 0x87f($a0) 
 lh   $t4 , 0x88e($a0) 
 lb   $t2 , 0x891($a0) 
 lbu   $t6 , 0x888($a0) 
 lhu   $t3 , 0x88b($a0) 
 lw   $t5 , 0x89a($a0) 
 lhu   $t4 , 0x89d($a0) 
 sh   $t2 , 0x894($a0) 
 sb   $t3 , 0x897($a0) 
 sh   $t2 , 0x8a6($a0) 
 lbu   $t2 , 0x8a9($a0) 
 sh   $t6 , 0x8a0($a0) 
 sh   $t4 , 0x8a3($a0) 
 sb   $t3 , 0x8b2($a0) 
 lhu   $t2 , 0x8b5($a0) 
 sw   $t3 , 0x8ac($a0) 
 lw   $t5 , 0x8af($a0) 
 lbu   $t5 , 0x8be($a0) 
 lhu   $t6 , 0x8c1($a0) 
 lbu   $t0 , 0x8b8($a0) 
 lbu   $t4 , 0x8bb($a0) 
 sb   $t6 , 0x8ca($a0) 
 sh   $t2 , 0x8cd($a0) 
 lb   $t5 , 0x8c4($a0) 
 lb   $t0 , 0x8c7($a0) 
 sb   $t2 , 0x8d6($a0) 
 lh   $t5 , 0x8d9($a0) 
 lhu   $t3 , 0x8d0($a0) 
 lw   $t0 , 0x8d3($a0) 
 lw   $t6 , 0x8e2($a0) 
 lw   $t6 , 0x8e5($a0) 
 sh   $t1 , 0x8dc($a0) 
 lhu   $t6 , 0x8df($a0) 
 sw   $t2 , 0x8ee($a0) 
 sh   $t1 , 0x8f1($a0) 
 sh   $t2 , 0x8e8($a0) 
 sh   $t1 , 0x8eb($a0) 
 lw   $t0 , 0x8fa($a0) 
 sb   $t4 , 0x8fd($a0) 
 lhu   $t1 , 0x8f4($a0) 
 sw   $t6 , 0x8f7($a0) 
 lbu   $t3 , 0x906($a0) 
 sh   $t1 , 0x909($a0) 
 sh   $t4 , 0x900($a0) 
 sb   $t1 , 0x903($a0) 
 sh   $t1 , 0x912($a0) 
 lh   $t5 , 0x915($a0) 
 lb   $t0 , 0x90c($a0) 
 sh   $t1 , 0x90f($a0) 
 lbu   $t6 , 0x91e($a0) 
 sh   $t5 , 0x921($a0) 
 lbu   $t0 , 0x918($a0) 
 sw   $t4 , 0x91b($a0) 
 sh   $t3 , 0x92a($a0) 
 lbu   $t3 , 0x92d($a0) 
 lh   $t3 , 0x924($a0) 
 lw   $t1 , 0x927($a0) 
 lh   $t0 , 0x936($a0) 
 lw   $t4 , 0x939($a0) 
 lh   $t6 , 0x930($a0) 
 lh   $t3 , 0x933($a0) 
 lbu   $t6 , 0x942($a0) 
 lh   $t6 , 0x945($a0) 
 lh   $t5 , 0x93c($a0) 
 sw   $t4 , 0x93f($a0) 
 lw   $t4 , 0x94e($a0) 
 sh   $t6 , 0x951($a0) 
 lw   $t2 , 0x948($a0) 
 sh   $t3 , 0x94b($a0) 
 sb   $t3 , 0x95a($a0) 
 lw   $t1 , 0x95d($a0) 
 sb   $t6 , 0x954($a0) 
 sb   $t4 , 0x957($a0) 
 lh   $t2 , 0x966($a0) 
 sb   $t1 , 0x969($a0) 
 lb   $t1 , 0x960($a0) 
 lhu   $t3 , 0x963($a0) 
 sw   $t1 , 0x972($a0) 
 lbu   $t6 , 0x975($a0) 
 lbu   $t0 , 0x96c($a0) 
 sh   $t1 , 0x96f($a0) 
 lb   $t2 , 0x97e($a0) 
 sb   $t6 , 0x981($a0) 
 lb   $t3 , 0x978($a0) 
 sw   $t5 , 0x97b($a0) 
 lw   $t0 , 0x98a($a0) 
 sb   $t1 , 0x98d($a0) 
 lbu   $t3 , 0x984($a0) 
 sw   $t6 , 0x987($a0) 
 sb   $t2 , 0x996($a0) 
 lb   $t6 , 0x999($a0) 
 sw   $t0 , 0x990($a0) 
 sw   $t4 , 0x993($a0) 
 lb   $t4 , 0x9a2($a0) 
 lbu   $t5 , 0x9a5($a0) 
 lh   $t6 , 0x99c($a0) 
 lh   $t2 , 0x99f($a0) 
 lh   $t6 , 0x9ae($a0) 
 lh   $t5 , 0x9b1($a0) 
 lw   $t5 , 0x9a8($a0) 
 lw   $t5 , 0x9ab($a0) 
 lw   $t1 , 0x9ba($a0) 
 sh   $t0 , 0x9bd($a0) 
 lhu   $t1 , 0x9b4($a0) 
 lbu   $t5 , 0x9b7($a0) 
 sb   $t1 , 0x9c6($a0) 
 sh   $t0 , 0x9c9($a0) 
 sh   $t3 , 0x9c0($a0) 
 lb   $t4 , 0x9c3($a0) 
 sw   $t6 , 0x9d2($a0) 
 sh   $t3 , 0x9d5($a0) 
 sh   $t0 , 0x9cc($a0) 
 lhu   $t2 , 0x9cf($a0) 
 sh   $t1 , 0x9de($a0) 
 sw   $t4 , 0x9e1($a0) 
 lw   $t6 , 0x9d8($a0) 
 lhu   $t2 , 0x9db($a0) 
 lh   $t3 , 0x9ea($a0) 
 sw   $t0 , 0x9ed($a0) 
 sh   $t4 , 0x9e4($a0) 
 sh   $t4 , 0x9e7($a0) 
 sb   $t6 , 0x9f6($a0) 
 lbu   $t0 , 0x9f9($a0) 
 sw   $t4 , 0x9f0($a0) 
 lw   $t4 , 0x9f3($a0) 
 lb   $t3 , 0xa02($a0) 
 sw   $t6 , 0xa05($a0) 
 sw   $t0 , 0x9fc($a0) 
 sh   $t0 , 0x9ff($a0) 
 lw   $t1 , 0xa0e($a0) 
 lb   $t1 , 0xa11($a0) 
 sw   $t2 , 0xa08($a0) 
 sb   $t5 , 0xa0b($a0) 
 sh   $t1 , 0xa1a($a0) 
 sh   $t1 , 0xa1d($a0) 
 sh   $t6 , 0xa14($a0) 
 lw   $t0 , 0xa17($a0) 
 lw   $t2 , 0xa26($a0) 
 lhu   $t6 , 0xa29($a0) 
 lhu   $t3 , 0xa20($a0) 
 sb   $t4 , 0xa23($a0) 
 sw   $t1 , 0xa32($a0) 
 lw   $t1 , 0xa35($a0) 
 lw   $t6 , 0xa2c($a0) 
 lhu   $t6 , 0xa2f($a0) 
 sb   $t5 , 0xa3e($a0) 
 sh   $t3 , 0xa41($a0) 
 sw   $t2 , 0xa38($a0) 
 lb   $t5 , 0xa3b($a0) 
 lw   $t0 , 0xa4a($a0) 
 sb   $t3 , 0xa4d($a0) 
 lb   $t2 , 0xa44($a0) 
 sw   $t2 , 0xa47($a0) 
 sh   $t5 , 0xa56($a0) 
 sh   $t0 , 0xa59($a0) 
 sh   $t6 , 0xa50($a0) 
 sw   $t0 , 0xa53($a0) 
 lw   $t3 , 0xa62($a0) 
 sh   $t4 , 0xa65($a0) 
 sb   $t4 , 0xa5c($a0) 
 lhu   $t5 , 0xa5f($a0) 
 lb   $t4 , 0xa6e($a0) 
 lw   $t2 , 0xa71($a0) 
 lbu   $t5 , 0xa68($a0) 
 sw   $t1 , 0xa6b($a0) 
 sb   $t1 , 0xa7a($a0) 
 sb   $t4 , 0xa7d($a0) 
 lb   $t6 , 0xa74($a0) 
 sh   $t5 , 0xa77($a0) 
 sw   $t3 , 0xa86($a0) 
 sw   $t3 , 0xa89($a0) 
 lw   $t3 , 0xa80($a0) 
 sw   $t3 , 0xa83($a0) 
 sb   $t5 , 0xa92($a0) 
 sw   $t1 , 0xa95($a0) 
 lh   $t5 , 0xa8c($a0) 
 lbu   $t3 , 0xa8f($a0) 
 lh   $t3 , 0xa9e($a0) 
 sh   $t5 , 0xaa1($a0) 
 lhu   $t4 , 0xa98($a0) 
 sb   $t1 , 0xa9b($a0) 
 lb   $t3 , 0xaaa($a0) 
 sb   $t2 , 0xaad($a0) 
 lbu   $t2 , 0xaa4($a0) 
 lw   $t2 , 0xaa7($a0) 
 sb   $t0 , 0xab6($a0) 
 sh   $t4 , 0xab9($a0) 
 sb   $t1 , 0xab0($a0) 
 sw   $t6 , 0xab3($a0) 
 lw   $t5 , 0xac2($a0) 
 sh   $t6 , 0xac5($a0) 
 lbu   $t5 , 0xabc($a0) 
 lbu   $t0 , 0xabf($a0) 
 lhu   $t4 , 0xace($a0) 
 lw   $t6 , 0xad1($a0) 
 lb   $t6 , 0xac8($a0) 
 lbu   $t3 , 0xacb($a0) 
 lh   $t0 , 0xada($a0) 
 sh   $t4 , 0xadd($a0) 
 sh   $t0 , 0xad4($a0) 
 sb   $t0 , 0xad7($a0) 
 sb   $t5 , 0xae6($a0) 
 lw   $t2 , 0xae9($a0) 
 sh   $t6 , 0xae0($a0) 
 sb   $t5 , 0xae3($a0) 
 lh   $t5 , 0xaf2($a0) 
 sw   $t6 , 0xaf5($a0) 
 sw   $t2 , 0xaec($a0) 
 sb   $t5 , 0xaef($a0) 
 lh   $t5 , 0xafe($a0) 
 sb   $t4 , 0xb01($a0) 
 lh   $t1 , 0xaf8($a0) 
 lb   $t5 , 0xafb($a0) 
 lhu   $t0 , 0xb0a($a0) 
 lw   $t3 , 0xb0d($a0) 
 lbu   $t4 , 0xb04($a0) 
 sw   $t4 , 0xb07($a0) 
 sw   $t1 , 0xb16($a0) 
 lb   $t0 , 0xb19($a0) 
 sb   $t1 , 0xb10($a0) 
 lhu   $t6 , 0xb13($a0) 
 sb   $t6 , 0xb22($a0) 
 lh   $t1 , 0xb25($a0) 
 lbu   $t4 , 0xb1c($a0) 
 sh   $t4 , 0xb1f($a0) 
 sw   $t2 , 0xb2e($a0) 
 lh   $t0 , 0xb31($a0) 
 lhu   $t3 , 0xb28($a0) 
 sw   $t6 , 0xb2b($a0) 
 lhu   $t4 , 0xb3a($a0) 
 lh   $t4 , 0xb3d($a0) 
 lw   $t5 , 0xb34($a0) 
 lw   $t6 , 0xb37($a0) 
 lhu   $t1 , 0xb46($a0) 
 sh   $t3 , 0xb49($a0) 
 sw   $t1 , 0xb40($a0) 
 sb   $t5 , 0xb43($a0) 
 sb   $t2 , 0xb52($a0) 
 sb   $t5 , 0xb55($a0) 
 lbu   $t5 , 0xb4c($a0) 
 sh   $t2 , 0xb4f($a0) 
 lw   $t2 , 0xb5e($a0) 
 lhu   $t0 , 0xb61($a0) 
 lb   $t3 , 0xb58($a0) 
 sw   $t1 , 0xb5b($a0) 
 sb   $t2 , 0xb6a($a0) 
 sb   $t1 , 0xb6d($a0) 
 sh   $t5 , 0xb64($a0) 
 lb   $t5 , 0xb67($a0) 
 sw   $t1 , 0xb76($a0) 
 lb   $t5 , 0xb79($a0) 
 sh   $t6 , 0xb70($a0) 
 sh   $t1 , 0xb73($a0) 
 sh   $t4 , 0xb82($a0) 
 lh   $t5 , 0xb85($a0) 
 sh   $t0 , 0xb7c($a0) 
 lh   $t5 , 0xb7f($a0) 
 sh   $t3 , 0xb8e($a0) 
 sw   $t2 , 0xb91($a0) 
 lhu   $t3 , 0xb88($a0) 
 lb   $t3 , 0xb8b($a0) 
 sh   $t0 , 0xb9a($a0) 
 lhu   $t3 , 0xb9d($a0) 
 lhu   $t0 , 0xb94($a0) 
 sw   $t0 , 0xb97($a0) 
 lhu   $t1 , 0xba6($a0) 
 lbu   $t4 , 0xba9($a0) 
 lh   $t4 , 0xba0($a0) 
 lh   $t4 , 0xba3($a0) 
 sw   $t1 , 0xbb2($a0) 
 lw   $t6 , 0xbb5($a0) 
 lhu   $t0 , 0xbac($a0) 
 lbu   $t4 , 0xbaf($a0) 
 lh   $t6 , 0x6($a0) 
 addiu $t7, $t7, -1
 bne $t7, $0, Loop
 addiu $v0, $0, 10
 syscall

