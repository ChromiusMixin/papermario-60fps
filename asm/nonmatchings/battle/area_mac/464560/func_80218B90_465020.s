.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches

glabel func_80218B90_465020
/* 465020 80218B90 27BDFFC8 */  addiu     $sp, $sp, -0x38
/* 465024 80218B94 AFB20020 */  sw        $s2, 0x20($sp)
/* 465028 80218B98 0080902D */  daddu     $s2, $a0, $zero
/* 46502C 80218B9C AFBF0028 */  sw        $ra, 0x28($sp)
/* 465030 80218BA0 AFB30024 */  sw        $s3, 0x24($sp)
/* 465034 80218BA4 AFB1001C */  sw        $s1, 0x1c($sp)
/* 465038 80218BA8 AFB00018 */  sw        $s0, 0x18($sp)
/* 46503C 80218BAC F7B40030 */  sdc1      $f20, 0x30($sp)
/* 465040 80218BB0 8E440148 */  lw        $a0, 0x148($s2)
/* 465044 80218BB4 0C09A75B */  jal       get_actor
/* 465048 80218BB8 00A0802D */   daddu    $s0, $a1, $zero
/* 46504C 80218BBC 0040882D */  daddu     $s1, $v0, $zero
/* 465050 80218BC0 12000002 */  beqz      $s0, .L80218BCC
/* 465054 80218BC4 2633000C */   addiu    $s3, $s1, 0xc
/* 465058 80218BC8 AE400070 */  sw        $zero, 0x70($s2)
.L80218BCC:
/* 46505C 80218BCC 8E420070 */  lw        $v0, 0x70($s2)
/* 465060 80218BD0 14400008 */  bnez      $v0, .L80218BF4
/* 465064 80218BD4 24020001 */   addiu    $v0, $zero, 1
/* 465068 80218BD8 C6200144 */  lwc1      $f0, 0x144($s1)
/* 46506C 80218BDC C6220148 */  lwc1      $f2, 0x148($s1)
/* 465070 80218BE0 C624014C */  lwc1      $f4, 0x14c($s1)
/* 465074 80218BE4 E620000C */  swc1      $f0, 0xc($s1)
/* 465078 80218BE8 E6220010 */  swc1      $f2, 0x10($s1)
/* 46507C 80218BEC E6240014 */  swc1      $f4, 0x14($s1)
/* 465080 80218BF0 AE420070 */  sw        $v0, 0x70($s2)
.L80218BF4:
/* 465084 80218BF4 C6200050 */  lwc1      $f0, 0x50($s1)
/* 465088 80218BF8 4480A000 */  mtc1      $zero, $f20
/* 46508C 80218BFC 00000000 */  nop       
/* 465090 80218C00 4600A03C */  c.lt.s    $f20, $f0
/* 465094 80218C04 00000000 */  nop       
/* 465098 80218C08 45000005 */  bc1f      .L80218C20
/* 46509C 80218C0C 2404FF81 */   addiu    $a0, $zero, -0x7f
/* 4650A0 80218C10 8E260064 */  lw        $a2, 0x64($s1)
/* 4650A4 80218C14 0C098F3F */  jal       set_animation
/* 4650A8 80218C18 24050001 */   addiu    $a1, $zero, 1
/* 4650AC 80218C1C C6200050 */  lwc1      $f0, 0x50($s1)
.L80218C20:
/* 4650B0 80218C20 4614003C */  c.lt.s    $f0, $f20
/* 4650B4 80218C24 00000000 */  nop       
/* 4650B8 80218C28 45000004 */  bc1f      .L80218C3C
/* 4650BC 80218C2C 2404FF81 */   addiu    $a0, $zero, -0x7f
/* 4650C0 80218C30 8E260068 */  lw        $a2, 0x68($s1)
/* 4650C4 80218C34 0C098F3F */  jal       set_animation
/* 4650C8 80218C38 24050001 */   addiu    $a1, $zero, 1
.L80218C3C:
/* 4650CC 80218C3C C6240010 */  lwc1      $f4, 0x10($s1)
/* 4650D0 80218C40 C6200050 */  lwc1      $f0, 0x50($s1)
/* 4650D4 80218C44 8E25004C */  lw        $a1, 0x4c($s1)
/* 4650D8 80218C48 46002100 */  add.s     $f4, $f4, $f0
/* 4650DC 80218C4C C6220048 */  lwc1      $f2, 0x48($s1)
/* 4650E0 80218C50 8E260054 */  lw        $a2, 0x54($s1)
/* 4650E4 80218C54 46020001 */  sub.s     $f0, $f0, $f2
/* 4650E8 80218C58 0260202D */  daddu     $a0, $s3, $zero
/* 4650EC 80218C5C E6240010 */  swc1      $f4, 0x10($s1)
/* 4650F0 80218C60 0C09904A */  jal       add_xz_vec3f
/* 4650F4 80218C64 E6200050 */   swc1     $f0, 0x50($s1)
/* 4650F8 80218C68 C6200010 */  lwc1      $f0, 0x10($s1)
/* 4650FC 80218C6C C6220014 */  lwc1      $f2, 0x14($s1)
/* 465100 80218C70 E6200148 */  swc1      $f0, 0x148($s1)
/* 465104 80218C74 C620000C */  lwc1      $f0, 0xc($s1)
/* 465108 80218C78 C6240148 */  lwc1      $f4, 0x148($s1)
/* 46510C 80218C7C E622014C */  swc1      $f2, 0x14c($s1)
/* 465110 80218C80 4614203C */  c.lt.s    $f4, $f20
/* 465114 80218C84 00000000 */  nop       
/* 465118 80218C88 45010003 */  bc1t      .L80218C98
/* 46511C 80218C8C E6200144 */   swc1     $f0, 0x144($s1)
/* 465120 80218C90 08086331 */  j         .L80218CC4
/* 465124 80218C94 0000102D */   daddu    $v0, $zero, $zero
.L80218C98:
/* 465128 80218C98 C620018C */  lwc1      $f0, 0x18c($s1)
/* 46512C 80218C9C E6340148 */  swc1      $f20, 0x148($s1)
/* 465130 80218CA0 E7A00010 */  swc1      $f0, 0x10($sp)
/* 465134 80218CA4 8E250144 */  lw        $a1, 0x144($s1)
/* 465138 80218CA8 8E260148 */  lw        $a2, 0x148($s1)
/* 46513C 80218CAC 8E27014C */  lw        $a3, 0x14c($s1)
/* 465140 80218CB0 0C0990BC */  jal       play_movement_dust_effects
/* 465144 80218CB4 24040002 */   addiu    $a0, $zero, 2
/* 465148 80218CB8 0C05272D */  jal       play_sound
/* 46514C 80218CBC 24040148 */   addiu    $a0, $zero, 0x148
/* 465150 80218CC0 24020001 */  addiu     $v0, $zero, 1
.L80218CC4:
/* 465154 80218CC4 8FBF0028 */  lw        $ra, 0x28($sp)
/* 465158 80218CC8 8FB30024 */  lw        $s3, 0x24($sp)
/* 46515C 80218CCC 8FB20020 */  lw        $s2, 0x20($sp)
/* 465160 80218CD0 8FB1001C */  lw        $s1, 0x1c($sp)
/* 465164 80218CD4 8FB00018 */  lw        $s0, 0x18($sp)
/* 465168 80218CD8 D7B40030 */  ldc1      $f20, 0x30($sp)
/* 46516C 80218CDC 03E00008 */  jr        $ra
/* 465170 80218CE0 27BD0038 */   addiu    $sp, $sp, 0x38