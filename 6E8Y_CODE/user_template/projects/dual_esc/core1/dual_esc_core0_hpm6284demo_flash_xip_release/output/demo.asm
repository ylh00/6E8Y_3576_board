
D:/v113test/sdk_env_v1.13.0/user_template/projects/dual_esc/core1/dual_esc_core0_hpm6284demo_flash_xip_release/output/demo.elf:     file format elf32-littleriscv


Disassembly of section .start:

00020000 <_start>:
   20000:	00081197          	auipc	gp,0x81
   20004:	80018193          	add	gp,gp,-2048 # a0800 <__global_pointer$>
   20008:	00080217          	auipc	tp,0x80
   2000c:	1d020213          	add	tp,tp,464 # a01d8 <timer_cb>
   20010:	30001073          	csrw	mstatus,zero
   20014:	00088297          	auipc	t0,0x88
   20018:	1ec28293          	add	t0,t0,492 # a8200 <_stack>
   2001c:	8116                	mv	sp,t0
   2001e:	42a030ef          	jal	23448 <l1c_ic_enable>
   20022:	40e030ef          	jal	23430 <l1c_dc_enable>
   20026:	434030ef          	jal	2345a <l1c_dc_invalidate_all>
   2002a:	629020ef          	jal	22e52 <c_startup>
   2002e:	57f020ef          	jal	22dac <__libc_init_array>
   20032:	5dd020ef          	jal	22e0e <_clean_up>
   20036:	00000297          	auipc	t0,0x0
   2003a:	3ca28293          	add	t0,t0,970 # 20400 <__vector_table>
   2003e:	30529073          	csrw	mtvec,t0
   20042:	7d016073          	csrs	0x7d0,2
   20046:	3c6030ef          	jal	2340c <reset_handler>
   2004a:	a001                	j	2004a <_start+0x4a>

0002004c <exit>:
   2004c:	a001                	j	2004c <exit>
	...

Disassembly of section .vectors:

00020200 <nmi_handler>:
   20200:	a001                	j	20200 <nmi_handler>
   20202:	0001                	nop

00020204 <default_irq_handler>:
   20204:	a001                	j	20204 <default_irq_handler>
	...

00020208 <irq_handler_trap>:
   20208:	711d                	add	sp,sp,-96
   2020a:	ce86                	sw	ra,92(sp)
   2020c:	cc96                	sw	t0,88(sp)
   2020e:	ca9a                	sw	t1,84(sp)
   20210:	c89e                	sw	t2,80(sp)
   20212:	c6a2                	sw	s0,76(sp)
   20214:	c4a6                	sw	s1,72(sp)
   20216:	c2aa                	sw	a0,68(sp)
   20218:	c0ae                	sw	a1,64(sp)
   2021a:	de32                	sw	a2,60(sp)
   2021c:	dc36                	sw	a3,56(sp)
   2021e:	da3a                	sw	a4,52(sp)
   20220:	d83e                	sw	a5,48(sp)
   20222:	d642                	sw	a6,44(sp)
   20224:	d446                	sw	a7,40(sp)
   20226:	d24a                	sw	s2,36(sp)
   20228:	d04e                	sw	s3,32(sp)
   2022a:	ce52                	sw	s4,28(sp)
   2022c:	cc72                	sw	t3,24(sp)
   2022e:	ca76                	sw	t4,20(sp)
   20230:	c87a                	sw	t5,16(sp)
   20232:	c67e                	sw	t6,12(sp)
   20234:	342027f3          	csrr	a5,mcause
   20238:	34102473          	csrr	s0,mepc
   2023c:	8822                	mv	a6,s0
   2023e:	300029f3          	csrr	s3,mstatus
   20242:	7cb024f3          	csrr	s1,0x7cb
   20246:	7cd02973          	csrr	s2,0x7cd
   2024a:	01479713          	sll	a4,a5,0x14
   2024e:	8351                	srl	a4,a4,0x14
   20250:	0607c663          	bltz	a5,202bc <irq_handler_trap+0xb4>
   20254:	46ad                	li	a3,11
   20256:	04d70763          	beq	a4,a3,202a4 <irq_handler_trap+0x9c>
   2025a:	85c2                	mv	a1,a6
   2025c:	853e                	mv	a0,a5
   2025e:	1c6030ef          	jal	23424 <exception_handler>
   20262:	842a                	mv	s0,a0
   20264:	30099073          	csrw	mstatus,s3
   20268:	34141073          	csrw	mepc,s0
   2026c:	7cd91073          	csrw	0x7cd,s2
   20270:	7cb49073          	csrw	0x7cb,s1
   20274:	4436                	lw	s0,76(sp)
   20276:	40f6                	lw	ra,92(sp)
   20278:	42e6                	lw	t0,88(sp)
   2027a:	4356                	lw	t1,84(sp)
   2027c:	43c6                	lw	t2,80(sp)
   2027e:	44a6                	lw	s1,72(sp)
   20280:	4516                	lw	a0,68(sp)
   20282:	4586                	lw	a1,64(sp)
   20284:	5672                	lw	a2,60(sp)
   20286:	56e2                	lw	a3,56(sp)
   20288:	5752                	lw	a4,52(sp)
   2028a:	57c2                	lw	a5,48(sp)
   2028c:	5832                	lw	a6,44(sp)
   2028e:	58a2                	lw	a7,40(sp)
   20290:	5912                	lw	s2,36(sp)
   20292:	5982                	lw	s3,32(sp)
   20294:	4a72                	lw	s4,28(sp)
   20296:	4e62                	lw	t3,24(sp)
   20298:	4ed2                	lw	t4,20(sp)
   2029a:	4f42                	lw	t5,16(sp)
   2029c:	4fb2                	lw	t6,12(sp)
   2029e:	6125                	add	sp,sp,96
   202a0:	30200073          	mret
   202a4:	000237b7          	lui	a5,0x23
   202a8:	41e78793          	add	a5,a5,1054 # 2341e <syscall_handler>
   202ac:	8736                	mv	a4,a3
   202ae:	86b2                	mv	a3,a2
   202b0:	862e                	mv	a2,a1
   202b2:	85aa                	mv	a1,a0
   202b4:	8546                	mv	a0,a7
   202b6:	9782                	jalr	a5
   202b8:	0411                	add	s0,s0,4
   202ba:	b76d                	j	20264 <irq_handler_trap+0x5c>
   202bc:	469d                	li	a3,7
   202be:	00d70f63          	beq	a4,a3,202dc <irq_handler_trap+0xd4>
   202c2:	468d                	li	a3,3
   202c4:	f8d71be3          	bne	a4,a3,2025a <irq_handler_trap+0x52>
   202c8:	e6600a37          	lui	s4,0xe6600
   202cc:	004a2783          	lw	a5,4(s4) # e6600004 <__share_mem_end__+0xe5540004>
   202d0:	152030ef          	jal	23422 <swi_isr>
   202d4:	4785                	li	a5,1
   202d6:	00fa2223          	sw	a5,4(s4)
   202da:	b769                	j	20264 <irq_handler_trap+0x5c>
   202dc:	144030ef          	jal	23420 <mchtmr_isr>
   202e0:	b751                	j	20264 <irq_handler_trap+0x5c>
	...

000202e4 <board_timer_isr>:
   202e4:	f300c737          	lui	a4,0xf300c
   202e8:	20072783          	lw	a5,512(a4) # f300c200 <__share_mem_end__+0xf1f4c200>
   202ec:	8bc1                	and	a5,a5,16
   202ee:	c799                	beqz	a5,202fc <board_timer_isr+0x18>
   202f0:	47c1                	li	a5,16
   202f2:	20f72023          	sw	a5,512(a4)
   202f6:	9d81a783          	lw	a5,-1576(gp) # a01d8 <timer_cb>
   202fa:	8782                	jr	a5
   202fc:	8082                	ret
   202fe:	0001                	nop

00020300 <default_isr_52>:
   20300:	711d                	add	sp,sp,-96
   20302:	c006                	sw	ra,0(sp)
   20304:	c216                	sw	t0,4(sp)
   20306:	c41a                	sw	t1,8(sp)
   20308:	c61e                	sw	t2,12(sp)
   2030a:	c826                	sw	s1,16(sp)
   2030c:	ca2a                	sw	a0,20(sp)
   2030e:	cc2e                	sw	a1,24(sp)
   20310:	ce32                	sw	a2,28(sp)
   20312:	d036                	sw	a3,32(sp)
   20314:	d23a                	sw	a4,36(sp)
   20316:	d43e                	sw	a5,40(sp)
   20318:	d642                	sw	a6,44(sp)
   2031a:	d846                	sw	a7,48(sp)
   2031c:	da4a                	sw	s2,52(sp)
   2031e:	dc4e                	sw	s3,56(sp)
   20320:	de52                	sw	s4,60(sp)
   20322:	c0d6                	sw	s5,64(sp)
   20324:	c2da                	sw	s6,68(sp)
   20326:	c4f2                	sw	t3,72(sp)
   20328:	c6f6                	sw	t4,76(sp)
   2032a:	c8fa                	sw	t5,80(sp)
   2032c:	cafe                	sw	t6,84(sp)
   2032e:	34102973          	csrr	s2,mepc
   20332:	300029f3          	csrr	s3,mstatus
   20336:	7cb02af3          	csrr	s5,0x7cb
   2033a:	7cd02b73          	csrr	s6,0x7cd
   2033e:	30046073          	csrs	mstatus,8
   20342:	00000317          	auipc	t1,0x0
   20346:	fa230313          	add	t1,t1,-94 # 202e4 <board_timer_isr>
   2034a:	9302                	jalr	t1
   2034c:	30047073          	csrc	mstatus,8
   20350:	e4200737          	lui	a4,0xe4200
   20354:	03400693          	li	a3,52
   20358:	c354                	sw	a3,4(a4)
   2035a:	30099073          	csrw	mstatus,s3
   2035e:	34191073          	csrw	mepc,s2
   20362:	7cdb1073          	csrw	0x7cd,s6
   20366:	7cba9073          	csrw	0x7cb,s5
   2036a:	4082                	lw	ra,0(sp)
   2036c:	4292                	lw	t0,4(sp)
   2036e:	4322                	lw	t1,8(sp)
   20370:	43b2                	lw	t2,12(sp)
   20372:	44c2                	lw	s1,16(sp)
   20374:	4552                	lw	a0,20(sp)
   20376:	45e2                	lw	a1,24(sp)
   20378:	4672                	lw	a2,28(sp)
   2037a:	5682                	lw	a3,32(sp)
   2037c:	5712                	lw	a4,36(sp)
   2037e:	57a2                	lw	a5,40(sp)
   20380:	5832                	lw	a6,44(sp)
   20382:	58c2                	lw	a7,48(sp)
   20384:	5952                	lw	s2,52(sp)
   20386:	59e2                	lw	s3,56(sp)
   20388:	5a72                	lw	s4,60(sp)
   2038a:	4a86                	lw	s5,64(sp)
   2038c:	4b16                	lw	s6,68(sp)
   2038e:	4e26                	lw	t3,72(sp)
   20390:	4eb6                	lw	t4,76(sp)
   20392:	4f46                	lw	t5,80(sp)
   20394:	4fd6                	lw	t6,84(sp)
   20396:	6125                	add	sp,sp,96
   20398:	0cc0000f          	fence	io,io
   2039c:	30200073          	mret
	...

00020400 <__vector_table>:
   20400:	0208                	add	a0,sp,256
   20402:	0002                	c.slli64	zero
   20404:	0204                	add	s1,sp,256
   20406:	0002                	c.slli64	zero
   20408:	0204                	add	s1,sp,256
   2040a:	0002                	c.slli64	zero
   2040c:	0204                	add	s1,sp,256
   2040e:	0002                	c.slli64	zero
   20410:	0204                	add	s1,sp,256
   20412:	0002                	c.slli64	zero
   20414:	0204                	add	s1,sp,256
   20416:	0002                	c.slli64	zero
   20418:	0204                	add	s1,sp,256
   2041a:	0002                	c.slli64	zero
   2041c:	0204                	add	s1,sp,256
   2041e:	0002                	c.slli64	zero
   20420:	0204                	add	s1,sp,256
   20422:	0002                	c.slli64	zero
   20424:	0204                	add	s1,sp,256
   20426:	0002                	c.slli64	zero
   20428:	0204                	add	s1,sp,256
   2042a:	0002                	c.slli64	zero
   2042c:	0204                	add	s1,sp,256
   2042e:	0002                	c.slli64	zero
   20430:	0204                	add	s1,sp,256
   20432:	0002                	c.slli64	zero
   20434:	0204                	add	s1,sp,256
   20436:	0002                	c.slli64	zero
   20438:	0204                	add	s1,sp,256
   2043a:	0002                	c.slli64	zero
   2043c:	0204                	add	s1,sp,256
   2043e:	0002                	c.slli64	zero
   20440:	0204                	add	s1,sp,256
   20442:	0002                	c.slli64	zero
   20444:	0204                	add	s1,sp,256
   20446:	0002                	c.slli64	zero
   20448:	0204                	add	s1,sp,256
   2044a:	0002                	c.slli64	zero
   2044c:	0204                	add	s1,sp,256
   2044e:	0002                	c.slli64	zero
   20450:	0204                	add	s1,sp,256
   20452:	0002                	c.slli64	zero
   20454:	0204                	add	s1,sp,256
   20456:	0002                	c.slli64	zero
   20458:	0204                	add	s1,sp,256
   2045a:	0002                	c.slli64	zero
   2045c:	0204                	add	s1,sp,256
   2045e:	0002                	c.slli64	zero
   20460:	0204                	add	s1,sp,256
   20462:	0002                	c.slli64	zero
   20464:	0204                	add	s1,sp,256
   20466:	0002                	c.slli64	zero
   20468:	0204                	add	s1,sp,256
   2046a:	0002                	c.slli64	zero
   2046c:	0204                	add	s1,sp,256
   2046e:	0002                	c.slli64	zero
   20470:	0204                	add	s1,sp,256
   20472:	0002                	c.slli64	zero
   20474:	0204                	add	s1,sp,256
   20476:	0002                	c.slli64	zero
   20478:	0204                	add	s1,sp,256
   2047a:	0002                	c.slli64	zero
   2047c:	0204                	add	s1,sp,256
   2047e:	0002                	c.slli64	zero
   20480:	0204                	add	s1,sp,256
   20482:	0002                	c.slli64	zero
   20484:	0204                	add	s1,sp,256
   20486:	0002                	c.slli64	zero
   20488:	0204                	add	s1,sp,256
   2048a:	0002                	c.slli64	zero
   2048c:	0204                	add	s1,sp,256
   2048e:	0002                	c.slli64	zero
   20490:	0204                	add	s1,sp,256
   20492:	0002                	c.slli64	zero
   20494:	0204                	add	s1,sp,256
   20496:	0002                	c.slli64	zero
   20498:	0204                	add	s1,sp,256
   2049a:	0002                	c.slli64	zero
   2049c:	0204                	add	s1,sp,256
   2049e:	0002                	c.slli64	zero
   204a0:	0204                	add	s1,sp,256
   204a2:	0002                	c.slli64	zero
   204a4:	0204                	add	s1,sp,256
   204a6:	0002                	c.slli64	zero
   204a8:	0204                	add	s1,sp,256
   204aa:	0002                	c.slli64	zero
   204ac:	0204                	add	s1,sp,256
   204ae:	0002                	c.slli64	zero
   204b0:	0204                	add	s1,sp,256
   204b2:	0002                	c.slli64	zero
   204b4:	0204                	add	s1,sp,256
   204b6:	0002                	c.slli64	zero
   204b8:	0204                	add	s1,sp,256
   204ba:	0002                	c.slli64	zero
   204bc:	0204                	add	s1,sp,256
   204be:	0002                	c.slli64	zero
   204c0:	0204                	add	s1,sp,256
   204c2:	0002                	c.slli64	zero
   204c4:	0204                	add	s1,sp,256
   204c6:	0002                	c.slli64	zero
   204c8:	0204                	add	s1,sp,256
   204ca:	0002                	c.slli64	zero
   204cc:	0204                	add	s1,sp,256
   204ce:	0002                	c.slli64	zero
   204d0:	0300                	add	s0,sp,384
   204d2:	0002                	c.slli64	zero
   204d4:	0204                	add	s1,sp,256
   204d6:	0002                	c.slli64	zero
   204d8:	0204                	add	s1,sp,256
   204da:	0002                	c.slli64	zero
   204dc:	0204                	add	s1,sp,256
   204de:	0002                	c.slli64	zero
   204e0:	0204                	add	s1,sp,256
   204e2:	0002                	c.slli64	zero
   204e4:	0204                	add	s1,sp,256
   204e6:	0002                	c.slli64	zero
   204e8:	0204                	add	s1,sp,256
   204ea:	0002                	c.slli64	zero
   204ec:	0204                	add	s1,sp,256
   204ee:	0002                	c.slli64	zero
   204f0:	0204                	add	s1,sp,256
   204f2:	0002                	c.slli64	zero
   204f4:	0204                	add	s1,sp,256
   204f6:	0002                	c.slli64	zero
   204f8:	0204                	add	s1,sp,256
   204fa:	0002                	c.slli64	zero
   204fc:	0204                	add	s1,sp,256
   204fe:	0002                	c.slli64	zero
   20500:	0204                	add	s1,sp,256
   20502:	0002                	c.slli64	zero
   20504:	0204                	add	s1,sp,256
   20506:	0002                	c.slli64	zero
   20508:	0204                	add	s1,sp,256
   2050a:	0002                	c.slli64	zero
   2050c:	0204                	add	s1,sp,256
   2050e:	0002                	c.slli64	zero
   20510:	0204                	add	s1,sp,256
   20512:	0002                	c.slli64	zero
   20514:	0204                	add	s1,sp,256
   20516:	0002                	c.slli64	zero
   20518:	0204                	add	s1,sp,256
   2051a:	0002                	c.slli64	zero
   2051c:	0204                	add	s1,sp,256
   2051e:	0002                	c.slli64	zero
   20520:	0204                	add	s1,sp,256
   20522:	0002                	c.slli64	zero
   20524:	0204                	add	s1,sp,256
   20526:	0002                	c.slli64	zero
   20528:	0204                	add	s1,sp,256
   2052a:	0002                	c.slli64	zero
   2052c:	0204                	add	s1,sp,256
   2052e:	0002                	c.slli64	zero
   20530:	0204                	add	s1,sp,256
   20532:	0002                	c.slli64	zero
   20534:	0204                	add	s1,sp,256
   20536:	0002                	c.slli64	zero
   20538:	0204                	add	s1,sp,256
   2053a:	0002                	c.slli64	zero
   2053c:	0204                	add	s1,sp,256
   2053e:	0002                	c.slli64	zero
   20540:	0204                	add	s1,sp,256
   20542:	0002                	c.slli64	zero
   20544:	0204                	add	s1,sp,256
   20546:	0002                	c.slli64	zero
   20548:	0204                	add	s1,sp,256
   2054a:	0002                	c.slli64	zero
   2054c:	0204                	add	s1,sp,256
   2054e:	0002                	c.slli64	zero
   20550:	0204                	add	s1,sp,256
   20552:	0002                	c.slli64	zero
   20554:	0204                	add	s1,sp,256
   20556:	0002                	c.slli64	zero
   20558:	0204                	add	s1,sp,256
   2055a:	0002                	c.slli64	zero
   2055c:	0204                	add	s1,sp,256
   2055e:	0002                	c.slli64	zero
   20560:	0204                	add	s1,sp,256
   20562:	0002                	c.slli64	zero
   20564:	0204                	add	s1,sp,256
   20566:	0002                	c.slli64	zero
   20568:	0204                	add	s1,sp,256
   2056a:	0002                	c.slli64	zero
   2056c:	0204                	add	s1,sp,256
   2056e:	0002                	c.slli64	zero
   20570:	0204                	add	s1,sp,256
   20572:	0002                	c.slli64	zero
   20574:	0204                	add	s1,sp,256
   20576:	0002                	c.slli64	zero

00020578 <default_irq_s_handler>:
   20578:	a001                	j	20578 <default_irq_s_handler>
	...

0002057c <irq_handler_s_trap>:
   2057c:	715d                	add	sp,sp,-80
   2057e:	c686                	sw	ra,76(sp)
   20580:	c496                	sw	t0,72(sp)
   20582:	c29a                	sw	t1,68(sp)
   20584:	c09e                	sw	t2,64(sp)
   20586:	de22                	sw	s0,60(sp)
   20588:	dc26                	sw	s1,56(sp)
   2058a:	da2a                	sw	a0,52(sp)
   2058c:	d82e                	sw	a1,48(sp)
   2058e:	d632                	sw	a2,44(sp)
   20590:	d436                	sw	a3,40(sp)
   20592:	d23a                	sw	a4,36(sp)
   20594:	d03e                	sw	a5,32(sp)
   20596:	ce42                	sw	a6,28(sp)
   20598:	cc46                	sw	a7,24(sp)
   2059a:	ca72                	sw	t3,20(sp)
   2059c:	c876                	sw	t4,16(sp)
   2059e:	c67a                	sw	t5,12(sp)
   205a0:	c47e                	sw	t6,8(sp)
   205a2:	142027f3          	csrr	a5,scause
   205a6:	14102473          	csrr	s0,sepc
   205aa:	8822                	mv	a6,s0
   205ac:	100024f3          	csrr	s1,sstatus
   205b0:	3ff7f713          	and	a4,a5,1023
   205b4:	0407cf63          	bltz	a5,20612 <irq_handler_s_trap+0x96>
   205b8:	46a5                	li	a3,9
   205ba:	04d70063          	beq	a4,a3,205fa <irq_handler_s_trap+0x7e>
   205be:	85c2                	mv	a1,a6
   205c0:	853e                	mv	a0,a5
   205c2:	667020ef          	jal	23428 <exception_s_handler>
   205c6:	842a                	mv	s0,a0
   205c8:	10049073          	csrw	sstatus,s1
   205cc:	14141073          	csrw	sepc,s0
   205d0:	5472                	lw	s0,60(sp)
   205d2:	40b6                	lw	ra,76(sp)
   205d4:	42a6                	lw	t0,72(sp)
   205d6:	4316                	lw	t1,68(sp)
   205d8:	4386                	lw	t2,64(sp)
   205da:	54e2                	lw	s1,56(sp)
   205dc:	5552                	lw	a0,52(sp)
   205de:	55c2                	lw	a1,48(sp)
   205e0:	5632                	lw	a2,44(sp)
   205e2:	56a2                	lw	a3,40(sp)
   205e4:	5712                	lw	a4,36(sp)
   205e6:	5782                	lw	a5,32(sp)
   205e8:	4872                	lw	a6,28(sp)
   205ea:	48e2                	lw	a7,24(sp)
   205ec:	4e52                	lw	t3,20(sp)
   205ee:	4ec2                	lw	t4,16(sp)
   205f0:	4f32                	lw	t5,12(sp)
   205f2:	4fa2                	lw	t6,8(sp)
   205f4:	6161                	add	sp,sp,80
   205f6:	10200073          	sret
   205fa:	000237b7          	lui	a5,0x23
   205fe:	41e78793          	add	a5,a5,1054 # 2341e <syscall_handler>
   20602:	8736                	mv	a4,a3
   20604:	86b2                	mv	a3,a2
   20606:	862e                	mv	a2,a1
   20608:	85aa                	mv	a1,a0
   2060a:	8546                	mv	a0,a7
   2060c:	9782                	jalr	a5
   2060e:	0411                	add	s0,s0,4
   20610:	bf65                	j	205c8 <irq_handler_s_trap+0x4c>
   20612:	4695                	li	a3,5
   20614:	00d70f63          	beq	a4,a3,20632 <irq_handler_s_trap+0xb6>
   20618:	4685                	li	a3,1
   2061a:	fad712e3          	bne	a4,a3,205be <irq_handler_s_trap+0x42>
   2061e:	e66007b7          	lui	a5,0xe6600
   20622:	0791                	add	a5,a5,4 # e6600004 <__share_mem_end__+0xe5540004>
   20624:	439c                	lw	a5,0(a5)
   20626:	607020ef          	jal	2342c <swi_s_isr>
   2062a:	4789                	li	a5,2
   2062c:	1447b073          	csrc	sip,a5
   20630:	bf61                	j	205c8 <irq_handler_s_trap+0x4c>
   20632:	5fd020ef          	jal	2342e <mchtmr_s_isr>
   20636:	bf49                	j	205c8 <irq_handler_s_trap+0x4c>
	...

00020800 <__vector_s_table>:
   20800:	057c                	add	a5,sp,652
   20802:	0002                	c.slli64	zero
   20804:	0578                	add	a4,sp,652
   20806:	0002                	c.slli64	zero
   20808:	0578                	add	a4,sp,652
   2080a:	0002                	c.slli64	zero
   2080c:	0578                	add	a4,sp,652
   2080e:	0002                	c.slli64	zero
   20810:	0578                	add	a4,sp,652
   20812:	0002                	c.slli64	zero
   20814:	0578                	add	a4,sp,652
   20816:	0002                	c.slli64	zero
   20818:	0578                	add	a4,sp,652
   2081a:	0002                	c.slli64	zero
   2081c:	0578                	add	a4,sp,652
   2081e:	0002                	c.slli64	zero
   20820:	0578                	add	a4,sp,652
   20822:	0002                	c.slli64	zero
   20824:	0578                	add	a4,sp,652
   20826:	0002                	c.slli64	zero
   20828:	0578                	add	a4,sp,652
   2082a:	0002                	c.slli64	zero
   2082c:	0578                	add	a4,sp,652
   2082e:	0002                	c.slli64	zero
   20830:	0578                	add	a4,sp,652
   20832:	0002                	c.slli64	zero
   20834:	0578                	add	a4,sp,652
   20836:	0002                	c.slli64	zero
   20838:	0578                	add	a4,sp,652
   2083a:	0002                	c.slli64	zero
   2083c:	0578                	add	a4,sp,652
   2083e:	0002                	c.slli64	zero
   20840:	0578                	add	a4,sp,652
   20842:	0002                	c.slli64	zero
   20844:	0578                	add	a4,sp,652
   20846:	0002                	c.slli64	zero
   20848:	0578                	add	a4,sp,652
   2084a:	0002                	c.slli64	zero
   2084c:	0578                	add	a4,sp,652
   2084e:	0002                	c.slli64	zero
   20850:	0578                	add	a4,sp,652
   20852:	0002                	c.slli64	zero
   20854:	0578                	add	a4,sp,652
   20856:	0002                	c.slli64	zero
   20858:	0578                	add	a4,sp,652
   2085a:	0002                	c.slli64	zero
   2085c:	0578                	add	a4,sp,652
   2085e:	0002                	c.slli64	zero
   20860:	0578                	add	a4,sp,652
   20862:	0002                	c.slli64	zero
   20864:	0578                	add	a4,sp,652
   20866:	0002                	c.slli64	zero
   20868:	0578                	add	a4,sp,652
   2086a:	0002                	c.slli64	zero
   2086c:	0578                	add	a4,sp,652
   2086e:	0002                	c.slli64	zero
   20870:	0578                	add	a4,sp,652
   20872:	0002                	c.slli64	zero
   20874:	0578                	add	a4,sp,652
   20876:	0002                	c.slli64	zero
   20878:	0578                	add	a4,sp,652
   2087a:	0002                	c.slli64	zero
   2087c:	0578                	add	a4,sp,652
   2087e:	0002                	c.slli64	zero
   20880:	0578                	add	a4,sp,652
   20882:	0002                	c.slli64	zero
   20884:	0578                	add	a4,sp,652
   20886:	0002                	c.slli64	zero
   20888:	0578                	add	a4,sp,652
   2088a:	0002                	c.slli64	zero
   2088c:	0578                	add	a4,sp,652
   2088e:	0002                	c.slli64	zero
   20890:	0578                	add	a4,sp,652
   20892:	0002                	c.slli64	zero
   20894:	0578                	add	a4,sp,652
   20896:	0002                	c.slli64	zero
   20898:	0578                	add	a4,sp,652
   2089a:	0002                	c.slli64	zero
   2089c:	0578                	add	a4,sp,652
   2089e:	0002                	c.slli64	zero
   208a0:	0578                	add	a4,sp,652
   208a2:	0002                	c.slli64	zero
   208a4:	0578                	add	a4,sp,652
   208a6:	0002                	c.slli64	zero
   208a8:	0578                	add	a4,sp,652
   208aa:	0002                	c.slli64	zero
   208ac:	0578                	add	a4,sp,652
   208ae:	0002                	c.slli64	zero
   208b0:	0578                	add	a4,sp,652
   208b2:	0002                	c.slli64	zero
   208b4:	0578                	add	a4,sp,652
   208b6:	0002                	c.slli64	zero
   208b8:	0578                	add	a4,sp,652
   208ba:	0002                	c.slli64	zero
   208bc:	0578                	add	a4,sp,652
   208be:	0002                	c.slli64	zero
   208c0:	0578                	add	a4,sp,652
   208c2:	0002                	c.slli64	zero
   208c4:	0578                	add	a4,sp,652
   208c6:	0002                	c.slli64	zero
   208c8:	0578                	add	a4,sp,652
   208ca:	0002                	c.slli64	zero
   208cc:	0578                	add	a4,sp,652
   208ce:	0002                	c.slli64	zero
   208d0:	0578                	add	a4,sp,652
   208d2:	0002                	c.slli64	zero
   208d4:	0578                	add	a4,sp,652
   208d6:	0002                	c.slli64	zero
   208d8:	0578                	add	a4,sp,652
   208da:	0002                	c.slli64	zero
   208dc:	0578                	add	a4,sp,652
   208de:	0002                	c.slli64	zero
   208e0:	0578                	add	a4,sp,652
   208e2:	0002                	c.slli64	zero
   208e4:	0578                	add	a4,sp,652
   208e6:	0002                	c.slli64	zero
   208e8:	0578                	add	a4,sp,652
   208ea:	0002                	c.slli64	zero
   208ec:	0578                	add	a4,sp,652
   208ee:	0002                	c.slli64	zero
   208f0:	0578                	add	a4,sp,652
   208f2:	0002                	c.slli64	zero
   208f4:	0578                	add	a4,sp,652
   208f6:	0002                	c.slli64	zero
   208f8:	0578                	add	a4,sp,652
   208fa:	0002                	c.slli64	zero
   208fc:	0578                	add	a4,sp,652
   208fe:	0002                	c.slli64	zero
   20900:	0578                	add	a4,sp,652
   20902:	0002                	c.slli64	zero
   20904:	0578                	add	a4,sp,652
   20906:	0002                	c.slli64	zero
   20908:	0578                	add	a4,sp,652
   2090a:	0002                	c.slli64	zero
   2090c:	0578                	add	a4,sp,652
   2090e:	0002                	c.slli64	zero
   20910:	0578                	add	a4,sp,652
   20912:	0002                	c.slli64	zero
   20914:	0578                	add	a4,sp,652
   20916:	0002                	c.slli64	zero
   20918:	0578                	add	a4,sp,652
   2091a:	0002                	c.slli64	zero
   2091c:	0578                	add	a4,sp,652
   2091e:	0002                	c.slli64	zero
   20920:	0578                	add	a4,sp,652
   20922:	0002                	c.slli64	zero
   20924:	0578                	add	a4,sp,652
   20926:	0002                	c.slli64	zero
   20928:	0578                	add	a4,sp,652
   2092a:	0002                	c.slli64	zero
   2092c:	0578                	add	a4,sp,652
   2092e:	0002                	c.slli64	zero
   20930:	0578                	add	a4,sp,652
   20932:	0002                	c.slli64	zero
   20934:	0578                	add	a4,sp,652
   20936:	0002                	c.slli64	zero
   20938:	0578                	add	a4,sp,652
   2093a:	0002                	c.slli64	zero
   2093c:	0578                	add	a4,sp,652
   2093e:	0002                	c.slli64	zero
   20940:	0578                	add	a4,sp,652
   20942:	0002                	c.slli64	zero
   20944:	0578                	add	a4,sp,652
   20946:	0002                	c.slli64	zero
   20948:	0578                	add	a4,sp,652
   2094a:	0002                	c.slli64	zero
   2094c:	0578                	add	a4,sp,652
   2094e:	0002                	c.slli64	zero
   20950:	0578                	add	a4,sp,652
   20952:	0002                	c.slli64	zero
   20954:	0578                	add	a4,sp,652
   20956:	0002                	c.slli64	zero
   20958:	0578                	add	a4,sp,652
   2095a:	0002                	c.slli64	zero
   2095c:	0578                	add	a4,sp,652
   2095e:	0002                	c.slli64	zero
   20960:	0578                	add	a4,sp,652
   20962:	0002                	c.slli64	zero
   20964:	0578                	add	a4,sp,652
   20966:	0002                	c.slli64	zero
   20968:	0578                	add	a4,sp,652
   2096a:	0002                	c.slli64	zero
   2096c:	0578                	add	a4,sp,652
   2096e:	0002                	c.slli64	zero
   20970:	0578                	add	a4,sp,652
   20972:	0002                	c.slli64	zero
   20974:	0578                	add	a4,sp,652
   20976:	0002                	c.slli64	zero

Disassembly of section .text:

00020978 <__udivdi3>:
   20978:	88aa                	mv	a7,a0
   2097a:	832e                	mv	t1,a1
   2097c:	8732                	mv	a4,a2
   2097e:	882a                	mv	a6,a0
   20980:	87ae                	mv	a5,a1
   20982:	20069663          	bnez	a3,20b8e <__udivdi3+0x216>
   20986:	000295b7          	lui	a1,0x29
   2098a:	46058593          	add	a1,a1,1120 # 29460 <__clz_tab>
   2098e:	0cc37163          	bgeu	t1,a2,20a50 <__udivdi3+0xd8>
   20992:	66c1                	lui	a3,0x10
   20994:	0ad67763          	bgeu	a2,a3,20a42 <__udivdi3+0xca>
   20998:	10063693          	sltiu	a3,a2,256
   2099c:	0016b693          	seqz	a3,a3
   209a0:	068e                	sll	a3,a3,0x3
   209a2:	00d65533          	srl	a0,a2,a3
   209a6:	95aa                	add	a1,a1,a0
   209a8:	0005c583          	lbu	a1,0(a1)
   209ac:	02000513          	li	a0,32
   209b0:	96ae                	add	a3,a3,a1
   209b2:	40d505b3          	sub	a1,a0,a3
   209b6:	00d50b63          	beq	a0,a3,209cc <__udivdi3+0x54>
   209ba:	00b317b3          	sll	a5,t1,a1
   209be:	00d8d6b3          	srl	a3,a7,a3
   209c2:	00b61733          	sll	a4,a2,a1
   209c6:	8fd5                	or	a5,a5,a3
   209c8:	00b89833          	sll	a6,a7,a1
   209cc:	01075593          	srl	a1,a4,0x10
   209d0:	02b7d333          	divu	t1,a5,a1
   209d4:	01071613          	sll	a2,a4,0x10
   209d8:	8241                	srl	a2,a2,0x10
   209da:	02b7f7b3          	remu	a5,a5,a1
   209de:	851a                	mv	a0,t1
   209e0:	026608b3          	mul	a7,a2,t1
   209e4:	01079693          	sll	a3,a5,0x10
   209e8:	01085793          	srl	a5,a6,0x10
   209ec:	8fd5                	or	a5,a5,a3
   209ee:	0117fc63          	bgeu	a5,a7,20a06 <__udivdi3+0x8e>
   209f2:	97ba                	add	a5,a5,a4
   209f4:	fff30513          	add	a0,t1,-1
   209f8:	00e7e763          	bltu	a5,a4,20a06 <__udivdi3+0x8e>
   209fc:	0117f563          	bgeu	a5,a7,20a06 <__udivdi3+0x8e>
   20a00:	ffe30513          	add	a0,t1,-2
   20a04:	97ba                	add	a5,a5,a4
   20a06:	411787b3          	sub	a5,a5,a7
   20a0a:	02b7d8b3          	divu	a7,a5,a1
   20a0e:	0842                	sll	a6,a6,0x10
   20a10:	01085813          	srl	a6,a6,0x10
   20a14:	02b7f7b3          	remu	a5,a5,a1
   20a18:	031606b3          	mul	a3,a2,a7
   20a1c:	07c2                	sll	a5,a5,0x10
   20a1e:	00f86833          	or	a6,a6,a5
   20a22:	87c6                	mv	a5,a7
   20a24:	00d87b63          	bgeu	a6,a3,20a3a <__udivdi3+0xc2>
   20a28:	983a                	add	a6,a6,a4
   20a2a:	fff88793          	add	a5,a7,-1
   20a2e:	00e86663          	bltu	a6,a4,20a3a <__udivdi3+0xc2>
   20a32:	00d87463          	bgeu	a6,a3,20a3a <__udivdi3+0xc2>
   20a36:	ffe88793          	add	a5,a7,-2
   20a3a:	0542                	sll	a0,a0,0x10
   20a3c:	8d5d                	or	a0,a0,a5
   20a3e:	4581                	li	a1,0
   20a40:	8082                	ret
   20a42:	01000537          	lui	a0,0x1000
   20a46:	46e1                	li	a3,24
   20a48:	f4a67de3          	bgeu	a2,a0,209a2 <__udivdi3+0x2a>
   20a4c:	46c1                	li	a3,16
   20a4e:	bf91                	j	209a2 <__udivdi3+0x2a>
   20a50:	4681                	li	a3,0
   20a52:	ca09                	beqz	a2,20a64 <__udivdi3+0xec>
   20a54:	67c1                	lui	a5,0x10
   20a56:	08f67f63          	bgeu	a2,a5,20af4 <__udivdi3+0x17c>
   20a5a:	10063693          	sltiu	a3,a2,256
   20a5e:	0016b693          	seqz	a3,a3
   20a62:	068e                	sll	a3,a3,0x3
   20a64:	00d657b3          	srl	a5,a2,a3
   20a68:	95be                	add	a1,a1,a5
   20a6a:	0005c783          	lbu	a5,0(a1)
   20a6e:	97b6                	add	a5,a5,a3
   20a70:	02000693          	li	a3,32
   20a74:	40f685b3          	sub	a1,a3,a5
   20a78:	08f69563          	bne	a3,a5,20b02 <__udivdi3+0x18a>
   20a7c:	40c307b3          	sub	a5,t1,a2
   20a80:	4585                	li	a1,1
   20a82:	01075893          	srl	a7,a4,0x10
   20a86:	0317de33          	divu	t3,a5,a7
   20a8a:	01071613          	sll	a2,a4,0x10
   20a8e:	8241                	srl	a2,a2,0x10
   20a90:	01085693          	srl	a3,a6,0x10
   20a94:	0317f7b3          	remu	a5,a5,a7
   20a98:	8572                	mv	a0,t3
   20a9a:	03c60333          	mul	t1,a2,t3
   20a9e:	07c2                	sll	a5,a5,0x10
   20aa0:	8fd5                	or	a5,a5,a3
   20aa2:	0067fc63          	bgeu	a5,t1,20aba <__udivdi3+0x142>
   20aa6:	97ba                	add	a5,a5,a4
   20aa8:	fffe0513          	add	a0,t3,-1
   20aac:	00e7e763          	bltu	a5,a4,20aba <__udivdi3+0x142>
   20ab0:	0067f563          	bgeu	a5,t1,20aba <__udivdi3+0x142>
   20ab4:	ffee0513          	add	a0,t3,-2
   20ab8:	97ba                	add	a5,a5,a4
   20aba:	406787b3          	sub	a5,a5,t1
   20abe:	0317d333          	divu	t1,a5,a7
   20ac2:	0842                	sll	a6,a6,0x10
   20ac4:	01085813          	srl	a6,a6,0x10
   20ac8:	0317f7b3          	remu	a5,a5,a7
   20acc:	026606b3          	mul	a3,a2,t1
   20ad0:	07c2                	sll	a5,a5,0x10
   20ad2:	00f86833          	or	a6,a6,a5
   20ad6:	879a                	mv	a5,t1
   20ad8:	00d87b63          	bgeu	a6,a3,20aee <__udivdi3+0x176>
   20adc:	983a                	add	a6,a6,a4
   20ade:	fff30793          	add	a5,t1,-1
   20ae2:	00e86663          	bltu	a6,a4,20aee <__udivdi3+0x176>
   20ae6:	00d87463          	bgeu	a6,a3,20aee <__udivdi3+0x176>
   20aea:	ffe30793          	add	a5,t1,-2
   20aee:	0542                	sll	a0,a0,0x10
   20af0:	8d5d                	or	a0,a0,a5
   20af2:	8082                	ret
   20af4:	010007b7          	lui	a5,0x1000
   20af8:	46e1                	li	a3,24
   20afa:	f6f675e3          	bgeu	a2,a5,20a64 <__udivdi3+0xec>
   20afe:	46c1                	li	a3,16
   20b00:	b795                	j	20a64 <__udivdi3+0xec>
   20b02:	00b61733          	sll	a4,a2,a1
   20b06:	00f356b3          	srl	a3,t1,a5
   20b0a:	01075513          	srl	a0,a4,0x10
   20b0e:	00b31333          	sll	t1,t1,a1
   20b12:	00f8d7b3          	srl	a5,a7,a5
   20b16:	0067e7b3          	or	a5,a5,t1
   20b1a:	02a6d333          	divu	t1,a3,a0
   20b1e:	01071613          	sll	a2,a4,0x10
   20b22:	8241                	srl	a2,a2,0x10
   20b24:	00b89833          	sll	a6,a7,a1
   20b28:	02a6f6b3          	remu	a3,a3,a0
   20b2c:	026608b3          	mul	a7,a2,t1
   20b30:	01069593          	sll	a1,a3,0x10
   20b34:	0107d693          	srl	a3,a5,0x10
   20b38:	8ecd                	or	a3,a3,a1
   20b3a:	859a                	mv	a1,t1
   20b3c:	0116fc63          	bgeu	a3,a7,20b54 <__udivdi3+0x1dc>
   20b40:	96ba                	add	a3,a3,a4
   20b42:	fff30593          	add	a1,t1,-1
   20b46:	00e6e763          	bltu	a3,a4,20b54 <__udivdi3+0x1dc>
   20b4a:	0116f563          	bgeu	a3,a7,20b54 <__udivdi3+0x1dc>
   20b4e:	ffe30593          	add	a1,t1,-2
   20b52:	96ba                	add	a3,a3,a4
   20b54:	411686b3          	sub	a3,a3,a7
   20b58:	02a6d8b3          	divu	a7,a3,a0
   20b5c:	07c2                	sll	a5,a5,0x10
   20b5e:	83c1                	srl	a5,a5,0x10
   20b60:	02a6f6b3          	remu	a3,a3,a0
   20b64:	03160633          	mul	a2,a2,a7
   20b68:	06c2                	sll	a3,a3,0x10
   20b6a:	8fd5                	or	a5,a5,a3
   20b6c:	86c6                	mv	a3,a7
   20b6e:	00c7fc63          	bgeu	a5,a2,20b86 <__udivdi3+0x20e>
   20b72:	97ba                	add	a5,a5,a4
   20b74:	fff88693          	add	a3,a7,-1
   20b78:	00e7e763          	bltu	a5,a4,20b86 <__udivdi3+0x20e>
   20b7c:	00c7f563          	bgeu	a5,a2,20b86 <__udivdi3+0x20e>
   20b80:	ffe88693          	add	a3,a7,-2
   20b84:	97ba                	add	a5,a5,a4
   20b86:	05c2                	sll	a1,a1,0x10
   20b88:	8f91                	sub	a5,a5,a2
   20b8a:	8dd5                	or	a1,a1,a3
   20b8c:	bddd                	j	20a82 <__udivdi3+0x10a>
   20b8e:	14d5e163          	bltu	a1,a3,20cd0 <__udivdi3+0x358>
   20b92:	67c1                	lui	a5,0x10
   20b94:	02f6ff63          	bgeu	a3,a5,20bd2 <__udivdi3+0x25a>
   20b98:	1006b713          	sltiu	a4,a3,256
   20b9c:	00173713          	seqz	a4,a4
   20ba0:	070e                	sll	a4,a4,0x3
   20ba2:	000297b7          	lui	a5,0x29
   20ba6:	00e6d5b3          	srl	a1,a3,a4
   20baa:	46078793          	add	a5,a5,1120 # 29460 <__clz_tab>
   20bae:	97ae                	add	a5,a5,a1
   20bb0:	0007c783          	lbu	a5,0(a5)
   20bb4:	97ba                	add	a5,a5,a4
   20bb6:	02000713          	li	a4,32
   20bba:	40f705b3          	sub	a1,a4,a5
   20bbe:	02f71163          	bne	a4,a5,20be0 <__udivdi3+0x268>
   20bc2:	4505                	li	a0,1
   20bc4:	e666eee3          	bltu	a3,t1,20a40 <__udivdi3+0xc8>
   20bc8:	00c8b533          	sltu	a0,a7,a2
   20bcc:	00153513          	seqz	a0,a0
   20bd0:	8082                	ret
   20bd2:	010007b7          	lui	a5,0x1000
   20bd6:	4761                	li	a4,24
   20bd8:	fcf6f5e3          	bgeu	a3,a5,20ba2 <__udivdi3+0x22a>
   20bdc:	4741                	li	a4,16
   20bde:	b7d1                	j	20ba2 <__udivdi3+0x22a>
   20be0:	00f65733          	srl	a4,a2,a5
   20be4:	00b696b3          	sll	a3,a3,a1
   20be8:	8ed9                	or	a3,a3,a4
   20bea:	00f35733          	srl	a4,t1,a5
   20bee:	00b31333          	sll	t1,t1,a1
   20bf2:	00f8d7b3          	srl	a5,a7,a5
   20bf6:	0067e7b3          	or	a5,a5,t1
   20bfa:	0106d313          	srl	t1,a3,0x10
   20bfe:	02675eb3          	divu	t4,a4,t1
   20c02:	01069813          	sll	a6,a3,0x10
   20c06:	01085813          	srl	a6,a6,0x10
   20c0a:	00b61633          	sll	a2,a2,a1
   20c0e:	02677733          	remu	a4,a4,t1
   20c12:	03d80e33          	mul	t3,a6,t4
   20c16:	01071513          	sll	a0,a4,0x10
   20c1a:	0107d713          	srl	a4,a5,0x10
   20c1e:	8f49                	or	a4,a4,a0
   20c20:	8576                	mv	a0,t4
   20c22:	01c77c63          	bgeu	a4,t3,20c3a <__udivdi3+0x2c2>
   20c26:	9736                	add	a4,a4,a3
   20c28:	fffe8513          	add	a0,t4,-1
   20c2c:	00d76763          	bltu	a4,a3,20c3a <__udivdi3+0x2c2>
   20c30:	01c77563          	bgeu	a4,t3,20c3a <__udivdi3+0x2c2>
   20c34:	ffee8513          	add	a0,t4,-2
   20c38:	9736                	add	a4,a4,a3
   20c3a:	41c70733          	sub	a4,a4,t3
   20c3e:	02675e33          	divu	t3,a4,t1
   20c42:	07c2                	sll	a5,a5,0x10
   20c44:	83c1                	srl	a5,a5,0x10
   20c46:	02677733          	remu	a4,a4,t1
   20c4a:	03c80833          	mul	a6,a6,t3
   20c4e:	0742                	sll	a4,a4,0x10
   20c50:	8fd9                	or	a5,a5,a4
   20c52:	8772                	mv	a4,t3
   20c54:	0107fc63          	bgeu	a5,a6,20c6c <__udivdi3+0x2f4>
   20c58:	97b6                	add	a5,a5,a3
   20c5a:	fffe0713          	add	a4,t3,-1
   20c5e:	00d7e763          	bltu	a5,a3,20c6c <__udivdi3+0x2f4>
   20c62:	0107f563          	bgeu	a5,a6,20c6c <__udivdi3+0x2f4>
   20c66:	ffee0713          	add	a4,t3,-2
   20c6a:	97b6                	add	a5,a5,a3
   20c6c:	0542                	sll	a0,a0,0x10
   20c6e:	6e41                	lui	t3,0x10
   20c70:	8d59                	or	a0,a0,a4
   20c72:	fffe0693          	add	a3,t3,-1 # ffff <__fw_size__+0x62ef>
   20c76:	00d57733          	and	a4,a0,a3
   20c7a:	410787b3          	sub	a5,a5,a6
   20c7e:	8ef1                	and	a3,a3,a2
   20c80:	01055813          	srl	a6,a0,0x10
   20c84:	8241                	srl	a2,a2,0x10
   20c86:	02d70333          	mul	t1,a4,a3
   20c8a:	02d806b3          	mul	a3,a6,a3
   20c8e:	02c70733          	mul	a4,a4,a2
   20c92:	02c80833          	mul	a6,a6,a2
   20c96:	00d70633          	add	a2,a4,a3
   20c9a:	01035713          	srl	a4,t1,0x10
   20c9e:	9732                	add	a4,a4,a2
   20ca0:	00d77363          	bgeu	a4,a3,20ca6 <__udivdi3+0x32e>
   20ca4:	9872                	add	a6,a6,t3
   20ca6:	01075693          	srl	a3,a4,0x10
   20caa:	96c2                	add	a3,a3,a6
   20cac:	02d7e063          	bltu	a5,a3,20ccc <__udivdi3+0x354>
   20cb0:	d8d797e3          	bne	a5,a3,20a3e <__udivdi3+0xc6>
   20cb4:	67c1                	lui	a5,0x10
   20cb6:	17fd                	add	a5,a5,-1 # ffff <__fw_size__+0x62ef>
   20cb8:	8f7d                	and	a4,a4,a5
   20cba:	0742                	sll	a4,a4,0x10
   20cbc:	00f37333          	and	t1,t1,a5
   20cc0:	00b898b3          	sll	a7,a7,a1
   20cc4:	971a                	add	a4,a4,t1
   20cc6:	4581                	li	a1,0
   20cc8:	d6e8fce3          	bgeu	a7,a4,20a40 <__udivdi3+0xc8>
   20ccc:	157d                	add	a0,a0,-1 # ffffff <__noncacheable_end__+0xf3ffff>
   20cce:	bb85                	j	20a3e <__udivdi3+0xc6>
   20cd0:	4581                	li	a1,0
   20cd2:	4501                	li	a0,0
   20cd4:	8082                	ret

00020cd6 <__divdf3>:
   20cd6:	7179                	add	sp,sp,-48
   20cd8:	0145d813          	srl	a6,a1,0x14
   20cdc:	d226                	sw	s1,36(sp)
   20cde:	d04a                	sw	s2,32(sp)
   20ce0:	ce4e                	sw	s3,28(sp)
   20ce2:	c85a                	sw	s6,16(sp)
   20ce4:	c65e                	sw	s7,12(sp)
   20ce6:	00c59493          	sll	s1,a1,0xc
   20cea:	d606                	sw	ra,44(sp)
   20cec:	d422                	sw	s0,40(sp)
   20cee:	cc52                	sw	s4,24(sp)
   20cf0:	ca56                	sw	s5,20(sp)
   20cf2:	7ff87813          	and	a6,a6,2047
   20cf6:	8b2a                	mv	s6,a0
   20cf8:	8bb2                	mv	s7,a2
   20cfa:	8936                	mv	s2,a3
   20cfc:	80b1                	srl	s1,s1,0xc
   20cfe:	01f5d993          	srl	s3,a1,0x1f
   20d02:	08080163          	beqz	a6,20d84 <__divdf3+0xae>
   20d06:	7ff00793          	li	a5,2047
   20d0a:	0cf80863          	beq	a6,a5,20dda <__divdf3+0x104>
   20d0e:	01d55a13          	srl	s4,a0,0x1d
   20d12:	048e                	sll	s1,s1,0x3
   20d14:	009a6a33          	or	s4,s4,s1
   20d18:	008007b7          	lui	a5,0x800
   20d1c:	00fa6a33          	or	s4,s4,a5
   20d20:	00351413          	sll	s0,a0,0x3
   20d24:	c0180a93          	add	s5,a6,-1023
   20d28:	4b01                	li	s6,0
   20d2a:	01495713          	srl	a4,s2,0x14
   20d2e:	00c91493          	sll	s1,s2,0xc
   20d32:	7ff77713          	and	a4,a4,2047
   20d36:	80b1                	srl	s1,s1,0xc
   20d38:	01f95913          	srl	s2,s2,0x1f
   20d3c:	c371                	beqz	a4,20e00 <__divdf3+0x12a>
   20d3e:	7ff00793          	li	a5,2047
   20d42:	10f70963          	beq	a4,a5,20e54 <__divdf3+0x17e>
   20d46:	048e                	sll	s1,s1,0x3
   20d48:	01dbd793          	srl	a5,s7,0x1d
   20d4c:	8fc5                	or	a5,a5,s1
   20d4e:	008004b7          	lui	s1,0x800
   20d52:	8cdd                	or	s1,s1,a5
   20d54:	003b9f13          	sll	t5,s7,0x3
   20d58:	c0170713          	add	a4,a4,-1023 # e41ffc01 <__share_mem_end__+0xe313fc01>
   20d5c:	4781                	li	a5,0
   20d5e:	40ea8833          	sub	a6,s5,a4
   20d62:	002b1713          	sll	a4,s6,0x2
   20d66:	8f5d                	or	a4,a4,a5
   20d68:	177d                	add	a4,a4,-1
   20d6a:	46b9                	li	a3,14
   20d6c:	0129c633          	xor	a2,s3,s2
   20d70:	10e6e463          	bltu	a3,a4,20e78 <__divdf3+0x1a2>
   20d74:	000296b7          	lui	a3,0x29
   20d78:	070a                	sll	a4,a4,0x2
   20d7a:	42468693          	add	a3,a3,1060 # 29424 <_lseek+0x2c>
   20d7e:	9736                	add	a4,a4,a3
   20d80:	4318                	lw	a4,0(a4)
   20d82:	8702                	jr	a4
   20d84:	00a4ea33          	or	s4,s1,a0
   20d88:	060a0263          	beqz	s4,20dec <__divdf3+0x116>
   20d8c:	c88d                	beqz	s1,20dbe <__divdf3+0xe8>
   20d8e:	8526                	mv	a0,s1
   20d90:	7d7000ef          	jal	21d66 <__clzsi2>
   20d94:	ff550793          	add	a5,a0,-11
   20d98:	4a75                	li	s4,29
   20d9a:	ff850713          	add	a4,a0,-8
   20d9e:	40fa0a33          	sub	s4,s4,a5
   20da2:	00e494b3          	sll	s1,s1,a4
   20da6:	014b5a33          	srl	s4,s6,s4
   20daa:	009a6a33          	or	s4,s4,s1
   20dae:	00eb14b3          	sll	s1,s6,a4
   20db2:	c0d00813          	li	a6,-1011
   20db6:	40a80ab3          	sub	s5,a6,a0
   20dba:	8426                	mv	s0,s1
   20dbc:	b7b5                	j	20d28 <__divdf3+0x52>
   20dbe:	7a9000ef          	jal	21d66 <__clzsi2>
   20dc2:	8a2a                	mv	s4,a0
   20dc4:	015a0793          	add	a5,s4,21
   20dc8:	4771                	li	a4,28
   20dca:	02050513          	add	a0,a0,32
   20dce:	fcf755e3          	bge	a4,a5,20d98 <__divdf3+0xc2>
   20dd2:	1a61                	add	s4,s4,-8
   20dd4:	014b1a33          	sll	s4,s6,s4
   20dd8:	bfe9                	j	20db2 <__divdf3+0xdc>
   20dda:	00a4ea33          	or	s4,s1,a0
   20dde:	000a1b63          	bnez	s4,20df4 <__divdf3+0x11e>
   20de2:	4401                	li	s0,0
   20de4:	7ff00a93          	li	s5,2047
   20de8:	4b09                	li	s6,2
   20dea:	b781                	j	20d2a <__divdf3+0x54>
   20dec:	4401                	li	s0,0
   20dee:	4a81                	li	s5,0
   20df0:	4b05                	li	s6,1
   20df2:	bf25                	j	20d2a <__divdf3+0x54>
   20df4:	842a                	mv	s0,a0
   20df6:	8a26                	mv	s4,s1
   20df8:	7ff00a93          	li	s5,2047
   20dfc:	4b0d                	li	s6,3
   20dfe:	b735                	j	20d2a <__divdf3+0x54>
   20e00:	0174ef33          	or	t5,s1,s7
   20e04:	060f0163          	beqz	t5,20e66 <__divdf3+0x190>
   20e08:	c49d                	beqz	s1,20e36 <__divdf3+0x160>
   20e0a:	8526                	mv	a0,s1
   20e0c:	75b000ef          	jal	21d66 <__clzsi2>
   20e10:	ff550713          	add	a4,a0,-11
   20e14:	47f5                	li	a5,29
   20e16:	ff850693          	add	a3,a0,-8
   20e1a:	8f99                	sub	a5,a5,a4
   20e1c:	00d494b3          	sll	s1,s1,a3
   20e20:	00fbd7b3          	srl	a5,s7,a5
   20e24:	8fc5                	or	a5,a5,s1
   20e26:	00db94b3          	sll	s1,s7,a3
   20e2a:	c0d00713          	li	a4,-1011
   20e2e:	8f26                	mv	t5,s1
   20e30:	8f09                	sub	a4,a4,a0
   20e32:	84be                	mv	s1,a5
   20e34:	b725                	j	20d5c <__divdf3+0x86>
   20e36:	855e                	mv	a0,s7
   20e38:	72f000ef          	jal	21d66 <__clzsi2>
   20e3c:	87aa                	mv	a5,a0
   20e3e:	01578713          	add	a4,a5,21 # 800015 <__noncacheable_end__+0x740015>
   20e42:	46f1                	li	a3,28
   20e44:	02050513          	add	a0,a0,32
   20e48:	fce6d6e3          	bge	a3,a4,20e14 <__divdf3+0x13e>
   20e4c:	17e1                	add	a5,a5,-8
   20e4e:	00fb97b3          	sll	a5,s7,a5
   20e52:	bfe1                	j	20e2a <__divdf3+0x154>
   20e54:	0174ef33          	or	t5,s1,s7
   20e58:	000f1b63          	bnez	t5,20e6e <__divdf3+0x198>
   20e5c:	4481                	li	s1,0
   20e5e:	7ff00713          	li	a4,2047
   20e62:	4789                	li	a5,2
   20e64:	bded                	j	20d5e <__divdf3+0x88>
   20e66:	4481                	li	s1,0
   20e68:	4701                	li	a4,0
   20e6a:	4785                	li	a5,1
   20e6c:	bdcd                	j	20d5e <__divdf3+0x88>
   20e6e:	8f5e                	mv	t5,s7
   20e70:	7ff00713          	li	a4,2047
   20e74:	478d                	li	a5,3
   20e76:	b5e5                	j	20d5e <__divdf3+0x88>
   20e78:	0144e663          	bltu	s1,s4,20e84 <__divdf3+0x1ae>
   20e7c:	2a9a1a63          	bne	s4,s1,21130 <__divdf3+0x45a>
   20e80:	2be46863          	bltu	s0,t5,21130 <__divdf3+0x45a>
   20e84:	01fa1693          	sll	a3,s4,0x1f
   20e88:	00145793          	srl	a5,s0,0x1
   20e8c:	01f41713          	sll	a4,s0,0x1f
   20e90:	001a5a13          	srl	s4,s4,0x1
   20e94:	00f6e433          	or	s0,a3,a5
   20e98:	00849893          	sll	a7,s1,0x8
   20e9c:	018f5593          	srl	a1,t5,0x18
   20ea0:	0115e5b3          	or	a1,a1,a7
   20ea4:	0108d893          	srl	a7,a7,0x10
   20ea8:	031a5eb3          	divu	t4,s4,a7
   20eac:	01059313          	sll	t1,a1,0x10
   20eb0:	01035313          	srl	t1,t1,0x10
   20eb4:	01045793          	srl	a5,s0,0x10
   20eb8:	008f1513          	sll	a0,t5,0x8
   20ebc:	031a7a33          	remu	s4,s4,a7
   20ec0:	86f6                	mv	a3,t4
   20ec2:	03d30e33          	mul	t3,t1,t4
   20ec6:	0a42                	sll	s4,s4,0x10
   20ec8:	0147e7b3          	or	a5,a5,s4
   20ecc:	01c7fc63          	bgeu	a5,t3,20ee4 <__divdf3+0x20e>
   20ed0:	97ae                	add	a5,a5,a1
   20ed2:	fffe8693          	add	a3,t4,-1
   20ed6:	00b7e763          	bltu	a5,a1,20ee4 <__divdf3+0x20e>
   20eda:	01c7f563          	bgeu	a5,t3,20ee4 <__divdf3+0x20e>
   20ede:	ffee8693          	add	a3,t4,-2
   20ee2:	97ae                	add	a5,a5,a1
   20ee4:	41c787b3          	sub	a5,a5,t3
   20ee8:	0317df33          	divu	t5,a5,a7
   20eec:	0442                	sll	s0,s0,0x10
   20eee:	8041                	srl	s0,s0,0x10
   20ef0:	0317f7b3          	remu	a5,a5,a7
   20ef4:	8e7a                	mv	t3,t5
   20ef6:	03e30eb3          	mul	t4,t1,t5
   20efa:	07c2                	sll	a5,a5,0x10
   20efc:	8fc1                	or	a5,a5,s0
   20efe:	01d7fc63          	bgeu	a5,t4,20f16 <__divdf3+0x240>
   20f02:	97ae                	add	a5,a5,a1
   20f04:	ffff0e13          	add	t3,t5,-1
   20f08:	00b7e763          	bltu	a5,a1,20f16 <__divdf3+0x240>
   20f0c:	01d7f563          	bgeu	a5,t4,20f16 <__divdf3+0x240>
   20f10:	ffef0e13          	add	t3,t5,-2
   20f14:	97ae                	add	a5,a5,a1
   20f16:	06c2                	sll	a3,a3,0x10
   20f18:	6441                	lui	s0,0x10
   20f1a:	01c6e2b3          	or	t0,a3,t3
   20f1e:	fff40e13          	add	t3,s0,-1 # ffff <__fw_size__+0x62ef>
   20f22:	01c2f6b3          	and	a3,t0,t3
   20f26:	0102df93          	srl	t6,t0,0x10
   20f2a:	01c57e33          	and	t3,a0,t3
   20f2e:	41d787b3          	sub	a5,a5,t4
   20f32:	01055e93          	srl	t4,a0,0x10
   20f36:	02de03b3          	mul	t2,t3,a3
   20f3a:	03cf84b3          	mul	s1,t6,t3
   20f3e:	02de86b3          	mul	a3,t4,a3
   20f42:	00968f33          	add	t5,a3,s1
   20f46:	0103d693          	srl	a3,t2,0x10
   20f4a:	96fa                	add	a3,a3,t5
   20f4c:	03df8fb3          	mul	t6,t6,t4
   20f50:	0096f363          	bgeu	a3,s1,20f56 <__divdf3+0x280>
   20f54:	9fa2                	add	t6,t6,s0
   20f56:	0106df13          	srl	t5,a3,0x10
   20f5a:	9f7e                	add	t5,t5,t6
   20f5c:	6fc1                	lui	t6,0x10
   20f5e:	1ffd                	add	t6,t6,-1 # ffff <__fw_size__+0x62ef>
   20f60:	01f6f6b3          	and	a3,a3,t6
   20f64:	06c2                	sll	a3,a3,0x10
   20f66:	01f3f3b3          	and	t2,t2,t6
   20f6a:	969e                	add	a3,a3,t2
   20f6c:	01e7e763          	bltu	a5,t5,20f7a <__divdf3+0x2a4>
   20f70:	8496                	mv	s1,t0
   20f72:	05e79263          	bne	a5,t5,20fb6 <__divdf3+0x2e0>
   20f76:	04d77063          	bgeu	a4,a3,20fb6 <__divdf3+0x2e0>
   20f7a:	00a70fb3          	add	t6,a4,a0
   20f7e:	00efb3b3          	sltu	t2,t6,a4
   20f82:	00b38433          	add	s0,t2,a1
   20f86:	97a2                	add	a5,a5,s0
   20f88:	fff28493          	add	s1,t0,-1
   20f8c:	877e                	mv	a4,t6
   20f8e:	00f5e663          	bltu	a1,a5,20f9a <__divdf3+0x2c4>
   20f92:	02f59263          	bne	a1,a5,20fb6 <__divdf3+0x2e0>
   20f96:	02039063          	bnez	t2,20fb6 <__divdf3+0x2e0>
   20f9a:	01e7e663          	bltu	a5,t5,20fa6 <__divdf3+0x2d0>
   20f9e:	00ff1c63          	bne	t5,a5,20fb6 <__divdf3+0x2e0>
   20fa2:	00dffa63          	bgeu	t6,a3,20fb6 <__divdf3+0x2e0>
   20fa6:	9faa                	add	t6,t6,a0
   20fa8:	877e                	mv	a4,t6
   20faa:	00afbfb3          	sltu	t6,t6,a0
   20fae:	9fae                	add	t6,t6,a1
   20fb0:	ffe28493          	add	s1,t0,-2
   20fb4:	97fe                	add	a5,a5,t6
   20fb6:	40d706b3          	sub	a3,a4,a3
   20fba:	41e787b3          	sub	a5,a5,t5
   20fbe:	00d73733          	sltu	a4,a4,a3
   20fc2:	8f99                	sub	a5,a5,a4
   20fc4:	5f7d                	li	t5,-1
   20fc6:	0ef58963          	beq	a1,a5,210b8 <__divdf3+0x3e2>
   20fca:	0317dfb3          	divu	t6,a5,a7
   20fce:	0106d713          	srl	a4,a3,0x10
   20fd2:	0317f7b3          	remu	a5,a5,a7
   20fd6:	03f30f33          	mul	t5,t1,t6
   20fda:	07c2                	sll	a5,a5,0x10
   20fdc:	8fd9                	or	a5,a5,a4
   20fde:	877e                	mv	a4,t6
   20fe0:	01e7fc63          	bgeu	a5,t5,20ff8 <__divdf3+0x322>
   20fe4:	97ae                	add	a5,a5,a1
   20fe6:	ffff8713          	add	a4,t6,-1
   20fea:	00b7e763          	bltu	a5,a1,20ff8 <__divdf3+0x322>
   20fee:	01e7f563          	bgeu	a5,t5,20ff8 <__divdf3+0x322>
   20ff2:	ffef8713          	add	a4,t6,-2
   20ff6:	97ae                	add	a5,a5,a1
   20ff8:	41e787b3          	sub	a5,a5,t5
   20ffc:	0317df33          	divu	t5,a5,a7
   21000:	06c2                	sll	a3,a3,0x10
   21002:	82c1                	srl	a3,a3,0x10
   21004:	0317f7b3          	remu	a5,a5,a7
   21008:	88fa                	mv	a7,t5
   2100a:	03e30333          	mul	t1,t1,t5
   2100e:	07c2                	sll	a5,a5,0x10
   21010:	8fd5                	or	a5,a5,a3
   21012:	0067fc63          	bgeu	a5,t1,2102a <__divdf3+0x354>
   21016:	97ae                	add	a5,a5,a1
   21018:	ffff0893          	add	a7,t5,-1
   2101c:	00b7e763          	bltu	a5,a1,2102a <__divdf3+0x354>
   21020:	0067f563          	bgeu	a5,t1,2102a <__divdf3+0x354>
   21024:	ffef0893          	add	a7,t5,-2
   21028:	97ae                	add	a5,a5,a1
   2102a:	01071693          	sll	a3,a4,0x10
   2102e:	0116e6b3          	or	a3,a3,a7
   21032:	01069713          	sll	a4,a3,0x10
   21036:	8341                	srl	a4,a4,0x10
   21038:	406787b3          	sub	a5,a5,t1
   2103c:	0106d313          	srl	t1,a3,0x10
   21040:	03c70f33          	mul	t5,a4,t3
   21044:	03c30e33          	mul	t3,t1,t3
   21048:	026e8333          	mul	t1,t4,t1
   2104c:	02ee8eb3          	mul	t4,t4,a4
   21050:	010f5713          	srl	a4,t5,0x10
   21054:	9ef2                	add	t4,t4,t3
   21056:	9776                	add	a4,a4,t4
   21058:	01c77463          	bgeu	a4,t3,21060 <__divdf3+0x38a>
   2105c:	68c1                	lui	a7,0x10
   2105e:	9346                	add	t1,t1,a7
   21060:	01075893          	srl	a7,a4,0x10
   21064:	989a                	add	a7,a7,t1
   21066:	6341                	lui	t1,0x10
   21068:	137d                	add	t1,t1,-1 # ffff <__fw_size__+0x62ef>
   2106a:	00677733          	and	a4,a4,t1
   2106e:	0742                	sll	a4,a4,0x10
   21070:	006f7f33          	and	t5,t5,t1
   21074:	977a                	add	a4,a4,t5
   21076:	0117e663          	bltu	a5,a7,21082 <__divdf3+0x3ac>
   2107a:	19179d63          	bne	a5,a7,21214 <__divdf3+0x53e>
   2107e:	8f36                	mv	t5,a3
   21080:	cf05                	beqz	a4,210b8 <__divdf3+0x3e2>
   21082:	97ae                	add	a5,a5,a1
   21084:	fff68f13          	add	t5,a3,-1
   21088:	833e                	mv	t1,a5
   2108a:	02b7e163          	bltu	a5,a1,210ac <__divdf3+0x3d6>
   2108e:	0117e663          	bltu	a5,a7,2109a <__divdf3+0x3c4>
   21092:	19179063          	bne	a5,a7,21212 <__divdf3+0x53c>
   21096:	00e57d63          	bgeu	a0,a4,210b0 <__divdf3+0x3da>
   2109a:	ffe68f13          	add	t5,a3,-2
   2109e:	00151693          	sll	a3,a0,0x1
   210a2:	00a6b333          	sltu	t1,a3,a0
   210a6:	932e                	add	t1,t1,a1
   210a8:	933e                	add	t1,t1,a5
   210aa:	8536                	mv	a0,a3
   210ac:	01131463          	bne	t1,a7,210b4 <__divdf3+0x3de>
   210b0:	00a70463          	beq	a4,a0,210b8 <__divdf3+0x3e2>
   210b4:	001f6f13          	or	t5,t5,1
   210b8:	3ff80713          	add	a4,a6,1023
   210bc:	0ae05763          	blez	a4,2116a <__divdf3+0x494>
   210c0:	007f7793          	and	a5,t5,7
   210c4:	cf81                	beqz	a5,210dc <__divdf3+0x406>
   210c6:	00ff7793          	and	a5,t5,15
   210ca:	4691                	li	a3,4
   210cc:	00d78863          	beq	a5,a3,210dc <__divdf3+0x406>
   210d0:	004f0793          	add	a5,t5,4
   210d4:	01e7b6b3          	sltu	a3,a5,t5
   210d8:	94b6                	add	s1,s1,a3
   210da:	8f3e                	mv	t5,a5
   210dc:	00749793          	sll	a5,s1,0x7
   210e0:	0007d863          	bgez	a5,210f0 <__divdf3+0x41a>
   210e4:	ff0007b7          	lui	a5,0xff000
   210e8:	17fd                	add	a5,a5,-1 # feffffff <__share_mem_end__+0xfdf3ffff>
   210ea:	8cfd                	and	s1,s1,a5
   210ec:	40080713          	add	a4,a6,1024
   210f0:	7fe00793          	li	a5,2046
   210f4:	04e7ce63          	blt	a5,a4,21150 <__divdf3+0x47a>
   210f8:	003f5f13          	srl	t5,t5,0x3
   210fc:	01d49793          	sll	a5,s1,0x1d
   21100:	01e7ef33          	or	t5,a5,t5
   21104:	0034d513          	srl	a0,s1,0x3
   21108:	0532                	sll	a0,a0,0xc
   2110a:	50b2                	lw	ra,44(sp)
   2110c:	5422                	lw	s0,40(sp)
   2110e:	8131                	srl	a0,a0,0xc
   21110:	0752                	sll	a4,a4,0x14
   21112:	8f49                	or	a4,a4,a0
   21114:	067e                	sll	a2,a2,0x1f
   21116:	00c767b3          	or	a5,a4,a2
   2111a:	5492                	lw	s1,36(sp)
   2111c:	5902                	lw	s2,32(sp)
   2111e:	49f2                	lw	s3,28(sp)
   21120:	4a62                	lw	s4,24(sp)
   21122:	4ad2                	lw	s5,20(sp)
   21124:	4b42                	lw	s6,16(sp)
   21126:	4bb2                	lw	s7,12(sp)
   21128:	857a                	mv	a0,t5
   2112a:	85be                	mv	a1,a5
   2112c:	6145                	add	sp,sp,48
   2112e:	8082                	ret
   21130:	187d                	add	a6,a6,-1
   21132:	4701                	li	a4,0
   21134:	b395                	j	20e98 <__divdf3+0x1c2>
   21136:	864e                	mv	a2,s3
   21138:	84d2                	mv	s1,s4
   2113a:	8f22                	mv	t5,s0
   2113c:	87da                	mv	a5,s6
   2113e:	470d                	li	a4,3
   21140:	0ae78b63          	beq	a5,a4,211f6 <__divdf3+0x520>
   21144:	4705                	li	a4,1
   21146:	0ae78f63          	beq	a5,a4,21204 <__divdf3+0x52e>
   2114a:	4709                	li	a4,2
   2114c:	f6e796e3          	bne	a5,a4,210b8 <__divdf3+0x3e2>
   21150:	4501                	li	a0,0
   21152:	4f01                	li	t5,0
   21154:	7ff00713          	li	a4,2047
   21158:	bf45                	j	21108 <__divdf3+0x432>
   2115a:	864a                	mv	a2,s2
   2115c:	b7cd                	j	2113e <__divdf3+0x468>
   2115e:	000804b7          	lui	s1,0x80
   21162:	4f01                	li	t5,0
   21164:	4601                	li	a2,0
   21166:	478d                	li	a5,3
   21168:	bfd9                	j	2113e <__divdf3+0x468>
   2116a:	4505                	li	a0,1
   2116c:	8d19                	sub	a0,a0,a4
   2116e:	03800793          	li	a5,56
   21172:	08a7c963          	blt	a5,a0,21204 <__divdf3+0x52e>
   21176:	47fd                	li	a5,31
   21178:	04a7cb63          	blt	a5,a0,211ce <__divdf3+0x4f8>
   2117c:	41e80813          	add	a6,a6,1054
   21180:	010497b3          	sll	a5,s1,a6
   21184:	00af5733          	srl	a4,t5,a0
   21188:	010f1833          	sll	a6,t5,a6
   2118c:	8fd9                	or	a5,a5,a4
   2118e:	01003833          	snez	a6,a6
   21192:	0107e7b3          	or	a5,a5,a6
   21196:	00a4d533          	srl	a0,s1,a0
   2119a:	0077f713          	and	a4,a5,7
   2119e:	cf01                	beqz	a4,211b6 <__divdf3+0x4e0>
   211a0:	00f7f713          	and	a4,a5,15
   211a4:	4691                	li	a3,4
   211a6:	00d70863          	beq	a4,a3,211b6 <__divdf3+0x4e0>
   211aa:	00478713          	add	a4,a5,4
   211ae:	00f736b3          	sltu	a3,a4,a5
   211b2:	9536                	add	a0,a0,a3
   211b4:	87ba                	mv	a5,a4
   211b6:	00851713          	sll	a4,a0,0x8
   211ba:	04074863          	bltz	a4,2120a <__divdf3+0x534>
   211be:	01d51f13          	sll	t5,a0,0x1d
   211c2:	838d                	srl	a5,a5,0x3
   211c4:	00ff6f33          	or	t5,t5,a5
   211c8:	810d                	srl	a0,a0,0x3
   211ca:	4701                	li	a4,0
   211cc:	bf35                	j	21108 <__divdf3+0x432>
   211ce:	5785                	li	a5,-31
   211d0:	8f99                	sub	a5,a5,a4
   211d2:	02000693          	li	a3,32
   211d6:	00f4d7b3          	srl	a5,s1,a5
   211da:	4701                	li	a4,0
   211dc:	00d50663          	beq	a0,a3,211e8 <__divdf3+0x512>
   211e0:	43e80713          	add	a4,a6,1086
   211e4:	00e49733          	sll	a4,s1,a4
   211e8:	01e76733          	or	a4,a4,t5
   211ec:	00e03733          	snez	a4,a4
   211f0:	8fd9                	or	a5,a5,a4
   211f2:	4501                	li	a0,0
   211f4:	b75d                	j	2119a <__divdf3+0x4c4>
   211f6:	00080537          	lui	a0,0x80
   211fa:	4f01                	li	t5,0
   211fc:	7ff00713          	li	a4,2047
   21200:	4601                	li	a2,0
   21202:	b719                	j	21108 <__divdf3+0x432>
   21204:	4501                	li	a0,0
   21206:	4f01                	li	t5,0
   21208:	b7c9                	j	211ca <__divdf3+0x4f4>
   2120a:	4501                	li	a0,0
   2120c:	4f01                	li	t5,0
   2120e:	4705                	li	a4,1
   21210:	bde5                	j	21108 <__divdf3+0x432>
   21212:	86fa                	mv	a3,t5
   21214:	8f36                	mv	t5,a3
   21216:	bd79                	j	210b4 <__divdf3+0x3de>

00021218 <__muldf3>:
   21218:	7179                	add	sp,sp,-48
   2121a:	ca56                	sw	s5,20(sp)
   2121c:	0145da93          	srl	s5,a1,0x14
   21220:	d422                	sw	s0,40(sp)
   21222:	d226                	sw	s1,36(sp)
   21224:	ce4e                	sw	s3,28(sp)
   21226:	cc52                	sw	s4,24(sp)
   21228:	c85a                	sw	s6,16(sp)
   2122a:	00c59493          	sll	s1,a1,0xc
   2122e:	d606                	sw	ra,44(sp)
   21230:	d04a                	sw	s2,32(sp)
   21232:	c65e                	sw	s7,12(sp)
   21234:	7ffafa93          	and	s5,s5,2047
   21238:	842a                	mv	s0,a0
   2123a:	8b32                	mv	s6,a2
   2123c:	89b6                	mv	s3,a3
   2123e:	80b1                	srl	s1,s1,0xc
   21240:	01f5da13          	srl	s4,a1,0x1f
   21244:	1e0a8163          	beqz	s5,21426 <__muldf3+0x20e>
   21248:	7ff00793          	li	a5,2047
   2124c:	22fa8763          	beq	s5,a5,2147a <__muldf3+0x262>
   21250:	048e                	sll	s1,s1,0x3
   21252:	01d55793          	srl	a5,a0,0x1d
   21256:	8fc5                	or	a5,a5,s1
   21258:	008004b7          	lui	s1,0x800
   2125c:	8cdd                	or	s1,s1,a5
   2125e:	00351913          	sll	s2,a0,0x3
   21262:	c01a8a93          	add	s5,s5,-1023
   21266:	4b81                	li	s7,0
   21268:	0149d713          	srl	a4,s3,0x14
   2126c:	00c99413          	sll	s0,s3,0xc
   21270:	7ff77713          	and	a4,a4,2047
   21274:	8031                	srl	s0,s0,0xc
   21276:	01f9d993          	srl	s3,s3,0x1f
   2127a:	22070263          	beqz	a4,2149e <__muldf3+0x286>
   2127e:	7ff00793          	li	a5,2047
   21282:	26f70763          	beq	a4,a5,214f0 <__muldf3+0x2d8>
   21286:	040e                	sll	s0,s0,0x3
   21288:	01db5793          	srl	a5,s6,0x1d
   2128c:	8fc1                	or	a5,a5,s0
   2128e:	00800437          	lui	s0,0x800
   21292:	8c5d                	or	s0,s0,a5
   21294:	c0170693          	add	a3,a4,-1023
   21298:	003b1793          	sll	a5,s6,0x3
   2129c:	4701                	li	a4,0
   2129e:	9ab6                	add	s5,s5,a3
   212a0:	002b9693          	sll	a3,s7,0x2
   212a4:	8ed9                	or	a3,a3,a4
   212a6:	4629                	li	a2,10
   212a8:	001a8513          	add	a0,s5,1
   212ac:	30d64563          	blt	a2,a3,215b6 <__muldf3+0x39e>
   212b0:	4609                	li	a2,2
   212b2:	013a45b3          	xor	a1,s4,s3
   212b6:	24d64e63          	blt	a2,a3,21512 <__muldf3+0x2fa>
   212ba:	16fd                	add	a3,a3,-1
   212bc:	4605                	li	a2,1
   212be:	26d67963          	bgeu	a2,a3,21530 <__muldf3+0x318>
   212c2:	6341                	lui	t1,0x10
   212c4:	fff30e13          	add	t3,t1,-1 # ffff <__fw_size__+0x62ef>
   212c8:	01095713          	srl	a4,s2,0x10
   212cc:	0107d893          	srl	a7,a5,0x10
   212d0:	01c97933          	and	s2,s2,t3
   212d4:	01c7ff33          	and	t5,a5,t3
   212d8:	03e907b3          	mul	a5,s2,t5
   212dc:	03e70eb3          	mul	t4,a4,t5
   212e0:	0107d813          	srl	a6,a5,0x10
   212e4:	03288633          	mul	a2,a7,s2
   212e8:	9676                	add	a2,a2,t4
   212ea:	9832                	add	a6,a6,a2
   212ec:	031706b3          	mul	a3,a4,a7
   212f0:	01d87363          	bgeu	a6,t4,212f6 <__muldf3+0xde>
   212f4:	969a                	add	a3,a3,t1
   212f6:	01085293          	srl	t0,a6,0x10
   212fa:	01c87833          	and	a6,a6,t3
   212fe:	01c7f7b3          	and	a5,a5,t3
   21302:	01045613          	srl	a2,s0,0x10
   21306:	01c47e33          	and	t3,s0,t3
   2130a:	0842                	sll	a6,a6,0x10
   2130c:	983e                	add	a6,a6,a5
   2130e:	03c90eb3          	mul	t4,s2,t3
   21312:	03c707b3          	mul	a5,a4,t3
   21316:	03260933          	mul	s2,a2,s2
   2131a:	02c70333          	mul	t1,a4,a2
   2131e:	993e                	add	s2,s2,a5
   21320:	010ed713          	srl	a4,t4,0x10
   21324:	974a                	add	a4,a4,s2
   21326:	00f77463          	bgeu	a4,a5,2132e <__muldf3+0x116>
   2132a:	67c1                	lui	a5,0x10
   2132c:	933e                	add	t1,t1,a5
   2132e:	6441                	lui	s0,0x10
   21330:	01075793          	srl	a5,a4,0x10
   21334:	fff40f93          	add	t6,s0,-1 # ffff <__fw_size__+0x62ef>
   21338:	933e                	add	t1,t1,a5
   2133a:	01f777b3          	and	a5,a4,t6
   2133e:	01fefeb3          	and	t4,t4,t6
   21342:	07c2                	sll	a5,a5,0x10
   21344:	01f4ffb3          	and	t6,s1,t6
   21348:	97f6                	add	a5,a5,t4
   2134a:	0104de93          	srl	t4,s1,0x10
   2134e:	03ff03b3          	mul	t2,t5,t6
   21352:	92be                	add	t0,t0,a5
   21354:	03ee8f33          	mul	t5,t4,t5
   21358:	0103d713          	srl	a4,t2,0x10
   2135c:	03d884b3          	mul	s1,a7,t4
   21360:	03f888b3          	mul	a7,a7,t6
   21364:	98fa                	add	a7,a7,t5
   21366:	9746                	add	a4,a4,a7
   21368:	01e77363          	bgeu	a4,t5,2136e <__muldf3+0x156>
   2136c:	94a2                	add	s1,s1,s0
   2136e:	01075f13          	srl	t5,a4,0x10
   21372:	9f26                	add	t5,t5,s1
   21374:	64c1                	lui	s1,0x10
   21376:	fff48413          	add	s0,s1,-1 # ffff <__fw_size__+0x62ef>
   2137a:	8f61                	and	a4,a4,s0
   2137c:	0083f3b3          	and	t2,t2,s0
   21380:	0742                	sll	a4,a4,0x10
   21382:	007708b3          	add	a7,a4,t2
   21386:	03fe03b3          	mul	t2,t3,t6
   2138a:	03ce8e33          	mul	t3,t4,t3
   2138e:	03d60eb3          	mul	t4,a2,t4
   21392:	03f60633          	mul	a2,a2,t6
   21396:	0103df93          	srl	t6,t2,0x10
   2139a:	9672                	add	a2,a2,t3
   2139c:	9fb2                	add	t6,t6,a2
   2139e:	01cff363          	bgeu	t6,t3,213a4 <__muldf3+0x18c>
   213a2:	9ea6                	add	t4,t4,s1
   213a4:	008ff733          	and	a4,t6,s0
   213a8:	0083f3b3          	and	t2,t2,s0
   213ac:	0742                	sll	a4,a4,0x10
   213ae:	9696                	add	a3,a3,t0
   213b0:	971e                	add	a4,a4,t2
   213b2:	933a                	add	t1,t1,a4
   213b4:	00f6b7b3          	sltu	a5,a3,a5
   213b8:	979a                	add	a5,a5,t1
   213ba:	00e33633          	sltu	a2,t1,a4
   213be:	98b6                	add	a7,a7,a3
   213c0:	0067b333          	sltu	t1,a5,t1
   213c4:	00666633          	or	a2,a2,t1
   213c8:	00d8b6b3          	sltu	a3,a7,a3
   213cc:	01e78333          	add	t1,a5,t5
   213d0:	969a                	add	a3,a3,t1
   213d2:	00f33733          	sltu	a4,t1,a5
   213d6:	010fdf93          	srl	t6,t6,0x10
   213da:	0066b333          	sltu	t1,a3,t1
   213de:	00989793          	sll	a5,a7,0x9
   213e2:	967e                	add	a2,a2,t6
   213e4:	00676733          	or	a4,a4,t1
   213e8:	9732                	add	a4,a4,a2
   213ea:	0107e7b3          	or	a5,a5,a6
   213ee:	9776                	add	a4,a4,t4
   213f0:	00f037b3          	snez	a5,a5
   213f4:	0178d893          	srl	a7,a7,0x17
   213f8:	0726                	sll	a4,a4,0x9
   213fa:	0176d413          	srl	s0,a3,0x17
   213fe:	0117e7b3          	or	a5,a5,a7
   21402:	06a6                	sll	a3,a3,0x9
   21404:	8fd5                	or	a5,a5,a3
   21406:	00771693          	sll	a3,a4,0x7
   2140a:	8c59                	or	s0,s0,a4
   2140c:	0006db63          	bgez	a3,21422 <__muldf3+0x20a>
   21410:	0017d713          	srl	a4,a5,0x1
   21414:	8b85                	and	a5,a5,1
   21416:	8f5d                	or	a4,a4,a5
   21418:	01f41793          	sll	a5,s0,0x1f
   2141c:	8fd9                	or	a5,a5,a4
   2141e:	8005                	srl	s0,s0,0x1
   21420:	8aaa                	mv	s5,a0
   21422:	8556                	mv	a0,s5
   21424:	aa39                	j	21542 <__muldf3+0x32a>
   21426:	00a4e933          	or	s2,s1,a0
   2142a:	06090163          	beqz	s2,2148c <__muldf3+0x274>
   2142e:	c885                	beqz	s1,2145e <__muldf3+0x246>
   21430:	8526                	mv	a0,s1
   21432:	135000ef          	jal	21d66 <__clzsi2>
   21436:	ff550713          	add	a4,a0,-11 # 7fff5 <__fast_load_addr__+0x56135>
   2143a:	47f5                	li	a5,29
   2143c:	ff850693          	add	a3,a0,-8
   21440:	8f99                	sub	a5,a5,a4
   21442:	00d494b3          	sll	s1,s1,a3
   21446:	00f457b3          	srl	a5,s0,a5
   2144a:	8fc5                	or	a5,a5,s1
   2144c:	00d414b3          	sll	s1,s0,a3
   21450:	c0d00a93          	li	s5,-1011
   21454:	8926                	mv	s2,s1
   21456:	40aa8ab3          	sub	s5,s5,a0
   2145a:	84be                	mv	s1,a5
   2145c:	b529                	j	21266 <__muldf3+0x4e>
   2145e:	109000ef          	jal	21d66 <__clzsi2>
   21462:	87aa                	mv	a5,a0
   21464:	01578713          	add	a4,a5,21 # 10015 <__fw_size__+0x6305>
   21468:	46f1                	li	a3,28
   2146a:	02050513          	add	a0,a0,32
   2146e:	fce6d6e3          	bge	a3,a4,2143a <__muldf3+0x222>
   21472:	17e1                	add	a5,a5,-8
   21474:	00f417b3          	sll	a5,s0,a5
   21478:	bfe1                	j	21450 <__muldf3+0x238>
   2147a:	00a4e933          	or	s2,s1,a0
   2147e:	00091b63          	bnez	s2,21494 <__muldf3+0x27c>
   21482:	4481                	li	s1,0
   21484:	7ff00a93          	li	s5,2047
   21488:	4b89                	li	s7,2
   2148a:	bbf9                	j	21268 <__muldf3+0x50>
   2148c:	4481                	li	s1,0
   2148e:	4a81                	li	s5,0
   21490:	4b85                	li	s7,1
   21492:	bbd9                	j	21268 <__muldf3+0x50>
   21494:	892a                	mv	s2,a0
   21496:	7ff00a93          	li	s5,2047
   2149a:	4b8d                	li	s7,3
   2149c:	b3f1                	j	21268 <__muldf3+0x50>
   2149e:	016467b3          	or	a5,s0,s6
   214a2:	cfb9                	beqz	a5,21500 <__muldf3+0x2e8>
   214a4:	c41d                	beqz	s0,214d2 <__muldf3+0x2ba>
   214a6:	8522                	mv	a0,s0
   214a8:	0bf000ef          	jal	21d66 <__clzsi2>
   214ac:	ff550693          	add	a3,a0,-11
   214b0:	4775                	li	a4,29
   214b2:	ff850793          	add	a5,a0,-8
   214b6:	8f15                	sub	a4,a4,a3
   214b8:	00f41433          	sll	s0,s0,a5
   214bc:	00eb5733          	srl	a4,s6,a4
   214c0:	8f41                	or	a4,a4,s0
   214c2:	00fb1433          	sll	s0,s6,a5
   214c6:	c0d00693          	li	a3,-1011
   214ca:	87a2                	mv	a5,s0
   214cc:	8e89                	sub	a3,a3,a0
   214ce:	843a                	mv	s0,a4
   214d0:	b3f1                	j	2129c <__muldf3+0x84>
   214d2:	855a                	mv	a0,s6
   214d4:	093000ef          	jal	21d66 <__clzsi2>
   214d8:	87aa                	mv	a5,a0
   214da:	01578693          	add	a3,a5,21
   214de:	4771                	li	a4,28
   214e0:	02050513          	add	a0,a0,32
   214e4:	fcd756e3          	bge	a4,a3,214b0 <__muldf3+0x298>
   214e8:	17e1                	add	a5,a5,-8
   214ea:	00fb1733          	sll	a4,s6,a5
   214ee:	bfe1                	j	214c6 <__muldf3+0x2ae>
   214f0:	016467b3          	or	a5,s0,s6
   214f4:	eb91                	bnez	a5,21508 <__muldf3+0x2f0>
   214f6:	4401                	li	s0,0
   214f8:	7ff00693          	li	a3,2047
   214fc:	4709                	li	a4,2
   214fe:	b345                	j	2129e <__muldf3+0x86>
   21500:	4401                	li	s0,0
   21502:	4681                	li	a3,0
   21504:	4705                	li	a4,1
   21506:	bb61                	j	2129e <__muldf3+0x86>
   21508:	87da                	mv	a5,s6
   2150a:	7ff00693          	li	a3,2047
   2150e:	470d                	li	a4,3
   21510:	b379                	j	2129e <__muldf3+0x86>
   21512:	4605                	li	a2,1
   21514:	00d61633          	sll	a2,a2,a3
   21518:	53067693          	and	a3,a2,1328
   2151c:	e6c5                	bnez	a3,215c4 <__muldf3+0x3ac>
   2151e:	24067813          	and	a6,a2,576
   21522:	12081f63          	bnez	a6,21660 <__muldf3+0x448>
   21526:	08867613          	and	a2,a2,136
   2152a:	d8060ce3          	beqz	a2,212c2 <__muldf3+0xaa>
   2152e:	85ce                	mv	a1,s3
   21530:	4689                	li	a3,2
   21532:	12d70263          	beq	a4,a3,21656 <__muldf3+0x43e>
   21536:	468d                	li	a3,3
   21538:	12d70a63          	beq	a4,a3,2166c <__muldf3+0x454>
   2153c:	4685                	li	a3,1
   2153e:	12d70b63          	beq	a4,a3,21674 <__muldf3+0x45c>
   21542:	3ff50613          	add	a2,a0,1023
   21546:	08c05363          	blez	a2,215cc <__muldf3+0x3b4>
   2154a:	0077f713          	and	a4,a5,7
   2154e:	cf01                	beqz	a4,21566 <__muldf3+0x34e>
   21550:	00f7f713          	and	a4,a5,15
   21554:	4691                	li	a3,4
   21556:	00d70863          	beq	a4,a3,21566 <__muldf3+0x34e>
   2155a:	00478713          	add	a4,a5,4
   2155e:	00f736b3          	sltu	a3,a4,a5
   21562:	9436                	add	s0,s0,a3
   21564:	87ba                	mv	a5,a4
   21566:	00741713          	sll	a4,s0,0x7
   2156a:	00075863          	bgez	a4,2157a <__muldf3+0x362>
   2156e:	ff000737          	lui	a4,0xff000
   21572:	177d                	add	a4,a4,-1 # feffffff <__share_mem_end__+0xfdf3ffff>
   21574:	8c79                	and	s0,s0,a4
   21576:	40050613          	add	a2,a0,1024
   2157a:	7fe00713          	li	a4,2046
   2157e:	0cc74c63          	blt	a4,a2,21656 <__muldf3+0x43e>
   21582:	838d                	srl	a5,a5,0x3
   21584:	01d41693          	sll	a3,s0,0x1d
   21588:	8edd                	or	a3,a3,a5
   2158a:	00345713          	srl	a4,s0,0x3
   2158e:	0732                	sll	a4,a4,0xc
   21590:	50b2                	lw	ra,44(sp)
   21592:	5422                	lw	s0,40(sp)
   21594:	0652                	sll	a2,a2,0x14
   21596:	8331                	srl	a4,a4,0xc
   21598:	05fe                	sll	a1,a1,0x1f
   2159a:	8e59                	or	a2,a2,a4
   2159c:	00b667b3          	or	a5,a2,a1
   215a0:	5492                	lw	s1,36(sp)
   215a2:	5902                	lw	s2,32(sp)
   215a4:	49f2                	lw	s3,28(sp)
   215a6:	4a62                	lw	s4,24(sp)
   215a8:	4ad2                	lw	s5,20(sp)
   215aa:	4b42                	lw	s6,16(sp)
   215ac:	4bb2                	lw	s7,12(sp)
   215ae:	8536                	mv	a0,a3
   215b0:	85be                	mv	a1,a5
   215b2:	6145                	add	sp,sp,48
   215b4:	8082                	ret
   215b6:	463d                	li	a2,15
   215b8:	0ac68a63          	beq	a3,a2,2166c <__muldf3+0x454>
   215bc:	462d                	li	a2,11
   215be:	85d2                	mv	a1,s4
   215c0:	f6c687e3          	beq	a3,a2,2152e <__muldf3+0x316>
   215c4:	8426                	mv	s0,s1
   215c6:	87ca                	mv	a5,s2
   215c8:	875e                	mv	a4,s7
   215ca:	b79d                	j	21530 <__muldf3+0x318>
   215cc:	4705                	li	a4,1
   215ce:	8f11                	sub	a4,a4,a2
   215d0:	03800693          	li	a3,56
   215d4:	0ae6c063          	blt	a3,a4,21674 <__muldf3+0x45c>
   215d8:	46fd                	li	a3,31
   215da:	04e6ca63          	blt	a3,a4,2162e <__muldf3+0x416>
   215de:	41e50513          	add	a0,a0,1054
   215e2:	00e7d633          	srl	a2,a5,a4
   215e6:	00a416b3          	sll	a3,s0,a0
   215ea:	00a79533          	sll	a0,a5,a0
   215ee:	8ed1                	or	a3,a3,a2
   215f0:	00a03533          	snez	a0,a0
   215f4:	00a6e7b3          	or	a5,a3,a0
   215f8:	00e45733          	srl	a4,s0,a4
   215fc:	0077f693          	and	a3,a5,7
   21600:	ce81                	beqz	a3,21618 <__muldf3+0x400>
   21602:	00f7f693          	and	a3,a5,15
   21606:	4611                	li	a2,4
   21608:	00c68863          	beq	a3,a2,21618 <__muldf3+0x400>
   2160c:	00478693          	add	a3,a5,4
   21610:	00f6b633          	sltu	a2,a3,a5
   21614:	9732                	add	a4,a4,a2
   21616:	87b6                	mv	a5,a3
   21618:	00871693          	sll	a3,a4,0x8
   2161c:	0406cf63          	bltz	a3,2167a <__muldf3+0x462>
   21620:	01d71693          	sll	a3,a4,0x1d
   21624:	838d                	srl	a5,a5,0x3
   21626:	8edd                	or	a3,a3,a5
   21628:	830d                	srl	a4,a4,0x3
   2162a:	4601                	li	a2,0
   2162c:	b78d                	j	2158e <__muldf3+0x376>
   2162e:	5685                	li	a3,-31
   21630:	8e91                	sub	a3,a3,a2
   21632:	02000813          	li	a6,32
   21636:	00d456b3          	srl	a3,s0,a3
   2163a:	4601                	li	a2,0
   2163c:	01070663          	beq	a4,a6,21648 <__muldf3+0x430>
   21640:	43e50613          	add	a2,a0,1086
   21644:	00c41633          	sll	a2,s0,a2
   21648:	8e5d                	or	a2,a2,a5
   2164a:	00c03633          	snez	a2,a2
   2164e:	00c6e7b3          	or	a5,a3,a2
   21652:	4701                	li	a4,0
   21654:	b765                	j	215fc <__muldf3+0x3e4>
   21656:	4701                	li	a4,0
   21658:	4681                	li	a3,0
   2165a:	7ff00613          	li	a2,2047
   2165e:	bf05                	j	2158e <__muldf3+0x376>
   21660:	00080737          	lui	a4,0x80
   21664:	7ff00613          	li	a2,2047
   21668:	4581                	li	a1,0
   2166a:	b715                	j	2158e <__muldf3+0x376>
   2166c:	00080737          	lui	a4,0x80
   21670:	4681                	li	a3,0
   21672:	bfcd                	j	21664 <__muldf3+0x44c>
   21674:	4701                	li	a4,0
   21676:	4681                	li	a3,0
   21678:	bf4d                	j	2162a <__muldf3+0x412>
   2167a:	4701                	li	a4,0
   2167c:	4681                	li	a3,0
   2167e:	4605                	li	a2,1
   21680:	b739                	j	2158e <__muldf3+0x376>

00021682 <__subdf3>:
   21682:	00100837          	lui	a6,0x100
   21686:	187d                	add	a6,a6,-1 # fffff <__noncacheable_end__+0x3ffff>
   21688:	1101                	add	sp,sp,-32
   2168a:	00b878b3          	and	a7,a6,a1
   2168e:	0145d713          	srl	a4,a1,0x14
   21692:	01d55793          	srl	a5,a0,0x1d
   21696:	00d87833          	and	a6,a6,a3
   2169a:	c84a                	sw	s2,16(sp)
   2169c:	7ff77913          	and	s2,a4,2047
   216a0:	00389713          	sll	a4,a7,0x3
   216a4:	0146d893          	srl	a7,a3,0x14
   216a8:	ca26                	sw	s1,20(sp)
   216aa:	8fd9                	or	a5,a5,a4
   216ac:	01f5d493          	srl	s1,a1,0x1f
   216b0:	01d65713          	srl	a4,a2,0x1d
   216b4:	080e                	sll	a6,a6,0x3
   216b6:	ce06                	sw	ra,28(sp)
   216b8:	cc22                	sw	s0,24(sp)
   216ba:	c64e                	sw	s3,12(sp)
   216bc:	7ff8f893          	and	a7,a7,2047
   216c0:	7ff00593          	li	a1,2047
   216c4:	050e                	sll	a0,a0,0x3
   216c6:	82fd                	srl	a3,a3,0x1f
   216c8:	01076733          	or	a4,a4,a6
   216cc:	060e                	sll	a2,a2,0x3
   216ce:	00b89563          	bne	a7,a1,216d8 <__subdf3+0x56>
   216d2:	00c765b3          	or	a1,a4,a2
   216d6:	e199                	bnez	a1,216dc <__subdf3+0x5a>
   216d8:	0016c693          	xor	a3,a3,1
   216dc:	41190833          	sub	a6,s2,a7
   216e0:	22969b63          	bne	a3,s1,21916 <__subdf3+0x294>
   216e4:	0f005563          	blez	a6,217ce <__subdf3+0x14c>
   216e8:	02089963          	bnez	a7,2171a <__subdf3+0x98>
   216ec:	00c766b3          	or	a3,a4,a2
   216f0:	52068263          	beqz	a3,21c14 <__subdf3+0x592>
   216f4:	fff80593          	add	a1,a6,-1
   216f8:	e991                	bnez	a1,2170c <__subdf3+0x8a>
   216fa:	962a                	add	a2,a2,a0
   216fc:	00a636b3          	sltu	a3,a2,a0
   21700:	973e                	add	a4,a4,a5
   21702:	8532                	mv	a0,a2
   21704:	00d707b3          	add	a5,a4,a3
   21708:	4905                	li	s2,1
   2170a:	a8b9                	j	21768 <__subdf3+0xe6>
   2170c:	7ff00693          	li	a3,2047
   21710:	00d81d63          	bne	a6,a3,2172a <__subdf3+0xa8>
   21714:	7ff00913          	li	s2,2047
   21718:	a25d                	j	218be <__subdf3+0x23c>
   2171a:	7ff00693          	li	a3,2047
   2171e:	1ad90063          	beq	s2,a3,218be <__subdf3+0x23c>
   21722:	008006b7          	lui	a3,0x800
   21726:	8f55                	or	a4,a4,a3
   21728:	85c2                	mv	a1,a6
   2172a:	03800693          	li	a3,56
   2172e:	08b6cb63          	blt	a3,a1,217c4 <__subdf3+0x142>
   21732:	46fd                	li	a3,31
   21734:	06b6c163          	blt	a3,a1,21796 <__subdf3+0x114>
   21738:	02000813          	li	a6,32
   2173c:	40b80833          	sub	a6,a6,a1
   21740:	010716b3          	sll	a3,a4,a6
   21744:	00b658b3          	srl	a7,a2,a1
   21748:	01061833          	sll	a6,a2,a6
   2174c:	0116e6b3          	or	a3,a3,a7
   21750:	01003833          	snez	a6,a6
   21754:	0106e6b3          	or	a3,a3,a6
   21758:	00b755b3          	srl	a1,a4,a1
   2175c:	9536                	add	a0,a0,a3
   2175e:	95be                	add	a1,a1,a5
   21760:	00d536b3          	sltu	a3,a0,a3
   21764:	00d587b3          	add	a5,a1,a3
   21768:	00879713          	sll	a4,a5,0x8
   2176c:	14075963          	bgez	a4,218be <__subdf3+0x23c>
   21770:	0905                	add	s2,s2,1
   21772:	7ff00713          	li	a4,2047
   21776:	48e90c63          	beq	s2,a4,21c0e <__subdf3+0x58c>
   2177a:	ff800737          	lui	a4,0xff800
   2177e:	177d                	add	a4,a4,-1 # ff7fffff <__share_mem_end__+0xfe73ffff>
   21780:	8f7d                	and	a4,a4,a5
   21782:	00155793          	srl	a5,a0,0x1
   21786:	8905                	and	a0,a0,1
   21788:	8fc9                	or	a5,a5,a0
   2178a:	01f71513          	sll	a0,a4,0x1f
   2178e:	8d5d                	or	a0,a0,a5
   21790:	00175793          	srl	a5,a4,0x1
   21794:	a22d                	j	218be <__subdf3+0x23c>
   21796:	fe058693          	add	a3,a1,-32
   2179a:	02000893          	li	a7,32
   2179e:	00d756b3          	srl	a3,a4,a3
   217a2:	4801                	li	a6,0
   217a4:	01158863          	beq	a1,a7,217b4 <__subdf3+0x132>
   217a8:	04000813          	li	a6,64
   217ac:	40b80833          	sub	a6,a6,a1
   217b0:	01071833          	sll	a6,a4,a6
   217b4:	00c86833          	or	a6,a6,a2
   217b8:	01003833          	snez	a6,a6
   217bc:	0106e6b3          	or	a3,a3,a6
   217c0:	4581                	li	a1,0
   217c2:	bf69                	j	2175c <__subdf3+0xda>
   217c4:	00c766b3          	or	a3,a4,a2
   217c8:	00d036b3          	snez	a3,a3
   217cc:	bfd5                	j	217c0 <__subdf3+0x13e>
   217ce:	0a080a63          	beqz	a6,21882 <__subdf3+0x200>
   217d2:	412886b3          	sub	a3,a7,s2
   217d6:	02091063          	bnez	s2,217f6 <__subdf3+0x174>
   217da:	00a7e5b3          	or	a1,a5,a0
   217de:	42058063          	beqz	a1,21bfe <__subdf3+0x57c>
   217e2:	fff68593          	add	a1,a3,-1 # 7fffff <__noncacheable_end__+0x73ffff>
   217e6:	d991                	beqz	a1,216fa <__subdf3+0x78>
   217e8:	7ff00813          	li	a6,2047
   217ec:	01069d63          	bne	a3,a6,21806 <__subdf3+0x184>
   217f0:	87ba                	mv	a5,a4
   217f2:	8532                	mv	a0,a2
   217f4:	b705                	j	21714 <__subdf3+0x92>
   217f6:	7ff00593          	li	a1,2047
   217fa:	feb88be3          	beq	a7,a1,217f0 <__subdf3+0x16e>
   217fe:	008005b7          	lui	a1,0x800
   21802:	8fcd                	or	a5,a5,a1
   21804:	85b6                	mv	a1,a3
   21806:	03800693          	li	a3,56
   2180a:	06b6c763          	blt	a3,a1,21878 <__subdf3+0x1f6>
   2180e:	46fd                	li	a3,31
   21810:	02b6cd63          	blt	a3,a1,2184a <__subdf3+0x1c8>
   21814:	02000813          	li	a6,32
   21818:	40b80833          	sub	a6,a6,a1
   2181c:	010796b3          	sll	a3,a5,a6
   21820:	00b55333          	srl	t1,a0,a1
   21824:	01051833          	sll	a6,a0,a6
   21828:	0066e6b3          	or	a3,a3,t1
   2182c:	01003833          	snez	a6,a6
   21830:	0106e6b3          	or	a3,a3,a6
   21834:	00b7d5b3          	srl	a1,a5,a1
   21838:	9636                	add	a2,a2,a3
   2183a:	95ba                	add	a1,a1,a4
   2183c:	00d636b3          	sltu	a3,a2,a3
   21840:	8532                	mv	a0,a2
   21842:	00d587b3          	add	a5,a1,a3
   21846:	8946                	mv	s2,a7
   21848:	b705                	j	21768 <__subdf3+0xe6>
   2184a:	fe058693          	add	a3,a1,-32 # 7fffe0 <__noncacheable_end__+0x73ffe0>
   2184e:	02000313          	li	t1,32
   21852:	00d7d6b3          	srl	a3,a5,a3
   21856:	4801                	li	a6,0
   21858:	00658863          	beq	a1,t1,21868 <__subdf3+0x1e6>
   2185c:	04000813          	li	a6,64
   21860:	40b80833          	sub	a6,a6,a1
   21864:	01079833          	sll	a6,a5,a6
   21868:	00a86833          	or	a6,a6,a0
   2186c:	01003833          	snez	a6,a6
   21870:	0106e6b3          	or	a3,a3,a6
   21874:	4581                	li	a1,0
   21876:	b7c9                	j	21838 <__subdf3+0x1b6>
   21878:	00a7e6b3          	or	a3,a5,a0
   2187c:	00d036b3          	snez	a3,a3
   21880:	bfd5                	j	21874 <__subdf3+0x1f2>
   21882:	00190693          	add	a3,s2,1
   21886:	7fe6f593          	and	a1,a3,2046
   2188a:	e5ad                	bnez	a1,218f4 <__subdf3+0x272>
   2188c:	00a7e6b3          	or	a3,a5,a0
   21890:	04091763          	bnez	s2,218de <__subdf3+0x25c>
   21894:	36068863          	beqz	a3,21c04 <__subdf3+0x582>
   21898:	00c766b3          	or	a3,a4,a2
   2189c:	c28d                	beqz	a3,218be <__subdf3+0x23c>
   2189e:	962a                	add	a2,a2,a0
   218a0:	00a636b3          	sltu	a3,a2,a0
   218a4:	973e                	add	a4,a4,a5
   218a6:	00d707b3          	add	a5,a4,a3
   218aa:	00879713          	sll	a4,a5,0x8
   218ae:	8532                	mv	a0,a2
   218b0:	00075763          	bgez	a4,218be <__subdf3+0x23c>
   218b4:	ff800737          	lui	a4,0xff800
   218b8:	177d                	add	a4,a4,-1 # ff7fffff <__share_mem_end__+0xfe73ffff>
   218ba:	8ff9                	and	a5,a5,a4
   218bc:	4905                	li	s2,1
   218be:	00757713          	and	a4,a0,7
   218c2:	36070163          	beqz	a4,21c24 <__subdf3+0x5a2>
   218c6:	00f57713          	and	a4,a0,15
   218ca:	4691                	li	a3,4
   218cc:	34d70c63          	beq	a4,a3,21c24 <__subdf3+0x5a2>
   218d0:	00450713          	add	a4,a0,4
   218d4:	00a736b3          	sltu	a3,a4,a0
   218d8:	97b6                	add	a5,a5,a3
   218da:	853a                	mv	a0,a4
   218dc:	a6a1                	j	21c24 <__subdf3+0x5a2>
   218de:	da89                	beqz	a3,217f0 <__subdf3+0x16e>
   218e0:	8e59                	or	a2,a2,a4
   218e2:	e20609e3          	beqz	a2,21714 <__subdf3+0x92>
   218e6:	4481                	li	s1,0
   218e8:	004007b7          	lui	a5,0x400
   218ec:	4501                	li	a0,0
   218ee:	7ff00913          	li	s2,2047
   218f2:	ae0d                	j	21c24 <__subdf3+0x5a2>
   218f4:	7ff00593          	li	a1,2047
   218f8:	30b68963          	beq	a3,a1,21c0a <__subdf3+0x588>
   218fc:	962a                	add	a2,a2,a0
   218fe:	00a63533          	sltu	a0,a2,a0
   21902:	973e                	add	a4,a4,a5
   21904:	972a                	add	a4,a4,a0
   21906:	01f71513          	sll	a0,a4,0x1f
   2190a:	8205                	srl	a2,a2,0x1
   2190c:	8d51                	or	a0,a0,a2
   2190e:	00175793          	srl	a5,a4,0x1
   21912:	8936                	mv	s2,a3
   21914:	b76d                	j	218be <__subdf3+0x23c>
   21916:	0d005a63          	blez	a6,219ea <__subdf3+0x368>
   2191a:	08089463          	bnez	a7,219a2 <__subdf3+0x320>
   2191e:	00c766b3          	or	a3,a4,a2
   21922:	2e068963          	beqz	a3,21c14 <__subdf3+0x592>
   21926:	fff80693          	add	a3,a6,-1
   2192a:	ee81                	bnez	a3,21942 <__subdf3+0x2c0>
   2192c:	40c50633          	sub	a2,a0,a2
   21930:	00c536b3          	sltu	a3,a0,a2
   21934:	40e78733          	sub	a4,a5,a4
   21938:	8532                	mv	a0,a2
   2193a:	40d707b3          	sub	a5,a4,a3
   2193e:	4905                	li	s2,1
   21940:	a0b9                	j	2198e <__subdf3+0x30c>
   21942:	7ff00593          	li	a1,2047
   21946:	dcb807e3          	beq	a6,a1,21714 <__subdf3+0x92>
   2194a:	03800593          	li	a1,56
   2194e:	08d5ca63          	blt	a1,a3,219e2 <__subdf3+0x360>
   21952:	45fd                	li	a1,31
   21954:	06d5c063          	blt	a1,a3,219b4 <__subdf3+0x332>
   21958:	02000813          	li	a6,32
   2195c:	40d80833          	sub	a6,a6,a3
   21960:	00d658b3          	srl	a7,a2,a3
   21964:	010715b3          	sll	a1,a4,a6
   21968:	01061833          	sll	a6,a2,a6
   2196c:	0115e5b3          	or	a1,a1,a7
   21970:	01003833          	snez	a6,a6
   21974:	0105e633          	or	a2,a1,a6
   21978:	00d756b3          	srl	a3,a4,a3
   2197c:	40c50633          	sub	a2,a0,a2
   21980:	00c53733          	sltu	a4,a0,a2
   21984:	40d786b3          	sub	a3,a5,a3
   21988:	8532                	mv	a0,a2
   2198a:	40e687b3          	sub	a5,a3,a4
   2198e:	00879713          	sll	a4,a5,0x8
   21992:	f20756e3          	bgez	a4,218be <__subdf3+0x23c>
   21996:	00800437          	lui	s0,0x800
   2199a:	147d                	add	s0,s0,-1 # 7fffff <__noncacheable_end__+0x73ffff>
   2199c:	8c7d                	and	s0,s0,a5
   2199e:	89aa                	mv	s3,a0
   219a0:	aa55                	j	21b54 <__subdf3+0x4d2>
   219a2:	7ff00693          	li	a3,2047
   219a6:	f0d90ce3          	beq	s2,a3,218be <__subdf3+0x23c>
   219aa:	008006b7          	lui	a3,0x800
   219ae:	8f55                	or	a4,a4,a3
   219b0:	86c2                	mv	a3,a6
   219b2:	bf61                	j	2194a <__subdf3+0x2c8>
   219b4:	fe068593          	add	a1,a3,-32 # 7fffe0 <__noncacheable_end__+0x73ffe0>
   219b8:	02000893          	li	a7,32
   219bc:	00b755b3          	srl	a1,a4,a1
   219c0:	4801                	li	a6,0
   219c2:	01168863          	beq	a3,a7,219d2 <__subdf3+0x350>
   219c6:	04000813          	li	a6,64
   219ca:	40d80833          	sub	a6,a6,a3
   219ce:	01071833          	sll	a6,a4,a6
   219d2:	00c86833          	or	a6,a6,a2
   219d6:	01003833          	snez	a6,a6
   219da:	0105e633          	or	a2,a1,a6
   219de:	4681                	li	a3,0
   219e0:	bf71                	j	2197c <__subdf3+0x2fa>
   219e2:	8e59                	or	a2,a2,a4
   219e4:	00c03633          	snez	a2,a2
   219e8:	bfdd                	j	219de <__subdf3+0x35c>
   219ea:	0c080663          	beqz	a6,21ab6 <__subdf3+0x434>
   219ee:	41288833          	sub	a6,a7,s2
   219f2:	02091b63          	bnez	s2,21a28 <__subdf3+0x3a6>
   219f6:	00a7e5b3          	or	a1,a5,a0
   219fa:	20058f63          	beqz	a1,21c18 <__subdf3+0x596>
   219fe:	fff80593          	add	a1,a6,-1
   21a02:	e991                	bnez	a1,21a16 <__subdf3+0x394>
   21a04:	40a60533          	sub	a0,a2,a0
   21a08:	8f1d                	sub	a4,a4,a5
   21a0a:	00a63633          	sltu	a2,a2,a0
   21a0e:	40c707b3          	sub	a5,a4,a2
   21a12:	84b6                	mv	s1,a3
   21a14:	b72d                	j	2193e <__subdf3+0x2bc>
   21a16:	7ff00313          	li	t1,2047
   21a1a:	00681f63          	bne	a6,t1,21a38 <__subdf3+0x3b6>
   21a1e:	87ba                	mv	a5,a4
   21a20:	8532                	mv	a0,a2
   21a22:	7ff00913          	li	s2,2047
   21a26:	a845                	j	21ad6 <__subdf3+0x454>
   21a28:	7ff00593          	li	a1,2047
   21a2c:	feb889e3          	beq	a7,a1,21a1e <__subdf3+0x39c>
   21a30:	008005b7          	lui	a1,0x800
   21a34:	8fcd                	or	a5,a5,a1
   21a36:	85c2                	mv	a1,a6
   21a38:	03800813          	li	a6,56
   21a3c:	06b84963          	blt	a6,a1,21aae <__subdf3+0x42c>
   21a40:	487d                	li	a6,31
   21a42:	02b84f63          	blt	a6,a1,21a80 <__subdf3+0x3fe>
   21a46:	02000313          	li	t1,32
   21a4a:	40b30333          	sub	t1,t1,a1
   21a4e:	00b55e33          	srl	t3,a0,a1
   21a52:	00679833          	sll	a6,a5,t1
   21a56:	00651333          	sll	t1,a0,t1
   21a5a:	01c86833          	or	a6,a6,t3
   21a5e:	00603333          	snez	t1,t1
   21a62:	00686533          	or	a0,a6,t1
   21a66:	00b7d5b3          	srl	a1,a5,a1
   21a6a:	40a60533          	sub	a0,a2,a0
   21a6e:	40b705b3          	sub	a1,a4,a1
   21a72:	00a63633          	sltu	a2,a2,a0
   21a76:	40c587b3          	sub	a5,a1,a2
   21a7a:	8946                	mv	s2,a7
   21a7c:	84b6                	mv	s1,a3
   21a7e:	bf01                	j	2198e <__subdf3+0x30c>
   21a80:	fe058813          	add	a6,a1,-32 # 7fffe0 <__noncacheable_end__+0x73ffe0>
   21a84:	02000e13          	li	t3,32
   21a88:	0107d833          	srl	a6,a5,a6
   21a8c:	4301                	li	t1,0
   21a8e:	01c58863          	beq	a1,t3,21a9e <__subdf3+0x41c>
   21a92:	04000313          	li	t1,64
   21a96:	40b30333          	sub	t1,t1,a1
   21a9a:	00679333          	sll	t1,a5,t1
   21a9e:	00a36333          	or	t1,t1,a0
   21aa2:	00603333          	snez	t1,t1
   21aa6:	00686533          	or	a0,a6,t1
   21aaa:	4581                	li	a1,0
   21aac:	bf7d                	j	21a6a <__subdf3+0x3e8>
   21aae:	8d5d                	or	a0,a0,a5
   21ab0:	00a03533          	snez	a0,a0
   21ab4:	bfdd                	j	21aaa <__subdf3+0x428>
   21ab6:	00190593          	add	a1,s2,1
   21aba:	7fe5f593          	and	a1,a1,2046
   21abe:	e5b5                	bnez	a1,21b2a <__subdf3+0x4a8>
   21ac0:	00c765b3          	or	a1,a4,a2
   21ac4:	00a7e833          	or	a6,a5,a0
   21ac8:	04091663          	bnez	s2,21b14 <__subdf3+0x492>
   21acc:	00081763          	bnez	a6,21ada <__subdf3+0x458>
   21ad0:	cdf1                	beqz	a1,21bac <__subdf3+0x52a>
   21ad2:	87ba                	mv	a5,a4
   21ad4:	8532                	mv	a0,a2
   21ad6:	84b6                	mv	s1,a3
   21ad8:	b3dd                	j	218be <__subdf3+0x23c>
   21ada:	de0582e3          	beqz	a1,218be <__subdf3+0x23c>
   21ade:	40c50833          	sub	a6,a0,a2
   21ae2:	010538b3          	sltu	a7,a0,a6
   21ae6:	40e785b3          	sub	a1,a5,a4
   21aea:	411585b3          	sub	a1,a1,a7
   21aee:	00859893          	sll	a7,a1,0x8
   21af2:	0008da63          	bgez	a7,21b06 <__subdf3+0x484>
   21af6:	40a60533          	sub	a0,a2,a0
   21afa:	8f1d                	sub	a4,a4,a5
   21afc:	00a63633          	sltu	a2,a2,a0
   21b00:	40c707b3          	sub	a5,a4,a2
   21b04:	bfc9                	j	21ad6 <__subdf3+0x454>
   21b06:	00b86533          	or	a0,a6,a1
   21b0a:	10050b63          	beqz	a0,21c20 <__subdf3+0x59e>
   21b0e:	87ae                	mv	a5,a1
   21b10:	8542                	mv	a0,a6
   21b12:	b375                	j	218be <__subdf3+0x23c>
   21b14:	00081863          	bnez	a6,21b24 <__subdf3+0x4a2>
   21b18:	dc0587e3          	beqz	a1,218e6 <__subdf3+0x264>
   21b1c:	87ba                	mv	a5,a4
   21b1e:	8532                	mv	a0,a2
   21b20:	84b6                	mv	s1,a3
   21b22:	becd                	j	21714 <__subdf3+0x92>
   21b24:	be0588e3          	beqz	a1,21714 <__subdf3+0x92>
   21b28:	bb7d                	j	218e6 <__subdf3+0x264>
   21b2a:	40c505b3          	sub	a1,a0,a2
   21b2e:	00b53833          	sltu	a6,a0,a1
   21b32:	40e78433          	sub	s0,a5,a4
   21b36:	41040433          	sub	s0,s0,a6
   21b3a:	00841813          	sll	a6,s0,0x8
   21b3e:	89ae                	mv	s3,a1
   21b40:	06085363          	bgez	a6,21ba6 <__subdf3+0x524>
   21b44:	40a609b3          	sub	s3,a2,a0
   21b48:	40f70433          	sub	s0,a4,a5
   21b4c:	01363633          	sltu	a2,a2,s3
   21b50:	8c11                	sub	s0,s0,a2
   21b52:	84b6                	mv	s1,a3
   21b54:	cc31                	beqz	s0,21bb0 <__subdf3+0x52e>
   21b56:	8522                	mv	a0,s0
   21b58:	2439                	jal	21d66 <__clzsi2>
   21b5a:	ff850693          	add	a3,a0,-8
   21b5e:	02000793          	li	a5,32
   21b62:	8f95                	sub	a5,a5,a3
   21b64:	00d41433          	sll	s0,s0,a3
   21b68:	00f9d7b3          	srl	a5,s3,a5
   21b6c:	8fc1                	or	a5,a5,s0
   21b6e:	00d99433          	sll	s0,s3,a3
   21b72:	0726ce63          	blt	a3,s2,21bee <__subdf3+0x56c>
   21b76:	412686b3          	sub	a3,a3,s2
   21b7a:	00168613          	add	a2,a3,1
   21b7e:	477d                	li	a4,31
   21b80:	04c74463          	blt	a4,a2,21bc8 <__subdf3+0x546>
   21b84:	02000713          	li	a4,32
   21b88:	8f11                	sub	a4,a4,a2
   21b8a:	00e79533          	sll	a0,a5,a4
   21b8e:	00c456b3          	srl	a3,s0,a2
   21b92:	00e41733          	sll	a4,s0,a4
   21b96:	8d55                	or	a0,a0,a3
   21b98:	00e03733          	snez	a4,a4
   21b9c:	8d59                	or	a0,a0,a4
   21b9e:	00c7d7b3          	srl	a5,a5,a2
   21ba2:	4901                	li	s2,0
   21ba4:	bb29                	j	218be <__subdf3+0x23c>
   21ba6:	8dc1                	or	a1,a1,s0
   21ba8:	f5d5                	bnez	a1,21b54 <__subdf3+0x4d2>
   21baa:	4901                	li	s2,0
   21bac:	4481                	li	s1,0
   21bae:	a085                	j	21c0e <__subdf3+0x58c>
   21bb0:	854e                	mv	a0,s3
   21bb2:	2a55                	jal	21d66 <__clzsi2>
   21bb4:	01850693          	add	a3,a0,24
   21bb8:	47fd                	li	a5,31
   21bba:	fad7d2e3          	bge	a5,a3,21b5e <__subdf3+0x4dc>
   21bbe:	ff850793          	add	a5,a0,-8
   21bc2:	00f997b3          	sll	a5,s3,a5
   21bc6:	b775                	j	21b72 <__subdf3+0x4f0>
   21bc8:	1685                	add	a3,a3,-31
   21bca:	00d7d533          	srl	a0,a5,a3
   21bce:	02000693          	li	a3,32
   21bd2:	4701                	li	a4,0
   21bd4:	00d60763          	beq	a2,a3,21be2 <__subdf3+0x560>
   21bd8:	04000713          	li	a4,64
   21bdc:	8f11                	sub	a4,a4,a2
   21bde:	00e79733          	sll	a4,a5,a4
   21be2:	8f41                	or	a4,a4,s0
   21be4:	00e03733          	snez	a4,a4
   21be8:	8d59                	or	a0,a0,a4
   21bea:	4781                	li	a5,0
   21bec:	bf5d                	j	21ba2 <__subdf3+0x520>
   21bee:	ff800737          	lui	a4,0xff800
   21bf2:	177d                	add	a4,a4,-1 # ff7fffff <__share_mem_end__+0xfe73ffff>
   21bf4:	40d90933          	sub	s2,s2,a3
   21bf8:	8ff9                	and	a5,a5,a4
   21bfa:	8522                	mv	a0,s0
   21bfc:	b1c9                	j	218be <__subdf3+0x23c>
   21bfe:	87ba                	mv	a5,a4
   21c00:	8532                	mv	a0,a2
   21c02:	bb01                	j	21912 <__subdf3+0x290>
   21c04:	87ba                	mv	a5,a4
   21c06:	8532                	mv	a0,a2
   21c08:	b95d                	j	218be <__subdf3+0x23c>
   21c0a:	7ff00913          	li	s2,2047
   21c0e:	4781                	li	a5,0
   21c10:	4501                	li	a0,0
   21c12:	a809                	j	21c24 <__subdf3+0x5a2>
   21c14:	8942                	mv	s2,a6
   21c16:	b165                	j	218be <__subdf3+0x23c>
   21c18:	87ba                	mv	a5,a4
   21c1a:	8532                	mv	a0,a2
   21c1c:	8942                	mv	s2,a6
   21c1e:	bd65                	j	21ad6 <__subdf3+0x454>
   21c20:	4781                	li	a5,0
   21c22:	4481                	li	s1,0
   21c24:	00879713          	sll	a4,a5,0x8
   21c28:	00075b63          	bgez	a4,21c3e <__subdf3+0x5bc>
   21c2c:	0905                	add	s2,s2,1
   21c2e:	7ff00713          	li	a4,2047
   21c32:	04e90b63          	beq	s2,a4,21c88 <__subdf3+0x606>
   21c36:	ff800737          	lui	a4,0xff800
   21c3a:	177d                	add	a4,a4,-1 # ff7fffff <__share_mem_end__+0xfe73ffff>
   21c3c:	8ff9                	and	a5,a5,a4
   21c3e:	01d79693          	sll	a3,a5,0x1d
   21c42:	810d                	srl	a0,a0,0x3
   21c44:	7ff00713          	li	a4,2047
   21c48:	8ec9                	or	a3,a3,a0
   21c4a:	838d                	srl	a5,a5,0x3
   21c4c:	00e91963          	bne	s2,a4,21c5e <__subdf3+0x5dc>
   21c50:	8edd                	or	a3,a3,a5
   21c52:	4781                	li	a5,0
   21c54:	c689                	beqz	a3,21c5e <__subdf3+0x5dc>
   21c56:	000807b7          	lui	a5,0x80
   21c5a:	4681                	li	a3,0
   21c5c:	4481                	li	s1,0
   21c5e:	01491713          	sll	a4,s2,0x14
   21c62:	7ff00637          	lui	a2,0x7ff00
   21c66:	07b2                	sll	a5,a5,0xc
   21c68:	8f71                	and	a4,a4,a2
   21c6a:	40f2                	lw	ra,28(sp)
   21c6c:	4462                	lw	s0,24(sp)
   21c6e:	83b1                	srl	a5,a5,0xc
   21c70:	8fd9                	or	a5,a5,a4
   21c72:	01f49713          	sll	a4,s1,0x1f
   21c76:	00e7e633          	or	a2,a5,a4
   21c7a:	44d2                	lw	s1,20(sp)
   21c7c:	4942                	lw	s2,16(sp)
   21c7e:	49b2                	lw	s3,12(sp)
   21c80:	8536                	mv	a0,a3
   21c82:	85b2                	mv	a1,a2
   21c84:	6105                	add	sp,sp,32
   21c86:	8082                	ret
   21c88:	4781                	li	a5,0
   21c8a:	4501                	li	a0,0
   21c8c:	bf4d                	j	21c3e <__subdf3+0x5bc>

00021c8e <__fixunsdfsi>:
   21c8e:	0145d713          	srl	a4,a1,0x14
   21c92:	00100837          	lui	a6,0x100
   21c96:	fff80793          	add	a5,a6,-1 # fffff <__noncacheable_end__+0x3ffff>
   21c9a:	7ff77713          	and	a4,a4,2047
   21c9e:	3fe00613          	li	a2,1022
   21ca2:	8fed                	and	a5,a5,a1
   21ca4:	86aa                	mv	a3,a0
   21ca6:	81fd                	srl	a1,a1,0x1f
   21ca8:	04e65363          	bge	a2,a4,21cee <__fixunsdfsi+0x60>
   21cac:	0015c613          	xor	a2,a1,1
   21cb0:	41e60613          	add	a2,a2,1054 # 7ff0041e <__share_mem_end__+0x7ee4041e>
   21cb4:	fff58513          	add	a0,a1,-1
   21cb8:	02c75c63          	bge	a4,a2,21cf0 <__fixunsdfsi+0x62>
   21cbc:	4501                	li	a0,0
   21cbe:	e98d                	bnez	a1,21cf0 <__fixunsdfsi+0x62>
   21cc0:	43300613          	li	a2,1075
   21cc4:	8e19                	sub	a2,a2,a4
   21cc6:	45fd                	li	a1,31
   21cc8:	0107e7b3          	or	a5,a5,a6
   21ccc:	00c5ca63          	blt	a1,a2,21ce0 <__fixunsdfsi+0x52>
   21cd0:	bed70713          	add	a4,a4,-1043
   21cd4:	00e797b3          	sll	a5,a5,a4
   21cd8:	00c6d533          	srl	a0,a3,a2
   21cdc:	8d5d                	or	a0,a0,a5
   21cde:	8082                	ret
   21ce0:	41300693          	li	a3,1043
   21ce4:	40e68733          	sub	a4,a3,a4
   21ce8:	00e7d533          	srl	a0,a5,a4
   21cec:	8082                	ret
   21cee:	4501                	li	a0,0
   21cf0:	8082                	ret

00021cf2 <__floatunsidf>:
   21cf2:	1141                	add	sp,sp,-16
   21cf4:	c422                	sw	s0,8(sp)
   21cf6:	c606                	sw	ra,12(sp)
   21cf8:	842a                	mv	s0,a0
   21cfa:	cd1d                	beqz	a0,21d38 <__floatunsidf+0x46>
   21cfc:	20ad                	jal	21d66 <__clzsi2>
   21cfe:	41e00713          	li	a4,1054
   21d02:	47a9                	li	a5,10
   21d04:	8f09                	sub	a4,a4,a0
   21d06:	02a7c463          	blt	a5,a0,21d2e <__floatunsidf+0x3c>
   21d0a:	47ad                	li	a5,11
   21d0c:	8f89                	sub	a5,a5,a0
   21d0e:	0555                	add	a0,a0,21
   21d10:	00f457b3          	srl	a5,s0,a5
   21d14:	00a41433          	sll	s0,s0,a0
   21d18:	40b2                	lw	ra,12(sp)
   21d1a:	8522                	mv	a0,s0
   21d1c:	07b2                	sll	a5,a5,0xc
   21d1e:	4422                	lw	s0,8(sp)
   21d20:	0752                	sll	a4,a4,0x14
   21d22:	83b1                	srl	a5,a5,0xc
   21d24:	00f766b3          	or	a3,a4,a5
   21d28:	85b6                	mv	a1,a3
   21d2a:	0141                	add	sp,sp,16
   21d2c:	8082                	ret
   21d2e:	1555                	add	a0,a0,-11
   21d30:	00a417b3          	sll	a5,s0,a0
   21d34:	4401                	li	s0,0
   21d36:	b7cd                	j	21d18 <__floatunsidf+0x26>
   21d38:	4781                	li	a5,0
   21d3a:	4701                	li	a4,0
   21d3c:	bff1                	j	21d18 <__floatunsidf+0x26>

00021d3e <__ashldi3>:
   21d3e:	ca19                	beqz	a2,21d54 <__ashldi3+0x16>
   21d40:	02000793          	li	a5,32
   21d44:	8f91                	sub	a5,a5,a2
   21d46:	00f04863          	bgtz	a5,21d56 <__ashldi3+0x18>
   21d4a:	1601                	add	a2,a2,-32
   21d4c:	00c515b3          	sll	a1,a0,a2
   21d50:	4701                	li	a4,0
   21d52:	853a                	mv	a0,a4
   21d54:	8082                	ret
   21d56:	00c51733          	sll	a4,a0,a2
   21d5a:	00c595b3          	sll	a1,a1,a2
   21d5e:	00f55533          	srl	a0,a0,a5
   21d62:	8dc9                	or	a1,a1,a0
   21d64:	b7fd                	j	21d52 <__ashldi3+0x14>

00021d66 <__clzsi2>:
   21d66:	67c1                	lui	a5,0x10
   21d68:	02f57663          	bgeu	a0,a5,21d94 <__clzsi2+0x2e>
   21d6c:	10053793          	sltiu	a5,a0,256
   21d70:	0017b793          	seqz	a5,a5
   21d74:	078e                	sll	a5,a5,0x3
   21d76:	00029737          	lui	a4,0x29
   21d7a:	02000693          	li	a3,32
   21d7e:	8e9d                	sub	a3,a3,a5
   21d80:	00f55533          	srl	a0,a0,a5
   21d84:	46070793          	add	a5,a4,1120 # 29460 <__clz_tab>
   21d88:	97aa                	add	a5,a5,a0
   21d8a:	0007c503          	lbu	a0,0(a5) # 10000 <__fw_size__+0x62f0>
   21d8e:	40a68533          	sub	a0,a3,a0
   21d92:	8082                	ret
   21d94:	01000737          	lui	a4,0x1000
   21d98:	47e1                	li	a5,24
   21d9a:	fce57ee3          	bgeu	a0,a4,21d76 <__clzsi2+0x10>
   21d9e:	47c1                	li	a5,16
   21da0:	bfd9                	j	21d76 <__clzsi2+0x10>

00021da2 <memcpy>:
   21da2:	832a                	mv	t1,a0
   21da4:	ca09                	beqz	a2,21db6 <memcpy+0x14>
   21da6:	00058383          	lb	t2,0(a1)
   21daa:	00730023          	sb	t2,0(t1)
   21dae:	167d                	add	a2,a2,-1
   21db0:	0305                	add	t1,t1,1
   21db2:	0585                	add	a1,a1,1
   21db4:	fa6d                	bnez	a2,21da6 <memcpy+0x4>
   21db6:	8082                	ret

00021db8 <memset>:
   21db8:	832a                	mv	t1,a0
   21dba:	c611                	beqz	a2,21dc6 <memset+0xe>
   21dbc:	00b30023          	sb	a1,0(t1)
   21dc0:	167d                	add	a2,a2,-1
   21dc2:	0305                	add	t1,t1,1
   21dc4:	fe65                	bnez	a2,21dbc <memset+0x4>
   21dc6:	8082                	ret

00021dc8 <memmove>:
   21dc8:	c215                	beqz	a2,21dec <memmove+0x24>
   21dca:	832a                	mv	t1,a0
   21dcc:	4685                	li	a3,1
   21dce:	00b56763          	bltu	a0,a1,21ddc <memmove+0x14>
   21dd2:	56fd                	li	a3,-1
   21dd4:	fff60713          	add	a4,a2,-1
   21dd8:	933a                	add	t1,t1,a4
   21dda:	95ba                	add	a1,a1,a4
   21ddc:	00058383          	lb	t2,0(a1)
   21de0:	00730023          	sb	t2,0(t1)
   21de4:	167d                	add	a2,a2,-1
   21de6:	9336                	add	t1,t1,a3
   21de8:	95b6                	add	a1,a1,a3
   21dea:	fa6d                	bnez	a2,21ddc <memmove+0x14>
   21dec:	8082                	ret

00021dee <__adddf3>:
   21dee:	00100837          	lui	a6,0x100
   21df2:	187d                	add	a6,a6,-1 # fffff <__noncacheable_end__+0x3ffff>
   21df4:	1101                	add	sp,sp,-32
   21df6:	00b878b3          	and	a7,a6,a1
   21dfa:	0145d713          	srl	a4,a1,0x14
   21dfe:	01d55793          	srl	a5,a0,0x1d
   21e02:	00d87833          	and	a6,a6,a3
   21e06:	ca26                	sw	s1,20(sp)
   21e08:	7ff77493          	and	s1,a4,2047
   21e0c:	00389713          	sll	a4,a7,0x3
   21e10:	0146d893          	srl	a7,a3,0x14
   21e14:	080e                	sll	a6,a6,0x3
   21e16:	c84a                	sw	s2,16(sp)
   21e18:	8fd9                	or	a5,a5,a4
   21e1a:	7ff8f893          	and	a7,a7,2047
   21e1e:	01d65713          	srl	a4,a2,0x1d
   21e22:	ce06                	sw	ra,28(sp)
   21e24:	cc22                	sw	s0,24(sp)
   21e26:	c64e                	sw	s3,12(sp)
   21e28:	01f5d913          	srl	s2,a1,0x1f
   21e2c:	82fd                	srl	a3,a3,0x1f
   21e2e:	01076733          	or	a4,a4,a6
   21e32:	050e                	sll	a0,a0,0x3
   21e34:	060e                	sll	a2,a2,0x3
   21e36:	41148833          	sub	a6,s1,a7
   21e3a:	22d91963          	bne	s2,a3,2206c <__adddf3+0x27e>
   21e3e:	0f005563          	blez	a6,21f28 <__adddf3+0x13a>
   21e42:	02089963          	bnez	a7,21e74 <__adddf3+0x86>
   21e46:	00c766b3          	or	a3,a4,a2
   21e4a:	50068c63          	beqz	a3,22362 <__adddf3+0x574>
   21e4e:	fff80593          	add	a1,a6,-1
   21e52:	e991                	bnez	a1,21e66 <__adddf3+0x78>
   21e54:	962a                	add	a2,a2,a0
   21e56:	00a636b3          	sltu	a3,a2,a0
   21e5a:	973e                	add	a4,a4,a5
   21e5c:	8532                	mv	a0,a2
   21e5e:	00d707b3          	add	a5,a4,a3
   21e62:	4485                	li	s1,1
   21e64:	a8b9                	j	21ec2 <__adddf3+0xd4>
   21e66:	7ff00693          	li	a3,2047
   21e6a:	00d81d63          	bne	a6,a3,21e84 <__adddf3+0x96>
   21e6e:	7ff00493          	li	s1,2047
   21e72:	a24d                	j	22014 <__adddf3+0x226>
   21e74:	7ff00693          	li	a3,2047
   21e78:	18d48e63          	beq	s1,a3,22014 <__adddf3+0x226>
   21e7c:	008006b7          	lui	a3,0x800
   21e80:	8f55                	or	a4,a4,a3
   21e82:	85c2                	mv	a1,a6
   21e84:	03800693          	li	a3,56
   21e88:	08b6cb63          	blt	a3,a1,21f1e <__adddf3+0x130>
   21e8c:	46fd                	li	a3,31
   21e8e:	06b6c163          	blt	a3,a1,21ef0 <__adddf3+0x102>
   21e92:	02000813          	li	a6,32
   21e96:	40b80833          	sub	a6,a6,a1
   21e9a:	010716b3          	sll	a3,a4,a6
   21e9e:	00b658b3          	srl	a7,a2,a1
   21ea2:	01061833          	sll	a6,a2,a6
   21ea6:	0116e6b3          	or	a3,a3,a7
   21eaa:	01003833          	snez	a6,a6
   21eae:	0106e6b3          	or	a3,a3,a6
   21eb2:	00b755b3          	srl	a1,a4,a1
   21eb6:	9536                	add	a0,a0,a3
   21eb8:	95be                	add	a1,a1,a5
   21eba:	00d536b3          	sltu	a3,a0,a3
   21ebe:	00d587b3          	add	a5,a1,a3
   21ec2:	00879713          	sll	a4,a5,0x8
   21ec6:	14075763          	bgez	a4,22014 <__adddf3+0x226>
   21eca:	0485                	add	s1,s1,1
   21ecc:	7ff00713          	li	a4,2047
   21ed0:	48e48663          	beq	s1,a4,2235c <__adddf3+0x56e>
   21ed4:	ff800737          	lui	a4,0xff800
   21ed8:	177d                	add	a4,a4,-1 # ff7fffff <__share_mem_end__+0xfe73ffff>
   21eda:	8f7d                	and	a4,a4,a5
   21edc:	00155793          	srl	a5,a0,0x1
   21ee0:	8905                	and	a0,a0,1
   21ee2:	8fc9                	or	a5,a5,a0
   21ee4:	01f71513          	sll	a0,a4,0x1f
   21ee8:	8d5d                	or	a0,a0,a5
   21eea:	00175793          	srl	a5,a4,0x1
   21eee:	a21d                	j	22014 <__adddf3+0x226>
   21ef0:	fe058693          	add	a3,a1,-32
   21ef4:	02000893          	li	a7,32
   21ef8:	00d756b3          	srl	a3,a4,a3
   21efc:	4801                	li	a6,0
   21efe:	01158863          	beq	a1,a7,21f0e <__adddf3+0x120>
   21f02:	04000813          	li	a6,64
   21f06:	40b80833          	sub	a6,a6,a1
   21f0a:	01071833          	sll	a6,a4,a6
   21f0e:	00c86833          	or	a6,a6,a2
   21f12:	01003833          	snez	a6,a6
   21f16:	0106e6b3          	or	a3,a3,a6
   21f1a:	4581                	li	a1,0
   21f1c:	bf69                	j	21eb6 <__adddf3+0xc8>
   21f1e:	00c766b3          	or	a3,a4,a2
   21f22:	00d036b3          	snez	a3,a3
   21f26:	bfd5                	j	21f1a <__adddf3+0x12c>
   21f28:	0a080963          	beqz	a6,21fda <__adddf3+0x1ec>
   21f2c:	409886b3          	sub	a3,a7,s1
   21f30:	ec99                	bnez	s1,21f4e <__adddf3+0x160>
   21f32:	00a7e5b3          	or	a1,a5,a0
   21f36:	40058b63          	beqz	a1,2234c <__adddf3+0x55e>
   21f3a:	fff68593          	add	a1,a3,-1 # 7fffff <__noncacheable_end__+0x73ffff>
   21f3e:	d999                	beqz	a1,21e54 <__adddf3+0x66>
   21f40:	7ff00813          	li	a6,2047
   21f44:	01069d63          	bne	a3,a6,21f5e <__adddf3+0x170>
   21f48:	87ba                	mv	a5,a4
   21f4a:	8532                	mv	a0,a2
   21f4c:	b70d                	j	21e6e <__adddf3+0x80>
   21f4e:	7ff00593          	li	a1,2047
   21f52:	feb88be3          	beq	a7,a1,21f48 <__adddf3+0x15a>
   21f56:	008005b7          	lui	a1,0x800
   21f5a:	8fcd                	or	a5,a5,a1
   21f5c:	85b6                	mv	a1,a3
   21f5e:	03800693          	li	a3,56
   21f62:	06b6c763          	blt	a3,a1,21fd0 <__adddf3+0x1e2>
   21f66:	46fd                	li	a3,31
   21f68:	02b6cd63          	blt	a3,a1,21fa2 <__adddf3+0x1b4>
   21f6c:	02000813          	li	a6,32
   21f70:	40b80833          	sub	a6,a6,a1
   21f74:	010796b3          	sll	a3,a5,a6
   21f78:	00b55333          	srl	t1,a0,a1
   21f7c:	01051833          	sll	a6,a0,a6
   21f80:	0066e6b3          	or	a3,a3,t1
   21f84:	01003833          	snez	a6,a6
   21f88:	0106e6b3          	or	a3,a3,a6
   21f8c:	00b7d5b3          	srl	a1,a5,a1
   21f90:	9636                	add	a2,a2,a3
   21f92:	95ba                	add	a1,a1,a4
   21f94:	00d636b3          	sltu	a3,a2,a3
   21f98:	8532                	mv	a0,a2
   21f9a:	00d587b3          	add	a5,a1,a3
   21f9e:	84c6                	mv	s1,a7
   21fa0:	b70d                	j	21ec2 <__adddf3+0xd4>
   21fa2:	fe058693          	add	a3,a1,-32 # 7fffe0 <__noncacheable_end__+0x73ffe0>
   21fa6:	02000313          	li	t1,32
   21faa:	00d7d6b3          	srl	a3,a5,a3
   21fae:	4801                	li	a6,0
   21fb0:	00658863          	beq	a1,t1,21fc0 <__adddf3+0x1d2>
   21fb4:	04000813          	li	a6,64
   21fb8:	40b80833          	sub	a6,a6,a1
   21fbc:	01079833          	sll	a6,a5,a6
   21fc0:	00a86833          	or	a6,a6,a0
   21fc4:	01003833          	snez	a6,a6
   21fc8:	0106e6b3          	or	a3,a3,a6
   21fcc:	4581                	li	a1,0
   21fce:	b7c9                	j	21f90 <__adddf3+0x1a2>
   21fd0:	00a7e6b3          	or	a3,a5,a0
   21fd4:	00d036b3          	snez	a3,a3
   21fd8:	bfd5                	j	21fcc <__adddf3+0x1de>
   21fda:	00148693          	add	a3,s1,1
   21fde:	7fe6f593          	and	a1,a3,2046
   21fe2:	e5a5                	bnez	a1,2204a <__adddf3+0x25c>
   21fe4:	00a7e6b3          	or	a3,a5,a0
   21fe8:	e4b1                	bnez	s1,22034 <__adddf3+0x246>
   21fea:	36068463          	beqz	a3,22352 <__adddf3+0x564>
   21fee:	00c766b3          	or	a3,a4,a2
   21ff2:	c28d                	beqz	a3,22014 <__adddf3+0x226>
   21ff4:	962a                	add	a2,a2,a0
   21ff6:	00a636b3          	sltu	a3,a2,a0
   21ffa:	973e                	add	a4,a4,a5
   21ffc:	00d707b3          	add	a5,a4,a3
   22000:	00879713          	sll	a4,a5,0x8
   22004:	8532                	mv	a0,a2
   22006:	00075763          	bgez	a4,22014 <__adddf3+0x226>
   2200a:	ff800737          	lui	a4,0xff800
   2200e:	177d                	add	a4,a4,-1 # ff7fffff <__share_mem_end__+0xfe73ffff>
   22010:	8ff9                	and	a5,a5,a4
   22012:	4485                	li	s1,1
   22014:	00757713          	and	a4,a0,7
   22018:	34070d63          	beqz	a4,22372 <__adddf3+0x584>
   2201c:	00f57713          	and	a4,a0,15
   22020:	4691                	li	a3,4
   22022:	34d70863          	beq	a4,a3,22372 <__adddf3+0x584>
   22026:	00450713          	add	a4,a0,4
   2202a:	00a736b3          	sltu	a3,a4,a0
   2202e:	97b6                	add	a5,a5,a3
   22030:	853a                	mv	a0,a4
   22032:	a681                	j	22372 <__adddf3+0x584>
   22034:	da91                	beqz	a3,21f48 <__adddf3+0x15a>
   22036:	8e59                	or	a2,a2,a4
   22038:	e2060be3          	beqz	a2,21e6e <__adddf3+0x80>
   2203c:	4901                	li	s2,0
   2203e:	004007b7          	lui	a5,0x400
   22042:	4501                	li	a0,0
   22044:	7ff00493          	li	s1,2047
   22048:	a62d                	j	22372 <__adddf3+0x584>
   2204a:	7ff00593          	li	a1,2047
   2204e:	30b68563          	beq	a3,a1,22358 <__adddf3+0x56a>
   22052:	962a                	add	a2,a2,a0
   22054:	00a63533          	sltu	a0,a2,a0
   22058:	973e                	add	a4,a4,a5
   2205a:	972a                	add	a4,a4,a0
   2205c:	01f71513          	sll	a0,a4,0x1f
   22060:	8205                	srl	a2,a2,0x1
   22062:	8d51                	or	a0,a0,a2
   22064:	00175793          	srl	a5,a4,0x1
   22068:	84b6                	mv	s1,a3
   2206a:	b76d                	j	22014 <__adddf3+0x226>
   2206c:	0d005a63          	blez	a6,22140 <__adddf3+0x352>
   22070:	08089463          	bnez	a7,220f8 <__adddf3+0x30a>
   22074:	00c766b3          	or	a3,a4,a2
   22078:	2e068563          	beqz	a3,22362 <__adddf3+0x574>
   2207c:	fff80693          	add	a3,a6,-1
   22080:	ee81                	bnez	a3,22098 <__adddf3+0x2aa>
   22082:	40c50633          	sub	a2,a0,a2
   22086:	00c536b3          	sltu	a3,a0,a2
   2208a:	40e78733          	sub	a4,a5,a4
   2208e:	8532                	mv	a0,a2
   22090:	40d707b3          	sub	a5,a4,a3
   22094:	4485                	li	s1,1
   22096:	a0b9                	j	220e4 <__adddf3+0x2f6>
   22098:	7ff00593          	li	a1,2047
   2209c:	dcb809e3          	beq	a6,a1,21e6e <__adddf3+0x80>
   220a0:	03800593          	li	a1,56
   220a4:	08d5ca63          	blt	a1,a3,22138 <__adddf3+0x34a>
   220a8:	45fd                	li	a1,31
   220aa:	06d5c063          	blt	a1,a3,2210a <__adddf3+0x31c>
   220ae:	02000813          	li	a6,32
   220b2:	40d80833          	sub	a6,a6,a3
   220b6:	00d658b3          	srl	a7,a2,a3
   220ba:	010715b3          	sll	a1,a4,a6
   220be:	01061833          	sll	a6,a2,a6
   220c2:	0115e5b3          	or	a1,a1,a7
   220c6:	01003833          	snez	a6,a6
   220ca:	0105e633          	or	a2,a1,a6
   220ce:	00d756b3          	srl	a3,a4,a3
   220d2:	40c50633          	sub	a2,a0,a2
   220d6:	00c53733          	sltu	a4,a0,a2
   220da:	40d786b3          	sub	a3,a5,a3
   220de:	8532                	mv	a0,a2
   220e0:	40e687b3          	sub	a5,a3,a4
   220e4:	00879713          	sll	a4,a5,0x8
   220e8:	f20756e3          	bgez	a4,22014 <__adddf3+0x226>
   220ec:	00800437          	lui	s0,0x800
   220f0:	147d                	add	s0,s0,-1 # 7fffff <__noncacheable_end__+0x73ffff>
   220f2:	8c7d                	and	s0,s0,a5
   220f4:	89aa                	mv	s3,a0
   220f6:	aa45                	j	222a6 <__adddf3+0x4b8>
   220f8:	7ff00693          	li	a3,2047
   220fc:	f0d48ce3          	beq	s1,a3,22014 <__adddf3+0x226>
   22100:	008006b7          	lui	a3,0x800
   22104:	8f55                	or	a4,a4,a3
   22106:	86c2                	mv	a3,a6
   22108:	bf61                	j	220a0 <__adddf3+0x2b2>
   2210a:	fe068593          	add	a1,a3,-32 # 7fffe0 <__noncacheable_end__+0x73ffe0>
   2210e:	02000893          	li	a7,32
   22112:	00b755b3          	srl	a1,a4,a1
   22116:	4801                	li	a6,0
   22118:	01168863          	beq	a3,a7,22128 <__adddf3+0x33a>
   2211c:	04000813          	li	a6,64
   22120:	40d80833          	sub	a6,a6,a3
   22124:	01071833          	sll	a6,a4,a6
   22128:	00c86833          	or	a6,a6,a2
   2212c:	01003833          	snez	a6,a6
   22130:	0105e633          	or	a2,a1,a6
   22134:	4681                	li	a3,0
   22136:	bf71                	j	220d2 <__adddf3+0x2e4>
   22138:	8e59                	or	a2,a2,a4
   2213a:	00c03633          	snez	a2,a2
   2213e:	bfdd                	j	22134 <__adddf3+0x346>
   22140:	0c080563          	beqz	a6,2220a <__adddf3+0x41c>
   22144:	40988833          	sub	a6,a7,s1
   22148:	e895                	bnez	s1,2217c <__adddf3+0x38e>
   2214a:	00a7e5b3          	or	a1,a5,a0
   2214e:	20058c63          	beqz	a1,22366 <__adddf3+0x578>
   22152:	fff80593          	add	a1,a6,-1
   22156:	e991                	bnez	a1,2216a <__adddf3+0x37c>
   22158:	40a60533          	sub	a0,a2,a0
   2215c:	8f1d                	sub	a4,a4,a5
   2215e:	00a63633          	sltu	a2,a2,a0
   22162:	40c707b3          	sub	a5,a4,a2
   22166:	8936                	mv	s2,a3
   22168:	b735                	j	22094 <__adddf3+0x2a6>
   2216a:	7ff00313          	li	t1,2047
   2216e:	00681f63          	bne	a6,t1,2218c <__adddf3+0x39e>
   22172:	87ba                	mv	a5,a4
   22174:	8532                	mv	a0,a2
   22176:	7ff00493          	li	s1,2047
   2217a:	a07d                	j	22228 <__adddf3+0x43a>
   2217c:	7ff00593          	li	a1,2047
   22180:	feb889e3          	beq	a7,a1,22172 <__adddf3+0x384>
   22184:	008005b7          	lui	a1,0x800
   22188:	8fcd                	or	a5,a5,a1
   2218a:	85c2                	mv	a1,a6
   2218c:	03800813          	li	a6,56
   22190:	06b84963          	blt	a6,a1,22202 <__adddf3+0x414>
   22194:	487d                	li	a6,31
   22196:	02b84f63          	blt	a6,a1,221d4 <__adddf3+0x3e6>
   2219a:	02000313          	li	t1,32
   2219e:	40b30333          	sub	t1,t1,a1
   221a2:	00b55e33          	srl	t3,a0,a1
   221a6:	00679833          	sll	a6,a5,t1
   221aa:	00651333          	sll	t1,a0,t1
   221ae:	01c86833          	or	a6,a6,t3
   221b2:	00603333          	snez	t1,t1
   221b6:	00686533          	or	a0,a6,t1
   221ba:	00b7d5b3          	srl	a1,a5,a1
   221be:	40a60533          	sub	a0,a2,a0
   221c2:	40b705b3          	sub	a1,a4,a1
   221c6:	00a63633          	sltu	a2,a2,a0
   221ca:	40c587b3          	sub	a5,a1,a2
   221ce:	84c6                	mv	s1,a7
   221d0:	8936                	mv	s2,a3
   221d2:	bf09                	j	220e4 <__adddf3+0x2f6>
   221d4:	fe058813          	add	a6,a1,-32 # 7fffe0 <__noncacheable_end__+0x73ffe0>
   221d8:	02000e13          	li	t3,32
   221dc:	0107d833          	srl	a6,a5,a6
   221e0:	4301                	li	t1,0
   221e2:	01c58863          	beq	a1,t3,221f2 <__adddf3+0x404>
   221e6:	04000313          	li	t1,64
   221ea:	40b30333          	sub	t1,t1,a1
   221ee:	00679333          	sll	t1,a5,t1
   221f2:	00a36333          	or	t1,t1,a0
   221f6:	00603333          	snez	t1,t1
   221fa:	00686533          	or	a0,a6,t1
   221fe:	4581                	li	a1,0
   22200:	bf7d                	j	221be <__adddf3+0x3d0>
   22202:	8d5d                	or	a0,a0,a5
   22204:	00a03533          	snez	a0,a0
   22208:	bfdd                	j	221fe <__adddf3+0x410>
   2220a:	00148593          	add	a1,s1,1
   2220e:	7fe5f593          	and	a1,a1,2046
   22212:	e5ad                	bnez	a1,2227c <__adddf3+0x48e>
   22214:	00a7e833          	or	a6,a5,a0
   22218:	00c765b3          	or	a1,a4,a2
   2221c:	e4a9                	bnez	s1,22266 <__adddf3+0x478>
   2221e:	00081763          	bnez	a6,2222c <__adddf3+0x43e>
   22222:	cde9                	beqz	a1,222fc <__adddf3+0x50e>
   22224:	87ba                	mv	a5,a4
   22226:	8532                	mv	a0,a2
   22228:	8936                	mv	s2,a3
   2222a:	b3ed                	j	22014 <__adddf3+0x226>
   2222c:	de0584e3          	beqz	a1,22014 <__adddf3+0x226>
   22230:	40c50833          	sub	a6,a0,a2
   22234:	010538b3          	sltu	a7,a0,a6
   22238:	40e785b3          	sub	a1,a5,a4
   2223c:	411585b3          	sub	a1,a1,a7
   22240:	00859893          	sll	a7,a1,0x8
   22244:	0008da63          	bgez	a7,22258 <__adddf3+0x46a>
   22248:	40a60533          	sub	a0,a2,a0
   2224c:	8f1d                	sub	a4,a4,a5
   2224e:	00a63633          	sltu	a2,a2,a0
   22252:	40c707b3          	sub	a5,a4,a2
   22256:	bfc9                	j	22228 <__adddf3+0x43a>
   22258:	00b86533          	or	a0,a6,a1
   2225c:	10050963          	beqz	a0,2236e <__adddf3+0x580>
   22260:	87ae                	mv	a5,a1
   22262:	8542                	mv	a0,a6
   22264:	bb45                	j	22014 <__adddf3+0x226>
   22266:	00081863          	bnez	a6,22276 <__adddf3+0x488>
   2226a:	dc0589e3          	beqz	a1,2203c <__adddf3+0x24e>
   2226e:	87ba                	mv	a5,a4
   22270:	8532                	mv	a0,a2
   22272:	8936                	mv	s2,a3
   22274:	beed                	j	21e6e <__adddf3+0x80>
   22276:	be058ce3          	beqz	a1,21e6e <__adddf3+0x80>
   2227a:	b3c9                	j	2203c <__adddf3+0x24e>
   2227c:	40c505b3          	sub	a1,a0,a2
   22280:	00b53833          	sltu	a6,a0,a1
   22284:	40e78433          	sub	s0,a5,a4
   22288:	41040433          	sub	s0,s0,a6
   2228c:	00841813          	sll	a6,s0,0x8
   22290:	89ae                	mv	s3,a1
   22292:	06085263          	bgez	a6,222f6 <__adddf3+0x508>
   22296:	40a609b3          	sub	s3,a2,a0
   2229a:	40f70433          	sub	s0,a4,a5
   2229e:	01363633          	sltu	a2,a2,s3
   222a2:	8c11                	sub	s0,s0,a2
   222a4:	8936                	mv	s2,a3
   222a6:	cc29                	beqz	s0,22300 <__adddf3+0x512>
   222a8:	8522                	mv	a0,s0
   222aa:	3c75                	jal	21d66 <__clzsi2>
   222ac:	ff850693          	add	a3,a0,-8
   222b0:	02000793          	li	a5,32
   222b4:	8f95                	sub	a5,a5,a3
   222b6:	00d41433          	sll	s0,s0,a3
   222ba:	00f9d7b3          	srl	a5,s3,a5
   222be:	8fc1                	or	a5,a5,s0
   222c0:	00d99433          	sll	s0,s3,a3
   222c4:	0696cd63          	blt	a3,s1,2233e <__adddf3+0x550>
   222c8:	8e85                	sub	a3,a3,s1
   222ca:	00168613          	add	a2,a3,1
   222ce:	477d                	li	a4,31
   222d0:	04c74463          	blt	a4,a2,22318 <__adddf3+0x52a>
   222d4:	02000713          	li	a4,32
   222d8:	8f11                	sub	a4,a4,a2
   222da:	00e79533          	sll	a0,a5,a4
   222de:	00c456b3          	srl	a3,s0,a2
   222e2:	00e41733          	sll	a4,s0,a4
   222e6:	8d55                	or	a0,a0,a3
   222e8:	00e03733          	snez	a4,a4
   222ec:	8d59                	or	a0,a0,a4
   222ee:	00c7d7b3          	srl	a5,a5,a2
   222f2:	4481                	li	s1,0
   222f4:	b305                	j	22014 <__adddf3+0x226>
   222f6:	8dc1                	or	a1,a1,s0
   222f8:	f5dd                	bnez	a1,222a6 <__adddf3+0x4b8>
   222fa:	4481                	li	s1,0
   222fc:	4901                	li	s2,0
   222fe:	a8b9                	j	2235c <__adddf3+0x56e>
   22300:	854e                	mv	a0,s3
   22302:	3495                	jal	21d66 <__clzsi2>
   22304:	01850693          	add	a3,a0,24
   22308:	47fd                	li	a5,31
   2230a:	fad7d3e3          	bge	a5,a3,222b0 <__adddf3+0x4c2>
   2230e:	ff850793          	add	a5,a0,-8
   22312:	00f997b3          	sll	a5,s3,a5
   22316:	b77d                	j	222c4 <__adddf3+0x4d6>
   22318:	1685                	add	a3,a3,-31
   2231a:	00d7d533          	srl	a0,a5,a3
   2231e:	02000693          	li	a3,32
   22322:	4701                	li	a4,0
   22324:	00d60763          	beq	a2,a3,22332 <__adddf3+0x544>
   22328:	04000713          	li	a4,64
   2232c:	8f11                	sub	a4,a4,a2
   2232e:	00e79733          	sll	a4,a5,a4
   22332:	8f41                	or	a4,a4,s0
   22334:	00e03733          	snez	a4,a4
   22338:	8d59                	or	a0,a0,a4
   2233a:	4781                	li	a5,0
   2233c:	bf5d                	j	222f2 <__adddf3+0x504>
   2233e:	ff800737          	lui	a4,0xff800
   22342:	177d                	add	a4,a4,-1 # ff7fffff <__share_mem_end__+0xfe73ffff>
   22344:	8c95                	sub	s1,s1,a3
   22346:	8ff9                	and	a5,a5,a4
   22348:	8522                	mv	a0,s0
   2234a:	b1e9                	j	22014 <__adddf3+0x226>
   2234c:	87ba                	mv	a5,a4
   2234e:	8532                	mv	a0,a2
   22350:	bb21                	j	22068 <__adddf3+0x27a>
   22352:	87ba                	mv	a5,a4
   22354:	8532                	mv	a0,a2
   22356:	b97d                	j	22014 <__adddf3+0x226>
   22358:	7ff00493          	li	s1,2047
   2235c:	4781                	li	a5,0
   2235e:	4501                	li	a0,0
   22360:	a809                	j	22372 <__adddf3+0x584>
   22362:	84c2                	mv	s1,a6
   22364:	b945                	j	22014 <__adddf3+0x226>
   22366:	87ba                	mv	a5,a4
   22368:	8532                	mv	a0,a2
   2236a:	84c2                	mv	s1,a6
   2236c:	bd75                	j	22228 <__adddf3+0x43a>
   2236e:	4781                	li	a5,0
   22370:	4901                	li	s2,0
   22372:	00879713          	sll	a4,a5,0x8
   22376:	00075b63          	bgez	a4,2238c <__adddf3+0x59e>
   2237a:	0485                	add	s1,s1,1
   2237c:	7ff00713          	li	a4,2047
   22380:	04e48b63          	beq	s1,a4,223d6 <__adddf3+0x5e8>
   22384:	ff800737          	lui	a4,0xff800
   22388:	177d                	add	a4,a4,-1 # ff7fffff <__share_mem_end__+0xfe73ffff>
   2238a:	8ff9                	and	a5,a5,a4
   2238c:	01d79693          	sll	a3,a5,0x1d
   22390:	810d                	srl	a0,a0,0x3
   22392:	7ff00713          	li	a4,2047
   22396:	8ec9                	or	a3,a3,a0
   22398:	838d                	srl	a5,a5,0x3
   2239a:	00e49963          	bne	s1,a4,223ac <__adddf3+0x5be>
   2239e:	8edd                	or	a3,a3,a5
   223a0:	4781                	li	a5,0
   223a2:	c689                	beqz	a3,223ac <__adddf3+0x5be>
   223a4:	000807b7          	lui	a5,0x80
   223a8:	4681                	li	a3,0
   223aa:	4901                	li	s2,0
   223ac:	01449713          	sll	a4,s1,0x14
   223b0:	7ff00637          	lui	a2,0x7ff00
   223b4:	07b2                	sll	a5,a5,0xc
   223b6:	8f71                	and	a4,a4,a2
   223b8:	40f2                	lw	ra,28(sp)
   223ba:	4462                	lw	s0,24(sp)
   223bc:	83b1                	srl	a5,a5,0xc
   223be:	8fd9                	or	a5,a5,a4
   223c0:	01f91713          	sll	a4,s2,0x1f
   223c4:	00e7e633          	or	a2,a5,a4
   223c8:	44d2                	lw	s1,20(sp)
   223ca:	4942                	lw	s2,16(sp)
   223cc:	49b2                	lw	s3,12(sp)
   223ce:	8536                	mv	a0,a3
   223d0:	85b2                	mv	a1,a2
   223d2:	6105                	add	sp,sp,32
   223d4:	8082                	ret
   223d6:	4781                	li	a5,0
   223d8:	4501                	li	a0,0
   223da:	bf4d                	j	2238c <__adddf3+0x59e>

000223dc <__eqdf2>:
   223dc:	0145d713          	srl	a4,a1,0x14
   223e0:	001007b7          	lui	a5,0x100
   223e4:	17fd                	add	a5,a5,-1 # fffff <__noncacheable_end__+0x3ffff>
   223e6:	0146d813          	srl	a6,a3,0x14
   223ea:	832a                	mv	t1,a0
   223ec:	8eaa                	mv	t4,a0
   223ee:	7ff77713          	and	a4,a4,2047
   223f2:	7ff00513          	li	a0,2047
   223f6:	00b7f8b3          	and	a7,a5,a1
   223fa:	8f32                	mv	t5,a2
   223fc:	8ff5                	and	a5,a5,a3
   223fe:	81fd                	srl	a1,a1,0x1f
   22400:	7ff87813          	and	a6,a6,2047
   22404:	82fd                	srl	a3,a3,0x1f
   22406:	00a71a63          	bne	a4,a0,2241a <__eqdf2+0x3e>
   2240a:	0068ee33          	or	t3,a7,t1
   2240e:	4505                	li	a0,1
   22410:	000e1463          	bnez	t3,22418 <__eqdf2+0x3c>
   22414:	00e80563          	beq	a6,a4,2241e <__eqdf2+0x42>
   22418:	8082                	ret
   2241a:	00a81563          	bne	a6,a0,22424 <__eqdf2+0x48>
   2241e:	8e5d                	or	a2,a2,a5
   22420:	4505                	li	a0,1
   22422:	fa7d                	bnez	a2,22418 <__eqdf2+0x3c>
   22424:	4505                	li	a0,1
   22426:	ff0719e3          	bne	a4,a6,22418 <__eqdf2+0x3c>
   2242a:	fef897e3          	bne	a7,a5,22418 <__eqdf2+0x3c>
   2242e:	ffee95e3          	bne	t4,t5,22418 <__eqdf2+0x3c>
   22432:	00d58863          	beq	a1,a3,22442 <__eqdf2+0x66>
   22436:	f36d                	bnez	a4,22418 <__eqdf2+0x3c>
   22438:	0068e8b3          	or	a7,a7,t1
   2243c:	01103533          	snez	a0,a7
   22440:	8082                	ret
   22442:	4501                	li	a0,0
   22444:	8082                	ret

00022446 <__gedf2>:
   22446:	0146d793          	srl	a5,a3,0x14
   2244a:	0145d893          	srl	a7,a1,0x14
   2244e:	00100737          	lui	a4,0x100
   22452:	177d                	add	a4,a4,-1 # fffff <__noncacheable_end__+0x3ffff>
   22454:	882a                	mv	a6,a0
   22456:	8e2a                	mv	t3,a0
   22458:	7ff8f893          	and	a7,a7,2047
   2245c:	7ff7f513          	and	a0,a5,2047
   22460:	7ff00793          	li	a5,2047
   22464:	00b77333          	and	t1,a4,a1
   22468:	8eb2                	mv	t4,a2
   2246a:	8f75                	and	a4,a4,a3
   2246c:	81fd                	srl	a1,a1,0x1f
   2246e:	82fd                	srl	a3,a3,0x1f
   22470:	00f89563          	bne	a7,a5,2247a <__gedf2+0x34>
   22474:	010367b3          	or	a5,t1,a6
   22478:	eba9                	bnez	a5,224ca <__gedf2+0x84>
   2247a:	7ff00793          	li	a5,2047
   2247e:	00f51563          	bne	a0,a5,22488 <__gedf2+0x42>
   22482:	00c767b3          	or	a5,a4,a2
   22486:	e3b1                	bnez	a5,224ca <__gedf2+0x84>
   22488:	4781                	li	a5,0
   2248a:	00089663          	bnez	a7,22496 <__gedf2+0x50>
   2248e:	01036833          	or	a6,t1,a6
   22492:	00183793          	seqz	a5,a6
   22496:	ed05                	bnez	a0,224ce <__gedf2+0x88>
   22498:	8e59                	or	a2,a2,a4
   2249a:	c791                	beqz	a5,224a6 <__gedf2+0x60>
   2249c:	ca01                	beqz	a2,224ac <__gedf2+0x66>
   2249e:	4505                	li	a0,1
   224a0:	e691                	bnez	a3,224ac <__gedf2+0x66>
   224a2:	557d                	li	a0,-1
   224a4:	8082                	ret
   224a6:	e60d                	bnez	a2,224d0 <__gedf2+0x8a>
   224a8:	557d                	li	a0,-1
   224aa:	c98d                	beqz	a1,224dc <__gedf2+0x96>
   224ac:	8082                	ret
   224ae:	fea8c8e3          	blt	a7,a0,2249e <__gedf2+0x58>
   224b2:	fe676be3          	bltu	a4,t1,224a8 <__gedf2+0x62>
   224b6:	00e31763          	bne	t1,a4,224c4 <__gedf2+0x7e>
   224ba:	ffcee7e3          	bltu	t4,t3,224a8 <__gedf2+0x62>
   224be:	4501                	li	a0,0
   224c0:	ffde76e3          	bgeu	t3,t4,224ac <__gedf2+0x66>
   224c4:	4505                	li	a0,1
   224c6:	f1fd                	bnez	a1,224ac <__gedf2+0x66>
   224c8:	bfe9                	j	224a2 <__gedf2+0x5c>
   224ca:	5579                	li	a0,-2
   224cc:	8082                	ret
   224ce:	fbe1                	bnez	a5,2249e <__gedf2+0x58>
   224d0:	fcb69ce3          	bne	a3,a1,224a8 <__gedf2+0x62>
   224d4:	fd155de3          	bge	a0,a7,224ae <__gedf2+0x68>
   224d8:	557d                	li	a0,-1
   224da:	fae9                	bnez	a3,224ac <__gedf2+0x66>
   224dc:	4505                	li	a0,1
   224de:	8082                	ret

000224e0 <__ledf2>:
   224e0:	0146d793          	srl	a5,a3,0x14
   224e4:	0145d893          	srl	a7,a1,0x14
   224e8:	00100737          	lui	a4,0x100
   224ec:	177d                	add	a4,a4,-1 # fffff <__noncacheable_end__+0x3ffff>
   224ee:	882a                	mv	a6,a0
   224f0:	8e2a                	mv	t3,a0
   224f2:	7ff8f893          	and	a7,a7,2047
   224f6:	7ff7f513          	and	a0,a5,2047
   224fa:	7ff00793          	li	a5,2047
   224fe:	00b77333          	and	t1,a4,a1
   22502:	8eb2                	mv	t4,a2
   22504:	8f75                	and	a4,a4,a3
   22506:	81fd                	srl	a1,a1,0x1f
   22508:	82fd                	srl	a3,a3,0x1f
   2250a:	00f89563          	bne	a7,a5,22514 <__ledf2+0x34>
   2250e:	010367b3          	or	a5,t1,a6
   22512:	eba9                	bnez	a5,22564 <__ledf2+0x84>
   22514:	7ff00793          	li	a5,2047
   22518:	00f51563          	bne	a0,a5,22522 <__ledf2+0x42>
   2251c:	00c767b3          	or	a5,a4,a2
   22520:	e3b1                	bnez	a5,22564 <__ledf2+0x84>
   22522:	4781                	li	a5,0
   22524:	00089663          	bnez	a7,22530 <__ledf2+0x50>
   22528:	01036833          	or	a6,t1,a6
   2252c:	00183793          	seqz	a5,a6
   22530:	ed05                	bnez	a0,22568 <__ledf2+0x88>
   22532:	8e59                	or	a2,a2,a4
   22534:	c791                	beqz	a5,22540 <__ledf2+0x60>
   22536:	ca01                	beqz	a2,22546 <__ledf2+0x66>
   22538:	4505                	li	a0,1
   2253a:	e691                	bnez	a3,22546 <__ledf2+0x66>
   2253c:	557d                	li	a0,-1
   2253e:	8082                	ret
   22540:	e60d                	bnez	a2,2256a <__ledf2+0x8a>
   22542:	557d                	li	a0,-1
   22544:	c98d                	beqz	a1,22576 <__ledf2+0x96>
   22546:	8082                	ret
   22548:	fea8c8e3          	blt	a7,a0,22538 <__ledf2+0x58>
   2254c:	fe676be3          	bltu	a4,t1,22542 <__ledf2+0x62>
   22550:	00e31763          	bne	t1,a4,2255e <__ledf2+0x7e>
   22554:	ffcee7e3          	bltu	t4,t3,22542 <__ledf2+0x62>
   22558:	4501                	li	a0,0
   2255a:	ffde76e3          	bgeu	t3,t4,22546 <__ledf2+0x66>
   2255e:	4505                	li	a0,1
   22560:	f1fd                	bnez	a1,22546 <__ledf2+0x66>
   22562:	bfe9                	j	2253c <__ledf2+0x5c>
   22564:	4509                	li	a0,2
   22566:	8082                	ret
   22568:	fbe1                	bnez	a5,22538 <__ledf2+0x58>
   2256a:	fcb69ce3          	bne	a3,a1,22542 <__ledf2+0x62>
   2256e:	fd155de3          	bge	a0,a7,22548 <__ledf2+0x68>
   22572:	557d                	li	a0,-1
   22574:	fae9                	bnez	a3,22546 <__ledf2+0x66>
   22576:	4505                	li	a0,1
   22578:	8082                	ret

0002257a <__unorddf2>:
   2257a:	001007b7          	lui	a5,0x100
   2257e:	17fd                	add	a5,a5,-1 # fffff <__noncacheable_end__+0x3ffff>
   22580:	00b7f733          	and	a4,a5,a1
   22584:	81d1                	srl	a1,a1,0x14
   22586:	fff5c593          	not	a1,a1
   2258a:	8ff5                	and	a5,a5,a3
   2258c:	01559813          	sll	a6,a1,0x15
   22590:	82d1                	srl	a3,a3,0x14
   22592:	7ff6f693          	and	a3,a3,2047
   22596:	00081563          	bnez	a6,225a0 <__unorddf2+0x26>
   2259a:	8f49                	or	a4,a4,a0
   2259c:	4505                	li	a0,1
   2259e:	eb09                	bnez	a4,225b0 <__unorddf2+0x36>
   225a0:	7ff00713          	li	a4,2047
   225a4:	4501                	li	a0,0
   225a6:	00e69563          	bne	a3,a4,225b0 <__unorddf2+0x36>
   225aa:	8fd1                	or	a5,a5,a2
   225ac:	00f03533          	snez	a0,a5
   225b0:	8082                	ret

000225b2 <__fixdfsi>:
   225b2:	0145d713          	srl	a4,a1,0x14
   225b6:	001006b7          	lui	a3,0x100
   225ba:	fff68793          	add	a5,a3,-1 # fffff <__noncacheable_end__+0x3ffff>
   225be:	7ff77713          	and	a4,a4,2047
   225c2:	3fe00613          	li	a2,1022
   225c6:	8fed                	and	a5,a5,a1
   225c8:	81fd                	srl	a1,a1,0x1f
   225ca:	04e65463          	bge	a2,a4,22612 <__fixdfsi+0x60>
   225ce:	41d00613          	li	a2,1053
   225d2:	00e65763          	bge	a2,a4,225e0 <__fixdfsi+0x2e>
   225d6:	80000537          	lui	a0,0x80000
   225da:	157d                	add	a0,a0,-1 # 7fffffff <__share_mem_end__+0x7ef3ffff>
   225dc:	952e                	add	a0,a0,a1
   225de:	8082                	ret
   225e0:	8fd5                	or	a5,a5,a3
   225e2:	43300693          	li	a3,1075
   225e6:	8e99                	sub	a3,a3,a4
   225e8:	467d                	li	a2,31
   225ea:	00d64d63          	blt	a2,a3,22604 <__fixdfsi+0x52>
   225ee:	bed70713          	add	a4,a4,-1043
   225f2:	00e797b3          	sll	a5,a5,a4
   225f6:	00d55533          	srl	a0,a0,a3
   225fa:	8d5d                	or	a0,a0,a5
   225fc:	cd81                	beqz	a1,22614 <__fixdfsi+0x62>
   225fe:	40a00533          	neg	a0,a0
   22602:	8082                	ret
   22604:	41300693          	li	a3,1043
   22608:	40e68733          	sub	a4,a3,a4
   2260c:	00e7d533          	srl	a0,a5,a4
   22610:	b7f5                	j	225fc <__fixdfsi+0x4a>
   22612:	4501                	li	a0,0
   22614:	8082                	ret

00022616 <__floatsidf>:
   22616:	1141                	add	sp,sp,-16
   22618:	c606                	sw	ra,12(sp)
   2261a:	c422                	sw	s0,8(sp)
   2261c:	c226                	sw	s1,4(sp)
   2261e:	cd29                	beqz	a0,22678 <__floatsidf+0x62>
   22620:	41f55793          	sra	a5,a0,0x1f
   22624:	00a7c433          	xor	s0,a5,a0
   22628:	8c1d                	sub	s0,s0,a5
   2262a:	01f55493          	srl	s1,a0,0x1f
   2262e:	8522                	mv	a0,s0
   22630:	f36ff0ef          	jal	21d66 <__clzsi2>
   22634:	41e00713          	li	a4,1054
   22638:	47a9                	li	a5,10
   2263a:	8f09                	sub	a4,a4,a0
   2263c:	02a7c863          	blt	a5,a0,2266c <__floatsidf+0x56>
   22640:	47ad                	li	a5,11
   22642:	8f89                	sub	a5,a5,a0
   22644:	0555                	add	a0,a0,21
   22646:	00f457b3          	srl	a5,s0,a5
   2264a:	00a41433          	sll	s0,s0,a0
   2264e:	8526                	mv	a0,s1
   22650:	07b2                	sll	a5,a5,0xc
   22652:	83b1                	srl	a5,a5,0xc
   22654:	0752                	sll	a4,a4,0x14
   22656:	057e                	sll	a0,a0,0x1f
   22658:	8f5d                	or	a4,a4,a5
   2265a:	40b2                	lw	ra,12(sp)
   2265c:	00a767b3          	or	a5,a4,a0
   22660:	8522                	mv	a0,s0
   22662:	4422                	lw	s0,8(sp)
   22664:	4492                	lw	s1,4(sp)
   22666:	85be                	mv	a1,a5
   22668:	0141                	add	sp,sp,16
   2266a:	8082                	ret
   2266c:	1555                	add	a0,a0,-11
   2266e:	00a417b3          	sll	a5,s0,a0
   22672:	8526                	mv	a0,s1
   22674:	4401                	li	s0,0
   22676:	bfe9                	j	22650 <__floatsidf+0x3a>
   22678:	4701                	li	a4,0
   2267a:	4781                	li	a5,0
   2267c:	bfe5                	j	22674 <__floatsidf+0x5e>

0002267e <__fixdfdi>:
   2267e:	00100737          	lui	a4,0x100
   22682:	0145d613          	srl	a2,a1,0x14
   22686:	fff70793          	add	a5,a4,-1 # fffff <__noncacheable_end__+0x3ffff>
   2268a:	7ff67613          	and	a2,a2,2047
   2268e:	3fe00693          	li	a3,1022
   22692:	8fed                	and	a5,a5,a1
   22694:	06c6df63          	bge	a3,a2,22712 <__fixdfdi+0x94>
   22698:	1141                	add	sp,sp,-16
   2269a:	c422                	sw	s0,8(sp)
   2269c:	c606                	sw	ra,12(sp)
   2269e:	43d00693          	li	a3,1085
   226a2:	01f5d413          	srl	s0,a1,0x1f
   226a6:	00c6dc63          	bge	a3,a2,226be <__fixdfdi+0x40>
   226aa:	800005b7          	lui	a1,0x80000
   226ae:	15fd                	add	a1,a1,-1 # 7fffffff <__share_mem_end__+0x7ef3ffff>
   226b0:	fff40513          	add	a0,s0,-1
   226b4:	95a2                	add	a1,a1,s0
   226b6:	40b2                	lw	ra,12(sp)
   226b8:	4422                	lw	s0,8(sp)
   226ba:	0141                	add	sp,sp,16
   226bc:	8082                	ret
   226be:	00e7e5b3          	or	a1,a5,a4
   226c2:	43200793          	li	a5,1074
   226c6:	00c7df63          	bge	a5,a2,226e4 <__fixdfdi+0x66>
   226ca:	bcd60613          	add	a2,a2,-1075 # 7feffbcd <__share_mem_end__+0x7ee3fbcd>
   226ce:	e70ff0ef          	jal	21d3e <__ashldi3>
   226d2:	d075                	beqz	s0,226b6 <__fixdfdi+0x38>
   226d4:	00a037b3          	snez	a5,a0
   226d8:	40b005b3          	neg	a1,a1
   226dc:	8d9d                	sub	a1,a1,a5
   226de:	40a00533          	neg	a0,a0
   226e2:	bfd1                	j	226b6 <__fixdfdi+0x38>
   226e4:	43300793          	li	a5,1075
   226e8:	8f91                	sub	a5,a5,a2
   226ea:	477d                	li	a4,31
   226ec:	00f74c63          	blt	a4,a5,22704 <__fixdfdi+0x86>
   226f0:	bed60613          	add	a2,a2,-1043
   226f4:	00c59633          	sll	a2,a1,a2
   226f8:	00f55533          	srl	a0,a0,a5
   226fc:	8d51                	or	a0,a0,a2
   226fe:	00f5d5b3          	srl	a1,a1,a5
   22702:	bfc1                	j	226d2 <__fixdfdi+0x54>
   22704:	41300513          	li	a0,1043
   22708:	8d11                	sub	a0,a0,a2
   2270a:	00a5d533          	srl	a0,a1,a0
   2270e:	4581                	li	a1,0
   22710:	b7c9                	j	226d2 <__fixdfdi+0x54>
   22712:	4501                	li	a0,0
   22714:	4581                	li	a1,0
   22716:	8082                	ret

00022718 <__floatdidf>:
   22718:	1101                	add	sp,sp,-32
   2271a:	ce06                	sw	ra,28(sp)
   2271c:	cc22                	sw	s0,24(sp)
   2271e:	ca26                	sw	s1,20(sp)
   22720:	c84a                	sw	s2,16(sp)
   22722:	c64e                	sw	s3,12(sp)
   22724:	c452                	sw	s4,8(sp)
   22726:	c256                	sw	s5,4(sp)
   22728:	c05a                	sw	s6,0(sp)
   2272a:	00b567b3          	or	a5,a0,a1
   2272e:	14078563          	beqz	a5,22878 <__floatdidf+0x160>
   22732:	842a                	mv	s0,a0
   22734:	89ae                	mv	s3,a1
   22736:	01f5d913          	srl	s2,a1,0x1f
   2273a:	0005da63          	bgez	a1,2274e <__floatdidf+0x36>
   2273e:	00a037b3          	snez	a5,a0
   22742:	40b009b3          	neg	s3,a1
   22746:	40f989b3          	sub	s3,s3,a5
   2274a:	40a00433          	neg	s0,a0
   2274e:	84ce                	mv	s1,s3
   22750:	06098863          	beqz	s3,227c0 <__floatdidf+0xa8>
   22754:	854e                	mv	a0,s3
   22756:	e10ff0ef          	jal	21d66 <__clzsi2>
   2275a:	8a2a                	mv	s4,a0
   2275c:	43e00793          	li	a5,1086
   22760:	41478ab3          	sub	s5,a5,s4
   22764:	43300793          	li	a5,1075
   22768:	0757c863          	blt	a5,s5,227d8 <__floatdidf+0xc0>
   2276c:	47ad                	li	a5,11
   2276e:	10fa0a63          	beq	s4,a5,22882 <__floatdidf+0x16a>
   22772:	02a00793          	li	a5,42
   22776:	0547cb63          	blt	a5,s4,227cc <__floatdidf+0xb4>
   2277a:	02b00493          	li	s1,43
   2277e:	ff5a0793          	add	a5,s4,-11
   22782:	414484b3          	sub	s1,s1,s4
   22786:	009454b3          	srl	s1,s0,s1
   2278a:	00f999b3          	sll	s3,s3,a5
   2278e:	0134e4b3          	or	s1,s1,s3
   22792:	00f41433          	sll	s0,s0,a5
   22796:	00c49593          	sll	a1,s1,0xc
   2279a:	40f2                	lw	ra,28(sp)
   2279c:	014a9793          	sll	a5,s5,0x14
   227a0:	81b1                	srl	a1,a1,0xc
   227a2:	8522                	mv	a0,s0
   227a4:	4462                	lw	s0,24(sp)
   227a6:	8fcd                	or	a5,a5,a1
   227a8:	097e                	sll	s2,s2,0x1f
   227aa:	0127e733          	or	a4,a5,s2
   227ae:	44d2                	lw	s1,20(sp)
   227b0:	4942                	lw	s2,16(sp)
   227b2:	49b2                	lw	s3,12(sp)
   227b4:	4a22                	lw	s4,8(sp)
   227b6:	4a92                	lw	s5,4(sp)
   227b8:	4b02                	lw	s6,0(sp)
   227ba:	85ba                	mv	a1,a4
   227bc:	6105                	add	sp,sp,32
   227be:	8082                	ret
   227c0:	8522                	mv	a0,s0
   227c2:	da4ff0ef          	jal	21d66 <__clzsi2>
   227c6:	02050a13          	add	s4,a0,32
   227ca:	bf49                	j	2275c <__floatdidf+0x44>
   227cc:	fd5a0593          	add	a1,s4,-43
   227d0:	00b414b3          	sll	s1,s0,a1
   227d4:	4401                	li	s0,0
   227d6:	b7c1                	j	22796 <__floatdidf+0x7e>
   227d8:	43600793          	li	a5,1078
   227dc:	0357d763          	bge	a5,s5,2280a <__floatdidf+0xf2>
   227e0:	4621                	li	a2,8
   227e2:	41460633          	sub	a2,a2,s4
   227e6:	8522                	mv	a0,s0
   227e8:	85ce                	mv	a1,s3
   227ea:	2b9d                	jal	22d60 <__lshrdi3>
   227ec:	8b2a                	mv	s6,a0
   227ee:	84ae                	mv	s1,a1
   227f0:	8522                	mv	a0,s0
   227f2:	85ce                	mv	a1,s3
   227f4:	038a0613          	add	a2,s4,56
   227f8:	d46ff0ef          	jal	21d3e <__ashldi3>
   227fc:	00b56433          	or	s0,a0,a1
   22800:	00803433          	snez	s0,s0
   22804:	01646433          	or	s0,s0,s6
   22808:	89a6                	mv	s3,s1
   2280a:	47a1                	li	a5,8
   2280c:	0347d063          	bge	a5,s4,2282c <__floatdidf+0x114>
   22810:	02800713          	li	a4,40
   22814:	ff8a0793          	add	a5,s4,-8
   22818:	41470733          	sub	a4,a4,s4
   2281c:	00e45733          	srl	a4,s0,a4
   22820:	00f999b3          	sll	s3,s3,a5
   22824:	013769b3          	or	s3,a4,s3
   22828:	00f41433          	sll	s0,s0,a5
   2282c:	ff8005b7          	lui	a1,0xff800
   22830:	15fd                	add	a1,a1,-1 # ff7fffff <__share_mem_end__+0xfe73ffff>
   22832:	00747793          	and	a5,s0,7
   22836:	00b9f5b3          	and	a1,s3,a1
   2283a:	cf81                	beqz	a5,22852 <__floatdidf+0x13a>
   2283c:	00f47793          	and	a5,s0,15
   22840:	4711                	li	a4,4
   22842:	00e78863          	beq	a5,a4,22852 <__floatdidf+0x13a>
   22846:	00440793          	add	a5,s0,4
   2284a:	0087b733          	sltu	a4,a5,s0
   2284e:	95ba                	add	a1,a1,a4
   22850:	843e                	mv	s0,a5
   22852:	00859793          	sll	a5,a1,0x8
   22856:	0007da63          	bgez	a5,2286a <__floatdidf+0x152>
   2285a:	ff8007b7          	lui	a5,0xff800
   2285e:	17fd                	add	a5,a5,-1 # ff7fffff <__share_mem_end__+0xfe73ffff>
   22860:	8dfd                	and	a1,a1,a5
   22862:	43f00793          	li	a5,1087
   22866:	41478ab3          	sub	s5,a5,s4
   2286a:	800d                	srl	s0,s0,0x3
   2286c:	01d59793          	sll	a5,a1,0x1d
   22870:	8c5d                	or	s0,s0,a5
   22872:	0035d493          	srl	s1,a1,0x3
   22876:	b705                	j	22796 <__floatdidf+0x7e>
   22878:	4481                	li	s1,0
   2287a:	4401                	li	s0,0
   2287c:	4a81                	li	s5,0
   2287e:	4901                	li	s2,0
   22880:	bf19                	j	22796 <__floatdidf+0x7e>
   22882:	43300a93          	li	s5,1075
   22886:	bf01                	j	22796 <__floatdidf+0x7e>

00022888 <__extenddftf2>:
   22888:	01465713          	srl	a4,a2,0x14
   2288c:	00c61793          	sll	a5,a2,0xc
   22890:	7ff77713          	and	a4,a4,2047
   22894:	7179                	add	sp,sp,-48
   22896:	83b1                	srl	a5,a5,0xc
   22898:	00170693          	add	a3,a4,1
   2289c:	d422                	sw	s0,40(sp)
   2289e:	d226                	sw	s1,36(sp)
   228a0:	d04a                	sw	s2,32(sp)
   228a2:	d606                	sw	ra,44(sp)
   228a4:	c82e                	sw	a1,16(sp)
   228a6:	ca3e                	sw	a5,20(sp)
   228a8:	ce02                	sw	zero,28(sp)
   228aa:	cc02                	sw	zero,24(sp)
   228ac:	7fe6f693          	and	a3,a3,2046
   228b0:	892a                	mv	s2,a0
   228b2:	842e                	mv	s0,a1
   228b4:	01f65493          	srl	s1,a2,0x1f
   228b8:	cab9                	beqz	a3,2290e <__extenddftf2+0x86>
   228ba:	6691                	lui	a3,0x4
   228bc:	c0068693          	add	a3,a3,-1024 # 3c00 <__eh_frame_hdr_end+0x3c00>
   228c0:	9736                	add	a4,a4,a3
   228c2:	0047d693          	srl	a3,a5,0x4
   228c6:	ce36                	sw	a3,28(sp)
   228c8:	07f2                	sll	a5,a5,0x1c
   228ca:	0045d693          	srl	a3,a1,0x4
   228ce:	8fd5                	or	a5,a5,a3
   228d0:	01c59413          	sll	s0,a1,0x1c
   228d4:	cc3e                	sw	a5,24(sp)
   228d6:	ca22                	sw	s0,20(sp)
   228d8:	c802                	sw	zero,16(sp)
   228da:	47f2                	lw	a5,28(sp)
   228dc:	04be                	sll	s1,s1,0xf
   228de:	8cd9                	or	s1,s1,a4
   228e0:	00911723          	sh	s1,14(sp)
   228e4:	00f11623          	sh	a5,12(sp)
   228e8:	45c2                	lw	a1,16(sp)
   228ea:	4652                	lw	a2,20(sp)
   228ec:	46e2                	lw	a3,24(sp)
   228ee:	47b2                	lw	a5,12(sp)
   228f0:	50b2                	lw	ra,44(sp)
   228f2:	5422                	lw	s0,40(sp)
   228f4:	00b92023          	sw	a1,0(s2)
   228f8:	00c92223          	sw	a2,4(s2)
   228fc:	00d92423          	sw	a3,8(s2)
   22900:	00f92623          	sw	a5,12(s2)
   22904:	5492                	lw	s1,36(sp)
   22906:	854a                	mv	a0,s2
   22908:	5902                	lw	s2,32(sp)
   2290a:	6145                	add	sp,sp,48
   2290c:	8082                	ret
   2290e:	00b7e533          	or	a0,a5,a1
   22912:	e369                	bnez	a4,229d4 <__extenddftf2+0x14c>
   22914:	d179                	beqz	a0,228da <__extenddftf2+0x52>
   22916:	c7a9                	beqz	a5,22960 <__extenddftf2+0xd8>
   22918:	853e                	mv	a0,a5
   2291a:	c4cff0ef          	jal	21d66 <__clzsi2>
   2291e:	03150693          	add	a3,a0,49
   22922:	4056d793          	sra	a5,a3,0x5
   22926:	8afd                	and	a3,a3,31
   22928:	c2a9                	beqz	a3,2296a <__extenddftf2+0xe2>
   2292a:	5671                	li	a2,-4
   2292c:	02c78633          	mul	a2,a5,a2
   22930:	02000813          	li	a6,32
   22934:	01010313          	add	t1,sp,16
   22938:	40d80833          	sub	a6,a6,a3
   2293c:	00c60713          	add	a4,a2,12
   22940:	971a                	add	a4,a4,t1
   22942:	40c00633          	neg	a2,a2
   22946:	06e31863          	bne	t1,a4,229b6 <__extenddftf2+0x12e>
   2294a:	fff78713          	add	a4,a5,-1
   2294e:	078a                	sll	a5,a5,0x2
   22950:	02078793          	add	a5,a5,32
   22954:	978a                	add	a5,a5,sp
   22956:	00d416b3          	sll	a3,s0,a3
   2295a:	fed7a823          	sw	a3,-16(a5)
   2295e:	a02d                	j	22988 <__extenddftf2+0x100>
   22960:	c06ff0ef          	jal	21d66 <__clzsi2>
   22964:	02050513          	add	a0,a0,32
   22968:	bf5d                	j	2291e <__extenddftf2+0x96>
   2296a:	5671                	li	a2,-4
   2296c:	02c78633          	mul	a2,a5,a2
   22970:	0878                	add	a4,sp,28
   22972:	468d                	li	a3,3
   22974:	00c705b3          	add	a1,a4,a2
   22978:	418c                	lw	a1,0(a1)
   2297a:	16fd                	add	a3,a3,-1
   2297c:	1771                	add	a4,a4,-4
   2297e:	c34c                	sw	a1,4(a4)
   22980:	fef6dae3          	bge	a3,a5,22974 <__extenddftf2+0xec>
   22984:	fff78713          	add	a4,a5,-1
   22988:	00170793          	add	a5,a4,1
   2298c:	078a                	sll	a5,a5,0x2
   2298e:	46a1                	li	a3,8
   22990:	0818                	add	a4,sp,16
   22992:	00d7e863          	bltu	a5,a3,229a2 <__extenddftf2+0x11a>
   22996:	00072023          	sw	zero,0(a4)
   2299a:	00072223          	sw	zero,4(a4)
   2299e:	17e1                	add	a5,a5,-8
   229a0:	0838                	add	a4,sp,24
   229a2:	4691                	li	a3,4
   229a4:	00d7e463          	bltu	a5,a3,229ac <__extenddftf2+0x124>
   229a8:	00072023          	sw	zero,0(a4)
   229ac:	6711                	lui	a4,0x4
   229ae:	c0c70713          	add	a4,a4,-1012 # 3c0c <__eh_frame_hdr_end+0x3c0c>
   229b2:	8f09                	sub	a4,a4,a0
   229b4:	b71d                	j	228da <__extenddftf2+0x52>
   229b6:	430c                	lw	a1,0(a4)
   229b8:	ffc72883          	lw	a7,-4(a4)
   229bc:	00c70e33          	add	t3,a4,a2
   229c0:	00d595b3          	sll	a1,a1,a3
   229c4:	0108d8b3          	srl	a7,a7,a6
   229c8:	0115e5b3          	or	a1,a1,a7
   229cc:	00be2023          	sw	a1,0(t3)
   229d0:	1771                	add	a4,a4,-4
   229d2:	bf95                	j	22946 <__extenddftf2+0xbe>
   229d4:	cd19                	beqz	a0,229f2 <__extenddftf2+0x16a>
   229d6:	01c79713          	sll	a4,a5,0x1c
   229da:	0045d693          	srl	a3,a1,0x4
   229de:	8f55                	or	a4,a4,a3
   229e0:	cc3a                	sw	a4,24(sp)
   229e2:	8391                	srl	a5,a5,0x4
   229e4:	6721                	lui	a4,0x8
   229e6:	01c59413          	sll	s0,a1,0x1c
   229ea:	8fd9                	or	a5,a5,a4
   229ec:	ca22                	sw	s0,20(sp)
   229ee:	c802                	sw	zero,16(sp)
   229f0:	ce3e                	sw	a5,28(sp)
   229f2:	6721                	lui	a4,0x8
   229f4:	177d                	add	a4,a4,-1 # 7fff <HEAP_SIZE+0x3fff>
   229f6:	b5d5                	j	228da <__extenddftf2+0x52>

000229f8 <__truncdfsf2>:
   229f8:	0145d613          	srl	a2,a1,0x14
   229fc:	7ff67613          	and	a2,a2,2047
   22a00:	00c59793          	sll	a5,a1,0xc
   22a04:	00160713          	add	a4,a2,1
   22a08:	83a5                	srl	a5,a5,0x9
   22a0a:	01d55693          	srl	a3,a0,0x1d
   22a0e:	7fe77713          	and	a4,a4,2046
   22a12:	8edd                	or	a3,a3,a5
   22a14:	81fd                	srl	a1,a1,0x1f
   22a16:	00351793          	sll	a5,a0,0x3
   22a1a:	c349                	beqz	a4,22a9c <__truncdfsf2+0xa4>
   22a1c:	c8060713          	add	a4,a2,-896
   22a20:	0fe00813          	li	a6,254
   22a24:	08e84863          	blt	a6,a4,22ab4 <__truncdfsf2+0xbc>
   22a28:	06e04263          	bgtz	a4,22a8c <__truncdfsf2+0x94>
   22a2c:	5525                	li	a0,-23
   22a2e:	0ca74563          	blt	a4,a0,22af8 <__truncdfsf2+0x100>
   22a32:	00800537          	lui	a0,0x800
   22a36:	8ec9                	or	a3,a3,a0
   22a38:	4579                	li	a0,30
   22a3a:	8d19                	sub	a0,a0,a4
   22a3c:	487d                	li	a6,31
   22a3e:	02a84363          	blt	a6,a0,22a64 <__truncdfsf2+0x6c>
   22a42:	c8260613          	add	a2,a2,-894
   22a46:	00a7d533          	srl	a0,a5,a0
   22a4a:	00c797b3          	sll	a5,a5,a2
   22a4e:	00f037b3          	snez	a5,a5
   22a52:	00c696b3          	sll	a3,a3,a2
   22a56:	8fd5                	or	a5,a5,a3
   22a58:	8fc9                	or	a5,a5,a0
   22a5a:	4701                	li	a4,0
   22a5c:	0077f693          	and	a3,a5,7
   22a60:	cea9                	beqz	a3,22aba <__truncdfsf2+0xc2>
   22a62:	a869                	j	22afc <__truncdfsf2+0x104>
   22a64:	5879                	li	a6,-2
   22a66:	40e80833          	sub	a6,a6,a4
   22a6a:	02000893          	li	a7,32
   22a6e:	0106d833          	srl	a6,a3,a6
   22a72:	4701                	li	a4,0
   22a74:	01150663          	beq	a0,a7,22a80 <__truncdfsf2+0x88>
   22a78:	ca260613          	add	a2,a2,-862
   22a7c:	00c69733          	sll	a4,a3,a2
   22a80:	8f5d                	or	a4,a4,a5
   22a82:	00e03733          	snez	a4,a4
   22a86:	00e867b3          	or	a5,a6,a4
   22a8a:	bfc1                	j	22a5a <__truncdfsf2+0x62>
   22a8c:	051a                	sll	a0,a0,0x6
   22a8e:	00a03533          	snez	a0,a0
   22a92:	068e                	sll	a3,a3,0x3
   22a94:	83f5                	srl	a5,a5,0x1d
   22a96:	8ec9                	or	a3,a3,a0
   22a98:	8fd5                	or	a5,a5,a3
   22a9a:	b7c9                	j	22a5c <__truncdfsf2+0x64>
   22a9c:	8fd5                	or	a5,a5,a3
   22a9e:	e601                	bnez	a2,22aa6 <__truncdfsf2+0xae>
   22aa0:	00f037b3          	snez	a5,a5
   22aa4:	bf5d                	j	22a5a <__truncdfsf2+0x62>
   22aa6:	0ff00713          	li	a4,255
   22aaa:	cb81                	beqz	a5,22aba <__truncdfsf2+0xc2>
   22aac:	068e                	sll	a3,a3,0x3
   22aae:	020007b7          	lui	a5,0x2000
   22ab2:	b7dd                	j	22a98 <__truncdfsf2+0xa0>
   22ab4:	4781                	li	a5,0
   22ab6:	0ff00713          	li	a4,255
   22aba:	00579693          	sll	a3,a5,0x5
   22abe:	0006db63          	bgez	a3,22ad4 <__truncdfsf2+0xdc>
   22ac2:	0705                	add	a4,a4,1
   22ac4:	0ff00693          	li	a3,255
   22ac8:	04d70163          	beq	a4,a3,22b0a <__truncdfsf2+0x112>
   22acc:	fc0006b7          	lui	a3,0xfc000
   22ad0:	16fd                	add	a3,a3,-1 # fbffffff <__share_mem_end__+0xfaf3ffff>
   22ad2:	8ff5                	and	a5,a5,a3
   22ad4:	0ff00693          	li	a3,255
   22ad8:	838d                	srl	a5,a5,0x3
   22ada:	00d71663          	bne	a4,a3,22ae6 <__truncdfsf2+0xee>
   22ade:	c781                	beqz	a5,22ae6 <__truncdfsf2+0xee>
   22ae0:	004007b7          	lui	a5,0x400
   22ae4:	4581                	li	a1,0
   22ae6:	7f8006b7          	lui	a3,0x7f800
   22aea:	075e                	sll	a4,a4,0x17
   22aec:	8f75                	and	a4,a4,a3
   22aee:	8f5d                	or	a4,a4,a5
   22af0:	01f59513          	sll	a0,a1,0x1f
   22af4:	8d59                	or	a0,a0,a4
   22af6:	8082                	ret
   22af8:	4785                	li	a5,1
   22afa:	4701                	li	a4,0
   22afc:	00f7f693          	and	a3,a5,15
   22b00:	4611                	li	a2,4
   22b02:	fac68ce3          	beq	a3,a2,22aba <__truncdfsf2+0xc2>
   22b06:	0791                	add	a5,a5,4 # 400004 <__noncacheable_end__+0x340004>
   22b08:	bf4d                	j	22aba <__truncdfsf2+0xc2>
   22b0a:	4781                	li	a5,0
   22b0c:	b7e1                	j	22ad4 <__truncdfsf2+0xdc>

00022b0e <__trunctfdf2>:
   22b0e:	454c                	lw	a1,12(a0)
   22b10:	451c                	lw	a5,8(a0)
   22b12:	4158                	lw	a4,4(a0)
   22b14:	1101                	add	sp,sp,-32
   22b16:	4110                	lw	a2,0(a0)
   22b18:	c43e                	sw	a5,8(sp)
   22b1a:	cc3e                	sw	a5,24(sp)
   22b1c:	01059793          	sll	a5,a1,0x10
   22b20:	83c1                	srl	a5,a5,0x10
   22b22:	00159693          	sll	a3,a1,0x1
   22b26:	c23a                	sw	a4,4(sp)
   22b28:	ca3a                	sw	a4,20(sp)
   22b2a:	0818                	add	a4,sp,16
   22b2c:	c62e                	sw	a1,12(sp)
   22b2e:	ce3e                	sw	a5,28(sp)
   22b30:	c032                	sw	a2,0(sp)
   22b32:	c832                	sw	a2,16(sp)
   22b34:	82c5                	srl	a3,a3,0x11
   22b36:	81fd                	srl	a1,a1,0x1f
   22b38:	00410313          	add	t1,sp,4
   22b3c:	87ba                	mv	a5,a4
   22b3e:	883a                	mv	a6,a4
   22b40:	47c8                	lw	a0,12(a5)
   22b42:	0087a883          	lw	a7,8(a5)
   22b46:	17f1                	add	a5,a5,-4
   22b48:	050e                	sll	a0,a0,0x3
   22b4a:	01d8d893          	srl	a7,a7,0x1d
   22b4e:	01156533          	or	a0,a0,a7
   22b52:	cb88                	sw	a0,16(a5)
   22b54:	fe6796e3          	bne	a5,t1,22b40 <__trunctfdf2+0x32>
   22b58:	00168793          	add	a5,a3,1 # 7f800001 <__share_mem_end__+0x7e740001>
   22b5c:	060e                	sll	a2,a2,0x3
   22b5e:	01179513          	sll	a0,a5,0x11
   22b62:	c832                	sw	a2,16(sp)
   22b64:	8149                	srl	a0,a0,0x12
   22b66:	14050b63          	beqz	a0,22cbc <__trunctfdf2+0x1ae>
   22b6a:	77f1                	lui	a5,0xffffc
   22b6c:	40078793          	add	a5,a5,1024 # ffffc400 <__share_mem_end__+0xfef3c400>
   22b70:	96be                	add	a3,a3,a5
   22b72:	7fe00793          	li	a5,2046
   22b76:	18d7c163          	blt	a5,a3,22cf8 <__trunctfdf2+0x1ea>
   22b7a:	04d05563          	blez	a3,22bc4 <__trunctfdf2+0xb6>
   22b7e:	4562                	lw	a0,24(sp)
   22b80:	47f2                	lw	a5,28(sp)
   22b82:	4752                	lw	a4,20(sp)
   22b84:	01c55813          	srl	a6,a0,0x1c
   22b88:	0792                	sll	a5,a5,0x4
   22b8a:	0107e7b3          	or	a5,a5,a6
   22b8e:	ca3e                	sw	a5,20(sp)
   22b90:	00471793          	sll	a5,a4,0x4
   22b94:	8fd1                	or	a5,a5,a2
   22b96:	8371                	srl	a4,a4,0x1c
   22b98:	0512                	sll	a0,a0,0x4
   22b9a:	00f037b3          	snez	a5,a5
   22b9e:	8f49                	or	a4,a4,a0
   22ba0:	8fd9                	or	a5,a5,a4
   22ba2:	4752                	lw	a4,20(sp)
   22ba4:	0077f613          	and	a2,a5,7
   22ba8:	14060c63          	beqz	a2,22d00 <__trunctfdf2+0x1f2>
   22bac:	00f7f613          	and	a2,a5,15
   22bb0:	4511                	li	a0,4
   22bb2:	14a60763          	beq	a2,a0,22d00 <__trunctfdf2+0x1f2>
   22bb6:	00478613          	add	a2,a5,4
   22bba:	00f63533          	sltu	a0,a2,a5
   22bbe:	972a                	add	a4,a4,a0
   22bc0:	87b2                	mv	a5,a2
   22bc2:	aa3d                	j	22d00 <__trunctfdf2+0x1f2>
   22bc4:	fcc00793          	li	a5,-52
   22bc8:	00f6d663          	bge	a3,a5,22bd4 <__trunctfdf2+0xc6>
   22bcc:	ca02                	sw	zero,20(sp)
   22bce:	4785                	li	a5,1
   22bd0:	4681                	li	a3,0
   22bd2:	bfc1                	j	22ba2 <__trunctfdf2+0x94>
   22bd4:	47f2                	lw	a5,28(sp)
   22bd6:	00080eb7          	lui	t4,0x80
   22bda:	88ba                	mv	a7,a4
   22bdc:	00feeeb3          	or	t4,t4,a5
   22be0:	03d00793          	li	a5,61
   22be4:	40d786b3          	sub	a3,a5,a3
   22be8:	4056d613          	sra	a2,a3,0x5
   22bec:	ce76                	sw	t4,28(sp)
   22bee:	8afd                	and	a3,a3,31
   22bf0:	4501                	li	a0,0
   22bf2:	4781                	li	a5,0
   22bf4:	0008a303          	lw	t1,0(a7) # 10000 <__fw_size__+0x62f0>
   22bf8:	0505                	add	a0,a0,1 # 800001 <__noncacheable_end__+0x740001>
   22bfa:	0891                	add	a7,a7,4
   22bfc:	0067e7b3          	or	a5,a5,t1
   22c00:	fea61ae3          	bne	a2,a0,22bf4 <__trunctfdf2+0xe6>
   22c04:	450d                	li	a0,3
   22c06:	8d11                	sub	a0,a0,a2
   22c08:	00261893          	sll	a7,a2,0x2
   22c0c:	ee99                	bnez	a3,22c2a <__trunctfdf2+0x11c>
   22c0e:	01170333          	add	t1,a4,a7
   22c12:	00032303          	lw	t1,0(t1)
   22c16:	0685                	add	a3,a3,1
   22c18:	00672023          	sw	t1,0(a4)
   22c1c:	0711                	add	a4,a4,4
   22c1e:	fed558e3          	bge	a0,a3,22c0e <__trunctfdf2+0x100>
   22c22:	4711                	li	a4,4
   22c24:	40c70633          	sub	a2,a4,a2
   22c28:	a081                	j	22c68 <__trunctfdf2+0x15a>
   22c2a:	02088313          	add	t1,a7,32
   22c2e:	930a                	add	t1,t1,sp
   22c30:	ff032303          	lw	t1,-16(t1)
   22c34:	02000e13          	li	t3,32
   22c38:	40de0e33          	sub	t3,t3,a3
   22c3c:	01c31333          	sll	t1,t1,t3
   22c40:	9746                	add	a4,a4,a7
   22c42:	0067e7b3          	or	a5,a5,t1
   22c46:	411008b3          	neg	a7,a7
   22c4a:	4f01                	li	t5,0
   22c4c:	04af4763          	blt	t5,a0,22c9a <__trunctfdf2+0x18c>
   22c50:	4711                	li	a4,4
   22c52:	050a                	sll	a0,a0,0x2
   22c54:	40c70633          	sub	a2,a4,a2
   22c58:	02050713          	add	a4,a0,32
   22c5c:	00270533          	add	a0,a4,sp
   22c60:	00ded733          	srl	a4,t4,a3
   22c64:	fee52823          	sw	a4,-16(a0)
   22c68:	4711                	li	a4,4
   22c6a:	8f11                	sub	a4,a4,a2
   22c6c:	060a                	sll	a2,a2,0x2
   22c6e:	00c806b3          	add	a3,a6,a2
   22c72:	070a                	sll	a4,a4,0x2
   22c74:	4621                	li	a2,8
   22c76:	00c76863          	bltu	a4,a2,22c86 <__trunctfdf2+0x178>
   22c7a:	0006a023          	sw	zero,0(a3)
   22c7e:	0006a223          	sw	zero,4(a3)
   22c82:	1761                	add	a4,a4,-8
   22c84:	06a1                	add	a3,a3,8
   22c86:	4611                	li	a2,4
   22c88:	00c76463          	bltu	a4,a2,22c90 <__trunctfdf2+0x182>
   22c8c:	0006a023          	sw	zero,0(a3)
   22c90:	4742                	lw	a4,16(sp)
   22c92:	00f037b3          	snez	a5,a5
   22c96:	8fd9                	or	a5,a5,a4
   22c98:	bf25                	j	22bd0 <__trunctfdf2+0xc2>
   22c9a:	00072303          	lw	t1,0(a4)
   22c9e:	00472f83          	lw	t6,4(a4)
   22ca2:	011702b3          	add	t0,a4,a7
   22ca6:	00d35333          	srl	t1,t1,a3
   22caa:	01cf9fb3          	sll	t6,t6,t3
   22cae:	01f36333          	or	t1,t1,t6
   22cb2:	0062a023          	sw	t1,0(t0)
   22cb6:	0f05                	add	t5,t5,1
   22cb8:	0711                	add	a4,a4,4
   22cba:	bf49                	j	22c4c <__trunctfdf2+0x13e>
   22cbc:	4552                	lw	a0,20(sp)
   22cbe:	4762                	lw	a4,24(sp)
   22cc0:	4872                	lw	a6,28(sp)
   22cc2:	00a767b3          	or	a5,a4,a0
   22cc6:	0107e7b3          	or	a5,a5,a6
   22cca:	8fd1                	or	a5,a5,a2
   22ccc:	e689                	bnez	a3,22cd6 <__trunctfdf2+0x1c8>
   22cce:	00f037b3          	snez	a5,a5
   22cd2:	4701                	li	a4,0
   22cd4:	bdc1                	j	22ba4 <__trunctfdf2+0x96>
   22cd6:	c3c1                	beqz	a5,22d56 <__trunctfdf2+0x248>
   22cd8:	00471793          	sll	a5,a4,0x4
   22cdc:	8171                	srl	a0,a0,0x1c
   22cde:	8371                	srl	a4,a4,0x1c
   22ce0:	0812                	sll	a6,a6,0x4
   22ce2:	004006b7          	lui	a3,0x400
   22ce6:	8d5d                	or	a0,a0,a5
   22ce8:	01076733          	or	a4,a4,a6
   22cec:	8f55                	or	a4,a4,a3
   22cee:	ff857793          	and	a5,a0,-8
   22cf2:	7ff00693          	li	a3,2047
   22cf6:	b57d                	j	22ba4 <__trunctfdf2+0x96>
   22cf8:	4701                	li	a4,0
   22cfa:	4781                	li	a5,0
   22cfc:	7ff00693          	li	a3,2047
   22d00:	00871613          	sll	a2,a4,0x8
   22d04:	00065b63          	bgez	a2,22d1a <__trunctfdf2+0x20c>
   22d08:	0685                	add	a3,a3,1 # 400001 <__noncacheable_end__+0x340001>
   22d0a:	7ff00613          	li	a2,2047
   22d0e:	04c68663          	beq	a3,a2,22d5a <__trunctfdf2+0x24c>
   22d12:	ff800637          	lui	a2,0xff800
   22d16:	167d                	add	a2,a2,-1 # ff7fffff <__share_mem_end__+0xfe73ffff>
   22d18:	8f71                	and	a4,a4,a2
   22d1a:	01d71613          	sll	a2,a4,0x1d
   22d1e:	838d                	srl	a5,a5,0x3
   22d20:	8fd1                	or	a5,a5,a2
   22d22:	7ff00613          	li	a2,2047
   22d26:	830d                	srl	a4,a4,0x3
   22d28:	00c69963          	bne	a3,a2,22d3a <__trunctfdf2+0x22c>
   22d2c:	8fd9                	or	a5,a5,a4
   22d2e:	4701                	li	a4,0
   22d30:	c789                	beqz	a5,22d3a <__trunctfdf2+0x22c>
   22d32:	00080737          	lui	a4,0x80
   22d36:	4781                	li	a5,0
   22d38:	4581                	li	a1,0
   22d3a:	06d2                	sll	a3,a3,0x14
   22d3c:	7ff00637          	lui	a2,0x7ff00
   22d40:	0732                	sll	a4,a4,0xc
   22d42:	8331                	srl	a4,a4,0xc
   22d44:	8ef1                	and	a3,a3,a2
   22d46:	05fe                	sll	a1,a1,0x1f
   22d48:	8ed9                	or	a3,a3,a4
   22d4a:	00b6e733          	or	a4,a3,a1
   22d4e:	853e                	mv	a0,a5
   22d50:	85ba                	mv	a1,a4
   22d52:	6105                	add	sp,sp,32
   22d54:	8082                	ret
   22d56:	4701                	li	a4,0
   22d58:	b755                	j	22cfc <__trunctfdf2+0x1ee>
   22d5a:	4701                	li	a4,0
   22d5c:	4781                	li	a5,0
   22d5e:	bf75                	j	22d1a <__trunctfdf2+0x20c>

00022d60 <__lshrdi3>:
   22d60:	ca19                	beqz	a2,22d76 <__lshrdi3+0x16>
   22d62:	02000793          	li	a5,32
   22d66:	8f91                	sub	a5,a5,a2
   22d68:	00f04863          	bgtz	a5,22d78 <__lshrdi3+0x18>
   22d6c:	1601                	add	a2,a2,-32 # 7fefffe0 <__share_mem_end__+0x7ee3ffe0>
   22d6e:	00c5d533          	srl	a0,a1,a2
   22d72:	4701                	li	a4,0
   22d74:	85ba                	mv	a1,a4
   22d76:	8082                	ret
   22d78:	00c5d733          	srl	a4,a1,a2
   22d7c:	00c55533          	srl	a0,a0,a2
   22d80:	00f595b3          	sll	a1,a1,a5
   22d84:	8d4d                	or	a0,a0,a1
   22d86:	b7fd                	j	22d74 <__lshrdi3+0x14>

00022d88 <main>:
   22d88:	1141                	add	sp,sp,-16
   22d8a:	c606                	sw	ra,12(sp)
   22d8c:	2dc5                	jal	2347c <board_init_core1>
   22d8e:	000295b7          	lui	a1,0x29
   22d92:	00029537          	lui	a0,0x29
   22d96:	56058593          	add	a1,a1,1376 # 29560 <__clz_tab+0x100>
   22d9a:	56c50513          	add	a0,a0,1388 # 2956c <__clz_tab+0x10c>
   22d9e:	262020ef          	jal	25000 <iprintf>
   22da2:	3e800513          	li	a0,1000
   22da6:	7a6000ef          	jal	2354c <board_delay_ms>
   22daa:	bfe5                	j	22da2 <main+0x1a>

00022dac <__libc_init_array>:
   22dac:	1141                	add	sp,sp,-16
   22dae:	c422                	sw	s0,8(sp)
   22db0:	c04a                	sw	s2,0(sp)
   22db2:	9d818793          	add	a5,gp,-1576 # a01d8 <timer_cb>
   22db6:	9d818713          	add	a4,gp,-1576 # a01d8 <timer_cb>
   22dba:	c606                	sw	ra,12(sp)
   22dbc:	c226                	sw	s1,4(sp)
   22dbe:	40e78933          	sub	s2,a5,a4
   22dc2:	00e78d63          	beq	a5,a4,22ddc <__libc_init_array+0x30>
   22dc6:	40295913          	sra	s2,s2,0x2
   22dca:	9d818413          	add	s0,gp,-1576 # a01d8 <timer_cb>
   22dce:	4481                	li	s1,0
   22dd0:	401c                	lw	a5,0(s0)
   22dd2:	0485                	add	s1,s1,1
   22dd4:	0411                	add	s0,s0,4
   22dd6:	9782                	jalr	a5
   22dd8:	ff24ece3          	bltu	s1,s2,22dd0 <__libc_init_array+0x24>
   22ddc:	9d818793          	add	a5,gp,-1576 # a01d8 <timer_cb>
   22de0:	9d818713          	add	a4,gp,-1576 # a01d8 <timer_cb>
   22de4:	40e78933          	sub	s2,a5,a4
   22de8:	40295913          	sra	s2,s2,0x2
   22dec:	00e78b63          	beq	a5,a4,22e02 <__libc_init_array+0x56>
   22df0:	9d818413          	add	s0,gp,-1576 # a01d8 <timer_cb>
   22df4:	4481                	li	s1,0
   22df6:	401c                	lw	a5,0(s0)
   22df8:	0485                	add	s1,s1,1
   22dfa:	0411                	add	s0,s0,4
   22dfc:	9782                	jalr	a5
   22dfe:	ff24ece3          	bltu	s1,s2,22df6 <__libc_init_array+0x4a>
   22e02:	40b2                	lw	ra,12(sp)
   22e04:	4422                	lw	s0,8(sp)
   22e06:	4492                	lw	s1,4(sp)
   22e08:	4902                	lw	s2,0(sp)
   22e0a:	0141                	add	sp,sp,16
   22e0c:	8082                	ret

00022e0e <_clean_up>:
   22e0e:	6785                	lui	a5,0x1
   22e10:	80078793          	add	a5,a5,-2048 # 800 <__eh_frame_hdr_end+0x800>
   22e14:	3047b073          	csrc	mie,a5
   22e18:	e42007b7          	lui	a5,0xe4200
   22e1c:	e4200737          	lui	a4,0xe4200
   22e20:	0007a023          	sw	zero,0(a5) # e4200000 <__share_mem_end__+0xe3140000>
   22e24:	0711                	add	a4,a4,4 # e4200004 <__share_mem_end__+0xe3140004>
   22e26:	4781                	li	a5,0
   22e28:	08000693          	li	a3,128
   22e2c:	c31c                	sw	a5,0(a4)
   22e2e:	0785                	add	a5,a5,1
   22e30:	fed79ee3          	bne	a5,a3,22e2c <_clean_up+0x1e>
   22e34:	e40027b7          	lui	a5,0xe4002
   22e38:	0007a023          	sw	zero,0(a5) # e4002000 <__share_mem_end__+0xe2f42000>
   22e3c:	e40026b7          	lui	a3,0xe4002
   22e40:	0006a223          	sw	zero,4(a3) # e4002004 <__share_mem_end__+0xe2f42004>
   22e44:	e4002737          	lui	a4,0xe4002
   22e48:	00072423          	sw	zero,8(a4) # e4002008 <__share_mem_end__+0xe2f42008>
   22e4c:	0007a623          	sw	zero,12(a5)
   22e50:	8082                	ret

00022e52 <c_startup>:
   22e52:	9d818593          	add	a1,gp,-1576 # a01d8 <timer_cb>
   22e56:	9d818793          	add	a5,gp,-1576 # a01d8 <timer_cb>
   22e5a:	9f818713          	add	a4,gp,-1544 # a01f8 <__bss_end__>
   22e5e:	0035f613          	and	a2,a1,3
   22e62:	8f1d                	sub	a4,a4,a5
   22e64:	40060463          	beqz	a2,2326c <c_startup+0x41a>
   22e68:	c345                	beqz	a4,22f08 <c_startup+0xb6>
   22e6a:	40b00633          	neg	a2,a1
   22e6e:	fff70513          	add	a0,a4,-1
   22e72:	4815                	li	a6,5
   22e74:	00367793          	and	a5,a2,3
   22e78:	58a87863          	bgeu	a6,a0,23408 <c_startup+0x5b6>
   22e7c:	4501                	li	a0,0
   22e7e:	cf99                	beqz	a5,22e9c <c_startup+0x4a>
   22e80:	9c018c23          	sb	zero,-1576(gp) # a01d8 <timer_cb>
   22e84:	8a09                	and	a2,a2,2
   22e86:	4505                	li	a0,1
   22e88:	ca11                	beqz	a2,22e9c <c_startup+0x4a>
   22e8a:	000580a3          	sb	zero,1(a1)
   22e8e:	468d                	li	a3,3
   22e90:	4509                	li	a0,2
   22e92:	00d79563          	bne	a5,a3,22e9c <c_startup+0x4a>
   22e96:	00058123          	sb	zero,2(a1)
   22e9a:	450d                	li	a0,3
   22e9c:	40f70833          	sub	a6,a4,a5
   22ea0:	ffc87693          	and	a3,a6,-4
   22ea4:	97ae                	add	a5,a5,a1
   22ea6:	00d78633          	add	a2,a5,a3
   22eaa:	0007a023          	sw	zero,0(a5)
   22eae:	0791                	add	a5,a5,4
   22eb0:	fec79de3          	bne	a5,a2,22eaa <c_startup+0x58>
   22eb4:	05068a63          	beq	a3,a6,22f08 <c_startup+0xb6>
   22eb8:	96aa                	add	a3,a3,a0
   22eba:	00d587b3          	add	a5,a1,a3
   22ebe:	00078023          	sb	zero,0(a5)
   22ec2:	00168793          	add	a5,a3,1
   22ec6:	04e7f163          	bgeu	a5,a4,22f08 <c_startup+0xb6>
   22eca:	97ae                	add	a5,a5,a1
   22ecc:	00078023          	sb	zero,0(a5)
   22ed0:	00268793          	add	a5,a3,2
   22ed4:	02e7fa63          	bgeu	a5,a4,22f08 <c_startup+0xb6>
   22ed8:	97ae                	add	a5,a5,a1
   22eda:	00078023          	sb	zero,0(a5)
   22ede:	00368793          	add	a5,a3,3
   22ee2:	02e7f363          	bgeu	a5,a4,22f08 <c_startup+0xb6>
   22ee6:	97ae                	add	a5,a5,a1
   22ee8:	00078023          	sb	zero,0(a5)
   22eec:	00468793          	add	a5,a3,4
   22ef0:	00e7fc63          	bgeu	a5,a4,22f08 <c_startup+0xb6>
   22ef4:	97ae                	add	a5,a5,a1
   22ef6:	00078023          	sb	zero,0(a5)
   22efa:	0695                	add	a3,a3,5
   22efc:	00e6f663          	bgeu	a3,a4,22f08 <c_startup+0xb6>
   22f00:	00d587b3          	add	a5,a1,a3
   22f04:	00078023          	sb	zero,0(a5)
   22f08:	000b86b7          	lui	a3,0xb8
   22f0c:	00068593          	mv	a1,a3
   22f10:	000b8737          	lui	a4,0xb8
   22f14:	00068793          	mv	a5,a3
   22f18:	00070713          	mv	a4,a4
   22f1c:	0035f613          	and	a2,a1,3
   22f20:	8f1d                	sub	a4,a4,a5
   22f22:	2e060d63          	beqz	a2,2321c <c_startup+0x3ca>
   22f26:	c345                	beqz	a4,22fc6 <c_startup+0x174>
   22f28:	40b00633          	neg	a2,a1
   22f2c:	fff70513          	add	a0,a4,-1 # b7fff <_stack+0xfdff>
   22f30:	4815                	li	a6,5
   22f32:	00367793          	and	a5,a2,3
   22f36:	4ca87763          	bgeu	a6,a0,23404 <c_startup+0x5b2>
   22f3a:	4501                	li	a0,0
   22f3c:	cf99                	beqz	a5,22f5a <c_startup+0x108>
   22f3e:	00068023          	sb	zero,0(a3) # b8000 <__noncacheable_bss_end__>
   22f42:	8a09                	and	a2,a2,2
   22f44:	4505                	li	a0,1
   22f46:	ca11                	beqz	a2,22f5a <c_startup+0x108>
   22f48:	000580a3          	sb	zero,1(a1)
   22f4c:	468d                	li	a3,3
   22f4e:	4509                	li	a0,2
   22f50:	00d79563          	bne	a5,a3,22f5a <c_startup+0x108>
   22f54:	00058123          	sb	zero,2(a1)
   22f58:	450d                	li	a0,3
   22f5a:	40f70833          	sub	a6,a4,a5
   22f5e:	ffc87693          	and	a3,a6,-4
   22f62:	97ae                	add	a5,a5,a1
   22f64:	00f68633          	add	a2,a3,a5
   22f68:	0007a023          	sw	zero,0(a5)
   22f6c:	0791                	add	a5,a5,4
   22f6e:	fef61de3          	bne	a2,a5,22f68 <c_startup+0x116>
   22f72:	05068a63          	beq	a3,a6,22fc6 <c_startup+0x174>
   22f76:	96aa                	add	a3,a3,a0
   22f78:	00d587b3          	add	a5,a1,a3
   22f7c:	00078023          	sb	zero,0(a5)
   22f80:	00168793          	add	a5,a3,1
   22f84:	04e7f163          	bgeu	a5,a4,22fc6 <c_startup+0x174>
   22f88:	97ae                	add	a5,a5,a1
   22f8a:	00078023          	sb	zero,0(a5)
   22f8e:	00268793          	add	a5,a3,2
   22f92:	02e7fa63          	bgeu	a5,a4,22fc6 <c_startup+0x174>
   22f96:	97ae                	add	a5,a5,a1
   22f98:	00078023          	sb	zero,0(a5)
   22f9c:	00368793          	add	a5,a3,3
   22fa0:	02e7f363          	bgeu	a5,a4,22fc6 <c_startup+0x174>
   22fa4:	97ae                	add	a5,a5,a1
   22fa6:	00078023          	sb	zero,0(a5)
   22faa:	00468793          	add	a5,a3,4
   22fae:	00e7fc63          	bgeu	a5,a4,22fc6 <c_startup+0x174>
   22fb2:	97ae                	add	a5,a5,a1
   22fb4:	00078023          	sb	zero,0(a5)
   22fb8:	0695                	add	a3,a3,5
   22fba:	00e6f663          	bgeu	a3,a4,22fc6 <c_startup+0x174>
   22fbe:	00d587b3          	add	a5,a1,a3
   22fc2:	00078023          	sb	zero,0(a5)
   22fc6:	9f818593          	add	a1,gp,-1544 # a01f8 <__bss_end__>
   22fca:	9f818793          	add	a5,gp,-1544 # a01f8 <__bss_end__>
   22fce:	9f818713          	add	a4,gp,-1544 # a01f8 <__bss_end__>
   22fd2:	0035f613          	and	a2,a1,3
   22fd6:	8f1d                	sub	a4,a4,a5
   22fd8:	1e060e63          	beqz	a2,231d4 <c_startup+0x382>
   22fdc:	c345                	beqz	a4,2307c <c_startup+0x22a>
   22fde:	40b00633          	neg	a2,a1
   22fe2:	fff70513          	add	a0,a4,-1
   22fe6:	4815                	li	a6,5
   22fe8:	00367793          	and	a5,a2,3
   22fec:	40a87a63          	bgeu	a6,a0,23400 <c_startup+0x5ae>
   22ff0:	4501                	li	a0,0
   22ff2:	cf99                	beqz	a5,23010 <c_startup+0x1be>
   22ff4:	9e018c23          	sb	zero,-1544(gp) # a01f8 <__bss_end__>
   22ff8:	8a09                	and	a2,a2,2
   22ffa:	4505                	li	a0,1
   22ffc:	ca11                	beqz	a2,23010 <c_startup+0x1be>
   22ffe:	000580a3          	sb	zero,1(a1)
   23002:	468d                	li	a3,3
   23004:	4509                	li	a0,2
   23006:	00d79563          	bne	a5,a3,23010 <c_startup+0x1be>
   2300a:	00058123          	sb	zero,2(a1)
   2300e:	450d                	li	a0,3
   23010:	40f70833          	sub	a6,a4,a5
   23014:	ffc87693          	and	a3,a6,-4
   23018:	97ae                	add	a5,a5,a1
   2301a:	00f68633          	add	a2,a3,a5
   2301e:	0007a023          	sw	zero,0(a5)
   23022:	0791                	add	a5,a5,4
   23024:	fec79de3          	bne	a5,a2,2301e <c_startup+0x1cc>
   23028:	05068a63          	beq	a3,a6,2307c <c_startup+0x22a>
   2302c:	96aa                	add	a3,a3,a0
   2302e:	00d587b3          	add	a5,a1,a3
   23032:	00078023          	sb	zero,0(a5)
   23036:	00168793          	add	a5,a3,1
   2303a:	04e7f163          	bgeu	a5,a4,2307c <c_startup+0x22a>
   2303e:	97ae                	add	a5,a5,a1
   23040:	00078023          	sb	zero,0(a5)
   23044:	00268793          	add	a5,a3,2
   23048:	02e7fa63          	bgeu	a5,a4,2307c <c_startup+0x22a>
   2304c:	97ae                	add	a5,a5,a1
   2304e:	00078023          	sb	zero,0(a5)
   23052:	00368793          	add	a5,a3,3
   23056:	02e7f363          	bgeu	a5,a4,2307c <c_startup+0x22a>
   2305a:	97ae                	add	a5,a5,a1
   2305c:	00078023          	sb	zero,0(a5)
   23060:	00468793          	add	a5,a3,4
   23064:	00e7fc63          	bgeu	a5,a4,2307c <c_startup+0x22a>
   23068:	97ae                	add	a5,a5,a1
   2306a:	00078023          	sb	zero,0(a5)
   2306e:	0695                	add	a3,a3,5
   23070:	00e6f663          	bgeu	a3,a4,2307c <c_startup+0x22a>
   23074:	00d587b3          	add	a5,a1,a3
   23078:	00078023          	sb	zero,0(a5)
   2307c:	000a0637          	lui	a2,0xa0
   23080:	0002a6b7          	lui	a3,0x2a
   23084:	00060793          	mv	a5,a2
   23088:	ce868713          	add	a4,a3,-792 # 29ce8 <__data_load_addr__>
   2308c:	00e7e533          	or	a0,a5,a4
   23090:	00060813          	mv	a6,a2
   23094:	9d818593          	add	a1,gp,-1576 # a01d8 <timer_cb>
   23098:	890d                	and	a0,a0,3
   2309a:	410585b3          	sub	a1,a1,a6
   2309e:	00060613          	mv	a2,a2
   230a2:	ce868813          	add	a6,a3,-792
   230a6:	20050763          	beqz	a0,232b4 <c_startup+0x462>
   230aa:	00b70633          	add	a2,a4,a1
   230ae:	c989                	beqz	a1,230c0 <c_startup+0x26e>
   230b0:	00074683          	lbu	a3,0(a4)
   230b4:	0705                	add	a4,a4,1
   230b6:	0785                	add	a5,a5,1
   230b8:	fed78fa3          	sb	a3,-1(a5)
   230bc:	fec71ae3          	bne	a4,a2,230b0 <c_startup+0x25e>
   230c0:	0002a637          	lui	a2,0x2a
   230c4:	0002a6b7          	lui	a3,0x2a
   230c8:	ce860793          	add	a5,a2,-792 # 29ce8 <__data_load_addr__>
   230cc:	ec068713          	add	a4,a3,-320 # 29ec0 <__fast_load_addr__>
   230d0:	00e7e533          	or	a0,a5,a4
   230d4:	0002a5b7          	lui	a1,0x2a
   230d8:	ce860813          	add	a6,a2,-792
   230dc:	ce858593          	add	a1,a1,-792 # 29ce8 <__data_load_addr__>
   230e0:	890d                	and	a0,a0,3
   230e2:	410585b3          	sub	a1,a1,a6
   230e6:	ce860613          	add	a2,a2,-792
   230ea:	ec068813          	add	a6,a3,-320
   230ee:	2c050763          	beqz	a0,233bc <c_startup+0x56a>
   230f2:	00b70633          	add	a2,a4,a1
   230f6:	c989                	beqz	a1,23108 <c_startup+0x2b6>
   230f8:	00074683          	lbu	a3,0(a4)
   230fc:	0705                	add	a4,a4,1
   230fe:	0785                	add	a5,a5,1
   23100:	fed78fa3          	sb	a3,-1(a5)
   23104:	fee61ae3          	bne	a2,a4,230f8 <c_startup+0x2a6>
   23108:	0002a6b7          	lui	a3,0x2a
   2310c:	9d818793          	add	a5,gp,-1576 # a01d8 <timer_cb>
   23110:	ec068713          	add	a4,a3,-320 # 29ec0 <__fast_load_addr__>
   23114:	00e7e533          	or	a0,a5,a4
   23118:	9d818813          	add	a6,gp,-1576 # a01d8 <timer_cb>
   2311c:	9d818593          	add	a1,gp,-1576 # a01d8 <timer_cb>
   23120:	890d                	and	a0,a0,3
   23122:	410585b3          	sub	a1,a1,a6
   23126:	9d818613          	add	a2,gp,-1576 # a01d8 <timer_cb>
   2312a:	ec068813          	add	a6,a3,-320
   2312e:	24050663          	beqz	a0,2337a <c_startup+0x528>
   23132:	00b70633          	add	a2,a4,a1
   23136:	c989                	beqz	a1,23148 <c_startup+0x2f6>
   23138:	00074683          	lbu	a3,0(a4)
   2313c:	0705                	add	a4,a4,1
   2313e:	0785                	add	a5,a5,1
   23140:	fed78fa3          	sb	a3,-1(a5)
   23144:	fee61ae3          	bne	a2,a4,23138 <c_startup+0x2e6>
   23148:	000b8637          	lui	a2,0xb8
   2314c:	0002a6b7          	lui	a3,0x2a
   23150:	00060793          	mv	a5,a2
   23154:	ec068713          	add	a4,a3,-320 # 29ec0 <__fast_load_addr__>
   23158:	00e7e533          	or	a0,a5,a4
   2315c:	000b85b7          	lui	a1,0xb8
   23160:	00060813          	mv	a6,a2
   23164:	00058593          	mv	a1,a1
   23168:	890d                	and	a0,a0,3
   2316a:	410585b3          	sub	a1,a1,a6
   2316e:	00060613          	mv	a2,a2
   23172:	ec068813          	add	a6,a3,-320
   23176:	1c050163          	beqz	a0,23338 <c_startup+0x4e6>
   2317a:	00b70633          	add	a2,a4,a1
   2317e:	c989                	beqz	a1,23190 <c_startup+0x33e>
   23180:	00074683          	lbu	a3,0(a4)
   23184:	0705                	add	a4,a4,1
   23186:	0785                	add	a5,a5,1
   23188:	fed78fa3          	sb	a3,-1(a5)
   2318c:	fee61ae3          	bne	a2,a4,23180 <c_startup+0x32e>
   23190:	0002a6b7          	lui	a3,0x2a
   23194:	9d818793          	add	a5,gp,-1576 # a01d8 <timer_cb>
   23198:	ec068713          	add	a4,a3,-320 # 29ec0 <__fast_load_addr__>
   2319c:	00e7e533          	or	a0,a5,a4
   231a0:	9d818813          	add	a6,gp,-1576 # a01d8 <timer_cb>
   231a4:	9d818593          	add	a1,gp,-1576 # a01d8 <timer_cb>
   231a8:	890d                	and	a0,a0,3
   231aa:	410585b3          	sub	a1,a1,a6
   231ae:	9d818613          	add	a2,gp,-1576 # a01d8 <timer_cb>
   231b2:	ec068813          	add	a6,a3,-320
   231b6:	14050063          	beqz	a0,232f6 <c_startup+0x4a4>
   231ba:	00b70633          	add	a2,a4,a1
   231be:	24058063          	beqz	a1,233fe <c_startup+0x5ac>
   231c2:	00074683          	lbu	a3,0(a4)
   231c6:	0705                	add	a4,a4,1
   231c8:	0785                	add	a5,a5,1
   231ca:	fed78fa3          	sb	a3,-1(a5)
   231ce:	fee61ae3          	bne	a2,a4,231c2 <c_startup+0x370>
   231d2:	8082                	ret
   231d4:	00275693          	srl	a3,a4,0x2
   231d8:	00377613          	and	a2,a4,3
   231dc:	ca81                	beqz	a3,231ec <c_startup+0x39a>
   231de:	068a                	sll	a3,a3,0x2
   231e0:	96ae                	add	a3,a3,a1
   231e2:	0007a023          	sw	zero,0(a5)
   231e6:	0791                	add	a5,a5,4
   231e8:	fed79de3          	bne	a5,a3,231e2 <c_startup+0x390>
   231ec:	9b71                	and	a4,a4,-4
   231ee:	e80607e3          	beqz	a2,2307c <c_startup+0x22a>
   231f2:	00e587b3          	add	a5,a1,a4
   231f6:	00078023          	sb	zero,0(a5)
   231fa:	4785                	li	a5,1
   231fc:	e8f600e3          	beq	a2,a5,2307c <c_startup+0x22a>
   23200:	9f918793          	add	a5,gp,-1543 # a01f9 <__bss_end__+0x1>
   23204:	97ba                	add	a5,a5,a4
   23206:	00078023          	sb	zero,0(a5)
   2320a:	478d                	li	a5,3
   2320c:	e6f618e3          	bne	a2,a5,2307c <c_startup+0x22a>
   23210:	9fa18793          	add	a5,gp,-1542 # a01fa <__bss_end__+0x2>
   23214:	973e                	add	a4,a4,a5
   23216:	00070023          	sb	zero,0(a4)
   2321a:	b58d                	j	2307c <c_startup+0x22a>
   2321c:	00275693          	srl	a3,a4,0x2
   23220:	00377613          	and	a2,a4,3
   23224:	ca81                	beqz	a3,23234 <c_startup+0x3e2>
   23226:	068a                	sll	a3,a3,0x2
   23228:	96ae                	add	a3,a3,a1
   2322a:	0007a023          	sw	zero,0(a5)
   2322e:	0791                	add	a5,a5,4
   23230:	fed79de3          	bne	a5,a3,2322a <c_startup+0x3d8>
   23234:	9b71                	and	a4,a4,-4
   23236:	d80608e3          	beqz	a2,22fc6 <c_startup+0x174>
   2323a:	00e587b3          	add	a5,a1,a4
   2323e:	00078023          	sb	zero,0(a5)
   23242:	4785                	li	a5,1
   23244:	d8f601e3          	beq	a2,a5,22fc6 <c_startup+0x174>
   23248:	000b87b7          	lui	a5,0xb8
   2324c:	00178793          	add	a5,a5,1 # b8001 <__noncacheable_bss_end__+0x1>
   23250:	97ba                	add	a5,a5,a4
   23252:	00078023          	sb	zero,0(a5)
   23256:	478d                	li	a5,3
   23258:	d6f617e3          	bne	a2,a5,22fc6 <c_startup+0x174>
   2325c:	000b87b7          	lui	a5,0xb8
   23260:	00278793          	add	a5,a5,2 # b8002 <__noncacheable_bss_end__+0x2>
   23264:	973e                	add	a4,a4,a5
   23266:	00070023          	sb	zero,0(a4)
   2326a:	bbb1                	j	22fc6 <c_startup+0x174>
   2326c:	00275693          	srl	a3,a4,0x2
   23270:	00377613          	and	a2,a4,3
   23274:	ca81                	beqz	a3,23284 <c_startup+0x432>
   23276:	068a                	sll	a3,a3,0x2
   23278:	96ae                	add	a3,a3,a1
   2327a:	0007a023          	sw	zero,0(a5)
   2327e:	0791                	add	a5,a5,4
   23280:	fed79de3          	bne	a5,a3,2327a <c_startup+0x428>
   23284:	9b71                	and	a4,a4,-4
   23286:	c80601e3          	beqz	a2,22f08 <c_startup+0xb6>
   2328a:	00e587b3          	add	a5,a1,a4
   2328e:	00078023          	sb	zero,0(a5)
   23292:	4785                	li	a5,1
   23294:	c6f60ae3          	beq	a2,a5,22f08 <c_startup+0xb6>
   23298:	9d918793          	add	a5,gp,-1575 # a01d9 <timer_cb+0x1>
   2329c:	97ba                	add	a5,a5,a4
   2329e:	00078023          	sb	zero,0(a5)
   232a2:	478d                	li	a5,3
   232a4:	c6f612e3          	bne	a2,a5,22f08 <c_startup+0xb6>
   232a8:	9da18793          	add	a5,gp,-1574 # a01da <timer_cb+0x2>
   232ac:	973e                	add	a4,a4,a5
   232ae:	00070023          	sb	zero,0(a4)
   232b2:	b999                	j	22f08 <c_startup+0xb6>
   232b4:	0025d513          	srl	a0,a1,0x2
   232b8:	0035f893          	and	a7,a1,3
   232bc:	cd01                	beqz	a0,232d4 <c_startup+0x482>
   232be:	050a                	sll	a0,a0,0x2
   232c0:	9542                	add	a0,a0,a6
   232c2:	ce868713          	add	a4,a3,-792
   232c6:	4314                	lw	a3,0(a4)
   232c8:	0711                	add	a4,a4,4
   232ca:	0791                	add	a5,a5,4
   232cc:	fed7ae23          	sw	a3,-4(a5)
   232d0:	fee51be3          	bne	a0,a4,232c6 <c_startup+0x474>
   232d4:	ffc5f713          	and	a4,a1,-4
   232d8:	de0884e3          	beqz	a7,230c0 <c_startup+0x26e>
   232dc:	00e807b3          	add	a5,a6,a4
   232e0:	963a                	add	a2,a2,a4
   232e2:	982e                	add	a6,a6,a1
   232e4:	0007c703          	lbu	a4,0(a5)
   232e8:	0785                	add	a5,a5,1
   232ea:	0605                	add	a2,a2,1 # b8001 <__noncacheable_bss_end__+0x1>
   232ec:	fee60fa3          	sb	a4,-1(a2)
   232f0:	fef81ae3          	bne	a6,a5,232e4 <c_startup+0x492>
   232f4:	b3f1                	j	230c0 <c_startup+0x26e>
   232f6:	0025d513          	srl	a0,a1,0x2
   232fa:	0035f893          	and	a7,a1,3
   232fe:	cd01                	beqz	a0,23316 <c_startup+0x4c4>
   23300:	050a                	sll	a0,a0,0x2
   23302:	9542                	add	a0,a0,a6
   23304:	ec068713          	add	a4,a3,-320
   23308:	4314                	lw	a3,0(a4)
   2330a:	0711                	add	a4,a4,4
   2330c:	0791                	add	a5,a5,4
   2330e:	fed7ae23          	sw	a3,-4(a5)
   23312:	fee51be3          	bne	a0,a4,23308 <c_startup+0x4b6>
   23316:	ffc5f713          	and	a4,a1,-4
   2331a:	ea088ce3          	beqz	a7,231d2 <c_startup+0x380>
   2331e:	00e807b3          	add	a5,a6,a4
   23322:	963a                	add	a2,a2,a4
   23324:	982e                	add	a6,a6,a1
   23326:	0007c703          	lbu	a4,0(a5)
   2332a:	0785                	add	a5,a5,1
   2332c:	0605                	add	a2,a2,1
   2332e:	fee60fa3          	sb	a4,-1(a2)
   23332:	fef81ae3          	bne	a6,a5,23326 <c_startup+0x4d4>
   23336:	8082                	ret
   23338:	0025d513          	srl	a0,a1,0x2
   2333c:	0035f893          	and	a7,a1,3
   23340:	cd01                	beqz	a0,23358 <c_startup+0x506>
   23342:	050a                	sll	a0,a0,0x2
   23344:	9542                	add	a0,a0,a6
   23346:	ec068713          	add	a4,a3,-320
   2334a:	4314                	lw	a3,0(a4)
   2334c:	0711                	add	a4,a4,4
   2334e:	0791                	add	a5,a5,4
   23350:	fed7ae23          	sw	a3,-4(a5)
   23354:	fea71be3          	bne	a4,a0,2334a <c_startup+0x4f8>
   23358:	ffc5f713          	and	a4,a1,-4
   2335c:	e2088ae3          	beqz	a7,23190 <c_startup+0x33e>
   23360:	00e807b3          	add	a5,a6,a4
   23364:	963a                	add	a2,a2,a4
   23366:	982e                	add	a6,a6,a1
   23368:	0007c703          	lbu	a4,0(a5)
   2336c:	0785                	add	a5,a5,1
   2336e:	0605                	add	a2,a2,1
   23370:	fee60fa3          	sb	a4,-1(a2)
   23374:	ff079ae3          	bne	a5,a6,23368 <c_startup+0x516>
   23378:	bd21                	j	23190 <c_startup+0x33e>
   2337a:	0025d513          	srl	a0,a1,0x2
   2337e:	0035f893          	and	a7,a1,3
   23382:	cd01                	beqz	a0,2339a <c_startup+0x548>
   23384:	050a                	sll	a0,a0,0x2
   23386:	9542                	add	a0,a0,a6
   23388:	ec068713          	add	a4,a3,-320
   2338c:	4314                	lw	a3,0(a4)
   2338e:	0711                	add	a4,a4,4
   23390:	0791                	add	a5,a5,4
   23392:	fed7ae23          	sw	a3,-4(a5)
   23396:	fea71be3          	bne	a4,a0,2338c <c_startup+0x53a>
   2339a:	ffc5f713          	and	a4,a1,-4
   2339e:	da0885e3          	beqz	a7,23148 <c_startup+0x2f6>
   233a2:	00e807b3          	add	a5,a6,a4
   233a6:	963a                	add	a2,a2,a4
   233a8:	982e                	add	a6,a6,a1
   233aa:	0007c703          	lbu	a4,0(a5)
   233ae:	0785                	add	a5,a5,1
   233b0:	0605                	add	a2,a2,1
   233b2:	fee60fa3          	sb	a4,-1(a2)
   233b6:	fef81ae3          	bne	a6,a5,233aa <c_startup+0x558>
   233ba:	b379                	j	23148 <c_startup+0x2f6>
   233bc:	0025d513          	srl	a0,a1,0x2
   233c0:	0035f893          	and	a7,a1,3
   233c4:	cd01                	beqz	a0,233dc <c_startup+0x58a>
   233c6:	050a                	sll	a0,a0,0x2
   233c8:	9542                	add	a0,a0,a6
   233ca:	ec068713          	add	a4,a3,-320
   233ce:	4314                	lw	a3,0(a4)
   233d0:	0711                	add	a4,a4,4
   233d2:	0791                	add	a5,a5,4
   233d4:	fed7ae23          	sw	a3,-4(a5)
   233d8:	fea71be3          	bne	a4,a0,233ce <c_startup+0x57c>
   233dc:	ffc5f713          	and	a4,a1,-4
   233e0:	d20884e3          	beqz	a7,23108 <c_startup+0x2b6>
   233e4:	00e807b3          	add	a5,a6,a4
   233e8:	963a                	add	a2,a2,a4
   233ea:	982e                	add	a6,a6,a1
   233ec:	0007c703          	lbu	a4,0(a5)
   233f0:	0785                	add	a5,a5,1
   233f2:	0605                	add	a2,a2,1
   233f4:	fee60fa3          	sb	a4,-1(a2)
   233f8:	fef81ae3          	bne	a6,a5,233ec <c_startup+0x59a>
   233fc:	b331                	j	23108 <c_startup+0x2b6>
   233fe:	8082                	ret
   23400:	4681                	li	a3,0
   23402:	b135                	j	2302e <c_startup+0x1dc>
   23404:	4681                	li	a3,0
   23406:	be8d                	j	22f78 <c_startup+0x126>
   23408:	4681                	li	a3,0
   2340a:	bc45                	j	22eba <c_startup+0x68>

0002340c <reset_handler>:
   2340c:	1141                	add	sp,sp,-16
   2340e:	c606                	sw	ra,12(sp)
   23410:	0000100f          	fence.i
   23414:	2a2d                	jal	2354e <system_init>
   23416:	40b2                	lw	ra,12(sp)
   23418:	0141                	add	sp,sp,16
   2341a:	b2bd                	j	22d88 <main>

0002341c <_init>:
   2341c:	8082                	ret

0002341e <syscall_handler>:
   2341e:	8082                	ret

00023420 <mchtmr_isr>:
   23420:	8082                	ret

00023422 <swi_isr>:
   23422:	8082                	ret

00023424 <exception_handler>:
   23424:	852e                	mv	a0,a1
   23426:	8082                	ret

00023428 <exception_s_handler>:
   23428:	852e                	mv	a0,a1
   2342a:	8082                	ret

0002342c <swi_s_isr>:
   2342c:	8082                	ret

0002342e <mchtmr_s_isr>:
   2342e:	8082                	ret

00023430 <l1c_dc_enable>:
   23430:	7ca027f3          	csrr	a5,0x7ca
   23434:	8b89                	and	a5,a5,2
   23436:	eb81                	bnez	a5,23446 <l1c_dc_enable+0x16>
   23438:	6799                	lui	a5,0x6
   2343a:	7ca7a073          	csrs	0x7ca,a5
   2343e:	40200793          	li	a5,1026
   23442:	7ca7a073          	csrs	0x7ca,a5
   23446:	8082                	ret

00023448 <l1c_ic_enable>:
   23448:	7ca027f3          	csrr	a5,0x7ca
   2344c:	8b85                	and	a5,a5,1
   2344e:	e789                	bnez	a5,23458 <l1c_ic_enable+0x10>
   23450:	30100793          	li	a5,769
   23454:	7ca7a073          	csrs	0x7ca,a5
   23458:	8082                	ret

0002345a <l1c_dc_invalidate_all>:
   2345a:	47dd                	li	a5,23
   2345c:	7cc79073          	csrw	0x7cc,a5
   23460:	8082                	ret

00023462 <init_uart2_pins>:
   23462:	f40407b7          	lui	a5,0xf4040
   23466:	4709                	li	a4,2
   23468:	2ce7a823          	sw	a4,720(a5) # f40402d0 <__share_mem_end__+0xf2f802d0>
   2346c:	2ce7ac23          	sw	a4,728(a5)
   23470:	8082                	ret

00023472 <init_uart2_clock>:
   23472:	011f0537          	lui	a0,0x11f0
   23476:	4581                	li	a1,0
   23478:	0525                	add	a0,a0,9 # 11f0009 <__share_mem_end__+0x130009>
   2347a:	a1dd                	j	23960 <clock_add_to_group>

0002347c <board_init_core1>:
   2347c:	716d                	add	sp,sp,-272
   2347e:	10112623          	sw	ra,268(sp)
   23482:	234d                	jal	23a24 <clock_update_core_clock>
   23484:	3ff9                	jal	23462 <init_uart2_pins>
   23486:	37f5                	jal	23472 <init_uart2_clock>
   23488:	011f0537          	lui	a0,0x11f0
   2348c:	f00487b7          	lui	a5,0xf0048
   23490:	0525                	add	a0,a0,9 # 11f0009 <__share_mem_end__+0x130009>
   23492:	c23e                	sw	a5,4(sp)
   23494:	c002                	sw	zero,0(sp)
   23496:	2cc9                	jal	23768 <clock_get_frequency>
   23498:	67f1                	lui	a5,0x1c
   2349a:	872a                	mv	a4,a0
   2349c:	20078793          	add	a5,a5,512 # 1c200 <__fw_size__+0x124f0>
   234a0:	850a                	mv	a0,sp
   234a2:	c43a                	sw	a4,8(sp)
   234a4:	c63e                	sw	a5,12(sp)
   234a6:	41b000ef          	jal	240c0 <console_init>
   234aa:	e149                	bnez	a0,2352c <board_init_core1+0xb0>
   234ac:	10000613          	li	a2,256
   234b0:	4581                	li	a1,0
   234b2:	850a                	mv	a0,sp
   234b4:	905fe0ef          	jal	21db8 <memset>
   234b8:	56fd                	li	a3,-1
   234ba:	467d                	li	a2,31
   234bc:	000b87b7          	lui	a5,0xb8
   234c0:	000c0737          	lui	a4,0xc0
   234c4:	00078793          	mv	a5,a5
   234c8:	00070713          	mv	a4,a4
   234cc:	c236                	sw	a3,4(sp)
   234ce:	00c10023          	sb	a2,0(sp)
   234d2:	40f706b3          	sub	a3,a4,a5
   234d6:	04f71c63          	bne	a4,a5,2352e <board_init_core1+0xb2>
   234da:	4585                	li	a1,1
   234dc:	4509                	li	a0,2
   234de:	4705                	li	a4,1
   234e0:	010bc7b7          	lui	a5,0x10bc
   234e4:	010c06b7          	lui	a3,0x10c0
   234e8:	00078793          	mv	a5,a5
   234ec:	00068693          	mv	a3,a3
   234f0:	40f68633          	sub	a2,a3,a5
   234f4:	02f68563          	beq	a3,a5,2351e <board_init_core1+0xa2>
   234f8:	17fd                	add	a5,a5,-1 # 10bbfff <_flash_size+0xbbfff>
   234fa:	8205                	srl	a2,a2,0x1
   234fc:	0712                	sll	a4,a4,0x4
   234fe:	97b2                	add	a5,a5,a2
   23500:	10070713          	add	a4,a4,256 # c0100 <__noncacheable_end__+0x100>
   23504:	970a                	add	a4,a4,sp
   23506:	8389                	srl	a5,a5,0x2
   23508:	f0f72223          	sw	a5,-252(a4)
   2350c:	46fd                	li	a3,31
   2350e:	f0f72623          	sw	a5,-244(a4)
   23512:	47bd                	li	a5,15
   23514:	f0d70023          	sb	a3,-256(a4)
   23518:	f0f70423          	sb	a5,-248(a4)
   2351c:	85aa                	mv	a1,a0
   2351e:	850a                	mv	a0,sp
   23520:	0d7000ef          	jal	23df6 <pmp_config>
   23524:	10c12083          	lw	ra,268(sp)
   23528:	6151                	add	sp,sp,272
   2352a:	8082                	ret
   2352c:	a001                	j	2352c <board_init_core1+0xb0>
   2352e:	17fd                	add	a5,a5,-1
   23530:	8285                	srl	a3,a3,0x1
   23532:	97b6                	add	a5,a5,a3
   23534:	8389                	srl	a5,a5,0x2
   23536:	ca3e                	sw	a5,20(sp)
   23538:	ce3e                	sw	a5,28(sp)
   2353a:	47bd                	li	a5,15
   2353c:	00c10823          	sb	a2,16(sp)
   23540:	00f10c23          	sb	a5,24(sp)
   23544:	4589                	li	a1,2
   23546:	450d                	li	a0,3
   23548:	4709                	li	a4,2
   2354a:	bf59                	j	234e0 <board_init_core1+0x64>

0002354c <board_delay_ms>:
   2354c:	a13d                	j	2397a <clock_cpu_delay_ms>

0002354e <system_init>:
   2354e:	1141                	add	sp,sp,-16
   23550:	306027f3          	csrr	a5,mcounteren
   23554:	0017e793          	or	a5,a5,1
   23558:	30679073          	csrw	mcounteren,a5
   2355c:	4721                	li	a4,8
   2355e:	c602                	sw	zero,12(sp)
   23560:	300736f3          	csrrc	a3,mstatus,a4
   23564:	6785                	lui	a5,0x1
   23566:	c636                	sw	a3,12(sp)
   23568:	46b2                	lw	a3,12(sp)
   2356a:	80078793          	add	a5,a5,-2048 # 800 <__eh_frame_hdr_end+0x800>
   2356e:	3047b073          	csrc	mie,a5
   23572:	e40006b7          	lui	a3,0xe4000
   23576:	460d                	li	a2,3
   23578:	c290                	sw	a2,0(a3)
   2357a:	3047a073          	csrs	mie,a5
   2357e:	30072073          	csrs	mstatus,a4
   23582:	0141                	add	sp,sp,16
   23584:	8082                	ret

00023586 <sysctl_enable_group_resource>:
   23586:	0ff00793          	li	a5,255
   2358a:	00c7fb63          	bgeu	a5,a2,235a0 <sysctl_enable_group_resource+0x1a>
   2358e:	f0060793          	add	a5,a2,-256
   23592:	8395                	srl	a5,a5,0x5
   23594:	01f67813          	and	a6,a2,31
   23598:	c99d                	beqz	a1,235ce <sysctl_enable_group_resource+0x48>
   2359a:	4705                	li	a4,1
   2359c:	00e58463          	beq	a1,a4,235a4 <sysctl_enable_group_resource+0x1e>
   235a0:	4509                	li	a0,2
   235a2:	8082                	ret
   235a4:	0792                	sll	a5,a5,0x4
   235a6:	6705                	lui	a4,0x1
   235a8:	97aa                	add	a5,a5,a0
   235aa:	97ba                	add	a5,a5,a4
   235ac:	8407a703          	lw	a4,-1984(a5)
   235b0:	010595b3          	sll	a1,a1,a6
   235b4:	cab1                	beqz	a3,23608 <sysctl_enable_group_resource+0x82>
   235b6:	8f4d                	or	a4,a4,a1
   235b8:	060a                	sll	a2,a2,0x2
   235ba:	84e7a023          	sw	a4,-1984(a5)
   235be:	9532                	add	a0,a0,a2
   235c0:	411c                	lw	a5,0(a0)
   235c2:	00179713          	sll	a4,a5,0x1
   235c6:	fe074de3          	bltz	a4,235c0 <sysctl_enable_group_resource+0x3a>
   235ca:	4501                	li	a0,0
   235cc:	8082                	ret
   235ce:	0792                	sll	a5,a5,0x4
   235d0:	6705                	lui	a4,0x1
   235d2:	97aa                	add	a5,a5,a0
   235d4:	97ba                	add	a5,a5,a4
   235d6:	8007a583          	lw	a1,-2048(a5)
   235da:	4705                	li	a4,1
   235dc:	01071733          	sll	a4,a4,a6
   235e0:	ce89                	beqz	a3,235fa <sysctl_enable_group_resource+0x74>
   235e2:	8dd9                	or	a1,a1,a4
   235e4:	060a                	sll	a2,a2,0x2
   235e6:	80b7a023          	sw	a1,-2048(a5)
   235ea:	9532                	add	a0,a0,a2
   235ec:	411c                	lw	a5,0(a0)
   235ee:	00179713          	sll	a4,a5,0x1
   235f2:	fe074de3          	bltz	a4,235ec <sysctl_enable_group_resource+0x66>
   235f6:	4501                	li	a0,0
   235f8:	8082                	ret
   235fa:	fff74713          	not	a4,a4
   235fe:	8f6d                	and	a4,a4,a1
   23600:	80e7a023          	sw	a4,-2048(a5)
   23604:	4501                	li	a0,0
   23606:	8082                	ret
   23608:	fff5c593          	not	a1,a1
   2360c:	8df9                	and	a1,a1,a4
   2360e:	84b7a023          	sw	a1,-1984(a5)
   23612:	bfcd                	j	23604 <sysctl_enable_group_resource+0x7e>

00023614 <get_frequency_for_cpu>:
   23614:	f4002737          	lui	a4,0xf4002
   23618:	80072783          	lw	a5,-2048(a4) # f4001800 <__share_mem_end__+0xf2f41800>
   2361c:	1141                	add	sp,sp,-16
   2361e:	c422                	sw	s0,8(sp)
   23620:	8399                	srl	a5,a5,0x6
   23622:	80072403          	lw	s0,-2048(a4)
   23626:	00029737          	lui	a4,0x29
   2362a:	8bf1                	and	a5,a5,28
   2362c:	76870713          	add	a4,a4,1896 # 29768 <__clz_tab+0x308>
   23630:	97ba                	add	a5,a5,a4
   23632:	439c                	lw	a5,0(a5)
   23634:	0ff47413          	zext.b	s0,s0
   23638:	c606                	sw	ra,12(sp)
   2363a:	0405                	add	s0,s0,1
   2363c:	8782                	jr	a5
   2363e:	4605                	li	a2,1
   23640:	4589                	li	a1,2
   23642:	f4100537          	lui	a0,0xf4100
   23646:	141000ef          	jal	23f86 <pllctlv2_get_pll_postdiv_freq_in_hz>
   2364a:	02855533          	divu	a0,a0,s0
   2364e:	40b2                	lw	ra,12(sp)
   23650:	4422                	lw	s0,8(sp)
   23652:	0141                	add	sp,sp,16
   23654:	8082                	ret
   23656:	4601                	li	a2,0
   23658:	4581                	li	a1,0
   2365a:	f4100537          	lui	a0,0xf4100
   2365e:	129000ef          	jal	23f86 <pllctlv2_get_pll_postdiv_freq_in_hz>
   23662:	02855533          	divu	a0,a0,s0
   23666:	40b2                	lw	ra,12(sp)
   23668:	4422                	lw	s0,8(sp)
   2366a:	0141                	add	sp,sp,16
   2366c:	8082                	ret
   2366e:	4605                	li	a2,1
   23670:	4581                	li	a1,0
   23672:	f4100537          	lui	a0,0xf4100
   23676:	111000ef          	jal	23f86 <pllctlv2_get_pll_postdiv_freq_in_hz>
   2367a:	02855533          	divu	a0,a0,s0
   2367e:	40b2                	lw	ra,12(sp)
   23680:	4422                	lw	s0,8(sp)
   23682:	0141                	add	sp,sp,16
   23684:	8082                	ret
   23686:	4609                	li	a2,2
   23688:	4581                	li	a1,0
   2368a:	f4100537          	lui	a0,0xf4100
   2368e:	0f9000ef          	jal	23f86 <pllctlv2_get_pll_postdiv_freq_in_hz>
   23692:	02855533          	divu	a0,a0,s0
   23696:	40b2                	lw	ra,12(sp)
   23698:	4422                	lw	s0,8(sp)
   2369a:	0141                	add	sp,sp,16
   2369c:	8082                	ret
   2369e:	4601                	li	a2,0
   236a0:	4585                	li	a1,1
   236a2:	f4100537          	lui	a0,0xf4100
   236a6:	0e1000ef          	jal	23f86 <pllctlv2_get_pll_postdiv_freq_in_hz>
   236aa:	02855533          	divu	a0,a0,s0
   236ae:	40b2                	lw	ra,12(sp)
   236b0:	4422                	lw	s0,8(sp)
   236b2:	0141                	add	sp,sp,16
   236b4:	8082                	ret
   236b6:	4605                	li	a2,1
   236b8:	4585                	li	a1,1
   236ba:	f4100537          	lui	a0,0xf4100
   236be:	0c9000ef          	jal	23f86 <pllctlv2_get_pll_postdiv_freq_in_hz>
   236c2:	02855533          	divu	a0,a0,s0
   236c6:	40b2                	lw	ra,12(sp)
   236c8:	4422                	lw	s0,8(sp)
   236ca:	0141                	add	sp,sp,16
   236cc:	8082                	ret
   236ce:	4601                	li	a2,0
   236d0:	4589                	li	a1,2
   236d2:	f4100537          	lui	a0,0xf4100
   236d6:	0b1000ef          	jal	23f86 <pllctlv2_get_pll_postdiv_freq_in_hz>
   236da:	02855533          	divu	a0,a0,s0
   236de:	40b2                	lw	ra,12(sp)
   236e0:	4422                	lw	s0,8(sp)
   236e2:	0141                	add	sp,sp,16
   236e4:	8082                	ret
   236e6:	016e3537          	lui	a0,0x16e3
   236ea:	60050513          	add	a0,a0,1536 # 16e3600 <__share_mem_end__+0x623600>
   236ee:	bfb1                	j	2364a <get_frequency_for_cpu+0x36>

000236f0 <get_frequency_for_source>:
   236f0:	479d                	li	a5,7
   236f2:	06a7e963          	bltu	a5,a0,23764 <get_frequency_for_source+0x74>
   236f6:	000297b7          	lui	a5,0x29
   236fa:	78878793          	add	a5,a5,1928 # 29788 <__clz_tab+0x328>
   236fe:	050a                	sll	a0,a0,0x2
   23700:	953e                	add	a0,a0,a5
   23702:	411c                	lw	a5,0(a0)
   23704:	8782                	jr	a5
   23706:	016e3537          	lui	a0,0x16e3
   2370a:	60050513          	add	a0,a0,1536 # 16e3600 <__share_mem_end__+0x623600>
   2370e:	8082                	ret
   23710:	4601                	li	a2,0
   23712:	4581                	li	a1,0
   23714:	f4100537          	lui	a0,0xf4100
   23718:	06f0006f          	j	23f86 <pllctlv2_get_pll_postdiv_freq_in_hz>
   2371c:	4605                	li	a2,1
   2371e:	4581                	li	a1,0
   23720:	f4100537          	lui	a0,0xf4100
   23724:	0630006f          	j	23f86 <pllctlv2_get_pll_postdiv_freq_in_hz>
   23728:	4609                	li	a2,2
   2372a:	4581                	li	a1,0
   2372c:	f4100537          	lui	a0,0xf4100
   23730:	0570006f          	j	23f86 <pllctlv2_get_pll_postdiv_freq_in_hz>
   23734:	4601                	li	a2,0
   23736:	4585                	li	a1,1
   23738:	f4100537          	lui	a0,0xf4100
   2373c:	04b0006f          	j	23f86 <pllctlv2_get_pll_postdiv_freq_in_hz>
   23740:	4605                	li	a2,1
   23742:	4585                	li	a1,1
   23744:	f4100537          	lui	a0,0xf4100
   23748:	03f0006f          	j	23f86 <pllctlv2_get_pll_postdiv_freq_in_hz>
   2374c:	4601                	li	a2,0
   2374e:	4589                	li	a1,2
   23750:	f4100537          	lui	a0,0xf4100
   23754:	0330006f          	j	23f86 <pllctlv2_get_pll_postdiv_freq_in_hz>
   23758:	4605                	li	a2,1
   2375a:	4589                	li	a1,2
   2375c:	f4100537          	lui	a0,0xf4100
   23760:	0270006f          	j	23f86 <pllctlv2_get_pll_postdiv_freq_in_hz>
   23764:	4501                	li	a0,0
   23766:	8082                	ret

00023768 <clock_get_frequency>:
   23768:	872a                	mv	a4,a0
   2376a:	8121                	srl	a0,a0,0x8
   2376c:	0ff57513          	zext.b	a0,a0
   23770:	47ad                	li	a5,11
   23772:	1ea7e563          	bltu	a5,a0,2395c <clock_get_frequency+0x1f4>
   23776:	000296b7          	lui	a3,0x29
   2377a:	00251793          	sll	a5,a0,0x2
   2377e:	7a868693          	add	a3,a3,1960 # 297a8 <__clz_tab+0x348>
   23782:	97b6                	add	a5,a5,a3
   23784:	439c                	lw	a5,0(a5)
   23786:	1141                	add	sp,sp,-16
   23788:	c606                	sw	ra,12(sp)
   2378a:	0ff77613          	zext.b	a2,a4
   2378e:	8782                	jr	a5
   23790:	0fe77513          	and	a0,a4,254
   23794:	18050363          	beqz	a0,2391a <clock_get_frequency+0x1b2>
   23798:	4501                	li	a0,0
   2379a:	40b2                	lw	ra,12(sp)
   2379c:	0141                	add	sp,sp,16
   2379e:	8082                	ret
   237a0:	02c00793          	li	a5,44
   237a4:	fec7ebe3          	bltu	a5,a2,2379a <clock_get_frequency+0x32>
   237a8:	060a                	sll	a2,a2,0x2
   237aa:	f40027b7          	lui	a5,0xf4002
   237ae:	963e                	add	a2,a2,a5
   237b0:	c422                	sw	s0,8(sp)
   237b2:	80462403          	lw	s0,-2044(a2)
   237b6:	80462503          	lw	a0,-2044(a2)
   237ba:	aa39                	j	238d8 <clock_get_frequency+0x170>
   237bc:	4789                	li	a5,2
   237be:	4501                	li	a0,0
   237c0:	fcc7ede3          	bltu	a5,a2,2379a <clock_get_frequency+0x32>
   237c4:	70060793          	add	a5,a2,1792
   237c8:	f40006b7          	lui	a3,0xf4000
   237cc:	078a                	sll	a5,a5,0x2
   237ce:	97b6                	add	a5,a5,a3
   237d0:	4398                	lw	a4,0(a5)
   237d2:	0002a7b7          	lui	a5,0x2a
   237d6:	c2078793          	add	a5,a5,-992 # 29c20 <s_adc_clk_mux_node>
   237da:	8319                	srl	a4,a4,0x6
   237dc:	8b11                	and	a4,a4,4
   237de:	97ba                	add	a5,a5,a4
   237e0:	439c                	lw	a5,0(a5)
   237e2:	0fe00713          	li	a4,254
   237e6:	14e78d63          	beq	a5,a4,23940 <clock_get_frequency+0x1d8>
   237ea:	97b2                	add	a5,a5,a2
   237ec:	0ff7f793          	zext.b	a5,a5
   237f0:	02c00713          	li	a4,44
   237f4:	faf763e3          	bltu	a4,a5,2379a <clock_get_frequency+0x32>
   237f8:	078a                	sll	a5,a5,0x2
   237fa:	97b6                	add	a5,a5,a3
   237fc:	6709                	lui	a4,0x2
   237fe:	97ba                	add	a5,a5,a4
   23800:	c422                	sw	s0,8(sp)
   23802:	8047a403          	lw	s0,-2044(a5)
   23806:	8047a503          	lw	a0,-2044(a5)
   2380a:	8121                	srl	a0,a0,0x8
   2380c:	891d                	and	a0,a0,7
   2380e:	35cd                	jal	236f0 <get_frequency_for_source>
   23810:	0ff47793          	zext.b	a5,s0
   23814:	0785                	add	a5,a5,1
   23816:	02f55533          	divu	a0,a0,a5
   2381a:	4422                	lw	s0,8(sp)
   2381c:	bfbd                	j	2379a <clock_get_frequency+0x32>
   2381e:	0002a7b7          	lui	a5,0x2a
   23822:	060a                	sll	a2,a2,0x2
   23824:	c1078793          	add	a5,a5,-1008 # 29c10 <s_wdgs>
   23828:	97b2                	add	a5,a5,a2
   2382a:	439c                	lw	a5,0(a5)
   2382c:	6521                	lui	a0,0x8
   2382e:	4b9c                	lw	a5,16(a5)
   23830:	8b89                	and	a5,a5,2
   23832:	f7a5                	bnez	a5,2379a <clock_get_frequency+0x32>
   23834:	f40027b7          	lui	a5,0xf4002
   23838:	c422                	sw	s0,8(sp)
   2383a:	8007a403          	lw	s0,-2048(a5) # f4001800 <__share_mem_end__+0xf2f41800>
   2383e:	8007a503          	lw	a0,-2048(a5)
   23842:	c226                	sw	s1,4(sp)
   23844:	8007a483          	lw	s1,-2048(a5)
   23848:	8121                	srl	a0,a0,0x8
   2384a:	891d                	and	a0,a0,7
   2384c:	0ff4f493          	zext.b	s1,s1
   23850:	3545                	jal	236f0 <get_frequency_for_source>
   23852:	0485                	add	s1,s1,1
   23854:	02955533          	divu	a0,a0,s1
   23858:	01445793          	srl	a5,s0,0x14
   2385c:	8bbd                	and	a5,a5,15
   2385e:	0785                	add	a5,a5,1
   23860:	4422                	lw	s0,8(sp)
   23862:	4492                	lw	s1,4(sp)
   23864:	02f55533          	divu	a0,a0,a5
   23868:	bf0d                	j	2379a <clock_get_frequency+0x32>
   2386a:	f40027b7          	lui	a5,0xf4002
   2386e:	c422                	sw	s0,8(sp)
   23870:	8007a403          	lw	s0,-2048(a5) # f4001800 <__share_mem_end__+0xf2f41800>
   23874:	8007a503          	lw	a0,-2048(a5)
   23878:	c226                	sw	s1,4(sp)
   2387a:	8007a483          	lw	s1,-2048(a5)
   2387e:	8121                	srl	a0,a0,0x8
   23880:	891d                	and	a0,a0,7
   23882:	0ff4f493          	zext.b	s1,s1
   23886:	35ad                	jal	236f0 <get_frequency_for_source>
   23888:	0485                	add	s1,s1,1
   2388a:	02955533          	divu	a0,a0,s1
   2388e:	8051                	srl	s0,s0,0x14
   23890:	883d                	and	s0,s0,15
   23892:	0405                	add	s0,s0,1
   23894:	40b2                	lw	ra,12(sp)
   23896:	4492                	lw	s1,4(sp)
   23898:	02855533          	divu	a0,a0,s0
   2389c:	4422                	lw	s0,8(sp)
   2389e:	0141                	add	sp,sp,16
   238a0:	8082                	ret
   238a2:	f40027b7          	lui	a5,0xf4002
   238a6:	c422                	sw	s0,8(sp)
   238a8:	8007a403          	lw	s0,-2048(a5) # f4001800 <__share_mem_end__+0xf2f41800>
   238ac:	8007a503          	lw	a0,-2048(a5)
   238b0:	c226                	sw	s1,4(sp)
   238b2:	8007a483          	lw	s1,-2048(a5)
   238b6:	8121                	srl	a0,a0,0x8
   238b8:	891d                	and	a0,a0,7
   238ba:	0ff4f493          	zext.b	s1,s1
   238be:	3d0d                	jal	236f0 <get_frequency_for_source>
   238c0:	0485                	add	s1,s1,1
   238c2:	02955533          	divu	a0,a0,s1
   238c6:	8041                	srl	s0,s0,0x10
   238c8:	b7e1                	j	23890 <clock_get_frequency+0x128>
   238ca:	f40027b7          	lui	a5,0xf4002
   238ce:	8007a503          	lw	a0,-2048(a5) # f4001800 <__share_mem_end__+0xf2f41800>
   238d2:	c422                	sw	s0,8(sp)
   238d4:	8007a403          	lw	s0,-2048(a5)
   238d8:	8121                	srl	a0,a0,0x8
   238da:	891d                	and	a0,a0,7
   238dc:	0ff47413          	zext.b	s0,s0
   238e0:	3d01                	jal	236f0 <get_frequency_for_source>
   238e2:	0405                	add	s0,s0,1
   238e4:	02855533          	divu	a0,a0,s0
   238e8:	40b2                	lw	ra,12(sp)
   238ea:	4422                	lw	s0,8(sp)
   238ec:	0141                	add	sp,sp,16
   238ee:	8082                	ret
   238f0:	40b2                	lw	ra,12(sp)
   238f2:	8532                	mv	a0,a2
   238f4:	0141                	add	sp,sp,16
   238f6:	bbed                	j	236f0 <get_frequency_for_source>
   238f8:	f40e87b7          	lui	a5,0xf40e8
   238fc:	4b9c                	lw	a5,16(a5)
   238fe:	016e3537          	lui	a0,0x16e3
   23902:	60050513          	add	a0,a0,1536 # 16e3600 <__share_mem_end__+0x623600>
   23906:	8b89                	and	a5,a5,2
   23908:	e80789e3          	beqz	a5,2379a <clock_get_frequency+0x32>
   2390c:	6521                	lui	a0,0x8
   2390e:	b571                	j	2379a <clock_get_frequency+0x32>
   23910:	016e3537          	lui	a0,0x16e3
   23914:	60050513          	add	a0,a0,1536 # 16e3600 <__share_mem_end__+0x623600>
   23918:	b549                	j	2379a <clock_get_frequency+0x32>
   2391a:	70060793          	add	a5,a2,1792
   2391e:	f40006b7          	lui	a3,0xf4000
   23922:	078a                	sll	a5,a5,0x2
   23924:	97b6                	add	a5,a5,a3
   23926:	47d8                	lw	a4,12(a5)
   23928:	0002a7b7          	lui	a5,0x2a
   2392c:	c1878793          	add	a5,a5,-1000 # 29c18 <s_dac_clk_mux_node>
   23930:	8319                	srl	a4,a4,0x6
   23932:	8b11                	and	a4,a4,4
   23934:	97ba                	add	a5,a5,a4
   23936:	439c                	lw	a5,0(a5)
   23938:	0fe00713          	li	a4,254
   2393c:	eae797e3          	bne	a5,a4,237ea <clock_get_frequency+0x82>
   23940:	f40027b7          	lui	a5,0xf4002
   23944:	c422                	sw	s0,8(sp)
   23946:	8007a403          	lw	s0,-2048(a5) # f4001800 <__share_mem_end__+0xf2f41800>
   2394a:	31e9                	jal	23614 <get_frequency_for_cpu>
   2394c:	01445793          	srl	a5,s0,0x14
   23950:	8bbd                	and	a5,a5,15
   23952:	0785                	add	a5,a5,1
   23954:	02f55533          	divu	a0,a0,a5
   23958:	4422                	lw	s0,8(sp)
   2395a:	b581                	j	2379a <clock_get_frequency+0x32>
   2395c:	4501                	li	a0,0
   2395e:	8082                	ret

00023960 <clock_add_to_group>:
   23960:	01055613          	srl	a2,a0,0x10
   23964:	14100793          	li	a5,321
   23968:	00c7f363          	bgeu	a5,a2,2396e <clock_add_to_group+0xe>
   2396c:	8082                	ret
   2396e:	4685                	li	a3,1
   23970:	0ff5f593          	zext.b	a1,a1
   23974:	f4000537          	lui	a0,0xf4000
   23978:	b139                	j	23586 <sysctl_enable_group_resource>

0002397a <clock_cpu_delay_ms>:
   2397a:	1101                	add	sp,sp,-32
   2397c:	ca26                	sw	s1,20(sp)
   2397e:	ce06                	sw	ra,28(sp)
   23980:	cc22                	sw	s0,24(sp)
   23982:	c84a                	sw	s2,16(sp)
   23984:	c64e                	sw	s3,12(sp)
   23986:	84aa                	mv	s1,a0
   23988:	c00027f3          	rdcycle	a5
   2398c:	c8002973          	rdcycleh	s2
   23990:	c00025f3          	rdcycle	a1
   23994:	843e                	mv	s0,a5
   23996:	00b7e563          	bltu	a5,a1,239a0 <clock_cpu_delay_ms+0x26>
   2399a:	c8002973          	rdcycleh	s2
   2399e:	842e                	mv	s0,a1
   239a0:	9dc1a783          	lw	a5,-1572(gp) # a01dc <hpm_core_clock>
   239a4:	ef89                	bnez	a5,239be <clock_cpu_delay_ms+0x44>
   239a6:	f1402773          	csrr	a4,mhartid
   239aa:	6505                	lui	a0,0x1
   239ac:	4785                	li	a5,1
   239ae:	9fc50513          	add	a0,a0,-1540 # 9fc <__eh_frame_hdr_end+0x9fc>
   239b2:	06f70463          	beq	a4,a5,23a1a <clock_cpu_delay_ms+0xa0>
   239b6:	3b4d                	jal	23768 <clock_get_frequency>
   239b8:	87aa                	mv	a5,a0
   239ba:	9ca1ae23          	sw	a0,-1572(gp) # a01dc <hpm_core_clock>
   239be:	3e778793          	add	a5,a5,999
   239c2:	3e800713          	li	a4,1000
   239c6:	02e7d7b3          	divu	a5,a5,a4
   239ca:	029786b3          	mul	a3,a5,s1
   239ce:	0297b7b3          	mulhu	a5,a5,s1
   239d2:	008685b3          	add	a1,a3,s0
   239d6:	00d5b6b3          	sltu	a3,a1,a3
   239da:	97ca                	add	a5,a5,s2
   239dc:	96be                	add	a3,a3,a5
   239de:	c0002773          	rdcycle	a4
   239e2:	c8002673          	rdcycleh	a2
   239e6:	c00027f3          	rdcycle	a5
   239ea:	00f77f63          	bgeu	a4,a5,23a08 <clock_cpu_delay_ms+0x8e>
   239ee:	fed668e3          	bltu	a2,a3,239de <clock_cpu_delay_ms+0x64>
   239f2:	00c69463          	bne	a3,a2,239fa <clock_cpu_delay_ms+0x80>
   239f6:	feb764e3          	bltu	a4,a1,239de <clock_cpu_delay_ms+0x64>
   239fa:	40f2                	lw	ra,28(sp)
   239fc:	4462                	lw	s0,24(sp)
   239fe:	44d2                	lw	s1,20(sp)
   23a00:	4942                	lw	s2,16(sp)
   23a02:	49b2                	lw	s3,12(sp)
   23a04:	6105                	add	sp,sp,32
   23a06:	8082                	ret
   23a08:	c8002773          	rdcycleh	a4
   23a0c:	fcd769e3          	bltu	a4,a3,239de <clock_cpu_delay_ms+0x64>
   23a10:	fee695e3          	bne	a3,a4,239fa <clock_cpu_delay_ms+0x80>
   23a14:	fcb7e5e3          	bltu	a5,a1,239de <clock_cpu_delay_ms+0x64>
   23a18:	b7cd                	j	239fa <clock_cpu_delay_ms+0x80>
   23a1a:	00081537          	lui	a0,0x81
   23a1e:	9fc50513          	add	a0,a0,-1540 # 809fc <__fast_load_addr__+0x56b3c>
   23a22:	bf51                	j	239b6 <clock_cpu_delay_ms+0x3c>

00023a24 <clock_update_core_clock>:
   23a24:	1141                	add	sp,sp,-16
   23a26:	c606                	sw	ra,12(sp)
   23a28:	c422                	sw	s0,8(sp)
   23a2a:	f14027f3          	csrr	a5,mhartid
   23a2e:	f40027b7          	lui	a5,0xf4002
   23a32:	8007a503          	lw	a0,-2048(a5) # f4001800 <__share_mem_end__+0xf2f41800>
   23a36:	8007a403          	lw	s0,-2048(a5)
   23a3a:	8121                	srl	a0,a0,0x8
   23a3c:	891d                	and	a0,a0,7
   23a3e:	0ff47413          	zext.b	s0,s0
   23a42:	317d                	jal	236f0 <get_frequency_for_source>
   23a44:	0405                	add	s0,s0,1
   23a46:	02855533          	divu	a0,a0,s0
   23a4a:	40b2                	lw	ra,12(sp)
   23a4c:	4422                	lw	s0,8(sp)
   23a4e:	9ca1ae23          	sw	a0,-1572(gp) # a01dc <hpm_core_clock>
   23a52:	0141                	add	sp,sp,16
   23a54:	8082                	ret

00023a56 <uart_default_config>:
   23a56:	67f1                	lui	a5,0x1c
   23a58:	20078793          	add	a5,a5,512 # 1c200 <__fw_size__+0x124f0>
   23a5c:	c1dc                	sw	a5,4(a1)
   23a5e:	30000793          	li	a5,768
   23a62:	c59c                	sw	a5,8(a1)
   23a64:	67c1                	lui	a5,0x10
   23a66:	c5dc                	sw	a5,12(a1)
   23a68:	47a9                	li	a5,10
   23a6a:	00059823          	sh	zero,16(a1) # b8010 <__noncacheable_bss_end__+0x10>
   23a6e:	00059a23          	sh	zero,20(a1)
   23a72:	0005ac23          	sw	zero,24(a1)
   23a76:	00f58e23          	sb	a5,28(a1)
   23a7a:	8082                	ret

00023a7c <uart_init>:
   23a7c:	02052223          	sw	zero,36(a0)
   23a80:	555c                	lw	a5,44(a0)
   23a82:	4198                	lw	a4,0(a1)
   23a84:	0807e793          	or	a5,a5,128
   23a88:	d55c                	sw	a5,44(a0)
   23a8a:	10070f63          	beqz	a4,23ba8 <uart_init+0x12c>
   23a8e:	41d0                	lw	a2,4(a1)
   23a90:	7139                	add	sp,sp,-64
   23a92:	dc22                	sw	s0,56(sp)
   23a94:	da26                	sw	s1,52(sp)
   23a96:	de06                	sw	ra,60(sp)
   23a98:	0c700793          	li	a5,199
   23a9c:	842a                	mv	s0,a0
   23a9e:	84ae                	mv	s1,a1
   23aa0:	3e900513          	li	a0,1001
   23aa4:	00c7e763          	bltu	a5,a2,23ab2 <uart_init+0x36>
   23aa8:	50f2                	lw	ra,60(sp)
   23aaa:	5462                	lw	s0,56(sp)
   23aac:	54d2                	lw	s1,52(sp)
   23aae:	6121                	add	sp,sp,64
   23ab0:	8082                	ret
   23ab2:	00361793          	sll	a5,a2,0x3
   23ab6:	fef769e3          	bltu	a4,a5,23aa8 <uart_init+0x2c>
   23aba:	67c1                	lui	a5,0x10
   23abc:	17fd                	add	a5,a5,-1 # ffff <__fw_size__+0x62ef>
   23abe:	02f757b3          	divu	a5,a4,a5
   23ac2:	00561693          	sll	a3,a2,0x5
   23ac6:	fef6e1e3          	bltu	a3,a5,23aa8 <uart_init+0x2c>
   23aca:	3e800513          	li	a0,1000
   23ace:	02a735b3          	mulhu	a1,a4,a0
   23ad2:	d84a                	sw	s2,48(sp)
   23ad4:	4681                	li	a3,0
   23ad6:	6905                	lui	s2,0x1
   23ad8:	d452                	sw	s4,40(sp)
   23ada:	d256                	sw	s5,36(sp)
   23adc:	d05a                	sw	s6,32(sp)
   23ade:	ce5e                	sw	s7,28(sp)
   23ae0:	cc62                	sw	s8,24(sp)
   23ae2:	ca66                	sw	s9,20(sp)
   23ae4:	02a70533          	mul	a0,a4,a0
   23ae8:	c86a                	sw	s10,16(sp)
   23aea:	c66e                	sw	s11,12(sp)
   23aec:	d64e                	sw	s3,44(sp)
   23aee:	fa090913          	add	s2,s2,-96 # fa0 <__eh_frame_hdr_end+0xfa0>
   23af2:	6d89                	lui	s11,0x2
   23af4:	6c41                	lui	s8,0x10
   23af6:	f40d8d93          	add	s11,s11,-192 # 1f40 <__eh_frame_hdr_end+0x1f40>
   23afa:	4b81                	li	s7,0
   23afc:	4d21                	li	s10,8
   23afe:	e7bfc0ef          	jal	20978 <__udivdi3>
   23b02:	992a                	add	s2,s2,a0
   23b04:	00a93b33          	sltu	s6,s2,a0
   23b08:	8a2a                	mv	s4,a0
   23b0a:	8aae                	mv	s5,a1
   23b0c:	9b2e                	add	s6,s6,a1
   23b0e:	1c79                	add	s8,s8,-2 # fffe <__fw_size__+0x62ee>
   23b10:	3e800c93          	li	s9,1000
   23b14:	86de                	mv	a3,s7
   23b16:	866e                	mv	a2,s11
   23b18:	854a                	mv	a0,s2
   23b1a:	85da                	mv	a1,s6
   23b1c:	e5dfc0ef          	jal	20978 <__udivdi3>
   23b20:	fff50693          	add	a3,a0,-1
   23b24:	89aa                	mv	s3,a0
   23b26:	16dc6a63          	bltu	s8,a3,23c9a <uart_init+0x21e>
   23b2a:	02ad0533          	mul	a0,s10,a0
   23b2e:	03950533          	mul	a0,a0,s9
   23b32:	1a0a9563          	bnez	s5,23cdc <uart_init+0x260>
   23b36:	1aaa7163          	bgeu	s4,a0,23cd8 <uart_init+0x25c>
   23b3a:	41450533          	sub	a0,a0,s4
   23b3e:	cd19                	beqz	a0,23b5c <uart_init+0xe0>
   23b40:	06400793          	li	a5,100
   23b44:	8652                	mv	a2,s4
   23b46:	86d6                	mv	a3,s5
   23b48:	4581                	li	a1,0
   23b4a:	02f50533          	mul	a0,a0,a5
   23b4e:	e2bfc0ef          	jal	20978 <__udivdi3>
   23b52:	14059463          	bnez	a1,23c9a <uart_init+0x21e>
   23b56:	468d                	li	a3,3
   23b58:	14a6e163          	bltu	a3,a0,23c9a <uart_init+0x21e>
   23b5c:	4858                	lw	a4,20(s0)
   23b5e:	fe0d0693          	add	a3,s10,-32
   23b62:	00d036b3          	snez	a3,a3
   23b66:	40d006b3          	neg	a3,a3
   23b6a:	00dd7d33          	and	s10,s10,a3
   23b6e:	9b01                	and	a4,a4,-32
   23b70:	01a767b3          	or	a5,a4,s10
   23b74:	c85c                	sw	a5,20(s0)
   23b76:	01099793          	sll	a5,s3,0x10
   23b7a:	83c1                	srl	a5,a5,0x10
   23b7c:	0ff9f993          	zext.b	s3,s3
   23b80:	03342023          	sw	s3,32(s0)
   23b84:	83a1                	srl	a5,a5,0x8
   23b86:	d05c                	sw	a5,36(s0)
   23b88:	5458                	lw	a4,44(s0)
   23b8a:	00a4c783          	lbu	a5,10(s1)
   23b8e:	4691                	li	a3,4
   23b90:	f4777713          	and	a4,a4,-185
   23b94:	14f6e763          	bltu	a3,a5,23ce2 <uart_init+0x266>
   23b98:	000296b7          	lui	a3,0x29
   23b9c:	078a                	sll	a5,a5,0x2
   23b9e:	7d868693          	add	a3,a3,2008 # 297d8 <__clz_tab+0x378>
   23ba2:	97b6                	add	a5,a5,a3
   23ba4:	439c                	lw	a5,0(a5)
   23ba6:	8782                	jr	a5
   23ba8:	3e900513          	li	a0,1001
   23bac:	8082                	ret
   23bae:	03876713          	or	a4,a4,56
   23bb2:	0084c783          	lbu	a5,8(s1)
   23bb6:	4685                	li	a3,1
   23bb8:	9b61                	and	a4,a4,-8
   23bba:	0cd78563          	beq	a5,a3,23c84 <uart_init+0x208>
   23bbe:	4689                	li	a3,2
   23bc0:	10d78563          	beq	a5,a3,23cca <uart_init+0x24e>
   23bc4:	4509                	li	a0,2
   23bc6:	ebc1                	bnez	a5,23c56 <uart_init+0x1da>
   23bc8:	0094c783          	lbu	a5,9(s1)
   23bcc:	8b8d                	and	a5,a5,3
   23bce:	8fd9                	or	a5,a5,a4
   23bd0:	d45c                	sw	a5,44(s0)
   23bd2:	4799                	li	a5,6
   23bd4:	d41c                	sw	a5,40(s0)
   23bd6:	00b4c583          	lbu	a1,11(s1)
   23bda:	00d4c783          	lbu	a5,13(s1)
   23bde:	00e4c803          	lbu	a6,14(s1)
   23be2:	00c4c603          	lbu	a2,12(s1)
   23be6:	00f4c703          	lbu	a4,15(s1)
   23bea:	0104c503          	lbu	a0,16(s1)
   23bee:	0114c683          	lbu	a3,17(s1)
   23bf2:	078e                	sll	a5,a5,0x3
   23bf4:	0592                	sll	a1,a1,0x4
   23bf6:	0305f593          	and	a1,a1,48
   23bfa:	0107e7b3          	or	a5,a5,a6
   23bfe:	061a                	sll	a2,a2,0x6
   23c00:	8fcd                	or	a5,a5,a1
   23c02:	0ff67613          	zext.b	a2,a2
   23c06:	8fd1                	or	a5,a5,a2
   23c08:	0716                	sll	a4,a4,0x5
   23c0a:	00451613          	sll	a2,a0,0x4
   23c0e:	0016c693          	xor	a3,a3,1
   23c12:	d41c                	sw	a5,40(s0)
   23c14:	8f51                	or	a4,a4,a2
   23c16:	0686                	sll	a3,a3,0x1
   23c18:	dc5c                	sw	a5,60(s0)
   23c1a:	00d767b3          	or	a5,a4,a3
   23c1e:	d81c                	sw	a5,48(s0)
   23c20:	4050                	lw	a2,4(s0)
   23c22:	0144c703          	lbu	a4,20(s1)
   23c26:	4c9c                	lw	a5,24(s1)
   23c28:	c0067613          	and	a2,a2,-1024
   23c2c:	01c4c683          	lbu	a3,28(s1)
   23c30:	0154c583          	lbu	a1,21(s1)
   23c34:	c050                	sw	a2,4(s0)
   23c36:	4050                	lw	a2,4(s0)
   23c38:	07a6                	sll	a5,a5,0x9
   23c3a:	2007f793          	and	a5,a5,512
   23c3e:	8ed1                	or	a3,a3,a2
   23c40:	8fd5                	or	a5,a5,a3
   23c42:	0722                	sll	a4,a4,0x8
   23c44:	8fd9                	or	a5,a5,a4
   23c46:	c05c                	sw	a5,4(s0)
   23c48:	505c                	lw	a5,36(s0)
   23c4a:	cda5                	beqz	a1,23cc2 <uart_init+0x246>
   23c4c:	80000737          	lui	a4,0x80000
   23c50:	8fd9                	or	a5,a5,a4
   23c52:	d05c                	sw	a5,36(s0)
   23c54:	4501                	li	a0,0
   23c56:	50f2                	lw	ra,60(sp)
   23c58:	5462                	lw	s0,56(sp)
   23c5a:	5942                	lw	s2,48(sp)
   23c5c:	59b2                	lw	s3,44(sp)
   23c5e:	5a22                	lw	s4,40(sp)
   23c60:	5a92                	lw	s5,36(sp)
   23c62:	5b02                	lw	s6,32(sp)
   23c64:	4bf2                	lw	s7,28(sp)
   23c66:	4c62                	lw	s8,24(sp)
   23c68:	4cd2                	lw	s9,20(sp)
   23c6a:	4d42                	lw	s10,16(sp)
   23c6c:	4db2                	lw	s11,12(sp)
   23c6e:	54d2                	lw	s1,52(sp)
   23c70:	6121                	add	sp,sp,64
   23c72:	8082                	ret
   23c74:	0084c783          	lbu	a5,8(s1)
   23c78:	02876713          	or	a4,a4,40
   23c7c:	4685                	li	a3,1
   23c7e:	9b61                	and	a4,a4,-8
   23c80:	f2d79fe3          	bne	a5,a3,23bbe <uart_init+0x142>
   23c84:	0094c783          	lbu	a5,9(s1)
   23c88:	00476713          	or	a4,a4,4
   23c8c:	b781                	j	23bcc <uart_init+0x150>
   23c8e:	01876713          	or	a4,a4,24
   23c92:	b705                	j	23bb2 <uart_init+0x136>
   23c94:	00876713          	or	a4,a4,8
   23c98:	bf29                	j	23bb2 <uart_init+0x136>
   23c9a:	3e890613          	add	a2,s2,1000
   23c9e:	7d0d8693          	add	a3,s11,2000
   23ca2:	01263533          	sltu	a0,a2,s2
   23ca6:	01b6b5b3          	sltu	a1,a3,s11
   23caa:	0d09                	add	s10,s10,2
   23cac:	02200793          	li	a5,34
   23cb0:	8932                	mv	s2,a2
   23cb2:	9b2a                	add	s6,s6,a0
   23cb4:	8db6                	mv	s11,a3
   23cb6:	9bae                	add	s7,s7,a1
   23cb8:	e4fd1ee3          	bne	s10,a5,23b14 <uart_init+0x98>
   23cbc:	3e900513          	li	a0,1001
   23cc0:	bf59                	j	23c56 <uart_init+0x1da>
   23cc2:	0786                	sll	a5,a5,0x1
   23cc4:	8385                	srl	a5,a5,0x1
   23cc6:	d05c                	sw	a5,36(s0)
   23cc8:	b771                	j	23c54 <uart_init+0x1d8>
   23cca:	0094c783          	lbu	a5,9(s1)
   23cce:	4509                	li	a0,2
   23cd0:	d3d9                	beqz	a5,23c56 <uart_init+0x1da>
   23cd2:	00476713          	or	a4,a4,4
   23cd6:	bddd                	j	23bcc <uart_init+0x150>
   23cd8:	e94572e3          	bgeu	a0,s4,23b5c <uart_init+0xe0>
   23cdc:	40aa0533          	sub	a0,s4,a0
   23ce0:	bdb9                	j	23b3e <uart_init+0xc2>
   23ce2:	4509                	li	a0,2
   23ce4:	bf8d                	j	23c56 <uart_init+0x1da>

00023ce6 <uart_send_byte>:
   23ce6:	5958                	lw	a4,52(a0)
   23ce8:	6685                	lui	a3,0x1
   23cea:	38968693          	add	a3,a3,905 # 1389 <__eh_frame_hdr_end+0x1389>
   23cee:	02077713          	and	a4,a4,32
   23cf2:	c701                	beqz	a4,23cfa <uart_send_byte+0x14>
   23cf4:	a829                	j	23d0e <uart_send_byte+0x28>
   23cf6:	00d70f63          	beq	a4,a3,23d14 <uart_send_byte+0x2e>
   23cfa:	595c                	lw	a5,52(a0)
   23cfc:	0705                	add	a4,a4,1 # 80000001 <__share_mem_end__+0x7ef40001>
   23cfe:	0207f793          	and	a5,a5,32
   23d02:	dbf5                	beqz	a5,23cf6 <uart_send_byte+0x10>
   23d04:	6785                	lui	a5,0x1
   23d06:	38978793          	add	a5,a5,905 # 1389 <__eh_frame_hdr_end+0x1389>
   23d0a:	00f70563          	beq	a4,a5,23d14 <uart_send_byte+0x2e>
   23d0e:	d10c                	sw	a1,32(a0)
   23d10:	4501                	li	a0,0
   23d12:	8082                	ret
   23d14:	450d                	li	a0,3
   23d16:	8082                	ret

00023d18 <uart_flush>:
   23d18:	86aa                	mv	a3,a0
   23d1a:	5948                	lw	a0,52(a0)
   23d1c:	6605                	lui	a2,0x1
   23d1e:	4701                	li	a4,0
   23d20:	04057513          	and	a0,a0,64
   23d24:	38960613          	add	a2,a2,905 # 1389 <__eh_frame_hdr_end+0x1389>
   23d28:	c501                	beqz	a0,23d30 <uart_flush+0x18>
   23d2a:	a005                	j	23d4a <uart_flush+0x32>
   23d2c:	00c70d63          	beq	a4,a2,23d46 <uart_flush+0x2e>
   23d30:	5adc                	lw	a5,52(a3)
   23d32:	0705                	add	a4,a4,1
   23d34:	0407f793          	and	a5,a5,64
   23d38:	dbf5                	beqz	a5,23d2c <uart_flush+0x14>
   23d3a:	6785                	lui	a5,0x1
   23d3c:	38978793          	add	a5,a5,905 # 1389 <__eh_frame_hdr_end+0x1389>
   23d40:	00f70363          	beq	a4,a5,23d46 <uart_flush+0x2e>
   23d44:	8082                	ret
   23d46:	450d                	li	a0,3
   23d48:	8082                	ret
   23d4a:	4501                	li	a0,0
   23d4c:	8082                	ret

00023d4e <uart_receive_byte>:
   23d4e:	5958                	lw	a4,52(a0)
   23d50:	6685                	lui	a3,0x1
   23d52:	38968693          	add	a3,a3,905 # 1389 <__eh_frame_hdr_end+0x1389>
   23d56:	8b05                	and	a4,a4,1
   23d58:	c701                	beqz	a4,23d60 <uart_receive_byte+0x12>
   23d5a:	a821                	j	23d72 <uart_receive_byte+0x24>
   23d5c:	02d70063          	beq	a4,a3,23d7c <uart_receive_byte+0x2e>
   23d60:	595c                	lw	a5,52(a0)
   23d62:	0705                	add	a4,a4,1
   23d64:	8b85                	and	a5,a5,1
   23d66:	dbfd                	beqz	a5,23d5c <uart_receive_byte+0xe>
   23d68:	6785                	lui	a5,0x1
   23d6a:	38978793          	add	a5,a5,905 # 1389 <__eh_frame_hdr_end+0x1389>
   23d6e:	00f70763          	beq	a4,a5,23d7c <uart_receive_byte+0x2e>
   23d72:	511c                	lw	a5,32(a0)
   23d74:	4501                	li	a0,0
   23d76:	00f58023          	sb	a5,0(a1)
   23d7a:	8082                	ret
   23d7c:	450d                	li	a0,3
   23d7e:	8082                	ret

00023d80 <write_pma_addr>:
   23d80:	47bd                	li	a5,15
   23d82:	00b7ec63          	bltu	a5,a1,23d9a <write_pma_addr+0x1a>
   23d86:	000297b7          	lui	a5,0x29
   23d8a:	7ec78793          	add	a5,a5,2028 # 297ec <__clz_tab+0x38c>
   23d8e:	058a                	sll	a1,a1,0x2
   23d90:	95be                	add	a1,a1,a5
   23d92:	419c                	lw	a5,0(a1)
   23d94:	8782                	jr	a5
   23d96:	bdf51073          	csrw	0xbdf,a0
   23d9a:	8082                	ret
   23d9c:	bde51073          	csrw	0xbde,a0
   23da0:	8082                	ret
   23da2:	bd051073          	csrw	0xbd0,a0
   23da6:	8082                	ret
   23da8:	bd151073          	csrw	0xbd1,a0
   23dac:	8082                	ret
   23dae:	bd251073          	csrw	0xbd2,a0
   23db2:	8082                	ret
   23db4:	bd351073          	csrw	0xbd3,a0
   23db8:	8082                	ret
   23dba:	bd451073          	csrw	0xbd4,a0
   23dbe:	8082                	ret
   23dc0:	bd551073          	csrw	0xbd5,a0
   23dc4:	8082                	ret
   23dc6:	bd651073          	csrw	0xbd6,a0
   23dca:	8082                	ret
   23dcc:	bd751073          	csrw	0xbd7,a0
   23dd0:	8082                	ret
   23dd2:	bd851073          	csrw	0xbd8,a0
   23dd6:	8082                	ret
   23dd8:	bd951073          	csrw	0xbd9,a0
   23ddc:	8082                	ret
   23dde:	bda51073          	csrw	0xbda,a0
   23de2:	8082                	ret
   23de4:	bdb51073          	csrw	0xbdb,a0
   23de8:	8082                	ret
   23dea:	bdc51073          	csrw	0xbdc,a0
   23dee:	8082                	ret
   23df0:	bdd51073          	csrw	0xbdd,a0
   23df4:	8082                	ret

00023df6 <pmp_config>:
   23df6:	1101                	add	sp,sp,-32
   23df8:	ce06                	sw	ra,28(sp)
   23dfa:	ca26                	sw	s1,20(sp)
   23dfc:	cd41                	beqz	a0,23e94 <pmp_config+0x9e>
   23dfe:	c84a                	sw	s2,16(sp)
   23e00:	fff58793          	add	a5,a1,-1
   23e04:	473d                	li	a4,15
   23e06:	892e                	mv	s2,a1
   23e08:	4489                	li	s1,2
   23e0a:	06f76963          	bltu	a4,a5,23e7c <pmp_config+0x86>
   23e0e:	cc22                	sw	s0,24(sp)
   23e10:	c64e                	sw	s3,12(sp)
   23e12:	c452                	sw	s4,8(sp)
   23e14:	c256                	sw	s5,4(sp)
   23e16:	842a                	mv	s0,a0
   23e18:	4981                	li	s3,0
   23e1a:	4a09                	li	s4,2
   23e1c:	0ff00a93          	li	s5,255
   23e20:	00399793          	sll	a5,s3,0x3
   23e24:	0029d713          	srl	a4,s3,0x2
   23e28:	8be1                	and	a5,a5,24
   23e2a:	07470263          	beq	a4,s4,23e8e <pmp_config+0x98>
   23e2e:	468d                	li	a3,3
   23e30:	06d70863          	beq	a4,a3,23ea0 <pmp_config+0xaa>
   23e34:	4685                	li	a3,1
   23e36:	04d71963          	bne	a4,a3,23e88 <pmp_config+0x92>
   23e3a:	3a1026f3          	csrr	a3,pmpcfg1
   23e3e:	00fa9633          	sll	a2,s5,a5
   23e42:	00d674b3          	and	s1,a2,a3
   23e46:	00f4d4b3          	srl	s1,s1,a5
   23e4a:	0804f493          	and	s1,s1,128
   23e4e:	12049a63          	bnez	s1,23f82 <pmp_config+0x18c>
   23e52:	00044703          	lbu	a4,0(s0)
   23e56:	fff64593          	not	a1,a2
   23e5a:	8eed                	and	a3,a3,a1
   23e5c:	00f71733          	sll	a4,a4,a5
   23e60:	463d                	li	a2,15
   23e62:	4048                	lw	a0,4(s0)
   23e64:	8ed9                	or	a3,a3,a4
   23e66:	11366b63          	bltu	a2,s3,23f7c <pmp_config+0x186>
   23e6a:	0002a637          	lui	a2,0x2a
   23e6e:	00299713          	sll	a4,s3,0x2
   23e72:	82c60613          	add	a2,a2,-2004 # 2982c <__clz_tab+0x3cc>
   23e76:	9732                	add	a4,a4,a2
   23e78:	4318                	lw	a4,0(a4)
   23e7a:	8702                	jr	a4
   23e7c:	4942                	lw	s2,16(sp)
   23e7e:	40f2                	lw	ra,28(sp)
   23e80:	8526                	mv	a0,s1
   23e82:	44d2                	lw	s1,20(sp)
   23e84:	6105                	add	sp,sp,32
   23e86:	8082                	ret
   23e88:	3a0026f3          	csrr	a3,pmpcfg0
   23e8c:	bf4d                	j	23e3e <pmp_config+0x48>
   23e8e:	3a2026f3          	csrr	a3,pmpcfg2
   23e92:	b775                	j	23e3e <pmp_config+0x48>
   23e94:	40f2                	lw	ra,28(sp)
   23e96:	4489                	li	s1,2
   23e98:	8526                	mv	a0,s1
   23e9a:	44d2                	lw	s1,20(sp)
   23e9c:	6105                	add	sp,sp,32
   23e9e:	8082                	ret
   23ea0:	3a3026f3          	csrr	a3,pmpcfg3
   23ea4:	bf69                	j	23e3e <pmp_config+0x48>
   23ea6:	3be51073          	csrw	pmpaddr14,a0
   23eaa:	3a369073          	csrw	pmpcfg3,a3
   23eae:	bc302773          	csrr	a4,0xbc3
   23eb2:	00844683          	lbu	a3,8(s0)
   23eb6:	8f6d                	and	a4,a4,a1
   23eb8:	00f697b3          	sll	a5,a3,a5
   23ebc:	8fd9                	or	a5,a5,a4
   23ebe:	bc379073          	csrw	0xbc3,a5
   23ec2:	4448                	lw	a0,12(s0)
   23ec4:	85ce                	mv	a1,s3
   23ec6:	0985                	add	s3,s3,1
   23ec8:	3d65                	jal	23d80 <write_pma_addr>
   23eca:	0441                	add	s0,s0,16
   23ecc:	f5391ae3          	bne	s2,s3,23e20 <pmp_config+0x2a>
   23ed0:	0000100f          	fence.i
   23ed4:	4462                	lw	s0,24(sp)
   23ed6:	4942                	lw	s2,16(sp)
   23ed8:	49b2                	lw	s3,12(sp)
   23eda:	4a22                	lw	s4,8(sp)
   23edc:	4a92                	lw	s5,4(sp)
   23ede:	b745                	j	23e7e <pmp_config+0x88>
   23ee0:	3bd51073          	csrw	pmpaddr13,a0
   23ee4:	b7d9                	j	23eaa <pmp_config+0xb4>
   23ee6:	3bc51073          	csrw	pmpaddr12,a0
   23eea:	b7c1                	j	23eaa <pmp_config+0xb4>
   23eec:	3bb51073          	csrw	pmpaddr11,a0
   23ef0:	3a269073          	csrw	pmpcfg2,a3
   23ef4:	bc2026f3          	csrr	a3,0xbc2
   23ef8:	00844703          	lbu	a4,8(s0)
   23efc:	8eed                	and	a3,a3,a1
   23efe:	00f717b3          	sll	a5,a4,a5
   23f02:	8fd5                	or	a5,a5,a3
   23f04:	bc279073          	csrw	0xbc2,a5
   23f08:	bf6d                	j	23ec2 <pmp_config+0xcc>
   23f0a:	3ba51073          	csrw	pmpaddr10,a0
   23f0e:	b7cd                	j	23ef0 <pmp_config+0xfa>
   23f10:	3b951073          	csrw	pmpaddr9,a0
   23f14:	bff1                	j	23ef0 <pmp_config+0xfa>
   23f16:	3b851073          	csrw	pmpaddr8,a0
   23f1a:	bfd9                	j	23ef0 <pmp_config+0xfa>
   23f1c:	3b751073          	csrw	pmpaddr7,a0
   23f20:	3a169073          	csrw	pmpcfg1,a3
   23f24:	bc1026f3          	csrr	a3,0xbc1
   23f28:	00844703          	lbu	a4,8(s0)
   23f2c:	8eed                	and	a3,a3,a1
   23f2e:	00f717b3          	sll	a5,a4,a5
   23f32:	8fd5                	or	a5,a5,a3
   23f34:	bc179073          	csrw	0xbc1,a5
   23f38:	b769                	j	23ec2 <pmp_config+0xcc>
   23f3a:	3b651073          	csrw	pmpaddr6,a0
   23f3e:	b7cd                	j	23f20 <pmp_config+0x12a>
   23f40:	3b551073          	csrw	pmpaddr5,a0
   23f44:	bff1                	j	23f20 <pmp_config+0x12a>
   23f46:	3b451073          	csrw	pmpaddr4,a0
   23f4a:	bfd9                	j	23f20 <pmp_config+0x12a>
   23f4c:	3b351073          	csrw	pmpaddr3,a0
   23f50:	3a069073          	csrw	pmpcfg0,a3
   23f54:	bc0026f3          	csrr	a3,0xbc0
   23f58:	00844703          	lbu	a4,8(s0)
   23f5c:	8eed                	and	a3,a3,a1
   23f5e:	00f717b3          	sll	a5,a4,a5
   23f62:	8fd5                	or	a5,a5,a3
   23f64:	bc079073          	csrw	0xbc0,a5
   23f68:	bfa9                	j	23ec2 <pmp_config+0xcc>
   23f6a:	3b251073          	csrw	pmpaddr2,a0
   23f6e:	b7cd                	j	23f50 <pmp_config+0x15a>
   23f70:	3b151073          	csrw	pmpaddr1,a0
   23f74:	bff1                	j	23f50 <pmp_config+0x15a>
   23f76:	3bf51073          	csrw	pmpaddr15,a0
   23f7a:	bf05                	j	23eaa <pmp_config+0xb4>
   23f7c:	3b051073          	csrw	pmpaddr0,a0
   23f80:	bfc1                	j	23f50 <pmp_config+0x15a>
   23f82:	4485                	li	s1,1
   23f84:	bf81                	j	23ed4 <pmp_config+0xde>

00023f86 <pllctlv2_get_pll_postdiv_freq_in_hz>:
   23f86:	87aa                	mv	a5,a0
   23f88:	c551                	beqz	a0,24014 <pllctlv2_get_pll_postdiv_freq_in_hz+0x8e>
   23f8a:	4709                	li	a4,2
   23f8c:	4501                	li	a0,0
   23f8e:	00b77363          	bgeu	a4,a1,23f94 <pllctlv2_get_pll_postdiv_freq_in_hz+0xe>
   23f92:	8082                	ret
   23f94:	00559713          	sll	a4,a1,0x5
   23f98:	9732                	add	a4,a4,a2
   23f9a:	03070713          	add	a4,a4,48
   23f9e:	070a                	sll	a4,a4,0x2
   23fa0:	059e                	sll	a1,a1,0x7
   23fa2:	95be                	add	a1,a1,a5
   23fa4:	97ba                	add	a5,a5,a4
   23fa6:	439c                	lw	a5,0(a5)
   23fa8:	0805a803          	lw	a6,128(a1)
   23fac:	0845a683          	lw	a3,132(a1)
   23fb0:	40000637          	lui	a2,0x40000
   23fb4:	0885a583          	lw	a1,136(a1)
   23fb8:	167d                	add	a2,a2,-1 # 3fffffff <__share_mem_end__+0x3ef3ffff>
   23fba:	0aaab537          	lui	a0,0xaaab
   23fbe:	8ef1                	and	a3,a3,a2
   23fc0:	aa950513          	add	a0,a0,-1367 # aaaaaa9 <__share_mem_end__+0x99eaaa9>
   23fc4:	03f7f713          	and	a4,a5,63
   23fc8:	07f87813          	and	a6,a6,127
   23fcc:	8df1                	and	a1,a1,a2
   23fce:	04d56563          	bltu	a0,a3,24018 <pllctlv2_get_pll_postdiv_freq_in_hz+0x92>
   23fd2:	000f47b7          	lui	a5,0xf4
   23fd6:	24078793          	add	a5,a5,576 # f4240 <__noncacheable_end__+0x34240>
   23fda:	02f5d5b3          	divu	a1,a1,a5
   23fde:	00169513          	sll	a0,a3,0x1
   23fe2:	9536                	add	a0,a0,a3
   23fe4:	050e                	sll	a0,a0,0x3
   23fe6:	016e37b7          	lui	a5,0x16e3
   23fea:	60078793          	add	a5,a5,1536 # 16e3600 <__share_mem_end__+0x623600>
   23fee:	06400693          	li	a3,100
   23ff2:	02b55533          	divu	a0,a0,a1
   23ff6:	02f807b3          	mul	a5,a6,a5
   23ffa:	953e                	add	a0,a0,a5
   23ffc:	02d707b3          	mul	a5,a4,a3
   24000:	4715                	li	a4,5
   24002:	02e7d7b3          	divu	a5,a5,a4
   24006:	06478793          	add	a5,a5,100
   2400a:	02f55533          	divu	a0,a0,a5
   2400e:	02d50533          	mul	a0,a0,a3
   24012:	8082                	ret
   24014:	4501                	li	a0,0
   24016:	8082                	ret
   24018:	000f4537          	lui	a0,0xf4
   2401c:	0aaab637          	lui	a2,0xaaab
   24020:	24050513          	add	a0,a0,576 # f4240 <__noncacheable_end__+0x34240>
   24024:	aaa60613          	add	a2,a2,-1366 # aaaaaaa <__share_mem_end__+0x99eaaaa>
   24028:	02a5d5b3          	divu	a1,a1,a0
   2402c:	87b6                	mv	a5,a3
   2402e:	04c68863          	beq	a3,a2,2407e <pllctlv2_get_pll_postdiv_freq_in_hz+0xf8>
   24032:	8385                	srl	a5,a5,0x1
   24034:	fef66fe3          	bltu	a2,a5,24032 <pllctlv2_get_pll_postdiv_freq_in_hz+0xac>
   24038:	8e9d                	sub	a3,a3,a5
   2403a:	00169613          	sll	a2,a3,0x1
   2403e:	96b2                	add	a3,a3,a2
   24040:	068e                	sll	a3,a3,0x3
   24042:	02b6d6b3          	divu	a3,a3,a1
   24046:	00179513          	sll	a0,a5,0x1
   2404a:	953e                	add	a0,a0,a5
   2404c:	016e37b7          	lui	a5,0x16e3
   24050:	60078793          	add	a5,a5,1536 # 16e3600 <__share_mem_end__+0x623600>
   24054:	050e                	sll	a0,a0,0x3
   24056:	02f80833          	mul	a6,a6,a5
   2405a:	9836                	add	a6,a6,a3
   2405c:	06400693          	li	a3,100
   24060:	02d707b3          	mul	a5,a4,a3
   24064:	4715                	li	a4,5
   24066:	02b55533          	divu	a0,a0,a1
   2406a:	02e7d7b3          	divu	a5,a5,a4
   2406e:	9542                	add	a0,a0,a6
   24070:	06478793          	add	a5,a5,100
   24074:	02f55533          	divu	a0,a0,a5
   24078:	02d50533          	mul	a0,a0,a3
   2407c:	8082                	ret
   2407e:	4681                	li	a3,0
   24080:	b7d9                	j	24046 <pllctlv2_get_pll_postdiv_freq_in_hz+0xc0>

00024082 <_sbrk>:
   24082:	9e01a783          	lw	a5,-1568(gp) # a01e0 <heap_end.0>
   24086:	c795                	beqz	a5,240b2 <_sbrk+0x30>
   24088:	000a4737          	lui	a4,0xa4
   2408c:	953e                	add	a0,a0,a5
   2408e:	1f870713          	add	a4,a4,504 # a41f8 <__heap_end__>
   24092:	00a76663          	bltu	a4,a0,2409e <_sbrk+0x1c>
   24096:	9ea1a023          	sw	a0,-1568(gp) # a01e0 <heap_end.0>
   2409a:	853e                	mv	a0,a5
   2409c:	8082                	ret
   2409e:	1141                	add	sp,sp,-16
   240a0:	c606                	sw	ra,12(sp)
   240a2:	2235                	jal	241ce <__errno>
   240a4:	40b2                	lw	ra,12(sp)
   240a6:	47b1                	li	a5,12
   240a8:	c11c                	sw	a5,0(a0)
   240aa:	57fd                	li	a5,-1
   240ac:	853e                	mv	a0,a5
   240ae:	0141                	add	sp,sp,16
   240b0:	8082                	ret
   240b2:	9f818713          	add	a4,gp,-1544 # a01f8 <__bss_end__>
   240b6:	9ee1a023          	sw	a4,-1568(gp) # a01e0 <heap_end.0>
   240ba:	9f818793          	add	a5,gp,-1544 # a01f8 <__bss_end__>
   240be:	b7e9                	j	24088 <_sbrk+0x6>

000240c0 <console_init>:
   240c0:	7179                	add	sp,sp,-48
   240c2:	d226                	sw	s1,36(sp)
   240c4:	9cc1a783          	lw	a5,-1588(gp) # a01cc <_impure_ptr>
   240c8:	d422                	sw	s0,40(sp)
   240ca:	842a                	mv	s0,a0
   240cc:	43c8                	lw	a0,4(a5)
   240ce:	4681                	li	a3,0
   240d0:	4609                	li	a2,2
   240d2:	4581                	li	a1,0
   240d4:	d606                	sw	ra,44(sp)
   240d6:	767000ef          	jal	2503c <setvbuf>
   240da:	9cc1a783          	lw	a5,-1588(gp) # a01cc <_impure_ptr>
   240de:	4681                	li	a3,0
   240e0:	4609                	li	a2,2
   240e2:	4788                	lw	a0,8(a5)
   240e4:	4581                	li	a1,0
   240e6:	757000ef          	jal	2503c <setvbuf>
   240ea:	401c                	lw	a5,0(s0)
   240ec:	4505                	li	a0,1
   240ee:	c791                	beqz	a5,240fa <console_init+0x3a>
   240f0:	50b2                	lw	ra,44(sp)
   240f2:	5422                	lw	s0,40(sp)
   240f4:	5492                	lw	s1,36(sp)
   240f6:	6145                	add	sp,sp,48
   240f8:	8082                	ret
   240fa:	4048                	lw	a0,4(s0)
   240fc:	858a                	mv	a1,sp
   240fe:	c002                	sw	zero,0(sp)
   24100:	c202                	sw	zero,4(sp)
   24102:	c402                	sw	zero,8(sp)
   24104:	c602                	sw	zero,12(sp)
   24106:	c802                	sw	zero,16(sp)
   24108:	ca02                	sw	zero,20(sp)
   2410a:	cc02                	sw	zero,24(sp)
   2410c:	ce02                	sw	zero,28(sp)
   2410e:	949ff0ef          	jal	23a56 <uart_default_config>
   24112:	445c                	lw	a5,12(s0)
   24114:	4418                	lw	a4,8(s0)
   24116:	4048                	lw	a0,4(s0)
   24118:	858a                	mv	a1,sp
   2411a:	c03a                	sw	a4,0(sp)
   2411c:	c23e                	sw	a5,4(sp)
   2411e:	95fff0ef          	jal	23a7c <uart_init>
   24122:	f579                	bnez	a0,240f0 <console_init+0x30>
   24124:	4058                	lw	a4,4(s0)
   24126:	50b2                	lw	ra,44(sp)
   24128:	5422                	lw	s0,40(sp)
   2412a:	9ee1a223          	sw	a4,-1564(gp) # a01e4 <g_console_uart>
   2412e:	5492                	lw	s1,36(sp)
   24130:	6145                	add	sp,sp,48
   24132:	8082                	ret

00024134 <_write>:
   24134:	1101                	add	sp,sp,-32
   24136:	ce06                	sw	ra,28(sp)
   24138:	ca26                	sw	s1,20(sp)
   2413a:	c452                	sw	s4,8(sp)
   2413c:	06c05363          	blez	a2,241a2 <_write+0x6e>
   24140:	cc22                	sw	s0,24(sp)
   24142:	c84a                	sw	s2,16(sp)
   24144:	c64e                	sw	s3,12(sp)
   24146:	8a32                	mv	s4,a2
   24148:	842e                	mv	s0,a1
   2414a:	00c589b3          	add	s3,a1,a2
   2414e:	4929                	li	s2,10
   24150:	00044583          	lbu	a1,0(s0)
   24154:	03258c63          	beq	a1,s2,2418c <_write+0x58>
   24158:	9e41a503          	lw	a0,-1564(gp) # a01e4 <g_console_uart>
   2415c:	3669                	jal	23ce6 <uart_send_byte>
   2415e:	c519                	beqz	a0,2416c <_write+0x38>
   24160:	00044583          	lbu	a1,0(s0)
   24164:	9e41a503          	lw	a0,-1564(gp) # a01e4 <g_console_uart>
   24168:	3ebd                	jal	23ce6 <uart_send_byte>
   2416a:	f97d                	bnez	a0,24160 <_write+0x2c>
   2416c:	0405                	add	s0,s0,1
   2416e:	ff3411e3          	bne	s0,s3,24150 <_write+0x1c>
   24172:	4462                	lw	s0,24(sp)
   24174:	4942                	lw	s2,16(sp)
   24176:	49b2                	lw	s3,12(sp)
   24178:	9e41a503          	lw	a0,-1564(gp) # a01e4 <g_console_uart>
   2417c:	3e71                	jal	23d18 <uart_flush>
   2417e:	fd6d                	bnez	a0,24178 <_write+0x44>
   24180:	40f2                	lw	ra,28(sp)
   24182:	44d2                	lw	s1,20(sp)
   24184:	8552                	mv	a0,s4
   24186:	4a22                	lw	s4,8(sp)
   24188:	6105                	add	sp,sp,32
   2418a:	8082                	ret
   2418c:	9e41a503          	lw	a0,-1564(gp) # a01e4 <g_console_uart>
   24190:	45b5                	li	a1,13
   24192:	3e91                	jal	23ce6 <uart_send_byte>
   24194:	d571                	beqz	a0,24160 <_write+0x2c>
   24196:	9e41a503          	lw	a0,-1564(gp) # a01e4 <g_console_uart>
   2419a:	45b5                	li	a1,13
   2419c:	36a9                	jal	23ce6 <uart_send_byte>
   2419e:	f57d                	bnez	a0,2418c <_write+0x58>
   241a0:	b7c1                	j	24160 <_write+0x2c>
   241a2:	4a01                	li	s4,0
   241a4:	bfd1                	j	24178 <_write+0x44>

000241a6 <_read>:
   241a6:	1141                	add	sp,sp,-16
   241a8:	c422                	sw	s0,8(sp)
   241aa:	c226                	sw	s1,4(sp)
   241ac:	c606                	sw	ra,12(sp)
   241ae:	842e                	mv	s0,a1
   241b0:	9e41a503          	lw	a0,-1564(gp) # a01e4 <g_console_uart>
   241b4:	85a2                	mv	a1,s0
   241b6:	3e61                	jal	23d4e <uart_receive_byte>
   241b8:	fd65                	bnez	a0,241b0 <_read+0xa>
   241ba:	40b2                	lw	ra,12(sp)
   241bc:	4422                	lw	s0,8(sp)
   241be:	4492                	lw	s1,4(sp)
   241c0:	4505                	li	a0,1
   241c2:	0141                	add	sp,sp,16
   241c4:	8082                	ret

000241c6 <_fstat>:
   241c6:	6789                	lui	a5,0x2
   241c8:	c1dc                	sw	a5,4(a1)
   241ca:	4501                	li	a0,0
   241cc:	8082                	ret

000241ce <__errno>:
   241ce:	9cc1a503          	lw	a0,-1588(gp) # a01cc <_impure_ptr>
   241d2:	8082                	ret

000241d4 <__cvt>:
   241d4:	7179                	add	sp,sp,-48
   241d6:	d422                	sw	s0,40(sp)
   241d8:	d226                	sw	s1,36(sp)
   241da:	cc52                	sw	s4,24(sp)
   241dc:	ca56                	sw	s5,20(sp)
   241de:	c85a                	sw	s6,16(sp)
   241e0:	d606                	sw	ra,44(sp)
   241e2:	d04a                	sw	s2,32(sp)
   241e4:	ce4e                	sw	s3,28(sp)
   241e6:	8a3a                	mv	s4,a4
   241e8:	8aae                	mv	s5,a1
   241ea:	8432                	mv	s0,a2
   241ec:	84b6                	mv	s1,a3
   241ee:	8b42                	mv	s6,a6
   241f0:	4701                	li	a4,0
   241f2:	00065863          	bgez	a2,24202 <__cvt+0x2e>
   241f6:	80000737          	lui	a4,0x80000
   241fa:	00c74433          	xor	s0,a4,a2
   241fe:	02d00713          	li	a4,45
   24202:	00e78023          	sb	a4,0(a5) # 2000 <__eh_frame_hdr_end+0x2000>
   24206:	fdf8f913          	and	s2,a7,-33
   2420a:	04600793          	li	a5,70
   2420e:	468d                	li	a3,3
   24210:	00f90863          	beq	s2,a5,24220 <__cvt+0x4c>
   24214:	04500793          	li	a5,69
   24218:	4689                	li	a3,2
   2421a:	00f91363          	bne	s2,a5,24220 <__cvt+0x4c>
   2421e:	0485                	add	s1,s1,1
   24220:	87da                	mv	a5,s6
   24222:	00c10893          	add	a7,sp,12
   24226:	00810813          	add	a6,sp,8
   2422a:	8726                	mv	a4,s1
   2422c:	85d6                	mv	a1,s5
   2422e:	8622                	mv	a2,s0
   24230:	759010ef          	jal	26188 <_dtoa_r>
   24234:	04700793          	li	a5,71
   24238:	89aa                	mv	s3,a0
   2423a:	04f91563          	bne	s2,a5,24284 <__cvt+0xb0>
   2423e:	001a7a13          	and	s4,s4,1
   24242:	020a0163          	beqz	s4,24264 <__cvt+0x90>
   24246:	00950a33          	add	s4,a0,s1
   2424a:	4601                	li	a2,0
   2424c:	4681                	li	a3,0
   2424e:	8556                	mv	a0,s5
   24250:	85a2                	mv	a1,s0
   24252:	98afe0ef          	jal	223dc <__eqdf2>
   24256:	e111                	bnez	a0,2425a <__cvt+0x86>
   24258:	c652                	sw	s4,12(sp)
   2425a:	03000713          	li	a4,48
   2425e:	47b2                	lw	a5,12(sp)
   24260:	0547ed63          	bltu	a5,s4,242ba <__cvt+0xe6>
   24264:	47b2                	lw	a5,12(sp)
   24266:	5742                	lw	a4,48(sp)
   24268:	50b2                	lw	ra,44(sp)
   2426a:	5422                	lw	s0,40(sp)
   2426c:	413787b3          	sub	a5,a5,s3
   24270:	c31c                	sw	a5,0(a4)
   24272:	5492                	lw	s1,36(sp)
   24274:	5902                	lw	s2,32(sp)
   24276:	4a62                	lw	s4,24(sp)
   24278:	4ad2                	lw	s5,20(sp)
   2427a:	4b42                	lw	s6,16(sp)
   2427c:	854e                	mv	a0,s3
   2427e:	49f2                	lw	s3,28(sp)
   24280:	6145                	add	sp,sp,48
   24282:	8082                	ret
   24284:	04600793          	li	a5,70
   24288:	00950a33          	add	s4,a0,s1
   2428c:	faf91fe3          	bne	s2,a5,2424a <__cvt+0x76>
   24290:	00054703          	lbu	a4,0(a0)
   24294:	03000793          	li	a5,48
   24298:	00f71d63          	bne	a4,a5,242b2 <__cvt+0xde>
   2429c:	4601                	li	a2,0
   2429e:	4681                	li	a3,0
   242a0:	8556                	mv	a0,s5
   242a2:	85a2                	mv	a1,s0
   242a4:	938fe0ef          	jal	223dc <__eqdf2>
   242a8:	c509                	beqz	a0,242b2 <__cvt+0xde>
   242aa:	4785                	li	a5,1
   242ac:	8f85                	sub	a5,a5,s1
   242ae:	00fb2023          	sw	a5,0(s6)
   242b2:	000b2783          	lw	a5,0(s6)
   242b6:	9a3e                	add	s4,s4,a5
   242b8:	bf49                	j	2424a <__cvt+0x76>
   242ba:	00178693          	add	a3,a5,1
   242be:	c636                	sw	a3,12(sp)
   242c0:	00e78023          	sb	a4,0(a5)
   242c4:	bf69                	j	2425e <__cvt+0x8a>

000242c6 <__exponent>:
   242c6:	00c50023          	sb	a2,0(a0)
   242ca:	02b00793          	li	a5,43
   242ce:	0005d663          	bgez	a1,242da <__exponent+0x14>
   242d2:	40b005b3          	neg	a1,a1
   242d6:	02d00793          	li	a5,45
   242da:	00f500a3          	sb	a5,1(a0)
   242de:	47a5                	li	a5,9
   242e0:	06b7d463          	bge	a5,a1,24348 <__exponent+0x82>
   242e4:	1141                	add	sp,sp,-16
   242e6:	00f10713          	add	a4,sp,15
   242ea:	883a                	mv	a6,a4
   242ec:	4629                	li	a2,10
   242ee:	06300893          	li	a7,99
   242f2:	02c5e7b3          	rem	a5,a1,a2
   242f6:	86ba                	mv	a3,a4
   242f8:	177d                	add	a4,a4,-1 # 7fffffff <__share_mem_end__+0x7ef3ffff>
   242fa:	03078793          	add	a5,a5,48
   242fe:	fef68fa3          	sb	a5,-1(a3)
   24302:	87ae                	mv	a5,a1
   24304:	02c5c5b3          	div	a1,a1,a2
   24308:	fef8c5e3          	blt	a7,a5,242f2 <__exponent+0x2c>
   2430c:	00250793          	add	a5,a0,2
   24310:	ffe68893          	add	a7,a3,-2
   24314:	03058593          	add	a1,a1,48
   24318:	feb70fa3          	sb	a1,-1(a4)
   2431c:	863e                	mv	a2,a5
   2431e:	8746                	mv	a4,a7
   24320:	01076d63          	bltu	a4,a6,2433a <__exponent+0x74>
   24324:	4701                	li	a4,0
   24326:	01186563          	bltu	a6,a7,24330 <__exponent+0x6a>
   2432a:	01110713          	add	a4,sp,17
   2432e:	8f15                	sub	a4,a4,a3
   24330:	97ba                	add	a5,a5,a4
   24332:	40a78533          	sub	a0,a5,a0
   24336:	0141                	add	sp,sp,16
   24338:	8082                	ret
   2433a:	00074583          	lbu	a1,0(a4)
   2433e:	0705                	add	a4,a4,1
   24340:	0605                	add	a2,a2,1
   24342:	feb60fa3          	sb	a1,-1(a2)
   24346:	bfe9                	j	24320 <__exponent+0x5a>
   24348:	03000793          	li	a5,48
   2434c:	00f50123          	sb	a5,2(a0)
   24350:	03058593          	add	a1,a1,48
   24354:	00450793          	add	a5,a0,4
   24358:	00b501a3          	sb	a1,3(a0)
   2435c:	40a78533          	sub	a0,a5,a0
   24360:	8082                	ret

00024362 <_printf_float>:
   24362:	7119                	add	sp,sp,-128
   24364:	de86                	sw	ra,124(sp)
   24366:	dca2                	sw	s0,120(sp)
   24368:	d8ca                	sw	s2,112(sp)
   2436a:	842e                	mv	s0,a1
   2436c:	893a                	mv	s2,a4
   2436e:	d4d2                	sw	s4,104(sp)
   24370:	d2d6                	sw	s5,100(sp)
   24372:	d0da                	sw	s6,96(sp)
   24374:	cede                	sw	s7,92(sp)
   24376:	cce2                	sw	s8,88(sp)
   24378:	cae6                	sw	s9,84(sp)
   2437a:	8a32                	mv	s4,a2
   2437c:	8ab6                	mv	s5,a3
   2437e:	daa6                	sw	s1,116(sp)
   24380:	d6ce                	sw	s3,108(sp)
   24382:	c8ea                	sw	s10,80(sp)
   24384:	c6ee                	sw	s11,76(sp)
   24386:	ce2a                	sw	a0,28(sp)
   24388:	578030ef          	jal	27900 <_localeconv_r>
   2438c:	00052c83          	lw	s9,0(a0)
   24390:	8566                	mv	a0,s9
   24392:	683000ef          	jal	25214 <strlen>
   24396:	00042b83          	lw	s7,0(s0)
   2439a:	dc02                	sw	zero,56(sp)
   2439c:	01844b03          	lbu	s6,24(s0)
   243a0:	100bf713          	and	a4,s7,256
   243a4:	00092783          	lw	a5,0(s2)
   243a8:	8c2a                	mv	s8,a0
   243aa:	c761                	beqz	a4,24472 <_printf_float+0x110>
   243ac:	00478713          	add	a4,a5,4
   243b0:	00e92023          	sw	a4,0(s2)
   243b4:	439c                	lw	a5,0(a5)
   243b6:	1008                	add	a0,sp,32
   243b8:	4398                	lw	a4,0(a5)
   243ba:	d03a                	sw	a4,32(sp)
   243bc:	43d8                	lw	a4,4(a5)
   243be:	d23a                	sw	a4,36(sp)
   243c0:	4798                	lw	a4,8(a5)
   243c2:	d43a                	sw	a4,40(sp)
   243c4:	47dc                	lw	a5,12(a5)
   243c6:	d63e                	sw	a5,44(sp)
   243c8:	f46fe0ef          	jal	22b0e <__trunctfdf2>
   243cc:	8daa                	mv	s11,a0
   243ce:	8d2e                	mv	s10,a1
   243d0:	0002a737          	lui	a4,0x2a
   243d4:	c3072903          	lw	s2,-976(a4) # 29c30 <_global_impure_ptr+0x8>
   243d8:	c3472983          	lw	s3,-972(a4)
   243dc:	001d1793          	sll	a5,s10,0x1
   243e0:	0017d493          	srl	s1,a5,0x1
   243e4:	05b42423          	sw	s11,72(s0)
   243e8:	05a42623          	sw	s10,76(s0)
   243ec:	864a                	mv	a2,s2
   243ee:	86ce                	mv	a3,s3
   243f0:	856e                	mv	a0,s11
   243f2:	85a6                	mv	a1,s1
   243f4:	986fe0ef          	jal	2257a <__unorddf2>
   243f8:	e941                	bnez	a0,24488 <_printf_float+0x126>
   243fa:	864a                	mv	a2,s2
   243fc:	86ce                	mv	a3,s3
   243fe:	856e                	mv	a0,s11
   24400:	85a6                	mv	a1,s1
   24402:	8defe0ef          	jal	224e0 <__ledf2>
   24406:	08a05163          	blez	a0,24488 <_printf_float+0x126>
   2440a:	4601                	li	a2,0
   2440c:	4681                	li	a3,0
   2440e:	856e                	mv	a0,s11
   24410:	85ea                	mv	a1,s10
   24412:	8cefe0ef          	jal	224e0 <__ledf2>
   24416:	00055663          	bgez	a0,24422 <_printf_float+0xc0>
   2441a:	02d00793          	li	a5,45
   2441e:	04f401a3          	sb	a5,67(s0)
   24422:	04700793          	li	a5,71
   24426:	0967e763          	bltu	a5,s6,244b4 <_printf_float+0x152>
   2442a:	00029937          	lui	s2,0x29
   2442e:	58890913          	add	s2,s2,1416 # 29588 <__clz_tab+0x128>
   24432:	478d                	li	a5,3
   24434:	ffbbfb93          	and	s7,s7,-5
   24438:	c81c                	sw	a5,16(s0)
   2443a:	01742023          	sw	s7,0(s0)
   2443e:	4981                	li	s3,0
   24440:	4572                	lw	a0,28(sp)
   24442:	8756                	mv	a4,s5
   24444:	86d2                	mv	a3,s4
   24446:	1870                	add	a2,sp,60
   24448:	85a2                	mv	a1,s0
   2444a:	2ed1                	jal	2481e <_printf_common>
   2444c:	5bfd                	li	s7,-1
   2444e:	17751963          	bne	a0,s7,245c0 <_printf_float+0x25e>
   24452:	557d                	li	a0,-1
   24454:	50f6                	lw	ra,124(sp)
   24456:	5466                	lw	s0,120(sp)
   24458:	54d6                	lw	s1,116(sp)
   2445a:	5946                	lw	s2,112(sp)
   2445c:	59b6                	lw	s3,108(sp)
   2445e:	5a26                	lw	s4,104(sp)
   24460:	5a96                	lw	s5,100(sp)
   24462:	5b06                	lw	s6,96(sp)
   24464:	4bf6                	lw	s7,92(sp)
   24466:	4c66                	lw	s8,88(sp)
   24468:	4cd6                	lw	s9,84(sp)
   2446a:	4d46                	lw	s10,80(sp)
   2446c:	4db6                	lw	s11,76(sp)
   2446e:	6109                	add	sp,sp,128
   24470:	8082                	ret
   24472:	079d                	add	a5,a5,7
   24474:	9be1                	and	a5,a5,-8
   24476:	00878713          	add	a4,a5,8
   2447a:	0007ad83          	lw	s11,0(a5)
   2447e:	0047ad03          	lw	s10,4(a5)
   24482:	00e92023          	sw	a4,0(s2)
   24486:	b7a9                	j	243d0 <_printf_float+0x6e>
   24488:	866e                	mv	a2,s11
   2448a:	86ea                	mv	a3,s10
   2448c:	856e                	mv	a0,s11
   2448e:	85ea                	mv	a1,s10
   24490:	8eafe0ef          	jal	2257a <__unorddf2>
   24494:	c915                	beqz	a0,244c8 <_printf_float+0x166>
   24496:	000d5663          	bgez	s10,244a2 <_printf_float+0x140>
   2449a:	02d00793          	li	a5,45
   2449e:	04f401a3          	sb	a5,67(s0)
   244a2:	04700793          	li	a5,71
   244a6:	0167ec63          	bltu	a5,s6,244be <_printf_float+0x15c>
   244aa:	00029937          	lui	s2,0x29
   244ae:	59090913          	add	s2,s2,1424 # 29590 <__clz_tab+0x130>
   244b2:	b741                	j	24432 <_printf_float+0xd0>
   244b4:	00029937          	lui	s2,0x29
   244b8:	58c90913          	add	s2,s2,1420 # 2958c <__clz_tab+0x12c>
   244bc:	bf9d                	j	24432 <_printf_float+0xd0>
   244be:	00029937          	lui	s2,0x29
   244c2:	59490913          	add	s2,s2,1428 # 29594 <__clz_tab+0x134>
   244c6:	b7b5                	j	24432 <_printf_float+0xd0>
   244c8:	405c                	lw	a5,4(s0)
   244ca:	577d                	li	a4,-1
   244cc:	0dfb7993          	and	s3,s6,223
   244d0:	06e79f63          	bne	a5,a4,2454e <_printf_float+0x1ec>
   244d4:	4799                	li	a5,6
   244d6:	c05c                	sw	a5,4(s0)
   244d8:	400be713          	or	a4,s7,1024
   244dc:	c018                	sw	a4,0(s0)
   244de:	183c                	add	a5,sp,56
   244e0:	c03e                	sw	a5,0(sp)
   244e2:	c202                	sw	zero,4(sp)
   244e4:	4054                	lw	a3,4(s0)
   244e6:	4572                	lw	a0,28(sp)
   244e8:	03310793          	add	a5,sp,51
   244ec:	85ee                	mv	a1,s11
   244ee:	88da                	mv	a7,s6
   244f0:	03410813          	add	a6,sp,52
   244f4:	866a                	mv	a2,s10
   244f6:	39f9                	jal	241d4 <__cvt>
   244f8:	04700793          	li	a5,71
   244fc:	55d2                	lw	a1,52(sp)
   244fe:	892a                	mv	s2,a0
   24500:	04f99e63          	bne	s3,a5,2455c <_printf_float+0x1fa>
   24504:	57f5                	li	a5,-3
   24506:	00f5c563          	blt	a1,a5,24510 <_printf_float+0x1ae>
   2450a:	405c                	lw	a5,4(s0)
   2450c:	08b7d763          	bge	a5,a1,2459a <_printf_float+0x238>
   24510:	1b79                	add	s6,s6,-2
   24512:	0ffb7b13          	zext.b	s6,s6
   24516:	15fd                	add	a1,a1,-1
   24518:	865a                	mv	a2,s6
   2451a:	05040513          	add	a0,s0,80
   2451e:	da2e                	sw	a1,52(sp)
   24520:	335d                	jal	242c6 <__exponent>
   24522:	5762                	lw	a4,56(sp)
   24524:	4685                	li	a3,1
   24526:	89aa                	mv	s3,a0
   24528:	00a707b3          	add	a5,a4,a0
   2452c:	c81c                	sw	a5,16(s0)
   2452e:	00e6c563          	blt	a3,a4,24538 <_printf_float+0x1d6>
   24532:	4018                	lw	a4,0(s0)
   24534:	8b05                	and	a4,a4,1
   24536:	c319                	beqz	a4,2453c <_printf_float+0x1da>
   24538:	0785                	add	a5,a5,1
   2453a:	c81c                	sw	a5,16(s0)
   2453c:	03314783          	lbu	a5,51(sp)
   24540:	f00780e3          	beqz	a5,24440 <_printf_float+0xde>
   24544:	02d00793          	li	a5,45
   24548:	04f401a3          	sb	a5,67(s0)
   2454c:	bdd5                	j	24440 <_printf_float+0xde>
   2454e:	04700713          	li	a4,71
   24552:	f8e993e3          	bne	s3,a4,244d8 <_printf_float+0x176>
   24556:	f3c9                	bnez	a5,244d8 <_printf_float+0x176>
   24558:	4785                	li	a5,1
   2455a:	bfb5                	j	244d6 <_printf_float+0x174>
   2455c:	06500793          	li	a5,101
   24560:	fb67fbe3          	bgeu	a5,s6,24516 <_printf_float+0x1b4>
   24564:	06600793          	li	a5,102
   24568:	02fb1b63          	bne	s6,a5,2459e <_printf_float+0x23c>
   2456c:	405c                	lw	a5,4(s0)
   2456e:	00b05b63          	blez	a1,24584 <_printf_float+0x222>
   24572:	c80c                	sw	a1,16(s0)
   24574:	e781                	bnez	a5,2457c <_printf_float+0x21a>
   24576:	4018                	lw	a4,0(s0)
   24578:	8b05                	and	a4,a4,1
   2457a:	cf09                	beqz	a4,24594 <_printf_float+0x232>
   2457c:	0785                	add	a5,a5,1
   2457e:	97ae                	add	a5,a5,a1
   24580:	c81c                	sw	a5,16(s0)
   24582:	a809                	j	24594 <_printf_float+0x232>
   24584:	e789                	bnez	a5,2458e <_printf_float+0x22c>
   24586:	4018                	lw	a4,0(s0)
   24588:	4685                	li	a3,1
   2458a:	8b05                	and	a4,a4,1
   2458c:	c319                	beqz	a4,24592 <_printf_float+0x230>
   2458e:	00278693          	add	a3,a5,2
   24592:	c814                	sw	a3,16(s0)
   24594:	cc2c                	sw	a1,88(s0)
   24596:	4981                	li	s3,0
   24598:	b755                	j	2453c <_printf_float+0x1da>
   2459a:	06700b13          	li	s6,103
   2459e:	57e2                	lw	a5,56(sp)
   245a0:	00f5c963          	blt	a1,a5,245b2 <_printf_float+0x250>
   245a4:	401c                	lw	a5,0(s0)
   245a6:	c80c                	sw	a1,16(s0)
   245a8:	8b85                	and	a5,a5,1
   245aa:	d7ed                	beqz	a5,24594 <_printf_float+0x232>
   245ac:	00158793          	add	a5,a1,1
   245b0:	bfc1                	j	24580 <_printf_float+0x21e>
   245b2:	4705                	li	a4,1
   245b4:	00b04463          	bgtz	a1,245bc <_printf_float+0x25a>
   245b8:	4709                	li	a4,2
   245ba:	8f0d                	sub	a4,a4,a1
   245bc:	97ba                	add	a5,a5,a4
   245be:	b7c9                	j	24580 <_printf_float+0x21e>
   245c0:	401c                	lw	a5,0(s0)
   245c2:	4007f713          	and	a4,a5,1024
   245c6:	e315                	bnez	a4,245ea <_printf_float+0x288>
   245c8:	4814                	lw	a3,16(s0)
   245ca:	4572                	lw	a0,28(sp)
   245cc:	864a                	mv	a2,s2
   245ce:	85d2                	mv	a1,s4
   245d0:	9a82                	jalr	s5
   245d2:	e97500e3          	beq	a0,s7,24452 <_printf_float+0xf0>
   245d6:	401c                	lw	a5,0(s0)
   245d8:	8b89                	and	a5,a5,2
   245da:	22079d63          	bnez	a5,24814 <_printf_float+0x4b2>
   245de:	57f2                	lw	a5,60(sp)
   245e0:	4448                	lw	a0,12(s0)
   245e2:	e6f559e3          	bge	a0,a5,24454 <_printf_float+0xf2>
   245e6:	853e                	mv	a0,a5
   245e8:	b5b5                	j	24454 <_printf_float+0xf2>
   245ea:	06500713          	li	a4,101
   245ee:	19677c63          	bgeu	a4,s6,24786 <_printf_float+0x424>
   245f2:	4428                	lw	a0,72(s0)
   245f4:	446c                	lw	a1,76(s0)
   245f6:	4601                	li	a2,0
   245f8:	4681                	li	a3,0
   245fa:	de3fd0ef          	jal	223dc <__eqdf2>
   245fe:	e931                	bnez	a0,24652 <_printf_float+0x2f0>
   24600:	4572                	lw	a0,28(sp)
   24602:	00029637          	lui	a2,0x29
   24606:	4685                	li	a3,1
   24608:	59860613          	add	a2,a2,1432 # 29598 <__clz_tab+0x138>
   2460c:	85d2                	mv	a1,s4
   2460e:	9a82                	jalr	s5
   24610:	e57501e3          	beq	a0,s7,24452 <_printf_float+0xf0>
   24614:	5962                	lw	s2,56(sp)
   24616:	57d2                	lw	a5,52(sp)
   24618:	0127c563          	blt	a5,s2,24622 <_printf_float+0x2c0>
   2461c:	401c                	lw	a5,0(s0)
   2461e:	8b85                	and	a5,a5,1
   24620:	dbdd                	beqz	a5,245d6 <_printf_float+0x274>
   24622:	4572                	lw	a0,28(sp)
   24624:	86e2                	mv	a3,s8
   24626:	8666                	mv	a2,s9
   24628:	85d2                	mv	a1,s4
   2462a:	9a82                	jalr	s5
   2462c:	57fd                	li	a5,-1
   2462e:	e2f502e3          	beq	a0,a5,24452 <_printf_float+0xf0>
   24632:	4981                	li	s3,0
   24634:	197d                	add	s2,s2,-1
   24636:	01a40b13          	add	s6,s0,26
   2463a:	5bfd                	li	s7,-1
   2463c:	f929dde3          	bge	s3,s2,245d6 <_printf_float+0x274>
   24640:	4572                	lw	a0,28(sp)
   24642:	4685                	li	a3,1
   24644:	865a                	mv	a2,s6
   24646:	85d2                	mv	a1,s4
   24648:	9a82                	jalr	s5
   2464a:	e17504e3          	beq	a0,s7,24452 <_printf_float+0xf0>
   2464e:	0985                	add	s3,s3,1
   24650:	b7f5                	j	2463c <_printf_float+0x2da>
   24652:	57d2                	lw	a5,52(sp)
   24654:	06f04763          	bgtz	a5,246c2 <_printf_float+0x360>
   24658:	4572                	lw	a0,28(sp)
   2465a:	00029637          	lui	a2,0x29
   2465e:	4685                	li	a3,1
   24660:	59860613          	add	a2,a2,1432 # 29598 <__clz_tab+0x138>
   24664:	85d2                	mv	a1,s4
   24666:	9a82                	jalr	s5
   24668:	df7505e3          	beq	a0,s7,24452 <_printf_float+0xf0>
   2466c:	5b62                	lw	s6,56(sp)
   2466e:	57d2                	lw	a5,52(sp)
   24670:	00fb67b3          	or	a5,s6,a5
   24674:	e781                	bnez	a5,2467c <_printf_float+0x31a>
   24676:	401c                	lw	a5,0(s0)
   24678:	8b85                	and	a5,a5,1
   2467a:	dfb1                	beqz	a5,245d6 <_printf_float+0x274>
   2467c:	4572                	lw	a0,28(sp)
   2467e:	86e2                	mv	a3,s8
   24680:	8666                	mv	a2,s9
   24682:	85d2                	mv	a1,s4
   24684:	9a82                	jalr	s5
   24686:	57fd                	li	a5,-1
   24688:	dcf505e3          	beq	a0,a5,24452 <_printf_float+0xf0>
   2468c:	4981                	li	s3,0
   2468e:	01a40b93          	add	s7,s0,26
   24692:	5c7d                	li	s8,-1
   24694:	57d2                	lw	a5,52(sp)
   24696:	40f007b3          	neg	a5,a5
   2469a:	00f9cb63          	blt	s3,a5,246b0 <_printf_float+0x34e>
   2469e:	86da                	mv	a3,s6
   246a0:	864a                	mv	a2,s2
   246a2:	4572                	lw	a0,28(sp)
   246a4:	85d2                	mv	a1,s4
   246a6:	9a82                	jalr	s5
   246a8:	57fd                	li	a5,-1
   246aa:	f2f516e3          	bne	a0,a5,245d6 <_printf_float+0x274>
   246ae:	b355                	j	24452 <_printf_float+0xf0>
   246b0:	4572                	lw	a0,28(sp)
   246b2:	4685                	li	a3,1
   246b4:	865e                	mv	a2,s7
   246b6:	85d2                	mv	a1,s4
   246b8:	9a82                	jalr	s5
   246ba:	d9850ce3          	beq	a0,s8,24452 <_printf_float+0xf0>
   246be:	0985                	add	s3,s3,1
   246c0:	bfd1                	j	24694 <_printf_float+0x332>
   246c2:	5b62                	lw	s6,56(sp)
   246c4:	05842983          	lw	s3,88(s0)
   246c8:	013b5363          	bge	s6,s3,246ce <_printf_float+0x36c>
   246cc:	89da                	mv	s3,s6
   246ce:	07304763          	bgtz	s3,2473c <_printf_float+0x3da>
   246d2:	4d81                	li	s11,0
   246d4:	01a40d13          	add	s10,s0,26
   246d8:	54fd                	li	s1,-1
   246da:	05842b83          	lw	s7,88(s0)
   246de:	87ce                	mv	a5,s3
   246e0:	0009d363          	bgez	s3,246e6 <_printf_float+0x384>
   246e4:	4781                	li	a5,0
   246e6:	40fb87b3          	sub	a5,s7,a5
   246ea:	06fdc263          	blt	s11,a5,2474e <_printf_float+0x3ec>
   246ee:	57d2                	lw	a5,52(sp)
   246f0:	0767c863          	blt	a5,s6,24760 <_printf_float+0x3fe>
   246f4:	401c                	lw	a5,0(s0)
   246f6:	8b85                	and	a5,a5,1
   246f8:	e7a5                	bnez	a5,24760 <_printf_float+0x3fe>
   246fa:	59d2                	lw	s3,52(sp)
   246fc:	417b07b3          	sub	a5,s6,s7
   24700:	413b09b3          	sub	s3,s6,s3
   24704:	0137d363          	bge	a5,s3,2470a <_printf_float+0x3a8>
   24708:	89be                	mv	s3,a5
   2470a:	07304463          	bgtz	s3,24772 <_printf_float+0x410>
   2470e:	4901                	li	s2,0
   24710:	01a40b93          	add	s7,s0,26
   24714:	5c7d                	li	s8,-1
   24716:	57d2                	lw	a5,52(sp)
   24718:	874e                	mv	a4,s3
   2471a:	40fb07b3          	sub	a5,s6,a5
   2471e:	0009d363          	bgez	s3,24724 <_printf_float+0x3c2>
   24722:	4701                	li	a4,0
   24724:	8f99                	sub	a5,a5,a4
   24726:	eaf958e3          	bge	s2,a5,245d6 <_printf_float+0x274>
   2472a:	4572                	lw	a0,28(sp)
   2472c:	4685                	li	a3,1
   2472e:	865e                	mv	a2,s7
   24730:	85d2                	mv	a1,s4
   24732:	9a82                	jalr	s5
   24734:	d1850fe3          	beq	a0,s8,24452 <_printf_float+0xf0>
   24738:	0905                	add	s2,s2,1
   2473a:	bff1                	j	24716 <_printf_float+0x3b4>
   2473c:	4572                	lw	a0,28(sp)
   2473e:	86ce                	mv	a3,s3
   24740:	864a                	mv	a2,s2
   24742:	85d2                	mv	a1,s4
   24744:	9a82                	jalr	s5
   24746:	57fd                	li	a5,-1
   24748:	f8f515e3          	bne	a0,a5,246d2 <_printf_float+0x370>
   2474c:	b319                	j	24452 <_printf_float+0xf0>
   2474e:	4572                	lw	a0,28(sp)
   24750:	4685                	li	a3,1
   24752:	866a                	mv	a2,s10
   24754:	85d2                	mv	a1,s4
   24756:	9a82                	jalr	s5
   24758:	ce950de3          	beq	a0,s1,24452 <_printf_float+0xf0>
   2475c:	0d85                	add	s11,s11,1
   2475e:	bfb5                	j	246da <_printf_float+0x378>
   24760:	4572                	lw	a0,28(sp)
   24762:	86e2                	mv	a3,s8
   24764:	8666                	mv	a2,s9
   24766:	85d2                	mv	a1,s4
   24768:	9a82                	jalr	s5
   2476a:	57fd                	li	a5,-1
   2476c:	f8f517e3          	bne	a0,a5,246fa <_printf_float+0x398>
   24770:	b1cd                	j	24452 <_printf_float+0xf0>
   24772:	4572                	lw	a0,28(sp)
   24774:	86ce                	mv	a3,s3
   24776:	01790633          	add	a2,s2,s7
   2477a:	85d2                	mv	a1,s4
   2477c:	9a82                	jalr	s5
   2477e:	57fd                	li	a5,-1
   24780:	f8f517e3          	bne	a0,a5,2470e <_printf_float+0x3ac>
   24784:	b1f9                	j	24452 <_printf_float+0xf0>
   24786:	5b62                	lw	s6,56(sp)
   24788:	4705                	li	a4,1
   2478a:	4685                	li	a3,1
   2478c:	864a                	mv	a2,s2
   2478e:	01674463          	blt	a4,s6,24796 <_printf_float+0x434>
   24792:	8b85                	and	a5,a5,1
   24794:	cb8d                	beqz	a5,247c6 <_printf_float+0x464>
   24796:	4572                	lw	a0,28(sp)
   24798:	85d2                	mv	a1,s4
   2479a:	5bfd                	li	s7,-1
   2479c:	9a82                	jalr	s5
   2479e:	cb750ae3          	beq	a0,s7,24452 <_printf_float+0xf0>
   247a2:	4572                	lw	a0,28(sp)
   247a4:	86e2                	mv	a3,s8
   247a6:	8666                	mv	a2,s9
   247a8:	85d2                	mv	a1,s4
   247aa:	9a82                	jalr	s5
   247ac:	cb7503e3          	beq	a0,s7,24452 <_printf_float+0xf0>
   247b0:	4428                	lw	a0,72(s0)
   247b2:	446c                	lw	a1,76(s0)
   247b4:	4601                	li	a2,0
   247b6:	4681                	li	a3,0
   247b8:	1b7d                	add	s6,s6,-1
   247ba:	c23fd0ef          	jal	223dc <__eqdf2>
   247be:	c905                	beqz	a0,247ee <_printf_float+0x48c>
   247c0:	86da                	mv	a3,s6
   247c2:	00190613          	add	a2,s2,1
   247c6:	4572                	lw	a0,28(sp)
   247c8:	85d2                	mv	a1,s4
   247ca:	9a82                	jalr	s5
   247cc:	01751d63          	bne	a0,s7,247e6 <_printf_float+0x484>
   247d0:	b149                	j	24452 <_printf_float+0xf0>
   247d2:	4572                	lw	a0,28(sp)
   247d4:	4685                	li	a3,1
   247d6:	865e                	mv	a2,s7
   247d8:	85d2                	mv	a1,s4
   247da:	9a82                	jalr	s5
   247dc:	c7850be3          	beq	a0,s8,24452 <_printf_float+0xf0>
   247e0:	0905                	add	s2,s2,1
   247e2:	ff6948e3          	blt	s2,s6,247d2 <_printf_float+0x470>
   247e6:	86ce                	mv	a3,s3
   247e8:	05040613          	add	a2,s0,80
   247ec:	bd5d                	j	246a2 <_printf_float+0x340>
   247ee:	4901                	li	s2,0
   247f0:	01a40b93          	add	s7,s0,26
   247f4:	5c7d                	li	s8,-1
   247f6:	b7f5                	j	247e2 <_printf_float+0x480>
   247f8:	4572                	lw	a0,28(sp)
   247fa:	4685                	li	a3,1
   247fc:	864e                	mv	a2,s3
   247fe:	85d2                	mv	a1,s4
   24800:	9a82                	jalr	s5
   24802:	c56508e3          	beq	a0,s6,24452 <_printf_float+0xf0>
   24806:	0905                	add	s2,s2,1
   24808:	445c                	lw	a5,12(s0)
   2480a:	5772                	lw	a4,60(sp)
   2480c:	8f99                	sub	a5,a5,a4
   2480e:	fef945e3          	blt	s2,a5,247f8 <_printf_float+0x496>
   24812:	b3f1                	j	245de <_printf_float+0x27c>
   24814:	4901                	li	s2,0
   24816:	01940993          	add	s3,s0,25
   2481a:	5b7d                	li	s6,-1
   2481c:	b7f5                	j	24808 <_printf_float+0x4a6>

0002481e <_printf_common>:
   2481e:	7179                	add	sp,sp,-48
   24820:	ca56                	sw	s5,20(sp)
   24822:	499c                	lw	a5,16(a1)
   24824:	8aba                	mv	s5,a4
   24826:	4598                	lw	a4,8(a1)
   24828:	d422                	sw	s0,40(sp)
   2482a:	d04a                	sw	s2,32(sp)
   2482c:	ce4e                	sw	s3,28(sp)
   2482e:	cc52                	sw	s4,24(sp)
   24830:	d606                	sw	ra,44(sp)
   24832:	d226                	sw	s1,36(sp)
   24834:	c85a                	sw	s6,16(sp)
   24836:	c65e                	sw	s7,12(sp)
   24838:	89aa                	mv	s3,a0
   2483a:	842e                	mv	s0,a1
   2483c:	8932                	mv	s2,a2
   2483e:	8a36                	mv	s4,a3
   24840:	00e7d363          	bge	a5,a4,24846 <_printf_common+0x28>
   24844:	87ba                	mv	a5,a4
   24846:	00f92023          	sw	a5,0(s2)
   2484a:	04344703          	lbu	a4,67(s0)
   2484e:	c701                	beqz	a4,24856 <_printf_common+0x38>
   24850:	0785                	add	a5,a5,1
   24852:	00f92023          	sw	a5,0(s2)
   24856:	401c                	lw	a5,0(s0)
   24858:	0207f793          	and	a5,a5,32
   2485c:	c791                	beqz	a5,24868 <_printf_common+0x4a>
   2485e:	00092783          	lw	a5,0(s2)
   24862:	0789                	add	a5,a5,2
   24864:	00f92023          	sw	a5,0(s2)
   24868:	4004                	lw	s1,0(s0)
   2486a:	8899                	and	s1,s1,6
   2486c:	e891                	bnez	s1,24880 <_printf_common+0x62>
   2486e:	01940b13          	add	s6,s0,25
   24872:	5bfd                	li	s7,-1
   24874:	445c                	lw	a5,12(s0)
   24876:	00092703          	lw	a4,0(s2)
   2487a:	8f99                	sub	a5,a5,a4
   2487c:	04f4cc63          	blt	s1,a5,248d4 <_printf_common+0xb6>
   24880:	04344783          	lbu	a5,67(s0)
   24884:	00f036b3          	snez	a3,a5
   24888:	401c                	lw	a5,0(s0)
   2488a:	0207f793          	and	a5,a5,32
   2488e:	eba5                	bnez	a5,248fe <_printf_common+0xe0>
   24890:	04340613          	add	a2,s0,67
   24894:	85d2                	mv	a1,s4
   24896:	854e                	mv	a0,s3
   24898:	9a82                	jalr	s5
   2489a:	57fd                	li	a5,-1
   2489c:	04f50363          	beq	a0,a5,248e2 <_printf_common+0xc4>
   248a0:	401c                	lw	a5,0(s0)
   248a2:	4711                	li	a4,4
   248a4:	4481                	li	s1,0
   248a6:	8b99                	and	a5,a5,6
   248a8:	00e79963          	bne	a5,a4,248ba <_printf_common+0x9c>
   248ac:	4444                	lw	s1,12(s0)
   248ae:	00092783          	lw	a5,0(s2)
   248b2:	8c9d                	sub	s1,s1,a5
   248b4:	0004d363          	bgez	s1,248ba <_printf_common+0x9c>
   248b8:	4481                	li	s1,0
   248ba:	441c                	lw	a5,8(s0)
   248bc:	4818                	lw	a4,16(s0)
   248be:	00f75463          	bge	a4,a5,248c6 <_printf_common+0xa8>
   248c2:	8f99                	sub	a5,a5,a4
   248c4:	94be                	add	s1,s1,a5
   248c6:	4901                	li	s2,0
   248c8:	0469                	add	s0,s0,26
   248ca:	5b7d                	li	s6,-1
   248cc:	05249863          	bne	s1,s2,2491c <_printf_common+0xfe>
   248d0:	4501                	li	a0,0
   248d2:	a809                	j	248e4 <_printf_common+0xc6>
   248d4:	4685                	li	a3,1
   248d6:	865a                	mv	a2,s6
   248d8:	85d2                	mv	a1,s4
   248da:	854e                	mv	a0,s3
   248dc:	9a82                	jalr	s5
   248de:	01751e63          	bne	a0,s7,248fa <_printf_common+0xdc>
   248e2:	557d                	li	a0,-1
   248e4:	50b2                	lw	ra,44(sp)
   248e6:	5422                	lw	s0,40(sp)
   248e8:	5492                	lw	s1,36(sp)
   248ea:	5902                	lw	s2,32(sp)
   248ec:	49f2                	lw	s3,28(sp)
   248ee:	4a62                	lw	s4,24(sp)
   248f0:	4ad2                	lw	s5,20(sp)
   248f2:	4b42                	lw	s6,16(sp)
   248f4:	4bb2                	lw	s7,12(sp)
   248f6:	6145                	add	sp,sp,48
   248f8:	8082                	ret
   248fa:	0485                	add	s1,s1,1
   248fc:	bfa5                	j	24874 <_printf_common+0x56>
   248fe:	00d40733          	add	a4,s0,a3
   24902:	03000613          	li	a2,48
   24906:	04c701a3          	sb	a2,67(a4)
   2490a:	04544703          	lbu	a4,69(s0)
   2490e:	00168793          	add	a5,a3,1
   24912:	97a2                	add	a5,a5,s0
   24914:	0689                	add	a3,a3,2
   24916:	04e781a3          	sb	a4,67(a5)
   2491a:	bf9d                	j	24890 <_printf_common+0x72>
   2491c:	4685                	li	a3,1
   2491e:	8622                	mv	a2,s0
   24920:	85d2                	mv	a1,s4
   24922:	854e                	mv	a0,s3
   24924:	9a82                	jalr	s5
   24926:	fb650ee3          	beq	a0,s6,248e2 <_printf_common+0xc4>
   2492a:	0905                	add	s2,s2,1
   2492c:	b745                	j	248cc <_printf_common+0xae>

0002492e <_printf_i>:
   2492e:	7179                	add	sp,sp,-48
   24930:	d422                	sw	s0,40(sp)
   24932:	d04a                	sw	s2,32(sp)
   24934:	ce4e                	sw	s3,28(sp)
   24936:	cc52                	sw	s4,24(sp)
   24938:	d606                	sw	ra,44(sp)
   2493a:	d226                	sw	s1,36(sp)
   2493c:	ca56                	sw	s5,20(sp)
   2493e:	c85a                	sw	s6,16(sp)
   24940:	8a36                	mv	s4,a3
   24942:	0185c683          	lbu	a3,24(a1)
   24946:	07800793          	li	a5,120
   2494a:	892a                	mv	s2,a0
   2494c:	842e                	mv	s0,a1
   2494e:	89b2                	mv	s3,a2
   24950:	00d7ee63          	bltu	a5,a3,2496c <_printf_i+0x3e>
   24954:	06200793          	li	a5,98
   24958:	04358613          	add	a2,a1,67
   2495c:	00d7ed63          	bltu	a5,a3,24976 <_printf_i+0x48>
   24960:	1a068c63          	beqz	a3,24b18 <_printf_i+0x1ea>
   24964:	05800793          	li	a5,88
   24968:	16f68863          	beq	a3,a5,24ad8 <_printf_i+0x1aa>
   2496c:	04240493          	add	s1,s0,66
   24970:	04d40123          	sb	a3,66(s0)
   24974:	a80d                	j	249a6 <_printf_i+0x78>
   24976:	f9d68793          	add	a5,a3,-99
   2497a:	0ff7f793          	zext.b	a5,a5
   2497e:	45d5                	li	a1,21
   24980:	fef5e6e3          	bltu	a1,a5,2496c <_printf_i+0x3e>
   24984:	0002a5b7          	lui	a1,0x2a
   24988:	078a                	sll	a5,a5,0x2
   2498a:	86c58593          	add	a1,a1,-1940 # 2986c <__clz_tab+0x40c>
   2498e:	97ae                	add	a5,a5,a1
   24990:	439c                	lw	a5,0(a5)
   24992:	8782                	jr	a5
   24994:	431c                	lw	a5,0(a4)
   24996:	04240493          	add	s1,s0,66
   2499a:	00478693          	add	a3,a5,4
   2499e:	439c                	lw	a5,0(a5)
   249a0:	c314                	sw	a3,0(a4)
   249a2:	04f40123          	sb	a5,66(s0)
   249a6:	4785                	li	a5,1
   249a8:	aa51                	j	24b3c <_printf_i+0x20e>
   249aa:	401c                	lw	a5,0(s0)
   249ac:	4308                	lw	a0,0(a4)
   249ae:	0807f693          	and	a3,a5,128
   249b2:	00450593          	add	a1,a0,4
   249b6:	c28d                	beqz	a3,249d8 <_printf_i+0xaa>
   249b8:	411c                	lw	a5,0(a0)
   249ba:	c30c                	sw	a1,0(a4)
   249bc:	00029837          	lui	a6,0x29
   249c0:	0007d863          	bgez	a5,249d0 <_printf_i+0xa2>
   249c4:	02d00713          	li	a4,45
   249c8:	40f007b3          	neg	a5,a5
   249cc:	04e401a3          	sb	a4,67(s0)
   249d0:	59c80813          	add	a6,a6,1436 # 2959c <__clz_tab+0x13c>
   249d4:	4729                	li	a4,10
   249d6:	a091                	j	24a1a <_printf_i+0xec>
   249d8:	0407f693          	and	a3,a5,64
   249dc:	411c                	lw	a5,0(a0)
   249de:	c30c                	sw	a1,0(a4)
   249e0:	def1                	beqz	a3,249bc <_printf_i+0x8e>
   249e2:	07c2                	sll	a5,a5,0x10
   249e4:	87c1                	sra	a5,a5,0x10
   249e6:	bfd9                	j	249bc <_printf_i+0x8e>
   249e8:	4008                	lw	a0,0(s0)
   249ea:	430c                	lw	a1,0(a4)
   249ec:	08057813          	and	a6,a0,128
   249f0:	419c                	lw	a5,0(a1)
   249f2:	0591                	add	a1,a1,4
   249f4:	00081763          	bnez	a6,24a02 <_printf_i+0xd4>
   249f8:	04057513          	and	a0,a0,64
   249fc:	c119                	beqz	a0,24a02 <_printf_i+0xd4>
   249fe:	07c2                	sll	a5,a5,0x10
   24a00:	83c1                	srl	a5,a5,0x10
   24a02:	c30c                	sw	a1,0(a4)
   24a04:	00029837          	lui	a6,0x29
   24a08:	06f00713          	li	a4,111
   24a0c:	59c80813          	add	a6,a6,1436 # 2959c <__clz_tab+0x13c>
   24a10:	0ce69e63          	bne	a3,a4,24aec <_printf_i+0x1be>
   24a14:	4721                	li	a4,8
   24a16:	040401a3          	sb	zero,67(s0)
   24a1a:	4054                	lw	a3,4(s0)
   24a1c:	c414                	sw	a3,8(s0)
   24a1e:	0006c863          	bltz	a3,24a2e <_printf_i+0x100>
   24a22:	400c                	lw	a1,0(s0)
   24a24:	8edd                	or	a3,a3,a5
   24a26:	84b2                	mv	s1,a2
   24a28:	99ed                	and	a1,a1,-5
   24a2a:	c00c                	sw	a1,0(s0)
   24a2c:	ce99                	beqz	a3,24a4a <_printf_i+0x11c>
   24a2e:	84b2                	mv	s1,a2
   24a30:	02e7f6b3          	remu	a3,a5,a4
   24a34:	14fd                	add	s1,s1,-1
   24a36:	96c2                	add	a3,a3,a6
   24a38:	0006c683          	lbu	a3,0(a3)
   24a3c:	00d48023          	sb	a3,0(s1)
   24a40:	86be                	mv	a3,a5
   24a42:	02e7d7b3          	divu	a5,a5,a4
   24a46:	fee6f5e3          	bgeu	a3,a4,24a30 <_printf_i+0x102>
   24a4a:	47a1                	li	a5,8
   24a4c:	00f71e63          	bne	a4,a5,24a68 <_printf_i+0x13a>
   24a50:	401c                	lw	a5,0(s0)
   24a52:	8b85                	and	a5,a5,1
   24a54:	cb91                	beqz	a5,24a68 <_printf_i+0x13a>
   24a56:	4058                	lw	a4,4(s0)
   24a58:	481c                	lw	a5,16(s0)
   24a5a:	00e7c763          	blt	a5,a4,24a68 <_printf_i+0x13a>
   24a5e:	03000793          	li	a5,48
   24a62:	fef48fa3          	sb	a5,-1(s1)
   24a66:	14fd                	add	s1,s1,-1
   24a68:	8e05                	sub	a2,a2,s1
   24a6a:	c810                	sw	a2,16(s0)
   24a6c:	8752                	mv	a4,s4
   24a6e:	86ce                	mv	a3,s3
   24a70:	0070                	add	a2,sp,12
   24a72:	85a2                	mv	a1,s0
   24a74:	854a                	mv	a0,s2
   24a76:	3365                	jal	2481e <_printf_common>
   24a78:	5afd                	li	s5,-1
   24a7a:	0d551563          	bne	a0,s5,24b44 <_printf_i+0x216>
   24a7e:	557d                	li	a0,-1
   24a80:	50b2                	lw	ra,44(sp)
   24a82:	5422                	lw	s0,40(sp)
   24a84:	5492                	lw	s1,36(sp)
   24a86:	5902                	lw	s2,32(sp)
   24a88:	49f2                	lw	s3,28(sp)
   24a8a:	4a62                	lw	s4,24(sp)
   24a8c:	4ad2                	lw	s5,20(sp)
   24a8e:	4b42                	lw	s6,16(sp)
   24a90:	6145                	add	sp,sp,48
   24a92:	8082                	ret
   24a94:	401c                	lw	a5,0(s0)
   24a96:	0207e793          	or	a5,a5,32
   24a9a:	c01c                	sw	a5,0(s0)
   24a9c:	00029837          	lui	a6,0x29
   24aa0:	07800693          	li	a3,120
   24aa4:	5b080813          	add	a6,a6,1456 # 295b0 <__clz_tab+0x150>
   24aa8:	04d402a3          	sb	a3,69(s0)
   24aac:	4014                	lw	a3,0(s0)
   24aae:	430c                	lw	a1,0(a4)
   24ab0:	0806f513          	and	a0,a3,128
   24ab4:	419c                	lw	a5,0(a1)
   24ab6:	0591                	add	a1,a1,4
   24ab8:	e511                	bnez	a0,24ac4 <_printf_i+0x196>
   24aba:	0406f513          	and	a0,a3,64
   24abe:	c119                	beqz	a0,24ac4 <_printf_i+0x196>
   24ac0:	07c2                	sll	a5,a5,0x10
   24ac2:	83c1                	srl	a5,a5,0x10
   24ac4:	c30c                	sw	a1,0(a4)
   24ac6:	0016f713          	and	a4,a3,1
   24aca:	c701                	beqz	a4,24ad2 <_printf_i+0x1a4>
   24acc:	0206e693          	or	a3,a3,32
   24ad0:	c014                	sw	a3,0(s0)
   24ad2:	cb81                	beqz	a5,24ae2 <_printf_i+0x1b4>
   24ad4:	4741                	li	a4,16
   24ad6:	b781                	j	24a16 <_printf_i+0xe8>
   24ad8:	00029837          	lui	a6,0x29
   24adc:	59c80813          	add	a6,a6,1436 # 2959c <__clz_tab+0x13c>
   24ae0:	b7e1                	j	24aa8 <_printf_i+0x17a>
   24ae2:	4018                	lw	a4,0(s0)
   24ae4:	fdf77713          	and	a4,a4,-33
   24ae8:	c018                	sw	a4,0(s0)
   24aea:	b7ed                	j	24ad4 <_printf_i+0x1a6>
   24aec:	4729                	li	a4,10
   24aee:	b725                	j	24a16 <_printf_i+0xe8>
   24af0:	4014                	lw	a3,0(s0)
   24af2:	431c                	lw	a5,0(a4)
   24af4:	484c                	lw	a1,20(s0)
   24af6:	0806f813          	and	a6,a3,128
   24afa:	00478513          	add	a0,a5,4
   24afe:	00080663          	beqz	a6,24b0a <_printf_i+0x1dc>
   24b02:	c308                	sw	a0,0(a4)
   24b04:	439c                	lw	a5,0(a5)
   24b06:	c38c                	sw	a1,0(a5)
   24b08:	a801                	j	24b18 <_printf_i+0x1ea>
   24b0a:	c308                	sw	a0,0(a4)
   24b0c:	0406f693          	and	a3,a3,64
   24b10:	439c                	lw	a5,0(a5)
   24b12:	daf5                	beqz	a3,24b06 <_printf_i+0x1d8>
   24b14:	00b79023          	sh	a1,0(a5)
   24b18:	00042823          	sw	zero,16(s0)
   24b1c:	84b2                	mv	s1,a2
   24b1e:	b7b9                	j	24a6c <_printf_i+0x13e>
   24b20:	431c                	lw	a5,0(a4)
   24b22:	4050                	lw	a2,4(s0)
   24b24:	4581                	li	a1,0
   24b26:	00478693          	add	a3,a5,4
   24b2a:	c314                	sw	a3,0(a4)
   24b2c:	4384                	lw	s1,0(a5)
   24b2e:	8526                	mv	a0,s1
   24b30:	71d020ef          	jal	27a4c <memchr>
   24b34:	c119                	beqz	a0,24b3a <_printf_i+0x20c>
   24b36:	8d05                	sub	a0,a0,s1
   24b38:	c048                	sw	a0,4(s0)
   24b3a:	405c                	lw	a5,4(s0)
   24b3c:	c81c                	sw	a5,16(s0)
   24b3e:	040401a3          	sb	zero,67(s0)
   24b42:	b72d                	j	24a6c <_printf_i+0x13e>
   24b44:	4814                	lw	a3,16(s0)
   24b46:	8626                	mv	a2,s1
   24b48:	85ce                	mv	a1,s3
   24b4a:	854a                	mv	a0,s2
   24b4c:	9a02                	jalr	s4
   24b4e:	f35508e3          	beq	a0,s5,24a7e <_printf_i+0x150>
   24b52:	401c                	lw	a5,0(s0)
   24b54:	8b89                	and	a5,a5,2
   24b56:	e78d                	bnez	a5,24b80 <_printf_i+0x252>
   24b58:	47b2                	lw	a5,12(sp)
   24b5a:	4448                	lw	a0,12(s0)
   24b5c:	f2f552e3          	bge	a0,a5,24a80 <_printf_i+0x152>
   24b60:	853e                	mv	a0,a5
   24b62:	bf39                	j	24a80 <_printf_i+0x152>
   24b64:	4685                	li	a3,1
   24b66:	8656                	mv	a2,s5
   24b68:	85ce                	mv	a1,s3
   24b6a:	854a                	mv	a0,s2
   24b6c:	9a02                	jalr	s4
   24b6e:	f16508e3          	beq	a0,s6,24a7e <_printf_i+0x150>
   24b72:	0485                	add	s1,s1,1
   24b74:	445c                	lw	a5,12(s0)
   24b76:	4732                	lw	a4,12(sp)
   24b78:	8f99                	sub	a5,a5,a4
   24b7a:	fef4c5e3          	blt	s1,a5,24b64 <_printf_i+0x236>
   24b7e:	bfe9                	j	24b58 <_printf_i+0x22a>
   24b80:	4481                	li	s1,0
   24b82:	01940a93          	add	s5,s0,25
   24b86:	5b7d                	li	s6,-1
   24b88:	b7f5                	j	24b74 <_printf_i+0x246>

00024b8a <_scanf_float>:
   24b8a:	459c                	lw	a5,8(a1)
   24b8c:	711d                	add	sp,sp,-96
   24b8e:	cca2                	sw	s0,88(sp)
   24b90:	c6ce                	sw	s3,76(sp)
   24b92:	c2d6                	sw	s5,68(sp)
   24b94:	c0da                	sw	s6,64(sp)
   24b96:	89b2                	mv	s3,a2
   24b98:	ce86                	sw	ra,92(sp)
   24b9a:	caa6                	sw	s1,84(sp)
   24b9c:	c8ca                	sw	s2,80(sp)
   24b9e:	c4d2                	sw	s4,72(sp)
   24ba0:	de5e                	sw	s7,60(sp)
   24ba2:	dc62                	sw	s8,56(sp)
   24ba4:	da66                	sw	s9,52(sp)
   24ba6:	d86a                	sw	s10,48(sp)
   24ba8:	d66e                	sw	s11,44(sp)
   24baa:	c42a                	sw	a0,8(sp)
   24bac:	fff78613          	add	a2,a5,-1
   24bb0:	15c00713          	li	a4,348
   24bb4:	842e                	mv	s0,a1
   24bb6:	8b36                	mv	s6,a3
   24bb8:	4a81                	li	s5,0
   24bba:	00c77763          	bgeu	a4,a2,24bc8 <_scanf_float+0x3e>
   24bbe:	ea378a93          	add	s5,a5,-349
   24bc2:	15d00793          	li	a5,349
   24bc6:	c59c                	sw	a5,8(a1)
   24bc8:	401c                	lw	a5,0(s0)
   24bca:	01c40b93          	add	s7,s0,28
   24bce:	0002a637          	lui	a2,0x2a
   24bd2:	7807e793          	or	a5,a5,1920
   24bd6:	0002a837          	lui	a6,0x2a
   24bda:	0002a8b7          	lui	a7,0x2a
   24bde:	c01c                	sw	a5,0(s0)
   24be0:	84de                	mv	s1,s7
   24be2:	4901                	li	s2,0
   24be4:	4d81                	li	s11,0
   24be6:	4d01                	li	s10,0
   24be8:	4c81                	li	s9,0
   24bea:	4a01                	li	s4,0
   24bec:	4c01                	li	s8,0
   24bee:	04e00313          	li	t1,78
   24bf2:	06e00e13          	li	t3,110
   24bf6:	8c460613          	add	a2,a2,-1852 # 298c4 <__clz_tab+0x464>
   24bfa:	8c480813          	add	a6,a6,-1852 # 298c4 <__clz_tab+0x464>
   24bfe:	8fc88893          	add	a7,a7,-1796 # 298fc <__clz_tab+0x49c>
   24c02:	440c                	lw	a1,8(s0)
   24c04:	c195                	beqz	a1,24c28 <_scanf_float+0x9e>
   24c06:	0009a783          	lw	a5,0(s3)
   24c0a:	0007c783          	lbu	a5,0(a5)
   24c0e:	08f36263          	bltu	t1,a5,24c92 <_scanf_float+0x108>
   24c12:	04000713          	li	a4,64
   24c16:	06f76063          	bltu	a4,a5,24c76 <_scanf_float+0xec>
   24c1a:	fd578713          	add	a4,a5,-43
   24c1e:	0ff77713          	zext.b	a4,a4
   24c22:	4539                	li	a0,14
   24c24:	06e57363          	bgeu	a0,a4,24c8a <_scanf_float+0x100>
   24c28:	000a0663          	beqz	s4,24c34 <_scanf_float+0xaa>
   24c2c:	401c                	lw	a5,0(s0)
   24c2e:	eff7f793          	and	a5,a5,-257
   24c32:	c01c                	sw	a5,0(s0)
   24c34:	1dfd                	add	s11,s11,-1
   24c36:	4785                	li	a5,1
   24c38:	21b7e863          	bltu	a5,s11,24e48 <_scanf_float+0x2be>
   24c3c:	1e9bea63          	bltu	s7,s1,24e30 <_scanf_float+0x2a6>
   24c40:	4505                	li	a0,1
   24c42:	40f6                	lw	ra,92(sp)
   24c44:	4466                	lw	s0,88(sp)
   24c46:	44d6                	lw	s1,84(sp)
   24c48:	4946                	lw	s2,80(sp)
   24c4a:	49b6                	lw	s3,76(sp)
   24c4c:	4a26                	lw	s4,72(sp)
   24c4e:	4a96                	lw	s5,68(sp)
   24c50:	4b06                	lw	s6,64(sp)
   24c52:	5bf2                	lw	s7,60(sp)
   24c54:	5c62                	lw	s8,56(sp)
   24c56:	5cd2                	lw	s9,52(sp)
   24c58:	5d42                	lw	s10,48(sp)
   24c5a:	5db2                	lw	s11,44(sp)
   24c5c:	6125                	add	sp,sp,96
   24c5e:	8082                	ret
   24c60:	f9f78713          	add	a4,a5,-97
   24c64:	0ff77713          	zext.b	a4,a4
   24c68:	45b5                	li	a1,13
   24c6a:	fae5efe3          	bltu	a1,a4,24c28 <_scanf_float+0x9e>
   24c6e:	070a                	sll	a4,a4,0x2
   24c70:	9732                	add	a4,a4,a2
   24c72:	4318                	lw	a4,0(a4)
   24c74:	8702                	jr	a4
   24c76:	fbf78713          	add	a4,a5,-65
   24c7a:	0ff77713          	zext.b	a4,a4
   24c7e:	45b5                	li	a1,13
   24c80:	fae5e4e3          	bltu	a1,a4,24c28 <_scanf_float+0x9e>
   24c84:	070a                	sll	a4,a4,0x2
   24c86:	9742                	add	a4,a4,a6
   24c88:	b7ed                	j	24c72 <_scanf_float+0xe8>
   24c8a:	070a                	sll	a4,a4,0x2
   24c8c:	9746                	add	a4,a4,a7
   24c8e:	4318                	lw	a4,0(a4)
   24c90:	8702                	jr	a4
   24c92:	02fe6363          	bltu	t3,a5,24cb8 <_scanf_float+0x12e>
   24c96:	06000713          	li	a4,96
   24c9a:	fcf763e3          	bltu	a4,a5,24c60 <_scanf_float+0xd6>
   24c9e:	05400713          	li	a4,84
   24ca2:	10e78463          	beq	a5,a4,24daa <_scanf_float+0x220>
   24ca6:	05900713          	li	a4,89
   24caa:	f6e79fe3          	bne	a5,a4,24c28 <_scanf_float+0x9e>
   24cae:	471d                	li	a4,7
   24cb0:	f6e91ce3          	bne	s2,a4,24c28 <_scanf_float+0x9e>
   24cb4:	4921                	li	s2,8
   24cb6:	a08d                	j	24d18 <_scanf_float+0x18e>
   24cb8:	07400713          	li	a4,116
   24cbc:	0ee78763          	beq	a5,a4,24daa <_scanf_float+0x220>
   24cc0:	07900713          	li	a4,121
   24cc4:	b7dd                	j	24caa <_scanf_float+0x120>
   24cc6:	4018                	lw	a4,0(s0)
   24cc8:	10077513          	and	a0,a4,256
   24ccc:	cd0d                	beqz	a0,24d06 <_scanf_float+0x17c>
   24cce:	f7f77713          	and	a4,a4,-129
   24cd2:	c018                	sw	a4,0(s0)
   24cd4:	0a05                	add	s4,s4,1
   24cd6:	000a8563          	beqz	s5,24ce0 <_scanf_float+0x156>
   24cda:	0585                	add	a1,a1,1
   24cdc:	1afd                	add	s5,s5,-1
   24cde:	c40c                	sw	a1,8(s0)
   24ce0:	441c                	lw	a5,8(s0)
   24ce2:	17fd                	add	a5,a5,-1
   24ce4:	c41c                	sw	a5,8(s0)
   24ce6:	481c                	lw	a5,16(s0)
   24ce8:	0785                	add	a5,a5,1
   24cea:	c81c                	sw	a5,16(s0)
   24cec:	0049a783          	lw	a5,4(s3)
   24cf0:	17fd                	add	a5,a5,-1
   24cf2:	00f9a223          	sw	a5,4(s3)
   24cf6:	10f05563          	blez	a5,24e00 <_scanf_float+0x276>
   24cfa:	0009a783          	lw	a5,0(s3)
   24cfe:	0785                	add	a5,a5,1
   24d00:	00f9a023          	sw	a5,0(s3)
   24d04:	bdfd                	j	24c02 <_scanf_float+0x78>
   24d06:	012d8733          	add	a4,s11,s2
   24d0a:	ff19                	bnez	a4,24c28 <_scanf_float+0x9e>
   24d0c:	4018                	lw	a4,0(s0)
   24d0e:	4901                	li	s2,0
   24d10:	4d81                	li	s11,0
   24d12:	e7f77713          	and	a4,a4,-385
   24d16:	c018                	sw	a4,0(s0)
   24d18:	00f48023          	sb	a5,0(s1)
   24d1c:	0485                	add	s1,s1,1
   24d1e:	b7c9                	j	24ce0 <_scanf_float+0x156>
   24d20:	4018                	lw	a4,0(s0)
   24d22:	08077593          	and	a1,a4,128
   24d26:	d189                	beqz	a1,24c28 <_scanf_float+0x9e>
   24d28:	f7f77713          	and	a4,a4,-129
   24d2c:	c018                	sw	a4,0(s0)
   24d2e:	b7ed                	j	24d18 <_scanf_float+0x18e>
   24d30:	020d9063          	bnez	s11,24d50 <_scanf_float+0x1c6>
   24d34:	020a1163          	bnez	s4,24d56 <_scanf_float+0x1cc>
   24d38:	4018                	lw	a4,0(s0)
   24d3a:	70000593          	li	a1,1792
   24d3e:	70077513          	and	a0,a4,1792
   24d42:	00b51a63          	bne	a0,a1,24d56 <_scanf_float+0x1cc>
   24d46:	87f77713          	and	a4,a4,-1921
   24d4a:	c018                	sw	a4,0(s0)
   24d4c:	4d85                	li	s11,1
   24d4e:	b7e9                	j	24d18 <_scanf_float+0x18e>
   24d50:	4709                	li	a4,2
   24d52:	0aed8563          	beq	s11,a4,24dfc <_scanf_float+0x272>
   24d56:	4705                	li	a4,1
   24d58:	00e90563          	beq	s2,a4,24d62 <_scanf_float+0x1d8>
   24d5c:	4711                	li	a4,4
   24d5e:	ece915e3          	bne	s2,a4,24c28 <_scanf_float+0x9e>
   24d62:	0905                	add	s2,s2,1
   24d64:	0ff97913          	zext.b	s2,s2
   24d68:	bf45                	j	24d18 <_scanf_float+0x18e>
   24d6a:	4705                	li	a4,1
   24d6c:	eaed9ee3          	bne	s11,a4,24c28 <_scanf_float+0x9e>
   24d70:	4d89                	li	s11,2
   24d72:	b75d                	j	24d18 <_scanf_float+0x18e>
   24d74:	02091063          	bnez	s2,24d94 <_scanf_float+0x20a>
   24d78:	ea0a1ae3          	bnez	s4,24c2c <_scanf_float+0xa2>
   24d7c:	4018                	lw	a4,0(s0)
   24d7e:	70000593          	li	a1,1792
   24d82:	70077513          	and	a0,a4,1792
   24d86:	26b51b63          	bne	a0,a1,24ffc <_scanf_float+0x472>
   24d8a:	87f77713          	and	a4,a4,-1921
   24d8e:	c018                	sw	a4,0(s0)
   24d90:	4905                	li	s2,1
   24d92:	b759                	j	24d18 <_scanf_float+0x18e>
   24d94:	ffd90713          	add	a4,s2,-3
   24d98:	0fd77713          	and	a4,a4,253
   24d9c:	d379                	beqz	a4,24d62 <_scanf_float+0x1d8>
   24d9e:	b569                	j	24c28 <_scanf_float+0x9e>
   24da0:	4709                	li	a4,2
   24da2:	e8e913e3          	bne	s2,a4,24c28 <_scanf_float+0x9e>
   24da6:	490d                	li	s2,3
   24da8:	bf85                	j	24d18 <_scanf_float+0x18e>
   24daa:	4719                	li	a4,6
   24dac:	e6e91ee3          	bne	s2,a4,24c28 <_scanf_float+0x9e>
   24db0:	491d                	li	s2,7
   24db2:	b79d                	j	24d18 <_scanf_float+0x18e>
   24db4:	4018                	lw	a4,0(s0)
   24db6:	20077593          	and	a1,a4,512
   24dba:	e60587e3          	beqz	a1,24c28 <_scanf_float+0x9e>
   24dbe:	d7f77713          	and	a4,a4,-641
   24dc2:	c018                	sw	a4,0(s0)
   24dc4:	8c52                	mv	s8,s4
   24dc6:	bf89                	j	24d18 <_scanf_float+0x18e>
   24dc8:	4018                	lw	a4,0(s0)
   24dca:	40000593          	li	a1,1024
   24dce:	50077513          	and	a0,a4,1280
   24dd2:	00b50863          	beq	a0,a1,24de2 <_scanf_float+0x258>
   24dd6:	40077593          	and	a1,a4,1024
   24dda:	e40587e3          	beqz	a1,24c28 <_scanf_float+0x9e>
   24dde:	200a0f63          	beqz	s4,24ffc <_scanf_float+0x472>
   24de2:	20077593          	and	a1,a4,512
   24de6:	e581                	bnez	a1,24dee <_scanf_float+0x264>
   24de8:	418a0cb3          	sub	s9,s4,s8
   24dec:	8d26                	mv	s10,s1
   24dee:	87f77713          	and	a4,a4,-1921
   24df2:	18076713          	or	a4,a4,384
   24df6:	c018                	sw	a4,0(s0)
   24df8:	4a01                	li	s4,0
   24dfa:	bf39                	j	24d18 <_scanf_float+0x18e>
   24dfc:	4d8d                	li	s11,3
   24dfe:	bf29                	j	24d18 <_scanf_float+0x18e>
   24e00:	18042783          	lw	a5,384(s0)
   24e04:	4522                	lw	a0,8(sp)
   24e06:	85ce                	mv	a1,s3
   24e08:	9782                	jalr	a5
   24e0a:	0002a7b7          	lui	a5,0x2a
   24e0e:	8c478613          	add	a2,a5,-1852 # 298c4 <__clz_tab+0x464>
   24e12:	0002a7b7          	lui	a5,0x2a
   24e16:	8c478813          	add	a6,a5,-1852 # 298c4 <__clz_tab+0x464>
   24e1a:	0002a7b7          	lui	a5,0x2a
   24e1e:	04e00313          	li	t1,78
   24e22:	06e00e13          	li	t3,110
   24e26:	8fc78893          	add	a7,a5,-1796 # 298fc <__clz_tab+0x49c>
   24e2a:	dc050ce3          	beqz	a0,24c02 <_scanf_float+0x78>
   24e2e:	bbed                	j	24c28 <_scanf_float+0x9e>
   24e30:	17c42783          	lw	a5,380(s0)
   24e34:	4522                	lw	a0,8(sp)
   24e36:	fff4c583          	lbu	a1,-1(s1)
   24e3a:	864e                	mv	a2,s3
   24e3c:	14fd                	add	s1,s1,-1
   24e3e:	9782                	jalr	a5
   24e40:	481c                	lw	a5,16(s0)
   24e42:	17fd                	add	a5,a5,-1
   24e44:	c81c                	sw	a5,16(s0)
   24e46:	bbdd                	j	24c3c <_scanf_float+0xb2>
   24e48:	fff90793          	add	a5,s2,-1
   24e4c:	4719                	li	a4,6
   24e4e:	02f76663          	bltu	a4,a5,24e7a <_scanf_float+0x2f0>
   24e52:	4789                	li	a5,2
   24e54:	8da6                	mv	s11,s1
   24e56:	0927f063          	bgeu	a5,s2,24ed6 <_scanf_float+0x34c>
   24e5a:	40990733          	sub	a4,s2,s1
   24e5e:	0ff77713          	zext.b	a4,a4
   24e62:	4a8d                	li	s5,3
   24e64:	00ed87b3          	add	a5,s11,a4
   24e68:	0ff7f793          	zext.b	a5,a5
   24e6c:	03579c63          	bne	a5,s5,24ea4 <_scanf_float+0x31a>
   24e70:	1975                	add	s2,s2,-3
   24e72:	0ff97913          	zext.b	s2,s2
   24e76:	412484b3          	sub	s1,s1,s2
   24e7a:	401c                	lw	a5,0(s0)
   24e7c:	1007f713          	and	a4,a5,256
   24e80:	cf59                	beqz	a4,24f1e <_scanf_float+0x394>
   24e82:	4007f793          	and	a5,a5,1024
   24e86:	cbb9                	beqz	a5,24edc <_scanf_float+0x352>
   24e88:	da9bfce3          	bgeu	s7,s1,24c40 <_scanf_float+0xb6>
   24e8c:	17c42783          	lw	a5,380(s0)
   24e90:	4522                	lw	a0,8(sp)
   24e92:	fff4c583          	lbu	a1,-1(s1)
   24e96:	864e                	mv	a2,s3
   24e98:	14fd                	add	s1,s1,-1
   24e9a:	9782                	jalr	a5
   24e9c:	481c                	lw	a5,16(s0)
   24e9e:	17fd                	add	a5,a5,-1
   24ea0:	c81c                	sw	a5,16(s0)
   24ea2:	b7dd                	j	24e88 <_scanf_float+0x2fe>
   24ea4:	17c42783          	lw	a5,380(s0)
   24ea8:	4522                	lw	a0,8(sp)
   24eaa:	fffdc583          	lbu	a1,-1(s11)
   24eae:	864e                	mv	a2,s3
   24eb0:	c63a                	sw	a4,12(sp)
   24eb2:	9782                	jalr	a5
   24eb4:	481c                	lw	a5,16(s0)
   24eb6:	1dfd                	add	s11,s11,-1
   24eb8:	4732                	lw	a4,12(sp)
   24eba:	17fd                	add	a5,a5,-1
   24ebc:	c81c                	sw	a5,16(s0)
   24ebe:	b75d                	j	24e64 <_scanf_float+0x2da>
   24ec0:	17c42783          	lw	a5,380(s0)
   24ec4:	4522                	lw	a0,8(sp)
   24ec6:	fff4c583          	lbu	a1,-1(s1)
   24eca:	864e                	mv	a2,s3
   24ecc:	14fd                	add	s1,s1,-1
   24ece:	9782                	jalr	a5
   24ed0:	481c                	lw	a5,16(s0)
   24ed2:	17fd                	add	a5,a5,-1
   24ed4:	c81c                	sw	a5,16(s0)
   24ed6:	fe9be5e3          	bltu	s7,s1,24ec0 <_scanf_float+0x336>
   24eda:	b39d                	j	24c40 <_scanf_float+0xb6>
   24edc:	481c                	lw	a5,16(s0)
   24ede:	fff4c583          	lbu	a1,-1(s1)
   24ee2:	fff48913          	add	s2,s1,-1
   24ee6:	17fd                	add	a5,a5,-1
   24ee8:	c81c                	sw	a5,16(s0)
   24eea:	06500793          	li	a5,101
   24eee:	02f58263          	beq	a1,a5,24f12 <_scanf_float+0x388>
   24ef2:	04500793          	li	a5,69
   24ef6:	00f58e63          	beq	a1,a5,24f12 <_scanf_float+0x388>
   24efa:	17c42783          	lw	a5,380(s0)
   24efe:	4522                	lw	a0,8(sp)
   24f00:	864e                	mv	a2,s3
   24f02:	ffe48913          	add	s2,s1,-2
   24f06:	9782                	jalr	a5
   24f08:	481c                	lw	a5,16(s0)
   24f0a:	ffe4c583          	lbu	a1,-2(s1)
   24f0e:	17fd                	add	a5,a5,-1
   24f10:	c81c                	sw	a5,16(s0)
   24f12:	17c42783          	lw	a5,380(s0)
   24f16:	4522                	lw	a0,8(sp)
   24f18:	864e                	mv	a2,s3
   24f1a:	84ca                	mv	s1,s2
   24f1c:	9782                	jalr	a5
   24f1e:	401c                	lw	a5,0(s0)
   24f20:	8bc1                	and	a5,a5,16
   24f22:	c399                	beqz	a5,24f28 <_scanf_float+0x39e>
   24f24:	4501                	li	a0,0
   24f26:	bb31                	j	24c42 <_scanf_float+0xb8>
   24f28:	00048023          	sb	zero,0(s1)
   24f2c:	401c                	lw	a5,0(s0)
   24f2e:	40000713          	li	a4,1024
   24f32:	6007f793          	and	a5,a5,1536
   24f36:	02e79e63          	bne	a5,a4,24f72 <_scanf_float+0x3e8>
   24f3a:	414c0633          	sub	a2,s8,s4
   24f3e:	054c1663          	bne	s8,s4,24f8a <_scanf_float+0x400>
   24f42:	4522                	lw	a0,8(sp)
   24f44:	4601                	li	a2,0
   24f46:	85de                	mv	a1,s7
   24f48:	7cd000ef          	jal	25f14 <_strtod_r>
   24f4c:	4018                	lw	a4,0(s0)
   24f4e:	000b2783          	lw	a5,0(s6)
   24f52:	892a                	mv	s2,a0
   24f54:	00277693          	and	a3,a4,2
   24f58:	84ae                	mv	s1,a1
   24f5a:	c6a9                	beqz	a3,24fa4 <_scanf_float+0x41a>
   24f5c:	00478713          	add	a4,a5,4
   24f60:	00eb2023          	sw	a4,0(s6)
   24f64:	4394                	lw	a3,0(a5)
   24f66:	c288                	sw	a0,0(a3)
   24f68:	c2cc                	sw	a1,4(a3)
   24f6a:	445c                	lw	a5,12(s0)
   24f6c:	0785                	add	a5,a5,1
   24f6e:	c45c                	sw	a5,12(s0)
   24f70:	bf55                	j	24f24 <_scanf_float+0x39a>
   24f72:	fc0c88e3          	beqz	s9,24f42 <_scanf_float+0x3b8>
   24f76:	4522                	lw	a0,8(sp)
   24f78:	4601                	li	a2,0
   24f7a:	46a9                	li	a3,10
   24f7c:	001d0593          	add	a1,s10,1
   24f80:	0d6010ef          	jal	26056 <_strtol_r>
   24f84:	41950633          	sub	a2,a0,s9
   24f88:	84ea                	mv	s1,s10
   24f8a:	16f40793          	add	a5,s0,367
   24f8e:	00f4e463          	bltu	s1,a5,24f96 <_scanf_float+0x40c>
   24f92:	16e40493          	add	s1,s0,366
   24f96:	000295b7          	lui	a1,0x29
   24f9a:	5c458593          	add	a1,a1,1476 # 295c4 <__clz_tab+0x164>
   24f9e:	8526                	mv	a0,s1
   24fa0:	2c0d                	jal	251d2 <siprintf>
   24fa2:	b745                	j	24f42 <_scanf_float+0x3b8>
   24fa4:	00478693          	add	a3,a5,4
   24fa8:	00db2023          	sw	a3,0(s6)
   24fac:	8b11                	and	a4,a4,4
   24fae:	0007a983          	lw	s3,0(a5)
   24fb2:	c31d                	beqz	a4,24fd8 <_scanf_float+0x44e>
   24fb4:	85aa                	mv	a1,a0
   24fb6:	8626                	mv	a2,s1
   24fb8:	0808                	add	a0,sp,16
   24fba:	8cffd0ef          	jal	22888 <__extenddftf2>
   24fbe:	4642                	lw	a2,16(sp)
   24fc0:	46d2                	lw	a3,20(sp)
   24fc2:	4762                	lw	a4,24(sp)
   24fc4:	47f2                	lw	a5,28(sp)
   24fc6:	00c9a023          	sw	a2,0(s3)
   24fca:	00d9a223          	sw	a3,4(s3)
   24fce:	00e9a423          	sw	a4,8(s3)
   24fd2:	00f9a623          	sw	a5,12(s3)
   24fd6:	bf51                	j	24f6a <_scanf_float+0x3e0>
   24fd8:	862a                	mv	a2,a0
   24fda:	86ae                	mv	a3,a1
   24fdc:	d9efd0ef          	jal	2257a <__unorddf2>
   24fe0:	c909                	beqz	a0,24ff2 <_scanf_float+0x468>
   24fe2:	00029537          	lui	a0,0x29
   24fe6:	73450513          	add	a0,a0,1844 # 29734 <__clz_tab+0x2d4>
   24fea:	2af9                	jal	251c8 <nanf>
   24fec:	00a9a023          	sw	a0,0(s3)
   24ff0:	bfad                	j	24f6a <_scanf_float+0x3e0>
   24ff2:	854a                	mv	a0,s2
   24ff4:	85a6                	mv	a1,s1
   24ff6:	a03fd0ef          	jal	229f8 <__truncdfsf2>
   24ffa:	bfcd                	j	24fec <_scanf_float+0x462>
   24ffc:	4a01                	li	s4,0
   24ffe:	b91d                	j	24c34 <_scanf_float+0xaa>

00025000 <iprintf>:
   25000:	715d                	add	sp,sp,-80
   25002:	c2be                	sw	a5,68(sp)
   25004:	d422                	sw	s0,40(sp)
   25006:	842a                	mv	s0,a0
   25008:	9cc1a503          	lw	a0,-1588(gp) # a01cc <_impure_ptr>
   2500c:	d606                	sw	ra,44(sp)
   2500e:	da2e                	sw	a1,52(sp)
   25010:	dc32                	sw	a2,56(sp)
   25012:	de36                	sw	a3,60(sp)
   25014:	c0ba                	sw	a4,64(sp)
   25016:	c4c2                	sw	a6,72(sp)
   25018:	c6c6                	sw	a7,76(sp)
   2501a:	c519                	beqz	a0,25028 <iprintf+0x28>
   2501c:	4d1c                	lw	a5,24(a0)
   2501e:	e789                	bnez	a5,25028 <iprintf+0x28>
   25020:	c62a                	sw	a0,12(sp)
   25022:	7f1010ef          	jal	27012 <__sinit>
   25026:	4532                	lw	a0,12(sp)
   25028:	450c                	lw	a1,8(a0)
   2502a:	1854                	add	a3,sp,52
   2502c:	8622                	mv	a2,s0
   2502e:	ce36                	sw	a3,28(sp)
   25030:	2ef030ef          	jal	28b1e <_vfiprintf_r>
   25034:	50b2                	lw	ra,44(sp)
   25036:	5422                	lw	s0,40(sp)
   25038:	6161                	add	sp,sp,80
   2503a:	8082                	ret

0002503c <setvbuf>:
   2503c:	7179                	add	sp,sp,-48
   2503e:	ce4e                	sw	s3,28(sp)
   25040:	9cc1a983          	lw	s3,-1588(gp) # a01cc <_impure_ptr>
   25044:	d422                	sw	s0,40(sp)
   25046:	d226                	sw	s1,36(sp)
   25048:	d04a                	sw	s2,32(sp)
   2504a:	cc52                	sw	s4,24(sp)
   2504c:	d606                	sw	ra,44(sp)
   2504e:	ca56                	sw	s5,20(sp)
   25050:	842a                	mv	s0,a0
   25052:	892e                	mv	s2,a1
   25054:	8a32                	mv	s4,a2
   25056:	84b6                	mv	s1,a3
   25058:	00098863          	beqz	s3,25068 <setvbuf+0x2c>
   2505c:	0189a783          	lw	a5,24(s3)
   25060:	e781                	bnez	a5,25068 <setvbuf+0x2c>
   25062:	854e                	mv	a0,s3
   25064:	7af010ef          	jal	27012 <__sinit>
   25068:	0002a7b7          	lui	a5,0x2a
   2506c:	ae478793          	add	a5,a5,-1308 # 29ae4 <__sf_fake_stdin>
   25070:	0cf41263          	bne	s0,a5,25134 <setvbuf+0xf8>
   25074:	0049a403          	lw	s0,4(s3)
   25078:	4789                	li	a5,2
   2507a:	00fa0863          	beq	s4,a5,2508a <setvbuf+0x4e>
   2507e:	4785                	li	a5,1
   25080:	557d                	li	a0,-1
   25082:	0b47e063          	bltu	a5,s4,25122 <setvbuf+0xe6>
   25086:	0804ce63          	bltz	s1,25122 <setvbuf+0xe6>
   2508a:	85a2                	mv	a1,s0
   2508c:	854e                	mv	a0,s3
   2508e:	665010ef          	jal	26ef2 <_fflush_r>
   25092:	584c                	lw	a1,52(s0)
   25094:	c991                	beqz	a1,250a8 <setvbuf+0x6c>
   25096:	04440793          	add	a5,s0,68
   2509a:	00f58563          	beq	a1,a5,250a4 <setvbuf+0x68>
   2509e:	854e                	mv	a0,s3
   250a0:	534030ef          	jal	285d4 <_free_r>
   250a4:	02042a23          	sw	zero,52(s0)
   250a8:	00c45783          	lhu	a5,12(s0)
   250ac:	00042c23          	sw	zero,24(s0)
   250b0:	00042223          	sw	zero,4(s0)
   250b4:	0807f793          	and	a5,a5,128
   250b8:	c789                	beqz	a5,250c2 <setvbuf+0x86>
   250ba:	480c                	lw	a1,16(s0)
   250bc:	854e                	mv	a0,s3
   250be:	516030ef          	jal	285d4 <_free_r>
   250c2:	00c45783          	lhu	a5,12(s0)
   250c6:	777d                	lui	a4,0xfffff
   250c8:	35c70713          	add	a4,a4,860 # fffff35c <__share_mem_end__+0xfef3f35c>
   250cc:	8ff9                	and	a5,a5,a4
   250ce:	00f41623          	sh	a5,12(s0)
   250d2:	4789                	li	a5,2
   250d4:	0efa0363          	beq	s4,a5,251ba <setvbuf+0x17e>
   250d8:	0074                	add	a3,sp,12
   250da:	0030                	add	a2,sp,8
   250dc:	85a2                	mv	a1,s0
   250de:	854e                	mv	a0,s3
   250e0:	027020ef          	jal	27906 <__swhatbuf_r>
   250e4:	00c45783          	lhu	a5,12(s0)
   250e8:	8fc9                	or	a5,a5,a0
   250ea:	00f41623          	sh	a5,12(s0)
   250ee:	e4ad                	bnez	s1,25158 <setvbuf+0x11c>
   250f0:	44a2                	lw	s1,8(sp)
   250f2:	8526                	mv	a0,s1
   250f4:	115020ef          	jal	27a08 <malloc>
   250f8:	892a                	mv	s2,a0
   250fa:	8aa6                	mv	s5,s1
   250fc:	e55d                	bnez	a0,251aa <setvbuf+0x16e>
   250fe:	4aa2                	lw	s5,8(sp)
   25100:	0a9a9063          	bne	s5,s1,251a0 <setvbuf+0x164>
   25104:	557d                	li	a0,-1
   25106:	00c45783          	lhu	a5,12(s0)
   2510a:	00042423          	sw	zero,8(s0)
   2510e:	0027e793          	or	a5,a5,2
   25112:	00f41623          	sh	a5,12(s0)
   25116:	04740793          	add	a5,s0,71
   2511a:	c01c                	sw	a5,0(s0)
   2511c:	c81c                	sw	a5,16(s0)
   2511e:	4785                	li	a5,1
   25120:	c85c                	sw	a5,20(s0)
   25122:	50b2                	lw	ra,44(sp)
   25124:	5422                	lw	s0,40(sp)
   25126:	5492                	lw	s1,36(sp)
   25128:	5902                	lw	s2,32(sp)
   2512a:	49f2                	lw	s3,28(sp)
   2512c:	4a62                	lw	s4,24(sp)
   2512e:	4ad2                	lw	s5,20(sp)
   25130:	6145                	add	sp,sp,48
   25132:	8082                	ret
   25134:	0002a7b7          	lui	a5,0x2a
   25138:	ac478793          	add	a5,a5,-1340 # 29ac4 <__sf_fake_stdout>
   2513c:	00f41563          	bne	s0,a5,25146 <setvbuf+0x10a>
   25140:	0089a403          	lw	s0,8(s3)
   25144:	bf15                	j	25078 <setvbuf+0x3c>
   25146:	0002a7b7          	lui	a5,0x2a
   2514a:	aa478793          	add	a5,a5,-1372 # 29aa4 <__sf_fake_stderr>
   2514e:	f2f415e3          	bne	s0,a5,25078 <setvbuf+0x3c>
   25152:	00c9a403          	lw	s0,12(s3)
   25156:	b70d                	j	25078 <setvbuf+0x3c>
   25158:	f8090de3          	beqz	s2,250f2 <setvbuf+0xb6>
   2515c:	0189a783          	lw	a5,24(s3)
   25160:	e781                	bnez	a5,25168 <setvbuf+0x12c>
   25162:	854e                	mv	a0,s3
   25164:	6af010ef          	jal	27012 <__sinit>
   25168:	4785                	li	a5,1
   2516a:	00fa1863          	bne	s4,a5,2517a <setvbuf+0x13e>
   2516e:	00c45783          	lhu	a5,12(s0)
   25172:	0017e793          	or	a5,a5,1
   25176:	00f41623          	sh	a5,12(s0)
   2517a:	00c41783          	lh	a5,12(s0)
   2517e:	01242023          	sw	s2,0(s0)
   25182:	01242823          	sw	s2,16(s0)
   25186:	c844                	sw	s1,20(s0)
   25188:	0087f713          	and	a4,a5,8
   2518c:	cb1d                	beqz	a4,251c2 <setvbuf+0x186>
   2518e:	8b85                	and	a5,a5,1
   25190:	c79d                	beqz	a5,251be <setvbuf+0x182>
   25192:	409004b3          	neg	s1,s1
   25196:	00042423          	sw	zero,8(s0)
   2519a:	cc04                	sw	s1,24(s0)
   2519c:	4501                	li	a0,0
   2519e:	b751                	j	25122 <setvbuf+0xe6>
   251a0:	8556                	mv	a0,s5
   251a2:	067020ef          	jal	27a08 <malloc>
   251a6:	892a                	mv	s2,a0
   251a8:	dd31                	beqz	a0,25104 <setvbuf+0xc8>
   251aa:	00c45783          	lhu	a5,12(s0)
   251ae:	84d6                	mv	s1,s5
   251b0:	0807e793          	or	a5,a5,128
   251b4:	00f41623          	sh	a5,12(s0)
   251b8:	b755                	j	2515c <setvbuf+0x120>
   251ba:	4501                	li	a0,0
   251bc:	b7a9                	j	25106 <setvbuf+0xca>
   251be:	c404                	sw	s1,8(s0)
   251c0:	bff1                	j	2519c <setvbuf+0x160>
   251c2:	00042423          	sw	zero,8(s0)
   251c6:	bfd9                	j	2519c <setvbuf+0x160>

000251c8 <nanf>:
   251c8:	0002a7b7          	lui	a5,0x2a
   251cc:	cb87a503          	lw	a0,-840(a5) # 29cb8 <_global_impure_ptr+0x90>
   251d0:	8082                	ret

000251d2 <siprintf>:
   251d2:	7135                	add	sp,sp,-160
   251d4:	cb3e                	sw	a5,148(sp)
   251d6:	800007b7          	lui	a5,0x80000
   251da:	17fd                	add	a5,a5,-1 # 7fffffff <__share_mem_end__+0x7ef3ffff>
   251dc:	ce3e                	sw	a5,28(sp)
   251de:	c83e                	sw	a5,16(sp)
   251e0:	77c1                	lui	a5,0xffff0
   251e2:	20878793          	add	a5,a5,520 # ffff0208 <__share_mem_end__+0xfef30208>
   251e6:	ca3e                	sw	a5,20(sp)
   251e8:	c42a                	sw	a0,8(sp)
   251ea:	cc2a                	sw	a0,24(sp)
   251ec:	9cc1a503          	lw	a0,-1588(gp) # a01cc <_impure_ptr>
   251f0:	c532                	sw	a2,136(sp)
   251f2:	c736                	sw	a3,140(sp)
   251f4:	862e                	mv	a2,a1
   251f6:	0134                	add	a3,sp,136
   251f8:	002c                	add	a1,sp,8
   251fa:	de86                	sw	ra,124(sp)
   251fc:	c93a                	sw	a4,144(sp)
   251fe:	cd42                	sw	a6,152(sp)
   25200:	cf46                	sw	a7,156(sp)
   25202:	c236                	sw	a3,4(sp)
   25204:	634030ef          	jal	28838 <_svfiprintf_r>
   25208:	47a2                	lw	a5,8(sp)
   2520a:	00078023          	sb	zero,0(a5)
   2520e:	50f6                	lw	ra,124(sp)
   25210:	610d                	add	sp,sp,160
   25212:	8082                	ret

00025214 <strlen>:
   25214:	87aa                	mv	a5,a0
   25216:	0007c703          	lbu	a4,0(a5)
   2521a:	0785                	add	a5,a5,1
   2521c:	ff6d                	bnez	a4,25216 <strlen+0x2>
   2521e:	40a78533          	sub	a0,a5,a0
   25222:	157d                	add	a0,a0,-1
   25224:	8082                	ret

00025226 <sulp>:
   25226:	1141                	add	sp,sp,-16
   25228:	872a                	mv	a4,a0
   2522a:	c422                	sw	s0,8(sp)
   2522c:	842e                	mv	s0,a1
   2522e:	853a                	mv	a0,a4
   25230:	85a2                	mv	a1,s0
   25232:	c226                	sw	s1,4(sp)
   25234:	c606                	sw	ra,12(sp)
   25236:	84b2                	mv	s1,a2
   25238:	08a030ef          	jal	282c2 <__ulp>
   2523c:	872a                	mv	a4,a0
   2523e:	87ae                	mv	a5,a1
   25240:	c485                	beqz	s1,25268 <sulp+0x42>
   25242:	8051                	srl	s0,s0,0x14
   25244:	7ff47413          	and	s0,s0,2047
   25248:	06b00693          	li	a3,107
   2524c:	8e81                	sub	a3,a3,s0
   2524e:	00d05d63          	blez	a3,25268 <sulp+0x42>
   25252:	06d2                	sll	a3,a3,0x14
   25254:	3ff007b7          	lui	a5,0x3ff00
   25258:	4701                	li	a4,0
   2525a:	97b6                	add	a5,a5,a3
   2525c:	863a                	mv	a2,a4
   2525e:	86be                	mv	a3,a5
   25260:	fb9fb0ef          	jal	21218 <__muldf3>
   25264:	872a                	mv	a4,a0
   25266:	87ae                	mv	a5,a1
   25268:	40b2                	lw	ra,12(sp)
   2526a:	4422                	lw	s0,8(sp)
   2526c:	4492                	lw	s1,4(sp)
   2526e:	853a                	mv	a0,a4
   25270:	85be                	mv	a1,a5
   25272:	0141                	add	sp,sp,16
   25274:	8082                	ret

00025276 <_strtod_l>:
   25276:	7171                	add	sp,sp,-176
   25278:	0002a7b7          	lui	a5,0x2a
   2527c:	c95a                	sw	s6,144(sp)
   2527e:	8b2e                	mv	s6,a1
   25280:	b047a583          	lw	a1,-1276(a5) # 29b04 <_C_numeric_locale>
   25284:	c42a                	sw	a0,8(sp)
   25286:	d522                	sw	s0,168(sp)
   25288:	852e                	mv	a0,a1
   2528a:	d326                	sw	s1,164(sp)
   2528c:	cf4e                	sw	s3,156(sp)
   2528e:	c836                	sw	a3,16(sp)
   25290:	c62e                	sw	a1,12(sp)
   25292:	d706                	sw	ra,172(sp)
   25294:	d14a                	sw	s2,160(sp)
   25296:	cd52                	sw	s4,152(sp)
   25298:	cb56                	sw	s5,148(sp)
   2529a:	c75e                	sw	s7,140(sp)
   2529c:	c562                	sw	s8,136(sp)
   2529e:	c366                	sw	s9,132(sp)
   252a0:	c16a                	sw	s10,128(sp)
   252a2:	deee                	sw	s11,124(sp)
   252a4:	d232                	sw	a2,36(sp)
   252a6:	d082                	sw	zero,96(sp)
   252a8:	37b5                	jal	25214 <strlen>
   252aa:	4842                	lw	a6,16(sp)
   252ac:	45b2                	lw	a1,12(sp)
   252ae:	89aa                	mv	s3,a0
   252b0:	4481                	li	s1,0
   252b2:	4401                	li	s0,0
   252b4:	875a                	mv	a4,s6
   252b6:	02b00693          	li	a3,43
   252ba:	ceba                	sw	a4,92(sp)
   252bc:	00074783          	lbu	a5,0(a4)
   252c0:	0cd78663          	beq	a5,a3,2538c <_strtod_l+0x116>
   252c4:	08f6e363          	bltu	a3,a5,2534a <_strtod_l+0xd4>
   252c8:	4635                	li	a2,13
   252ca:	06f66a63          	bltu	a2,a5,2533e <_strtod_l+0xc8>
   252ce:	4621                	li	a2,8
   252d0:	06f66b63          	bltu	a2,a5,25346 <_strtod_l+0xd0>
   252d4:	c7d9                	beqz	a5,25362 <_strtod_l+0xec>
   252d6:	c602                	sw	zero,12(sp)
   252d8:	4af6                	lw	s5,92(sp)
   252da:	03000793          	li	a5,48
   252de:	4d01                	li	s10,0
   252e0:	000ac703          	lbu	a4,0(s5)
   252e4:	12f71663          	bne	a4,a5,25410 <_strtod_l+0x19a>
   252e8:	001ac783          	lbu	a5,1(s5)
   252ec:	05800693          	li	a3,88
   252f0:	03000713          	li	a4,48
   252f4:	0df7f793          	and	a5,a5,223
   252f8:	10d79263          	bne	a5,a3,253fc <_strtod_l+0x186>
   252fc:	47b2                	lw	a5,12(sp)
   252fe:	4522                	lw	a0,8(sp)
   25300:	0002a637          	lui	a2,0x2a
   25304:	1098                	add	a4,sp,96
   25306:	10d4                	add	a3,sp,100
   25308:	96060613          	add	a2,a2,-1696 # 29960 <fpi.1>
   2530c:	08ec                	add	a1,sp,92
   2530e:	763010ef          	jal	27270 <__gethex>
   25312:	00757993          	and	s3,a0,7
   25316:	8a2a                	mv	s4,a0
   25318:	00098863          	beqz	s3,25328 <_strtod_l+0xb2>
   2531c:	4799                	li	a5,6
   2531e:	06f99963          	bne	s3,a5,25390 <_strtod_l+0x11a>
   25322:	0a85                	add	s5,s5,1
   25324:	ced6                	sw	s5,92(sp)
   25326:	c602                	sw	zero,12(sp)
   25328:	5792                	lw	a5,36(sp)
   2532a:	c781                	beqz	a5,25332 <_strtod_l+0xbc>
   2532c:	47f6                	lw	a5,92(sp)
   2532e:	5712                	lw	a4,36(sp)
   25330:	c31c                	sw	a5,0(a4)
   25332:	47b2                	lw	a5,12(sp)
   25334:	cb9d                	beqz	a5,2536a <_strtod_l+0xf4>
   25336:	800007b7          	lui	a5,0x80000
   2533a:	8c3d                	xor	s0,s0,a5
   2533c:	a03d                	j	2536a <_strtod_l+0xf4>
   2533e:	02000613          	li	a2,32
   25342:	f8c79ae3          	bne	a5,a2,252d6 <_strtod_l+0x60>
   25346:	0705                	add	a4,a4,1
   25348:	bf8d                	j	252ba <_strtod_l+0x44>
   2534a:	02d00693          	li	a3,45
   2534e:	f8d794e3          	bne	a5,a3,252d6 <_strtod_l+0x60>
   25352:	4785                	li	a5,1
   25354:	c63e                	sw	a5,12(sp)
   25356:	00170793          	add	a5,a4,1
   2535a:	cebe                	sw	a5,92(sp)
   2535c:	00174783          	lbu	a5,1(a4)
   25360:	ffa5                	bnez	a5,252d8 <_strtod_l+0x62>
   25362:	5792                	lw	a5,36(sp)
   25364:	ceda                	sw	s6,92(sp)
   25366:	c602                	sw	zero,12(sp)
   25368:	f3f1                	bnez	a5,2532c <_strtod_l+0xb6>
   2536a:	50ba                	lw	ra,172(sp)
   2536c:	85a2                	mv	a1,s0
   2536e:	542a                	lw	s0,168(sp)
   25370:	590a                	lw	s2,160(sp)
   25372:	49fa                	lw	s3,156(sp)
   25374:	4a6a                	lw	s4,152(sp)
   25376:	4ada                	lw	s5,148(sp)
   25378:	4b4a                	lw	s6,144(sp)
   2537a:	4bba                	lw	s7,140(sp)
   2537c:	4c2a                	lw	s8,136(sp)
   2537e:	4c9a                	lw	s9,132(sp)
   25380:	4d0a                	lw	s10,128(sp)
   25382:	5df6                	lw	s11,124(sp)
   25384:	8526                	mv	a0,s1
   25386:	549a                	lw	s1,164(sp)
   25388:	614d                	add	sp,sp,176
   2538a:	8082                	ret
   2538c:	c602                	sw	zero,12(sp)
   2538e:	b7e1                	j	25356 <_strtod_l+0xe0>
   25390:	5606                	lw	a2,96(sp)
   25392:	ca11                	beqz	a2,253a6 <_strtod_l+0x130>
   25394:	03500593          	li	a1,53
   25398:	10a8                	add	a0,sp,104
   2539a:	174030ef          	jal	2850e <__copybits>
   2539e:	5586                	lw	a1,96(sp)
   253a0:	4522                	lw	a0,8(sp)
   253a2:	770020ef          	jal	27b12 <_Bfree>
   253a6:	19fd                	add	s3,s3,-1
   253a8:	4711                	li	a4,4
   253aa:	5796                	lw	a5,100(sp)
   253ac:	01376d63          	bltu	a4,s3,253c6 <_strtod_l+0x150>
   253b0:	0002a737          	lui	a4,0x2a
   253b4:	93870713          	add	a4,a4,-1736 # 29938 <__clz_tab+0x4d8>
   253b8:	098a                	sll	s3,s3,0x2
   253ba:	99ba                	add	s3,s3,a4
   253bc:	0009a703          	lw	a4,0(s3)
   253c0:	8702                	jr	a4
   253c2:	54a6                	lw	s1,104(sp)
   253c4:	5436                	lw	s0,108(sp)
   253c6:	008a7a13          	and	s4,s4,8
   253ca:	f40a0fe3          	beqz	s4,25328 <_strtod_l+0xb2>
   253ce:	800007b7          	lui	a5,0x80000
   253d2:	8c5d                	or	s0,s0,a5
   253d4:	bf91                	j	25328 <_strtod_l+0xb2>
   253d6:	5436                	lw	s0,108(sp)
   253d8:	fff00737          	lui	a4,0xfff00
   253dc:	177d                	add	a4,a4,-1 # ffefffff <__share_mem_end__+0xfee3ffff>
   253de:	43378793          	add	a5,a5,1075 # 80000433 <__share_mem_end__+0x7ef40433>
   253e2:	8c79                	and	s0,s0,a4
   253e4:	07d2                	sll	a5,a5,0x14
   253e6:	54a6                	lw	s1,104(sp)
   253e8:	8c5d                	or	s0,s0,a5
   253ea:	bff1                	j	253c6 <_strtod_l+0x150>
   253ec:	7ff00437          	lui	s0,0x7ff00
   253f0:	bfd9                	j	253c6 <_strtod_l+0x150>
   253f2:	80000437          	lui	s0,0x80000
   253f6:	147d                	add	s0,s0,-1 # 7fffffff <__share_mem_end__+0x7ef3ffff>
   253f8:	54fd                	li	s1,-1
   253fa:	b7f1                	j	253c6 <_strtod_l+0x150>
   253fc:	47f6                	lw	a5,92(sp)
   253fe:	00178693          	add	a3,a5,1
   25402:	ceb6                	sw	a3,92(sp)
   25404:	0017c783          	lbu	a5,1(a5)
   25408:	fee78ae3          	beq	a5,a4,253fc <_strtod_l+0x186>
   2540c:	df91                	beqz	a5,25328 <_strtod_l+0xb2>
   2540e:	4d05                	li	s10,1
   25410:	4cf6                	lw	s9,92(sp)
   25412:	4b81                	li	s7,0
   25414:	4a81                	li	s5,0
   25416:	4c01                	li	s8,0
   25418:	4625                	li	a2,9
   2541a:	4821                	li	a6,8
   2541c:	46a9                	li	a3,10
   2541e:	4576                	lw	a0,92(sp)
   25420:	00054a03          	lbu	s4,0(a0)
   25424:	fd0a0713          	add	a4,s4,-48
   25428:	0ff77793          	zext.b	a5,a4
   2542c:	04f67c63          	bgeu	a2,a5,25484 <_strtod_l+0x20e>
   25430:	864e                	mv	a2,s3
   25432:	287030ef          	jal	28eb8 <strncmp>
   25436:	c52d                	beqz	a0,254a0 <_strtod_l+0x22a>
   25438:	87d2                	mv	a5,s4
   2543a:	8de2                	mv	s11,s8
   2543c:	4701                	li	a4,0
   2543e:	4a01                	li	s4,0
   25440:	4501                	li	a0,0
   25442:	06500693          	li	a3,101
   25446:	00d78763          	beq	a5,a3,25454 <_strtod_l+0x1de>
   2544a:	04500693          	li	a3,69
   2544e:	4981                	li	s3,0
   25450:	18d79363          	bne	a5,a3,255d6 <_strtod_l+0x360>
   25454:	000d9763          	bnez	s11,25462 <_strtod_l+0x1ec>
   25458:	01a767b3          	or	a5,a4,s10
   2545c:	f00783e3          	beqz	a5,25362 <_strtod_l+0xec>
   25460:	4d81                	li	s11,0
   25462:	4b76                	lw	s6,92(sp)
   25464:	02b00693          	li	a3,43
   25468:	001b0793          	add	a5,s6,1
   2546c:	cebe                	sw	a5,92(sp)
   2546e:	001b4783          	lbu	a5,1(s6)
   25472:	0ed78b63          	beq	a5,a3,25568 <_strtod_l+0x2f2>
   25476:	02d00693          	li	a3,45
   2547a:	4801                	li	a6,0
   2547c:	0ed79c63          	bne	a5,a3,25574 <_strtod_l+0x2fe>
   25480:	4805                	li	a6,1
   25482:	a0e5                	j	2556a <_strtod_l+0x2f4>
   25484:	01884a63          	blt	a6,s8,25498 <_strtod_l+0x222>
   25488:	02da8ab3          	mul	s5,s5,a3
   2548c:	9aba                	add	s5,s5,a4
   2548e:	00150793          	add	a5,a0,1
   25492:	0c05                	add	s8,s8,1
   25494:	cebe                	sw	a5,92(sp)
   25496:	b761                	j	2541e <_strtod_l+0x1a8>
   25498:	02db8bb3          	mul	s7,s7,a3
   2549c:	9bba                	add	s7,s7,a4
   2549e:	bfc5                	j	2548e <_strtod_l+0x218>
   254a0:	47f6                	lw	a5,92(sp)
   254a2:	4701                	li	a4,0
   254a4:	01378533          	add	a0,a5,s3
   254a8:	ceaa                	sw	a0,92(sp)
   254aa:	00054783          	lbu	a5,0(a0)
   254ae:	080c0563          	beqz	s8,25538 <_strtod_l+0x2c2>
   254b2:	4a01                	li	s4,0
   254b4:	8de2                	mv	s11,s8
   254b6:	fd078693          	add	a3,a5,-48
   254ba:	4625                	li	a2,9
   254bc:	02d67663          	bgeu	a2,a3,254e8 <_strtod_l+0x272>
   254c0:	4505                	li	a0,1
   254c2:	b741                	j	25442 <_strtod_l+0x1cc>
   254c4:	47f6                	lw	a5,92(sp)
   254c6:	0705                	add	a4,a4,1
   254c8:	00178613          	add	a2,a5,1
   254cc:	ceb2                	sw	a2,92(sp)
   254ce:	0017c783          	lbu	a5,1(a5)
   254d2:	fed789e3          	beq	a5,a3,254c4 <_strtod_l+0x24e>
   254d6:	fcf78693          	add	a3,a5,-49
   254da:	4621                	li	a2,8
   254dc:	20d66fe3          	bltu	a2,a3,25efa <_strtod_l+0xc84>
   254e0:	4cf6                	lw	s9,92(sp)
   254e2:	8a3a                	mv	s4,a4
   254e4:	4d81                	li	s11,0
   254e6:	4701                	li	a4,0
   254e8:	fd078793          	add	a5,a5,-48
   254ec:	00170693          	add	a3,a4,1
   254f0:	cf85                	beqz	a5,25528 <_strtod_l+0x2b2>
   254f2:	9a36                	add	s4,s4,a3
   254f4:	85ee                	mv	a1,s11
   254f6:	48a1                	li	a7,8
   254f8:	4341                	li	t1,16
   254fa:	4529                	li	a0,10
   254fc:	00158613          	add	a2,a1,1
   25500:	41b60833          	sub	a6,a2,s11
   25504:	02d84d63          	blt	a6,a3,2553e <_strtod_l+0x2c8>
   25508:	00075363          	bgez	a4,2550e <_strtod_l+0x298>
   2550c:	4701                	li	a4,0
   2550e:	00ed8633          	add	a2,s11,a4
   25512:	0d85                	add	s11,s11,1
   25514:	9dba                	add	s11,s11,a4
   25516:	4721                	li	a4,8
   25518:	02c74e63          	blt	a4,a2,25554 <_strtod_l+0x2de>
   2551c:	4729                	li	a4,10
   2551e:	02ea8733          	mul	a4,s5,a4
   25522:	4681                	li	a3,0
   25524:	00e78ab3          	add	s5,a5,a4
   25528:	47f6                	lw	a5,92(sp)
   2552a:	00178713          	add	a4,a5,1
   2552e:	ceba                	sw	a4,92(sp)
   25530:	0017c783          	lbu	a5,1(a5)
   25534:	8736                	mv	a4,a3
   25536:	b741                	j	254b6 <_strtod_l+0x240>
   25538:	03000693          	li	a3,48
   2553c:	bf59                	j	254d2 <_strtod_l+0x25c>
   2553e:	00b8c663          	blt	a7,a1,2554a <_strtod_l+0x2d4>
   25542:	02aa8ab3          	mul	s5,s5,a0
   25546:	85b2                	mv	a1,a2
   25548:	bf55                	j	254fc <_strtod_l+0x286>
   2554a:	fec34ee3          	blt	t1,a2,25546 <_strtod_l+0x2d0>
   2554e:	02ab8bb3          	mul	s7,s7,a0
   25552:	bfd5                	j	25546 <_strtod_l+0x2d0>
   25554:	473d                	li	a4,15
   25556:	4681                	li	a3,0
   25558:	fcc748e3          	blt	a4,a2,25528 <_strtod_l+0x2b2>
   2555c:	4729                	li	a4,10
   2555e:	02eb8733          	mul	a4,s7,a4
   25562:	00e78bb3          	add	s7,a5,a4
   25566:	b7c9                	j	25528 <_strtod_l+0x2b2>
   25568:	4801                	li	a6,0
   2556a:	002b0793          	add	a5,s6,2
   2556e:	cebe                	sw	a5,92(sp)
   25570:	002b4783          	lbu	a5,2(s6)
   25574:	fd078693          	add	a3,a5,-48
   25578:	4625                	li	a2,9
   2557a:	0ed66263          	bltu	a2,a3,2565e <_strtod_l+0x3e8>
   2557e:	03000693          	li	a3,48
   25582:	0cd78163          	beq	a5,a3,25644 <_strtod_l+0x3ce>
   25586:	fcf78693          	add	a3,a5,-49
   2558a:	4621                	li	a2,8
   2558c:	4981                	li	s3,0
   2558e:	04d66463          	bltu	a2,a3,255d6 <_strtod_l+0x360>
   25592:	48f6                	lw	a7,92(sp)
   25594:	fd078693          	add	a3,a5,-48
   25598:	4325                	li	t1,9
   2559a:	4e29                	li	t3,10
   2559c:	47f6                	lw	a5,92(sp)
   2559e:	00178613          	add	a2,a5,1
   255a2:	ceb2                	sw	a2,92(sp)
   255a4:	0017c783          	lbu	a5,1(a5)
   255a8:	fd078593          	add	a1,a5,-48
   255ac:	0ff5f593          	zext.b	a1,a1
   255b0:	0ab37163          	bgeu	t1,a1,25652 <_strtod_l+0x3dc>
   255b4:	6995                	lui	s3,0x5
   255b6:	41160633          	sub	a2,a2,a7
   255ba:	e1f98993          	add	s3,s3,-481 # 4e1f <HEAP_SIZE+0xe1f>
   255be:	48a1                	li	a7,8
   255c0:	85ce                	mv	a1,s3
   255c2:	00c8c663          	blt	a7,a2,255ce <_strtod_l+0x358>
   255c6:	89b6                	mv	s3,a3
   255c8:	00d5d363          	bge	a1,a3,255ce <_strtod_l+0x358>
   255cc:	89ae                	mv	s3,a1
   255ce:	00080463          	beqz	a6,255d6 <_strtod_l+0x360>
   255d2:	413009b3          	neg	s3,s3
   255d6:	0c0d9e63          	bnez	s11,256b2 <_strtod_l+0x43c>
   255da:	00ed6733          	or	a4,s10,a4
   255de:	d40715e3          	bnez	a4,25328 <_strtod_l+0xb2>
   255e2:	d80510e3          	bnez	a0,25362 <_strtod_l+0xec>
   255e6:	06900713          	li	a4,105
   255ea:	08e78063          	beq	a5,a4,2566a <_strtod_l+0x3f4>
   255ee:	06f74b63          	blt	a4,a5,25664 <_strtod_l+0x3ee>
   255f2:	04900713          	li	a4,73
   255f6:	06e78a63          	beq	a5,a4,2566a <_strtod_l+0x3f4>
   255fa:	04e00713          	li	a4,78
   255fe:	d6e792e3          	bne	a5,a4,25362 <_strtod_l+0xec>
   25602:	000295b7          	lui	a1,0x29
   25606:	5d858593          	add	a1,a1,1496 # 295d8 <__clz_tab+0x178>
   2560a:	08e8                	add	a0,sp,92
   2560c:	154020ef          	jal	27760 <__match>
   25610:	d40509e3          	beqz	a0,25362 <_strtod_l+0xec>
   25614:	47f6                	lw	a5,92(sp)
   25616:	0007c703          	lbu	a4,0(a5)
   2561a:	02800793          	li	a5,40
   2561e:	08f71163          	bne	a4,a5,256a0 <_strtod_l+0x42a>
   25622:	0002a5b7          	lui	a1,0x2a
   25626:	10b0                	add	a2,sp,104
   25628:	94c58593          	add	a1,a1,-1716 # 2994c <fpinan.0>
   2562c:	08e8                	add	a0,sp,92
   2562e:	162020ef          	jal	27790 <__hexnan>
   25632:	4795                	li	a5,5
   25634:	06f51663          	bne	a0,a5,256a0 <_strtod_l+0x42a>
   25638:	57b6                	lw	a5,108(sp)
   2563a:	7ff00437          	lui	s0,0x7ff00
   2563e:	54a6                	lw	s1,104(sp)
   25640:	8c5d                	or	s0,s0,a5
   25642:	b1dd                	j	25328 <_strtod_l+0xb2>
   25644:	47f6                	lw	a5,92(sp)
   25646:	00178613          	add	a2,a5,1
   2564a:	ceb2                	sw	a2,92(sp)
   2564c:	0017c783          	lbu	a5,1(a5)
   25650:	bf0d                	j	25582 <_strtod_l+0x30c>
   25652:	03c686b3          	mul	a3,a3,t3
   25656:	96be                	add	a3,a3,a5
   25658:	fd068693          	add	a3,a3,-48
   2565c:	b781                	j	2559c <_strtod_l+0x326>
   2565e:	ceda                	sw	s6,92(sp)
   25660:	4981                	li	s3,0
   25662:	bf95                	j	255d6 <_strtod_l+0x360>
   25664:	06e00713          	li	a4,110
   25668:	bf59                	j	255fe <_strtod_l+0x388>
   2566a:	000295b7          	lui	a1,0x29
   2566e:	5cc58593          	add	a1,a1,1484 # 295cc <__clz_tab+0x16c>
   25672:	08e8                	add	a0,sp,92
   25674:	0ec020ef          	jal	27760 <__match>
   25678:	ce0505e3          	beqz	a0,25362 <_strtod_l+0xec>
   2567c:	47f6                	lw	a5,92(sp)
   2567e:	000295b7          	lui	a1,0x29
   25682:	5d058593          	add	a1,a1,1488 # 295d0 <__clz_tab+0x170>
   25686:	17fd                	add	a5,a5,-1
   25688:	08e8                	add	a0,sp,92
   2568a:	cebe                	sw	a5,92(sp)
   2568c:	0d4020ef          	jal	27760 <__match>
   25690:	e501                	bnez	a0,25698 <_strtod_l+0x422>
   25692:	47f6                	lw	a5,92(sp)
   25694:	0785                	add	a5,a5,1
   25696:	cebe                	sw	a5,92(sp)
   25698:	7ff00437          	lui	s0,0x7ff00
   2569c:	4481                	li	s1,0
   2569e:	b169                	j	25328 <_strtod_l+0xb2>
   256a0:	00029537          	lui	a0,0x29
   256a4:	73450513          	add	a0,a0,1844 # 29734 <__clz_tab+0x2d4>
   256a8:	748030ef          	jal	28df0 <nan>
   256ac:	84aa                	mv	s1,a0
   256ae:	842e                	mv	s0,a1
   256b0:	b9a5                	j	25328 <_strtod_l+0xb2>
   256b2:	41498b33          	sub	s6,s3,s4
   256b6:	000c1363          	bnez	s8,256bc <_strtod_l+0x446>
   256ba:	8c6e                	mv	s8,s11
   256bc:	47c1                	li	a5,16
   256be:	8d6e                	mv	s10,s11
   256c0:	01b7d363          	bge	a5,s11,256c6 <_strtod_l+0x450>
   256c4:	4d41                	li	s10,16
   256c6:	8556                	mv	a0,s5
   256c8:	e2afc0ef          	jal	21cf2 <__floatunsidf>
   256cc:	47a5                	li	a5,9
   256ce:	84aa                	mv	s1,a0
   256d0:	842e                	mv	s0,a1
   256d2:	03b7c863          	blt	a5,s11,25702 <_strtod_l+0x48c>
   256d6:	c40b09e3          	beqz	s6,25328 <_strtod_l+0xb2>
   256da:	11605f63          	blez	s6,257f8 <_strtod_l+0x582>
   256de:	47d9                	li	a5,22
   256e0:	0d67cd63          	blt	a5,s6,257ba <_strtod_l+0x544>
   256e4:	0002a7b7          	lui	a5,0x2a
   256e8:	0b0e                	sll	s6,s6,0x3
   256ea:	b4878793          	add	a5,a5,-1208 # 29b48 <__mprec_tens>
   256ee:	9b3e                	add	s6,s6,a5
   256f0:	000b2503          	lw	a0,0(s6)
   256f4:	004b2583          	lw	a1,4(s6)
   256f8:	8626                	mv	a2,s1
   256fa:	86a2                	mv	a3,s0
   256fc:	b1dfb0ef          	jal	21218 <__muldf3>
   25700:	b775                	j	256ac <_strtod_l+0x436>
   25702:	ff7d0793          	add	a5,s10,-9
   25706:	0002a737          	lui	a4,0x2a
   2570a:	b4870713          	add	a4,a4,-1208 # 29b48 <__mprec_tens>
   2570e:	078e                	sll	a5,a5,0x3
   25710:	97ba                	add	a5,a5,a4
   25712:	4390                	lw	a2,0(a5)
   25714:	43d4                	lw	a3,4(a5)
   25716:	b03fb0ef          	jal	21218 <__muldf3>
   2571a:	84aa                	mv	s1,a0
   2571c:	855e                	mv	a0,s7
   2571e:	842e                	mv	s0,a1
   25720:	dd2fc0ef          	jal	21cf2 <__floatunsidf>
   25724:	862a                	mv	a2,a0
   25726:	86ae                	mv	a3,a1
   25728:	8526                	mv	a0,s1
   2572a:	85a2                	mv	a1,s0
   2572c:	ec2fc0ef          	jal	21dee <__adddf3>
   25730:	47bd                	li	a5,15
   25732:	84aa                	mv	s1,a0
   25734:	842e                	mv	s0,a1
   25736:	fbb7d0e3          	bge	a5,s11,256d6 <_strtod_l+0x460>
   2573a:	41ad8d33          	sub	s10,s11,s10
   2573e:	9d5a                	add	s10,s10,s6
   25740:	17a05963          	blez	s10,258b2 <_strtod_l+0x63c>
   25744:	00fd7793          	and	a5,s10,15
   25748:	cf99                	beqz	a5,25766 <_strtod_l+0x4f0>
   2574a:	0002a737          	lui	a4,0x2a
   2574e:	b4870713          	add	a4,a4,-1208 # 29b48 <__mprec_tens>
   25752:	078e                	sll	a5,a5,0x3
   25754:	97ba                	add	a5,a5,a4
   25756:	4388                	lw	a0,0(a5)
   25758:	43cc                	lw	a1,4(a5)
   2575a:	8626                	mv	a2,s1
   2575c:	86a2                	mv	a3,s0
   2575e:	abbfb0ef          	jal	21218 <__muldf3>
   25762:	84aa                	mv	s1,a0
   25764:	842e                	mv	s0,a1
   25766:	ff0d7d13          	and	s10,s10,-16
   2576a:	100d0a63          	beqz	s10,2587e <_strtod_l+0x608>
   2576e:	13400793          	li	a5,308
   25772:	0ba7d763          	bge	a5,s10,25820 <_strtod_l+0x5aa>
   25776:	4a81                	li	s5,0
   25778:	4981                	li	s3,0
   2577a:	4901                	li	s2,0
   2577c:	4a01                	li	s4,0
   2577e:	4722                	lw	a4,8(sp)
   25780:	02200793          	li	a5,34
   25784:	7ff00437          	lui	s0,0x7ff00
   25788:	c31c                	sw	a5,0(a4)
   2578a:	4481                	li	s1,0
   2578c:	b8090ee3          	beqz	s2,25328 <_strtod_l+0xb2>
   25790:	5586                	lw	a1,96(sp)
   25792:	4522                	lw	a0,8(sp)
   25794:	37e020ef          	jal	27b12 <_Bfree>
   25798:	4522                	lw	a0,8(sp)
   2579a:	85d2                	mv	a1,s4
   2579c:	376020ef          	jal	27b12 <_Bfree>
   257a0:	4522                	lw	a0,8(sp)
   257a2:	85ce                	mv	a1,s3
   257a4:	36e020ef          	jal	27b12 <_Bfree>
   257a8:	4522                	lw	a0,8(sp)
   257aa:	85ca                	mv	a1,s2
   257ac:	366020ef          	jal	27b12 <_Bfree>
   257b0:	4522                	lw	a0,8(sp)
   257b2:	85d6                	mv	a1,s5
   257b4:	35e020ef          	jal	27b12 <_Bfree>
   257b8:	be85                	j	25328 <_strtod_l+0xb2>
   257ba:	02500793          	li	a5,37
   257be:	41b787b3          	sub	a5,a5,s11
   257c2:	f767cce3          	blt	a5,s6,2573a <_strtod_l+0x4c4>
   257c6:	493d                	li	s2,15
   257c8:	41b90933          	sub	s2,s2,s11
   257cc:	0002a9b7          	lui	s3,0x2a
   257d0:	00391793          	sll	a5,s2,0x3
   257d4:	b4898993          	add	s3,s3,-1208 # 29b48 <__mprec_tens>
   257d8:	97ce                	add	a5,a5,s3
   257da:	4388                	lw	a0,0(a5)
   257dc:	43cc                	lw	a1,4(a5)
   257de:	412b0933          	sub	s2,s6,s2
   257e2:	8626                	mv	a2,s1
   257e4:	86a2                	mv	a3,s0
   257e6:	090e                	sll	s2,s2,0x3
   257e8:	a31fb0ef          	jal	21218 <__muldf3>
   257ec:	994e                	add	s2,s2,s3
   257ee:	00092603          	lw	a2,0(s2)
   257f2:	00492683          	lw	a3,4(s2)
   257f6:	b719                	j	256fc <_strtod_l+0x486>
   257f8:	57a9                	li	a5,-22
   257fa:	f4fb40e3          	blt	s6,a5,2573a <_strtod_l+0x4c4>
   257fe:	413a09b3          	sub	s3,s4,s3
   25802:	0002a7b7          	lui	a5,0x2a
   25806:	b4878793          	add	a5,a5,-1208 # 29b48 <__mprec_tens>
   2580a:	098e                	sll	s3,s3,0x3
   2580c:	99be                	add	s3,s3,a5
   2580e:	0009a603          	lw	a2,0(s3)
   25812:	0049a683          	lw	a3,4(s3)
   25816:	8526                	mv	a0,s1
   25818:	85a2                	mv	a1,s0
   2581a:	cbcfb0ef          	jal	20cd6 <__divdf3>
   2581e:	b579                	j	256ac <_strtod_l+0x436>
   25820:	0002a737          	lui	a4,0x2a
   25824:	b2070e13          	add	t3,a4,-1248 # 29b20 <__mprec_bigtens>
   25828:	b2070b93          	add	s7,a4,-1248
   2582c:	404d5d13          	sra	s10,s10,0x4
   25830:	87a6                	mv	a5,s1
   25832:	85a2                	mv	a1,s0
   25834:	4681                	li	a3,0
   25836:	4901                	li	s2,0
   25838:	4705                	li	a4,1
   2583a:	05a74463          	blt	a4,s10,25882 <_strtod_l+0x60c>
   2583e:	c299                	beqz	a3,25844 <_strtod_l+0x5ce>
   25840:	84be                	mv	s1,a5
   25842:	842e                	mv	s0,a1
   25844:	00391793          	sll	a5,s2,0x3
   25848:	00fb8733          	add	a4,s7,a5
   2584c:	4308                	lw	a0,0(a4)
   2584e:	434c                	lw	a1,4(a4)
   25850:	fcb007b7          	lui	a5,0xfcb00
   25854:	97a2                	add	a5,a5,s0
   25856:	8626                	mv	a2,s1
   25858:	86be                	mv	a3,a5
   2585a:	9bffb0ef          	jal	21218 <__muldf3>
   2585e:	7ff007b7          	lui	a5,0x7ff00
   25862:	8fed                	and	a5,a5,a1
   25864:	7ca00737          	lui	a4,0x7ca00
   25868:	84aa                	mv	s1,a0
   2586a:	f0f766e3          	bltu	a4,a5,25776 <_strtod_l+0x500>
   2586e:	7c900737          	lui	a4,0x7c900
   25872:	02f77c63          	bgeu	a4,a5,258aa <_strtod_l+0x634>
   25876:	7ff00437          	lui	s0,0x7ff00
   2587a:	147d                	add	s0,s0,-1 # 7fefffff <__share_mem_end__+0x7ee3ffff>
   2587c:	54fd                	li	s1,-1
   2587e:	4b81                	li	s7,0
   25880:	a8ed                	j	2597a <_strtod_l+0x704>
   25882:	001d7613          	and	a2,s10,1
   25886:	ce09                	beqz	a2,258a0 <_strtod_l+0x62a>
   25888:	004e2683          	lw	a3,4(t3)
   2588c:	000e2603          	lw	a2,0(t3)
   25890:	853e                	mv	a0,a5
   25892:	c872                	sw	t3,16(sp)
   25894:	985fb0ef          	jal	21218 <__muldf3>
   25898:	4e42                	lw	t3,16(sp)
   2589a:	87aa                	mv	a5,a0
   2589c:	4685                	li	a3,1
   2589e:	4705                	li	a4,1
   258a0:	0905                	add	s2,s2,1
   258a2:	401d5d13          	sra	s10,s10,0x1
   258a6:	0e21                	add	t3,t3,8
   258a8:	bf49                	j	2583a <_strtod_l+0x5c4>
   258aa:	03500437          	lui	s0,0x3500
   258ae:	942e                	add	s0,s0,a1
   258b0:	b7f9                	j	2587e <_strtod_l+0x608>
   258b2:	fc0d06e3          	beqz	s10,2587e <_strtod_l+0x608>
   258b6:	41a00d33          	neg	s10,s10
   258ba:	00fd7793          	and	a5,s10,15
   258be:	cf99                	beqz	a5,258dc <_strtod_l+0x666>
   258c0:	0002a737          	lui	a4,0x2a
   258c4:	b4870713          	add	a4,a4,-1208 # 29b48 <__mprec_tens>
   258c8:	078e                	sll	a5,a5,0x3
   258ca:	97ba                	add	a5,a5,a4
   258cc:	4390                	lw	a2,0(a5)
   258ce:	43d4                	lw	a3,4(a5)
   258d0:	8526                	mv	a0,s1
   258d2:	85a2                	mv	a1,s0
   258d4:	c02fb0ef          	jal	20cd6 <__divdf3>
   258d8:	84aa                	mv	s1,a0
   258da:	842e                	mv	s0,a1
   258dc:	404d5d13          	sra	s10,s10,0x4
   258e0:	f80d0fe3          	beqz	s10,2587e <_strtod_l+0x608>
   258e4:	47fd                	li	a5,31
   258e6:	01a7dd63          	bge	a5,s10,25900 <_strtod_l+0x68a>
   258ea:	4a81                	li	s5,0
   258ec:	4981                	li	s3,0
   258ee:	4901                	li	s2,0
   258f0:	4a01                	li	s4,0
   258f2:	4722                	lw	a4,8(sp)
   258f4:	02200793          	li	a5,34
   258f8:	4481                	li	s1,0
   258fa:	4401                	li	s0,0
   258fc:	c31c                	sw	a5,0(a4)
   258fe:	b579                	j	2578c <_strtod_l+0x516>
   25900:	010d7b93          	and	s7,s10,16
   25904:	000b8463          	beqz	s7,2590c <_strtod_l+0x696>
   25908:	06a00b93          	li	s7,106
   2590c:	0002a737          	lui	a4,0x2a
   25910:	87a6                	mv	a5,s1
   25912:	85a2                	mv	a1,s0
   25914:	97870913          	add	s2,a4,-1672 # 29978 <tinytens>
   25918:	4681                	li	a3,0
   2591a:	001d7613          	and	a2,s10,1
   2591e:	ca11                	beqz	a2,25932 <_strtod_l+0x6bc>
   25920:	00492683          	lw	a3,4(s2)
   25924:	00092603          	lw	a2,0(s2)
   25928:	853e                	mv	a0,a5
   2592a:	8effb0ef          	jal	21218 <__muldf3>
   2592e:	87aa                	mv	a5,a0
   25930:	4685                	li	a3,1
   25932:	401d5d13          	sra	s10,s10,0x1
   25936:	0921                	add	s2,s2,8
   25938:	fe0d11e3          	bnez	s10,2591a <_strtod_l+0x6a4>
   2593c:	c299                	beqz	a3,25942 <_strtod_l+0x6cc>
   2593e:	84be                	mv	s1,a5
   25940:	842e                	mv	s0,a1
   25942:	020b8563          	beqz	s7,2596c <_strtod_l+0x6f6>
   25946:	01445713          	srl	a4,s0,0x14
   2594a:	7ff77713          	and	a4,a4,2047
   2594e:	06b00793          	li	a5,107
   25952:	8f99                	sub	a5,a5,a4
   25954:	00f05c63          	blez	a5,2596c <_strtod_l+0x6f6>
   25958:	46fd                	li	a3,31
   2595a:	0cf6df63          	bge	a3,a5,25a38 <_strtod_l+0x7c2>
   2595e:	03400693          	li	a3,52
   25962:	4481                	li	s1,0
   25964:	0cf6d163          	bge	a3,a5,25a26 <_strtod_l+0x7b0>
   25968:	03700437          	lui	s0,0x3700
   2596c:	4601                	li	a2,0
   2596e:	4681                	li	a3,0
   25970:	8526                	mv	a0,s1
   25972:	85a2                	mv	a1,s0
   25974:	a69fc0ef          	jal	223dc <__eqdf2>
   25978:	d92d                	beqz	a0,258ea <_strtod_l+0x674>
   2597a:	4522                	lw	a0,8(sp)
   2597c:	8756                	mv	a4,s5
   2597e:	86ee                	mv	a3,s11
   25980:	8662                	mv	a2,s8
   25982:	85e6                	mv	a1,s9
   25984:	2a6020ef          	jal	27c2a <__s2b>
   25988:	892a                	mv	s2,a0
   2598a:	de0506e3          	beqz	a0,25776 <_strtod_l+0x500>
   2598e:	41fb5793          	sra	a5,s6,0x1f
   25992:	413a0a33          	sub	s4,s4,s3
   25996:	00fa7a33          	and	s4,s4,a5
   2599a:	ce52                	sw	s4,28(sp)
   2599c:	cc5a                	sw	s6,24(sp)
   2599e:	000b5363          	bgez	s6,259a4 <_strtod_l+0x72e>
   259a2:	cc02                	sw	zero,24(sp)
   259a4:	00c90793          	add	a5,s2,12
   259a8:	c0be                	sw	a5,64(sp)
   259aa:	0002a7b7          	lui	a5,0x2a
   259ae:	c4c7a803          	lw	a6,-948(a5) # 29c4c <_global_impure_ptr+0x24>
   259b2:	c487a783          	lw	a5,-952(a5)
   259b6:	4a81                	li	s5,0
   259b8:	d642                	sw	a6,44(sp)
   259ba:	d43e                	sw	a5,40(sp)
   259bc:	0002a7b7          	lui	a5,0x2a
   259c0:	c3c7a803          	lw	a6,-964(a5) # 29c3c <_global_impure_ptr+0x14>
   259c4:	c387a783          	lw	a5,-968(a5)
   259c8:	4981                	li	s3,0
   259ca:	da42                	sw	a6,52(sp)
   259cc:	d83e                	sw	a5,48(sp)
   259ce:	0002a7b7          	lui	a5,0x2a
   259d2:	c547a803          	lw	a6,-940(a5) # 29c54 <_global_impure_ptr+0x2c>
   259d6:	c507a783          	lw	a5,-944(a5)
   259da:	de42                	sw	a6,60(sp)
   259dc:	dc3e                	sw	a5,56(sp)
   259de:	00492583          	lw	a1,4(s2)
   259e2:	4522                	lw	a0,8(sp)
   259e4:	082020ef          	jal	27a66 <_Balloc>
   259e8:	8a2a                	mv	s4,a0
   259ea:	d8050ae3          	beqz	a0,2577e <_strtod_l+0x508>
   259ee:	01092603          	lw	a2,16(s2)
   259f2:	4586                	lw	a1,64(sp)
   259f4:	0531                	add	a0,a0,12
   259f6:	0609                	add	a2,a2,2
   259f8:	060a                	sll	a2,a2,0x2
   259fa:	ba8fc0ef          	jal	21da2 <memcpy>
   259fe:	4522                	lw	a0,8(sp)
   25a00:	10b8                	add	a4,sp,104
   25a02:	10d4                	add	a3,sp,100
   25a04:	8622                	mv	a2,s0
   25a06:	85a6                	mv	a1,s1
   25a08:	c826                	sw	s1,16(sp)
   25a0a:	ca22                	sw	s0,20(sp)
   25a0c:	1b1020ef          	jal	283bc <__d2b>
   25a10:	d0aa                	sw	a0,96(sp)
   25a12:	d60506e3          	beqz	a0,2577e <_strtod_l+0x508>
   25a16:	4522                	lw	a0,8(sp)
   25a18:	4585                	li	a1,1
   25a1a:	380020ef          	jal	27d9a <__i2b>
   25a1e:	89aa                	mv	s3,a0
   25a20:	e10d                	bnez	a0,25a42 <_strtod_l+0x7cc>
   25a22:	4981                	li	s3,0
   25a24:	bba9                	j	2577e <_strtod_l+0x508>
   25a26:	04b00793          	li	a5,75
   25a2a:	40e78733          	sub	a4,a5,a4
   25a2e:	57fd                	li	a5,-1
   25a30:	00e797b3          	sll	a5,a5,a4
   25a34:	8c7d                	and	s0,s0,a5
   25a36:	bf1d                	j	2596c <_strtod_l+0x6f6>
   25a38:	577d                	li	a4,-1
   25a3a:	00f717b3          	sll	a5,a4,a5
   25a3e:	8cfd                	and	s1,s1,a5
   25a40:	b735                	j	2596c <_strtod_l+0x6f6>
   25a42:	5796                	lw	a5,100(sp)
   25a44:	1607cb63          	bltz	a5,25bba <_strtod_l+0x944>
   25a48:	4772                	lw	a4,28(sp)
   25a4a:	4c62                	lw	s8,24(sp)
   25a4c:	00e78d33          	add	s10,a5,a4
   25a50:	56a6                	lw	a3,104(sp)
   25a52:	417787b3          	sub	a5,a5,s7
   25a56:	03600713          	li	a4,54
   25a5a:	97b6                	add	a5,a5,a3
   25a5c:	8f15                	sub	a4,a4,a3
   25a5e:	17fd                	add	a5,a5,-1
   25a60:	c0200693          	li	a3,-1022
   25a64:	16d7da63          	bge	a5,a3,25bd8 <_strtod_l+0x962>
   25a68:	8e9d                	sub	a3,a3,a5
   25a6a:	467d                	li	a2,31
   25a6c:	8f15                	sub	a4,a4,a3
   25a6e:	14d64b63          	blt	a2,a3,25bc4 <_strtod_l+0x94e>
   25a72:	4d85                	li	s11,1
   25a74:	00dd97b3          	sll	a5,s11,a3
   25a78:	d03e                	sw	a5,32(sp)
   25a7a:	4c81                	li	s9,0
   25a7c:	9c3a                	add	s8,s8,a4
   25a7e:	00ed0db3          	add	s11,s10,a4
   25a82:	9c5e                	add	s8,s8,s7
   25a84:	87ea                	mv	a5,s10
   25a86:	01add363          	bge	s11,s10,25a8c <_strtod_l+0x816>
   25a8a:	87ee                	mv	a5,s11
   25a8c:	00fc5363          	bge	s8,a5,25a92 <_strtod_l+0x81c>
   25a90:	87e2                	mv	a5,s8
   25a92:	00f05863          	blez	a5,25aa2 <_strtod_l+0x82c>
   25a96:	40fd8db3          	sub	s11,s11,a5
   25a9a:	40fc0c33          	sub	s8,s8,a5
   25a9e:	40fd0d33          	sub	s10,s10,a5
   25aa2:	47f2                	lw	a5,28(sp)
   25aa4:	02f05763          	blez	a5,25ad2 <_strtod_l+0x85c>
   25aa8:	4522                	lw	a0,8(sp)
   25aaa:	85ce                	mv	a1,s3
   25aac:	863e                	mv	a2,a5
   25aae:	4a0020ef          	jal	27f4e <__pow5mult>
   25ab2:	89aa                	mv	s3,a0
   25ab4:	d53d                	beqz	a0,25a22 <_strtod_l+0x7ac>
   25ab6:	85aa                	mv	a1,a0
   25ab8:	5606                	lw	a2,96(sp)
   25aba:	4522                	lw	a0,8(sp)
   25abc:	316020ef          	jal	27dd2 <__multiply>
   25ac0:	c2aa                	sw	a0,68(sp)
   25ac2:	ca050ee3          	beqz	a0,2577e <_strtod_l+0x508>
   25ac6:	5586                	lw	a1,96(sp)
   25ac8:	4522                	lw	a0,8(sp)
   25aca:	048020ef          	jal	27b12 <_Bfree>
   25ace:	4796                	lw	a5,68(sp)
   25ad0:	d0be                	sw	a5,96(sp)
   25ad2:	11b04563          	bgtz	s11,25bdc <_strtod_l+0x966>
   25ad6:	01605a63          	blez	s6,25aea <_strtod_l+0x874>
   25ada:	4662                	lw	a2,24(sp)
   25adc:	4522                	lw	a0,8(sp)
   25ade:	85d2                	mv	a1,s4
   25ae0:	46e020ef          	jal	27f4e <__pow5mult>
   25ae4:	8a2a                	mv	s4,a0
   25ae6:	c8050be3          	beqz	a0,2577c <_strtod_l+0x506>
   25aea:	01805a63          	blez	s8,25afe <_strtod_l+0x888>
   25aee:	4522                	lw	a0,8(sp)
   25af0:	85d2                	mv	a1,s4
   25af2:	8662                	mv	a2,s8
   25af4:	534020ef          	jal	28028 <__lshift>
   25af8:	8a2a                	mv	s4,a0
   25afa:	c80501e3          	beqz	a0,2577c <_strtod_l+0x506>
   25afe:	01a05a63          	blez	s10,25b12 <_strtod_l+0x89c>
   25b02:	4522                	lw	a0,8(sp)
   25b04:	85ce                	mv	a1,s3
   25b06:	866a                	mv	a2,s10
   25b08:	520020ef          	jal	28028 <__lshift>
   25b0c:	89aa                	mv	s3,a0
   25b0e:	c60508e3          	beqz	a0,2577e <_strtod_l+0x508>
   25b12:	5586                	lw	a1,96(sp)
   25b14:	4522                	lw	a0,8(sp)
   25b16:	8652                	mv	a2,s4
   25b18:	644020ef          	jal	2815c <__mdiff>
   25b1c:	8aaa                	mv	s5,a0
   25b1e:	c60500e3          	beqz	a0,2577e <_strtod_l+0x508>
   25b22:	00c52c03          	lw	s8,12(a0)
   25b26:	85ce                	mv	a1,s3
   25b28:	00052623          	sw	zero,12(a0)
   25b2c:	5fa020ef          	jal	28126 <__mcmp>
   25b30:	0a055f63          	bgez	a0,25bee <_strtod_l+0x978>
   25b34:	009c6c33          	or	s8,s8,s1
   25b38:	100c1763          	bnez	s8,25c46 <_strtod_l+0x9d0>
   25b3c:	00c41793          	sll	a5,s0,0xc
   25b40:	10079363          	bnez	a5,25c46 <_strtod_l+0x9d0>
   25b44:	7ff007b7          	lui	a5,0x7ff00
   25b48:	8fe1                	and	a5,a5,s0
   25b4a:	06b00737          	lui	a4,0x6b00
   25b4e:	0ef77c63          	bgeu	a4,a5,25c46 <_strtod_l+0x9d0>
   25b52:	014aa783          	lw	a5,20(s5)
   25b56:	e791                	bnez	a5,25b62 <_strtod_l+0x8ec>
   25b58:	010aa703          	lw	a4,16(s5)
   25b5c:	4785                	li	a5,1
   25b5e:	0ee7d463          	bge	a5,a4,25c46 <_strtod_l+0x9d0>
   25b62:	4522                	lw	a0,8(sp)
   25b64:	85d6                	mv	a1,s5
   25b66:	4605                	li	a2,1
   25b68:	4c0020ef          	jal	28028 <__lshift>
   25b6c:	85ce                	mv	a1,s3
   25b6e:	8aaa                	mv	s5,a0
   25b70:	5b6020ef          	jal	28126 <__mcmp>
   25b74:	0ca05963          	blez	a0,25c46 <_strtod_l+0x9d0>
   25b78:	7ff007b7          	lui	a5,0x7ff00
   25b7c:	8fe1                	and	a5,a5,s0
   25b7e:	0e0b8f63          	beqz	s7,25c7c <_strtod_l+0xa06>
   25b82:	06b00737          	lui	a4,0x6b00
   25b86:	0ef76b63          	bltu	a4,a5,25c7c <_strtod_l+0xa06>
   25b8a:	03700737          	lui	a4,0x3700
   25b8e:	d6f772e3          	bgeu	a4,a5,258f2 <_strtod_l+0x67c>
   25b92:	0002a7b7          	lui	a5,0x2a
   25b96:	c707a603          	lw	a2,-912(a5) # 29c70 <_global_impure_ptr+0x48>
   25b9a:	c747a683          	lw	a3,-908(a5)
   25b9e:	8526                	mv	a0,s1
   25ba0:	85a2                	mv	a1,s0
   25ba2:	e76fb0ef          	jal	21218 <__muldf3>
   25ba6:	842e                	mv	s0,a1
   25ba8:	8dc9                	or	a1,a1,a0
   25baa:	84aa                	mv	s1,a0
   25bac:	be0592e3          	bnez	a1,25790 <_strtod_l+0x51a>
   25bb0:	4722                	lw	a4,8(sp)
   25bb2:	02200793          	li	a5,34
   25bb6:	c31c                	sw	a5,0(a4)
   25bb8:	bee1                	j	25790 <_strtod_l+0x51a>
   25bba:	4762                	lw	a4,24(sp)
   25bbc:	4d72                	lw	s10,28(sp)
   25bbe:	40f70c33          	sub	s8,a4,a5
   25bc2:	b579                	j	25a50 <_strtod_l+0x7da>
   25bc4:	be200693          	li	a3,-1054
   25bc8:	40f687b3          	sub	a5,a3,a5
   25bcc:	4c85                	li	s9,1
   25bce:	00fc9cb3          	sll	s9,s9,a5
   25bd2:	4785                	li	a5,1
   25bd4:	d03e                	sw	a5,32(sp)
   25bd6:	b55d                	j	25a7c <_strtod_l+0x806>
   25bd8:	4c81                	li	s9,0
   25bda:	bfe5                	j	25bd2 <_strtod_l+0x95c>
   25bdc:	5586                	lw	a1,96(sp)
   25bde:	4522                	lw	a0,8(sp)
   25be0:	866e                	mv	a2,s11
   25be2:	446020ef          	jal	28028 <__lshift>
   25be6:	d0aa                	sw	a0,96(sp)
   25be8:	ee0517e3          	bnez	a0,25ad6 <_strtod_l+0x860>
   25bec:	be49                	j	2577e <_strtod_l+0x508>
   25bee:	e571                	bnez	a0,25cba <_strtod_l+0xa44>
   25bf0:	00100737          	lui	a4,0x100
   25bf4:	177d                	add	a4,a4,-1 # fffff <__noncacheable_end__+0x3ffff>
   25bf6:	00e477b3          	and	a5,s0,a4
   25bfa:	040c0963          	beqz	s8,25c4c <_strtod_l+0x9d6>
   25bfe:	04e79963          	bne	a5,a4,25c50 <_strtod_l+0x9da>
   25c02:	577d                	li	a4,-1
   25c04:	020b8063          	beqz	s7,25c24 <_strtod_l+0x9ae>
   25c08:	7ff007b7          	lui	a5,0x7ff00
   25c0c:	8fe1                	and	a5,a5,s0
   25c0e:	06a006b7          	lui	a3,0x6a00
   25c12:	00f6e963          	bltu	a3,a5,25c24 <_strtod_l+0x9ae>
   25c16:	83d1                	srl	a5,a5,0x14
   25c18:	06b00693          	li	a3,107
   25c1c:	40f687b3          	sub	a5,a3,a5
   25c20:	00f71733          	sll	a4,a4,a5
   25c24:	02e49663          	bne	s1,a4,25c50 <_strtod_l+0x9da>
   25c28:	7ff007b7          	lui	a5,0x7ff00
   25c2c:	17fd                	add	a5,a5,-1 # 7fefffff <__share_mem_end__+0x7ee3ffff>
   25c2e:	00f41563          	bne	s0,a5,25c38 <_strtod_l+0x9c2>
   25c32:	57fd                	li	a5,-1
   25c34:	b4f485e3          	beq	s1,a5,2577e <_strtod_l+0x508>
   25c38:	7ff007b7          	lui	a5,0x7ff00
   25c3c:	8fe1                	and	a5,a5,s0
   25c3e:	00100437          	lui	s0,0x100
   25c42:	943e                	add	s0,s0,a5
   25c44:	4481                	li	s1,0
   25c46:	f40b96e3          	bnez	s7,25b92 <_strtod_l+0x91c>
   25c4a:	b699                	j	25790 <_strtod_l+0x51a>
   25c4c:	8fc5                	or	a5,a5,s1
   25c4e:	d78d                	beqz	a5,25b78 <_strtod_l+0x902>
   25c50:	020c8f63          	beqz	s9,25c8e <_strtod_l+0xa18>
   25c54:	008cfcb3          	and	s9,s9,s0
   25c58:	fe0c87e3          	beqz	s9,25c46 <_strtod_l+0x9d0>
   25c5c:	865e                	mv	a2,s7
   25c5e:	8526                	mv	a0,s1
   25c60:	85a2                	mv	a1,s0
   25c62:	020c0c63          	beqz	s8,25c9a <_strtod_l+0xa24>
   25c66:	dc0ff0ef          	jal	25226 <sulp>
   25c6a:	862a                	mv	a2,a0
   25c6c:	86ae                	mv	a3,a1
   25c6e:	4542                	lw	a0,16(sp)
   25c70:	45d2                	lw	a1,20(sp)
   25c72:	97cfc0ef          	jal	21dee <__adddf3>
   25c76:	84aa                	mv	s1,a0
   25c78:	842e                	mv	s0,a1
   25c7a:	b7f1                	j	25c46 <_strtod_l+0x9d0>
   25c7c:	fff00737          	lui	a4,0xfff00
   25c80:	00100437          	lui	s0,0x100
   25c84:	97ba                	add	a5,a5,a4
   25c86:	147d                	add	s0,s0,-1 # fffff <__noncacheable_end__+0x3ffff>
   25c88:	8c5d                	or	s0,s0,a5
   25c8a:	54fd                	li	s1,-1
   25c8c:	bf6d                	j	25c46 <_strtod_l+0x9d0>
   25c8e:	5782                	lw	a5,32(sp)
   25c90:	0097fdb3          	and	s11,a5,s1
   25c94:	fa0d89e3          	beqz	s11,25c46 <_strtod_l+0x9d0>
   25c98:	b7d1                	j	25c5c <_strtod_l+0x9e6>
   25c9a:	d8cff0ef          	jal	25226 <sulp>
   25c9e:	862a                	mv	a2,a0
   25ca0:	86ae                	mv	a3,a1
   25ca2:	4542                	lw	a0,16(sp)
   25ca4:	45d2                	lw	a1,20(sp)
   25ca6:	9ddfb0ef          	jal	21682 <__subdf3>
   25caa:	4601                	li	a2,0
   25cac:	4681                	li	a3,0
   25cae:	84aa                	mv	s1,a0
   25cb0:	842e                	mv	s0,a1
   25cb2:	f2afc0ef          	jal	223dc <__eqdf2>
   25cb6:	f941                	bnez	a0,25c46 <_strtod_l+0x9d0>
   25cb8:	b92d                	j	258f2 <_strtod_l+0x67c>
   25cba:	85ce                	mv	a1,s3
   25cbc:	8556                	mv	a0,s5
   25cbe:	7de020ef          	jal	2849c <__ratio>
   25cc2:	5622                	lw	a2,40(sp)
   25cc4:	56b2                	lw	a3,44(sp)
   25cc6:	8d2a                	mv	s10,a0
   25cc8:	8cae                	mv	s9,a1
   25cca:	817fc0ef          	jal	224e0 <__ledf2>
   25cce:	0ea04b63          	bgtz	a0,25dc4 <_strtod_l+0xb4e>
   25cd2:	100c1a63          	bnez	s8,25de6 <_strtod_l+0xb70>
   25cd6:	e8f1                	bnez	s1,25daa <_strtod_l+0xb34>
   25cd8:	00c41793          	sll	a5,s0,0xc
   25cdc:	efe1                	bnez	a5,25db4 <_strtod_l+0xb3e>
   25cde:	0002a7b7          	lui	a5,0x2a
   25ce2:	c407a603          	lw	a2,-960(a5) # 29c40 <_global_impure_ptr+0x18>
   25ce6:	c447a683          	lw	a3,-956(a5)
   25cea:	856a                	mv	a0,s10
   25cec:	85e6                	mv	a1,s9
   25cee:	ff2fc0ef          	jal	224e0 <__ledf2>
   25cf2:	0c054563          	bltz	a0,25dbc <_strtod_l+0xb46>
   25cf6:	0002a7b7          	lui	a5,0x2a
   25cfa:	c387a603          	lw	a2,-968(a5) # 29c38 <_global_impure_ptr+0x10>
   25cfe:	c3c7a683          	lw	a3,-964(a5)
   25d02:	856a                	mv	a0,s10
   25d04:	85e6                	mv	a1,s9
   25d06:	d12fb0ef          	jal	21218 <__muldf3>
   25d0a:	87aa                	mv	a5,a0
   25d0c:	8dae                	mv	s11,a1
   25d0e:	80000d37          	lui	s10,0x80000
   25d12:	873e                	mv	a4,a5
   25d14:	01bd4d33          	xor	s10,s10,s11
   25d18:	7ff008b7          	lui	a7,0x7ff00
   25d1c:	01147cb3          	and	s9,s0,a7
   25d20:	7fe006b7          	lui	a3,0x7fe00
   25d24:	833a                	mv	t1,a4
   25d26:	886a                	mv	a6,s10
   25d28:	12dc9d63          	bne	s9,a3,25e62 <_strtod_l+0xbec>
   25d2c:	fcb00837          	lui	a6,0xfcb00
   25d30:	9822                	add	a6,a6,s0
   25d32:	85c2                	mv	a1,a6
   25d34:	8526                	mv	a0,s1
   25d36:	c4be                	sw	a5,72(sp)
   25d38:	d042                	sw	a6,32(sp)
   25d3a:	c6ba                	sw	a4,76(sp)
   25d3c:	c2a6                	sw	s1,68(sp)
   25d3e:	584020ef          	jal	282c2 <__ulp>
   25d42:	4736                	lw	a4,76(sp)
   25d44:	86ea                	mv	a3,s10
   25d46:	863a                	mv	a2,a4
   25d48:	cd0fb0ef          	jal	21218 <__muldf3>
   25d4c:	4316                	lw	t1,68(sp)
   25d4e:	5802                	lw	a6,32(sp)
   25d50:	861a                	mv	a2,t1
   25d52:	86c2                	mv	a3,a6
   25d54:	89afc0ef          	jal	21dee <__adddf3>
   25d58:	7ff008b7          	lui	a7,0x7ff00
   25d5c:	00b8f8b3          	and	a7,a7,a1
   25d60:	7ca00737          	lui	a4,0x7ca00
   25d64:	47a6                	lw	a5,72(sp)
   25d66:	84aa                	mv	s1,a0
   25d68:	08e8e663          	bltu	a7,a4,25df4 <_strtod_l+0xb7e>
   25d6c:	4752                	lw	a4,20(sp)
   25d6e:	7ff007b7          	lui	a5,0x7ff00
   25d72:	17fd                	add	a5,a5,-1 # 7fefffff <__share_mem_end__+0x7ee3ffff>
   25d74:	00e79663          	bne	a5,a4,25d80 <_strtod_l+0xb0a>
   25d78:	4742                	lw	a4,16(sp)
   25d7a:	57fd                	li	a5,-1
   25d7c:	a0e781e3          	beq	a5,a4,2577e <_strtod_l+0x508>
   25d80:	7ff00437          	lui	s0,0x7ff00
   25d84:	147d                	add	s0,s0,-1 # 7fefffff <__share_mem_end__+0x7ee3ffff>
   25d86:	54fd                	li	s1,-1
   25d88:	5586                	lw	a1,96(sp)
   25d8a:	4522                	lw	a0,8(sp)
   25d8c:	587010ef          	jal	27b12 <_Bfree>
   25d90:	4522                	lw	a0,8(sp)
   25d92:	85d2                	mv	a1,s4
   25d94:	57f010ef          	jal	27b12 <_Bfree>
   25d98:	4522                	lw	a0,8(sp)
   25d9a:	85ce                	mv	a1,s3
   25d9c:	577010ef          	jal	27b12 <_Bfree>
   25da0:	4522                	lw	a0,8(sp)
   25da2:	85d6                	mv	a1,s5
   25da4:	56f010ef          	jal	27b12 <_Bfree>
   25da8:	b91d                	j	259de <_strtod_l+0x768>
   25daa:	4785                	li	a5,1
   25dac:	00f49463          	bne	s1,a5,25db4 <_strtod_l+0xb3e>
   25db0:	b40401e3          	beqz	s0,258f2 <_strtod_l+0x67c>
   25db4:	4701                	li	a4,0
   25db6:	bff00d37          	lui	s10,0xbff00
   25dba:	a80d                	j	25dec <_strtod_l+0xb76>
   25dbc:	4781                	li	a5,0
   25dbe:	3fe00db7          	lui	s11,0x3fe00
   25dc2:	b7b1                	j	25d0e <_strtod_l+0xa98>
   25dc4:	5642                	lw	a2,48(sp)
   25dc6:	56d2                	lw	a3,52(sp)
   25dc8:	856a                	mv	a0,s10
   25dca:	85e6                	mv	a1,s9
   25dcc:	c4cfb0ef          	jal	21218 <__muldf3>
   25dd0:	872a                	mv	a4,a0
   25dd2:	8d2e                	mv	s10,a1
   25dd4:	87aa                	mv	a5,a0
   25dd6:	8dae                	mv	s11,a1
   25dd8:	f40c10e3          	bnez	s8,25d18 <_strtod_l+0xaa2>
   25ddc:	800006b7          	lui	a3,0x80000
   25de0:	00b6cd33          	xor	s10,a3,a1
   25de4:	bf15                	j	25d18 <_strtod_l+0xaa2>
   25de6:	4701                	li	a4,0
   25de8:	3ff00d37          	lui	s10,0x3ff00
   25dec:	4781                	li	a5,0
   25dee:	3ff00db7          	lui	s11,0x3ff00
   25df2:	b71d                	j	25d18 <_strtod_l+0xaa2>
   25df4:	03500437          	lui	s0,0x3500
   25df8:	942e                	add	s0,s0,a1
   25dfa:	f80b97e3          	bnez	s7,25d88 <_strtod_l+0xb12>
   25dfe:	7ff00737          	lui	a4,0x7ff00
   25e02:	8f61                	and	a4,a4,s0
   25e04:	f8ec92e3          	bne	s9,a4,25d88 <_strtod_l+0xb12>
   25e08:	853e                	mv	a0,a5
   25e0a:	85ee                	mv	a1,s11
   25e0c:	8d3e                	mv	s10,a5
   25e0e:	871fc0ef          	jal	2267e <__fixdfdi>
   25e12:	907fc0ef          	jal	22718 <__floatdidf>
   25e16:	862a                	mv	a2,a0
   25e18:	86ae                	mv	a3,a1
   25e1a:	856a                	mv	a0,s10
   25e1c:	85ee                	mv	a1,s11
   25e1e:	865fb0ef          	jal	21682 <__subdf3>
   25e22:	00c41793          	sll	a5,s0,0xc
   25e26:	83b1                	srl	a5,a5,0xc
   25e28:	8fc5                	or	a5,a5,s1
   25e2a:	0187e7b3          	or	a5,a5,s8
   25e2e:	8d2a                	mv	s10,a0
   25e30:	8cae                	mv	s9,a1
   25e32:	cbc5                	beqz	a5,25ee2 <_strtod_l+0xc6c>
   25e34:	0002a7b7          	lui	a5,0x2a
   25e38:	c587a603          	lw	a2,-936(a5) # 29c58 <_global_impure_ptr+0x30>
   25e3c:	c5c7a683          	lw	a3,-932(a5)
   25e40:	ea0fc0ef          	jal	224e0 <__ledf2>
   25e44:	940546e3          	bltz	a0,25790 <_strtod_l+0x51a>
   25e48:	0002a7b7          	lui	a5,0x2a
   25e4c:	c607a603          	lw	a2,-928(a5) # 29c60 <_global_impure_ptr+0x38>
   25e50:	c647a683          	lw	a3,-924(a5)
   25e54:	856a                	mv	a0,s10
   25e56:	85e6                	mv	a1,s9
   25e58:	deefc0ef          	jal	22446 <__gedf2>
   25e5c:	f2a056e3          	blez	a0,25d88 <_strtod_l+0xb12>
   25e60:	ba05                	j	25790 <_strtod_l+0x51a>
   25e62:	040b8b63          	beqz	s7,25eb8 <_strtod_l+0xc42>
   25e66:	06a00737          	lui	a4,0x6a00
   25e6a:	05976763          	bltu	a4,s9,25eb8 <_strtod_l+0xc42>
   25e6e:	5662                	lw	a2,56(sp)
   25e70:	56f2                	lw	a3,60(sp)
   25e72:	853e                	mv	a0,a5
   25e74:	85ee                	mv	a1,s11
   25e76:	c29a                	sw	t1,68(sp)
   25e78:	d03e                	sw	a5,32(sp)
   25e7a:	c4ea                	sw	s10,72(sp)
   25e7c:	e64fc0ef          	jal	224e0 <__ledf2>
   25e80:	5782                	lw	a5,32(sp)
   25e82:	4316                	lw	t1,68(sp)
   25e84:	4826                	lw	a6,72(sp)
   25e86:	02a04463          	bgtz	a0,25eae <_strtod_l+0xc38>
   25e8a:	853e                	mv	a0,a5
   25e8c:	85ee                	mv	a1,s11
   25e8e:	e01fb0ef          	jal	21c8e <__fixunsdfsi>
   25e92:	e111                	bnez	a0,25e96 <_strtod_l+0xc20>
   25e94:	4505                	li	a0,1
   25e96:	e5dfb0ef          	jal	21cf2 <__floatunsidf>
   25e9a:	832a                	mv	t1,a0
   25e9c:	87aa                	mv	a5,a0
   25e9e:	8dae                	mv	s11,a1
   25ea0:	882e                	mv	a6,a1
   25ea2:	000c1663          	bnez	s8,25eae <_strtod_l+0xc38>
   25ea6:	80000737          	lui	a4,0x80000
   25eaa:	00b74833          	xor	a6,a4,a1
   25eae:	06b00737          	lui	a4,0x6b00
   25eb2:	9742                	add	a4,a4,a6
   25eb4:	41970833          	sub	a6,a4,s9
   25eb8:	4542                	lw	a0,16(sp)
   25eba:	45d2                	lw	a1,20(sp)
   25ebc:	849a                	mv	s1,t1
   25ebe:	8442                	mv	s0,a6
   25ec0:	d03e                	sw	a5,32(sp)
   25ec2:	400020ef          	jal	282c2 <__ulp>
   25ec6:	862a                	mv	a2,a0
   25ec8:	86ae                	mv	a3,a1
   25eca:	8526                	mv	a0,s1
   25ecc:	85a2                	mv	a1,s0
   25ece:	b4afb0ef          	jal	21218 <__muldf3>
   25ed2:	4642                	lw	a2,16(sp)
   25ed4:	46d2                	lw	a3,20(sp)
   25ed6:	f19fb0ef          	jal	21dee <__adddf3>
   25eda:	5782                	lw	a5,32(sp)
   25edc:	84aa                	mv	s1,a0
   25ede:	842e                	mv	s0,a1
   25ee0:	bf29                	j	25dfa <_strtod_l+0xb84>
   25ee2:	0002a7b7          	lui	a5,0x2a
   25ee6:	c687a603          	lw	a2,-920(a5) # 29c68 <_global_impure_ptr+0x40>
   25eea:	c6c7a683          	lw	a3,-916(a5)
   25eee:	df2fc0ef          	jal	224e0 <__ledf2>
   25ef2:	e8055be3          	bgez	a0,25d88 <_strtod_l+0xb12>
   25ef6:	89bff06f          	j	25790 <_strtod_l+0x51a>
   25efa:	06500693          	li	a3,101
   25efe:	00d78763          	beq	a5,a3,25f0c <_strtod_l+0xc96>
   25f02:	04500693          	li	a3,69
   25f06:	4505                	li	a0,1
   25f08:	ecd79963          	bne	a5,a3,255da <_strtod_l+0x364>
   25f0c:	4a01                	li	s4,0
   25f0e:	4505                	li	a0,1
   25f10:	d48ff06f          	j	25458 <_strtod_l+0x1e2>

00025f14 <_strtod_r>:
   25f14:	000a06b7          	lui	a3,0xa0
   25f18:	06068693          	add	a3,a3,96 # a0060 <__global_locale>
   25f1c:	b5aff06f          	j	25276 <_strtod_l>

00025f20 <_strtol_l.isra.0>:
   25f20:	1141                	add	sp,sp,-16
   25f22:	c606                	sw	ra,12(sp)
   25f24:	c422                	sw	s0,8(sp)
   25f26:	02400793          	li	a5,36
   25f2a:	06d7e463          	bltu	a5,a3,25f92 <_strtol_l.isra.0+0x72>
   25f2e:	4705                	li	a4,1
   25f30:	87ae                	mv	a5,a1
   25f32:	06e68063          	beq	a3,a4,25f92 <_strtol_l.isra.0+0x72>
   25f36:	0002a8b7          	lui	a7,0x2a
   25f3a:	8f2a                	mv	t5,a0
   25f3c:	9a188893          	add	a7,a7,-1631 # 299a1 <_ctype_+0x1>
   25f40:	833e                	mv	t1,a5
   25f42:	0007c703          	lbu	a4,0(a5)
   25f46:	0785                	add	a5,a5,1
   25f48:	01170533          	add	a0,a4,a7
   25f4c:	00054803          	lbu	a6,0(a0)
   25f50:	00887813          	and	a6,a6,8
   25f54:	fe0816e3          	bnez	a6,25f40 <_strtol_l.isra.0+0x20>
   25f58:	02d00513          	li	a0,45
   25f5c:	04a71463          	bne	a4,a0,25fa4 <_strtol_l.isra.0+0x84>
   25f60:	0007c703          	lbu	a4,0(a5)
   25f64:	4f85                	li	t6,1
   25f66:	00230793          	add	a5,t1,2
   25f6a:	fef6f513          	and	a0,a3,-17
   25f6e:	ed21                	bnez	a0,25fc6 <_strtol_l.isra.0+0xa6>
   25f70:	03000513          	li	a0,48
   25f74:	04a71263          	bne	a4,a0,25fb8 <_strtol_l.isra.0+0x98>
   25f78:	0007c803          	lbu	a6,0(a5)
   25f7c:	05800513          	li	a0,88
   25f80:	0df87813          	and	a6,a6,223
   25f84:	02a81a63          	bne	a6,a0,25fb8 <_strtol_l.isra.0+0x98>
   25f88:	0017c703          	lbu	a4,1(a5)
   25f8c:	0789                	add	a5,a5,2
   25f8e:	46c1                	li	a3,16
   25f90:	a81d                	j	25fc6 <_strtol_l.isra.0+0xa6>
   25f92:	a3cfe0ef          	jal	241ce <__errno>
   25f96:	47d9                	li	a5,22
   25f98:	c11c                	sw	a5,0(a0)
   25f9a:	4501                	li	a0,0
   25f9c:	40b2                	lw	ra,12(sp)
   25f9e:	4422                	lw	s0,8(sp)
   25fa0:	0141                	add	sp,sp,16
   25fa2:	8082                	ret
   25fa4:	02b00513          	li	a0,43
   25fa8:	4f81                	li	t6,0
   25faa:	fca710e3          	bne	a4,a0,25f6a <_strtol_l.isra.0+0x4a>
   25fae:	0007c703          	lbu	a4,0(a5)
   25fb2:	00230793          	add	a5,t1,2
   25fb6:	bf55                	j	25f6a <_strtol_l.isra.0+0x4a>
   25fb8:	faf9                	bnez	a3,25f8e <_strtol_l.isra.0+0x6e>
   25fba:	03000513          	li	a0,48
   25fbe:	46a9                	li	a3,10
   25fc0:	00a71363          	bne	a4,a0,25fc6 <_strtol_l.isra.0+0xa6>
   25fc4:	46a1                	li	a3,8
   25fc6:	800008b7          	lui	a7,0x80000
   25fca:	18fd                	add	a7,a7,-1 # 7fffffff <__share_mem_end__+0x7ef3ffff>
   25fcc:	98fe                	add	a7,a7,t6
   25fce:	02d8f2b3          	remu	t0,a7,a3
   25fd2:	4301                	li	t1,0
   25fd4:	4501                	li	a0,0
   25fd6:	43a5                	li	t2,9
   25fd8:	4ee5                	li	t4,25
   25fda:	547d                	li	s0,-1
   25fdc:	02d8de33          	divu	t3,a7,a3
   25fe0:	fd070813          	add	a6,a4,-48 # 6afffd0 <__share_mem_end__+0x5a3ffd0>
   25fe4:	0303e663          	bltu	t2,a6,26010 <_strtol_l.isra.0+0xf0>
   25fe8:	8742                	mv	a4,a6
   25fea:	04d75163          	bge	a4,a3,2602c <_strtol_l.isra.0+0x10c>
   25fee:	00830d63          	beq	t1,s0,26008 <_strtol_l.isra.0+0xe8>
   25ff2:	537d                	li	t1,-1
   25ff4:	00ae6a63          	bltu	t3,a0,26008 <_strtol_l.isra.0+0xe8>
   25ff8:	00ae1463          	bne	t3,a0,26000 <_strtol_l.isra.0+0xe0>
   25ffc:	00e2c663          	blt	t0,a4,26008 <_strtol_l.isra.0+0xe8>
   26000:	4305                	li	t1,1
   26002:	02a68533          	mul	a0,a3,a0
   26006:	953a                	add	a0,a0,a4
   26008:	0785                	add	a5,a5,1
   2600a:	fff7c703          	lbu	a4,-1(a5)
   2600e:	bfc9                	j	25fe0 <_strtol_l.isra.0+0xc0>
   26010:	fbf70813          	add	a6,a4,-65
   26014:	010ee563          	bltu	t4,a6,2601e <_strtol_l.isra.0+0xfe>
   26018:	fc970713          	add	a4,a4,-55
   2601c:	b7f9                	j	25fea <_strtol_l.isra.0+0xca>
   2601e:	f9f70813          	add	a6,a4,-97
   26022:	010ee563          	bltu	t4,a6,2602c <_strtol_l.isra.0+0x10c>
   26026:	fa970713          	add	a4,a4,-87
   2602a:	b7c1                	j	25fea <_strtol_l.isra.0+0xca>
   2602c:	577d                	li	a4,-1
   2602e:	00e31b63          	bne	t1,a4,26044 <_strtol_l.isra.0+0x124>
   26032:	02200713          	li	a4,34
   26036:	00ef2023          	sw	a4,0(t5)
   2603a:	8546                	mv	a0,a7
   2603c:	d225                	beqz	a2,25f9c <_strtol_l.isra.0+0x7c>
   2603e:	fff78593          	add	a1,a5,-1
   26042:	a801                	j	26052 <_strtol_l.isra.0+0x132>
   26044:	000f8463          	beqz	t6,2604c <_strtol_l.isra.0+0x12c>
   26048:	40a00533          	neg	a0,a0
   2604c:	da21                	beqz	a2,25f9c <_strtol_l.isra.0+0x7c>
   2604e:	fe0318e3          	bnez	t1,2603e <_strtol_l.isra.0+0x11e>
   26052:	c20c                	sw	a1,0(a2)
   26054:	b7a1                	j	25f9c <_strtol_l.isra.0+0x7c>

00026056 <_strtol_r>:
   26056:	b5e9                	j	25f20 <_strtol_l.isra.0>

00026058 <quorem>:
   26058:	1101                	add	sp,sp,-32
   2605a:	cc22                	sw	s0,24(sp)
   2605c:	491c                	lw	a5,16(a0)
   2605e:	4980                	lw	s0,16(a1)
   26060:	ce06                	sw	ra,28(sp)
   26062:	ca26                	sw	s1,20(sp)
   26064:	c84a                	sw	s2,16(sp)
   26066:	c64e                	sw	s3,12(sp)
   26068:	c452                	sw	s4,8(sp)
   2606a:	c256                	sw	s5,4(sp)
   2606c:	1087cc63          	blt	a5,s0,26184 <quorem+0x12c>
   26070:	147d                	add	s0,s0,-1 # 34fffff <__share_mem_end__+0x243ffff>
   26072:	00241613          	sll	a2,s0,0x2
   26076:	01458a93          	add	s5,a1,20
   2607a:	00ca8a33          	add	s4,s5,a2
   2607e:	01450993          	add	s3,a0,20
   26082:	000a2783          	lw	a5,0(s4)
   26086:	964e                	add	a2,a2,s3
   26088:	4218                	lw	a4,0(a2)
   2608a:	0785                	add	a5,a5,1
   2608c:	892a                	mv	s2,a0
   2608e:	02f754b3          	divu	s1,a4,a5
   26092:	06f76463          	bltu	a4,a5,260fa <quorem+0xa2>
   26096:	6841                	lui	a6,0x10
   26098:	834e                	mv	t1,s3
   2609a:	88d6                	mv	a7,s5
   2609c:	4e01                	li	t3,0
   2609e:	4e81                	li	t4,0
   260a0:	187d                	add	a6,a6,-1 # ffff <__fw_size__+0x62ef>
   260a2:	0008a703          	lw	a4,0(a7)
   260a6:	0891                	add	a7,a7,4
   260a8:	0311                	add	t1,t1,4
   260aa:	01077533          	and	a0,a4,a6
   260ae:	8341                	srl	a4,a4,0x10
   260b0:	02950533          	mul	a0,a0,s1
   260b4:	02970733          	mul	a4,a4,s1
   260b8:	9572                	add	a0,a0,t3
   260ba:	01055793          	srl	a5,a0,0x10
   260be:	01057533          	and	a0,a0,a6
   260c2:	973e                	add	a4,a4,a5
   260c4:	ffc32783          	lw	a5,-4(t1)
   260c8:	01075e13          	srl	t3,a4,0x10
   260cc:	01077733          	and	a4,a4,a6
   260d0:	0107f6b3          	and	a3,a5,a6
   260d4:	8e89                	sub	a3,a3,a0
   260d6:	96f6                	add	a3,a3,t4
   260d8:	83c1                	srl	a5,a5,0x10
   260da:	8f99                	sub	a5,a5,a4
   260dc:	4106d713          	sra	a4,a3,0x10
   260e0:	97ba                	add	a5,a5,a4
   260e2:	4107de93          	sra	t4,a5,0x10
   260e6:	0106f6b3          	and	a3,a3,a6
   260ea:	07c2                	sll	a5,a5,0x10
   260ec:	8edd                	or	a3,a3,a5
   260ee:	fed32e23          	sw	a3,-4(t1)
   260f2:	fb1a78e3          	bgeu	s4,a7,260a2 <quorem+0x4a>
   260f6:	421c                	lw	a5,0(a2)
   260f8:	c7bd                	beqz	a5,26166 <quorem+0x10e>
   260fa:	854a                	mv	a0,s2
   260fc:	02a020ef          	jal	28126 <__mcmp>
   26100:	04054663          	bltz	a0,2614c <quorem+0xf4>
   26104:	6641                	lui	a2,0x10
   26106:	85ce                	mv	a1,s3
   26108:	86d6                	mv	a3,s5
   2610a:	4801                	li	a6,0
   2610c:	167d                	add	a2,a2,-1 # ffff <__fw_size__+0x62ef>
   2610e:	4288                	lw	a0,0(a3)
   26110:	419c                	lw	a5,0(a1)
   26112:	0691                	add	a3,a3,4
   26114:	00c578b3          	and	a7,a0,a2
   26118:	00c7f733          	and	a4,a5,a2
   2611c:	41170733          	sub	a4,a4,a7
   26120:	9742                	add	a4,a4,a6
   26122:	8141                	srl	a0,a0,0x10
   26124:	83c1                	srl	a5,a5,0x10
   26126:	8f89                	sub	a5,a5,a0
   26128:	41075513          	sra	a0,a4,0x10
   2612c:	97aa                	add	a5,a5,a0
   2612e:	4107d813          	sra	a6,a5,0x10
   26132:	8f71                	and	a4,a4,a2
   26134:	07c2                	sll	a5,a5,0x10
   26136:	8f5d                	or	a4,a4,a5
   26138:	c198                	sw	a4,0(a1)
   2613a:	0591                	add	a1,a1,4
   2613c:	fcda79e3          	bgeu	s4,a3,2610e <quorem+0xb6>
   26140:	00241793          	sll	a5,s0,0x2
   26144:	97ce                	add	a5,a5,s3
   26146:	4398                	lw	a4,0(a5)
   26148:	cb05                	beqz	a4,26178 <quorem+0x120>
   2614a:	0485                	add	s1,s1,1
   2614c:	8526                	mv	a0,s1
   2614e:	40f2                	lw	ra,28(sp)
   26150:	4462                	lw	s0,24(sp)
   26152:	44d2                	lw	s1,20(sp)
   26154:	4942                	lw	s2,16(sp)
   26156:	49b2                	lw	s3,12(sp)
   26158:	4a22                	lw	s4,8(sp)
   2615a:	4a92                	lw	s5,4(sp)
   2615c:	6105                	add	sp,sp,32
   2615e:	8082                	ret
   26160:	421c                	lw	a5,0(a2)
   26162:	e789                	bnez	a5,2616c <quorem+0x114>
   26164:	147d                	add	s0,s0,-1
   26166:	1671                	add	a2,a2,-4
   26168:	fec9ece3          	bltu	s3,a2,26160 <quorem+0x108>
   2616c:	00892823          	sw	s0,16(s2)
   26170:	b769                	j	260fa <quorem+0xa2>
   26172:	4398                	lw	a4,0(a5)
   26174:	e709                	bnez	a4,2617e <quorem+0x126>
   26176:	147d                	add	s0,s0,-1
   26178:	17f1                	add	a5,a5,-4
   2617a:	fef9ece3          	bltu	s3,a5,26172 <quorem+0x11a>
   2617e:	00892823          	sw	s0,16(s2)
   26182:	b7e1                	j	2614a <quorem+0xf2>
   26184:	4501                	li	a0,0
   26186:	b7e1                	j	2614e <quorem+0xf6>

00026188 <_dtoa_r>:
   26188:	7171                	add	sp,sp,-176
   2618a:	de3e                	sw	a5,60(sp)
   2618c:	515c                	lw	a5,36(a0)
   2618e:	d522                	sw	s0,168(sp)
   26190:	d14a                	sw	s2,160(sp)
   26192:	cd52                	sw	s4,152(sp)
   26194:	cb56                	sw	s5,148(sp)
   26196:	c95a                	sw	s6,144(sp)
   26198:	d706                	sw	ra,172(sp)
   2619a:	d326                	sw	s1,164(sp)
   2619c:	cf4e                	sw	s3,156(sp)
   2619e:	c75e                	sw	s7,140(sp)
   261a0:	c562                	sw	s8,136(sp)
   261a2:	c366                	sw	s9,132(sp)
   261a4:	c16a                	sw	s10,128(sp)
   261a6:	deee                	sw	s11,124(sp)
   261a8:	c62a                	sw	a0,12(sp)
   261aa:	ce36                	sw	a3,28(sp)
   261ac:	d23a                	sw	a4,36(sp)
   261ae:	d446                	sw	a7,40(sp)
   261b0:	8aae                	mv	s5,a1
   261b2:	8432                	mv	s0,a2
   261b4:	8942                	mv	s2,a6
   261b6:	8a2e                	mv	s4,a1
   261b8:	8b32                	mv	s6,a2
   261ba:	ef85                	bnez	a5,261f2 <_dtoa_r+0x6a>
   261bc:	4541                	li	a0,16
   261be:	04b010ef          	jal	27a08 <malloc>
   261c2:	47b2                	lw	a5,12(sp)
   261c4:	d3c8                	sw	a0,36(a5)
   261c6:	ed11                	bnez	a0,261e2 <_dtoa_r+0x5a>
   261c8:	000296b7          	lui	a3,0x29
   261cc:	5ec68693          	add	a3,a3,1516 # 295ec <__clz_tab+0x18c>
   261d0:	4601                	li	a2,0
   261d2:	0ea00593          	li	a1,234
   261d6:	00029537          	lui	a0,0x29
   261da:	60450513          	add	a0,a0,1540 # 29604 <__clz_tab+0x1a4>
   261de:	71d020ef          	jal	290fa <__assert_func>
   261e2:	00052223          	sw	zero,4(a0)
   261e6:	00052423          	sw	zero,8(a0)
   261ea:	00052023          	sw	zero,0(a0)
   261ee:	00052623          	sw	zero,12(a0)
   261f2:	47b2                	lw	a5,12(sp)
   261f4:	53dc                	lw	a5,36(a5)
   261f6:	438c                	lw	a1,0(a5)
   261f8:	cd91                	beqz	a1,26214 <_dtoa_r+0x8c>
   261fa:	43d8                	lw	a4,4(a5)
   261fc:	4532                	lw	a0,12(sp)
   261fe:	4785                	li	a5,1
   26200:	00e797b3          	sll	a5,a5,a4
   26204:	c59c                	sw	a5,8(a1)
   26206:	c1d8                	sw	a4,4(a1)
   26208:	10b010ef          	jal	27b12 <_Bfree>
   2620c:	47b2                	lw	a5,12(sp)
   2620e:	53dc                	lw	a5,36(a5)
   26210:	0007a023          	sw	zero,0(a5)
   26214:	04045763          	bgez	s0,26262 <_dtoa_r+0xda>
   26218:	4785                	li	a5,1
   2621a:	0406                	sll	s0,s0,0x1
   2621c:	00f92023          	sw	a5,0(s2)
   26220:	00145b13          	srl	s6,s0,0x1
   26224:	7ff007b7          	lui	a5,0x7ff00
   26228:	00fb7733          	and	a4,s6,a5
   2622c:	02f71e63          	bne	a4,a5,26268 <_dtoa_r+0xe0>
   26230:	5772                	lw	a4,60(sp)
   26232:	6789                	lui	a5,0x2
   26234:	0b32                	sll	s6,s6,0xc
   26236:	70f78793          	add	a5,a5,1807 # 270f <__eh_frame_hdr_end+0x270f>
   2623a:	00cb5b13          	srl	s6,s6,0xc
   2623e:	c31c                	sw	a5,0(a4)
   26240:	015b6b33          	or	s6,s6,s5
   26244:	2e0b0ce3          	beqz	s6,26d3c <_dtoa_r+0xbb4>
   26248:	5722                	lw	a4,40(sp)
   2624a:	000297b7          	lui	a5,0x29
   2624e:	5e878413          	add	s0,a5,1512 # 295e8 <__clz_tab+0x188>
   26252:	300701e3          	beqz	a4,26d54 <_dtoa_r+0xbcc>
   26256:	000297b7          	lui	a5,0x29
   2625a:	5eb78793          	add	a5,a5,1515 # 295eb <__clz_tab+0x18b>
   2625e:	2f30006f          	j	26d50 <_dtoa_r+0xbc8>
   26262:	00092023          	sw	zero,0(s2)
   26266:	bf7d                	j	26224 <_dtoa_r+0x9c>
   26268:	4601                	li	a2,0
   2626a:	4681                	li	a3,0
   2626c:	8556                	mv	a0,s5
   2626e:	85da                	mv	a1,s6
   26270:	8bd6                	mv	s7,s5
   26272:	dc56                	sw	s5,56(sp)
   26274:	d85a                	sw	s6,48(sp)
   26276:	966fc0ef          	jal	223dc <__eqdf2>
   2627a:	e115                	bnez	a0,2629e <_dtoa_r+0x116>
   2627c:	5772                	lw	a4,60(sp)
   2627e:	4785                	li	a5,1
   26280:	c31c                	sw	a5,0(a4)
   26282:	57a2                	lw	a5,40(sp)
   26284:	c799                	beqz	a5,26292 <_dtoa_r+0x10a>
   26286:	5722                	lw	a4,40(sp)
   26288:	000297b7          	lui	a5,0x29
   2628c:	59978793          	add	a5,a5,1433 # 29599 <__clz_tab+0x139>
   26290:	c31c                	sw	a5,0(a4)
   26292:	000297b7          	lui	a5,0x29
   26296:	59878413          	add	s0,a5,1432 # 29598 <__clz_tab+0x138>
   2629a:	2bb0006f          	j	26d54 <_dtoa_r+0xbcc>
   2629e:	4532                	lw	a0,12(sp)
   262a0:	10b8                	add	a4,sp,104
   262a2:	10f4                	add	a3,sp,108
   262a4:	865a                	mv	a2,s6
   262a6:	85d6                	mv	a1,s5
   262a8:	114020ef          	jal	283bc <__d2b>
   262ac:	014b5913          	srl	s2,s6,0x14
   262b0:	cc2a                	sw	a0,24(sp)
   262b2:	7ff97913          	and	s2,s2,2047
   262b6:	59a6                	lw	s3,104(sp)
   262b8:	12090663          	beqz	s2,263e4 <_dtoa_r+0x25c>
   262bc:	57c2                	lw	a5,48(sp)
   262be:	3ff00737          	lui	a4,0x3ff00
   262c2:	c0190913          	add	s2,s2,-1023
   262c6:	07b2                	sll	a5,a5,0xc
   262c8:	83b1                	srl	a5,a5,0xc
   262ca:	8fd9                	or	a5,a5,a4
   262cc:	c282                	sw	zero,68(sp)
   262ce:	0002a737          	lui	a4,0x2a
   262d2:	c7872603          	lw	a2,-904(a4) # 29c78 <_global_impure_ptr+0x50>
   262d6:	c7c72683          	lw	a3,-900(a4)
   262da:	855e                	mv	a0,s7
   262dc:	85be                	mv	a1,a5
   262de:	ba4fb0ef          	jal	21682 <__subdf3>
   262e2:	0002a7b7          	lui	a5,0x2a
   262e6:	c807a603          	lw	a2,-896(a5) # 29c80 <_global_impure_ptr+0x58>
   262ea:	c847a683          	lw	a3,-892(a5)
   262ee:	f2bfa0ef          	jal	21218 <__muldf3>
   262f2:	0002a7b7          	lui	a5,0x2a
   262f6:	c887a603          	lw	a2,-888(a5) # 29c88 <_global_impure_ptr+0x60>
   262fa:	c8c7a683          	lw	a3,-884(a5)
   262fe:	af1fb0ef          	jal	21dee <__adddf3>
   26302:	8baa                	mv	s7,a0
   26304:	854a                	mv	a0,s2
   26306:	8aae                	mv	s5,a1
   26308:	b0efc0ef          	jal	22616 <__floatsidf>
   2630c:	0002a7b7          	lui	a5,0x2a
   26310:	c907a603          	lw	a2,-880(a5) # 29c90 <_global_impure_ptr+0x68>
   26314:	c947a683          	lw	a3,-876(a5)
   26318:	f01fa0ef          	jal	21218 <__muldf3>
   2631c:	862a                	mv	a2,a0
   2631e:	86ae                	mv	a3,a1
   26320:	855e                	mv	a0,s7
   26322:	85d6                	mv	a1,s5
   26324:	acbfb0ef          	jal	21dee <__adddf3>
   26328:	8baa                	mv	s7,a0
   2632a:	8aae                	mv	s5,a1
   2632c:	a86fc0ef          	jal	225b2 <__fixdfsi>
   26330:	8c2a                	mv	s8,a0
   26332:	4601                	li	a2,0
   26334:	4681                	li	a3,0
   26336:	855e                	mv	a0,s7
   26338:	85d6                	mv	a1,s5
   2633a:	9a6fc0ef          	jal	224e0 <__ledf2>
   2633e:	00055b63          	bgez	a0,26354 <_dtoa_r+0x1cc>
   26342:	8562                	mv	a0,s8
   26344:	ad2fc0ef          	jal	22616 <__floatsidf>
   26348:	865e                	mv	a2,s7
   2634a:	86d6                	mv	a3,s5
   2634c:	890fc0ef          	jal	223dc <__eqdf2>
   26350:	c111                	beqz	a0,26354 <_dtoa_r+0x1cc>
   26352:	1c7d                	add	s8,s8,-1
   26354:	4705                	li	a4,1
   26356:	47d9                	li	a5,22
   26358:	da3a                	sw	a4,52(sp)
   2635a:	0387e363          	bltu	a5,s8,26380 <_dtoa_r+0x1f8>
   2635e:	0002a737          	lui	a4,0x2a
   26362:	003c1793          	sll	a5,s8,0x3
   26366:	b4870713          	add	a4,a4,-1208 # 29b48 <__mprec_tens>
   2636a:	97ba                	add	a5,a5,a4
   2636c:	4390                	lw	a2,0(a5)
   2636e:	43d4                	lw	a3,4(a5)
   26370:	5562                	lw	a0,56(sp)
   26372:	55c2                	lw	a1,48(sp)
   26374:	96cfc0ef          	jal	224e0 <__ledf2>
   26378:	00055363          	bgez	a0,2637e <_dtoa_r+0x1f6>
   2637c:	1c7d                	add	s8,s8,-1
   2637e:	da02                	sw	zero,52(sp)
   26380:	412989b3          	sub	s3,s3,s2
   26384:	fff98c93          	add	s9,s3,-1
   26388:	4b81                	li	s7,0
   2638a:	000cd663          	bgez	s9,26396 <_dtoa_r+0x20e>
   2638e:	4b85                	li	s7,1
   26390:	413b8bb3          	sub	s7,s7,s3
   26394:	4c81                	li	s9,0
   26396:	080c4863          	bltz	s8,26426 <_dtoa_r+0x29e>
   2639a:	9ce2                	add	s9,s9,s8
   2639c:	d662                	sw	s8,44(sp)
   2639e:	4d01                	li	s10,0
   263a0:	4772                	lw	a4,28(sp)
   263a2:	47a5                	li	a5,9
   263a4:	0ee7e263          	bltu	a5,a4,26488 <_dtoa_r+0x300>
   263a8:	4795                	li	a5,5
   263aa:	4905                	li	s2,1
   263ac:	00e7d663          	bge	a5,a4,263b8 <_dtoa_r+0x230>
   263b0:	ffc70793          	add	a5,a4,-4
   263b4:	ce3e                	sw	a5,28(sp)
   263b6:	4901                	li	s2,0
   263b8:	4772                	lw	a4,28(sp)
   263ba:	4791                	li	a5,4
   263bc:	06f70b63          	beq	a4,a5,26432 <_dtoa_r+0x2aa>
   263c0:	4795                	li	a5,5
   263c2:	0af70763          	beq	a4,a5,26470 <_dtoa_r+0x2e8>
   263c6:	4789                	li	a5,2
   263c8:	0af70263          	beq	a4,a5,2646c <_dtoa_r+0x2e4>
   263cc:	478d                	li	a5,3
   263ce:	d002                	sw	zero,32(sp)
   263d0:	0af70263          	beq	a4,a5,26474 <_dtoa_r+0x2ec>
   263d4:	4785                	li	a5,1
   263d6:	d03e                	sw	a5,32(sp)
   263d8:	57fd                	li	a5,-1
   263da:	c83e                	sw	a5,16(sp)
   263dc:	5dfd                	li	s11,-1
   263de:	47c9                	li	a5,18
   263e0:	d202                	sw	zero,36(sp)
   263e2:	a8b9                	j	26440 <_dtoa_r+0x2b8>
   263e4:	5936                	lw	s2,108(sp)
   263e6:	02000793          	li	a5,32
   263ea:	994e                	add	s2,s2,s3
   263ec:	43290713          	add	a4,s2,1074
   263f0:	02e7d763          	bge	a5,a4,2641e <_dtoa_r+0x296>
   263f4:	04000793          	li	a5,64
   263f8:	8f99                	sub	a5,a5,a4
   263fa:	41290713          	add	a4,s2,1042
   263fe:	00fb17b3          	sll	a5,s6,a5
   26402:	00ead733          	srl	a4,s5,a4
   26406:	00e7e533          	or	a0,a5,a4
   2640a:	8e9fb0ef          	jal	21cf2 <__floatunsidf>
   2640e:	fe1007b7          	lui	a5,0xfe100
   26412:	4705                	li	a4,1
   26414:	8baa                	mv	s7,a0
   26416:	97ae                	add	a5,a5,a1
   26418:	197d                	add	s2,s2,-1
   2641a:	c2ba                	sw	a4,68(sp)
   2641c:	bd4d                	j	262ce <_dtoa_r+0x146>
   2641e:	8f99                	sub	a5,a5,a4
   26420:	00fa9533          	sll	a0,s5,a5
   26424:	b7dd                	j	2640a <_dtoa_r+0x282>
   26426:	418b8bb3          	sub	s7,s7,s8
   2642a:	41800d33          	neg	s10,s8
   2642e:	d602                	sw	zero,44(sp)
   26430:	bf85                	j	263a0 <_dtoa_r+0x218>
   26432:	4785                	li	a5,1
   26434:	d03e                	sw	a5,32(sp)
   26436:	5792                	lw	a5,36(sp)
   26438:	04f05b63          	blez	a5,2648e <_dtoa_r+0x306>
   2643c:	c83e                	sw	a5,16(sp)
   2643e:	8dbe                	mv	s11,a5
   26440:	4732                	lw	a4,12(sp)
   26442:	4581                	li	a1,0
   26444:	5354                	lw	a3,36(a4)
   26446:	4711                	li	a4,4
   26448:	01470613          	add	a2,a4,20
   2644c:	04c7f763          	bgeu	a5,a2,2649a <_dtoa_r+0x312>
   26450:	4532                	lw	a0,12(sp)
   26452:	c2cc                	sw	a1,4(a3)
   26454:	612010ef          	jal	27a66 <_Balloc>
   26458:	842a                	mv	s0,a0
   2645a:	e139                	bnez	a0,264a0 <_dtoa_r+0x318>
   2645c:	000296b7          	lui	a3,0x29
   26460:	65068693          	add	a3,a3,1616 # 29650 <__clz_tab+0x1f0>
   26464:	4601                	li	a2,0
   26466:	1aa00593          	li	a1,426
   2646a:	b3b5                	j	261d6 <_dtoa_r+0x4e>
   2646c:	d002                	sw	zero,32(sp)
   2646e:	b7e1                	j	26436 <_dtoa_r+0x2ae>
   26470:	4785                	li	a5,1
   26472:	d03e                	sw	a5,32(sp)
   26474:	5792                	lw	a5,36(sp)
   26476:	97e2                	add	a5,a5,s8
   26478:	c83e                	sw	a5,16(sp)
   2647a:	00178d93          	add	s11,a5,1 # fe100001 <__share_mem_end__+0xfd040001>
   2647e:	87ee                	mv	a5,s11
   26480:	fdb040e3          	bgtz	s11,26440 <_dtoa_r+0x2b8>
   26484:	4785                	li	a5,1
   26486:	bf6d                	j	26440 <_dtoa_r+0x2b8>
   26488:	4905                	li	s2,1
   2648a:	ce02                	sw	zero,28(sp)
   2648c:	b7a1                	j	263d4 <_dtoa_r+0x24c>
   2648e:	4785                	li	a5,1
   26490:	4705                	li	a4,1
   26492:	c83e                	sw	a5,16(sp)
   26494:	4d85                	li	s11,1
   26496:	d23a                	sw	a4,36(sp)
   26498:	b765                	j	26440 <_dtoa_r+0x2b8>
   2649a:	0585                	add	a1,a1,1
   2649c:	0706                	sll	a4,a4,0x1
   2649e:	b76d                	j	26448 <_dtoa_r+0x2c0>
   264a0:	47b2                	lw	a5,12(sp)
   264a2:	53dc                	lw	a5,36(a5)
   264a4:	c388                	sw	a0,0(a5)
   264a6:	47b9                	li	a5,14
   264a8:	13b7e363          	bltu	a5,s11,265ce <_dtoa_r+0x446>
   264ac:	12090163          	beqz	s2,265ce <_dtoa_r+0x446>
   264b0:	1d805463          	blez	s8,26678 <_dtoa_r+0x4f0>
   264b4:	00fc7793          	and	a5,s8,15
   264b8:	0002a737          	lui	a4,0x2a
   264bc:	b4870713          	add	a4,a4,-1208 # 29b48 <__mprec_tens>
   264c0:	078e                	sll	a5,a5,0x3
   264c2:	404c5993          	sra	s3,s8,0x4
   264c6:	97ba                	add	a5,a5,a4
   264c8:	0002a937          	lui	s2,0x2a
   264cc:	0109f693          	and	a3,s3,16
   264d0:	4398                	lw	a4,0(a5)
   264d2:	43c4                	lw	s1,4(a5)
   264d4:	b2090913          	add	s2,s2,-1248 # 29b20 <__mprec_bigtens>
   264d8:	4a89                	li	s5,2
   264da:	c285                	beqz	a3,264fa <_dtoa_r+0x372>
   264dc:	02092603          	lw	a2,32(s2)
   264e0:	02492683          	lw	a3,36(s2)
   264e4:	5562                	lw	a0,56(sp)
   264e6:	55c2                	lw	a1,48(sp)
   264e8:	c0ba                	sw	a4,64(sp)
   264ea:	00f9f993          	and	s3,s3,15
   264ee:	fe8fa0ef          	jal	20cd6 <__divdf3>
   264f2:	4706                	lw	a4,64(sp)
   264f4:	8a2a                	mv	s4,a0
   264f6:	8b2e                	mv	s6,a1
   264f8:	4a8d                	li	s5,3
   264fa:	14099d63          	bnez	s3,26654 <_dtoa_r+0x4cc>
   264fe:	8552                	mv	a0,s4
   26500:	863a                	mv	a2,a4
   26502:	86a6                	mv	a3,s1
   26504:	85da                	mv	a1,s6
   26506:	fd0fa0ef          	jal	20cd6 <__divdf3>
   2650a:	8a2a                	mv	s4,a0
   2650c:	8b2e                	mv	s6,a1
   2650e:	57d2                	lw	a5,52(sp)
   26510:	1c078563          	beqz	a5,266da <_dtoa_r+0x552>
   26514:	0002a7b7          	lui	a5,0x2a
   26518:	c407a603          	lw	a2,-960(a5) # 29c40 <_global_impure_ptr+0x18>
   2651c:	c447a683          	lw	a3,-956(a5)
   26520:	8552                	mv	a0,s4
   26522:	85da                	mv	a1,s6
   26524:	fbdfb0ef          	jal	224e0 <__ledf2>
   26528:	1a055963          	bgez	a0,266da <_dtoa_r+0x552>
   2652c:	1a0d8a63          	beqz	s11,266e0 <_dtoa_r+0x558>
   26530:	47c2                	lw	a5,16(sp)
   26532:	08f05c63          	blez	a5,265ca <_dtoa_r+0x442>
   26536:	0002a7b7          	lui	a5,0x2a
   2653a:	c987a603          	lw	a2,-872(a5) # 29c98 <_global_impure_ptr+0x70>
   2653e:	c9c7a683          	lw	a3,-868(a5)
   26542:	8552                	mv	a0,s4
   26544:	85da                	mv	a1,s6
   26546:	cd3fa0ef          	jal	21218 <__muldf3>
   2654a:	4742                	lw	a4,16(sp)
   2654c:	fffc0493          	add	s1,s8,-1
   26550:	8a2a                	mv	s4,a0
   26552:	8b2e                	mv	s6,a1
   26554:	0a85                	add	s5,s5,1
   26556:	8556                	mv	a0,s5
   26558:	c8ba                	sw	a4,80(sp)
   2655a:	c4d2                	sw	s4,72(sp)
   2655c:	c0da                	sw	s6,64(sp)
   2655e:	8b8fc0ef          	jal	22616 <__floatsidf>
   26562:	8652                	mv	a2,s4
   26564:	86da                	mv	a3,s6
   26566:	cb3fa0ef          	jal	21218 <__muldf3>
   2656a:	0002a6b7          	lui	a3,0x2a
   2656e:	ca06a603          	lw	a2,-864(a3) # 29ca0 <_global_impure_ptr+0x78>
   26572:	ca46a683          	lw	a3,-860(a3)
   26576:	89d2                	mv	s3,s4
   26578:	895a                	mv	s2,s6
   2657a:	875fb0ef          	jal	21dee <__adddf3>
   2657e:	4746                	lw	a4,80(sp)
   26580:	fcc008b7          	lui	a7,0xfcc00
   26584:	8b2a                	mv	s6,a0
   26586:	00b88a33          	add	s4,a7,a1
   2658a:	14071e63          	bnez	a4,266e6 <_dtoa_r+0x55e>
   2658e:	0002a737          	lui	a4,0x2a
   26592:	ca872603          	lw	a2,-856(a4) # 29ca8 <_global_impure_ptr+0x80>
   26596:	cac72683          	lw	a3,-852(a4)
   2659a:	854e                	mv	a0,s3
   2659c:	85ca                	mv	a1,s2
   2659e:	8e4fb0ef          	jal	21682 <__subdf3>
   265a2:	865a                	mv	a2,s6
   265a4:	86d2                	mv	a3,s4
   265a6:	89aa                	mv	s3,a0
   265a8:	892e                	mv	s2,a1
   265aa:	e9dfb0ef          	jal	22446 <__gedf2>
   265ae:	5aa04463          	bgtz	a0,26b56 <_dtoa_r+0x9ce>
   265b2:	800007b7          	lui	a5,0x80000
   265b6:	0147c7b3          	xor	a5,a5,s4
   265ba:	865a                	mv	a2,s6
   265bc:	86be                	mv	a3,a5
   265be:	854e                	mv	a0,s3
   265c0:	85ca                	mv	a1,s2
   265c2:	f1ffb0ef          	jal	224e0 <__ledf2>
   265c6:	04054d63          	bltz	a0,26620 <_dtoa_r+0x498>
   265ca:	5a62                	lw	s4,56(sp)
   265cc:	5b42                	lw	s6,48(sp)
   265ce:	57b6                	lw	a5,108(sp)
   265d0:	3807c563          	bltz	a5,2695a <_dtoa_r+0x7d2>
   265d4:	4739                	li	a4,14
   265d6:	39874263          	blt	a4,s8,2695a <_dtoa_r+0x7d2>
   265da:	0002a737          	lui	a4,0x2a
   265de:	003c1793          	sll	a5,s8,0x3
   265e2:	b4870713          	add	a4,a4,-1208 # 29b48 <__mprec_tens>
   265e6:	97ba                	add	a5,a5,a4
   265e8:	0047a803          	lw	a6,4(a5) # 80000004 <__share_mem_end__+0x7ef40004>
   265ec:	439c                	lw	a5,0(a5)
   265ee:	ca42                	sw	a6,20(sp)
   265f0:	c83e                	sw	a5,16(sp)
   265f2:	5792                	lw	a5,36(sp)
   265f4:	2607df63          	bgez	a5,26872 <_dtoa_r+0x6ea>
   265f8:	27b04d63          	bgtz	s11,26872 <_dtoa_r+0x6ea>
   265fc:	020d9263          	bnez	s11,26620 <_dtoa_r+0x498>
   26600:	0002a7b7          	lui	a5,0x2a
   26604:	ca87a603          	lw	a2,-856(a5) # 29ca8 <_global_impure_ptr+0x80>
   26608:	cac7a683          	lw	a3,-852(a5)
   2660c:	4542                	lw	a0,16(sp)
   2660e:	45d2                	lw	a1,20(sp)
   26610:	c09fa0ef          	jal	21218 <__muldf3>
   26614:	8652                	mv	a2,s4
   26616:	86da                	mv	a3,s6
   26618:	e2ffb0ef          	jal	22446 <__gedf2>
   2661c:	52054c63          	bltz	a0,26b54 <_dtoa_r+0x9cc>
   26620:	4a81                	li	s5,0
   26622:	4901                	li	s2,0
   26624:	5792                	lw	a5,36(sp)
   26626:	8a22                	mv	s4,s0
   26628:	fff7c493          	not	s1,a5
   2662c:	4b01                	li	s6,0
   2662e:	4532                	lw	a0,12(sp)
   26630:	85d6                	mv	a1,s5
   26632:	4e0010ef          	jal	27b12 <_Bfree>
   26636:	22090563          	beqz	s2,26860 <_dtoa_r+0x6d8>
   2663a:	000b0863          	beqz	s6,2664a <_dtoa_r+0x4c2>
   2663e:	012b0663          	beq	s6,s2,2664a <_dtoa_r+0x4c2>
   26642:	4532                	lw	a0,12(sp)
   26644:	85da                	mv	a1,s6
   26646:	4cc010ef          	jal	27b12 <_Bfree>
   2664a:	4532                	lw	a0,12(sp)
   2664c:	85ca                	mv	a1,s2
   2664e:	4c4010ef          	jal	27b12 <_Bfree>
   26652:	a439                	j	26860 <_dtoa_r+0x6d8>
   26654:	0019f693          	and	a3,s3,1
   26658:	ce81                	beqz	a3,26670 <_dtoa_r+0x4e8>
   2665a:	00092603          	lw	a2,0(s2)
   2665e:	00492683          	lw	a3,4(s2)
   26662:	853a                	mv	a0,a4
   26664:	85a6                	mv	a1,s1
   26666:	bb3fa0ef          	jal	21218 <__muldf3>
   2666a:	0a85                	add	s5,s5,1
   2666c:	872a                	mv	a4,a0
   2666e:	84ae                	mv	s1,a1
   26670:	4019d993          	sra	s3,s3,0x1
   26674:	0921                	add	s2,s2,8
   26676:	b551                	j	264fa <_dtoa_r+0x372>
   26678:	4a89                	li	s5,2
   2667a:	e80c0ae3          	beqz	s8,2650e <_dtoa_r+0x386>
   2667e:	41800933          	neg	s2,s8
   26682:	00f97793          	and	a5,s2,15
   26686:	0002a737          	lui	a4,0x2a
   2668a:	b4870713          	add	a4,a4,-1208 # 29b48 <__mprec_tens>
   2668e:	078e                	sll	a5,a5,0x3
   26690:	97ba                	add	a5,a5,a4
   26692:	4390                	lw	a2,0(a5)
   26694:	43d4                	lw	a3,4(a5)
   26696:	5562                	lw	a0,56(sp)
   26698:	55c2                	lw	a1,48(sp)
   2669a:	0002a9b7          	lui	s3,0x2a
   2669e:	40495913          	sra	s2,s2,0x4
   266a2:	b77fa0ef          	jal	21218 <__muldf3>
   266a6:	8a2a                	mv	s4,a0
   266a8:	8b2e                	mv	s6,a1
   266aa:	b2098993          	add	s3,s3,-1248 # 29b20 <__mprec_bigtens>
   266ae:	4781                	li	a5,0
   266b0:	00091663          	bnez	s2,266bc <_dtoa_r+0x534>
   266b4:	e4078de3          	beqz	a5,2650e <_dtoa_r+0x386>
   266b8:	8a2a                	mv	s4,a0
   266ba:	bd89                	j	2650c <_dtoa_r+0x384>
   266bc:	00197713          	and	a4,s2,1
   266c0:	cb09                	beqz	a4,266d2 <_dtoa_r+0x54a>
   266c2:	0009a603          	lw	a2,0(s3)
   266c6:	0049a683          	lw	a3,4(s3)
   266ca:	0a85                	add	s5,s5,1
   266cc:	b4dfa0ef          	jal	21218 <__muldf3>
   266d0:	4785                	li	a5,1
   266d2:	40195913          	sra	s2,s2,0x1
   266d6:	09a1                	add	s3,s3,8
   266d8:	bfe1                	j	266b0 <_dtoa_r+0x528>
   266da:	84e2                	mv	s1,s8
   266dc:	876e                	mv	a4,s11
   266de:	bda5                	j	26556 <_dtoa_r+0x3ce>
   266e0:	84e2                	mv	s1,s8
   266e2:	4701                	li	a4,0
   266e4:	bd8d                	j	26556 <_dtoa_r+0x3ce>
   266e6:	fff70793          	add	a5,a4,-1
   266ea:	0002a6b7          	lui	a3,0x2a
   266ee:	b4868693          	add	a3,a3,-1208 # 29b48 <__mprec_tens>
   266f2:	078e                	sll	a5,a5,0x3
   266f4:	97b6                	add	a5,a5,a3
   266f6:	4390                	lw	a2,0(a5)
   266f8:	43d4                	lw	a3,4(a5)
   266fa:	00e407b3          	add	a5,s0,a4
   266fe:	c0be                	sw	a5,64(sp)
   26700:	5782                	lw	a5,32(sp)
   26702:	cfc5                	beqz	a5,267ba <_dtoa_r+0x632>
   26704:	0002a7b7          	lui	a5,0x2a
   26708:	c387a503          	lw	a0,-968(a5) # 29c38 <_global_impure_ptr+0x10>
   2670c:	c3c7a583          	lw	a1,-964(a5)
   26710:	c4d2                	sw	s4,72(sp)
   26712:	dc4fa0ef          	jal	20cd6 <__divdf3>
   26716:	865a                	mv	a2,s6
   26718:	86d2                	mv	a3,s4
   2671a:	f69fa0ef          	jal	21682 <__subdf3>
   2671e:	0002a7b7          	lui	a5,0x2a
   26722:	c447a803          	lw	a6,-956(a5) # 29c44 <_global_impure_ptr+0x1c>
   26726:	c407a783          	lw	a5,-960(a5)
   2672a:	8aaa                	mv	s5,a0
   2672c:	cac2                	sw	a6,84(sp)
   2672e:	c8be                	sw	a5,80(sp)
   26730:	0002a7b7          	lui	a5,0x2a
   26734:	c9c7a803          	lw	a6,-868(a5) # 29c9c <_global_impure_ptr+0x74>
   26738:	c987a783          	lw	a5,-872(a5)
   2673c:	8b2e                	mv	s6,a1
   2673e:	8a22                	mv	s4,s0
   26740:	c4be                	sw	a5,72(sp)
   26742:	c6c2                	sw	a6,76(sp)
   26744:	85ca                	mv	a1,s2
   26746:	854e                	mv	a0,s3
   26748:	e6bfb0ef          	jal	225b2 <__fixdfsi>
   2674c:	ccaa                	sw	a0,88(sp)
   2674e:	ec9fb0ef          	jal	22616 <__floatsidf>
   26752:	862a                	mv	a2,a0
   26754:	86ae                	mv	a3,a1
   26756:	854e                	mv	a0,s3
   26758:	85ca                	mv	a1,s2
   2675a:	f29fa0ef          	jal	21682 <__subdf3>
   2675e:	47e6                	lw	a5,88(sp)
   26760:	0a05                	add	s4,s4,1
   26762:	8656                	mv	a2,s5
   26764:	03078793          	add	a5,a5,48
   26768:	fefa0fa3          	sb	a5,-1(s4)
   2676c:	86da                	mv	a3,s6
   2676e:	892a                	mv	s2,a0
   26770:	89ae                	mv	s3,a1
   26772:	d6ffb0ef          	jal	224e0 <__ledf2>
   26776:	0e054563          	bltz	a0,26860 <_dtoa_r+0x6d8>
   2677a:	4546                	lw	a0,80(sp)
   2677c:	45d6                	lw	a1,84(sp)
   2677e:	864a                	mv	a2,s2
   26780:	86ce                	mv	a3,s3
   26782:	f01fa0ef          	jal	21682 <__subdf3>
   26786:	8656                	mv	a2,s5
   26788:	86da                	mv	a3,s6
   2678a:	d57fb0ef          	jal	224e0 <__ledf2>
   2678e:	18054163          	bltz	a0,26910 <_dtoa_r+0x788>
   26792:	4786                	lw	a5,64(sp)
   26794:	e2fa0be3          	beq	s4,a5,265ca <_dtoa_r+0x442>
   26798:	4626                	lw	a2,72(sp)
   2679a:	46b6                	lw	a3,76(sp)
   2679c:	8556                	mv	a0,s5
   2679e:	85da                	mv	a1,s6
   267a0:	a79fa0ef          	jal	21218 <__muldf3>
   267a4:	4626                	lw	a2,72(sp)
   267a6:	46b6                	lw	a3,76(sp)
   267a8:	8aaa                	mv	s5,a0
   267aa:	8b2e                	mv	s6,a1
   267ac:	854a                	mv	a0,s2
   267ae:	85ce                	mv	a1,s3
   267b0:	a69fa0ef          	jal	21218 <__muldf3>
   267b4:	89aa                	mv	s3,a0
   267b6:	892e                	mv	s2,a1
   267b8:	b771                	j	26744 <_dtoa_r+0x5bc>
   267ba:	85d2                	mv	a1,s4
   267bc:	a5dfa0ef          	jal	21218 <__muldf3>
   267c0:	4786                	lw	a5,64(sp)
   267c2:	8b2a                	mv	s6,a0
   267c4:	c8ae                	sw	a1,80(sp)
   267c6:	c4be                	sw	a5,72(sp)
   267c8:	0002a7b7          	lui	a5,0x2a
   267cc:	c9c7a803          	lw	a6,-868(a5) # 29c9c <_global_impure_ptr+0x74>
   267d0:	c987a783          	lw	a5,-872(a5)
   267d4:	8aa2                	mv	s5,s0
   267d6:	cec2                	sw	a6,92(sp)
   267d8:	ccbe                	sw	a5,88(sp)
   267da:	85ca                	mv	a1,s2
   267dc:	854e                	mv	a0,s3
   267de:	dd5fb0ef          	jal	225b2 <__fixdfsi>
   267e2:	8a2a                	mv	s4,a0
   267e4:	e33fb0ef          	jal	22616 <__floatsidf>
   267e8:	862a                	mv	a2,a0
   267ea:	86ae                	mv	a3,a1
   267ec:	854e                	mv	a0,s3
   267ee:	85ca                	mv	a1,s2
   267f0:	e93fa0ef          	jal	21682 <__subdf3>
   267f4:	030a0793          	add	a5,s4,48
   267f8:	00fa8023          	sb	a5,0(s5)
   267fc:	4786                	lw	a5,64(sp)
   267fe:	0a85                	add	s5,s5,1
   26800:	89aa                	mv	s3,a0
   26802:	892e                	mv	s2,a1
   26804:	06fa9063          	bne	s5,a5,26864 <_dtoa_r+0x6dc>
   26808:	0002aa37          	lui	s4,0x2a
   2680c:	c38a2603          	lw	a2,-968(s4) # 29c38 <_global_impure_ptr+0x10>
   26810:	c3ca2683          	lw	a3,-964(s4)
   26814:	45c6                	lw	a1,80(sp)
   26816:	855a                	mv	a0,s6
   26818:	dd6fb0ef          	jal	21dee <__adddf3>
   2681c:	862a                	mv	a2,a0
   2681e:	86ae                	mv	a3,a1
   26820:	854e                	mv	a0,s3
   26822:	85ca                	mv	a1,s2
   26824:	c23fb0ef          	jal	22446 <__gedf2>
   26828:	0ea04363          	bgtz	a0,2690e <_dtoa_r+0x786>
   2682c:	46c6                	lw	a3,80(sp)
   2682e:	c38a2503          	lw	a0,-968(s4)
   26832:	c3ca2583          	lw	a1,-964(s4)
   26836:	865a                	mv	a2,s6
   26838:	e4bfa0ef          	jal	21682 <__subdf3>
   2683c:	862a                	mv	a2,a0
   2683e:	86ae                	mv	a3,a1
   26840:	854e                	mv	a0,s3
   26842:	85ca                	mv	a1,s2
   26844:	c9dfb0ef          	jal	224e0 <__ledf2>
   26848:	d80551e3          	bgez	a0,265ca <_dtoa_r+0x442>
   2684c:	03000793          	li	a5,48
   26850:	4a26                	lw	s4,72(sp)
   26852:	fffa0713          	add	a4,s4,-1
   26856:	c4ba                	sw	a4,72(sp)
   26858:	fffa4703          	lbu	a4,-1(s4)
   2685c:	fef70ae3          	beq	a4,a5,26850 <_dtoa_r+0x6c8>
   26860:	8c26                	mv	s8,s1
   26862:	a071                	j	268ee <_dtoa_r+0x766>
   26864:	4666                	lw	a2,88(sp)
   26866:	46f6                	lw	a3,92(sp)
   26868:	9b1fa0ef          	jal	21218 <__muldf3>
   2686c:	89aa                	mv	s3,a0
   2686e:	892e                	mv	s2,a1
   26870:	b7ad                	j	267da <_dtoa_r+0x652>
   26872:	0002a6b7          	lui	a3,0x2a
   26876:	84da                	mv	s1,s6
   26878:	c9c6ab83          	lw	s7,-868(a3) # 29c9c <_global_impure_ptr+0x74>
   2687c:	c986ab03          	lw	s6,-872(a3)
   26880:	8952                	mv	s2,s4
   26882:	00140c93          	add	s9,s0,1
   26886:	9da2                	add	s11,s11,s0
   26888:	4642                	lw	a2,16(sp)
   2688a:	46d2                	lw	a3,20(sp)
   2688c:	854a                	mv	a0,s2
   2688e:	85a6                	mv	a1,s1
   26890:	c46fa0ef          	jal	20cd6 <__divdf3>
   26894:	d1ffb0ef          	jal	225b2 <__fixdfsi>
   26898:	8aaa                	mv	s5,a0
   2689a:	d7dfb0ef          	jal	22616 <__floatsidf>
   2689e:	4642                	lw	a2,16(sp)
   268a0:	46d2                	lw	a3,20(sp)
   268a2:	8a66                	mv	s4,s9
   268a4:	975fa0ef          	jal	21218 <__muldf3>
   268a8:	86ae                	mv	a3,a1
   268aa:	862a                	mv	a2,a0
   268ac:	85a6                	mv	a1,s1
   268ae:	854a                	mv	a0,s2
   268b0:	dd3fa0ef          	jal	21682 <__subdf3>
   268b4:	030a8693          	add	a3,s5,48
   268b8:	fedc8fa3          	sb	a3,-1(s9)
   268bc:	099d9263          	bne	s11,s9,26940 <_dtoa_r+0x7b8>
   268c0:	862a                	mv	a2,a0
   268c2:	86ae                	mv	a3,a1
   268c4:	d2afb0ef          	jal	21dee <__adddf3>
   268c8:	4642                	lw	a2,16(sp)
   268ca:	46d2                	lw	a3,20(sp)
   268cc:	8baa                	mv	s7,a0
   268ce:	8b2e                	mv	s6,a1
   268d0:	b77fb0ef          	jal	22446 <__gedf2>
   268d4:	06a04463          	bgtz	a0,2693c <_dtoa_r+0x7b4>
   268d8:	4642                	lw	a2,16(sp)
   268da:	46d2                	lw	a3,20(sp)
   268dc:	855e                	mv	a0,s7
   268de:	85da                	mv	a1,s6
   268e0:	afdfb0ef          	jal	223dc <__eqdf2>
   268e4:	e509                	bnez	a0,268ee <_dtoa_r+0x766>
   268e6:	001afa93          	and	s5,s5,1
   268ea:	040a9963          	bnez	s5,2693c <_dtoa_r+0x7b4>
   268ee:	45e2                	lw	a1,24(sp)
   268f0:	4532                	lw	a0,12(sp)
   268f2:	0c05                	add	s8,s8,1
   268f4:	21e010ef          	jal	27b12 <_Bfree>
   268f8:	57f2                	lw	a5,60(sp)
   268fa:	000a0023          	sb	zero,0(s4)
   268fe:	0187a023          	sw	s8,0(a5)
   26902:	57a2                	lw	a5,40(sp)
   26904:	44078863          	beqz	a5,26d54 <_dtoa_r+0xbcc>
   26908:	0147a023          	sw	s4,0(a5)
   2690c:	a1a1                	j	26d54 <_dtoa_r+0xbcc>
   2690e:	8a56                	mv	s4,s5
   26910:	87d2                	mv	a5,s4
   26912:	03900713          	li	a4,57
   26916:	8a3e                	mv	s4,a5
   26918:	fff7c683          	lbu	a3,-1(a5)
   2691c:	17fd                	add	a5,a5,-1
   2691e:	00e69963          	bne	a3,a4,26930 <_dtoa_r+0x7a8>
   26922:	fef41ae3          	bne	s0,a5,26916 <_dtoa_r+0x78e>
   26926:	03000713          	li	a4,48
   2692a:	0485                	add	s1,s1,1
   2692c:	00e40023          	sb	a4,0(s0)
   26930:	0007c703          	lbu	a4,0(a5)
   26934:	0705                	add	a4,a4,1
   26936:	00e78023          	sb	a4,0(a5)
   2693a:	b71d                	j	26860 <_dtoa_r+0x6d8>
   2693c:	84e2                	mv	s1,s8
   2693e:	bfc9                	j	26910 <_dtoa_r+0x788>
   26940:	865a                	mv	a2,s6
   26942:	86de                	mv	a3,s7
   26944:	8d5fa0ef          	jal	21218 <__muldf3>
   26948:	4601                	li	a2,0
   2694a:	4681                	li	a3,0
   2694c:	892a                	mv	s2,a0
   2694e:	84ae                	mv	s1,a1
   26950:	0c85                	add	s9,s9,1
   26952:	a8bfb0ef          	jal	223dc <__eqdf2>
   26956:	f90d                	bnez	a0,26888 <_dtoa_r+0x700>
   26958:	bf59                	j	268ee <_dtoa_r+0x766>
   2695a:	5702                	lw	a4,32(sp)
   2695c:	1a070063          	beqz	a4,26afc <_dtoa_r+0x974>
   26960:	46f2                	lw	a3,28(sp)
   26962:	4705                	li	a4,1
   26964:	16d74363          	blt	a4,a3,26aca <_dtoa_r+0x942>
   26968:	4716                	lw	a4,68(sp)
   2696a:	43378793          	add	a5,a5,1075
   2696e:	e709                	bnez	a4,26978 <_dtoa_r+0x7f0>
   26970:	5726                	lw	a4,104(sp)
   26972:	03600793          	li	a5,54
   26976:	8f99                	sub	a5,a5,a4
   26978:	8aea                	mv	s5,s10
   2697a:	89de                	mv	s3,s7
   2697c:	4532                	lw	a0,12(sp)
   2697e:	4585                	li	a1,1
   26980:	9bbe                	add	s7,s7,a5
   26982:	9cbe                	add	s9,s9,a5
   26984:	416010ef          	jal	27d9a <__i2b>
   26988:	892a                	mv	s2,a0
   2698a:	00098e63          	beqz	s3,269a6 <_dtoa_r+0x81e>
   2698e:	01905c63          	blez	s9,269a6 <_dtoa_r+0x81e>
   26992:	87ce                	mv	a5,s3
   26994:	013cd363          	bge	s9,s3,2699a <_dtoa_r+0x812>
   26998:	87e6                	mv	a5,s9
   2699a:	40fb8bb3          	sub	s7,s7,a5
   2699e:	40f989b3          	sub	s3,s3,a5
   269a2:	40fc8cb3          	sub	s9,s9,a5
   269a6:	040d0163          	beqz	s10,269e8 <_dtoa_r+0x860>
   269aa:	5782                	lw	a5,32(sp)
   269ac:	14078c63          	beqz	a5,26b04 <_dtoa_r+0x97c>
   269b0:	020a8363          	beqz	s5,269d6 <_dtoa_r+0x84e>
   269b4:	4532                	lw	a0,12(sp)
   269b6:	85ca                	mv	a1,s2
   269b8:	8656                	mv	a2,s5
   269ba:	594010ef          	jal	27f4e <__pow5mult>
   269be:	85aa                	mv	a1,a0
   269c0:	4662                	lw	a2,24(sp)
   269c2:	892a                	mv	s2,a0
   269c4:	4532                	lw	a0,12(sp)
   269c6:	40c010ef          	jal	27dd2 <__multiply>
   269ca:	84aa                	mv	s1,a0
   269cc:	45e2                	lw	a1,24(sp)
   269ce:	4532                	lw	a0,12(sp)
   269d0:	142010ef          	jal	27b12 <_Bfree>
   269d4:	cc26                	sw	s1,24(sp)
   269d6:	415d0633          	sub	a2,s10,s5
   269da:	015d0763          	beq	s10,s5,269e8 <_dtoa_r+0x860>
   269de:	45e2                	lw	a1,24(sp)
   269e0:	4532                	lw	a0,12(sp)
   269e2:	56c010ef          	jal	27f4e <__pow5mult>
   269e6:	cc2a                	sw	a0,24(sp)
   269e8:	4532                	lw	a0,12(sp)
   269ea:	4585                	li	a1,1
   269ec:	3ae010ef          	jal	27d9a <__i2b>
   269f0:	57b2                	lw	a5,44(sp)
   269f2:	8aaa                	mv	s5,a0
   269f4:	38078063          	beqz	a5,26d74 <_dtoa_r+0xbec>
   269f8:	85aa                	mv	a1,a0
   269fa:	4532                	lw	a0,12(sp)
   269fc:	863e                	mv	a2,a5
   269fe:	4d01                	li	s10,0
   26a00:	54e010ef          	jal	27f4e <__pow5mult>
   26a04:	4772                	lw	a4,28(sp)
   26a06:	4785                	li	a5,1
   26a08:	8aaa                	mv	s5,a0
   26a0a:	02e7c363          	blt	a5,a4,26a30 <_dtoa_r+0x8a8>
   26a0e:	4d01                	li	s10,0
   26a10:	000a1d63          	bnez	s4,26a2a <_dtoa_r+0x8a2>
   26a14:	00cb1793          	sll	a5,s6,0xc
   26a18:	eb89                	bnez	a5,26a2a <_dtoa_r+0x8a2>
   26a1a:	014b5793          	srl	a5,s6,0x14
   26a1e:	7ff7f793          	and	a5,a5,2047
   26a22:	c781                	beqz	a5,26a2a <_dtoa_r+0x8a2>
   26a24:	0b85                	add	s7,s7,1
   26a26:	0c85                	add	s9,s9,1
   26a28:	4d05                	li	s10,1
   26a2a:	57b2                	lw	a5,44(sp)
   26a2c:	4505                	li	a0,1
   26a2e:	cf89                	beqz	a5,26a48 <_dtoa_r+0x8c0>
   26a30:	010aa783          	lw	a5,16(s5)
   26a34:	078d                	add	a5,a5,3
   26a36:	078a                	sll	a5,a5,0x2
   26a38:	97d6                	add	a5,a5,s5
   26a3a:	43c8                	lw	a0,4(a5)
   26a3c:	2ae010ef          	jal	27cea <__hi0bits>
   26a40:	02000793          	li	a5,32
   26a44:	40a78533          	sub	a0,a5,a0
   26a48:	9566                	add	a0,a0,s9
   26a4a:	897d                	and	a0,a0,31
   26a4c:	c171                	beqz	a0,26b10 <_dtoa_r+0x988>
   26a4e:	02000793          	li	a5,32
   26a52:	8f89                	sub	a5,a5,a0
   26a54:	4711                	li	a4,4
   26a56:	0af75963          	bge	a4,a5,26b08 <_dtoa_r+0x980>
   26a5a:	47f1                	li	a5,28
   26a5c:	8f89                	sub	a5,a5,a0
   26a5e:	9bbe                	add	s7,s7,a5
   26a60:	99be                	add	s3,s3,a5
   26a62:	9cbe                	add	s9,s9,a5
   26a64:	01705863          	blez	s7,26a74 <_dtoa_r+0x8ec>
   26a68:	45e2                	lw	a1,24(sp)
   26a6a:	4532                	lw	a0,12(sp)
   26a6c:	865e                	mv	a2,s7
   26a6e:	5ba010ef          	jal	28028 <__lshift>
   26a72:	cc2a                	sw	a0,24(sp)
   26a74:	01905863          	blez	s9,26a84 <_dtoa_r+0x8fc>
   26a78:	4532                	lw	a0,12(sp)
   26a7a:	85d6                	mv	a1,s5
   26a7c:	8666                	mv	a2,s9
   26a7e:	5aa010ef          	jal	28028 <__lshift>
   26a82:	8aaa                	mv	s5,a0
   26a84:	57d2                	lw	a5,52(sp)
   26a86:	c7d9                	beqz	a5,26b14 <_dtoa_r+0x98c>
   26a88:	4562                	lw	a0,24(sp)
   26a8a:	85d6                	mv	a1,s5
   26a8c:	69a010ef          	jal	28126 <__mcmp>
   26a90:	08055263          	bgez	a0,26b14 <_dtoa_r+0x98c>
   26a94:	45e2                	lw	a1,24(sp)
   26a96:	4532                	lw	a0,12(sp)
   26a98:	4681                	li	a3,0
   26a9a:	4629                	li	a2,10
   26a9c:	0d4010ef          	jal	27b70 <__multadd>
   26aa0:	5782                	lw	a5,32(sp)
   26aa2:	cc2a                	sw	a0,24(sp)
   26aa4:	fffc0493          	add	s1,s8,-1
   26aa8:	2c078d63          	beqz	a5,26d82 <_dtoa_r+0xbfa>
   26aac:	4532                	lw	a0,12(sp)
   26aae:	85ca                	mv	a1,s2
   26ab0:	4681                	li	a3,0
   26ab2:	4629                	li	a2,10
   26ab4:	0bc010ef          	jal	27b70 <__multadd>
   26ab8:	47c2                	lw	a5,16(sp)
   26aba:	892a                	mv	s2,a0
   26abc:	0af04363          	bgtz	a5,26b62 <_dtoa_r+0x9da>
   26ac0:	4772                	lw	a4,28(sp)
   26ac2:	4789                	li	a5,2
   26ac4:	06e7c063          	blt	a5,a4,26b24 <_dtoa_r+0x99c>
   26ac8:	a869                	j	26b62 <_dtoa_r+0x9da>
   26aca:	fffd8a93          	add	s5,s11,-1 # 3fefffff <__share_mem_end__+0x3ee3ffff>
   26ace:	015d4963          	blt	s10,s5,26ae0 <_dtoa_r+0x958>
   26ad2:	415d0ab3          	sub	s5,s10,s5
   26ad6:	000dcf63          	bltz	s11,26af4 <_dtoa_r+0x96c>
   26ada:	89de                	mv	s3,s7
   26adc:	87ee                	mv	a5,s11
   26ade:	bd79                	j	2697c <_dtoa_r+0x7f4>
   26ae0:	5732                	lw	a4,44(sp)
   26ae2:	41aa87b3          	sub	a5,s5,s10
   26ae6:	89de                	mv	s3,s7
   26ae8:	97ba                	add	a5,a5,a4
   26aea:	d63e                	sw	a5,44(sp)
   26aec:	8d56                	mv	s10,s5
   26aee:	87ee                	mv	a5,s11
   26af0:	4a81                	li	s5,0
   26af2:	b569                	j	2697c <_dtoa_r+0x7f4>
   26af4:	41bb89b3          	sub	s3,s7,s11
   26af8:	4781                	li	a5,0
   26afa:	b549                	j	2697c <_dtoa_r+0x7f4>
   26afc:	8aea                	mv	s5,s10
   26afe:	89de                	mv	s3,s7
   26b00:	4901                	li	s2,0
   26b02:	b561                	j	2698a <_dtoa_r+0x802>
   26b04:	866a                	mv	a2,s10
   26b06:	bde1                	j	269de <_dtoa_r+0x856>
   26b08:	f4e78ee3          	beq	a5,a4,26a64 <_dtoa_r+0x8dc>
   26b0c:	07f1                	add	a5,a5,28
   26b0e:	bf81                	j	26a5e <_dtoa_r+0x8d6>
   26b10:	4781                	li	a5,0
   26b12:	bfed                	j	26b0c <_dtoa_r+0x984>
   26b14:	c86e                	sw	s11,16(sp)
   26b16:	84e2                	mv	s1,s8
   26b18:	05b04263          	bgtz	s11,26b5c <_dtoa_r+0x9d4>
   26b1c:	4772                	lw	a4,28(sp)
   26b1e:	4789                	li	a5,2
   26b20:	02e7de63          	bge	a5,a4,26b5c <_dtoa_r+0x9d4>
   26b24:	47c2                	lw	a5,16(sp)
   26b26:	ae079fe3          	bnez	a5,26624 <_dtoa_r+0x49c>
   26b2a:	4532                	lw	a0,12(sp)
   26b2c:	85d6                	mv	a1,s5
   26b2e:	4681                	li	a3,0
   26b30:	4615                	li	a2,5
   26b32:	03e010ef          	jal	27b70 <__multadd>
   26b36:	8aaa                	mv	s5,a0
   26b38:	85aa                	mv	a1,a0
   26b3a:	4562                	lw	a0,24(sp)
   26b3c:	5ea010ef          	jal	28126 <__mcmp>
   26b40:	aea052e3          	blez	a0,26624 <_dtoa_r+0x49c>
   26b44:	03100793          	li	a5,49
   26b48:	00140a13          	add	s4,s0,1
   26b4c:	00f40023          	sb	a5,0(s0)
   26b50:	0485                	add	s1,s1,1
   26b52:	bce9                	j	2662c <_dtoa_r+0x4a4>
   26b54:	84e2                	mv	s1,s8
   26b56:	4a81                	li	s5,0
   26b58:	4901                	li	s2,0
   26b5a:	b7ed                	j	26b44 <_dtoa_r+0x9bc>
   26b5c:	5782                	lw	a5,32(sp)
   26b5e:	22078563          	beqz	a5,26d88 <_dtoa_r+0xc00>
   26b62:	01305863          	blez	s3,26b72 <_dtoa_r+0x9ea>
   26b66:	4532                	lw	a0,12(sp)
   26b68:	85ca                	mv	a1,s2
   26b6a:	864e                	mv	a2,s3
   26b6c:	4bc010ef          	jal	28028 <__lshift>
   26b70:	892a                	mv	s2,a0
   26b72:	854a                	mv	a0,s2
   26b74:	040d0063          	beqz	s10,26bb4 <_dtoa_r+0xa2c>
   26b78:	00492583          	lw	a1,4(s2)
   26b7c:	4532                	lw	a0,12(sp)
   26b7e:	6e9000ef          	jal	27a66 <_Balloc>
   26b82:	89aa                	mv	s3,a0
   26b84:	e911                	bnez	a0,26b98 <_dtoa_r+0xa10>
   26b86:	000296b7          	lui	a3,0x29
   26b8a:	65068693          	add	a3,a3,1616 # 29650 <__clz_tab+0x1f0>
   26b8e:	4601                	li	a2,0
   26b90:	2ea00593          	li	a1,746
   26b94:	e42ff06f          	j	261d6 <_dtoa_r+0x4e>
   26b98:	01092603          	lw	a2,16(s2)
   26b9c:	00c90593          	add	a1,s2,12
   26ba0:	0531                	add	a0,a0,12
   26ba2:	0609                	add	a2,a2,2
   26ba4:	060a                	sll	a2,a2,0x2
   26ba6:	9fcfb0ef          	jal	21da2 <memcpy>
   26baa:	4532                	lw	a0,12(sp)
   26bac:	4605                	li	a2,1
   26bae:	85ce                	mv	a1,s3
   26bb0:	478010ef          	jal	28028 <__lshift>
   26bb4:	47c2                	lw	a5,16(sp)
   26bb6:	8b4a                	mv	s6,s2
   26bb8:	00140c13          	add	s8,s0,1
   26bbc:	97a2                	add	a5,a5,s0
   26bbe:	c83e                	sw	a5,16(sp)
   26bc0:	892a                	mv	s2,a0
   26bc2:	001a7993          	and	s3,s4,1
   26bc6:	4562                	lw	a0,24(sp)
   26bc8:	85d6                	mv	a1,s5
   26bca:	fffc0d13          	add	s10,s8,-1
   26bce:	c8aff0ef          	jal	26058 <quorem>
   26bd2:	8caa                	mv	s9,a0
   26bd4:	03050d93          	add	s11,a0,48
   26bd8:	4562                	lw	a0,24(sp)
   26bda:	85da                	mv	a1,s6
   26bdc:	54a010ef          	jal	28126 <__mcmp>
   26be0:	8baa                	mv	s7,a0
   26be2:	4532                	lw	a0,12(sp)
   26be4:	85d6                	mv	a1,s5
   26be6:	864a                	mv	a2,s2
   26be8:	574010ef          	jal	2815c <__mdiff>
   26bec:	4554                	lw	a3,12(a0)
   26bee:	85aa                	mv	a1,a0
   26bf0:	4705                	li	a4,1
   26bf2:	e699                	bnez	a3,26c00 <_dtoa_r+0xa78>
   26bf4:	d02a                	sw	a0,32(sp)
   26bf6:	4562                	lw	a0,24(sp)
   26bf8:	52e010ef          	jal	28126 <__mcmp>
   26bfc:	5582                	lw	a1,32(sp)
   26bfe:	872a                	mv	a4,a0
   26c00:	4532                	lw	a0,12(sp)
   26c02:	d03a                	sw	a4,32(sp)
   26c04:	8a62                	mv	s4,s8
   26c06:	70d000ef          	jal	27b12 <_Bfree>
   26c0a:	47f2                	lw	a5,28(sp)
   26c0c:	5702                	lw	a4,32(sp)
   26c0e:	00f766b3          	or	a3,a4,a5
   26c12:	0136e6b3          	or	a3,a3,s3
   26c16:	ee81                	bnez	a3,26c2e <_dtoa_r+0xaa6>
   26c18:	03900713          	li	a4,57
   26c1c:	04ed8763          	beq	s11,a4,26c6a <_dtoa_r+0xae2>
   26c20:	01705463          	blez	s7,26c28 <_dtoa_r+0xaa0>
   26c24:	031c8d93          	add	s11,s9,49
   26c28:	01bd0023          	sb	s11,0(s10) # 3ff00000 <__share_mem_end__+0x3ee40000>
   26c2c:	b409                	j	2662e <_dtoa_r+0x4a6>
   26c2e:	000bc963          	bltz	s7,26c40 <_dtoa_r+0xab8>
   26c32:	47f2                	lw	a5,28(sp)
   26c34:	0177ebb3          	or	s7,a5,s7
   26c38:	013bebb3          	or	s7,s7,s3
   26c3c:	040b9863          	bnez	s7,26c8c <_dtoa_r+0xb04>
   26c40:	fee054e3          	blez	a4,26c28 <_dtoa_r+0xaa0>
   26c44:	45e2                	lw	a1,24(sp)
   26c46:	4532                	lw	a0,12(sp)
   26c48:	4605                	li	a2,1
   26c4a:	3de010ef          	jal	28028 <__lshift>
   26c4e:	85d6                	mv	a1,s5
   26c50:	cc2a                	sw	a0,24(sp)
   26c52:	4d4010ef          	jal	28126 <__mcmp>
   26c56:	00a04663          	bgtz	a0,26c62 <_dtoa_r+0xada>
   26c5a:	f579                	bnez	a0,26c28 <_dtoa_r+0xaa0>
   26c5c:	001df713          	and	a4,s11,1
   26c60:	d761                	beqz	a4,26c28 <_dtoa_r+0xaa0>
   26c62:	03900713          	li	a4,57
   26c66:	faed9fe3          	bne	s11,a4,26c24 <_dtoa_r+0xa9c>
   26c6a:	03900793          	li	a5,57
   26c6e:	00fd0023          	sb	a5,0(s10)
   26c72:	87d2                	mv	a5,s4
   26c74:	03900693          	li	a3,57
   26c78:	8a3e                	mv	s4,a5
   26c7a:	fffa4703          	lbu	a4,-1(s4)
   26c7e:	17fd                	add	a5,a5,-1
   26c80:	0ad70563          	beq	a4,a3,26d2a <_dtoa_r+0xba2>
   26c84:	0705                	add	a4,a4,1
   26c86:	00e78023          	sb	a4,0(a5)
   26c8a:	b255                	j	2662e <_dtoa_r+0x4a6>
   26c8c:	00e05b63          	blez	a4,26ca2 <_dtoa_r+0xb1a>
   26c90:	03900713          	li	a4,57
   26c94:	fced8be3          	beq	s11,a4,26c6a <_dtoa_r+0xae2>
   26c98:	001d8793          	add	a5,s11,1
   26c9c:	00fd0023          	sb	a5,0(s10)
   26ca0:	b279                	j	2662e <_dtoa_r+0x4a6>
   26ca2:	47c2                	lw	a5,16(sp)
   26ca4:	ffbc0fa3          	sb	s11,-1(s8)
   26ca8:	05878763          	beq	a5,s8,26cf6 <_dtoa_r+0xb6e>
   26cac:	45e2                	lw	a1,24(sp)
   26cae:	4532                	lw	a0,12(sp)
   26cb0:	4681                	li	a3,0
   26cb2:	4629                	li	a2,10
   26cb4:	6bd000ef          	jal	27b70 <__multadd>
   26cb8:	cc2a                	sw	a0,24(sp)
   26cba:	4681                	li	a3,0
   26cbc:	4532                	lw	a0,12(sp)
   26cbe:	4629                	li	a2,10
   26cc0:	85da                	mv	a1,s6
   26cc2:	012b1863          	bne	s6,s2,26cd2 <_dtoa_r+0xb4a>
   26cc6:	6ab000ef          	jal	27b70 <__multadd>
   26cca:	8b2a                	mv	s6,a0
   26ccc:	892a                	mv	s2,a0
   26cce:	0c05                	add	s8,s8,1
   26cd0:	bddd                	j	26bc6 <_dtoa_r+0xa3e>
   26cd2:	69f000ef          	jal	27b70 <__multadd>
   26cd6:	8b2a                	mv	s6,a0
   26cd8:	4532                	lw	a0,12(sp)
   26cda:	85ca                	mv	a1,s2
   26cdc:	4681                	li	a3,0
   26cde:	4629                	li	a2,10
   26ce0:	691000ef          	jal	27b70 <__multadd>
   26ce4:	892a                	mv	s2,a0
   26ce6:	b7e5                	j	26cce <_dtoa_r+0xb46>
   26ce8:	47c2                	lw	a5,16(sp)
   26cea:	4a05                	li	s4,1
   26cec:	00f05363          	blez	a5,26cf2 <_dtoa_r+0xb6a>
   26cf0:	8a3e                	mv	s4,a5
   26cf2:	9a22                	add	s4,s4,s0
   26cf4:	4b01                	li	s6,0
   26cf6:	45e2                	lw	a1,24(sp)
   26cf8:	4532                	lw	a0,12(sp)
   26cfa:	4605                	li	a2,1
   26cfc:	32c010ef          	jal	28028 <__lshift>
   26d00:	85d6                	mv	a1,s5
   26d02:	cc2a                	sw	a0,24(sp)
   26d04:	422010ef          	jal	28126 <__mcmp>
   26d08:	f6a045e3          	bgtz	a0,26c72 <_dtoa_r+0xaea>
   26d0c:	e501                	bnez	a0,26d14 <_dtoa_r+0xb8c>
   26d0e:	001df793          	and	a5,s11,1
   26d12:	f3a5                	bnez	a5,26c72 <_dtoa_r+0xaea>
   26d14:	87d2                	mv	a5,s4
   26d16:	03000713          	li	a4,48
   26d1a:	8a3e                	mv	s4,a5
   26d1c:	fff7c683          	lbu	a3,-1(a5)
   26d20:	17fd                	add	a5,a5,-1
   26d22:	fee68ce3          	beq	a3,a4,26d1a <_dtoa_r+0xb92>
   26d26:	909ff06f          	j	2662e <_dtoa_r+0x4a6>
   26d2a:	f4f417e3          	bne	s0,a5,26c78 <_dtoa_r+0xaf0>
   26d2e:	03100793          	li	a5,49
   26d32:	0485                	add	s1,s1,1
   26d34:	00f40023          	sb	a5,0(s0)
   26d38:	8f7ff06f          	j	2662e <_dtoa_r+0x4a6>
   26d3c:	5722                	lw	a4,40(sp)
   26d3e:	000297b7          	lui	a5,0x29
   26d42:	5dc78413          	add	s0,a5,1500 # 295dc <__clz_tab+0x17c>
   26d46:	c719                	beqz	a4,26d54 <_dtoa_r+0xbcc>
   26d48:	000297b7          	lui	a5,0x29
   26d4c:	5e478793          	add	a5,a5,1508 # 295e4 <__clz_tab+0x184>
   26d50:	5722                	lw	a4,40(sp)
   26d52:	c31c                	sw	a5,0(a4)
   26d54:	50ba                	lw	ra,172(sp)
   26d56:	8522                	mv	a0,s0
   26d58:	542a                	lw	s0,168(sp)
   26d5a:	549a                	lw	s1,164(sp)
   26d5c:	590a                	lw	s2,160(sp)
   26d5e:	49fa                	lw	s3,156(sp)
   26d60:	4a6a                	lw	s4,152(sp)
   26d62:	4ada                	lw	s5,148(sp)
   26d64:	4b4a                	lw	s6,144(sp)
   26d66:	4bba                	lw	s7,140(sp)
   26d68:	4c2a                	lw	s8,136(sp)
   26d6a:	4c9a                	lw	s9,132(sp)
   26d6c:	4d0a                	lw	s10,128(sp)
   26d6e:	5df6                	lw	s11,124(sp)
   26d70:	614d                	add	sp,sp,176
   26d72:	8082                	ret
   26d74:	4772                	lw	a4,28(sp)
   26d76:	4785                	li	a5,1
   26d78:	c8e7dbe3          	bge	a5,a4,26a0e <_dtoa_r+0x886>
   26d7c:	4d01                	li	s10,0
   26d7e:	4505                	li	a0,1
   26d80:	b1e1                	j	26a48 <_dtoa_r+0x8c0>
   26d82:	47c2                	lw	a5,16(sp)
   26d84:	d8f05ce3          	blez	a5,26b1c <_dtoa_r+0x994>
   26d88:	4981                	li	s3,0
   26d8a:	4562                	lw	a0,24(sp)
   26d8c:	85d6                	mv	a1,s5
   26d8e:	acaff0ef          	jal	26058 <quorem>
   26d92:	47c2                	lw	a5,16(sp)
   26d94:	01340733          	add	a4,s0,s3
   26d98:	03050d93          	add	s11,a0,48
   26d9c:	01b70023          	sb	s11,0(a4)
   26da0:	0985                	add	s3,s3,1
   26da2:	f4f9d3e3          	bge	s3,a5,26ce8 <_dtoa_r+0xb60>
   26da6:	45e2                	lw	a1,24(sp)
   26da8:	4532                	lw	a0,12(sp)
   26daa:	4681                	li	a3,0
   26dac:	4629                	li	a2,10
   26dae:	5c3000ef          	jal	27b70 <__multadd>
   26db2:	cc2a                	sw	a0,24(sp)
   26db4:	bfd9                	j	26d8a <_dtoa_r+0xc02>

00026db6 <__sflush_r>:
   26db6:	00c59783          	lh	a5,12(a1)
   26dba:	1101                	add	sp,sp,-32
   26dbc:	cc22                	sw	s0,24(sp)
   26dbe:	ca26                	sw	s1,20(sp)
   26dc0:	ce06                	sw	ra,28(sp)
   26dc2:	c84a                	sw	s2,16(sp)
   26dc4:	c64e                	sw	s3,12(sp)
   26dc6:	0087f713          	and	a4,a5,8
   26dca:	84aa                	mv	s1,a0
   26dcc:	842e                	mv	s0,a1
   26dce:	e779                	bnez	a4,26e9c <__sflush_r+0xe6>
   26dd0:	41d8                	lw	a4,4(a1)
   26dd2:	00e04563          	bgtz	a4,26ddc <__sflush_r+0x26>
   26dd6:	41b8                	lw	a4,64(a1)
   26dd8:	0ae05b63          	blez	a4,26e8e <__sflush_r+0xd8>
   26ddc:	5458                	lw	a4,44(s0)
   26dde:	cb45                	beqz	a4,26e8e <__sflush_r+0xd8>
   26de0:	0004a903          	lw	s2,0(s1)
   26de4:	01379693          	sll	a3,a5,0x13
   26de8:	0004a023          	sw	zero,0(s1)
   26dec:	500c                	lw	a1,32(s0)
   26dee:	0606de63          	bgez	a3,26e6a <__sflush_r+0xb4>
   26df2:	4870                	lw	a2,84(s0)
   26df4:	00c45783          	lhu	a5,12(s0)
   26df8:	8b91                	and	a5,a5,4
   26dfa:	c799                	beqz	a5,26e08 <__sflush_r+0x52>
   26dfc:	405c                	lw	a5,4(s0)
   26dfe:	8e1d                	sub	a2,a2,a5
   26e00:	585c                	lw	a5,52(s0)
   26e02:	c399                	beqz	a5,26e08 <__sflush_r+0x52>
   26e04:	403c                	lw	a5,64(s0)
   26e06:	8e1d                	sub	a2,a2,a5
   26e08:	545c                	lw	a5,44(s0)
   26e0a:	500c                	lw	a1,32(s0)
   26e0c:	4681                	li	a3,0
   26e0e:	8526                	mv	a0,s1
   26e10:	9782                	jalr	a5
   26e12:	577d                	li	a4,-1
   26e14:	00c45783          	lhu	a5,12(s0)
   26e18:	00e51d63          	bne	a0,a4,26e32 <__sflush_r+0x7c>
   26e1c:	4094                	lw	a3,0(s1)
   26e1e:	4775                	li	a4,29
   26e20:	06d76963          	bltu	a4,a3,26e92 <__sflush_r+0xdc>
   26e24:	20400737          	lui	a4,0x20400
   26e28:	0705                	add	a4,a4,1 # 20400001 <__share_mem_end__+0x1f340001>
   26e2a:	00d75733          	srl	a4,a4,a3
   26e2e:	8b05                	and	a4,a4,1
   26e30:	c32d                	beqz	a4,26e92 <__sflush_r+0xdc>
   26e32:	4818                	lw	a4,16(s0)
   26e34:	00042223          	sw	zero,4(s0)
   26e38:	c018                	sw	a4,0(s0)
   26e3a:	01379713          	sll	a4,a5,0x13
   26e3e:	00075863          	bgez	a4,26e4e <__sflush_r+0x98>
   26e42:	57fd                	li	a5,-1
   26e44:	00f51463          	bne	a0,a5,26e4c <__sflush_r+0x96>
   26e48:	409c                	lw	a5,0(s1)
   26e4a:	e391                	bnez	a5,26e4e <__sflush_r+0x98>
   26e4c:	c868                	sw	a0,84(s0)
   26e4e:	584c                	lw	a1,52(s0)
   26e50:	0124a023          	sw	s2,0(s1)
   26e54:	cd8d                	beqz	a1,26e8e <__sflush_r+0xd8>
   26e56:	04440793          	add	a5,s0,68
   26e5a:	00f58563          	beq	a1,a5,26e64 <__sflush_r+0xae>
   26e5e:	8526                	mv	a0,s1
   26e60:	774010ef          	jal	285d4 <_free_r>
   26e64:	02042a23          	sw	zero,52(s0)
   26e68:	a01d                	j	26e8e <__sflush_r+0xd8>
   26e6a:	4601                	li	a2,0
   26e6c:	4685                	li	a3,1
   26e6e:	8526                	mv	a0,s1
   26e70:	9702                	jalr	a4
   26e72:	57fd                	li	a5,-1
   26e74:	862a                	mv	a2,a0
   26e76:	f6f51fe3          	bne	a0,a5,26df4 <__sflush_r+0x3e>
   26e7a:	409c                	lw	a5,0(s1)
   26e7c:	dfa5                	beqz	a5,26df4 <__sflush_r+0x3e>
   26e7e:	4775                	li	a4,29
   26e80:	00e78563          	beq	a5,a4,26e8a <__sflush_r+0xd4>
   26e84:	4759                	li	a4,22
   26e86:	04e79463          	bne	a5,a4,26ece <__sflush_r+0x118>
   26e8a:	0124a023          	sw	s2,0(s1)
   26e8e:	4501                	li	a0,0
   26e90:	a0b1                	j	26edc <__sflush_r+0x126>
   26e92:	0407e793          	or	a5,a5,64
   26e96:	07c2                	sll	a5,a5,0x10
   26e98:	87c1                	sra	a5,a5,0x10
   26e9a:	a835                	j	26ed6 <__sflush_r+0x120>
   26e9c:	0105a983          	lw	s3,16(a1)
   26ea0:	fe0987e3          	beqz	s3,26e8e <__sflush_r+0xd8>
   26ea4:	0005a903          	lw	s2,0(a1)
   26ea8:	8b8d                	and	a5,a5,3
   26eaa:	0135a023          	sw	s3,0(a1)
   26eae:	41390933          	sub	s2,s2,s3
   26eb2:	4701                	li	a4,0
   26eb4:	e391                	bnez	a5,26eb8 <__sflush_r+0x102>
   26eb6:	49d8                	lw	a4,20(a1)
   26eb8:	c418                	sw	a4,8(s0)
   26eba:	fd205ae3          	blez	s2,26e8e <__sflush_r+0xd8>
   26ebe:	541c                	lw	a5,40(s0)
   26ec0:	500c                	lw	a1,32(s0)
   26ec2:	86ca                	mv	a3,s2
   26ec4:	864e                	mv	a2,s3
   26ec6:	8526                	mv	a0,s1
   26ec8:	9782                	jalr	a5
   26eca:	02a04063          	bgtz	a0,26eea <__sflush_r+0x134>
   26ece:	00c41783          	lh	a5,12(s0)
   26ed2:	0407e793          	or	a5,a5,64
   26ed6:	00f41623          	sh	a5,12(s0)
   26eda:	557d                	li	a0,-1
   26edc:	40f2                	lw	ra,28(sp)
   26ede:	4462                	lw	s0,24(sp)
   26ee0:	44d2                	lw	s1,20(sp)
   26ee2:	4942                	lw	s2,16(sp)
   26ee4:	49b2                	lw	s3,12(sp)
   26ee6:	6105                	add	sp,sp,32
   26ee8:	8082                	ret
   26eea:	99aa                	add	s3,s3,a0
   26eec:	40a90933          	sub	s2,s2,a0
   26ef0:	b7e9                	j	26eba <__sflush_r+0x104>

00026ef2 <_fflush_r>:
   26ef2:	499c                	lw	a5,16(a1)
   26ef4:	cfb9                	beqz	a5,26f52 <_fflush_r+0x60>
   26ef6:	1101                	add	sp,sp,-32
   26ef8:	cc22                	sw	s0,24(sp)
   26efa:	ce06                	sw	ra,28(sp)
   26efc:	842a                	mv	s0,a0
   26efe:	c511                	beqz	a0,26f0a <_fflush_r+0x18>
   26f00:	4d1c                	lw	a5,24(a0)
   26f02:	e781                	bnez	a5,26f0a <_fflush_r+0x18>
   26f04:	c62e                	sw	a1,12(sp)
   26f06:	2231                	jal	27012 <__sinit>
   26f08:	45b2                	lw	a1,12(sp)
   26f0a:	0002a7b7          	lui	a5,0x2a
   26f0e:	ae478793          	add	a5,a5,-1308 # 29ae4 <__sf_fake_stdin>
   26f12:	00f59b63          	bne	a1,a5,26f28 <_fflush_r+0x36>
   26f16:	404c                	lw	a1,4(s0)
   26f18:	00c59783          	lh	a5,12(a1)
   26f1c:	c795                	beqz	a5,26f48 <_fflush_r+0x56>
   26f1e:	8522                	mv	a0,s0
   26f20:	4462                	lw	s0,24(sp)
   26f22:	40f2                	lw	ra,28(sp)
   26f24:	6105                	add	sp,sp,32
   26f26:	bd41                	j	26db6 <__sflush_r>
   26f28:	0002a7b7          	lui	a5,0x2a
   26f2c:	ac478793          	add	a5,a5,-1340 # 29ac4 <__sf_fake_stdout>
   26f30:	00f59463          	bne	a1,a5,26f38 <_fflush_r+0x46>
   26f34:	440c                	lw	a1,8(s0)
   26f36:	b7cd                	j	26f18 <_fflush_r+0x26>
   26f38:	0002a7b7          	lui	a5,0x2a
   26f3c:	aa478793          	add	a5,a5,-1372 # 29aa4 <__sf_fake_stderr>
   26f40:	fcf59ce3          	bne	a1,a5,26f18 <_fflush_r+0x26>
   26f44:	444c                	lw	a1,12(s0)
   26f46:	bfc9                	j	26f18 <_fflush_r+0x26>
   26f48:	40f2                	lw	ra,28(sp)
   26f4a:	4462                	lw	s0,24(sp)
   26f4c:	4501                	li	a0,0
   26f4e:	6105                	add	sp,sp,32
   26f50:	8082                	ret
   26f52:	4501                	li	a0,0
   26f54:	8082                	ret

00026f56 <std>:
   26f56:	1141                	add	sp,sp,-16
   26f58:	c422                	sw	s0,8(sp)
   26f5a:	c606                	sw	ra,12(sp)
   26f5c:	842a                	mv	s0,a0
   26f5e:	00b51623          	sh	a1,12(a0)
   26f62:	00c51723          	sh	a2,14(a0)
   26f66:	00052023          	sw	zero,0(a0)
   26f6a:	00052223          	sw	zero,4(a0)
   26f6e:	00052423          	sw	zero,8(a0)
   26f72:	06052223          	sw	zero,100(a0)
   26f76:	00052823          	sw	zero,16(a0)
   26f7a:	00052a23          	sw	zero,20(a0)
   26f7e:	00052c23          	sw	zero,24(a0)
   26f82:	4621                	li	a2,8
   26f84:	4581                	li	a1,0
   26f86:	05c50513          	add	a0,a0,92
   26f8a:	e2ffa0ef          	jal	21db8 <memset>
   26f8e:	000297b7          	lui	a5,0x29
   26f92:	dfe78793          	add	a5,a5,-514 # 28dfe <__sread>
   26f96:	d05c                	sw	a5,36(s0)
   26f98:	000297b7          	lui	a5,0x29
   26f9c:	e2e78793          	add	a5,a5,-466 # 28e2e <__swrite>
   26fa0:	d41c                	sw	a5,40(s0)
   26fa2:	000297b7          	lui	a5,0x29
   26fa6:	e7c78793          	add	a5,a5,-388 # 28e7c <__sseek>
   26faa:	d45c                	sw	a5,44(s0)
   26fac:	000297b7          	lui	a5,0x29
   26fb0:	eb278793          	add	a5,a5,-334 # 28eb2 <__sclose>
   26fb4:	40b2                	lw	ra,12(sp)
   26fb6:	d000                	sw	s0,32(s0)
   26fb8:	d81c                	sw	a5,48(s0)
   26fba:	4422                	lw	s0,8(sp)
   26fbc:	0141                	add	sp,sp,16
   26fbe:	8082                	ret

00026fc0 <_cleanup_r>:
   26fc0:	000275b7          	lui	a1,0x27
   26fc4:	ef258593          	add	a1,a1,-270 # 26ef2 <_fflush_r>
   26fc8:	aa89                	j	2711a <_fwalk_reent>

00026fca <__sfmoreglue>:
   26fca:	1141                	add	sp,sp,-16
   26fcc:	c226                	sw	s1,4(sp)
   26fce:	06800793          	li	a5,104
   26fd2:	fff58493          	add	s1,a1,-1
   26fd6:	02f484b3          	mul	s1,s1,a5
   26fda:	c04a                	sw	s2,0(sp)
   26fdc:	892e                	mv	s2,a1
   26fde:	c422                	sw	s0,8(sp)
   26fe0:	c606                	sw	ra,12(sp)
   26fe2:	07448593          	add	a1,s1,116
   26fe6:	690010ef          	jal	28676 <_malloc_r>
   26fea:	842a                	mv	s0,a0
   26fec:	cd01                	beqz	a0,27004 <__sfmoreglue+0x3a>
   26fee:	00052023          	sw	zero,0(a0)
   26ff2:	01252223          	sw	s2,4(a0)
   26ff6:	0531                	add	a0,a0,12
   26ff8:	c408                	sw	a0,8(s0)
   26ffa:	06848613          	add	a2,s1,104
   26ffe:	4581                	li	a1,0
   27000:	db9fa0ef          	jal	21db8 <memset>
   27004:	40b2                	lw	ra,12(sp)
   27006:	8522                	mv	a0,s0
   27008:	4422                	lw	s0,8(sp)
   2700a:	4492                	lw	s1,4(sp)
   2700c:	4902                	lw	s2,0(sp)
   2700e:	0141                	add	sp,sp,16
   27010:	8082                	ret

00027012 <__sinit>:
   27012:	4d1c                	lw	a5,24(a0)
   27014:	e3bd                	bnez	a5,2707a <__sinit+0x68>
   27016:	1141                	add	sp,sp,-16
   27018:	000277b7          	lui	a5,0x27
   2701c:	c422                	sw	s0,8(sp)
   2701e:	c606                	sw	ra,12(sp)
   27020:	fc078793          	add	a5,a5,-64 # 26fc0 <_cleanup_r>
   27024:	d51c                	sw	a5,40(a0)
   27026:	0002a7b7          	lui	a5,0x2a
   2702a:	c287a783          	lw	a5,-984(a5) # 29c28 <_global_impure_ptr>
   2702e:	04052423          	sw	zero,72(a0)
   27032:	04052623          	sw	zero,76(a0)
   27036:	04052823          	sw	zero,80(a0)
   2703a:	842a                	mv	s0,a0
   2703c:	00f51463          	bne	a0,a5,27044 <__sinit+0x32>
   27040:	4785                	li	a5,1
   27042:	cd1c                	sw	a5,24(a0)
   27044:	8522                	mv	a0,s0
   27046:	281d                	jal	2707c <__sfp>
   27048:	c048                	sw	a0,4(s0)
   2704a:	8522                	mv	a0,s0
   2704c:	2805                	jal	2707c <__sfp>
   2704e:	c408                	sw	a0,8(s0)
   27050:	8522                	mv	a0,s0
   27052:	202d                	jal	2707c <__sfp>
   27054:	c448                	sw	a0,12(s0)
   27056:	4048                	lw	a0,4(s0)
   27058:	4601                	li	a2,0
   2705a:	4591                	li	a1,4
   2705c:	3ded                	jal	26f56 <std>
   2705e:	4408                	lw	a0,8(s0)
   27060:	4605                	li	a2,1
   27062:	45a5                	li	a1,9
   27064:	3dcd                	jal	26f56 <std>
   27066:	4448                	lw	a0,12(s0)
   27068:	4609                	li	a2,2
   2706a:	45c9                	li	a1,18
   2706c:	35ed                	jal	26f56 <std>
   2706e:	4785                	li	a5,1
   27070:	40b2                	lw	ra,12(sp)
   27072:	cc1c                	sw	a5,24(s0)
   27074:	4422                	lw	s0,8(sp)
   27076:	0141                	add	sp,sp,16
   27078:	8082                	ret
   2707a:	8082                	ret

0002707c <__sfp>:
   2707c:	1141                	add	sp,sp,-16
   2707e:	0002a7b7          	lui	a5,0x2a
   27082:	c226                	sw	s1,4(sp)
   27084:	c287a483          	lw	s1,-984(a5) # 29c28 <_global_impure_ptr>
   27088:	c04a                	sw	s2,0(sp)
   2708a:	c606                	sw	ra,12(sp)
   2708c:	4c9c                	lw	a5,24(s1)
   2708e:	c422                	sw	s0,8(sp)
   27090:	892a                	mv	s2,a0
   27092:	e399                	bnez	a5,27098 <__sfp+0x1c>
   27094:	8526                	mv	a0,s1
   27096:	3fb5                	jal	27012 <__sinit>
   27098:	04848493          	add	s1,s1,72
   2709c:	4480                	lw	s0,8(s1)
   2709e:	40dc                	lw	a5,4(s1)
   270a0:	17fd                	add	a5,a5,-1
   270a2:	0007d663          	bgez	a5,270ae <__sfp+0x32>
   270a6:	409c                	lw	a5,0(s1)
   270a8:	cfb9                	beqz	a5,27106 <__sfp+0x8a>
   270aa:	4084                	lw	s1,0(s1)
   270ac:	bfc5                	j	2709c <__sfp+0x20>
   270ae:	00c41703          	lh	a4,12(s0)
   270b2:	e739                	bnez	a4,27100 <__sfp+0x84>
   270b4:	77c1                	lui	a5,0xffff0
   270b6:	0785                	add	a5,a5,1 # ffff0001 <__share_mem_end__+0xfef30001>
   270b8:	06042223          	sw	zero,100(s0)
   270bc:	00042023          	sw	zero,0(s0)
   270c0:	00042223          	sw	zero,4(s0)
   270c4:	00042423          	sw	zero,8(s0)
   270c8:	c45c                	sw	a5,12(s0)
   270ca:	00042823          	sw	zero,16(s0)
   270ce:	00042a23          	sw	zero,20(s0)
   270d2:	00042c23          	sw	zero,24(s0)
   270d6:	4621                	li	a2,8
   270d8:	4581                	li	a1,0
   270da:	05c40513          	add	a0,s0,92
   270de:	cdbfa0ef          	jal	21db8 <memset>
   270e2:	02042a23          	sw	zero,52(s0)
   270e6:	02042c23          	sw	zero,56(s0)
   270ea:	04042423          	sw	zero,72(s0)
   270ee:	04042623          	sw	zero,76(s0)
   270f2:	40b2                	lw	ra,12(sp)
   270f4:	8522                	mv	a0,s0
   270f6:	4422                	lw	s0,8(sp)
   270f8:	4492                	lw	s1,4(sp)
   270fa:	4902                	lw	s2,0(sp)
   270fc:	0141                	add	sp,sp,16
   270fe:	8082                	ret
   27100:	06840413          	add	s0,s0,104
   27104:	bf71                	j	270a0 <__sfp+0x24>
   27106:	4591                	li	a1,4
   27108:	854a                	mv	a0,s2
   2710a:	35c1                	jal	26fca <__sfmoreglue>
   2710c:	c088                	sw	a0,0(s1)
   2710e:	842a                	mv	s0,a0
   27110:	fd49                	bnez	a0,270aa <__sfp+0x2e>
   27112:	47b1                	li	a5,12
   27114:	00f92023          	sw	a5,0(s2)
   27118:	bfe9                	j	270f2 <__sfp+0x76>

0002711a <_fwalk_reent>:
   2711a:	7179                	add	sp,sp,-48
   2711c:	d422                	sw	s0,40(sp)
   2711e:	d04a                	sw	s2,32(sp)
   27120:	ce4e                	sw	s3,28(sp)
   27122:	cc52                	sw	s4,24(sp)
   27124:	c85a                	sw	s6,16(sp)
   27126:	c65e                	sw	s7,12(sp)
   27128:	d606                	sw	ra,44(sp)
   2712a:	d226                	sw	s1,36(sp)
   2712c:	ca56                	sw	s5,20(sp)
   2712e:	892a                	mv	s2,a0
   27130:	8a2e                	mv	s4,a1
   27132:	04850413          	add	s0,a0,72
   27136:	4981                	li	s3,0
   27138:	4b05                	li	s6,1
   2713a:	5bfd                	li	s7,-1
   2713c:	4404                	lw	s1,8(s0)
   2713e:	00442a83          	lw	s5,4(s0)
   27142:	1afd                	add	s5,s5,-1
   27144:	020ad063          	bgez	s5,27164 <_fwalk_reent+0x4a>
   27148:	4000                	lw	s0,0(s0)
   2714a:	f86d                	bnez	s0,2713c <_fwalk_reent+0x22>
   2714c:	50b2                	lw	ra,44(sp)
   2714e:	5422                	lw	s0,40(sp)
   27150:	5492                	lw	s1,36(sp)
   27152:	5902                	lw	s2,32(sp)
   27154:	4a62                	lw	s4,24(sp)
   27156:	4ad2                	lw	s5,20(sp)
   27158:	4b42                	lw	s6,16(sp)
   2715a:	4bb2                	lw	s7,12(sp)
   2715c:	854e                	mv	a0,s3
   2715e:	49f2                	lw	s3,28(sp)
   27160:	6145                	add	sp,sp,48
   27162:	8082                	ret
   27164:	00c4d783          	lhu	a5,12(s1)
   27168:	00fb7b63          	bgeu	s6,a5,2717e <_fwalk_reent+0x64>
   2716c:	00e49783          	lh	a5,14(s1)
   27170:	01778763          	beq	a5,s7,2717e <_fwalk_reent+0x64>
   27174:	85a6                	mv	a1,s1
   27176:	854a                	mv	a0,s2
   27178:	9a02                	jalr	s4
   2717a:	00a9e9b3          	or	s3,s3,a0
   2717e:	06848493          	add	s1,s1,104
   27182:	b7c1                	j	27142 <_fwalk_reent+0x28>

00027184 <rshift>:
   27184:	01052803          	lw	a6,16(a0)
   27188:	01450693          	add	a3,a0,20
   2718c:	4055de13          	sra	t3,a1,0x5
   27190:	87b6                	mv	a5,a3
   27192:	070e5263          	bge	t3,a6,271f6 <rshift+0x72>
   27196:	00281893          	sll	a7,a6,0x2
   2719a:	002e1793          	sll	a5,t3,0x2
   2719e:	89fd                	and	a1,a1,31
   271a0:	98b6                	add	a7,a7,a3
   271a2:	97b6                	add	a5,a5,a3
   271a4:	e185                	bnez	a1,271c4 <rshift+0x40>
   271a6:	8636                	mv	a2,a3
   271a8:	873e                	mv	a4,a5
   271aa:	07176d63          	bltu	a4,a7,27224 <rshift+0xa0>
   271ae:	ffd78713          	add	a4,a5,-3
   271b2:	4781                	li	a5,0
   271b4:	00e8e663          	bltu	a7,a4,271c0 <rshift+0x3c>
   271b8:	41c80833          	sub	a6,a6,t3
   271bc:	00281793          	sll	a5,a6,0x2
   271c0:	97b6                	add	a5,a5,a3
   271c2:	a815                	j	271f6 <rshift+0x72>
   271c4:	4390                	lw	a2,0(a5)
   271c6:	02000e93          	li	t4,32
   271ca:	40be8eb3          	sub	t4,t4,a1
   271ce:	00b65633          	srl	a2,a2,a1
   271d2:	00478713          	add	a4,a5,4
   271d6:	8f36                	mv	t5,a3
   271d8:	03176863          	bltu	a4,a7,27208 <rshift+0x84>
   271dc:	00178713          	add	a4,a5,1
   271e0:	4781                	li	a5,0
   271e2:	00e8e663          	bltu	a7,a4,271ee <rshift+0x6a>
   271e6:	41c807b3          	sub	a5,a6,t3
   271ea:	078a                	sll	a5,a5,0x2
   271ec:	17f1                	add	a5,a5,-4
   271ee:	97b6                	add	a5,a5,a3
   271f0:	c390                	sw	a2,0(a5)
   271f2:	c211                	beqz	a2,271f6 <rshift+0x72>
   271f4:	0791                	add	a5,a5,4
   271f6:	40d78733          	sub	a4,a5,a3
   271fa:	8709                	sra	a4,a4,0x2
   271fc:	c918                	sw	a4,16(a0)
   271fe:	00d79463          	bne	a5,a3,27206 <rshift+0x82>
   27202:	00052a23          	sw	zero,20(a0)
   27206:	8082                	ret
   27208:	00072303          	lw	t1,0(a4)
   2720c:	0f11                	add	t5,t5,4
   2720e:	01d31333          	sll	t1,t1,t4
   27212:	00c36633          	or	a2,t1,a2
   27216:	fecf2e23          	sw	a2,-4(t5)
   2721a:	4310                	lw	a2,0(a4)
   2721c:	0711                	add	a4,a4,4
   2721e:	00b65633          	srl	a2,a2,a1
   27222:	bf5d                	j	271d8 <rshift+0x54>
   27224:	430c                	lw	a1,0(a4)
   27226:	0711                	add	a4,a4,4
   27228:	c20c                	sw	a1,0(a2)
   2722a:	0611                	add	a2,a2,4
   2722c:	bfbd                	j	271aa <rshift+0x26>

0002722e <__hexdig_fun>:
   2722e:	fd050713          	add	a4,a0,-48
   27232:	0ff77713          	zext.b	a4,a4
   27236:	46a5                	li	a3,9
   27238:	87aa                	mv	a5,a0
   2723a:	00e6e763          	bltu	a3,a4,27248 <__hexdig_fun+0x1a>
   2723e:	fe050793          	add	a5,a0,-32
   27242:	0ff7f513          	zext.b	a0,a5
   27246:	8082                	ret
   27248:	f9f50713          	add	a4,a0,-97
   2724c:	0ff77713          	zext.b	a4,a4
   27250:	4695                	li	a3,5
   27252:	00e6e563          	bltu	a3,a4,2725c <__hexdig_fun+0x2e>
   27256:	fb950793          	add	a5,a0,-71
   2725a:	b7e5                	j	27242 <__hexdig_fun+0x14>
   2725c:	fbf50713          	add	a4,a0,-65
   27260:	0ff77713          	zext.b	a4,a4
   27264:	4501                	li	a0,0
   27266:	fee6e0e3          	bltu	a3,a4,27246 <__hexdig_fun+0x18>
   2726a:	fd978793          	add	a5,a5,-39
   2726e:	bfd1                	j	27242 <__hexdig_fun+0x14>

00027270 <__gethex>:
   27270:	711d                	add	sp,sp,-96
   27272:	c0da                	sw	s6,64(sp)
   27274:	8b3e                	mv	s6,a5
   27276:	0002a7b7          	lui	a5,0x2a
   2727a:	b047a783          	lw	a5,-1276(a5) # 29b04 <_C_numeric_locale>
   2727e:	c22a                	sw	a0,4(sp)
   27280:	cca2                	sw	s0,88(sp)
   27282:	853e                	mv	a0,a5
   27284:	c6ce                	sw	s3,76(sp)
   27286:	c4d2                	sw	s4,72(sp)
   27288:	dc62                	sw	s8,56(sp)
   2728a:	c43e                	sw	a5,8(sp)
   2728c:	8c3a                	mv	s8,a4
   2728e:	ce86                	sw	ra,92(sp)
   27290:	caa6                	sw	s1,84(sp)
   27292:	c8ca                	sw	s2,80(sp)
   27294:	c2d6                	sw	s5,68(sp)
   27296:	de5e                	sw	s7,60(sp)
   27298:	da66                	sw	s9,52(sp)
   2729a:	d86a                	sw	s10,48(sp)
   2729c:	d66e                	sw	s11,44(sp)
   2729e:	c62e                	sw	a1,12(sp)
   272a0:	89b2                	mv	s3,a2
   272a2:	c836                	sw	a3,16(sp)
   272a4:	f71fd0ef          	jal	25214 <strlen>
   272a8:	47a2                	lw	a5,8(sp)
   272aa:	8a2a                	mv	s4,a0
   272ac:	03000713          	li	a4,48
   272b0:	97aa                	add	a5,a5,a0
   272b2:	fff7c783          	lbu	a5,-1(a5)
   272b6:	ca3e                	sw	a5,20(sp)
   272b8:	47b2                	lw	a5,12(sp)
   272ba:	4380                	lw	s0,0(a5)
   272bc:	00240793          	add	a5,s0,2
   272c0:	893e                	mv	s2,a5
   272c2:	0007c503          	lbu	a0,0(a5)
   272c6:	0785                	add	a5,a5,1
   272c8:	fee50ce3          	beq	a0,a4,272c0 <__gethex+0x50>
   272cc:	40890433          	sub	s0,s2,s0
   272d0:	1479                	add	s0,s0,-2
   272d2:	3fb1                	jal	2722e <__hexdig_fun>
   272d4:	e53d                	bnez	a0,27342 <__gethex+0xd2>
   272d6:	45a2                	lw	a1,8(sp)
   272d8:	8652                	mv	a2,s4
   272da:	854a                	mv	a0,s2
   272dc:	3dd010ef          	jal	28eb8 <strncmp>
   272e0:	84aa                	mv	s1,a0
   272e2:	ed45                	bnez	a0,2739a <__gethex+0x12a>
   272e4:	01490cb3          	add	s9,s2,s4
   272e8:	000cc503          	lbu	a0,0(s9)
   272ec:	4b85                	li	s7,1
   272ee:	3781                	jal	2722e <__hexdig_fun>
   272f0:	c12d                	beqz	a0,27352 <__gethex+0xe2>
   272f2:	8966                	mv	s2,s9
   272f4:	03000793          	li	a5,48
   272f8:	00094503          	lbu	a0,0(s2)
   272fc:	00f50963          	beq	a0,a5,2730e <__gethex+0x9e>
   27300:	373d                	jal	2722e <__hexdig_fun>
   27302:	00153b93          	seqz	s7,a0
   27306:	8de6                	mv	s11,s9
   27308:	4405                	li	s0,1
   2730a:	8cca                	mv	s9,s2
   2730c:	a021                	j	27314 <__gethex+0xa4>
   2730e:	0905                	add	s2,s2,1
   27310:	b7e5                	j	272f8 <__gethex+0x88>
   27312:	0c85                	add	s9,s9,1
   27314:	000cc503          	lbu	a0,0(s9)
   27318:	3f19                	jal	2722e <__hexdig_fun>
   2731a:	fd65                	bnez	a0,27312 <__gethex+0xa2>
   2731c:	45a2                	lw	a1,8(sp)
   2731e:	8652                	mv	a2,s4
   27320:	8566                	mv	a0,s9
   27322:	397010ef          	jal	28eb8 <strncmp>
   27326:	e11d                	bnez	a0,2734c <__gethex+0xdc>
   27328:	000d9863          	bnez	s11,27338 <__gethex+0xc8>
   2732c:	9cd2                	add	s9,s9,s4
   2732e:	8de6                	mv	s11,s9
   27330:	000cc503          	lbu	a0,0(s9)
   27334:	3ded                	jal	2722e <__hexdig_fun>
   27336:	e909                	bnez	a0,27348 <__gethex+0xd8>
   27338:	419d8db3          	sub	s11,s11,s9
   2733c:	002d9493          	sll	s1,s11,0x2
   27340:	a809                	j	27352 <__gethex+0xe2>
   27342:	4b81                	li	s7,0
   27344:	4d81                	li	s11,0
   27346:	b7d1                	j	2730a <__gethex+0x9a>
   27348:	0c85                	add	s9,s9,1
   2734a:	b7dd                	j	27330 <__gethex+0xc0>
   2734c:	4481                	li	s1,0
   2734e:	fe0d95e3          	bnez	s11,27338 <__gethex+0xc8>
   27352:	000cc683          	lbu	a3,0(s9)
   27356:	05000613          	li	a2,80
   2735a:	8ae6                	mv	s5,s9
   2735c:	0df6f693          	and	a3,a3,223
   27360:	06c69c63          	bne	a3,a2,273d8 <__gethex+0x168>
   27364:	001cc783          	lbu	a5,1(s9)
   27368:	02b00693          	li	a3,43
   2736c:	02d78b63          	beq	a5,a3,273a2 <__gethex+0x132>
   27370:	02d00693          	li	a3,45
   27374:	02d78b63          	beq	a5,a3,273aa <__gethex+0x13a>
   27378:	001c8a93          	add	s5,s9,1
   2737c:	4d01                	li	s10,0
   2737e:	000ac503          	lbu	a0,0(s5)
   27382:	3575                	jal	2722e <__hexdig_fun>
   27384:	fff50613          	add	a2,a0,-1
   27388:	0ff67613          	zext.b	a2,a2
   2738c:	45e1                	li	a1,24
   2738e:	ff050d93          	add	s11,a0,-16
   27392:	02c5f263          	bgeu	a1,a2,273b6 <__gethex+0x146>
   27396:	8ae6                	mv	s5,s9
   27398:	a081                	j	273d8 <__gethex+0x168>
   2739a:	8cca                	mv	s9,s2
   2739c:	4481                	li	s1,0
   2739e:	4b85                	li	s7,1
   273a0:	bf4d                	j	27352 <__gethex+0xe2>
   273a2:	4d01                	li	s10,0
   273a4:	002c8a93          	add	s5,s9,2
   273a8:	bfd9                	j	2737e <__gethex+0x10e>
   273aa:	4d05                	li	s10,1
   273ac:	bfe5                	j	273a4 <__gethex+0x134>
   273ae:	030d8db3          	mul	s11,s11,a6
   273b2:	9daa                	add	s11,s11,a0
   273b4:	1dc1                	add	s11,s11,-16
   273b6:	001ac503          	lbu	a0,1(s5)
   273ba:	0a85                	add	s5,s5,1
   273bc:	3d8d                	jal	2722e <__hexdig_fun>
   273be:	fff50613          	add	a2,a0,-1
   273c2:	0ff67613          	zext.b	a2,a2
   273c6:	45e1                	li	a1,24
   273c8:	4829                	li	a6,10
   273ca:	fec5f2e3          	bgeu	a1,a2,273ae <__gethex+0x13e>
   273ce:	000d0463          	beqz	s10,273d6 <__gethex+0x166>
   273d2:	41b00db3          	neg	s11,s11
   273d6:	94ee                	add	s1,s1,s11
   273d8:	47b2                	lw	a5,12(sp)
   273da:	0157a023          	sw	s5,0(a5)
   273de:	020b8563          	beqz	s7,27408 <__gethex+0x198>
   273e2:	4919                	li	s2,6
   273e4:	c011                	beqz	s0,273e8 <__gethex+0x178>
   273e6:	4901                	li	s2,0
   273e8:	40f6                	lw	ra,92(sp)
   273ea:	4466                	lw	s0,88(sp)
   273ec:	44d6                	lw	s1,84(sp)
   273ee:	49b6                	lw	s3,76(sp)
   273f0:	4a26                	lw	s4,72(sp)
   273f2:	4a96                	lw	s5,68(sp)
   273f4:	4b06                	lw	s6,64(sp)
   273f6:	5bf2                	lw	s7,60(sp)
   273f8:	5c62                	lw	s8,56(sp)
   273fa:	5cd2                	lw	s9,52(sp)
   273fc:	5d42                	lw	s10,48(sp)
   273fe:	5db2                	lw	s11,44(sp)
   27400:	854a                	mv	a0,s2
   27402:	4946                	lw	s2,80(sp)
   27404:	6125                	add	sp,sp,96
   27406:	8082                	ret
   27408:	412c87b3          	sub	a5,s9,s2
   2740c:	17fd                	add	a5,a5,-1
   2740e:	4581                	li	a1,0
   27410:	469d                	li	a3,7
   27412:	02f6c363          	blt	a3,a5,27438 <__gethex+0x1c8>
   27416:	4512                	lw	a0,4(sp)
   27418:	25b9                	jal	27a66 <_Balloc>
   2741a:	842a                	mv	s0,a0
   2741c:	e10d                	bnez	a0,2743e <__gethex+0x1ce>
   2741e:	000296b7          	lui	a3,0x29
   27422:	65068693          	add	a3,a3,1616 # 29650 <__clz_tab+0x1f0>
   27426:	4601                	li	a2,0
   27428:	0de00593          	li	a1,222
   2742c:	00029537          	lui	a0,0x29
   27430:	66450513          	add	a0,a0,1636 # 29664 <__clz_tab+0x204>
   27434:	4c7010ef          	jal	290fa <__assert_func>
   27438:	0585                	add	a1,a1,1
   2743a:	8785                	sra	a5,a5,0x1
   2743c:	bfd9                	j	27412 <__gethex+0x1a2>
   2743e:	4605                	li	a2,1
   27440:	01450b93          	add	s7,a0,20
   27444:	414607b3          	sub	a5,a2,s4
   27448:	8dde                	mv	s11,s7
   2744a:	4d01                	li	s10,0
   2744c:	4a81                	li	s5,0
   2744e:	cc3e                	sw	a5,24(sp)
   27450:	07996f63          	bltu	s2,s9,274ce <__gethex+0x25e>
   27454:	004d8913          	add	s2,s11,4
   27458:	41790933          	sub	s2,s2,s7
   2745c:	015da023          	sw	s5,0(s11)
   27460:	40295913          	sra	s2,s2,0x2
   27464:	01242823          	sw	s2,16(s0)
   27468:	8556                	mv	a0,s5
   2746a:	081000ef          	jal	27cea <__hi0bits>
   2746e:	0009aa03          	lw	s4,0(s3)
   27472:	0916                	sll	s2,s2,0x5
   27474:	40a90933          	sub	s2,s2,a0
   27478:	0d2a5163          	bge	s4,s2,2753a <__gethex+0x2ca>
   2747c:	41490933          	sub	s2,s2,s4
   27480:	85ca                	mv	a1,s2
   27482:	8522                	mv	a0,s0
   27484:	0d6010ef          	jal	2855a <__any_on>
   27488:	8d2a                	mv	s10,a0
   2748a:	c10d                	beqz	a0,274ac <__gethex+0x23c>
   2748c:	fff90693          	add	a3,s2,-1
   27490:	4056d713          	sra	a4,a3,0x5
   27494:	070a                	sll	a4,a4,0x2
   27496:	975e                	add	a4,a4,s7
   27498:	4318                	lw	a4,0(a4)
   2749a:	4785                	li	a5,1
   2749c:	00d797b3          	sll	a5,a5,a3
   274a0:	8ff9                	and	a5,a5,a4
   274a2:	4d05                	li	s10,1
   274a4:	c781                	beqz	a5,274ac <__gethex+0x23c>
   274a6:	08dd4263          	blt	s10,a3,2752a <__gethex+0x2ba>
   274aa:	4d09                	li	s10,2
   274ac:	85ca                	mv	a1,s2
   274ae:	8522                	mv	a0,s0
   274b0:	cd5ff0ef          	jal	27184 <rshift>
   274b4:	94ca                	add	s1,s1,s2
   274b6:	0089a783          	lw	a5,8(s3)
   274ba:	0a97d063          	bge	a5,s1,2755a <__gethex+0x2ea>
   274be:	4512                	lw	a0,4(sp)
   274c0:	85a2                	mv	a1,s0
   274c2:	0a300913          	li	s2,163
   274c6:	25b1                	jal	27b12 <_Bfree>
   274c8:	000c2023          	sw	zero,0(s8)
   274cc:	bf31                	j	273e8 <__gethex+0x178>
   274ce:	fffc8793          	add	a5,s9,-1
   274d2:	c63e                	sw	a5,12(sp)
   274d4:	fffcc603          	lbu	a2,-1(s9)
   274d8:	47d2                	lw	a5,20(sp)
   274da:	02f60763          	beq	a2,a5,27508 <__gethex+0x298>
   274de:	02000793          	li	a5,32
   274e2:	00fd1763          	bne	s10,a5,274f0 <__gethex+0x280>
   274e6:	015da023          	sw	s5,0(s11)
   274ea:	4d01                	li	s10,0
   274ec:	0d91                	add	s11,s11,4
   274ee:	4a81                	li	s5,0
   274f0:	fffcc503          	lbu	a0,-1(s9)
   274f4:	d3bff0ef          	jal	2722e <__hexdig_fun>
   274f8:	893d                	and	a0,a0,15
   274fa:	01a51533          	sll	a0,a0,s10
   274fe:	48b2                	lw	a7,12(sp)
   27500:	00aaeab3          	or	s5,s5,a0
   27504:	0d11                	add	s10,s10,4
   27506:	a005                	j	27526 <__gethex+0x2b6>
   27508:	4762                	lw	a4,24(sp)
   2750a:	fffc8793          	add	a5,s9,-1
   2750e:	00e788b3          	add	a7,a5,a4
   27512:	fd28e6e3          	bltu	a7,s2,274de <__gethex+0x26e>
   27516:	45a2                	lw	a1,8(sp)
   27518:	8546                	mv	a0,a7
   2751a:	8652                	mv	a2,s4
   2751c:	ce46                	sw	a7,28(sp)
   2751e:	19b010ef          	jal	28eb8 <strncmp>
   27522:	48f2                	lw	a7,28(sp)
   27524:	fd4d                	bnez	a0,274de <__gethex+0x26e>
   27526:	8cc6                	mv	s9,a7
   27528:	b725                	j	27450 <__gethex+0x1e0>
   2752a:	ffe90593          	add	a1,s2,-2
   2752e:	8522                	mv	a0,s0
   27530:	02a010ef          	jal	2855a <__any_on>
   27534:	d93d                	beqz	a0,274aa <__gethex+0x23a>
   27536:	4d0d                	li	s10,3
   27538:	bf95                	j	274ac <__gethex+0x23c>
   2753a:	4d01                	li	s10,0
   2753c:	f7495de3          	bge	s2,s4,274b6 <__gethex+0x246>
   27540:	4512                	lw	a0,4(sp)
   27542:	412a0933          	sub	s2,s4,s2
   27546:	85a2                	mv	a1,s0
   27548:	864a                	mv	a2,s2
   2754a:	2df000ef          	jal	28028 <__lshift>
   2754e:	842a                	mv	s0,a0
   27550:	412484b3          	sub	s1,s1,s2
   27554:	01450b93          	add	s7,a0,20
   27558:	bfb9                	j	274b6 <__gethex+0x246>
   2755a:	0049a783          	lw	a5,4(s3)
   2755e:	0ef4d363          	bge	s1,a5,27644 <__gethex+0x3d4>
   27562:	409784b3          	sub	s1,a5,s1
   27566:	0744c263          	blt	s1,s4,275ca <__gethex+0x35a>
   2756a:	00c9a783          	lw	a5,12(s3)
   2756e:	4709                	li	a4,2
   27570:	04e78763          	beq	a5,a4,275be <__gethex+0x34e>
   27574:	470d                	li	a4,3
   27576:	04e78763          	beq	a5,a4,275c4 <__gethex+0x354>
   2757a:	4705                	li	a4,1
   2757c:	02e79963          	bne	a5,a4,275ae <__gethex+0x33e>
   27580:	029a1763          	bne	s4,s1,275ae <__gethex+0x33e>
   27584:	00fa1f63          	bne	s4,a5,275a2 <__gethex+0x332>
   27588:	0049a783          	lw	a5,4(s3)
   2758c:	4742                	lw	a4,16(sp)
   2758e:	06200913          	li	s2,98
   27592:	c31c                	sw	a5,0(a4)
   27594:	4785                	li	a5,1
   27596:	c81c                	sw	a5,16(s0)
   27598:	00fba023          	sw	a5,0(s7)
   2759c:	008c2023          	sw	s0,0(s8)
   275a0:	b5a1                	j	273e8 <__gethex+0x178>
   275a2:	fffa0593          	add	a1,s4,-1
   275a6:	8522                	mv	a0,s0
   275a8:	7b3000ef          	jal	2855a <__any_on>
   275ac:	fd71                	bnez	a0,27588 <__gethex+0x318>
   275ae:	4512                	lw	a0,4(sp)
   275b0:	85a2                	mv	a1,s0
   275b2:	05000913          	li	s2,80
   275b6:	2bb1                	jal	27b12 <_Bfree>
   275b8:	000c2023          	sw	zero,0(s8)
   275bc:	b535                	j	273e8 <__gethex+0x178>
   275be:	fe0b18e3          	bnez	s6,275ae <__gethex+0x33e>
   275c2:	b7d9                	j	27588 <__gethex+0x318>
   275c4:	fc0b12e3          	bnez	s6,27588 <__gethex+0x318>
   275c8:	b7dd                	j	275ae <__gethex+0x33e>
   275ca:	fff48913          	add	s2,s1,-1
   275ce:	060d1963          	bnez	s10,27640 <__gethex+0x3d0>
   275d2:	00090763          	beqz	s2,275e0 <__gethex+0x370>
   275d6:	85ca                	mv	a1,s2
   275d8:	8522                	mv	a0,s0
   275da:	781000ef          	jal	2855a <__any_on>
   275de:	8d2a                	mv	s10,a0
   275e0:	40595713          	sra	a4,s2,0x5
   275e4:	070a                	sll	a4,a4,0x2
   275e6:	975e                	add	a4,a4,s7
   275e8:	4318                	lw	a4,0(a4)
   275ea:	4785                	li	a5,1
   275ec:	012797b3          	sll	a5,a5,s2
   275f0:	8ff9                	and	a5,a5,a4
   275f2:	c399                	beqz	a5,275f8 <__gethex+0x388>
   275f4:	002d6d13          	or	s10,s10,2
   275f8:	85a6                	mv	a1,s1
   275fa:	8522                	mv	a0,s0
   275fc:	409a0a33          	sub	s4,s4,s1
   27600:	b85ff0ef          	jal	27184 <rshift>
   27604:	0049a483          	lw	s1,4(s3)
   27608:	4909                	li	s2,2
   2760a:	080d0863          	beqz	s10,2769a <__gethex+0x42a>
   2760e:	00c9a783          	lw	a5,12(s3)
   27612:	4709                	li	a4,2
   27614:	02e78a63          	beq	a5,a4,27648 <__gethex+0x3d8>
   27618:	470d                	li	a4,3
   2761a:	02e78a63          	beq	a5,a4,2764e <__gethex+0x3de>
   2761e:	4705                	li	a4,1
   27620:	00e79d63          	bne	a5,a4,2763a <__gethex+0x3ca>
   27624:	002d7793          	and	a5,s10,2
   27628:	cb89                	beqz	a5,2763a <__gethex+0x3ca>
   2762a:	000ba783          	lw	a5,0(s7)
   2762e:	00fd6d33          	or	s10,s10,a5
   27632:	001d7d13          	and	s10,s10,1
   27636:	000d1e63          	bnez	s10,27652 <__gethex+0x3e2>
   2763a:	01096913          	or	s2,s2,16
   2763e:	a8b1                	j	2769a <__gethex+0x42a>
   27640:	4d05                	li	s10,1
   27642:	bf79                	j	275e0 <__gethex+0x370>
   27644:	4905                	li	s2,1
   27646:	b7d1                	j	2760a <__gethex+0x39a>
   27648:	4785                	li	a5,1
   2764a:	41678b33          	sub	s6,a5,s6
   2764e:	fe0b06e3          	beqz	s6,2763a <__gethex+0x3ca>
   27652:	01042d03          	lw	s10,16(s0)
   27656:	01440793          	add	a5,s0,20
   2765a:	567d                	li	a2,-1
   2765c:	002d1b13          	sll	s6,s10,0x2
   27660:	016786b3          	add	a3,a5,s6
   27664:	4398                	lw	a4,0(a5)
   27666:	02c70f63          	beq	a4,a2,276a4 <__gethex+0x434>
   2766a:	0705                	add	a4,a4,1
   2766c:	c398                	sw	a4,0(a5)
   2766e:	4709                	li	a4,2
   27670:	01440793          	add	a5,s0,20
   27674:	08e91463          	bne	s2,a4,276fc <__gethex+0x48c>
   27678:	0009a703          	lw	a4,0(s3)
   2767c:	177d                	add	a4,a4,-1
   2767e:	01471c63          	bne	a4,s4,27696 <__gethex+0x426>
   27682:	405a5713          	sra	a4,s4,0x5
   27686:	070a                	sll	a4,a4,0x2
   27688:	97ba                	add	a5,a5,a4
   2768a:	439c                	lw	a5,0(a5)
   2768c:	4705                	li	a4,1
   2768e:	01471733          	sll	a4,a4,s4
   27692:	8ff9                	and	a5,a5,a4
   27694:	e3c1                	bnez	a5,27714 <__gethex+0x4a4>
   27696:	02096913          	or	s2,s2,32
   2769a:	47c2                	lw	a5,16(sp)
   2769c:	008c2023          	sw	s0,0(s8)
   276a0:	c384                	sw	s1,0(a5)
   276a2:	b399                	j	273e8 <__gethex+0x178>
   276a4:	0007a023          	sw	zero,0(a5)
   276a8:	0791                	add	a5,a5,4
   276aa:	fad7ede3          	bltu	a5,a3,27664 <__gethex+0x3f4>
   276ae:	441c                	lw	a5,8(s0)
   276b0:	02fd4c63          	blt	s10,a5,276e8 <__gethex+0x478>
   276b4:	404c                	lw	a1,4(s0)
   276b6:	4512                	lw	a0,4(sp)
   276b8:	0585                	add	a1,a1,1
   276ba:	2675                	jal	27a66 <_Balloc>
   276bc:	8baa                	mv	s7,a0
   276be:	e909                	bnez	a0,276d0 <__gethex+0x460>
   276c0:	000296b7          	lui	a3,0x29
   276c4:	65068693          	add	a3,a3,1616 # 29650 <__clz_tab+0x1f0>
   276c8:	4601                	li	a2,0
   276ca:	08400593          	li	a1,132
   276ce:	bbb9                	j	2742c <__gethex+0x1bc>
   276d0:	4810                	lw	a2,16(s0)
   276d2:	00c40593          	add	a1,s0,12
   276d6:	0531                	add	a0,a0,12
   276d8:	0609                	add	a2,a2,2
   276da:	060a                	sll	a2,a2,0x2
   276dc:	ec6fa0ef          	jal	21da2 <memcpy>
   276e0:	4512                	lw	a0,4(sp)
   276e2:	85a2                	mv	a1,s0
   276e4:	845e                	mv	s0,s7
   276e6:	2135                	jal	27b12 <_Bfree>
   276e8:	481c                	lw	a5,16(s0)
   276ea:	00178713          	add	a4,a5,1
   276ee:	0791                	add	a5,a5,4
   276f0:	078a                	sll	a5,a5,0x2
   276f2:	c818                	sw	a4,16(s0)
   276f4:	97a2                	add	a5,a5,s0
   276f6:	4705                	li	a4,1
   276f8:	c3d8                	sw	a4,4(a5)
   276fa:	bf95                	j	2766e <__gethex+0x3fe>
   276fc:	4818                	lw	a4,16(s0)
   276fe:	00ed5d63          	bge	s10,a4,27718 <__gethex+0x4a8>
   27702:	4585                	li	a1,1
   27704:	8522                	mv	a0,s0
   27706:	a7fff0ef          	jal	27184 <rshift>
   2770a:	0089a783          	lw	a5,8(s3)
   2770e:	0485                	add	s1,s1,1
   27710:	da97c7e3          	blt	a5,s1,274be <__gethex+0x24e>
   27714:	4905                	li	s2,1
   27716:	b741                	j	27696 <__gethex+0x426>
   27718:	01fa7a13          	and	s4,s4,31
   2771c:	fe0a0ce3          	beqz	s4,27714 <__gethex+0x4a4>
   27720:	97da                	add	a5,a5,s6
   27722:	ffc7a503          	lw	a0,-4(a5)
   27726:	23d1                	jal	27cea <__hi0bits>
   27728:	02000793          	li	a5,32
   2772c:	414787b3          	sub	a5,a5,s4
   27730:	fcf549e3          	blt	a0,a5,27702 <__gethex+0x492>
   27734:	b7c5                	j	27714 <__gethex+0x4a4>

00027736 <L_shift>:
   27736:	47a1                	li	a5,8
   27738:	40c78633          	sub	a2,a5,a2
   2773c:	060a                	sll	a2,a2,0x2
   2773e:	02000693          	li	a3,32
   27742:	8e91                	sub	a3,a3,a2
   27744:	415c                	lw	a5,4(a0)
   27746:	4118                	lw	a4,0(a0)
   27748:	00d79833          	sll	a6,a5,a3
   2774c:	01076733          	or	a4,a4,a6
   27750:	00c7d7b3          	srl	a5,a5,a2
   27754:	c118                	sw	a4,0(a0)
   27756:	c15c                	sw	a5,4(a0)
   27758:	0511                	add	a0,a0,4
   2775a:	feb565e3          	bltu	a0,a1,27744 <L_shift+0xe>
   2775e:	8082                	ret

00027760 <__match>:
   27760:	411c                	lw	a5,0(a0)
   27762:	4865                	li	a6,25
   27764:	0005c603          	lbu	a2,0(a1)
   27768:	0585                	add	a1,a1,1
   2776a:	0785                	add	a5,a5,1
   2776c:	e601                	bnez	a2,27774 <__match+0x14>
   2776e:	c11c                	sw	a5,0(a0)
   27770:	4505                	li	a0,1
   27772:	8082                	ret
   27774:	0007c703          	lbu	a4,0(a5)
   27778:	fbf70693          	add	a3,a4,-65
   2777c:	0ff6f693          	zext.b	a3,a3
   27780:	00d86463          	bltu	a6,a3,27788 <__match+0x28>
   27784:	02070713          	add	a4,a4,32
   27788:	fcc70ee3          	beq	a4,a2,27764 <__match+0x4>
   2778c:	4501                	li	a0,0
   2778e:	8082                	ret

00027790 <__hexnan>:
   27790:	715d                	add	sp,sp,-80
   27792:	dc52                	sw	s4,56(sp)
   27794:	0005aa03          	lw	s4,0(a1)
   27798:	c2a6                	sw	s1,68(sp)
   2779a:	de4e                	sw	s3,60(sp)
   2779c:	405a5493          	sra	s1,s4,0x5
   277a0:	da56                	sw	s5,52(sp)
   277a2:	048a                	sll	s1,s1,0x2
   277a4:	c686                	sw	ra,76(sp)
   277a6:	c4a2                	sw	s0,72(sp)
   277a8:	c0ca                	sw	s2,64(sp)
   277aa:	d85a                	sw	s6,48(sp)
   277ac:	d65e                	sw	s7,44(sp)
   277ae:	d462                	sw	s8,40(sp)
   277b0:	d266                	sw	s9,36(sp)
   277b2:	d06a                	sw	s10,32(sp)
   277b4:	ce6e                	sw	s11,28(sp)
   277b6:	01fa7a13          	and	s4,s4,31
   277ba:	8aaa                	mv	s5,a0
   277bc:	89b2                	mv	s3,a2
   277be:	94b2                	add	s1,s1,a2
   277c0:	000a0363          	beqz	s4,277c6 <__hexnan+0x36>
   277c4:	0491                	add	s1,s1,4
   277c6:	000aa783          	lw	a5,0(s5)
   277ca:	ffc48913          	add	s2,s1,-4
   277ce:	fe04ae23          	sw	zero,-4(s1)
   277d2:	8dca                	mv	s11,s2
   277d4:	844a                	mv	s0,s2
   277d6:	4601                	li	a2,0
   277d8:	4b01                	li	s6,0
   277da:	4b81                	li	s7,0
   277dc:	4c21                	li	s8,8
   277de:	02000c93          	li	s9,32
   277e2:	4d1d                	li	s10,7
   277e4:	0017c683          	lbu	a3,1(a5)
   277e8:	00178713          	add	a4,a5,1
   277ec:	c03a                	sw	a4,0(sp)
   277ee:	caa9                	beqz	a3,27840 <__hexnan+0xb0>
   277f0:	8536                	mv	a0,a3
   277f2:	c632                	sw	a2,12(sp)
   277f4:	c43e                	sw	a5,8(sp)
   277f6:	c236                	sw	a3,4(sp)
   277f8:	a37ff0ef          	jal	2722e <__hexdig_fun>
   277fc:	4632                	lw	a2,12(sp)
   277fe:	ed55                	bnez	a0,278ba <__hexnan+0x12a>
   27800:	4692                	lw	a3,4(sp)
   27802:	47a2                	lw	a5,8(sp)
   27804:	02dce763          	bltu	s9,a3,27832 <__hexnan+0xa2>
   27808:	037b5363          	bge	s6,s7,2782e <__hexnan+0x9e>
   2780c:	01b47763          	bgeu	s0,s11,2781a <__hexnan+0x8a>
   27810:	00cd4563          	blt	s10,a2,2781a <__hexnan+0x8a>
   27814:	85ee                	mv	a1,s11
   27816:	8522                	mv	a0,s0
   27818:	3f39                	jal	27736 <L_shift>
   2781a:	4621                	li	a2,8
   2781c:	0089f963          	bgeu	s3,s0,2782e <__hexnan+0x9e>
   27820:	ffc40d93          	add	s11,s0,-4
   27824:	fe042e23          	sw	zero,-4(s0)
   27828:	8b5e                	mv	s6,s7
   2782a:	846e                	mv	s0,s11
   2782c:	4601                	li	a2,0
   2782e:	4782                	lw	a5,0(sp)
   27830:	bf55                	j	277e4 <__hexnan+0x54>
   27832:	02900593          	li	a1,41
   27836:	0cb69363          	bne	a3,a1,278fc <__hexnan+0x16c>
   2783a:	0789                	add	a5,a5,2
   2783c:	00faa023          	sw	a5,0(s5)
   27840:	0a0b8e63          	beqz	s7,278fc <__hexnan+0x16c>
   27844:	01b47863          	bgeu	s0,s11,27854 <__hexnan+0xc4>
   27848:	479d                	li	a5,7
   2784a:	00c7c563          	blt	a5,a2,27854 <__hexnan+0xc4>
   2784e:	85ee                	mv	a1,s11
   27850:	8522                	mv	a0,s0
   27852:	35d5                	jal	27736 <L_shift>
   27854:	0889f363          	bgeu	s3,s0,278da <__hexnan+0x14a>
   27858:	874e                	mv	a4,s3
   2785a:	87a2                	mv	a5,s0
   2785c:	4394                	lw	a3,0(a5)
   2785e:	0791                	add	a5,a5,4
   27860:	c314                	sw	a3,0(a4)
   27862:	0711                	add	a4,a4,4
   27864:	fef97ce3          	bgeu	s2,a5,2785c <__hexnan+0xcc>
   27868:	00140713          	add	a4,s0,1
   2786c:	14f5                	add	s1,s1,-3
   2786e:	4791                	li	a5,4
   27870:	00e4e763          	bltu	s1,a4,2787e <__hexnan+0xee>
   27874:	40890433          	sub	s0,s2,s0
   27878:	9871                	and	s0,s0,-4
   2787a:	00440793          	add	a5,s0,4
   2787e:	97ce                	add	a5,a5,s3
   27880:	0007a023          	sw	zero,0(a5)
   27884:	0791                	add	a5,a5,4
   27886:	fef97de3          	bgeu	s2,a5,27880 <__hexnan+0xf0>
   2788a:	00092783          	lw	a5,0(s2)
   2788e:	e791                	bnez	a5,2789a <__hexnan+0x10a>
   27890:	07391463          	bne	s2,s3,278f8 <__hexnan+0x168>
   27894:	4785                	li	a5,1
   27896:	00f92023          	sw	a5,0(s2)
   2789a:	4515                	li	a0,5
   2789c:	40b6                	lw	ra,76(sp)
   2789e:	4426                	lw	s0,72(sp)
   278a0:	4496                	lw	s1,68(sp)
   278a2:	4906                	lw	s2,64(sp)
   278a4:	59f2                	lw	s3,60(sp)
   278a6:	5a62                	lw	s4,56(sp)
   278a8:	5ad2                	lw	s5,52(sp)
   278aa:	5b42                	lw	s6,48(sp)
   278ac:	5bb2                	lw	s7,44(sp)
   278ae:	5c22                	lw	s8,40(sp)
   278b0:	5c92                	lw	s9,36(sp)
   278b2:	5d02                	lw	s10,32(sp)
   278b4:	4df2                	lw	s11,28(sp)
   278b6:	6161                	add	sp,sp,80
   278b8:	8082                	ret
   278ba:	0605                	add	a2,a2,1
   278bc:	0b85                	add	s7,s7,1
   278be:	00cc5863          	bge	s8,a2,278ce <__hexnan+0x13e>
   278c2:	f689f6e3          	bgeu	s3,s0,2782e <__hexnan+0x9e>
   278c6:	fe042e23          	sw	zero,-4(s0)
   278ca:	4605                	li	a2,1
   278cc:	1471                	add	s0,s0,-4
   278ce:	401c                	lw	a5,0(s0)
   278d0:	893d                	and	a0,a0,15
   278d2:	0792                	sll	a5,a5,0x4
   278d4:	8fc9                	or	a5,a5,a0
   278d6:	c01c                	sw	a5,0(s0)
   278d8:	bf99                	j	2782e <__hexnan+0x9e>
   278da:	fa0a08e3          	beqz	s4,2788a <__hexnan+0xfa>
   278de:	02000793          	li	a5,32
   278e2:	414787b3          	sub	a5,a5,s4
   278e6:	577d                	li	a4,-1
   278e8:	00f75733          	srl	a4,a4,a5
   278ec:	ffc4a783          	lw	a5,-4(s1)
   278f0:	8ff9                	and	a5,a5,a4
   278f2:	fef4ae23          	sw	a5,-4(s1)
   278f6:	bf51                	j	2788a <__hexnan+0xfa>
   278f8:	1971                	add	s2,s2,-4
   278fa:	bf41                	j	2788a <__hexnan+0xfa>
   278fc:	4511                	li	a0,4
   278fe:	bf79                	j	2789c <__hexnan+0x10c>

00027900 <_localeconv_r>:
   27900:	95018513          	add	a0,gp,-1712 # a0150 <__global_locale+0xf0>
   27904:	8082                	ret

00027906 <__swhatbuf_r>:
   27906:	7159                	add	sp,sp,-112
   27908:	d4a2                	sw	s0,104(sp)
   2790a:	842e                	mv	s0,a1
   2790c:	00e59583          	lh	a1,14(a1)
   27910:	d2a6                	sw	s1,100(sp)
   27912:	d0ca                	sw	s2,96(sp)
   27914:	d686                	sw	ra,108(sp)
   27916:	84b2                	mv	s1,a2
   27918:	8936                	mv	s2,a3
   2791a:	0205d363          	bgez	a1,27940 <__swhatbuf_r+0x3a>
   2791e:	00c45783          	lhu	a5,12(s0)
   27922:	0807f793          	and	a5,a5,128
   27926:	eb95                	bnez	a5,2795a <__swhatbuf_r+0x54>
   27928:	40000713          	li	a4,1024
   2792c:	50b6                	lw	ra,108(sp)
   2792e:	5426                	lw	s0,104(sp)
   27930:	00f92023          	sw	a5,0(s2)
   27934:	c098                	sw	a4,0(s1)
   27936:	5906                	lw	s2,96(sp)
   27938:	5496                	lw	s1,100(sp)
   2793a:	4501                	li	a0,0
   2793c:	6165                	add	sp,sp,112
   2793e:	8082                	ret
   27940:	0030                	add	a2,sp,8
   27942:	043010ef          	jal	29184 <_fstat_r>
   27946:	fc054ce3          	bltz	a0,2791e <__swhatbuf_r+0x18>
   2794a:	4732                	lw	a4,12(sp)
   2794c:	67bd                	lui	a5,0xf
   2794e:	8ff9                	and	a5,a5,a4
   27950:	7779                	lui	a4,0xffffe
   27952:	97ba                	add	a5,a5,a4
   27954:	0017b793          	seqz	a5,a5
   27958:	bfc1                	j	27928 <__swhatbuf_r+0x22>
   2795a:	4781                	li	a5,0
   2795c:	04000713          	li	a4,64
   27960:	b7f1                	j	2792c <__swhatbuf_r+0x26>

00027962 <__smakebuf_r>:
   27962:	00c5d783          	lhu	a5,12(a1)
   27966:	7179                	add	sp,sp,-48
   27968:	d422                	sw	s0,40(sp)
   2796a:	d606                	sw	ra,44(sp)
   2796c:	d226                	sw	s1,36(sp)
   2796e:	d04a                	sw	s2,32(sp)
   27970:	ce4e                	sw	s3,28(sp)
   27972:	8b89                	and	a5,a5,2
   27974:	842e                	mv	s0,a1
   27976:	cf91                	beqz	a5,27992 <__smakebuf_r+0x30>
   27978:	04740793          	add	a5,s0,71
   2797c:	c01c                	sw	a5,0(s0)
   2797e:	c81c                	sw	a5,16(s0)
   27980:	4785                	li	a5,1
   27982:	c85c                	sw	a5,20(s0)
   27984:	50b2                	lw	ra,44(sp)
   27986:	5422                	lw	s0,40(sp)
   27988:	5492                	lw	s1,36(sp)
   2798a:	5902                	lw	s2,32(sp)
   2798c:	49f2                	lw	s3,28(sp)
   2798e:	6145                	add	sp,sp,48
   27990:	8082                	ret
   27992:	0074                	add	a3,sp,12
   27994:	0030                	add	a2,sp,8
   27996:	84aa                	mv	s1,a0
   27998:	37bd                	jal	27906 <__swhatbuf_r>
   2799a:	49a2                	lw	s3,8(sp)
   2799c:	892a                	mv	s2,a0
   2799e:	8526                	mv	a0,s1
   279a0:	85ce                	mv	a1,s3
   279a2:	4d5000ef          	jal	28676 <_malloc_r>
   279a6:	ed01                	bnez	a0,279be <__smakebuf_r+0x5c>
   279a8:	00c41783          	lh	a5,12(s0)
   279ac:	2007f713          	and	a4,a5,512
   279b0:	fb71                	bnez	a4,27984 <__smakebuf_r+0x22>
   279b2:	9bf1                	and	a5,a5,-4
   279b4:	0027e793          	or	a5,a5,2
   279b8:	00f41623          	sh	a5,12(s0)
   279bc:	bf75                	j	27978 <__smakebuf_r+0x16>
   279be:	000277b7          	lui	a5,0x27
   279c2:	fc078793          	add	a5,a5,-64 # 26fc0 <_cleanup_r>
   279c6:	d49c                	sw	a5,40(s1)
   279c8:	00c45783          	lhu	a5,12(s0)
   279cc:	c008                	sw	a0,0(s0)
   279ce:	c808                	sw	a0,16(s0)
   279d0:	0807e793          	or	a5,a5,128
   279d4:	00f41623          	sh	a5,12(s0)
   279d8:	47b2                	lw	a5,12(sp)
   279da:	01342a23          	sw	s3,20(s0)
   279de:	cf91                	beqz	a5,279fa <__smakebuf_r+0x98>
   279e0:	00e41583          	lh	a1,14(s0)
   279e4:	8526                	mv	a0,s1
   279e6:	7cc010ef          	jal	291b2 <_isatty_r>
   279ea:	c901                	beqz	a0,279fa <__smakebuf_r+0x98>
   279ec:	00c45783          	lhu	a5,12(s0)
   279f0:	9bf1                	and	a5,a5,-4
   279f2:	0017e793          	or	a5,a5,1
   279f6:	00f41623          	sh	a5,12(s0)
   279fa:	00c45783          	lhu	a5,12(s0)
   279fe:	0127e533          	or	a0,a5,s2
   27a02:	00a41623          	sh	a0,12(s0)
   27a06:	bfbd                	j	27984 <__smakebuf_r+0x22>

00027a08 <malloc>:
   27a08:	85aa                	mv	a1,a0
   27a0a:	9cc1a503          	lw	a0,-1588(gp) # a01cc <_impure_ptr>
   27a0e:	4690006f          	j	28676 <_malloc_r>

00027a12 <__ascii_mbtowc>:
   27a12:	e185                	bnez	a1,27a32 <__ascii_mbtowc+0x20>
   27a14:	1141                	add	sp,sp,-16
   27a16:	006c                	add	a1,sp,12
   27a18:	4501                	li	a0,0
   27a1a:	ca11                	beqz	a2,27a2e <__ascii_mbtowc+0x1c>
   27a1c:	5579                	li	a0,-2
   27a1e:	ca81                	beqz	a3,27a2e <__ascii_mbtowc+0x1c>
   27a20:	00064783          	lbu	a5,0(a2)
   27a24:	c19c                	sw	a5,0(a1)
   27a26:	00064503          	lbu	a0,0(a2)
   27a2a:	00a03533          	snez	a0,a0
   27a2e:	0141                	add	sp,sp,16
   27a30:	8082                	ret
   27a32:	4501                	li	a0,0
   27a34:	ca19                	beqz	a2,27a4a <__ascii_mbtowc+0x38>
   27a36:	5579                	li	a0,-2
   27a38:	ca89                	beqz	a3,27a4a <__ascii_mbtowc+0x38>
   27a3a:	00064783          	lbu	a5,0(a2)
   27a3e:	c19c                	sw	a5,0(a1)
   27a40:	00064503          	lbu	a0,0(a2)
   27a44:	00a03533          	snez	a0,a0
   27a48:	8082                	ret
   27a4a:	8082                	ret

00027a4c <memchr>:
   27a4c:	0ff5f593          	zext.b	a1,a1
   27a50:	962a                	add	a2,a2,a0
   27a52:	00c51463          	bne	a0,a2,27a5a <memchr+0xe>
   27a56:	4501                	li	a0,0
   27a58:	8082                	ret
   27a5a:	00054783          	lbu	a5,0(a0)
   27a5e:	feb78de3          	beq	a5,a1,27a58 <memchr+0xc>
   27a62:	0505                	add	a0,a0,1
   27a64:	b7fd                	j	27a52 <memchr+0x6>

00027a66 <_Balloc>:
   27a66:	515c                	lw	a5,36(a0)
   27a68:	1141                	add	sp,sp,-16
   27a6a:	c422                	sw	s0,8(sp)
   27a6c:	c226                	sw	s1,4(sp)
   27a6e:	c606                	sw	ra,12(sp)
   27a70:	c04a                	sw	s2,0(sp)
   27a72:	842a                	mv	s0,a0
   27a74:	84ae                	mv	s1,a1
   27a76:	eb95                	bnez	a5,27aaa <_Balloc+0x44>
   27a78:	4541                	li	a0,16
   27a7a:	3779                	jal	27a08 <malloc>
   27a7c:	d048                	sw	a0,36(s0)
   27a7e:	ed11                	bnez	a0,27a9a <_Balloc+0x34>
   27a80:	000296b7          	lui	a3,0x29
   27a84:	00029537          	lui	a0,0x29
   27a88:	5ec68693          	add	a3,a3,1516 # 295ec <__clz_tab+0x18c>
   27a8c:	4601                	li	a2,0
   27a8e:	06600593          	li	a1,102
   27a92:	6c850513          	add	a0,a0,1736 # 296c8 <__clz_tab+0x268>
   27a96:	664010ef          	jal	290fa <__assert_func>
   27a9a:	00052223          	sw	zero,4(a0)
   27a9e:	00052423          	sw	zero,8(a0)
   27aa2:	00052023          	sw	zero,0(a0)
   27aa6:	00052623          	sw	zero,12(a0)
   27aaa:	02442903          	lw	s2,36(s0)
   27aae:	00c92783          	lw	a5,12(s2)
   27ab2:	c79d                	beqz	a5,27ae0 <_Balloc+0x7a>
   27ab4:	505c                	lw	a5,36(s0)
   27ab6:	00249713          	sll	a4,s1,0x2
   27aba:	47dc                	lw	a5,12(a5)
   27abc:	97ba                	add	a5,a5,a4
   27abe:	4388                	lw	a0,0(a5)
   27ac0:	e131                	bnez	a0,27b04 <_Balloc+0x9e>
   27ac2:	4905                	li	s2,1
   27ac4:	00991933          	sll	s2,s2,s1
   27ac8:	00590613          	add	a2,s2,5
   27acc:	060a                	sll	a2,a2,0x2
   27ace:	4585                	li	a1,1
   27ad0:	8522                	mv	a0,s0
   27ad2:	2cf000ef          	jal	285a0 <_calloc_r>
   27ad6:	c105                	beqz	a0,27af6 <_Balloc+0x90>
   27ad8:	c144                	sw	s1,4(a0)
   27ada:	01252423          	sw	s2,8(a0)
   27ade:	a02d                	j	27b08 <_Balloc+0xa2>
   27ae0:	02100613          	li	a2,33
   27ae4:	4591                	li	a1,4
   27ae6:	8522                	mv	a0,s0
   27ae8:	2b9000ef          	jal	285a0 <_calloc_r>
   27aec:	505c                	lw	a5,36(s0)
   27aee:	00a92623          	sw	a0,12(s2)
   27af2:	47dc                	lw	a5,12(a5)
   27af4:	f3e1                	bnez	a5,27ab4 <_Balloc+0x4e>
   27af6:	4501                	li	a0,0
   27af8:	40b2                	lw	ra,12(sp)
   27afa:	4422                	lw	s0,8(sp)
   27afc:	4492                	lw	s1,4(sp)
   27afe:	4902                	lw	s2,0(sp)
   27b00:	0141                	add	sp,sp,16
   27b02:	8082                	ret
   27b04:	4118                	lw	a4,0(a0)
   27b06:	c398                	sw	a4,0(a5)
   27b08:	00052823          	sw	zero,16(a0)
   27b0c:	00052623          	sw	zero,12(a0)
   27b10:	b7e5                	j	27af8 <_Balloc+0x92>

00027b12 <_Bfree>:
   27b12:	515c                	lw	a5,36(a0)
   27b14:	1141                	add	sp,sp,-16
   27b16:	c422                	sw	s0,8(sp)
   27b18:	c226                	sw	s1,4(sp)
   27b1a:	c606                	sw	ra,12(sp)
   27b1c:	84aa                	mv	s1,a0
   27b1e:	842e                	mv	s0,a1
   27b20:	eb95                	bnez	a5,27b54 <_Bfree+0x42>
   27b22:	4541                	li	a0,16
   27b24:	35d5                	jal	27a08 <malloc>
   27b26:	d0c8                	sw	a0,36(s1)
   27b28:	ed11                	bnez	a0,27b44 <_Bfree+0x32>
   27b2a:	000296b7          	lui	a3,0x29
   27b2e:	00029537          	lui	a0,0x29
   27b32:	5ec68693          	add	a3,a3,1516 # 295ec <__clz_tab+0x18c>
   27b36:	4601                	li	a2,0
   27b38:	08a00593          	li	a1,138
   27b3c:	6c850513          	add	a0,a0,1736 # 296c8 <__clz_tab+0x268>
   27b40:	5ba010ef          	jal	290fa <__assert_func>
   27b44:	00052223          	sw	zero,4(a0)
   27b48:	00052423          	sw	zero,8(a0)
   27b4c:	00052023          	sw	zero,0(a0)
   27b50:	00052623          	sw	zero,12(a0)
   27b54:	c809                	beqz	s0,27b66 <_Bfree+0x54>
   27b56:	50dc                	lw	a5,36(s1)
   27b58:	4058                	lw	a4,4(s0)
   27b5a:	47dc                	lw	a5,12(a5)
   27b5c:	070a                	sll	a4,a4,0x2
   27b5e:	97ba                	add	a5,a5,a4
   27b60:	4398                	lw	a4,0(a5)
   27b62:	c018                	sw	a4,0(s0)
   27b64:	c380                	sw	s0,0(a5)
   27b66:	40b2                	lw	ra,12(sp)
   27b68:	4422                	lw	s0,8(sp)
   27b6a:	4492                	lw	s1,4(sp)
   27b6c:	0141                	add	sp,sp,16
   27b6e:	8082                	ret

00027b70 <__multadd>:
   27b70:	1101                	add	sp,sp,-32
   27b72:	cc22                	sw	s0,24(sp)
   27b74:	c84a                	sw	s2,16(sp)
   27b76:	c64e                	sw	s3,12(sp)
   27b78:	0105a903          	lw	s2,16(a1)
   27b7c:	842e                	mv	s0,a1
   27b7e:	89b6                	mv	s3,a3
   27b80:	01458693          	add	a3,a1,20
   27b84:	65c1                	lui	a1,0x10
   27b86:	ca26                	sw	s1,20(sp)
   27b88:	ce06                	sw	ra,28(sp)
   27b8a:	84aa                	mv	s1,a0
   27b8c:	c452                	sw	s4,8(sp)
   27b8e:	4501                	li	a0,0
   27b90:	15fd                	add	a1,a1,-1 # ffff <__fw_size__+0x62ef>
   27b92:	429c                	lw	a5,0(a3)
   27b94:	0505                	add	a0,a0,1
   27b96:	00b7f733          	and	a4,a5,a1
   27b9a:	02c70733          	mul	a4,a4,a2
   27b9e:	83c1                	srl	a5,a5,0x10
   27ba0:	02c787b3          	mul	a5,a5,a2
   27ba4:	974e                	add	a4,a4,s3
   27ba6:	01075813          	srl	a6,a4,0x10
   27baa:	8f6d                	and	a4,a4,a1
   27bac:	97c2                	add	a5,a5,a6
   27bae:	0107d993          	srl	s3,a5,0x10
   27bb2:	07c2                	sll	a5,a5,0x10
   27bb4:	97ba                	add	a5,a5,a4
   27bb6:	c29c                	sw	a5,0(a3)
   27bb8:	0691                	add	a3,a3,4
   27bba:	fd254ce3          	blt	a0,s2,27b92 <__multadd+0x22>
   27bbe:	04098d63          	beqz	s3,27c18 <__multadd+0xa8>
   27bc2:	441c                	lw	a5,8(s0)
   27bc4:	04f94163          	blt	s2,a5,27c06 <__multadd+0x96>
   27bc8:	404c                	lw	a1,4(s0)
   27bca:	8526                	mv	a0,s1
   27bcc:	0585                	add	a1,a1,1
   27bce:	3d61                	jal	27a66 <_Balloc>
   27bd0:	8a2a                	mv	s4,a0
   27bd2:	ed11                	bnez	a0,27bee <__multadd+0x7e>
   27bd4:	000296b7          	lui	a3,0x29
   27bd8:	00029537          	lui	a0,0x29
   27bdc:	65068693          	add	a3,a3,1616 # 29650 <__clz_tab+0x1f0>
   27be0:	4601                	li	a2,0
   27be2:	0b500593          	li	a1,181
   27be6:	6c850513          	add	a0,a0,1736 # 296c8 <__clz_tab+0x268>
   27bea:	510010ef          	jal	290fa <__assert_func>
   27bee:	4810                	lw	a2,16(s0)
   27bf0:	00c40593          	add	a1,s0,12
   27bf4:	0531                	add	a0,a0,12
   27bf6:	0609                	add	a2,a2,2
   27bf8:	060a                	sll	a2,a2,0x2
   27bfa:	9a8fa0ef          	jal	21da2 <memcpy>
   27bfe:	85a2                	mv	a1,s0
   27c00:	8526                	mv	a0,s1
   27c02:	3f01                	jal	27b12 <_Bfree>
   27c04:	8452                	mv	s0,s4
   27c06:	00490793          	add	a5,s2,4
   27c0a:	078a                	sll	a5,a5,0x2
   27c0c:	97a2                	add	a5,a5,s0
   27c0e:	0137a223          	sw	s3,4(a5)
   27c12:	0905                	add	s2,s2,1
   27c14:	01242823          	sw	s2,16(s0)
   27c18:	40f2                	lw	ra,28(sp)
   27c1a:	8522                	mv	a0,s0
   27c1c:	4462                	lw	s0,24(sp)
   27c1e:	44d2                	lw	s1,20(sp)
   27c20:	4942                	lw	s2,16(sp)
   27c22:	49b2                	lw	s3,12(sp)
   27c24:	4a22                	lw	s4,8(sp)
   27c26:	6105                	add	sp,sp,32
   27c28:	8082                	ret

00027c2a <__s2b>:
   27c2a:	1101                	add	sp,sp,-32
   27c2c:	c452                	sw	s4,8(sp)
   27c2e:	00868793          	add	a5,a3,8
   27c32:	8a3a                	mv	s4,a4
   27c34:	4725                	li	a4,9
   27c36:	02e7c7b3          	div	a5,a5,a4
   27c3a:	cc22                	sw	s0,24(sp)
   27c3c:	ca26                	sw	s1,20(sp)
   27c3e:	c84a                	sw	s2,16(sp)
   27c40:	c64e                	sw	s3,12(sp)
   27c42:	842e                	mv	s0,a1
   27c44:	ce06                	sw	ra,28(sp)
   27c46:	c256                	sw	s5,4(sp)
   27c48:	892a                	mv	s2,a0
   27c4a:	84b2                	mv	s1,a2
   27c4c:	89b6                	mv	s3,a3
   27c4e:	4705                	li	a4,1
   27c50:	4581                	li	a1,0
   27c52:	02f74363          	blt	a4,a5,27c78 <__s2b+0x4e>
   27c56:	854a                	mv	a0,s2
   27c58:	e0fff0ef          	jal	27a66 <_Balloc>
   27c5c:	e10d                	bnez	a0,27c7e <__s2b+0x54>
   27c5e:	000296b7          	lui	a3,0x29
   27c62:	00029537          	lui	a0,0x29
   27c66:	65068693          	add	a3,a3,1616 # 29650 <__clz_tab+0x1f0>
   27c6a:	4601                	li	a2,0
   27c6c:	0ce00593          	li	a1,206
   27c70:	6c850513          	add	a0,a0,1736 # 296c8 <__clz_tab+0x268>
   27c74:	486010ef          	jal	290fa <__assert_func>
   27c78:	0706                	sll	a4,a4,0x1
   27c7a:	0585                	add	a1,a1,1
   27c7c:	bfd9                	j	27c52 <__s2b+0x28>
   27c7e:	4785                	li	a5,1
   27c80:	c91c                	sw	a5,16(a0)
   27c82:	01452a23          	sw	s4,20(a0)
   27c86:	47a5                	li	a5,9
   27c88:	0497d063          	bge	a5,s1,27cc8 <__s2b+0x9e>
   27c8c:	00940a93          	add	s5,s0,9
   27c90:	8a56                	mv	s4,s5
   27c92:	9426                	add	s0,s0,s1
   27c94:	000a4683          	lbu	a3,0(s4)
   27c98:	0a05                	add	s4,s4,1
   27c9a:	85aa                	mv	a1,a0
   27c9c:	fd068693          	add	a3,a3,-48
   27ca0:	4629                	li	a2,10
   27ca2:	854a                	mv	a0,s2
   27ca4:	35f1                	jal	27b70 <__multadd>
   27ca6:	fe8a17e3          	bne	s4,s0,27c94 <__s2b+0x6a>
   27caa:	ff848413          	add	s0,s1,-8
   27cae:	9456                	add	s0,s0,s5
   27cb0:	8a26                	mv	s4,s1
   27cb2:	013a4e63          	blt	s4,s3,27cce <__s2b+0xa4>
   27cb6:	40f2                	lw	ra,28(sp)
   27cb8:	4462                	lw	s0,24(sp)
   27cba:	44d2                	lw	s1,20(sp)
   27cbc:	4942                	lw	s2,16(sp)
   27cbe:	49b2                	lw	s3,12(sp)
   27cc0:	4a22                	lw	s4,8(sp)
   27cc2:	4a92                	lw	s5,4(sp)
   27cc4:	6105                	add	sp,sp,32
   27cc6:	8082                	ret
   27cc8:	0429                	add	s0,s0,10
   27cca:	44a5                	li	s1,9
   27ccc:	b7d5                	j	27cb0 <__s2b+0x86>
   27cce:	409a07b3          	sub	a5,s4,s1
   27cd2:	97a2                	add	a5,a5,s0
   27cd4:	0007c683          	lbu	a3,0(a5)
   27cd8:	85aa                	mv	a1,a0
   27cda:	4629                	li	a2,10
   27cdc:	fd068693          	add	a3,a3,-48
   27ce0:	854a                	mv	a0,s2
   27ce2:	e8fff0ef          	jal	27b70 <__multadd>
   27ce6:	0a05                	add	s4,s4,1
   27ce8:	b7e9                	j	27cb2 <__s2b+0x88>

00027cea <__hi0bits>:
   27cea:	87aa                	mv	a5,a0
   27cec:	6741                	lui	a4,0x10
   27cee:	4501                	li	a0,0
   27cf0:	00e7f463          	bgeu	a5,a4,27cf8 <__hi0bits+0xe>
   27cf4:	07c2                	sll	a5,a5,0x10
   27cf6:	4541                	li	a0,16
   27cf8:	01000737          	lui	a4,0x1000
   27cfc:	00e7f463          	bgeu	a5,a4,27d04 <__hi0bits+0x1a>
   27d00:	0521                	add	a0,a0,8
   27d02:	07a2                	sll	a5,a5,0x8
   27d04:	10000737          	lui	a4,0x10000
   27d08:	00e7f463          	bgeu	a5,a4,27d10 <__hi0bits+0x26>
   27d0c:	0511                	add	a0,a0,4
   27d0e:	0792                	sll	a5,a5,0x4
   27d10:	40000737          	lui	a4,0x40000
   27d14:	00e7f463          	bgeu	a5,a4,27d1c <__hi0bits+0x32>
   27d18:	0509                	add	a0,a0,2
   27d1a:	078a                	sll	a5,a5,0x2
   27d1c:	0007c963          	bltz	a5,27d2e <__hi0bits+0x44>
   27d20:	00179713          	sll	a4,a5,0x1
   27d24:	0505                	add	a0,a0,1
   27d26:	00074463          	bltz	a4,27d2e <__hi0bits+0x44>
   27d2a:	02000513          	li	a0,32
   27d2e:	8082                	ret

00027d30 <__lo0bits>:
   27d30:	411c                	lw	a5,0(a0)
   27d32:	872a                	mv	a4,a0
   27d34:	0077f693          	and	a3,a5,7
   27d38:	c285                	beqz	a3,27d58 <__lo0bits+0x28>
   27d3a:	0017f693          	and	a3,a5,1
   27d3e:	4501                	li	a0,0
   27d40:	eea1                	bnez	a3,27d98 <__lo0bits+0x68>
   27d42:	0027f693          	and	a3,a5,2
   27d46:	c689                	beqz	a3,27d50 <__lo0bits+0x20>
   27d48:	8385                	srl	a5,a5,0x1
   27d4a:	c31c                	sw	a5,0(a4)
   27d4c:	4505                	li	a0,1
   27d4e:	8082                	ret
   27d50:	8389                	srl	a5,a5,0x2
   27d52:	c31c                	sw	a5,0(a4)
   27d54:	4509                	li	a0,2
   27d56:	8082                	ret
   27d58:	01079693          	sll	a3,a5,0x10
   27d5c:	82c1                	srl	a3,a3,0x10
   27d5e:	4501                	li	a0,0
   27d60:	e299                	bnez	a3,27d66 <__lo0bits+0x36>
   27d62:	83c1                	srl	a5,a5,0x10
   27d64:	4541                	li	a0,16
   27d66:	0ff7f693          	zext.b	a3,a5
   27d6a:	e299                	bnez	a3,27d70 <__lo0bits+0x40>
   27d6c:	0521                	add	a0,a0,8
   27d6e:	83a1                	srl	a5,a5,0x8
   27d70:	00f7f693          	and	a3,a5,15
   27d74:	e299                	bnez	a3,27d7a <__lo0bits+0x4a>
   27d76:	0511                	add	a0,a0,4
   27d78:	8391                	srl	a5,a5,0x4
   27d7a:	0037f693          	and	a3,a5,3
   27d7e:	e299                	bnez	a3,27d84 <__lo0bits+0x54>
   27d80:	0509                	add	a0,a0,2
   27d82:	8389                	srl	a5,a5,0x2
   27d84:	0017f693          	and	a3,a5,1
   27d88:	e681                	bnez	a3,27d90 <__lo0bits+0x60>
   27d8a:	8385                	srl	a5,a5,0x1
   27d8c:	0505                	add	a0,a0,1
   27d8e:	c399                	beqz	a5,27d94 <__lo0bits+0x64>
   27d90:	c31c                	sw	a5,0(a4)
   27d92:	8082                	ret
   27d94:	02000513          	li	a0,32
   27d98:	8082                	ret

00027d9a <__i2b>:
   27d9a:	1141                	add	sp,sp,-16
   27d9c:	c422                	sw	s0,8(sp)
   27d9e:	842e                	mv	s0,a1
   27da0:	4585                	li	a1,1
   27da2:	c606                	sw	ra,12(sp)
   27da4:	cc3ff0ef          	jal	27a66 <_Balloc>
   27da8:	ed11                	bnez	a0,27dc4 <__i2b+0x2a>
   27daa:	000296b7          	lui	a3,0x29
   27dae:	00029537          	lui	a0,0x29
   27db2:	65068693          	add	a3,a3,1616 # 29650 <__clz_tab+0x1f0>
   27db6:	4601                	li	a2,0
   27db8:	14000593          	li	a1,320
   27dbc:	6c850513          	add	a0,a0,1736 # 296c8 <__clz_tab+0x268>
   27dc0:	33a010ef          	jal	290fa <__assert_func>
   27dc4:	40b2                	lw	ra,12(sp)
   27dc6:	c940                	sw	s0,20(a0)
   27dc8:	4422                	lw	s0,8(sp)
   27dca:	4705                	li	a4,1
   27dcc:	c918                	sw	a4,16(a0)
   27dce:	0141                	add	sp,sp,16
   27dd0:	8082                	ret

00027dd2 <__multiply>:
   27dd2:	4998                	lw	a4,16(a1)
   27dd4:	4a1c                	lw	a5,16(a2)
   27dd6:	1101                	add	sp,sp,-32
   27dd8:	cc22                	sw	s0,24(sp)
   27dda:	c84a                	sw	s2,16(sp)
   27ddc:	ce06                	sw	ra,28(sp)
   27dde:	ca26                	sw	s1,20(sp)
   27de0:	c64e                	sw	s3,12(sp)
   27de2:	c452                	sw	s4,8(sp)
   27de4:	892e                	mv	s2,a1
   27de6:	8432                	mv	s0,a2
   27de8:	00f74463          	blt	a4,a5,27df0 <__multiply+0x1e>
   27dec:	842e                	mv	s0,a1
   27dee:	8932                	mv	s2,a2
   27df0:	01042a03          	lw	s4,16(s0)
   27df4:	01092983          	lw	s3,16(s2)
   27df8:	441c                	lw	a5,8(s0)
   27dfa:	404c                	lw	a1,4(s0)
   27dfc:	013a04b3          	add	s1,s4,s3
   27e00:	0097d363          	bge	a5,s1,27e06 <__multiply+0x34>
   27e04:	0585                	add	a1,a1,1
   27e06:	c61ff0ef          	jal	27a66 <_Balloc>
   27e0a:	ed11                	bnez	a0,27e26 <__multiply+0x54>
   27e0c:	000296b7          	lui	a3,0x29
   27e10:	00029537          	lui	a0,0x29
   27e14:	65068693          	add	a3,a3,1616 # 29650 <__clz_tab+0x1f0>
   27e18:	4601                	li	a2,0
   27e1a:	15d00593          	li	a1,349
   27e1e:	6c850513          	add	a0,a0,1736 # 296c8 <__clz_tab+0x268>
   27e22:	2d8010ef          	jal	290fa <__assert_func>
   27e26:	01450693          	add	a3,a0,20
   27e2a:	00249813          	sll	a6,s1,0x2
   27e2e:	9836                	add	a6,a6,a3
   27e30:	87b6                	mv	a5,a3
   27e32:	0507ea63          	bltu	a5,a6,27e86 <__multiply+0xb4>
   27e36:	01440313          	add	t1,s0,20
   27e3a:	002a1613          	sll	a2,s4,0x2
   27e3e:	01490593          	add	a1,s2,20
   27e42:	00299893          	sll	a7,s3,0x2
   27e46:	961a                	add	a2,a2,t1
   27e48:	01540793          	add	a5,s0,21
   27e4c:	98ae                	add	a7,a7,a1
   27e4e:	4e11                	li	t3,4
   27e50:	00f66863          	bltu	a2,a5,27e60 <__multiply+0x8e>
   27e54:	40860433          	sub	s0,a2,s0
   27e58:	142d                	add	s0,s0,-21
   27e5a:	9871                	and	s0,s0,-4
   27e5c:	00440e13          	add	t3,s0,4
   27e60:	6ec1                	lui	t4,0x10
   27e62:	1efd                	add	t4,t4,-1 # ffff <__fw_size__+0x62ef>
   27e64:	0315e563          	bltu	a1,a7,27e8e <__multiply+0xbc>
   27e68:	00905663          	blez	s1,27e74 <__multiply+0xa2>
   27e6c:	ffc82783          	lw	a5,-4(a6)
   27e70:	1871                	add	a6,a6,-4
   27e72:	cfe1                	beqz	a5,27f4a <__multiply+0x178>
   27e74:	40f2                	lw	ra,28(sp)
   27e76:	4462                	lw	s0,24(sp)
   27e78:	c904                	sw	s1,16(a0)
   27e7a:	4942                	lw	s2,16(sp)
   27e7c:	44d2                	lw	s1,20(sp)
   27e7e:	49b2                	lw	s3,12(sp)
   27e80:	4a22                	lw	s4,8(sp)
   27e82:	6105                	add	sp,sp,32
   27e84:	8082                	ret
   27e86:	0007a023          	sw	zero,0(a5)
   27e8a:	0791                	add	a5,a5,4
   27e8c:	b75d                	j	27e32 <__multiply+0x60>
   27e8e:	0005af03          	lw	t5,0(a1)
   27e92:	01df7f33          	and	t5,t5,t4
   27e96:	040f0963          	beqz	t5,27ee8 <__multiply+0x116>
   27e9a:	82b6                	mv	t0,a3
   27e9c:	8f9a                	mv	t6,t1
   27e9e:	4401                	li	s0,0
   27ea0:	000fa783          	lw	a5,0(t6)
   27ea4:	0002a383          	lw	t2,0(t0)
   27ea8:	0f91                	add	t6,t6,4
   27eaa:	01d7f733          	and	a4,a5,t4
   27eae:	03e70733          	mul	a4,a4,t5
   27eb2:	83c1                	srl	a5,a5,0x10
   27eb4:	01d3f933          	and	s2,t2,t4
   27eb8:	0103d393          	srl	t2,t2,0x10
   27ebc:	0291                	add	t0,t0,4
   27ebe:	03e787b3          	mul	a5,a5,t5
   27ec2:	974a                	add	a4,a4,s2
   27ec4:	9722                	add	a4,a4,s0
   27ec6:	979e                	add	a5,a5,t2
   27ec8:	01075393          	srl	t2,a4,0x10
   27ecc:	979e                	add	a5,a5,t2
   27ece:	0107d413          	srl	s0,a5,0x10
   27ed2:	01d77733          	and	a4,a4,t4
   27ed6:	07c2                	sll	a5,a5,0x10
   27ed8:	8fd9                	or	a5,a5,a4
   27eda:	fef2ae23          	sw	a5,-4(t0)
   27ede:	fccfe1e3          	bltu	t6,a2,27ea0 <__multiply+0xce>
   27ee2:	01c687b3          	add	a5,a3,t3
   27ee6:	c380                	sw	s0,0(a5)
   27ee8:	0025d383          	lhu	t2,2(a1)
   27eec:	04038c63          	beqz	t2,27f44 <__multiply+0x172>
   27ef0:	429c                	lw	a5,0(a3)
   27ef2:	8f1a                	mv	t5,t1
   27ef4:	8fb6                	mv	t6,a3
   27ef6:	4281                	li	t0,0
   27ef8:	000f2703          	lw	a4,0(t5)
   27efc:	002fd403          	lhu	s0,2(t6)
   27f00:	01d7f7b3          	and	a5,a5,t4
   27f04:	01d77733          	and	a4,a4,t4
   27f08:	02770733          	mul	a4,a4,t2
   27f0c:	0f11                	add	t5,t5,4
   27f0e:	0f91                	add	t6,t6,4
   27f10:	9722                	add	a4,a4,s0
   27f12:	9716                	add	a4,a4,t0
   27f14:	01071293          	sll	t0,a4,0x10
   27f18:	00f2e7b3          	or	a5,t0,a5
   27f1c:	feffae23          	sw	a5,-4(t6)
   27f20:	ffef5783          	lhu	a5,-2(t5)
   27f24:	000fa283          	lw	t0,0(t6)
   27f28:	8341                	srl	a4,a4,0x10
   27f2a:	027787b3          	mul	a5,a5,t2
   27f2e:	01d2f2b3          	and	t0,t0,t4
   27f32:	9796                	add	a5,a5,t0
   27f34:	97ba                	add	a5,a5,a4
   27f36:	0107d293          	srl	t0,a5,0x10
   27f3a:	facf6fe3          	bltu	t5,a2,27ef8 <__multiply+0x126>
   27f3e:	01c68733          	add	a4,a3,t3
   27f42:	c31c                	sw	a5,0(a4)
   27f44:	0591                	add	a1,a1,4
   27f46:	0691                	add	a3,a3,4
   27f48:	bf31                	j	27e64 <__multiply+0x92>
   27f4a:	14fd                	add	s1,s1,-1
   27f4c:	bf31                	j	27e68 <__multiply+0x96>

00027f4e <__pow5mult>:
   27f4e:	1101                	add	sp,sp,-32
   27f50:	ca26                	sw	s1,20(sp)
   27f52:	c84a                	sw	s2,16(sp)
   27f54:	c64e                	sw	s3,12(sp)
   27f56:	ce06                	sw	ra,28(sp)
   27f58:	cc22                	sw	s0,24(sp)
   27f5a:	c452                	sw	s4,8(sp)
   27f5c:	00367793          	and	a5,a2,3
   27f60:	892a                	mv	s2,a0
   27f62:	84b2                	mv	s1,a2
   27f64:	89ae                	mv	s3,a1
   27f66:	cf89                	beqz	a5,27f80 <__pow5mult+0x32>
   27f68:	0002a737          	lui	a4,0x2a
   27f6c:	17fd                	add	a5,a5,-1
   27f6e:	b1070713          	add	a4,a4,-1264 # 29b10 <p05.0>
   27f72:	078a                	sll	a5,a5,0x2
   27f74:	97ba                	add	a5,a5,a4
   27f76:	4390                	lw	a2,0(a5)
   27f78:	4681                	li	a3,0
   27f7a:	bf7ff0ef          	jal	27b70 <__multadd>
   27f7e:	89aa                	mv	s3,a0
   27f80:	8489                	sra	s1,s1,0x2
   27f82:	c8d1                	beqz	s1,28016 <__pow5mult+0xc8>
   27f84:	02492783          	lw	a5,36(s2)
   27f88:	ef85                	bnez	a5,27fc0 <__pow5mult+0x72>
   27f8a:	4541                	li	a0,16
   27f8c:	a7dff0ef          	jal	27a08 <malloc>
   27f90:	02a92223          	sw	a0,36(s2)
   27f94:	ed11                	bnez	a0,27fb0 <__pow5mult+0x62>
   27f96:	000296b7          	lui	a3,0x29
   27f9a:	00029537          	lui	a0,0x29
   27f9e:	5ec68693          	add	a3,a3,1516 # 295ec <__clz_tab+0x18c>
   27fa2:	4601                	li	a2,0
   27fa4:	1ae00593          	li	a1,430
   27fa8:	6c850513          	add	a0,a0,1736 # 296c8 <__clz_tab+0x268>
   27fac:	14e010ef          	jal	290fa <__assert_func>
   27fb0:	00052223          	sw	zero,4(a0)
   27fb4:	00052423          	sw	zero,8(a0)
   27fb8:	00052023          	sw	zero,0(a0)
   27fbc:	00052623          	sw	zero,12(a0)
   27fc0:	02492a03          	lw	s4,36(s2)
   27fc4:	008a2403          	lw	s0,8(s4)
   27fc8:	e819                	bnez	s0,27fde <__pow5mult+0x90>
   27fca:	27100593          	li	a1,625
   27fce:	854a                	mv	a0,s2
   27fd0:	dcbff0ef          	jal	27d9a <__i2b>
   27fd4:	00aa2423          	sw	a0,8(s4)
   27fd8:	842a                	mv	s0,a0
   27fda:	00052023          	sw	zero,0(a0)
   27fde:	0014f793          	and	a5,s1,1
   27fe2:	cf81                	beqz	a5,27ffa <__pow5mult+0xac>
   27fe4:	85ce                	mv	a1,s3
   27fe6:	8622                	mv	a2,s0
   27fe8:	854a                	mv	a0,s2
   27fea:	de9ff0ef          	jal	27dd2 <__multiply>
   27fee:	8a2a                	mv	s4,a0
   27ff0:	85ce                	mv	a1,s3
   27ff2:	854a                	mv	a0,s2
   27ff4:	b1fff0ef          	jal	27b12 <_Bfree>
   27ff8:	89d2                	mv	s3,s4
   27ffa:	8485                	sra	s1,s1,0x1
   27ffc:	cc89                	beqz	s1,28016 <__pow5mult+0xc8>
   27ffe:	4008                	lw	a0,0(s0)
   28000:	e909                	bnez	a0,28012 <__pow5mult+0xc4>
   28002:	8622                	mv	a2,s0
   28004:	85a2                	mv	a1,s0
   28006:	854a                	mv	a0,s2
   28008:	dcbff0ef          	jal	27dd2 <__multiply>
   2800c:	c008                	sw	a0,0(s0)
   2800e:	00052023          	sw	zero,0(a0)
   28012:	842a                	mv	s0,a0
   28014:	b7e9                	j	27fde <__pow5mult+0x90>
   28016:	40f2                	lw	ra,28(sp)
   28018:	4462                	lw	s0,24(sp)
   2801a:	44d2                	lw	s1,20(sp)
   2801c:	4942                	lw	s2,16(sp)
   2801e:	4a22                	lw	s4,8(sp)
   28020:	854e                	mv	a0,s3
   28022:	49b2                	lw	s3,12(sp)
   28024:	6105                	add	sp,sp,32
   28026:	8082                	ret

00028028 <__lshift>:
   28028:	1101                	add	sp,sp,-32
   2802a:	ca26                	sw	s1,20(sp)
   2802c:	84ae                	mv	s1,a1
   2802e:	c05a                	sw	s6,0(sp)
   28030:	0104ab03          	lw	s6,16(s1)
   28034:	c84a                	sw	s2,16(sp)
   28036:	41cc                	lw	a1,4(a1)
   28038:	40565913          	sra	s2,a2,0x5
   2803c:	449c                	lw	a5,8(s1)
   2803e:	9b4a                	add	s6,s6,s2
   28040:	cc22                	sw	s0,24(sp)
   28042:	c64e                	sw	s3,12(sp)
   28044:	c256                	sw	s5,4(sp)
   28046:	ce06                	sw	ra,28(sp)
   28048:	c452                	sw	s4,8(sp)
   2804a:	842a                	mv	s0,a0
   2804c:	89b2                	mv	s3,a2
   2804e:	001b0a93          	add	s5,s6,1
   28052:	0357c463          	blt	a5,s5,2807a <__lshift+0x52>
   28056:	8522                	mv	a0,s0
   28058:	a0fff0ef          	jal	27a66 <_Balloc>
   2805c:	8a2a                	mv	s4,a0
   2805e:	e10d                	bnez	a0,28080 <__lshift+0x58>
   28060:	000296b7          	lui	a3,0x29
   28064:	00029537          	lui	a0,0x29
   28068:	65068693          	add	a3,a3,1616 # 29650 <__clz_tab+0x1f0>
   2806c:	4601                	li	a2,0
   2806e:	1d900593          	li	a1,473
   28072:	6c850513          	add	a0,a0,1736 # 296c8 <__clz_tab+0x268>
   28076:	084010ef          	jal	290fa <__assert_func>
   2807a:	0585                	add	a1,a1,1
   2807c:	0786                	sll	a5,a5,0x1
   2807e:	bfd1                	j	28052 <__lshift+0x2a>
   28080:	01450693          	add	a3,a0,20
   28084:	8736                	mv	a4,a3
   28086:	4781                	li	a5,0
   28088:	0927c363          	blt	a5,s2,2810e <__lshift+0xe6>
   2808c:	00095363          	bgez	s2,28092 <__lshift+0x6a>
   28090:	4901                	li	s2,0
   28092:	4898                	lw	a4,16(s1)
   28094:	090a                	sll	s2,s2,0x2
   28096:	01448793          	add	a5,s1,20
   2809a:	070a                	sll	a4,a4,0x2
   2809c:	01f9f613          	and	a2,s3,31
   280a0:	96ca                	add	a3,a3,s2
   280a2:	973e                	add	a4,a4,a5
   280a4:	ca35                	beqz	a2,28118 <__lshift+0xf0>
   280a6:	02000893          	li	a7,32
   280aa:	40c888b3          	sub	a7,a7,a2
   280ae:	8836                	mv	a6,a3
   280b0:	4581                	li	a1,0
   280b2:	4388                	lw	a0,0(a5)
   280b4:	0811                	add	a6,a6,4
   280b6:	00c51533          	sll	a0,a0,a2
   280ba:	8dc9                	or	a1,a1,a0
   280bc:	feb82e23          	sw	a1,-4(a6)
   280c0:	438c                	lw	a1,0(a5)
   280c2:	0791                	add	a5,a5,4
   280c4:	0115d5b3          	srl	a1,a1,a7
   280c8:	fee7e5e3          	bltu	a5,a4,280b2 <__lshift+0x8a>
   280cc:	01548793          	add	a5,s1,21
   280d0:	4611                	li	a2,4
   280d2:	00f76763          	bltu	a4,a5,280e0 <__lshift+0xb8>
   280d6:	8f05                	sub	a4,a4,s1
   280d8:	172d                	add	a4,a4,-21
   280da:	9b71                	and	a4,a4,-4
   280dc:	00470613          	add	a2,a4,4
   280e0:	96b2                	add	a3,a3,a2
   280e2:	c28c                	sw	a1,0(a3)
   280e4:	c199                	beqz	a1,280ea <__lshift+0xc2>
   280e6:	002b0a93          	add	s5,s6,2
   280ea:	1afd                	add	s5,s5,-1
   280ec:	015a2823          	sw	s5,16(s4)
   280f0:	8522                	mv	a0,s0
   280f2:	85a6                	mv	a1,s1
   280f4:	a1fff0ef          	jal	27b12 <_Bfree>
   280f8:	40f2                	lw	ra,28(sp)
   280fa:	4462                	lw	s0,24(sp)
   280fc:	44d2                	lw	s1,20(sp)
   280fe:	4942                	lw	s2,16(sp)
   28100:	49b2                	lw	s3,12(sp)
   28102:	4a92                	lw	s5,4(sp)
   28104:	4b02                	lw	s6,0(sp)
   28106:	8552                	mv	a0,s4
   28108:	4a22                	lw	s4,8(sp)
   2810a:	6105                	add	sp,sp,32
   2810c:	8082                	ret
   2810e:	00072023          	sw	zero,0(a4)
   28112:	0785                	add	a5,a5,1
   28114:	0711                	add	a4,a4,4
   28116:	bf8d                	j	28088 <__lshift+0x60>
   28118:	4390                	lw	a2,0(a5)
   2811a:	0791                	add	a5,a5,4
   2811c:	c290                	sw	a2,0(a3)
   2811e:	0691                	add	a3,a3,4
   28120:	fee7ece3          	bltu	a5,a4,28118 <__lshift+0xf0>
   28124:	b7d9                	j	280ea <__lshift+0xc2>

00028126 <__mcmp>:
   28126:	4914                	lw	a3,16(a0)
   28128:	4998                	lw	a4,16(a1)
   2812a:	87aa                	mv	a5,a0
   2812c:	40e68533          	sub	a0,a3,a4
   28130:	02e69563          	bne	a3,a4,2815a <__mcmp+0x34>
   28134:	070a                	sll	a4,a4,0x2
   28136:	07d1                	add	a5,a5,20
   28138:	05d1                	add	a1,a1,20
   2813a:	00e786b3          	add	a3,a5,a4
   2813e:	95ba                	add	a1,a1,a4
   28140:	16f1                	add	a3,a3,-4
   28142:	15f1                	add	a1,a1,-4
   28144:	4290                	lw	a2,0(a3)
   28146:	4198                	lw	a4,0(a1)
   28148:	00e60763          	beq	a2,a4,28156 <__mcmp+0x30>
   2814c:	4505                	li	a0,1
   2814e:	00e67663          	bgeu	a2,a4,2815a <__mcmp+0x34>
   28152:	557d                	li	a0,-1
   28154:	8082                	ret
   28156:	fed7e5e3          	bltu	a5,a3,28140 <__mcmp+0x1a>
   2815a:	8082                	ret

0002815c <__mdiff>:
   2815c:	1101                	add	sp,sp,-32
   2815e:	ca26                	sw	s1,20(sp)
   28160:	84ae                	mv	s1,a1
   28162:	c84a                	sw	s2,16(sp)
   28164:	85b2                	mv	a1,a2
   28166:	892a                	mv	s2,a0
   28168:	8526                	mv	a0,s1
   2816a:	cc22                	sw	s0,24(sp)
   2816c:	ce06                	sw	ra,28(sp)
   2816e:	c64e                	sw	s3,12(sp)
   28170:	8432                	mv	s0,a2
   28172:	3f55                	jal	28126 <__mcmp>
   28174:	ed15                	bnez	a0,281b0 <__mdiff+0x54>
   28176:	4581                	li	a1,0
   28178:	854a                	mv	a0,s2
   2817a:	8edff0ef          	jal	27a66 <_Balloc>
   2817e:	ed11                	bnez	a0,2819a <__mdiff+0x3e>
   28180:	000296b7          	lui	a3,0x29
   28184:	65068693          	add	a3,a3,1616 # 29650 <__clz_tab+0x1f0>
   28188:	4601                	li	a2,0
   2818a:	23200593          	li	a1,562
   2818e:	00029537          	lui	a0,0x29
   28192:	6c850513          	add	a0,a0,1736 # 296c8 <__clz_tab+0x268>
   28196:	765000ef          	jal	290fa <__assert_func>
   2819a:	4785                	li	a5,1
   2819c:	c91c                	sw	a5,16(a0)
   2819e:	00052a23          	sw	zero,20(a0)
   281a2:	40f2                	lw	ra,28(sp)
   281a4:	4462                	lw	s0,24(sp)
   281a6:	44d2                	lw	s1,20(sp)
   281a8:	4942                	lw	s2,16(sp)
   281aa:	49b2                	lw	s3,12(sp)
   281ac:	6105                	add	sp,sp,32
   281ae:	8082                	ret
   281b0:	4981                	li	s3,0
   281b2:	00055663          	bgez	a0,281be <__mdiff+0x62>
   281b6:	87a6                	mv	a5,s1
   281b8:	4985                	li	s3,1
   281ba:	84a2                	mv	s1,s0
   281bc:	843e                	mv	s0,a5
   281be:	40cc                	lw	a1,4(s1)
   281c0:	854a                	mv	a0,s2
   281c2:	8a5ff0ef          	jal	27a66 <_Balloc>
   281c6:	e909                	bnez	a0,281d8 <__mdiff+0x7c>
   281c8:	000296b7          	lui	a3,0x29
   281cc:	65068693          	add	a3,a3,1616 # 29650 <__clz_tab+0x1f0>
   281d0:	4601                	li	a2,0
   281d2:	24000593          	li	a1,576
   281d6:	bf65                	j	2818e <__mdiff+0x32>
   281d8:	0104a803          	lw	a6,16(s1)
   281dc:	4818                	lw	a4,16(s0)
   281de:	01448893          	add	a7,s1,20
   281e2:	00281613          	sll	a2,a6,0x2
   281e6:	01440793          	add	a5,s0,20
   281ea:	070a                	sll	a4,a4,0x2
   281ec:	6ec1                	lui	t4,0x10
   281ee:	01352623          	sw	s3,12(a0)
   281f2:	9646                	add	a2,a2,a7
   281f4:	97ba                	add	a5,a5,a4
   281f6:	01450593          	add	a1,a0,20
   281fa:	4e51                	li	t3,20
   281fc:	4301                	li	t1,0
   281fe:	1efd                	add	t4,t4,-1 # ffff <__fw_size__+0x62ef>
   28200:	01c406b3          	add	a3,s0,t3
   28204:	01c48733          	add	a4,s1,t3
   28208:	0006af03          	lw	t5,0(a3)
   2820c:	4318                	lw	a4,0(a4)
   2820e:	01df7fb3          	and	t6,t5,t4
   28212:	01d776b3          	and	a3,a4,t4
   28216:	41f686b3          	sub	a3,a3,t6
   2821a:	969a                	add	a3,a3,t1
   2821c:	010f5f13          	srl	t5,t5,0x10
   28220:	8341                	srl	a4,a4,0x10
   28222:	4106d313          	sra	t1,a3,0x10
   28226:	41e70733          	sub	a4,a4,t5
   2822a:	971a                	add	a4,a4,t1
   2822c:	41075313          	sra	t1,a4,0x10
   28230:	01d6f6b3          	and	a3,a3,t4
   28234:	0742                	sll	a4,a4,0x10
   28236:	01c50f33          	add	t5,a0,t3
   2823a:	8ed9                	or	a3,a3,a4
   2823c:	0e11                	add	t3,t3,4
   2823e:	00df2023          	sw	a3,0(t5)
   28242:	008e0733          	add	a4,t3,s0
   28246:	faf76de3          	bltu	a4,a5,28200 <__mdiff+0xa4>
   2824a:	01540693          	add	a3,s0,21
   2824e:	4711                	li	a4,4
   28250:	00d7e763          	bltu	a5,a3,2825e <__mdiff+0x102>
   28254:	8f81                	sub	a5,a5,s0
   28256:	17ad                	add	a5,a5,-21
   28258:	9bf1                	and	a5,a5,-4
   2825a:	00478713          	add	a4,a5,4
   2825e:	00e586b3          	add	a3,a1,a4
   28262:	98ba                	add	a7,a7,a4
   28264:	6e41                	lui	t3,0x10
   28266:	8eb6                	mv	t4,a3
   28268:	85c6                	mv	a1,a7
   2826a:	1e7d                	add	t3,t3,-1 # ffff <__fw_size__+0x62ef>
   2826c:	02c5e463          	bltu	a1,a2,28294 <__mdiff+0x138>
   28270:	ffd88793          	add	a5,a7,-3 # fcbffffd <__share_mem_end__+0xfbb3fffd>
   28274:	4701                	li	a4,0
   28276:	00f66763          	bltu	a2,a5,28284 <__mdiff+0x128>
   2827a:	060d                	add	a2,a2,3
   2827c:	41160633          	sub	a2,a2,a7
   28280:	ffc67713          	and	a4,a2,-4
   28284:	00e687b3          	add	a5,a3,a4
   28288:	17f1                	add	a5,a5,-4
   2828a:	4398                	lw	a4,0(a5)
   2828c:	cb0d                	beqz	a4,282be <__mdiff+0x162>
   2828e:	01052823          	sw	a6,16(a0)
   28292:	bf01                	j	281a2 <__mdiff+0x46>
   28294:	4198                	lw	a4,0(a1)
   28296:	8f1a                	mv	t5,t1
   28298:	0591                	add	a1,a1,4
   2829a:	01c777b3          	and	a5,a4,t3
   2829e:	979a                	add	a5,a5,t1
   282a0:	87c1                	sra	a5,a5,0x10
   282a2:	01075313          	srl	t1,a4,0x10
   282a6:	979a                	add	a5,a5,t1
   282a8:	977a                	add	a4,a4,t5
   282aa:	4107d313          	sra	t1,a5,0x10
   282ae:	01c77733          	and	a4,a4,t3
   282b2:	07c2                	sll	a5,a5,0x10
   282b4:	8f5d                	or	a4,a4,a5
   282b6:	00eea023          	sw	a4,0(t4)
   282ba:	0e91                	add	t4,t4,4
   282bc:	bf45                	j	2826c <__mdiff+0x110>
   282be:	187d                	add	a6,a6,-1
   282c0:	b7e1                	j	28288 <__mdiff+0x12c>

000282c2 <__ulp>:
   282c2:	7ff007b7          	lui	a5,0x7ff00
   282c6:	8dfd                	and	a1,a1,a5
   282c8:	fcc007b7          	lui	a5,0xfcc00
   282cc:	95be                	add	a1,a1,a5
   282ce:	00b04d63          	bgtz	a1,282e8 <__ulp+0x26>
   282d2:	40b005b3          	neg	a1,a1
   282d6:	4145d793          	sra	a5,a1,0x14
   282da:	474d                	li	a4,19
   282dc:	00f74863          	blt	a4,a5,282ec <__ulp+0x2a>
   282e0:	000805b7          	lui	a1,0x80
   282e4:	40f5d5b3          	sra	a1,a1,a5
   282e8:	4781                	li	a5,0
   282ea:	a821                	j	28302 <__ulp+0x40>
   282ec:	fec78713          	add	a4,a5,-20 # fcbfffec <__share_mem_end__+0xfbb3ffec>
   282f0:	46f9                	li	a3,30
   282f2:	4785                	li	a5,1
   282f4:	00e6c663          	blt	a3,a4,28300 <__ulp+0x3e>
   282f8:	800007b7          	lui	a5,0x80000
   282fc:	00e7d7b3          	srl	a5,a5,a4
   28300:	4581                	li	a1,0
   28302:	853e                	mv	a0,a5
   28304:	8082                	ret

00028306 <__b2d>:
   28306:	1101                	add	sp,sp,-32
   28308:	ca26                	sw	s1,20(sp)
   2830a:	4904                	lw	s1,16(a0)
   2830c:	c64e                	sw	s3,12(sp)
   2830e:	01450993          	add	s3,a0,20
   28312:	048a                	sll	s1,s1,0x2
   28314:	94ce                	add	s1,s1,s3
   28316:	cc22                	sw	s0,24(sp)
   28318:	ffc4a403          	lw	s0,-4(s1)
   2831c:	c84a                	sw	s2,16(sp)
   2831e:	c452                	sw	s4,8(sp)
   28320:	8522                	mv	a0,s0
   28322:	8a2e                	mv	s4,a1
   28324:	ce06                	sw	ra,28(sp)
   28326:	9c5ff0ef          	jal	27cea <__hi0bits>
   2832a:	02000793          	li	a5,32
   2832e:	8f89                	sub	a5,a5,a0
   28330:	00fa2023          	sw	a5,0(s4)
   28334:	47a9                	li	a5,10
   28336:	ffc48913          	add	s2,s1,-4
   2833a:	02a7ce63          	blt	a5,a0,28376 <__b2d+0x70>
   2833e:	46ad                	li	a3,11
   28340:	8e89                	sub	a3,a3,a0
   28342:	3ff007b7          	lui	a5,0x3ff00
   28346:	00d45733          	srl	a4,s0,a3
   2834a:	8f5d                	or	a4,a4,a5
   2834c:	4781                	li	a5,0
   2834e:	0129f463          	bgeu	s3,s2,28356 <__b2d+0x50>
   28352:	ff84a783          	lw	a5,-8(s1)
   28356:	0555                	add	a0,a0,21
   28358:	00a41433          	sll	s0,s0,a0
   2835c:	00d7d7b3          	srl	a5,a5,a3
   28360:	8fc1                	or	a5,a5,s0
   28362:	40f2                	lw	ra,28(sp)
   28364:	4462                	lw	s0,24(sp)
   28366:	44d2                	lw	s1,20(sp)
   28368:	4942                	lw	s2,16(sp)
   2836a:	49b2                	lw	s3,12(sp)
   2836c:	4a22                	lw	s4,8(sp)
   2836e:	853e                	mv	a0,a5
   28370:	85ba                	mv	a1,a4
   28372:	6105                	add	sp,sp,32
   28374:	8082                	ret
   28376:	4781                	li	a5,0
   28378:	0129f663          	bgeu	s3,s2,28384 <__b2d+0x7e>
   2837c:	ff84a783          	lw	a5,-8(s1)
   28380:	ff848913          	add	s2,s1,-8
   28384:	1555                	add	a0,a0,-11
   28386:	c51d                	beqz	a0,283b4 <__b2d+0xae>
   28388:	02000613          	li	a2,32
   2838c:	8e09                	sub	a2,a2,a0
   2838e:	00c7d733          	srl	a4,a5,a2
   28392:	00a41433          	sll	s0,s0,a0
   28396:	8c59                	or	s0,s0,a4
   28398:	3ff00737          	lui	a4,0x3ff00
   2839c:	8f41                	or	a4,a4,s0
   2839e:	4681                	li	a3,0
   283a0:	0129f463          	bgeu	s3,s2,283a8 <__b2d+0xa2>
   283a4:	ffc92683          	lw	a3,-4(s2)
   283a8:	00a797b3          	sll	a5,a5,a0
   283ac:	00c6d6b3          	srl	a3,a3,a2
   283b0:	8fd5                	or	a5,a5,a3
   283b2:	bf45                	j	28362 <__b2d+0x5c>
   283b4:	3ff00737          	lui	a4,0x3ff00
   283b8:	8f41                	or	a4,a4,s0
   283ba:	b765                	j	28362 <__b2d+0x5c>

000283bc <__d2b>:
   283bc:	7179                	add	sp,sp,-48
   283be:	d422                	sw	s0,40(sp)
   283c0:	842e                	mv	s0,a1
   283c2:	4585                	li	a1,1
   283c4:	d226                	sw	s1,36(sp)
   283c6:	d04a                	sw	s2,32(sp)
   283c8:	ce4e                	sw	s3,28(sp)
   283ca:	d606                	sw	ra,44(sp)
   283cc:	cc52                	sw	s4,24(sp)
   283ce:	84b2                	mv	s1,a2
   283d0:	89b6                	mv	s3,a3
   283d2:	893a                	mv	s2,a4
   283d4:	e92ff0ef          	jal	27a66 <_Balloc>
   283d8:	ed11                	bnez	a0,283f4 <__d2b+0x38>
   283da:	000296b7          	lui	a3,0x29
   283de:	00029537          	lui	a0,0x29
   283e2:	65068693          	add	a3,a3,1616 # 29650 <__clz_tab+0x1f0>
   283e6:	4601                	li	a2,0
   283e8:	30a00593          	li	a1,778
   283ec:	6c850513          	add	a0,a0,1736 # 296c8 <__clz_tab+0x268>
   283f0:	50b000ef          	jal	290fa <__assert_func>
   283f4:	00100737          	lui	a4,0x100
   283f8:	fff70793          	add	a5,a4,-1 # fffff <__noncacheable_end__+0x3ffff>
   283fc:	8fe5                	and	a5,a5,s1
   283fe:	80d1                	srl	s1,s1,0x14
   28400:	7ff4f493          	and	s1,s1,2047
   28404:	8a2a                	mv	s4,a0
   28406:	c091                	beqz	s1,2840a <__d2b+0x4e>
   28408:	8fd9                	or	a5,a5,a4
   2840a:	c63e                	sw	a5,12(sp)
   2840c:	c035                	beqz	s0,28470 <__d2b+0xb4>
   2840e:	0028                	add	a0,sp,8
   28410:	c422                	sw	s0,8(sp)
   28412:	91fff0ef          	jal	27d30 <__lo0bits>
   28416:	4732                	lw	a4,12(sp)
   28418:	46a2                	lw	a3,8(sp)
   2841a:	c921                	beqz	a0,2846a <__d2b+0xae>
   2841c:	02000793          	li	a5,32
   28420:	8f89                	sub	a5,a5,a0
   28422:	00f717b3          	sll	a5,a4,a5
   28426:	8fd5                	or	a5,a5,a3
   28428:	00a75733          	srl	a4,a4,a0
   2842c:	00fa2a23          	sw	a5,20(s4)
   28430:	c63a                	sw	a4,12(sp)
   28432:	4432                	lw	s0,12(sp)
   28434:	008a2c23          	sw	s0,24(s4)
   28438:	00803433          	snez	s0,s0
   2843c:	0405                	add	s0,s0,1
   2843e:	008a2823          	sw	s0,16(s4)
   28442:	c0a9                	beqz	s1,28484 <__d2b+0xc8>
   28444:	bcd48493          	add	s1,s1,-1075
   28448:	94aa                	add	s1,s1,a0
   2844a:	0099a023          	sw	s1,0(s3)
   2844e:	03500413          	li	s0,53
   28452:	8c09                	sub	s0,s0,a0
   28454:	00892023          	sw	s0,0(s2)
   28458:	50b2                	lw	ra,44(sp)
   2845a:	5422                	lw	s0,40(sp)
   2845c:	5492                	lw	s1,36(sp)
   2845e:	5902                	lw	s2,32(sp)
   28460:	49f2                	lw	s3,28(sp)
   28462:	8552                	mv	a0,s4
   28464:	4a62                	lw	s4,24(sp)
   28466:	6145                	add	sp,sp,48
   28468:	8082                	ret
   2846a:	00da2a23          	sw	a3,20(s4)
   2846e:	b7d1                	j	28432 <__d2b+0x76>
   28470:	0068                	add	a0,sp,12
   28472:	8bfff0ef          	jal	27d30 <__lo0bits>
   28476:	47b2                	lw	a5,12(sp)
   28478:	02050513          	add	a0,a0,32
   2847c:	4405                	li	s0,1
   2847e:	00fa2a23          	sw	a5,20(s4)
   28482:	bf75                	j	2843e <__d2b+0x82>
   28484:	bce50793          	add	a5,a0,-1074
   28488:	00f9a023          	sw	a5,0(s3)
   2848c:	00241793          	sll	a5,s0,0x2
   28490:	97d2                	add	a5,a5,s4
   28492:	4b88                	lw	a0,16(a5)
   28494:	0416                	sll	s0,s0,0x5
   28496:	855ff0ef          	jal	27cea <__hi0bits>
   2849a:	bf65                	j	28452 <__d2b+0x96>

0002849c <__ratio>:
   2849c:	7179                	add	sp,sp,-48
   2849e:	d226                	sw	s1,36(sp)
   284a0:	84ae                	mv	s1,a1
   284a2:	002c                	add	a1,sp,8
   284a4:	d606                	sw	ra,44(sp)
   284a6:	d422                	sw	s0,40(sp)
   284a8:	d04a                	sw	s2,32(sp)
   284aa:	ce4e                	sw	s3,28(sp)
   284ac:	cc52                	sw	s4,24(sp)
   284ae:	89aa                	mv	s3,a0
   284b0:	e57ff0ef          	jal	28306 <__b2d>
   284b4:	892a                	mv	s2,a0
   284b6:	842e                	mv	s0,a1
   284b8:	8a2e                	mv	s4,a1
   284ba:	8526                	mv	a0,s1
   284bc:	006c                	add	a1,sp,12
   284be:	e49ff0ef          	jal	28306 <__b2d>
   284c2:	4894                	lw	a3,16(s1)
   284c4:	0109a783          	lw	a5,16(s3)
   284c8:	872e                	mv	a4,a1
   284ca:	862e                	mv	a2,a1
   284cc:	8f95                	sub	a5,a5,a3
   284ce:	45b2                	lw	a1,12(sp)
   284d0:	46a2                	lw	a3,8(sp)
   284d2:	0796                	sll	a5,a5,0x5
   284d4:	8e8d                	sub	a3,a3,a1
   284d6:	97b6                	add	a5,a5,a3
   284d8:	02f05463          	blez	a5,28500 <__ratio+0x64>
   284dc:	07d2                	sll	a5,a5,0x14
   284de:	00878a33          	add	s4,a5,s0
   284e2:	87b2                	mv	a5,a2
   284e4:	85d2                	mv	a1,s4
   284e6:	862a                	mv	a2,a0
   284e8:	86be                	mv	a3,a5
   284ea:	854a                	mv	a0,s2
   284ec:	feaf80ef          	jal	20cd6 <__divdf3>
   284f0:	50b2                	lw	ra,44(sp)
   284f2:	5422                	lw	s0,40(sp)
   284f4:	5492                	lw	s1,36(sp)
   284f6:	5902                	lw	s2,32(sp)
   284f8:	49f2                	lw	s3,28(sp)
   284fa:	4a62                	lw	s4,24(sp)
   284fc:	6145                	add	sp,sp,48
   284fe:	8082                	ret
   28500:	fff006b7          	lui	a3,0xfff00
   28504:	02d787b3          	mul	a5,a5,a3
   28508:	00e78633          	add	a2,a5,a4
   2850c:	bfd9                	j	284e2 <__ratio+0x46>

0002850e <__copybits>:
   2850e:	fff58793          	add	a5,a1,-1 # 7ffff <__fast_load_addr__+0x5613f>
   28512:	4a18                	lw	a4,16(a2)
   28514:	8795                	sra	a5,a5,0x5
   28516:	0785                	add	a5,a5,1 # 3ff00001 <__share_mem_end__+0x3ee40001>
   28518:	078a                	sll	a5,a5,0x2
   2851a:	01460693          	add	a3,a2,20
   2851e:	070a                	sll	a4,a4,0x2
   28520:	97aa                	add	a5,a5,a0
   28522:	9736                	add	a4,a4,a3
   28524:	85aa                	mv	a1,a0
   28526:	00e6ef63          	bltu	a3,a4,28544 <__copybits+0x36>
   2852a:	01160693          	add	a3,a2,17
   2852e:	4581                	li	a1,0
   28530:	00d76663          	bltu	a4,a3,2853c <__copybits+0x2e>
   28534:	8f11                	sub	a4,a4,a2
   28536:	173d                	add	a4,a4,-17
   28538:	ffc77593          	and	a1,a4,-4
   2853c:	952e                	add	a0,a0,a1
   2853e:	00f56a63          	bltu	a0,a5,28552 <__copybits+0x44>
   28542:	8082                	ret
   28544:	0006a803          	lw	a6,0(a3) # fff00000 <__share_mem_end__+0xfee40000>
   28548:	0691                	add	a3,a3,4
   2854a:	0105a023          	sw	a6,0(a1)
   2854e:	0591                	add	a1,a1,4
   28550:	bfd9                	j	28526 <__copybits+0x18>
   28552:	00052023          	sw	zero,0(a0)
   28556:	0511                	add	a0,a0,4
   28558:	b7dd                	j	2853e <__copybits+0x30>

0002855a <__any_on>:
   2855a:	4914                	lw	a3,16(a0)
   2855c:	4055d793          	sra	a5,a1,0x5
   28560:	01450713          	add	a4,a0,20
   28564:	02f6c763          	blt	a3,a5,28592 <__any_on+0x38>
   28568:	00d7df63          	bge	a5,a3,28586 <__any_on+0x2c>
   2856c:	89fd                	and	a1,a1,31
   2856e:	cd81                	beqz	a1,28586 <__any_on+0x2c>
   28570:	00279693          	sll	a3,a5,0x2
   28574:	96ba                	add	a3,a3,a4
   28576:	4290                	lw	a2,0(a3)
   28578:	4505                	li	a0,1
   2857a:	00b656b3          	srl	a3,a2,a1
   2857e:	00b696b3          	sll	a3,a3,a1
   28582:	00d61e63          	bne	a2,a3,2859e <__any_on+0x44>
   28586:	078a                	sll	a5,a5,0x2
   28588:	97ba                	add	a5,a5,a4
   2858a:	00f76663          	bltu	a4,a5,28596 <__any_on+0x3c>
   2858e:	4501                	li	a0,0
   28590:	8082                	ret
   28592:	87b6                	mv	a5,a3
   28594:	bfcd                	j	28586 <__any_on+0x2c>
   28596:	17f1                	add	a5,a5,-4
   28598:	4394                	lw	a3,0(a5)
   2859a:	dae5                	beqz	a3,2858a <__any_on+0x30>
   2859c:	4505                	li	a0,1
   2859e:	8082                	ret

000285a0 <_calloc_r>:
   285a0:	02c5b733          	mulhu	a4,a1,a2
   285a4:	1101                	add	sp,sp,-32
   285a6:	ce06                	sw	ra,28(sp)
   285a8:	cc22                	sw	s0,24(sp)
   285aa:	02c58633          	mul	a2,a1,a2
   285ae:	cb09                	beqz	a4,285c0 <_calloc_r+0x20>
   285b0:	4731                	li	a4,12
   285b2:	c118                	sw	a4,0(a0)
   285b4:	4401                	li	s0,0
   285b6:	40f2                	lw	ra,28(sp)
   285b8:	8522                	mv	a0,s0
   285ba:	4462                	lw	s0,24(sp)
   285bc:	6105                	add	sp,sp,32
   285be:	8082                	ret
   285c0:	85b2                	mv	a1,a2
   285c2:	c632                	sw	a2,12(sp)
   285c4:	284d                	jal	28676 <_malloc_r>
   285c6:	842a                	mv	s0,a0
   285c8:	d57d                	beqz	a0,285b6 <_calloc_r+0x16>
   285ca:	4632                	lw	a2,12(sp)
   285cc:	4581                	li	a1,0
   285ce:	feaf90ef          	jal	21db8 <memset>
   285d2:	b7d5                	j	285b6 <_calloc_r+0x16>

000285d4 <_free_r>:
   285d4:	c1c5                	beqz	a1,28674 <_free_r+0xa0>
   285d6:	ffc5a783          	lw	a5,-4(a1)
   285da:	1101                	add	sp,sp,-32
   285dc:	cc22                	sw	s0,24(sp)
   285de:	ce06                	sw	ra,28(sp)
   285e0:	ffc58413          	add	s0,a1,-4
   285e4:	0007d363          	bgez	a5,285ea <_free_r+0x16>
   285e8:	943e                	add	s0,s0,a5
   285ea:	c62a                	sw	a0,12(sp)
   285ec:	41f000ef          	jal	2920a <__malloc_lock>
   285f0:	9ec1a783          	lw	a5,-1556(gp) # a01ec <__malloc_free_list>
   285f4:	4532                	lw	a0,12(sp)
   285f6:	eb91                	bnez	a5,2860a <_free_r+0x36>
   285f8:	00042223          	sw	zero,4(s0)
   285fc:	9e81a623          	sw	s0,-1556(gp) # a01ec <__malloc_free_list>
   28600:	4462                	lw	s0,24(sp)
   28602:	40f2                	lw	ra,28(sp)
   28604:	6105                	add	sp,sp,32
   28606:	4070006f          	j	2920c <__malloc_unlock>
   2860a:	00f47d63          	bgeu	s0,a5,28624 <_free_r+0x50>
   2860e:	4010                	lw	a2,0(s0)
   28610:	00c406b3          	add	a3,s0,a2
   28614:	00d79663          	bne	a5,a3,28620 <_free_r+0x4c>
   28618:	4394                	lw	a3,0(a5)
   2861a:	43dc                	lw	a5,4(a5)
   2861c:	96b2                	add	a3,a3,a2
   2861e:	c014                	sw	a3,0(s0)
   28620:	c05c                	sw	a5,4(s0)
   28622:	bfe9                	j	285fc <_free_r+0x28>
   28624:	873e                	mv	a4,a5
   28626:	43dc                	lw	a5,4(a5)
   28628:	c399                	beqz	a5,2862e <_free_r+0x5a>
   2862a:	fef47de3          	bgeu	s0,a5,28624 <_free_r+0x50>
   2862e:	4314                	lw	a3,0(a4)
   28630:	00d70633          	add	a2,a4,a3
   28634:	00861f63          	bne	a2,s0,28652 <_free_r+0x7e>
   28638:	4010                	lw	a2,0(s0)
   2863a:	96b2                	add	a3,a3,a2
   2863c:	c314                	sw	a3,0(a4)
   2863e:	00d70633          	add	a2,a4,a3
   28642:	fac79fe3          	bne	a5,a2,28600 <_free_r+0x2c>
   28646:	4390                	lw	a2,0(a5)
   28648:	43dc                	lw	a5,4(a5)
   2864a:	96b2                	add	a3,a3,a2
   2864c:	c314                	sw	a3,0(a4)
   2864e:	c35c                	sw	a5,4(a4)
   28650:	bf45                	j	28600 <_free_r+0x2c>
   28652:	00c47563          	bgeu	s0,a2,2865c <_free_r+0x88>
   28656:	47b1                	li	a5,12
   28658:	c11c                	sw	a5,0(a0)
   2865a:	b75d                	j	28600 <_free_r+0x2c>
   2865c:	4010                	lw	a2,0(s0)
   2865e:	00c406b3          	add	a3,s0,a2
   28662:	00d79663          	bne	a5,a3,2866e <_free_r+0x9a>
   28666:	4394                	lw	a3,0(a5)
   28668:	43dc                	lw	a5,4(a5)
   2866a:	96b2                	add	a3,a3,a2
   2866c:	c014                	sw	a3,0(s0)
   2866e:	c05c                	sw	a5,4(s0)
   28670:	c340                	sw	s0,4(a4)
   28672:	b779                	j	28600 <_free_r+0x2c>
   28674:	8082                	ret

00028676 <_malloc_r>:
   28676:	1101                	add	sp,sp,-32
   28678:	ca26                	sw	s1,20(sp)
   2867a:	00358493          	add	s1,a1,3
   2867e:	98f1                	and	s1,s1,-4
   28680:	c84a                	sw	s2,16(sp)
   28682:	ce06                	sw	ra,28(sp)
   28684:	cc22                	sw	s0,24(sp)
   28686:	c64e                	sw	s3,12(sp)
   28688:	04a1                	add	s1,s1,8
   2868a:	47b1                	li	a5,12
   2868c:	892a                	mv	s2,a0
   2868e:	04f4f163          	bgeu	s1,a5,286d0 <_malloc_r+0x5a>
   28692:	44b1                	li	s1,12
   28694:	04b4e063          	bltu	s1,a1,286d4 <_malloc_r+0x5e>
   28698:	854a                	mv	a0,s2
   2869a:	371000ef          	jal	2920a <__malloc_lock>
   2869e:	9ec1a703          	lw	a4,-1556(gp) # a01ec <__malloc_free_list>
   286a2:	843a                	mv	s0,a4
   286a4:	e039                	bnez	s0,286ea <_malloc_r+0x74>
   286a6:	9e81a783          	lw	a5,-1560(gp) # a01e8 <__malloc_sbrk_start>
   286aa:	e791                	bnez	a5,286b6 <_malloc_r+0x40>
   286ac:	4581                	li	a1,0
   286ae:	854a                	mv	a0,s2
   286b0:	2f11                	jal	28dc4 <_sbrk_r>
   286b2:	9ea1a423          	sw	a0,-1560(gp) # a01e8 <__malloc_sbrk_start>
   286b6:	85a6                	mv	a1,s1
   286b8:	854a                	mv	a0,s2
   286ba:	2729                	jal	28dc4 <_sbrk_r>
   286bc:	59fd                	li	s3,-1
   286be:	07351b63          	bne	a0,s3,28734 <_malloc_r+0xbe>
   286c2:	47b1                	li	a5,12
   286c4:	00f92023          	sw	a5,0(s2)
   286c8:	854a                	mv	a0,s2
   286ca:	343000ef          	jal	2920c <__malloc_unlock>
   286ce:	a031                	j	286da <_malloc_r+0x64>
   286d0:	fc04d2e3          	bgez	s1,28694 <_malloc_r+0x1e>
   286d4:	47b1                	li	a5,12
   286d6:	00f92023          	sw	a5,0(s2)
   286da:	4501                	li	a0,0
   286dc:	40f2                	lw	ra,28(sp)
   286de:	4462                	lw	s0,24(sp)
   286e0:	44d2                	lw	s1,20(sp)
   286e2:	4942                	lw	s2,16(sp)
   286e4:	49b2                	lw	s3,12(sp)
   286e6:	6105                	add	sp,sp,32
   286e8:	8082                	ret
   286ea:	401c                	lw	a5,0(s0)
   286ec:	8f85                	sub	a5,a5,s1
   286ee:	0407c063          	bltz	a5,2872e <_malloc_r+0xb8>
   286f2:	462d                	li	a2,11
   286f4:	00f67663          	bgeu	a2,a5,28700 <_malloc_r+0x8a>
   286f8:	c01c                	sw	a5,0(s0)
   286fa:	943e                	add	s0,s0,a5
   286fc:	c004                	sw	s1,0(s0)
   286fe:	a031                	j	2870a <_malloc_r+0x94>
   28700:	405c                	lw	a5,4(s0)
   28702:	02871463          	bne	a4,s0,2872a <_malloc_r+0xb4>
   28706:	9ef1a623          	sw	a5,-1556(gp) # a01ec <__malloc_free_list>
   2870a:	854a                	mv	a0,s2
   2870c:	301000ef          	jal	2920c <__malloc_unlock>
   28710:	00b40513          	add	a0,s0,11
   28714:	00440793          	add	a5,s0,4
   28718:	9961                	and	a0,a0,-8
   2871a:	40f50733          	sub	a4,a0,a5
   2871e:	faf50fe3          	beq	a0,a5,286dc <_malloc_r+0x66>
   28722:	943a                	add	s0,s0,a4
   28724:	8f89                	sub	a5,a5,a0
   28726:	c01c                	sw	a5,0(s0)
   28728:	bf55                	j	286dc <_malloc_r+0x66>
   2872a:	c35c                	sw	a5,4(a4)
   2872c:	bff9                	j	2870a <_malloc_r+0x94>
   2872e:	8722                	mv	a4,s0
   28730:	4040                	lw	s0,4(s0)
   28732:	bf8d                	j	286a4 <_malloc_r+0x2e>
   28734:	00350413          	add	s0,a0,3
   28738:	9871                	and	s0,s0,-4
   2873a:	fc8501e3          	beq	a0,s0,286fc <_malloc_r+0x86>
   2873e:	40a405b3          	sub	a1,s0,a0
   28742:	854a                	mv	a0,s2
   28744:	2541                	jal	28dc4 <_sbrk_r>
   28746:	fb351be3          	bne	a0,s3,286fc <_malloc_r+0x86>
   2874a:	bfa5                	j	286c2 <_malloc_r+0x4c>

0002874c <__ssputs_r>:
   2874c:	1101                	add	sp,sp,-32
   2874e:	c84a                	sw	s2,16(sp)
   28750:	0085a903          	lw	s2,8(a1)
   28754:	cc22                	sw	s0,24(sp)
   28756:	c64e                	sw	s3,12(sp)
   28758:	c256                	sw	s5,4(sp)
   2875a:	c05a                	sw	s6,0(sp)
   2875c:	ce06                	sw	ra,28(sp)
   2875e:	ca26                	sw	s1,20(sp)
   28760:	c452                	sw	s4,8(sp)
   28762:	0005aa83          	lw	s5,0(a1)
   28766:	842e                	mv	s0,a1
   28768:	8b32                	mv	s6,a2
   2876a:	89b6                	mv	s3,a3
   2876c:	0726e963          	bltu	a3,s2,287de <__ssputs_r+0x92>
   28770:	00c59783          	lh	a5,12(a1)
   28774:	4807f713          	and	a4,a5,1152
   28778:	c32d                	beqz	a4,287da <__ssputs_r+0x8e>
   2877a:	4858                	lw	a4,20(s0)
   2877c:	448d                	li	s1,3
   2877e:	498c                	lw	a1,16(a1)
   28780:	02e484b3          	mul	s1,s1,a4
   28784:	4709                	li	a4,2
   28786:	40ba8ab3          	sub	s5,s5,a1
   2878a:	8a2a                	mv	s4,a0
   2878c:	02e4c4b3          	div	s1,s1,a4
   28790:	00168713          	add	a4,a3,1
   28794:	9756                	add	a4,a4,s5
   28796:	00e4f363          	bgeu	s1,a4,2879c <__ssputs_r+0x50>
   2879a:	84ba                	mv	s1,a4
   2879c:	4007f793          	and	a5,a5,1024
   287a0:	c7bd                	beqz	a5,2880e <__ssputs_r+0xc2>
   287a2:	85a6                	mv	a1,s1
   287a4:	8552                	mv	a0,s4
   287a6:	ed1ff0ef          	jal	28676 <_malloc_r>
   287aa:	892a                	mv	s2,a0
   287ac:	c93d                	beqz	a0,28822 <__ssputs_r+0xd6>
   287ae:	480c                	lw	a1,16(s0)
   287b0:	8656                	mv	a2,s5
   287b2:	df0f90ef          	jal	21da2 <memcpy>
   287b6:	00c45783          	lhu	a5,12(s0)
   287ba:	b7f7f793          	and	a5,a5,-1153
   287be:	0807e793          	or	a5,a5,128
   287c2:	00f41623          	sh	a5,12(s0)
   287c6:	01242823          	sw	s2,16(s0)
   287ca:	c844                	sw	s1,20(s0)
   287cc:	9956                	add	s2,s2,s5
   287ce:	415484b3          	sub	s1,s1,s5
   287d2:	01242023          	sw	s2,0(s0)
   287d6:	c404                	sw	s1,8(s0)
   287d8:	894e                	mv	s2,s3
   287da:	0129f363          	bgeu	s3,s2,287e0 <__ssputs_r+0x94>
   287de:	894e                	mv	s2,s3
   287e0:	4008                	lw	a0,0(s0)
   287e2:	864a                	mv	a2,s2
   287e4:	85da                	mv	a1,s6
   287e6:	de2f90ef          	jal	21dc8 <memmove>
   287ea:	441c                	lw	a5,8(s0)
   287ec:	4501                	li	a0,0
   287ee:	412787b3          	sub	a5,a5,s2
   287f2:	c41c                	sw	a5,8(s0)
   287f4:	401c                	lw	a5,0(s0)
   287f6:	97ca                	add	a5,a5,s2
   287f8:	c01c                	sw	a5,0(s0)
   287fa:	40f2                	lw	ra,28(sp)
   287fc:	4462                	lw	s0,24(sp)
   287fe:	44d2                	lw	s1,20(sp)
   28800:	4942                	lw	s2,16(sp)
   28802:	49b2                	lw	s3,12(sp)
   28804:	4a22                	lw	s4,8(sp)
   28806:	4a92                	lw	s5,4(sp)
   28808:	4b02                	lw	s6,0(sp)
   2880a:	6105                	add	sp,sp,32
   2880c:	8082                	ret
   2880e:	8626                	mv	a2,s1
   28810:	8552                	mv	a0,s4
   28812:	1fd000ef          	jal	2920e <_realloc_r>
   28816:	892a                	mv	s2,a0
   28818:	f55d                	bnez	a0,287c6 <__ssputs_r+0x7a>
   2881a:	480c                	lw	a1,16(s0)
   2881c:	8552                	mv	a0,s4
   2881e:	db7ff0ef          	jal	285d4 <_free_r>
   28822:	47b1                	li	a5,12
   28824:	00fa2023          	sw	a5,0(s4)
   28828:	00c45783          	lhu	a5,12(s0)
   2882c:	557d                	li	a0,-1
   2882e:	0407e793          	or	a5,a5,64
   28832:	00f41623          	sh	a5,12(s0)
   28836:	b7d1                	j	287fa <__ssputs_r+0xae>

00028838 <_svfiprintf_r>:
   28838:	00c5d783          	lhu	a5,12(a1)
   2883c:	7171                	add	sp,sp,-176
   2883e:	d522                	sw	s0,168(sp)
   28840:	d326                	sw	s1,164(sp)
   28842:	d14a                	sw	s2,160(sp)
   28844:	cd52                	sw	s4,152(sp)
   28846:	d706                	sw	ra,172(sp)
   28848:	cf4e                	sw	s3,156(sp)
   2884a:	cb56                	sw	s5,148(sp)
   2884c:	c95a                	sw	s6,144(sp)
   2884e:	c75e                	sw	s7,140(sp)
   28850:	c562                	sw	s8,136(sp)
   28852:	c366                	sw	s9,132(sp)
   28854:	c16a                	sw	s10,128(sp)
   28856:	deee                	sw	s11,124(sp)
   28858:	0807f793          	and	a5,a5,128
   2885c:	8a2a                	mv	s4,a0
   2885e:	892e                	mv	s2,a1
   28860:	84b2                	mv	s1,a2
   28862:	8436                	mv	s0,a3
   28864:	c3b9                	beqz	a5,288aa <_svfiprintf_r+0x72>
   28866:	499c                	lw	a5,16(a1)
   28868:	e3a9                	bnez	a5,288aa <_svfiprintf_r+0x72>
   2886a:	04000593          	li	a1,64
   2886e:	e09ff0ef          	jal	28676 <_malloc_r>
   28872:	00a92023          	sw	a0,0(s2)
   28876:	00a92823          	sw	a0,16(s2)
   2887a:	e505                	bnez	a0,288a2 <_svfiprintf_r+0x6a>
   2887c:	47b1                	li	a5,12
   2887e:	00fa2023          	sw	a5,0(s4)
   28882:	557d                	li	a0,-1
   28884:	50ba                	lw	ra,172(sp)
   28886:	542a                	lw	s0,168(sp)
   28888:	549a                	lw	s1,164(sp)
   2888a:	590a                	lw	s2,160(sp)
   2888c:	49fa                	lw	s3,156(sp)
   2888e:	4a6a                	lw	s4,152(sp)
   28890:	4ada                	lw	s5,148(sp)
   28892:	4b4a                	lw	s6,144(sp)
   28894:	4bba                	lw	s7,140(sp)
   28896:	4c2a                	lw	s8,136(sp)
   28898:	4c9a                	lw	s9,132(sp)
   2889a:	4d0a                	lw	s10,128(sp)
   2889c:	5df6                	lw	s11,124(sp)
   2889e:	614d                	add	sp,sp,176
   288a0:	8082                	ret
   288a2:	04000793          	li	a5,64
   288a6:	00f92a23          	sw	a5,20(s2)
   288aa:	02000793          	li	a5,32
   288ae:	02f104a3          	sb	a5,41(sp)
   288b2:	00024ab7          	lui	s5,0x24
   288b6:	03000793          	li	a5,48
   288ba:	d202                	sw	zero,36(sp)
   288bc:	02f10523          	sb	a5,42(sp)
   288c0:	c622                	sw	s0,12(sp)
   288c2:	02500c93          	li	s9,37
   288c6:	00029b37          	lui	s6,0x29
   288ca:	00029bb7          	lui	s7,0x29
   288ce:	00029d37          	lui	s10,0x29
   288d2:	00028c37          	lui	s8,0x28
   288d6:	362a8a93          	add	s5,s5,866 # 24362 <_printf_float>
   288da:	8426                	mv	s0,s1
   288dc:	00044783          	lbu	a5,0(s0)
   288e0:	c399                	beqz	a5,288e6 <_svfiprintf_r+0xae>
   288e2:	0b979063          	bne	a5,s9,28982 <_svfiprintf_r+0x14a>
   288e6:	40940db3          	sub	s11,s0,s1
   288ea:	00940e63          	beq	s0,s1,28906 <_svfiprintf_r+0xce>
   288ee:	86ee                	mv	a3,s11
   288f0:	8626                	mv	a2,s1
   288f2:	85ca                	mv	a1,s2
   288f4:	8552                	mv	a0,s4
   288f6:	e57ff0ef          	jal	2874c <__ssputs_r>
   288fa:	57fd                	li	a5,-1
   288fc:	18f50b63          	beq	a0,a5,28a92 <_svfiprintf_r+0x25a>
   28900:	5792                	lw	a5,36(sp)
   28902:	97ee                	add	a5,a5,s11
   28904:	d23e                	sw	a5,36(sp)
   28906:	00044783          	lbu	a5,0(s0)
   2890a:	18078463          	beqz	a5,28a92 <_svfiprintf_r+0x25a>
   2890e:	57fd                	li	a5,-1
   28910:	00140493          	add	s1,s0,1
   28914:	c802                	sw	zero,16(sp)
   28916:	ce02                	sw	zero,28(sp)
   28918:	ca3e                	sw	a5,20(sp)
   2891a:	cc02                	sw	zero,24(sp)
   2891c:	040109a3          	sb	zero,83(sp)
   28920:	d482                	sw	zero,104(sp)
   28922:	4d85                	li	s11,1
   28924:	0004c583          	lbu	a1,0(s1)
   28928:	4615                	li	a2,5
   2892a:	714b0513          	add	a0,s6,1812 # 29714 <__clz_tab+0x2b4>
   2892e:	91eff0ef          	jal	27a4c <memchr>
   28932:	47c2                	lw	a5,16(sp)
   28934:	00148413          	add	s0,s1,1
   28938:	e539                	bnez	a0,28986 <_svfiprintf_r+0x14e>
   2893a:	0107f713          	and	a4,a5,16
   2893e:	c709                	beqz	a4,28948 <_svfiprintf_r+0x110>
   28940:	02000713          	li	a4,32
   28944:	04e109a3          	sb	a4,83(sp)
   28948:	0087f713          	and	a4,a5,8
   2894c:	c709                	beqz	a4,28956 <_svfiprintf_r+0x11e>
   2894e:	02b00713          	li	a4,43
   28952:	04e109a3          	sb	a4,83(sp)
   28956:	0004c683          	lbu	a3,0(s1)
   2895a:	02a00713          	li	a4,42
   2895e:	02e68d63          	beq	a3,a4,28998 <_svfiprintf_r+0x160>
   28962:	47f2                	lw	a5,28(sp)
   28964:	8426                	mv	s0,s1
   28966:	4681                	li	a3,0
   28968:	4625                	li	a2,9
   2896a:	4529                	li	a0,10
   2896c:	00044703          	lbu	a4,0(s0)
   28970:	00140593          	add	a1,s0,1
   28974:	fd070713          	add	a4,a4,-48
   28978:	06e67663          	bgeu	a2,a4,289e4 <_svfiprintf_r+0x1ac>
   2897c:	c695                	beqz	a3,289a8 <_svfiprintf_r+0x170>
   2897e:	ce3e                	sw	a5,28(sp)
   28980:	a025                	j	289a8 <_svfiprintf_r+0x170>
   28982:	0405                	add	s0,s0,1
   28984:	bfa1                	j	288dc <_svfiprintf_r+0xa4>
   28986:	714b0713          	add	a4,s6,1812
   2898a:	8d19                	sub	a0,a0,a4
   2898c:	00ad9533          	sll	a0,s11,a0
   28990:	8fc9                	or	a5,a5,a0
   28992:	c83e                	sw	a5,16(sp)
   28994:	84a2                	mv	s1,s0
   28996:	b779                	j	28924 <_svfiprintf_r+0xec>
   28998:	4732                	lw	a4,12(sp)
   2899a:	00470693          	add	a3,a4,4
   2899e:	4318                	lw	a4,0(a4)
   289a0:	c636                	sw	a3,12(sp)
   289a2:	02074a63          	bltz	a4,289d6 <_svfiprintf_r+0x19e>
   289a6:	ce3a                	sw	a4,28(sp)
   289a8:	00044703          	lbu	a4,0(s0)
   289ac:	02e00793          	li	a5,46
   289b0:	04f71f63          	bne	a4,a5,28a0e <_svfiprintf_r+0x1d6>
   289b4:	00144703          	lbu	a4,1(s0)
   289b8:	02a00793          	li	a5,42
   289bc:	02f71a63          	bne	a4,a5,289f0 <_svfiprintf_r+0x1b8>
   289c0:	47b2                	lw	a5,12(sp)
   289c2:	0409                	add	s0,s0,2
   289c4:	00478713          	add	a4,a5,4
   289c8:	439c                	lw	a5,0(a5)
   289ca:	c63a                	sw	a4,12(sp)
   289cc:	0007d363          	bgez	a5,289d2 <_svfiprintf_r+0x19a>
   289d0:	57fd                	li	a5,-1
   289d2:	ca3e                	sw	a5,20(sp)
   289d4:	a82d                	j	28a0e <_svfiprintf_r+0x1d6>
   289d6:	40e00733          	neg	a4,a4
   289da:	0027e793          	or	a5,a5,2
   289de:	ce3a                	sw	a4,28(sp)
   289e0:	c83e                	sw	a5,16(sp)
   289e2:	b7d9                	j	289a8 <_svfiprintf_r+0x170>
   289e4:	02a787b3          	mul	a5,a5,a0
   289e8:	842e                	mv	s0,a1
   289ea:	4685                	li	a3,1
   289ec:	97ba                	add	a5,a5,a4
   289ee:	bfbd                	j	2896c <_svfiprintf_r+0x134>
   289f0:	0405                	add	s0,s0,1
   289f2:	ca02                	sw	zero,20(sp)
   289f4:	4681                	li	a3,0
   289f6:	4781                	li	a5,0
   289f8:	4625                	li	a2,9
   289fa:	4529                	li	a0,10
   289fc:	00044703          	lbu	a4,0(s0)
   28a00:	00140593          	add	a1,s0,1
   28a04:	fd070713          	add	a4,a4,-48
   28a08:	04e67f63          	bgeu	a2,a4,28a66 <_svfiprintf_r+0x22e>
   28a0c:	f2f9                	bnez	a3,289d2 <_svfiprintf_r+0x19a>
   28a0e:	00044583          	lbu	a1,0(s0)
   28a12:	460d                	li	a2,3
   28a14:	71cb8513          	add	a0,s7,1820 # 2971c <__clz_tab+0x2bc>
   28a18:	834ff0ef          	jal	27a4c <memchr>
   28a1c:	cd01                	beqz	a0,28a34 <_svfiprintf_r+0x1fc>
   28a1e:	71cb8793          	add	a5,s7,1820
   28a22:	8d1d                	sub	a0,a0,a5
   28a24:	47c2                	lw	a5,16(sp)
   28a26:	04000713          	li	a4,64
   28a2a:	00a71733          	sll	a4,a4,a0
   28a2e:	8fd9                	or	a5,a5,a4
   28a30:	0405                	add	s0,s0,1
   28a32:	c83e                	sw	a5,16(sp)
   28a34:	00044583          	lbu	a1,0(s0)
   28a38:	4619                	li	a2,6
   28a3a:	720d0513          	add	a0,s10,1824 # 29720 <__clz_tab+0x2c0>
   28a3e:	00140493          	add	s1,s0,1
   28a42:	02b10423          	sb	a1,40(sp)
   28a46:	806ff0ef          	jal	27a4c <memchr>
   28a4a:	cd21                	beqz	a0,28aa2 <_svfiprintf_r+0x26a>
   28a4c:	020a9763          	bnez	s5,28a7a <_svfiprintf_r+0x242>
   28a50:	4742                	lw	a4,16(sp)
   28a52:	47b2                	lw	a5,12(sp)
   28a54:	10077713          	and	a4,a4,256
   28a58:	cf09                	beqz	a4,28a72 <_svfiprintf_r+0x23a>
   28a5a:	0791                	add	a5,a5,4
   28a5c:	c63e                	sw	a5,12(sp)
   28a5e:	5792                	lw	a5,36(sp)
   28a60:	97ce                	add	a5,a5,s3
   28a62:	d23e                	sw	a5,36(sp)
   28a64:	bd9d                	j	288da <_svfiprintf_r+0xa2>
   28a66:	02a787b3          	mul	a5,a5,a0
   28a6a:	842e                	mv	s0,a1
   28a6c:	4685                	li	a3,1
   28a6e:	97ba                	add	a5,a5,a4
   28a70:	b771                	j	289fc <_svfiprintf_r+0x1c4>
   28a72:	079d                	add	a5,a5,7
   28a74:	9be1                	and	a5,a5,-8
   28a76:	07a1                	add	a5,a5,8
   28a78:	b7d5                	j	28a5c <_svfiprintf_r+0x224>
   28a7a:	0078                	add	a4,sp,12
   28a7c:	74cc0693          	add	a3,s8,1868 # 2874c <__ssputs_r>
   28a80:	864a                	mv	a2,s2
   28a82:	080c                	add	a1,sp,16
   28a84:	8552                	mv	a0,s4
   28a86:	8ddfb0ef          	jal	24362 <_printf_float>
   28a8a:	57fd                	li	a5,-1
   28a8c:	89aa                	mv	s3,a0
   28a8e:	fcf518e3          	bne	a0,a5,28a5e <_svfiprintf_r+0x226>
   28a92:	00c95783          	lhu	a5,12(s2)
   28a96:	0407f793          	and	a5,a5,64
   28a9a:	de0794e3          	bnez	a5,28882 <_svfiprintf_r+0x4a>
   28a9e:	5512                	lw	a0,36(sp)
   28aa0:	b3d5                	j	28884 <_svfiprintf_r+0x4c>
   28aa2:	0078                	add	a4,sp,12
   28aa4:	74cc0693          	add	a3,s8,1868
   28aa8:	864a                	mv	a2,s2
   28aaa:	080c                	add	a1,sp,16
   28aac:	8552                	mv	a0,s4
   28aae:	e81fb0ef          	jal	2492e <_printf_i>
   28ab2:	bfe1                	j	28a8a <_svfiprintf_r+0x252>

00028ab4 <__sfputc_r>:
   28ab4:	461c                	lw	a5,8(a2)
   28ab6:	17fd                	add	a5,a5,-1
   28ab8:	c61c                	sw	a5,8(a2)
   28aba:	0007d963          	bgez	a5,28acc <__sfputc_r+0x18>
   28abe:	4e18                	lw	a4,24(a2)
   28ac0:	00e7c563          	blt	a5,a4,28aca <__sfputc_r+0x16>
   28ac4:	47a9                	li	a5,10
   28ac6:	00f59363          	bne	a1,a5,28acc <__sfputc_r+0x18>
   28aca:	a929                	j	28ee4 <__swbuf_r>
   28acc:	421c                	lw	a5,0(a2)
   28ace:	852e                	mv	a0,a1
   28ad0:	00178713          	add	a4,a5,1
   28ad4:	c218                	sw	a4,0(a2)
   28ad6:	00b78023          	sb	a1,0(a5)
   28ada:	8082                	ret

00028adc <__sfputs_r>:
   28adc:	1101                	add	sp,sp,-32
   28ade:	cc22                	sw	s0,24(sp)
   28ae0:	ca26                	sw	s1,20(sp)
   28ae2:	c84a                	sw	s2,16(sp)
   28ae4:	c64e                	sw	s3,12(sp)
   28ae6:	c452                	sw	s4,8(sp)
   28ae8:	ce06                	sw	ra,28(sp)
   28aea:	892a                	mv	s2,a0
   28aec:	89ae                	mv	s3,a1
   28aee:	8432                	mv	s0,a2
   28af0:	00d604b3          	add	s1,a2,a3
   28af4:	5a7d                	li	s4,-1
   28af6:	00941463          	bne	s0,s1,28afe <__sfputs_r+0x22>
   28afa:	4501                	li	a0,0
   28afc:	a809                	j	28b0e <__sfputs_r+0x32>
   28afe:	00044583          	lbu	a1,0(s0)
   28b02:	864e                	mv	a2,s3
   28b04:	854a                	mv	a0,s2
   28b06:	377d                	jal	28ab4 <__sfputc_r>
   28b08:	0405                	add	s0,s0,1
   28b0a:	ff4516e3          	bne	a0,s4,28af6 <__sfputs_r+0x1a>
   28b0e:	40f2                	lw	ra,28(sp)
   28b10:	4462                	lw	s0,24(sp)
   28b12:	44d2                	lw	s1,20(sp)
   28b14:	4942                	lw	s2,16(sp)
   28b16:	49b2                	lw	s3,12(sp)
   28b18:	4a22                	lw	s4,8(sp)
   28b1a:	6105                	add	sp,sp,32
   28b1c:	8082                	ret

00028b1e <_vfiprintf_r>:
   28b1e:	7171                	add	sp,sp,-176
   28b20:	d522                	sw	s0,168(sp)
   28b22:	d326                	sw	s1,164(sp)
   28b24:	d14a                	sw	s2,160(sp)
   28b26:	cf4e                	sw	s3,156(sp)
   28b28:	d706                	sw	ra,172(sp)
   28b2a:	cd52                	sw	s4,152(sp)
   28b2c:	cb56                	sw	s5,148(sp)
   28b2e:	c95a                	sw	s6,144(sp)
   28b30:	c75e                	sw	s7,140(sp)
   28b32:	c562                	sw	s8,136(sp)
   28b34:	c366                	sw	s9,132(sp)
   28b36:	c16a                	sw	s10,128(sp)
   28b38:	deee                	sw	s11,124(sp)
   28b3a:	89aa                	mv	s3,a0
   28b3c:	84ae                	mv	s1,a1
   28b3e:	8932                	mv	s2,a2
   28b40:	8436                	mv	s0,a3
   28b42:	c509                	beqz	a0,28b4c <_vfiprintf_r+0x2e>
   28b44:	4d1c                	lw	a5,24(a0)
   28b46:	e399                	bnez	a5,28b4c <_vfiprintf_r+0x2e>
   28b48:	ccafe0ef          	jal	27012 <__sinit>
   28b4c:	0002a7b7          	lui	a5,0x2a
   28b50:	ae478793          	add	a5,a5,-1308 # 29ae4 <__sf_fake_stdin>
   28b54:	0ef49863          	bne	s1,a5,28c44 <_vfiprintf_r+0x126>
   28b58:	0049a483          	lw	s1,4(s3)
   28b5c:	00c4d783          	lhu	a5,12(s1)
   28b60:	8ba1                	and	a5,a5,8
   28b62:	10078363          	beqz	a5,28c68 <_vfiprintf_r+0x14a>
   28b66:	489c                	lw	a5,16(s1)
   28b68:	10078063          	beqz	a5,28c68 <_vfiprintf_r+0x14a>
   28b6c:	02000793          	li	a5,32
   28b70:	02f104a3          	sb	a5,41(sp)
   28b74:	00024ab7          	lui	s5,0x24
   28b78:	03000793          	li	a5,48
   28b7c:	d202                	sw	zero,36(sp)
   28b7e:	02f10523          	sb	a5,42(sp)
   28b82:	c622                	sw	s0,12(sp)
   28b84:	02500c93          	li	s9,37
   28b88:	00029b37          	lui	s6,0x29
   28b8c:	00029bb7          	lui	s7,0x29
   28b90:	00029d37          	lui	s10,0x29
   28b94:	00029c37          	lui	s8,0x29
   28b98:	362a8a93          	add	s5,s5,866 # 24362 <_printf_float>
   28b9c:	844a                	mv	s0,s2
   28b9e:	00044783          	lbu	a5,0(s0)
   28ba2:	c399                	beqz	a5,28ba8 <_vfiprintf_r+0x8a>
   28ba4:	0f979763          	bne	a5,s9,28c92 <_vfiprintf_r+0x174>
   28ba8:	41240db3          	sub	s11,s0,s2
   28bac:	01240e63          	beq	s0,s2,28bc8 <_vfiprintf_r+0xaa>
   28bb0:	86ee                	mv	a3,s11
   28bb2:	864a                	mv	a2,s2
   28bb4:	85a6                	mv	a1,s1
   28bb6:	854e                	mv	a0,s3
   28bb8:	f25ff0ef          	jal	28adc <__sfputs_r>
   28bbc:	57fd                	li	a5,-1
   28bbe:	1ef50263          	beq	a0,a5,28da2 <_vfiprintf_r+0x284>
   28bc2:	5792                	lw	a5,36(sp)
   28bc4:	97ee                	add	a5,a5,s11
   28bc6:	d23e                	sw	a5,36(sp)
   28bc8:	00044783          	lbu	a5,0(s0)
   28bcc:	1c078b63          	beqz	a5,28da2 <_vfiprintf_r+0x284>
   28bd0:	57fd                	li	a5,-1
   28bd2:	00140913          	add	s2,s0,1
   28bd6:	c802                	sw	zero,16(sp)
   28bd8:	ce02                	sw	zero,28(sp)
   28bda:	ca3e                	sw	a5,20(sp)
   28bdc:	cc02                	sw	zero,24(sp)
   28bde:	040109a3          	sb	zero,83(sp)
   28be2:	d482                	sw	zero,104(sp)
   28be4:	4d85                	li	s11,1
   28be6:	00094583          	lbu	a1,0(s2)
   28bea:	4615                	li	a2,5
   28bec:	714b0513          	add	a0,s6,1812 # 29714 <__clz_tab+0x2b4>
   28bf0:	e5dfe0ef          	jal	27a4c <memchr>
   28bf4:	47c2                	lw	a5,16(sp)
   28bf6:	00190413          	add	s0,s2,1
   28bfa:	ed51                	bnez	a0,28c96 <_vfiprintf_r+0x178>
   28bfc:	0107f713          	and	a4,a5,16
   28c00:	c709                	beqz	a4,28c0a <_vfiprintf_r+0xec>
   28c02:	02000713          	li	a4,32
   28c06:	04e109a3          	sb	a4,83(sp)
   28c0a:	0087f713          	and	a4,a5,8
   28c0e:	c709                	beqz	a4,28c18 <_vfiprintf_r+0xfa>
   28c10:	02b00713          	li	a4,43
   28c14:	04e109a3          	sb	a4,83(sp)
   28c18:	00094683          	lbu	a3,0(s2)
   28c1c:	02a00713          	li	a4,42
   28c20:	08e68463          	beq	a3,a4,28ca8 <_vfiprintf_r+0x18a>
   28c24:	47f2                	lw	a5,28(sp)
   28c26:	844a                	mv	s0,s2
   28c28:	4681                	li	a3,0
   28c2a:	4625                	li	a2,9
   28c2c:	4529                	li	a0,10
   28c2e:	00044703          	lbu	a4,0(s0)
   28c32:	00140593          	add	a1,s0,1
   28c36:	fd070713          	add	a4,a4,-48
   28c3a:	0ae67d63          	bgeu	a2,a4,28cf4 <_vfiprintf_r+0x1d6>
   28c3e:	cead                	beqz	a3,28cb8 <_vfiprintf_r+0x19a>
   28c40:	ce3e                	sw	a5,28(sp)
   28c42:	a89d                	j	28cb8 <_vfiprintf_r+0x19a>
   28c44:	0002a7b7          	lui	a5,0x2a
   28c48:	ac478793          	add	a5,a5,-1340 # 29ac4 <__sf_fake_stdout>
   28c4c:	00f49563          	bne	s1,a5,28c56 <_vfiprintf_r+0x138>
   28c50:	0089a483          	lw	s1,8(s3)
   28c54:	b721                	j	28b5c <_vfiprintf_r+0x3e>
   28c56:	0002a7b7          	lui	a5,0x2a
   28c5a:	aa478793          	add	a5,a5,-1372 # 29aa4 <__sf_fake_stderr>
   28c5e:	eef49fe3          	bne	s1,a5,28b5c <_vfiprintf_r+0x3e>
   28c62:	00c9a483          	lw	s1,12(s3)
   28c66:	bddd                	j	28b5c <_vfiprintf_r+0x3e>
   28c68:	85a6                	mv	a1,s1
   28c6a:	854e                	mv	a0,s3
   28c6c:	2679                	jal	28ffa <__swsetup_r>
   28c6e:	ee050fe3          	beqz	a0,28b6c <_vfiprintf_r+0x4e>
   28c72:	557d                	li	a0,-1
   28c74:	50ba                	lw	ra,172(sp)
   28c76:	542a                	lw	s0,168(sp)
   28c78:	549a                	lw	s1,164(sp)
   28c7a:	590a                	lw	s2,160(sp)
   28c7c:	49fa                	lw	s3,156(sp)
   28c7e:	4a6a                	lw	s4,152(sp)
   28c80:	4ada                	lw	s5,148(sp)
   28c82:	4b4a                	lw	s6,144(sp)
   28c84:	4bba                	lw	s7,140(sp)
   28c86:	4c2a                	lw	s8,136(sp)
   28c88:	4c9a                	lw	s9,132(sp)
   28c8a:	4d0a                	lw	s10,128(sp)
   28c8c:	5df6                	lw	s11,124(sp)
   28c8e:	614d                	add	sp,sp,176
   28c90:	8082                	ret
   28c92:	0405                	add	s0,s0,1
   28c94:	b729                	j	28b9e <_vfiprintf_r+0x80>
   28c96:	714b0713          	add	a4,s6,1812
   28c9a:	8d19                	sub	a0,a0,a4
   28c9c:	00ad9533          	sll	a0,s11,a0
   28ca0:	8fc9                	or	a5,a5,a0
   28ca2:	c83e                	sw	a5,16(sp)
   28ca4:	8922                	mv	s2,s0
   28ca6:	b781                	j	28be6 <_vfiprintf_r+0xc8>
   28ca8:	4732                	lw	a4,12(sp)
   28caa:	00470693          	add	a3,a4,4
   28cae:	4318                	lw	a4,0(a4)
   28cb0:	c636                	sw	a3,12(sp)
   28cb2:	02074a63          	bltz	a4,28ce6 <_vfiprintf_r+0x1c8>
   28cb6:	ce3a                	sw	a4,28(sp)
   28cb8:	00044703          	lbu	a4,0(s0)
   28cbc:	02e00793          	li	a5,46
   28cc0:	04f71f63          	bne	a4,a5,28d1e <_vfiprintf_r+0x200>
   28cc4:	00144703          	lbu	a4,1(s0)
   28cc8:	02a00793          	li	a5,42
   28ccc:	02f71a63          	bne	a4,a5,28d00 <_vfiprintf_r+0x1e2>
   28cd0:	47b2                	lw	a5,12(sp)
   28cd2:	0409                	add	s0,s0,2
   28cd4:	00478713          	add	a4,a5,4
   28cd8:	439c                	lw	a5,0(a5)
   28cda:	c63a                	sw	a4,12(sp)
   28cdc:	0007d363          	bgez	a5,28ce2 <_vfiprintf_r+0x1c4>
   28ce0:	57fd                	li	a5,-1
   28ce2:	ca3e                	sw	a5,20(sp)
   28ce4:	a82d                	j	28d1e <_vfiprintf_r+0x200>
   28ce6:	40e00733          	neg	a4,a4
   28cea:	0027e793          	or	a5,a5,2
   28cee:	ce3a                	sw	a4,28(sp)
   28cf0:	c83e                	sw	a5,16(sp)
   28cf2:	b7d9                	j	28cb8 <_vfiprintf_r+0x19a>
   28cf4:	02a787b3          	mul	a5,a5,a0
   28cf8:	842e                	mv	s0,a1
   28cfa:	4685                	li	a3,1
   28cfc:	97ba                	add	a5,a5,a4
   28cfe:	bf05                	j	28c2e <_vfiprintf_r+0x110>
   28d00:	0405                	add	s0,s0,1
   28d02:	ca02                	sw	zero,20(sp)
   28d04:	4681                	li	a3,0
   28d06:	4781                	li	a5,0
   28d08:	4625                	li	a2,9
   28d0a:	4529                	li	a0,10
   28d0c:	00044703          	lbu	a4,0(s0)
   28d10:	00140593          	add	a1,s0,1
   28d14:	fd070713          	add	a4,a4,-48
   28d18:	04e67f63          	bgeu	a2,a4,28d76 <_vfiprintf_r+0x258>
   28d1c:	f2f9                	bnez	a3,28ce2 <_vfiprintf_r+0x1c4>
   28d1e:	00044583          	lbu	a1,0(s0)
   28d22:	460d                	li	a2,3
   28d24:	71cb8513          	add	a0,s7,1820 # 2971c <__clz_tab+0x2bc>
   28d28:	d25fe0ef          	jal	27a4c <memchr>
   28d2c:	cd01                	beqz	a0,28d44 <_vfiprintf_r+0x226>
   28d2e:	71cb8793          	add	a5,s7,1820
   28d32:	8d1d                	sub	a0,a0,a5
   28d34:	47c2                	lw	a5,16(sp)
   28d36:	04000713          	li	a4,64
   28d3a:	00a71733          	sll	a4,a4,a0
   28d3e:	8fd9                	or	a5,a5,a4
   28d40:	0405                	add	s0,s0,1
   28d42:	c83e                	sw	a5,16(sp)
   28d44:	00044583          	lbu	a1,0(s0)
   28d48:	4619                	li	a2,6
   28d4a:	720d0513          	add	a0,s10,1824 # 29720 <__clz_tab+0x2c0>
   28d4e:	00140913          	add	s2,s0,1
   28d52:	02b10423          	sb	a1,40(sp)
   28d56:	cf7fe0ef          	jal	27a4c <memchr>
   28d5a:	cd21                	beqz	a0,28db2 <_vfiprintf_r+0x294>
   28d5c:	020a9763          	bnez	s5,28d8a <_vfiprintf_r+0x26c>
   28d60:	4742                	lw	a4,16(sp)
   28d62:	47b2                	lw	a5,12(sp)
   28d64:	10077713          	and	a4,a4,256
   28d68:	cf09                	beqz	a4,28d82 <_vfiprintf_r+0x264>
   28d6a:	0791                	add	a5,a5,4
   28d6c:	c63e                	sw	a5,12(sp)
   28d6e:	5792                	lw	a5,36(sp)
   28d70:	97d2                	add	a5,a5,s4
   28d72:	d23e                	sw	a5,36(sp)
   28d74:	b525                	j	28b9c <_vfiprintf_r+0x7e>
   28d76:	02a787b3          	mul	a5,a5,a0
   28d7a:	842e                	mv	s0,a1
   28d7c:	4685                	li	a3,1
   28d7e:	97ba                	add	a5,a5,a4
   28d80:	b771                	j	28d0c <_vfiprintf_r+0x1ee>
   28d82:	079d                	add	a5,a5,7
   28d84:	9be1                	and	a5,a5,-8
   28d86:	07a1                	add	a5,a5,8
   28d88:	b7d5                	j	28d6c <_vfiprintf_r+0x24e>
   28d8a:	0078                	add	a4,sp,12
   28d8c:	adcc0693          	add	a3,s8,-1316 # 28adc <__sfputs_r>
   28d90:	8626                	mv	a2,s1
   28d92:	080c                	add	a1,sp,16
   28d94:	854e                	mv	a0,s3
   28d96:	dccfb0ef          	jal	24362 <_printf_float>
   28d9a:	57fd                	li	a5,-1
   28d9c:	8a2a                	mv	s4,a0
   28d9e:	fcf518e3          	bne	a0,a5,28d6e <_vfiprintf_r+0x250>
   28da2:	00c4d783          	lhu	a5,12(s1)
   28da6:	0407f793          	and	a5,a5,64
   28daa:	ec0794e3          	bnez	a5,28c72 <_vfiprintf_r+0x154>
   28dae:	5512                	lw	a0,36(sp)
   28db0:	b5d1                	j	28c74 <_vfiprintf_r+0x156>
   28db2:	0078                	add	a4,sp,12
   28db4:	adcc0693          	add	a3,s8,-1316
   28db8:	8626                	mv	a2,s1
   28dba:	080c                	add	a1,sp,16
   28dbc:	854e                	mv	a0,s3
   28dbe:	b71fb0ef          	jal	2492e <_printf_i>
   28dc2:	bfe1                	j	28d9a <_vfiprintf_r+0x27c>

00028dc4 <_sbrk_r>:
   28dc4:	1141                	add	sp,sp,-16
   28dc6:	c422                	sw	s0,8(sp)
   28dc8:	c226                	sw	s1,4(sp)
   28dca:	842a                	mv	s0,a0
   28dcc:	852e                	mv	a0,a1
   28dce:	c606                	sw	ra,12(sp)
   28dd0:	9e01a823          	sw	zero,-1552(gp) # a01f0 <errno>
   28dd4:	aaefb0ef          	jal	24082 <_sbrk>
   28dd8:	57fd                	li	a5,-1
   28dda:	00f51663          	bne	a0,a5,28de6 <_sbrk_r+0x22>
   28dde:	9f01a783          	lw	a5,-1552(gp) # a01f0 <errno>
   28de2:	c391                	beqz	a5,28de6 <_sbrk_r+0x22>
   28de4:	c01c                	sw	a5,0(s0)
   28de6:	40b2                	lw	ra,12(sp)
   28de8:	4422                	lw	s0,8(sp)
   28dea:	4492                	lw	s1,4(sp)
   28dec:	0141                	add	sp,sp,16
   28dee:	8082                	ret

00028df0 <nan>:
   28df0:	0002a7b7          	lui	a5,0x2a
   28df4:	cb07a503          	lw	a0,-848(a5) # 29cb0 <_global_impure_ptr+0x88>
   28df8:	cb47a583          	lw	a1,-844(a5)
   28dfc:	8082                	ret

00028dfe <__sread>:
   28dfe:	1141                	add	sp,sp,-16
   28e00:	c422                	sw	s0,8(sp)
   28e02:	842e                	mv	s0,a1
   28e04:	00e59583          	lh	a1,14(a1)
   28e08:	c606                	sw	ra,12(sp)
   28e0a:	2149                	jal	2928c <_read_r>
   28e0c:	00054963          	bltz	a0,28e1e <__sread+0x20>
   28e10:	487c                	lw	a5,84(s0)
   28e12:	97aa                	add	a5,a5,a0
   28e14:	c87c                	sw	a5,84(s0)
   28e16:	40b2                	lw	ra,12(sp)
   28e18:	4422                	lw	s0,8(sp)
   28e1a:	0141                	add	sp,sp,16
   28e1c:	8082                	ret
   28e1e:	00c45783          	lhu	a5,12(s0)
   28e22:	777d                	lui	a4,0xfffff
   28e24:	177d                	add	a4,a4,-1 # ffffefff <__share_mem_end__+0xfef3efff>
   28e26:	8ff9                	and	a5,a5,a4
   28e28:	00f41623          	sh	a5,12(s0)
   28e2c:	b7ed                	j	28e16 <__sread+0x18>

00028e2e <__swrite>:
   28e2e:	00c5d783          	lhu	a5,12(a1)
   28e32:	1101                	add	sp,sp,-32
   28e34:	cc22                	sw	s0,24(sp)
   28e36:	ca26                	sw	s1,20(sp)
   28e38:	c84a                	sw	s2,16(sp)
   28e3a:	c64e                	sw	s3,12(sp)
   28e3c:	ce06                	sw	ra,28(sp)
   28e3e:	1007f793          	and	a5,a5,256
   28e42:	84aa                	mv	s1,a0
   28e44:	842e                	mv	s0,a1
   28e46:	8932                	mv	s2,a2
   28e48:	89b6                	mv	s3,a3
   28e4a:	c791                	beqz	a5,28e56 <__swrite+0x28>
   28e4c:	00e59583          	lh	a1,14(a1)
   28e50:	4689                	li	a3,2
   28e52:	4601                	li	a2,0
   28e54:	2661                	jal	291dc <_lseek_r>
   28e56:	00c45783          	lhu	a5,12(s0)
   28e5a:	777d                	lui	a4,0xfffff
   28e5c:	177d                	add	a4,a4,-1 # ffffefff <__share_mem_end__+0xfef3efff>
   28e5e:	8ff9                	and	a5,a5,a4
   28e60:	00e41583          	lh	a1,14(s0)
   28e64:	00f41623          	sh	a5,12(s0)
   28e68:	4462                	lw	s0,24(sp)
   28e6a:	40f2                	lw	ra,28(sp)
   28e6c:	86ce                	mv	a3,s3
   28e6e:	864a                	mv	a2,s2
   28e70:	49b2                	lw	s3,12(sp)
   28e72:	4942                	lw	s2,16(sp)
   28e74:	8526                	mv	a0,s1
   28e76:	44d2                	lw	s1,20(sp)
   28e78:	6105                	add	sp,sp,32
   28e7a:	aa81                	j	28fca <_write_r>

00028e7c <__sseek>:
   28e7c:	1141                	add	sp,sp,-16
   28e7e:	c422                	sw	s0,8(sp)
   28e80:	842e                	mv	s0,a1
   28e82:	00e59583          	lh	a1,14(a1)
   28e86:	c606                	sw	ra,12(sp)
   28e88:	2e91                	jal	291dc <_lseek_r>
   28e8a:	577d                	li	a4,-1
   28e8c:	00c45783          	lhu	a5,12(s0)
   28e90:	00e51b63          	bne	a0,a4,28ea6 <__sseek+0x2a>
   28e94:	777d                	lui	a4,0xfffff
   28e96:	177d                	add	a4,a4,-1 # ffffefff <__share_mem_end__+0xfef3efff>
   28e98:	8ff9                	and	a5,a5,a4
   28e9a:	00f41623          	sh	a5,12(s0)
   28e9e:	40b2                	lw	ra,12(sp)
   28ea0:	4422                	lw	s0,8(sp)
   28ea2:	0141                	add	sp,sp,16
   28ea4:	8082                	ret
   28ea6:	6705                	lui	a4,0x1
   28ea8:	8fd9                	or	a5,a5,a4
   28eaa:	00f41623          	sh	a5,12(s0)
   28eae:	c868                	sw	a0,84(s0)
   28eb0:	b7fd                	j	28e9e <__sseek+0x22>

00028eb2 <__sclose>:
   28eb2:	00e59583          	lh	a1,14(a1)
   28eb6:	acbd                	j	29134 <_close_r>

00028eb8 <strncmp>:
   28eb8:	c605                	beqz	a2,28ee0 <strncmp+0x28>
   28eba:	167d                	add	a2,a2,-1
   28ebc:	4701                	li	a4,0
   28ebe:	00e507b3          	add	a5,a0,a4
   28ec2:	00e586b3          	add	a3,a1,a4
   28ec6:	0007c783          	lbu	a5,0(a5)
   28eca:	0006c683          	lbu	a3,0(a3)
   28ece:	00d79663          	bne	a5,a3,28eda <strncmp+0x22>
   28ed2:	00c70463          	beq	a4,a2,28eda <strncmp+0x22>
   28ed6:	0705                	add	a4,a4,1 # 1001 <__eh_frame_hdr_end+0x1001>
   28ed8:	f3fd                	bnez	a5,28ebe <strncmp+0x6>
   28eda:	40d78533          	sub	a0,a5,a3
   28ede:	8082                	ret
   28ee0:	4501                	li	a0,0
   28ee2:	8082                	ret

00028ee4 <__swbuf_r>:
   28ee4:	1101                	add	sp,sp,-32
   28ee6:	cc22                	sw	s0,24(sp)
   28ee8:	ca26                	sw	s1,20(sp)
   28eea:	c84a                	sw	s2,16(sp)
   28eec:	ce06                	sw	ra,28(sp)
   28eee:	c64e                	sw	s3,12(sp)
   28ef0:	84aa                	mv	s1,a0
   28ef2:	892e                	mv	s2,a1
   28ef4:	8432                	mv	s0,a2
   28ef6:	c509                	beqz	a0,28f00 <__swbuf_r+0x1c>
   28ef8:	4d1c                	lw	a5,24(a0)
   28efa:	e399                	bnez	a5,28f00 <__swbuf_r+0x1c>
   28efc:	916fe0ef          	jal	27012 <__sinit>
   28f00:	0002a7b7          	lui	a5,0x2a
   28f04:	ae478793          	add	a5,a5,-1308 # 29ae4 <__sf_fake_stdin>
   28f08:	02f41863          	bne	s0,a5,28f38 <__swbuf_r+0x54>
   28f0c:	40c0                	lw	s0,4(s1)
   28f0e:	4c1c                	lw	a5,24(s0)
   28f10:	c41c                	sw	a5,8(s0)
   28f12:	00c45783          	lhu	a5,12(s0)
   28f16:	8ba1                	and	a5,a5,8
   28f18:	c399                	beqz	a5,28f1e <__swbuf_r+0x3a>
   28f1a:	481c                	lw	a5,16(s0)
   28f1c:	ef95                	bnez	a5,28f58 <__swbuf_r+0x74>
   28f1e:	85a2                	mv	a1,s0
   28f20:	8526                	mv	a0,s1
   28f22:	28e1                	jal	28ffa <__swsetup_r>
   28f24:	c915                	beqz	a0,28f58 <__swbuf_r+0x74>
   28f26:	597d                	li	s2,-1
   28f28:	40f2                	lw	ra,28(sp)
   28f2a:	4462                	lw	s0,24(sp)
   28f2c:	44d2                	lw	s1,20(sp)
   28f2e:	49b2                	lw	s3,12(sp)
   28f30:	854a                	mv	a0,s2
   28f32:	4942                	lw	s2,16(sp)
   28f34:	6105                	add	sp,sp,32
   28f36:	8082                	ret
   28f38:	0002a7b7          	lui	a5,0x2a
   28f3c:	ac478793          	add	a5,a5,-1340 # 29ac4 <__sf_fake_stdout>
   28f40:	00f41463          	bne	s0,a5,28f48 <__swbuf_r+0x64>
   28f44:	4480                	lw	s0,8(s1)
   28f46:	b7e1                	j	28f0e <__swbuf_r+0x2a>
   28f48:	0002a7b7          	lui	a5,0x2a
   28f4c:	aa478793          	add	a5,a5,-1372 # 29aa4 <__sf_fake_stderr>
   28f50:	faf41fe3          	bne	s0,a5,28f0e <__swbuf_r+0x2a>
   28f54:	44c0                	lw	s0,12(s1)
   28f56:	bf65                	j	28f0e <__swbuf_r+0x2a>
   28f58:	481c                	lw	a5,16(s0)
   28f5a:	4008                	lw	a0,0(s0)
   28f5c:	0ff97993          	zext.b	s3,s2
   28f60:	0ff97913          	zext.b	s2,s2
   28f64:	8d1d                	sub	a0,a0,a5
   28f66:	485c                	lw	a5,20(s0)
   28f68:	00f54763          	blt	a0,a5,28f76 <__swbuf_r+0x92>
   28f6c:	85a2                	mv	a1,s0
   28f6e:	8526                	mv	a0,s1
   28f70:	f83fd0ef          	jal	26ef2 <_fflush_r>
   28f74:	f94d                	bnez	a0,28f26 <__swbuf_r+0x42>
   28f76:	441c                	lw	a5,8(s0)
   28f78:	0505                	add	a0,a0,1
   28f7a:	17fd                	add	a5,a5,-1
   28f7c:	c41c                	sw	a5,8(s0)
   28f7e:	401c                	lw	a5,0(s0)
   28f80:	00178713          	add	a4,a5,1
   28f84:	c018                	sw	a4,0(s0)
   28f86:	01378023          	sb	s3,0(a5)
   28f8a:	485c                	lw	a5,20(s0)
   28f8c:	00a78963          	beq	a5,a0,28f9e <__swbuf_r+0xba>
   28f90:	00c45783          	lhu	a5,12(s0)
   28f94:	8b85                	and	a5,a5,1
   28f96:	dbc9                	beqz	a5,28f28 <__swbuf_r+0x44>
   28f98:	47a9                	li	a5,10
   28f9a:	f8f917e3          	bne	s2,a5,28f28 <__swbuf_r+0x44>
   28f9e:	85a2                	mv	a1,s0
   28fa0:	8526                	mv	a0,s1
   28fa2:	f51fd0ef          	jal	26ef2 <_fflush_r>
   28fa6:	d149                	beqz	a0,28f28 <__swbuf_r+0x44>
   28fa8:	bfbd                	j	28f26 <__swbuf_r+0x42>

00028faa <__ascii_wctomb>:
   28faa:	cd91                	beqz	a1,28fc6 <__ascii_wctomb+0x1c>
   28fac:	0ff00793          	li	a5,255
   28fb0:	00c7f763          	bgeu	a5,a2,28fbe <__ascii_wctomb+0x14>
   28fb4:	08a00793          	li	a5,138
   28fb8:	c11c                	sw	a5,0(a0)
   28fba:	557d                	li	a0,-1
   28fbc:	8082                	ret
   28fbe:	00c58023          	sb	a2,0(a1)
   28fc2:	4505                	li	a0,1
   28fc4:	8082                	ret
   28fc6:	4501                	li	a0,0
   28fc8:	8082                	ret

00028fca <_write_r>:
   28fca:	1141                	add	sp,sp,-16
   28fcc:	c422                	sw	s0,8(sp)
   28fce:	c226                	sw	s1,4(sp)
   28fd0:	842a                	mv	s0,a0
   28fd2:	852e                	mv	a0,a1
   28fd4:	85b2                	mv	a1,a2
   28fd6:	8636                	mv	a2,a3
   28fd8:	c606                	sw	ra,12(sp)
   28fda:	9e01a823          	sw	zero,-1552(gp) # a01f0 <errno>
   28fde:	956fb0ef          	jal	24134 <_write>
   28fe2:	57fd                	li	a5,-1
   28fe4:	00f51663          	bne	a0,a5,28ff0 <_write_r+0x26>
   28fe8:	9f01a783          	lw	a5,-1552(gp) # a01f0 <errno>
   28fec:	c391                	beqz	a5,28ff0 <_write_r+0x26>
   28fee:	c01c                	sw	a5,0(s0)
   28ff0:	40b2                	lw	ra,12(sp)
   28ff2:	4422                	lw	s0,8(sp)
   28ff4:	4492                	lw	s1,4(sp)
   28ff6:	0141                	add	sp,sp,16
   28ff8:	8082                	ret

00028ffa <__swsetup_r>:
   28ffa:	1141                	add	sp,sp,-16
   28ffc:	c226                	sw	s1,4(sp)
   28ffe:	9cc1a483          	lw	s1,-1588(gp) # a01cc <_impure_ptr>
   29002:	c422                	sw	s0,8(sp)
   29004:	c04a                	sw	s2,0(sp)
   29006:	c606                	sw	ra,12(sp)
   29008:	892a                	mv	s2,a0
   2900a:	842e                	mv	s0,a1
   2900c:	c491                	beqz	s1,29018 <__swsetup_r+0x1e>
   2900e:	4c9c                	lw	a5,24(s1)
   29010:	e781                	bnez	a5,29018 <__swsetup_r+0x1e>
   29012:	8526                	mv	a0,s1
   29014:	ffffd0ef          	jal	27012 <__sinit>
   29018:	0002a7b7          	lui	a5,0x2a
   2901c:	ae478793          	add	a5,a5,-1308 # 29ae4 <__sf_fake_stdin>
   29020:	02f41463          	bne	s0,a5,29048 <__swsetup_r+0x4e>
   29024:	40c0                	lw	s0,4(s1)
   29026:	00c41783          	lh	a5,12(s0)
   2902a:	0087f713          	and	a4,a5,8
   2902e:	eb35                	bnez	a4,290a2 <__swsetup_r+0xa8>
   29030:	0107f713          	and	a4,a5,16
   29034:	eb15                	bnez	a4,29068 <__swsetup_r+0x6e>
   29036:	4725                	li	a4,9
   29038:	00e92023          	sw	a4,0(s2)
   2903c:	0407e793          	or	a5,a5,64
   29040:	00f41623          	sh	a5,12(s0)
   29044:	557d                	li	a0,-1
   29046:	a869                	j	290e0 <__swsetup_r+0xe6>
   29048:	0002a7b7          	lui	a5,0x2a
   2904c:	ac478793          	add	a5,a5,-1340 # 29ac4 <__sf_fake_stdout>
   29050:	00f41463          	bne	s0,a5,29058 <__swsetup_r+0x5e>
   29054:	4480                	lw	s0,8(s1)
   29056:	bfc1                	j	29026 <__swsetup_r+0x2c>
   29058:	0002a7b7          	lui	a5,0x2a
   2905c:	aa478793          	add	a5,a5,-1372 # 29aa4 <__sf_fake_stderr>
   29060:	fcf413e3          	bne	s0,a5,29026 <__swsetup_r+0x2c>
   29064:	44c0                	lw	s0,12(s1)
   29066:	b7c1                	j	29026 <__swsetup_r+0x2c>
   29068:	8b91                	and	a5,a5,4
   2906a:	c795                	beqz	a5,29096 <__swsetup_r+0x9c>
   2906c:	584c                	lw	a1,52(s0)
   2906e:	c991                	beqz	a1,29082 <__swsetup_r+0x88>
   29070:	04440793          	add	a5,s0,68
   29074:	00f58563          	beq	a1,a5,2907e <__swsetup_r+0x84>
   29078:	854a                	mv	a0,s2
   2907a:	d5aff0ef          	jal	285d4 <_free_r>
   2907e:	02042a23          	sw	zero,52(s0)
   29082:	00c45783          	lhu	a5,12(s0)
   29086:	00042223          	sw	zero,4(s0)
   2908a:	fdb7f793          	and	a5,a5,-37
   2908e:	00f41623          	sh	a5,12(s0)
   29092:	481c                	lw	a5,16(s0)
   29094:	c01c                	sw	a5,0(s0)
   29096:	00c45783          	lhu	a5,12(s0)
   2909a:	0087e793          	or	a5,a5,8
   2909e:	00f41623          	sh	a5,12(s0)
   290a2:	481c                	lw	a5,16(s0)
   290a4:	ef89                	bnez	a5,290be <__swsetup_r+0xc4>
   290a6:	00c45783          	lhu	a5,12(s0)
   290aa:	20000713          	li	a4,512
   290ae:	2807f793          	and	a5,a5,640
   290b2:	00e78663          	beq	a5,a4,290be <__swsetup_r+0xc4>
   290b6:	85a2                	mv	a1,s0
   290b8:	854a                	mv	a0,s2
   290ba:	8a9fe0ef          	jal	27962 <__smakebuf_r>
   290be:	00c41783          	lh	a5,12(s0)
   290c2:	0017f713          	and	a4,a5,1
   290c6:	c31d                	beqz	a4,290ec <__swsetup_r+0xf2>
   290c8:	4858                	lw	a4,20(s0)
   290ca:	00042423          	sw	zero,8(s0)
   290ce:	40e00733          	neg	a4,a4
   290d2:	cc18                	sw	a4,24(s0)
   290d4:	4818                	lw	a4,16(s0)
   290d6:	4501                	li	a0,0
   290d8:	e701                	bnez	a4,290e0 <__swsetup_r+0xe6>
   290da:	0807f713          	and	a4,a5,128
   290de:	ff39                	bnez	a4,2903c <__swsetup_r+0x42>
   290e0:	40b2                	lw	ra,12(sp)
   290e2:	4422                	lw	s0,8(sp)
   290e4:	4492                	lw	s1,4(sp)
   290e6:	4902                	lw	s2,0(sp)
   290e8:	0141                	add	sp,sp,16
   290ea:	8082                	ret
   290ec:	0027f713          	and	a4,a5,2
   290f0:	4681                	li	a3,0
   290f2:	e311                	bnez	a4,290f6 <__swsetup_r+0xfc>
   290f4:	4854                	lw	a3,20(s0)
   290f6:	c414                	sw	a3,8(s0)
   290f8:	bff1                	j	290d4 <__swsetup_r+0xda>

000290fa <__assert_func>:
   290fa:	9cc1a783          	lw	a5,-1588(gp) # a01cc <_impure_ptr>
   290fe:	1141                	add	sp,sp,-16
   29100:	8832                	mv	a6,a2
   29102:	c606                	sw	ra,12(sp)
   29104:	88aa                	mv	a7,a0
   29106:	872e                	mv	a4,a1
   29108:	47c8                	lw	a0,12(a5)
   2910a:	8636                	mv	a2,a3
   2910c:	00080d63          	beqz	a6,29126 <__assert_func+0x2c>
   29110:	000297b7          	lui	a5,0x29
   29114:	72878793          	add	a5,a5,1832 # 29728 <__clz_tab+0x2c8>
   29118:	000295b7          	lui	a1,0x29
   2911c:	86c6                	mv	a3,a7
   2911e:	73858593          	add	a1,a1,1848 # 29738 <__clz_tab+0x2d8>
   29122:	2835                	jal	2915e <fiprintf>
   29124:	2a61                	jal	292bc <abort>
   29126:	00029837          	lui	a6,0x29
   2912a:	73480793          	add	a5,a6,1844 # 29734 <__clz_tab+0x2d4>
   2912e:	73480813          	add	a6,a6,1844
   29132:	b7dd                	j	29118 <__assert_func+0x1e>

00029134 <_close_r>:
   29134:	1141                	add	sp,sp,-16
   29136:	c422                	sw	s0,8(sp)
   29138:	c226                	sw	s1,4(sp)
   2913a:	842a                	mv	s0,a0
   2913c:	852e                	mv	a0,a1
   2913e:	c606                	sw	ra,12(sp)
   29140:	9e01a823          	sw	zero,-1552(gp) # a01f0 <errno>
   29144:	2c05                	jal	29374 <_close>
   29146:	57fd                	li	a5,-1
   29148:	00f51663          	bne	a0,a5,29154 <_close_r+0x20>
   2914c:	9f01a783          	lw	a5,-1552(gp) # a01f0 <errno>
   29150:	c391                	beqz	a5,29154 <_close_r+0x20>
   29152:	c01c                	sw	a5,0(s0)
   29154:	40b2                	lw	ra,12(sp)
   29156:	4422                	lw	s0,8(sp)
   29158:	4492                	lw	s1,4(sp)
   2915a:	0141                	add	sp,sp,16
   2915c:	8082                	ret

0002915e <fiprintf>:
   2915e:	7139                	add	sp,sp,-64
   29160:	da3e                	sw	a5,52(sp)
   29162:	d432                	sw	a2,40(sp)
   29164:	862e                	mv	a2,a1
   29166:	85aa                	mv	a1,a0
   29168:	9cc1a503          	lw	a0,-1588(gp) # a01cc <_impure_ptr>
   2916c:	d636                	sw	a3,44(sp)
   2916e:	1034                	add	a3,sp,40
   29170:	ce06                	sw	ra,28(sp)
   29172:	d83a                	sw	a4,48(sp)
   29174:	dc42                	sw	a6,56(sp)
   29176:	de46                	sw	a7,60(sp)
   29178:	c636                	sw	a3,12(sp)
   2917a:	9a5ff0ef          	jal	28b1e <_vfiprintf_r>
   2917e:	40f2                	lw	ra,28(sp)
   29180:	6121                	add	sp,sp,64
   29182:	8082                	ret

00029184 <_fstat_r>:
   29184:	1141                	add	sp,sp,-16
   29186:	c422                	sw	s0,8(sp)
   29188:	c226                	sw	s1,4(sp)
   2918a:	842a                	mv	s0,a0
   2918c:	852e                	mv	a0,a1
   2918e:	85b2                	mv	a1,a2
   29190:	c606                	sw	ra,12(sp)
   29192:	9e01a823          	sw	zero,-1552(gp) # a01f0 <errno>
   29196:	830fb0ef          	jal	241c6 <_fstat>
   2919a:	57fd                	li	a5,-1
   2919c:	00f51663          	bne	a0,a5,291a8 <_fstat_r+0x24>
   291a0:	9f01a783          	lw	a5,-1552(gp) # a01f0 <errno>
   291a4:	c391                	beqz	a5,291a8 <_fstat_r+0x24>
   291a6:	c01c                	sw	a5,0(s0)
   291a8:	40b2                	lw	ra,12(sp)
   291aa:	4422                	lw	s0,8(sp)
   291ac:	4492                	lw	s1,4(sp)
   291ae:	0141                	add	sp,sp,16
   291b0:	8082                	ret

000291b2 <_isatty_r>:
   291b2:	1141                	add	sp,sp,-16
   291b4:	c422                	sw	s0,8(sp)
   291b6:	c226                	sw	s1,4(sp)
   291b8:	842a                	mv	s0,a0
   291ba:	852e                	mv	a0,a1
   291bc:	c606                	sw	ra,12(sp)
   291be:	9e01a823          	sw	zero,-1552(gp) # a01f0 <errno>
   291c2:	2409                	jal	293c4 <_isatty>
   291c4:	57fd                	li	a5,-1
   291c6:	00f51663          	bne	a0,a5,291d2 <_isatty_r+0x20>
   291ca:	9f01a783          	lw	a5,-1552(gp) # a01f0 <errno>
   291ce:	c391                	beqz	a5,291d2 <_isatty_r+0x20>
   291d0:	c01c                	sw	a5,0(s0)
   291d2:	40b2                	lw	ra,12(sp)
   291d4:	4422                	lw	s0,8(sp)
   291d6:	4492                	lw	s1,4(sp)
   291d8:	0141                	add	sp,sp,16
   291da:	8082                	ret

000291dc <_lseek_r>:
   291dc:	1141                	add	sp,sp,-16
   291de:	c422                	sw	s0,8(sp)
   291e0:	c226                	sw	s1,4(sp)
   291e2:	842a                	mv	s0,a0
   291e4:	852e                	mv	a0,a1
   291e6:	85b2                	mv	a1,a2
   291e8:	8636                	mv	a2,a3
   291ea:	c606                	sw	ra,12(sp)
   291ec:	9e01a823          	sw	zero,-1552(gp) # a01f0 <errno>
   291f0:	2421                	jal	293f8 <_lseek>
   291f2:	57fd                	li	a5,-1
   291f4:	00f51663          	bne	a0,a5,29200 <_lseek_r+0x24>
   291f8:	9f01a783          	lw	a5,-1552(gp) # a01f0 <errno>
   291fc:	c391                	beqz	a5,29200 <_lseek_r+0x24>
   291fe:	c01c                	sw	a5,0(s0)
   29200:	40b2                	lw	ra,12(sp)
   29202:	4422                	lw	s0,8(sp)
   29204:	4492                	lw	s1,4(sp)
   29206:	0141                	add	sp,sp,16
   29208:	8082                	ret

0002920a <__malloc_lock>:
   2920a:	8082                	ret

0002920c <__malloc_unlock>:
   2920c:	8082                	ret

0002920e <_realloc_r>:
   2920e:	1101                	add	sp,sp,-32
   29210:	cc22                	sw	s0,24(sp)
   29212:	ce06                	sw	ra,28(sp)
   29214:	ca26                	sw	s1,20(sp)
   29216:	c84a                	sw	s2,16(sp)
   29218:	c64e                	sw	s3,12(sp)
   2921a:	c452                	sw	s4,8(sp)
   2921c:	8432                	mv	s0,a2
   2921e:	e999                	bnez	a1,29234 <_realloc_r+0x26>
   29220:	4462                	lw	s0,24(sp)
   29222:	40f2                	lw	ra,28(sp)
   29224:	44d2                	lw	s1,20(sp)
   29226:	4942                	lw	s2,16(sp)
   29228:	49b2                	lw	s3,12(sp)
   2922a:	4a22                	lw	s4,8(sp)
   2922c:	85b2                	mv	a1,a2
   2922e:	6105                	add	sp,sp,32
   29230:	c46ff06f          	j	28676 <_malloc_r>
   29234:	ee09                	bnez	a2,2924e <_realloc_r+0x40>
   29236:	b9eff0ef          	jal	285d4 <_free_r>
   2923a:	4481                	li	s1,0
   2923c:	40f2                	lw	ra,28(sp)
   2923e:	4462                	lw	s0,24(sp)
   29240:	4942                	lw	s2,16(sp)
   29242:	49b2                	lw	s3,12(sp)
   29244:	4a22                	lw	s4,8(sp)
   29246:	8526                	mv	a0,s1
   29248:	44d2                	lw	s1,20(sp)
   2924a:	6105                	add	sp,sp,32
   2924c:	8082                	ret
   2924e:	8a2a                	mv	s4,a0
   29250:	84ae                	mv	s1,a1
   29252:	289d                	jal	292c8 <_malloc_usable_size_r>
   29254:	892a                	mv	s2,a0
   29256:	00856663          	bltu	a0,s0,29262 <_realloc_r+0x54>
   2925a:	00155793          	srl	a5,a0,0x1
   2925e:	fc87efe3          	bltu	a5,s0,2923c <_realloc_r+0x2e>
   29262:	85a2                	mv	a1,s0
   29264:	8552                	mv	a0,s4
   29266:	c10ff0ef          	jal	28676 <_malloc_r>
   2926a:	89aa                	mv	s3,a0
   2926c:	e119                	bnez	a0,29272 <_realloc_r+0x64>
   2926e:	84ce                	mv	s1,s3
   29270:	b7f1                	j	2923c <_realloc_r+0x2e>
   29272:	8622                	mv	a2,s0
   29274:	00897363          	bgeu	s2,s0,2927a <_realloc_r+0x6c>
   29278:	864a                	mv	a2,s2
   2927a:	85a6                	mv	a1,s1
   2927c:	854e                	mv	a0,s3
   2927e:	b25f80ef          	jal	21da2 <memcpy>
   29282:	85a6                	mv	a1,s1
   29284:	8552                	mv	a0,s4
   29286:	b4eff0ef          	jal	285d4 <_free_r>
   2928a:	b7d5                	j	2926e <_realloc_r+0x60>

0002928c <_read_r>:
   2928c:	1141                	add	sp,sp,-16
   2928e:	c422                	sw	s0,8(sp)
   29290:	c226                	sw	s1,4(sp)
   29292:	842a                	mv	s0,a0
   29294:	852e                	mv	a0,a1
   29296:	85b2                	mv	a1,a2
   29298:	8636                	mv	a2,a3
   2929a:	c606                	sw	ra,12(sp)
   2929c:	9e01a823          	sw	zero,-1552(gp) # a01f0 <errno>
   292a0:	f07fa0ef          	jal	241a6 <_read>
   292a4:	57fd                	li	a5,-1
   292a6:	00f51663          	bne	a0,a5,292b2 <_read_r+0x26>
   292aa:	9f01a783          	lw	a5,-1552(gp) # a01f0 <errno>
   292ae:	c391                	beqz	a5,292b2 <_read_r+0x26>
   292b0:	c01c                	sw	a5,0(s0)
   292b2:	40b2                	lw	ra,12(sp)
   292b4:	4422                	lw	s0,8(sp)
   292b6:	4492                	lw	s1,4(sp)
   292b8:	0141                	add	sp,sp,16
   292ba:	8082                	ret

000292bc <abort>:
   292bc:	1141                	add	sp,sp,-16
   292be:	4519                	li	a0,6
   292c0:	c606                	sw	ra,12(sp)
   292c2:	28ad                	jal	2933c <raise>
   292c4:	4505                	li	a0,1
   292c6:	28e1                	jal	2939e <_exit>

000292c8 <_malloc_usable_size_r>:
   292c8:	ffc5a783          	lw	a5,-4(a1)
   292cc:	ffc78513          	add	a0,a5,-4
   292d0:	0007d563          	bgez	a5,292da <_malloc_usable_size_r+0x12>
   292d4:	95aa                	add	a1,a1,a0
   292d6:	419c                	lw	a5,0(a1)
   292d8:	953e                	add	a0,a0,a5
   292da:	8082                	ret

000292dc <_raise_r>:
   292dc:	1101                	add	sp,sp,-32
   292de:	cc22                	sw	s0,24(sp)
   292e0:	ce06                	sw	ra,28(sp)
   292e2:	47fd                	li	a5,31
   292e4:	842a                	mv	s0,a0
   292e6:	00b7f963          	bgeu	a5,a1,292f8 <_raise_r+0x1c>
   292ea:	47d9                	li	a5,22
   292ec:	c11c                	sw	a5,0(a0)
   292ee:	557d                	li	a0,-1
   292f0:	40f2                	lw	ra,28(sp)
   292f2:	4462                	lw	s0,24(sp)
   292f4:	6105                	add	sp,sp,32
   292f6:	8082                	ret
   292f8:	417c                	lw	a5,68(a0)
   292fa:	862e                	mv	a2,a1
   292fc:	c791                	beqz	a5,29308 <_raise_r+0x2c>
   292fe:	00259713          	sll	a4,a1,0x2
   29302:	97ba                	add	a5,a5,a4
   29304:	4398                	lw	a4,0(a5)
   29306:	eb19                	bnez	a4,2931c <_raise_r+0x40>
   29308:	8522                	mv	a0,s0
   2930a:	c632                	sw	a2,12(sp)
   2930c:	209d                	jal	29372 <_getpid_r>
   2930e:	85aa                	mv	a1,a0
   29310:	8522                	mv	a0,s0
   29312:	4462                	lw	s0,24(sp)
   29314:	4632                	lw	a2,12(sp)
   29316:	40f2                	lw	ra,28(sp)
   29318:	6105                	add	sp,sp,32
   2931a:	a035                	j	29346 <_kill_r>
   2931c:	4685                	li	a3,1
   2931e:	00d70d63          	beq	a4,a3,29338 <_raise_r+0x5c>
   29322:	56fd                	li	a3,-1
   29324:	00d71663          	bne	a4,a3,29330 <_raise_r+0x54>
   29328:	47d9                	li	a5,22
   2932a:	c11c                	sw	a5,0(a0)
   2932c:	4505                	li	a0,1
   2932e:	b7c9                	j	292f0 <_raise_r+0x14>
   29330:	0007a023          	sw	zero,0(a5)
   29334:	852e                	mv	a0,a1
   29336:	9702                	jalr	a4
   29338:	4501                	li	a0,0
   2933a:	bf5d                	j	292f0 <_raise_r+0x14>

0002933c <raise>:
   2933c:	85aa                	mv	a1,a0
   2933e:	9cc1a503          	lw	a0,-1588(gp) # a01cc <_impure_ptr>
   29342:	f9bff06f          	j	292dc <_raise_r>

00029346 <_kill_r>:
   29346:	1141                	add	sp,sp,-16
   29348:	c422                	sw	s0,8(sp)
   2934a:	c226                	sw	s1,4(sp)
   2934c:	842a                	mv	s0,a0
   2934e:	852e                	mv	a0,a1
   29350:	85b2                	mv	a1,a2
   29352:	c606                	sw	ra,12(sp)
   29354:	9e01a823          	sw	zero,-1552(gp) # a01f0 <errno>
   29358:	2071                	jal	293e4 <_kill>
   2935a:	57fd                	li	a5,-1
   2935c:	00f51663          	bne	a0,a5,29368 <_kill_r+0x22>
   29360:	9f01a783          	lw	a5,-1552(gp) # a01f0 <errno>
   29364:	c391                	beqz	a5,29368 <_kill_r+0x22>
   29366:	c01c                	sw	a5,0(s0)
   29368:	40b2                	lw	ra,12(sp)
   2936a:	4422                	lw	s0,8(sp)
   2936c:	4492                	lw	s1,4(sp)
   2936e:	0141                	add	sp,sp,16
   29370:	8082                	ret

00029372 <_getpid_r>:
   29372:	a0b9                	j	293c0 <_getpid>

00029374 <_close>:
   29374:	1141                	add	sp,sp,-16
   29376:	c606                	sw	ra,12(sp)
   29378:	c422                	sw	s0,8(sp)
   2937a:	03900893          	li	a7,57
   2937e:	00000073          	ecall
   29382:	842a                	mv	s0,a0
   29384:	00055863          	bgez	a0,29394 <_close+0x20>
   29388:	40800433          	neg	s0,s0
   2938c:	e43fa0ef          	jal	241ce <__errno>
   29390:	c100                	sw	s0,0(a0)
   29392:	547d                	li	s0,-1
   29394:	40b2                	lw	ra,12(sp)
   29396:	8522                	mv	a0,s0
   29398:	4422                	lw	s0,8(sp)
   2939a:	0141                	add	sp,sp,16
   2939c:	8082                	ret

0002939e <_exit>:
   2939e:	05d00893          	li	a7,93
   293a2:	00000073          	ecall
   293a6:	00055c63          	bgez	a0,293be <_exit+0x20>
   293aa:	1141                	add	sp,sp,-16
   293ac:	c422                	sw	s0,8(sp)
   293ae:	842a                	mv	s0,a0
   293b0:	c606                	sw	ra,12(sp)
   293b2:	40800433          	neg	s0,s0
   293b6:	e19fa0ef          	jal	241ce <__errno>
   293ba:	c100                	sw	s0,0(a0)
   293bc:	a001                	j	293bc <_exit+0x1e>
   293be:	a001                	j	293be <_exit+0x20>

000293c0 <_getpid>:
   293c0:	4505                	li	a0,1
   293c2:	8082                	ret

000293c4 <_isatty>:
   293c4:	7159                	add	sp,sp,-112
   293c6:	002c                	add	a1,sp,8
   293c8:	d686                	sw	ra,108(sp)
   293ca:	dfdfa0ef          	jal	241c6 <_fstat>
   293ce:	57fd                	li	a5,-1
   293d0:	00f50863          	beq	a0,a5,293e0 <_isatty+0x1c>
   293d4:	4532                	lw	a0,12(sp)
   293d6:	8135                	srl	a0,a0,0xd
   293d8:	8905                	and	a0,a0,1
   293da:	50b6                	lw	ra,108(sp)
   293dc:	6165                	add	sp,sp,112
   293de:	8082                	ret
   293e0:	4501                	li	a0,0
   293e2:	bfe5                	j	293da <_isatty+0x16>

000293e4 <_kill>:
   293e4:	1141                	add	sp,sp,-16
   293e6:	c606                	sw	ra,12(sp)
   293e8:	de7fa0ef          	jal	241ce <__errno>
   293ec:	40b2                	lw	ra,12(sp)
   293ee:	47d9                	li	a5,22
   293f0:	c11c                	sw	a5,0(a0)
   293f2:	557d                	li	a0,-1
   293f4:	0141                	add	sp,sp,16
   293f6:	8082                	ret

000293f8 <_lseek>:
   293f8:	1141                	add	sp,sp,-16
   293fa:	c606                	sw	ra,12(sp)
   293fc:	c422                	sw	s0,8(sp)
   293fe:	03e00893          	li	a7,62
   29402:	00000073          	ecall
   29406:	842a                	mv	s0,a0
   29408:	00055863          	bgez	a0,29418 <_lseek+0x20>
   2940c:	40800433          	neg	s0,s0
   29410:	dbffa0ef          	jal	241ce <__errno>
   29414:	c100                	sw	s0,0(a0)
   29416:	547d                	li	s0,-1
   29418:	40b2                	lw	ra,12(sp)
   2941a:	8522                	mv	a0,s0
   2941c:	4422                	lw	s0,8(sp)
   2941e:	0141                	add	sp,sp,16
   29420:	8082                	ret
   29422:	0000                	unimp
   29424:	1150                	add	a2,sp,164
   29426:	0002                	c.slli64	zero
   29428:	1204                	add	s1,sp,288
   2942a:	0002                	c.slli64	zero
   2942c:	115a                	sll	sp,sp,0x36
   2942e:	0002                	c.slli64	zero
   29430:	1204                	add	s1,sp,288
   29432:	0002                	c.slli64	zero
   29434:	115e                	sll	sp,sp,0x37
   29436:	0002                	c.slli64	zero
   29438:	1204                	add	s1,sp,288
   2943a:	0002                	c.slli64	zero
   2943c:	115a                	sll	sp,sp,0x36
   2943e:	0002                	c.slli64	zero
   29440:	1150                	add	a2,sp,164
   29442:	0002                	c.slli64	zero
   29444:	1150                	add	a2,sp,164
   29446:	0002                	c.slli64	zero
   29448:	115e                	sll	sp,sp,0x37
   2944a:	0002                	c.slli64	zero
   2944c:	115a                	sll	sp,sp,0x36
   2944e:	0002                	c.slli64	zero
   29450:	1136                	sll	sp,sp,0x2d
   29452:	0002                	c.slli64	zero
   29454:	1136                	sll	sp,sp,0x2d
   29456:	0002                	c.slli64	zero
   29458:	1136                	sll	sp,sp,0x2d
   2945a:	0002                	c.slli64	zero
   2945c:	115e                	sll	sp,sp,0x37
   2945e:	0002                	c.slli64	zero

00029460 <__clz_tab>:
   29460:	0100 0202 0303 0303 0404 0404 0404 0404     ................
   29470:	0505 0505 0505 0505 0505 0505 0505 0505     ................
   29480:	0606 0606 0606 0606 0606 0606 0606 0606     ................
   29490:	0606 0606 0606 0606 0606 0606 0606 0606     ................
   294a0:	0707 0707 0707 0707 0707 0707 0707 0707     ................
   294b0:	0707 0707 0707 0707 0707 0707 0707 0707     ................
   294c0:	0707 0707 0707 0707 0707 0707 0707 0707     ................
   294d0:	0707 0707 0707 0707 0707 0707 0707 0707     ................
   294e0:	0808 0808 0808 0808 0808 0808 0808 0808     ................
   294f0:	0808 0808 0808 0808 0808 0808 0808 0808     ................
   29500:	0808 0808 0808 0808 0808 0808 0808 0808     ................
   29510:	0808 0808 0808 0808 0808 0808 0808 0808     ................
   29520:	0808 0808 0808 0808 0808 0808 0808 0808     ................
   29530:	0808 0808 0808 0808 0808 0808 0808 0808     ................
   29540:	0808 0808 0808 0808 0808 0808 0808 0808     ................
   29550:	0808 0808 0808 0808 0808 0808 0808 0808     ................
   29560:	7068 366d 3832 6434 6d65 006f 6548 6c6c     hpm6284demo.Hell
   29570:	206f 6f77 6c72 2064 7266 6d6f 2520 2073     o world from %s 
   29580:	6f63 6572 2131 000a 4e49 0046 6e69 0066     core1!..INF.inf.
   29590:	414e 004e 616e 006e 0030 0000 3130 3332     NAN.nan.0...0123
   295a0:	3534 3736 3938 4241 4443 4645 0000 0000     456789ABCDEF....
   295b0:	3130 3332 3534 3736 3938 6261 6463 6665     0123456789abcdef
   295c0:	0000 0000 2565 646c 0000 0000 666e 0000     ....e%ld....nf..
   295d0:	6e69 7469 0079 0000 6e61 0000 6e49 6966     inity...an..Infi
   295e0:	696e 7974 0000 0000 614e 004e 4552 4e45     nity....NaN.REEN
   295f0:	2054 616d 6c6c 636f 7320 6375 6563 6465     T malloc succeed
   29600:	6465 0000 682f 6d6f 2f65 7562 6c69 6564     ed../home/builde
   29610:	2f72 6572 6f70 2f73 6972 6373 2d76 6e67     r/repos/riscv-gn
   29620:	2d75 6f74 6c6f 6863 6961 2f6e 656e 6c77     u-toolchain/newl
   29630:	6269 6e2f 7765 696c 2f62 696c 6362 732f     ib/newlib/libc/s
   29640:	6474 696c 2f62 7464 616f 632e 0000 0000     tdlib/dtoa.c....
   29650:	6142 6c6c 636f 7320 6375 6563 6465 6465     Balloc succeeded
   29660:	0000 0000 682f 6d6f 2f65 7562 6c69 6564     ..../home/builde
   29670:	2f72 6572 6f70 2f73 6972 6373 2d76 6e67     r/repos/riscv-gn
   29680:	2d75 6f74 6c6f 6863 6961 2f6e 656e 6c77     u-toolchain/newl
   29690:	6269 6e2f 7765 696c 2f62 696c 6362 732f     ib/newlib/libc/s
   296a0:	6474 696c 2f62 6467 6f74 2d61 6567 6874     tdlib/gdtoa-geth
   296b0:	7865 632e 0000 0000 002e 0000 0043 0000     ex.c........C...
   296c0:	4f50 4953 0058 0000 682f 6d6f 2f65 7562     POSIX.../home/bu
   296d0:	6c69 6564 2f72 6572 6f70 2f73 6972 6373     ilder/repos/risc
   296e0:	2d76 6e67 2d75 6f74 6c6f 6863 6961 2f6e     v-gnu-toolchain/
   296f0:	656e 6c77 6269 6e2f 7765 696c 2f62 696c     newlib/newlib/li
   29700:	6362 732f 6474 696c 2f62 706d 6572 2e63     bc/stdlib/mprec.
   29710:	0063 0000 2d23 2b30 0020 0000 6c68 004c     c...#-0+ ...hlL.
   29720:	6665 4567 4746 0000 202c 7566 636e 6974     efgEFG.., functi
   29730:	6e6f 203a 0000 0000 7361 6573 7472 6f69     on: ....assertio
   29740:	206e 2522 2273 6620 6961 656c 3a64 6620     n "%s" failed: f
   29750:	6c69 2065 2522 2273 202c 696c 656e 2520     ile "%s", line %
   29760:	2564 2573 0a73 0000 36e6 0002 3656 0002     d%s%s....6..V6..
   29770:	366e 0002 3686 0002 369e 0002 36b6 0002     n6...6...6...6..
   29780:	36ce 0002 363e 0002 3706 0002 3710 0002     .6..>6...7...7..
   29790:	371c 0002 3728 0002 3734 0002 3740 0002     .7..(7..47..@7..
   297a0:	374c 0002 3758 0002 37a0 0002 37bc 0002     L7..X7...7...7..
   297b0:	3798 0002 381e 0002 3910 0002 386a 0002     .7...8...9..j8..
   297c0:	38a2 0002 3790 0002 3798 0002 38ca 0002     .8...7...7...8..
   297d0:	38f0 0002 38f8 0002 3bb2 0002 3c94 0002     .8...8...;...<..
   297e0:	3c8e 0002 3c74 0002 3bae 0002 3da2 0002     .<..t<...;...=..
   297f0:	3da8 0002 3dae 0002 3db4 0002 3dba 0002     .=...=...=...=..
   29800:	3dc0 0002 3dc6 0002 3dcc 0002 3dd2 0002     .=...=...=...=..
   29810:	3dd8 0002 3dde 0002 3de4 0002 3dea 0002     .=...=...=...=..
   29820:	3df0 0002 3d9c 0002 3d96 0002 3f7c 0002     .=...=...=..|?..
   29830:	3f70 0002 3f6a 0002 3f4c 0002 3f46 0002     p?..j?..L?..F?..
   29840:	3f40 0002 3f3a 0002 3f1c 0002 3f16 0002     @?..:?...?...?..
   29850:	3f10 0002 3f0a 0002 3eec 0002 3ee6 0002     .?...?...>...>..
   29860:	3ee0 0002 3ea6 0002 3f76 0002 4994 0002     .>...>..v?...I..
   29870:	49aa 0002 496c 0002 496c 0002 496c 0002     .I..lI..lI..lI..
   29880:	496c 0002 49aa 0002 496c 0002 496c 0002     lI...I..lI..lI..
   29890:	496c 0002 496c 0002 4af0 0002 49e8 0002     lI..lI...J...I..
   298a0:	4a94 0002 496c 0002 496c 0002 4b20 0002     .J..lI..lI.. K..
   298b0:	496c 0002 49e8 0002 496c 0002 496c 0002     lI...I..lI..lI..
   298c0:	4a9c 0002 4d6a 0002 4c28 0002 4c28 0002     .J..jM..(L..(L..
   298d0:	4c28 0002 4dc8 0002 4da0 0002 4c28 0002     (L...M...M..(L..
   298e0:	4c28 0002 4d74 0002 4c28 0002 4c28 0002     (L..tM..(L..(L..
   298f0:	4c28 0002 4c28 0002 4d30 0002 4d20 0002     (L..(L..0M.. M..
   29900:	4c28 0002 4d20 0002 4db4 0002 4c28 0002     (L.. M...M..(L..
   29910:	4cc6 0002 4d06 0002 4d06 0002 4d06 0002     .L...M...M...M..
   29920:	4d06 0002 4d06 0002 4d06 0002 4d06 0002     .M...M...M...M..
   29930:	4d06 0002 4d06 0002 53d6 0002 53c2 0002     .M...M...S...S..
   29940:	53ec 0002 53f2 0002 53d6 0002               .S...S...S..

0002994c <fpinan.0>:
   2994c:	0034 0000 fbce ffff 03cb 0000 0001 0000     4...............
   2995c:	0000 0000                                   ....

00029960 <fpi.1>:
   29960:	0035 0000 fbce ffff 03cb 0000 0001 0000     5...............
	...

00029978 <tinytens>:
   29978:	89bc 97d8 d2b2 3c9c a733 d5a8 f623 3949     .......<3...#.I9
   29988:	a73d 44f4 0ffd 32a5 979d cf8c ba08 255b     =..D...2......[%
   29998:	6f43 64ac 0628 1168                         Co.d(.h.

000299a0 <_ctype_>:
   299a0:	2000 2020 2020 2020 2020 2828 2828 2028     .         ((((( 
   299b0:	2020 2020 2020 2020 2020 2020 2020 2020                     
   299c0:	8820 1010 1010 1010 1010 1010 1010 1010      ...............
   299d0:	0410 0404 0404 0404 0404 1004 1010 1010     ................
   299e0:	1010 4141 4141 4141 0101 0101 0101 0101     ..AAAAAA........
   299f0:	0101 0101 0101 0101 0101 0101 1010 1010     ................
   29a00:	1010 4242 4242 4242 0202 0202 0202 0202     ..BBBBBB........
   29a10:	0202 0202 0202 0202 0202 0202 1010 1010     ................
   29a20:	0020 0000 0000 0000 0000 0000 0000 0000      ...............
	...

00029aa4 <__sf_fake_stderr>:
	...

00029ac4 <__sf_fake_stdout>:
	...

00029ae4 <__sf_fake_stdin>:
	...

00029b04 <_C_numeric_locale>:
   29b04:	96b8 0002 9734 0002 01d0 000a               ....4.......

00029b10 <p05.0>:
   29b10:	0005 0000 0019 0000 007d 0000 0000 0000     ........}.......

00029b20 <__mprec_bigtens>:
   29b20:	8000 37e0 c379 4341 6e17 b505 b8b5 4693     ...7y.AC.n.....F
   29b30:	f9f5 e93f 4f03 4d38 1d32 f930 7748 5a82     ..?..O8M2.0.Hw.Z
   29b40:	bf3c 7f73 4fdd 7515                         <.s..O.u

00029b48 <__mprec_tens>:
   29b48:	0000 0000 0000 3ff0 0000 0000 0000 4024     .......?......$@
   29b58:	0000 0000 0000 4059 0000 0000 4000 408f     ......Y@.....@.@
   29b68:	0000 0000 8800 40c3 0000 0000 6a00 40f8     .......@.....j.@
   29b78:	0000 0000 8480 412e 0000 0000 12d0 4163     .......A......cA
   29b88:	0000 0000 d784 4197 0000 0000 cd65 41cd     .......A....e..A
   29b98:	0000 2000 a05f 4202 0000 e800 4876 4237     ... _..B....vH7B
   29ba8:	0000 a200 1a94 426d 0000 e540 309c 42a2     ......mB..@..0.B
   29bb8:	0000 1e90 bcc4 42d6 0000 2634 6bf5 430c     .......B..4&.k.C
   29bc8:	8000 37e0 c379 4341 a000 85d8 3457 4376     ...7y.AC....W4vC
   29bd8:	c800 674e c16d 43ab 3d00 6091 58e4 43e1     ..Ngm..C.=.`.X.C
   29be8:	8c40 78b5 af1d 4415 ef50 d6e2 1ae4 444b     @..x...DP.....KD
   29bf8:	d592 064d f0cf 4480 4af6 c7e1 2d02 44b5     ..M....D.J...-.D
   29c08:	9db4 79d9 7843 44ea                         ...yCx.D

00029c10 <s_wdgs>:
   29c10:	0000 f009 4000 f009                         .....@..

00029c18 <s_dac_clk_mux_node>:
   29c18:	001f 0000 00fe 0000                         ........

00029c20 <s_adc_clk_mux_node>:
   29c20:	001c 0000 00fe 0000                         ........

00029c28 <_global_impure_ptr>:
   29c28:	0000 000a 0000 0000 ffff ffff ffff 7fef     ................
   29c38:	0000 0000 0000 3fe0 0000 0000 0000 3ff0     .......?.......?
   29c48:	0000 0000 0000 4000 0000 ffc0 ffff 41df     .......@.......A
   29c58:	3595 94a0 ffff 3fdf e535 35af 0000 3fe0     .5.....?5..5...?
   29c68:	3595 94a0 ffff 3fcf 0000 0000 0000 3950     .5.....?......P9
   29c78:	0000 0000 0000 3ff8 4361 636f 87a7 3fd2     .......?aCoc...?
   29c88:	c8b3 8b60 8a28 3fc6 79fb 509f 4413 3fd3     ..`.(..?.y.P.D.?
   29c98:	0000 0000 0000 4024 0000 0000 0000 401c     ......$@.......@
   29ca8:	0000 0000 0000 4014 0000 0000 0000 7ff8     .......@........
   29cb8:	0000 7fc0 0000 0000                         ........
