
D:/v113test/sdk_env_v1.13.0/user_template/projects/dual_threadx/core1/dual_threadx_core0_hpm6e8ydemo_flash_xip_release/output/demo.elf:     file format elf32-littleriscv


Disassembly of section .start:

00040000 <_start>:
   40000:	01291197          	auipc	gp,0x1291
   40004:	80018193          	add	gp,gp,-2048 # 12d0800 <__global_pointer$>
   40008:	01290217          	auipc	tp,0x1290
   4000c:	1d020213          	add	tp,tp,464 # 12d01d8 <core1_thread_stack>
   40010:	30001073          	csrw	mstatus,zero
   40014:	00208297          	auipc	t0,0x208
   40018:	fec28293          	add	t0,t0,-20 # 248000 <_stack>
   4001c:	8116                	mv	sp,t0
   4001e:	487030ef          	jal	43ca4 <l1c_ic_enable>
   40022:	46b030ef          	jal	43c8c <l1c_dc_enable>
   40026:	491030ef          	jal	43cb6 <l1c_dc_invalidate_all>
   4002a:	63c030ef          	jal	43666 <c_startup>
   4002e:	594030ef          	jal	435c2 <__libc_init_array>
   40032:	5f2030ef          	jal	43624 <_clean_up>
   40036:	34005073          	csrw	mscratch,0
   4003a:	00001297          	auipc	t0,0x1
   4003e:	96a28293          	add	t0,t0,-1686 # 409a4 <tx_risc_v_trap_handler>
   40042:	30529073          	csrw	mtvec,t0
   40046:	7d017073          	csrc	0x7d0,2
   4004a:	405030ef          	jal	43c4e <reset_handler>
   4004e:	a001                	j	4004e <_start+0x4e>

00040050 <exit>:
   40050:	a001                	j	40050 <exit>
   40052:	0000                	unimp
   40054:	0000                	unimp
	...

Disassembly of section .vectors:

00040400 <nmi_handler>:
   40400:	a001                	j	40400 <nmi_handler>
   40402:	0001                	nop

00040404 <default_irq_handler>:
   40404:	a001                	j	40404 <default_irq_handler>
	...

00040408 <irq_handler_trap>:
   40408:	1101                	add	sp,sp,-32
   4040a:	ce06                	sw	ra,28(sp)
   4040c:	cc22                	sw	s0,24(sp)
   4040e:	ca26                	sw	s1,20(sp)
   40410:	c84a                	sw	s2,16(sp)
   40412:	c64e                	sw	s3,12(sp)
   40414:	342027f3          	csrr	a5,mcause
   40418:	34102473          	csrr	s0,mepc
   4041c:	8822                	mv	a6,s0
   4041e:	300029f3          	csrr	s3,mstatus
   40422:	7cb024f3          	csrr	s1,0x7cb
   40426:	7cd02973          	csrr	s2,0x7cd
   4042a:	01479713          	sll	a4,a5,0x14
   4042e:	8351                	srl	a4,a4,0x14
   40430:	0207c963          	bltz	a5,40462 <irq_handler_trap+0x5a>
   40434:	46ad                	li	a3,11
   40436:	04d70b63          	beq	a4,a3,4048c <irq_handler_trap+0x84>
   4043a:	85c2                	mv	a1,a6
   4043c:	853e                	mv	a0,a5
   4043e:	029030ef          	jal	43c66 <exception_handler>
   40442:	842a                	mv	s0,a0
   40444:	30099073          	csrw	mstatus,s3
   40448:	34141073          	csrw	mepc,s0
   4044c:	7cd91073          	csrw	0x7cd,s2
   40450:	7cb49073          	csrw	0x7cb,s1
   40454:	40f2                	lw	ra,28(sp)
   40456:	4462                	lw	s0,24(sp)
   40458:	44d2                	lw	s1,20(sp)
   4045a:	4942                	lw	s2,16(sp)
   4045c:	49b2                	lw	s3,12(sp)
   4045e:	6105                	add	sp,sp,32
   40460:	8082                	ret
   40462:	469d                	li	a3,7
   40464:	06d70963          	beq	a4,a3,404d6 <irq_handler_trap+0xce>
   40468:	46ad                	li	a3,11
   4046a:	02d70d63          	beq	a4,a3,404a4 <irq_handler_trap+0x9c>
   4046e:	468d                	li	a3,3
   40470:	fcd715e3          	bne	a4,a3,4043a <irq_handler_trap+0x32>
   40474:	c452                	sw	s4,8(sp)
   40476:	e6600a37          	lui	s4,0xe6600
   4047a:	004a2783          	lw	a5,4(s4) # e6600004 <__share_mem_end__+0xe5300004>
   4047e:	7e6030ef          	jal	43c64 <swi_isr>
   40482:	4785                	li	a5,1
   40484:	00fa2223          	sw	a5,4(s4)
   40488:	4a22                	lw	s4,8(sp)
   4048a:	bf6d                	j	40444 <irq_handler_trap+0x3c>
   4048c:	000447b7          	lui	a5,0x44
   40490:	c6078793          	add	a5,a5,-928 # 43c60 <syscall_handler>
   40494:	8736                	mv	a4,a3
   40496:	86b2                	mv	a3,a2
   40498:	862e                	mv	a2,a1
   4049a:	85aa                	mv	a1,a0
   4049c:	8546                	mv	a0,a7
   4049e:	9782                	jalr	a5
   404a0:	0411                	add	s0,s0,4
   404a2:	b74d                	j	40444 <irq_handler_trap+0x3c>
   404a4:	c452                	sw	s4,8(sp)
   404a6:	e4200a37          	lui	s4,0xe4200
   404aa:	c256                	sw	s5,4(sp)
   404ac:	004a2a83          	lw	s5,4(s4) # e4200004 <__share_mem_end__+0xe2f00004>
   404b0:	0a11                	add	s4,s4,4
   404b2:	020a8563          	beqz	s5,404dc <irq_handler_trap+0xd4>
   404b6:	47a1                	li	a5,8
   404b8:	3007a073          	csrs	mstatus,a5
   404bc:	000417b7          	lui	a5,0x41
   404c0:	c0078793          	add	a5,a5,-1024 # 40c00 <__vector_table>
   404c4:	20fac7b3          	sh2add	a5,s5,a5
   404c8:	439c                	lw	a5,0(a5)
   404ca:	9782                	jalr	a5
   404cc:	015a2023          	sw	s5,0(s4)
   404d0:	4a22                	lw	s4,8(sp)
   404d2:	4a92                	lw	s5,4(sp)
   404d4:	bf85                	j	40444 <irq_handler_trap+0x3c>
   404d6:	78c030ef          	jal	43c62 <mchtmr_isr>
   404da:	b7ad                	j	40444 <irq_handler_trap+0x3c>
   404dc:	4a22                	lw	s4,8(sp)
   404de:	4a92                	lw	s5,4(sp)
   404e0:	b795                	j	40444 <irq_handler_trap+0x3c>
	...

000404e4 <_tx_thread_context_restore>:
   404e4:	30047073          	csrc	mstatus,8
   404e8:	9cc18293          	add	t0,gp,-1588 # 12d01cc <_tx_thread_system_state>
   404ec:	0002a303          	lw	t1,0(t0)
   404f0:	137d                	add	t1,t1,-1
   404f2:	0062a023          	sw	t1,0(t0)
   404f6:	04030463          	beqz	t1,4053e <_tx_thread_not_nested_restore>
   404fa:	42aa                	lw	t0,136(sp)
   404fc:	7cb29073          	csrw	0x7cb,t0
   40500:	42ba                	lw	t0,140(sp)
   40502:	7cd29073          	csrw	0x7cd,t0
   40506:	52e6                	lw	t0,120(sp)
   40508:	34129073          	csrw	mepc,t0
   4050c:	6289                	lui	t0,0x2
   4050e:	88028293          	add	t0,t0,-1920 # 1880 <RISCV_MEIE_MTIE+0x1000>
   40512:	30029073          	csrw	mstatus,t0
   40516:	50c6                	lw	ra,112(sp)
   40518:	42b6                	lw	t0,76(sp)
   4051a:	4326                	lw	t1,72(sp)
   4051c:	4396                	lw	t2,68(sp)
   4051e:	5442                	lw	s0,48(sp)
   40520:	5536                	lw	a0,108(sp)
   40522:	55a6                	lw	a1,104(sp)
   40524:	5616                	lw	a2,100(sp)
   40526:	5686                	lw	a3,96(sp)
   40528:	4776                	lw	a4,92(sp)
   4052a:	47e6                	lw	a5,88(sp)
   4052c:	4856                	lw	a6,84(sp)
   4052e:	48c6                	lw	a7,80(sp)
   40530:	4e06                	lw	t3,64(sp)
   40532:	5ef2                	lw	t4,60(sp)
   40534:	5f62                	lw	t5,56(sp)
   40536:	5fd2                	lw	t6,52(sp)
   40538:	610d                	add	sp,sp,160
   4053a:	30200073          	mret

0004053e <_tx_thread_not_nested_restore>:
   4053e:	4a81a303          	lw	t1,1192(gp) # 12d0ca8 <_tx_thread_current_ptr>
   40542:	0a030663          	beqz	t1,405ee <_tx_thread_idle_system_restore>
   40546:	48c1a383          	lw	t2,1164(gp) # 12d0c8c <_tx_thread_preempt_disable>
   4054a:	00704663          	bgtz	t2,40556 <_tx_thread_no_preempt_restore>
   4054e:	4a41a383          	lw	t2,1188(gp) # 12d0ca4 <_tx_thread_execute_ptr>
   40552:	04731663          	bne	t1,t2,4059e <_tx_thread_preempt_restore>

00040556 <_tx_thread_no_preempt_restore>:
   40556:	00832103          	lw	sp,8(t1)
   4055a:	42aa                	lw	t0,136(sp)
   4055c:	7cb29073          	csrw	0x7cb,t0
   40560:	42ba                	lw	t0,140(sp)
   40562:	7cd29073          	csrw	0x7cd,t0
   40566:	52e6                	lw	t0,120(sp)
   40568:	34129073          	csrw	mepc,t0
   4056c:	6289                	lui	t0,0x2
   4056e:	88028293          	add	t0,t0,-1920 # 1880 <RISCV_MEIE_MTIE+0x1000>
   40572:	30029073          	csrw	mstatus,t0
   40576:	50c6                	lw	ra,112(sp)
   40578:	42b6                	lw	t0,76(sp)
   4057a:	4326                	lw	t1,72(sp)
   4057c:	4396                	lw	t2,68(sp)
   4057e:	5442                	lw	s0,48(sp)
   40580:	5536                	lw	a0,108(sp)
   40582:	55a6                	lw	a1,104(sp)
   40584:	5616                	lw	a2,100(sp)
   40586:	5686                	lw	a3,96(sp)
   40588:	4776                	lw	a4,92(sp)
   4058a:	47e6                	lw	a5,88(sp)
   4058c:	4856                	lw	a6,84(sp)
   4058e:	48c6                	lw	a7,80(sp)
   40590:	4e06                	lw	t3,64(sp)
   40592:	5ef2                	lw	t4,60(sp)
   40594:	5f62                	lw	t5,56(sp)
   40596:	5fd2                	lw	t6,52(sp)
   40598:	610d                	add	sp,sp,160
   4059a:	30200073          	mret

0004059e <_tx_thread_preempt_restore>:
   4059e:	00832283          	lw	t0,8(t1)
   405a2:	00106e13          	or	t3,zero,1
   405a6:	01c2a023          	sw	t3,0(t0)
   405aa:	0292a623          	sw	s1,44(t0)
   405ae:	0322a423          	sw	s2,40(t0)
   405b2:	0332a223          	sw	s3,36(t0)
   405b6:	0342a023          	sw	s4,32(t0)
   405ba:	0152ae23          	sw	s5,28(t0)
   405be:	0162ac23          	sw	s6,24(t0)
   405c2:	0172aa23          	sw	s7,20(t0)
   405c6:	0182a823          	sw	s8,16(t0)
   405ca:	0192a623          	sw	s9,12(t0)
   405ce:	01a2a423          	sw	s10,8(t0)
   405d2:	01b2a223          	sw	s11,4(t0)
   405d6:	4b018293          	add	t0,gp,1200 # 12d0cb0 <_tx_timer_time_slice>
   405da:	0002a383          	lw	t2,0(t0)
   405de:	00038663          	beqz	t2,405ea <_tx_thread_dont_save_ts>
   405e2:	00732c23          	sw	t2,24(t1)
   405e6:	0002a023          	sw	zero,0(t0)

000405ea <_tx_thread_dont_save_ts>:
   405ea:	4a01a423          	sw	zero,1192(gp) # 12d0ca8 <_tx_thread_current_ptr>

000405ee <_tx_thread_idle_system_restore>:
   405ee:	0be0006f          	j	406ac <_tx_thread_schedule>
	...

000405f4 <_tx_thread_context_save>:
   405f4:	c696                	sw	t0,76(sp)
   405f6:	c49a                	sw	t1,72(sp)
   405f8:	9cc18293          	add	t0,gp,-1588 # 12d01cc <_tx_thread_system_state>
   405fc:	0002a303          	lw	t1,0(t0)
   40600:	02030d63          	beqz	t1,4063a <_tx_thread_not_nested_save>
   40604:	0305                	add	t1,t1,1
   40606:	0062a023          	sw	t1,0(t0)
   4060a:	c29e                	sw	t2,68(sp)
   4060c:	d822                	sw	s0,48(sp)
   4060e:	d6aa                	sw	a0,108(sp)
   40610:	d4ae                	sw	a1,104(sp)
   40612:	d2b2                	sw	a2,100(sp)
   40614:	d0b6                	sw	a3,96(sp)
   40616:	ceba                	sw	a4,92(sp)
   40618:	ccbe                	sw	a5,88(sp)
   4061a:	cac2                	sw	a6,84(sp)
   4061c:	c8c6                	sw	a7,80(sp)
   4061e:	c0f2                	sw	t3,64(sp)
   40620:	de76                	sw	t4,60(sp)
   40622:	dc7a                	sw	t5,56(sp)
   40624:	da7e                	sw	t6,52(sp)
   40626:	341022f3          	csrr	t0,mepc
   4062a:	dc96                	sw	t0,120(sp)
   4062c:	7cb022f3          	csrr	t0,0x7cb
   40630:	c516                	sw	t0,136(sp)
   40632:	7cd022f3          	csrr	t0,0x7cd
   40636:	c716                	sw	t0,140(sp)
   40638:	8082                	ret

0004063a <_tx_thread_not_nested_save>:
   4063a:	0305                	add	t1,t1,1
   4063c:	0062a023          	sw	t1,0(t0)
   40640:	4a81a283          	lw	t0,1192(gp) # 12d0ca8 <_tx_thread_current_ptr>
   40644:	04028063          	beqz	t0,40684 <_tx_thread_idle_system_save>
   40648:	c29e                	sw	t2,68(sp)
   4064a:	d822                	sw	s0,48(sp)
   4064c:	d6aa                	sw	a0,108(sp)
   4064e:	d4ae                	sw	a1,104(sp)
   40650:	d2b2                	sw	a2,100(sp)
   40652:	d0b6                	sw	a3,96(sp)
   40654:	ceba                	sw	a4,92(sp)
   40656:	ccbe                	sw	a5,88(sp)
   40658:	cac2                	sw	a6,84(sp)
   4065a:	c8c6                	sw	a7,80(sp)
   4065c:	c0f2                	sw	t3,64(sp)
   4065e:	de76                	sw	t4,60(sp)
   40660:	dc7a                	sw	t5,56(sp)
   40662:	da7e                	sw	t6,52(sp)
   40664:	341022f3          	csrr	t0,mepc
   40668:	dc96                	sw	t0,120(sp)
   4066a:	7cb022f3          	csrr	t0,0x7cb
   4066e:	c516                	sw	t0,136(sp)
   40670:	7cd022f3          	csrr	t0,0x7cd
   40674:	c716                	sw	t0,140(sp)
   40676:	4a81a303          	lw	t1,1192(gp) # 12d0ca8 <_tx_thread_current_ptr>
   4067a:	00232423          	sw	sp,8(t1)
   4067e:	4ac1a103          	lw	sp,1196(gp) # 12d0cac <_tx_thread_system_stack_ptr>
   40682:	8082                	ret

00040684 <_tx_thread_idle_system_save>:
   40684:	610d                	add	sp,sp,160
   40686:	8082                	ret
   40688:	0000                	unimp
	...

0004068c <_tx_thread_interrupt_control>:
   4068c:	300022f3          	csrr	t0,mstatus
   40690:	8316                	mv	t1,t0
   40692:	ff000393          	li	t2,-16
   40696:	0072f2b3          	and	t0,t0,t2
   4069a:	00a2e2b3          	or	t0,t0,a0
   4069e:	30029073          	csrw	mstatus,t0
   406a2:	00f37513          	and	a0,t1,15
   406a6:	8082                	ret
   406a8:	0000                	unimp
	...

000406ac <_tx_thread_schedule>:
   406ac:	6285                	lui	t0,0x1
   406ae:	88028293          	add	t0,t0,-1920 # 880 <RISCV_MEIE_MTIE>
   406b2:	3042a073          	csrs	mie,t0
   406b6:	30046073          	csrs	mstatus,8
   406ba:	4a418293          	add	t0,gp,1188 # 12d0ca4 <_tx_thread_execute_ptr>

000406be <_tx_thread_schedule_loop>:
   406be:	0002a303          	lw	t1,0(t0)
   406c2:	fe030ee3          	beqz	t1,406be <_tx_thread_schedule_loop>

000406c6 <_tx_thread_ready>:
   406c6:	30047073          	csrc	mstatus,8
   406ca:	4a818293          	add	t0,gp,1192 # 12d0ca8 <_tx_thread_current_ptr>
   406ce:	0062a023          	sw	t1,0(t0)
   406d2:	00432383          	lw	t2,4(t1)
   406d6:	01832e03          	lw	t3,24(t1)
   406da:	0385                	add	t2,t2,1
   406dc:	00732223          	sw	t2,4(t1)
   406e0:	4b018393          	add	t2,gp,1200 # 12d0cb0 <_tx_timer_time_slice>
   406e4:	00832103          	lw	sp,8(t1)
   406e8:	01c3a023          	sw	t3,0(t2)
   406ec:	4382                	lw	t2,0(sp)
   406ee:	04038f63          	beqz	t2,4074c <_tx_thread_synch_return>
   406f2:	42aa                	lw	t0,136(sp)
   406f4:	7cb29073          	csrw	0x7cb,t0
   406f8:	42ba                	lw	t0,140(sp)
   406fa:	7cd29073          	csrw	0x7cd,t0
   406fe:	52e6                	lw	t0,120(sp)
   40700:	34129073          	csrw	mepc,t0
   40704:	6289                	lui	t0,0x2
   40706:	88028293          	add	t0,t0,-1920 # 1880 <RISCV_MEIE_MTIE+0x1000>
   4070a:	30029073          	csrw	mstatus,t0
   4070e:	50c6                	lw	ra,112(sp)
   40710:	42b6                	lw	t0,76(sp)
   40712:	4326                	lw	t1,72(sp)
   40714:	4396                	lw	t2,68(sp)
   40716:	5442                	lw	s0,48(sp)
   40718:	54b2                	lw	s1,44(sp)
   4071a:	5536                	lw	a0,108(sp)
   4071c:	55a6                	lw	a1,104(sp)
   4071e:	5616                	lw	a2,100(sp)
   40720:	5686                	lw	a3,96(sp)
   40722:	4776                	lw	a4,92(sp)
   40724:	47e6                	lw	a5,88(sp)
   40726:	4856                	lw	a6,84(sp)
   40728:	48c6                	lw	a7,80(sp)
   4072a:	5922                	lw	s2,40(sp)
   4072c:	5992                	lw	s3,36(sp)
   4072e:	5a02                	lw	s4,32(sp)
   40730:	4af2                	lw	s5,28(sp)
   40732:	4b62                	lw	s6,24(sp)
   40734:	4bd2                	lw	s7,20(sp)
   40736:	4c42                	lw	s8,16(sp)
   40738:	4cb2                	lw	s9,12(sp)
   4073a:	4d22                	lw	s10,8(sp)
   4073c:	4d92                	lw	s11,4(sp)
   4073e:	4e06                	lw	t3,64(sp)
   40740:	5ef2                	lw	t4,60(sp)
   40742:	5f62                	lw	t5,56(sp)
   40744:	5fd2                	lw	t6,52(sp)
   40746:	610d                	add	sp,sp,160
   40748:	30200073          	mret

0004074c <_tx_thread_synch_return>:
   4074c:	42a6                	lw	t0,72(sp)
   4074e:	7cb29073          	csrw	0x7cb,t0
   40752:	42b6                	lw	t0,76(sp)
   40754:	7cd29073          	csrw	0x7cd,t0
   40758:	50d2                	lw	ra,52(sp)
   4075a:	5442                	lw	s0,48(sp)
   4075c:	54b2                	lw	s1,44(sp)
   4075e:	5922                	lw	s2,40(sp)
   40760:	5992                	lw	s3,36(sp)
   40762:	5a02                	lw	s4,32(sp)
   40764:	4af2                	lw	s5,28(sp)
   40766:	4b62                	lw	s6,24(sp)
   40768:	4bd2                	lw	s7,20(sp)
   4076a:	4c42                	lw	s8,16(sp)
   4076c:	4cb2                	lw	s9,12(sp)
   4076e:	4d22                	lw	s10,8(sp)
   40770:	4d92                	lw	s11,4(sp)
   40772:	52e2                	lw	t0,56(sp)
   40774:	30029073          	csrw	mstatus,t0
   40778:	05410113          	add	sp,sp,84
   4077c:	8082                	ret
	...

00040780 <_tx_thread_stack_build>:
   40780:	01052283          	lw	t0,16(a0)
   40784:	5341                	li	t1,-16
   40786:	0062f2b3          	and	t0,t0,t1
   4078a:	f6028293          	add	t0,t0,-160
   4078e:	4305                	li	t1,1
   40790:	0062a023          	sw	t1,0(t0)
   40794:	0002a223          	sw	zero,4(t0)
   40798:	0002a423          	sw	zero,8(t0)
   4079c:	0002a623          	sw	zero,12(t0)
   407a0:	0002a823          	sw	zero,16(t0)
   407a4:	0002aa23          	sw	zero,20(t0)
   407a8:	0002ac23          	sw	zero,24(t0)
   407ac:	0002ae23          	sw	zero,28(t0)
   407b0:	0202a023          	sw	zero,32(t0)
   407b4:	0202a223          	sw	zero,36(t0)
   407b8:	0202a423          	sw	zero,40(t0)
   407bc:	0202a623          	sw	zero,44(t0)
   407c0:	0202a823          	sw	zero,48(t0)
   407c4:	0202aa23          	sw	zero,52(t0)
   407c8:	0202ac23          	sw	zero,56(t0)
   407cc:	0202ae23          	sw	zero,60(t0)
   407d0:	0402a023          	sw	zero,64(t0)
   407d4:	0402a223          	sw	zero,68(t0)
   407d8:	0402a423          	sw	zero,72(t0)
   407dc:	0402a623          	sw	zero,76(t0)
   407e0:	0402a823          	sw	zero,80(t0)
   407e4:	0402aa23          	sw	zero,84(t0)
   407e8:	0402ac23          	sw	zero,88(t0)
   407ec:	0402ae23          	sw	zero,92(t0)
   407f0:	0602a023          	sw	zero,96(t0)
   407f4:	0602a223          	sw	zero,100(t0)
   407f8:	0602a423          	sw	zero,104(t0)
   407fc:	0602a623          	sw	zero,108(t0)
   40800:	0602a823          	sw	zero,112(t0)
   40804:	06b2ac23          	sw	a1,120(t0)
   40808:	0802a423          	sw	zero,136(t0)
   4080c:	0802a623          	sw	zero,140(t0)
   40810:	0802a823          	sw	zero,144(t0)
   40814:	00552423          	sw	t0,8(a0)
   40818:	8082                	ret
	...

0004081c <_tx_thread_system_return>:
   4081c:	fac10113          	add	sp,sp,-84
   40820:	7cb022f3          	csrr	t0,0x7cb
   40824:	c496                	sw	t0,72(sp)
   40826:	7cd022f3          	csrr	t0,0x7cd
   4082a:	c696                	sw	t0,76(sp)
   4082c:	c002                	sw	zero,0(sp)
   4082e:	da06                	sw	ra,52(sp)
   40830:	d822                	sw	s0,48(sp)
   40832:	d626                	sw	s1,44(sp)
   40834:	d44a                	sw	s2,40(sp)
   40836:	d24e                	sw	s3,36(sp)
   40838:	d052                	sw	s4,32(sp)
   4083a:	ce56                	sw	s5,28(sp)
   4083c:	cc5a                	sw	s6,24(sp)
   4083e:	ca5e                	sw	s7,20(sp)
   40840:	c862                	sw	s8,16(sp)
   40842:	c666                	sw	s9,12(sp)
   40844:	c46a                	sw	s10,8(sp)
   40846:	c26e                	sw	s11,4(sp)
   40848:	300022f3          	csrr	t0,mstatus
   4084c:	dc16                	sw	t0,56(sp)
   4084e:	3007f073          	csrc	mstatus,15
   40852:	4a818293          	add	t0,gp,1192 # 12d0ca8 <_tx_thread_current_ptr>
   40856:	0002a303          	lw	t1,0(t0)
   4085a:	4ac18393          	add	t2,gp,1196 # 12d0cac <_tx_thread_system_stack_ptr>
   4085e:	00232423          	sw	sp,8(t1)
   40862:	0003a103          	lw	sp,0(t2)
   40866:	4b018e93          	add	t4,gp,1200 # 12d0cb0 <_tx_timer_time_slice>
   4086a:	000eae03          	lw	t3,0(t4)
   4086e:	00000397          	auipc	t2,0x0
   40872:	e3e38393          	add	t2,t2,-450 # 406ac <_tx_thread_schedule>
   40876:	000e0663          	beqz	t3,40882 <_tx_thread_dont_save_ts>
   4087a:	01c32c23          	sw	t3,24(t1)
   4087e:	000ea023          	sw	zero,0(t4)

00040882 <_tx_thread_dont_save_ts>:
   40882:	0002a023          	sw	zero,0(t0)
   40886:	8382                	jr	t2
   40888:	0000                	unimp
	...

0004088c <_tx_timer_interrupt>:
   4088c:	4e018293          	add	t0,gp,1248 # 12d0ce0 <_tx_timer_system_clock>
   40890:	0002a303          	lw	t1,0(t0)
   40894:	4b018393          	add	t2,gp,1200 # 12d0cb0 <_tx_timer_time_slice>
   40898:	0003ae03          	lw	t3,0(t2)
   4089c:	0305                	add	t1,t1,1
   4089e:	0062a023          	sw	t1,0(t0)
   408a2:	4f81                	li	t6,0
   408a4:	000e0e63          	beqz	t3,408c0 <_tx_timer_no_time_slice>
   408a8:	1e7d                	add	t3,t3,-1
   408aa:	01c3a023          	sw	t3,0(t2)
   408ae:	01c04963          	bgtz	t3,408c0 <_tx_timer_no_time_slice>
   408b2:	4305                	li	t1,1
   408b4:	4dc18e93          	add	t4,gp,1244 # 12d0cdc <_tx_timer_expired_time_slice>
   408b8:	006ea023          	sw	t1,0(t4)
   408bc:	001fef93          	or	t6,t6,1

000408c0 <_tx_timer_no_time_slice>:
   408c0:	4d018293          	add	t0,gp,1232 # 12d0cd0 <_tx_timer_current_ptr>
   408c4:	0002a303          	lw	t1,0(t0)
   408c8:	00032e03          	lw	t3,0(t1)
   408cc:	4cc18393          	add	t2,gp,1228 # 12d0ccc <_tx_timer_expired>
   408d0:	4e85                	li	t4,1
   408d2:	000e0763          	beqz	t3,408e0 <_tx_timer_no_timer>
   408d6:	002fef93          	or	t6,t6,2
   408da:	01d3a023          	sw	t4,0(t2)
   408de:	a005                	j	408fe <_tx_timer_done>

000408e0 <_tx_timer_no_timer>:
   408e0:	4d418393          	add	t2,gp,1236 # 12d0cd4 <_tx_timer_list_end>
   408e4:	0003ae03          	lw	t3,0(t2)
   408e8:	0311                	add	t1,t1,4
   408ea:	0062a023          	sw	t1,0(t0)
   408ee:	01c31863          	bne	t1,t3,408fe <_tx_timer_done>
   408f2:	4d818393          	add	t2,gp,1240 # 12d0cd8 <_tx_timer_list_start>
   408f6:	0003ae83          	lw	t4,0(t2)
   408fa:	01d2a023          	sw	t4,0(t0)

000408fe <_tx_timer_done>:
   408fe:	020f8463          	beqz	t6,40926 <_tx_timer_nothing_expired>
   40902:	002ff393          	and	t2,t6,2
   40906:	1141                	add	sp,sp,-16
   40908:	c07e                	sw	t6,0(sp)
   4090a:	c206                	sw	ra,4(sp)
   4090c:	00038563          	beqz	t2,40916 <_tx_timer_dont_activate>
   40910:	2af040ef          	jal	453be <_tx_timer_expiration_process>
   40914:	4f82                	lw	t6,0(sp)

00040916 <_tx_timer_dont_activate>:
   40916:	001ff393          	and	t2,t6,1
   4091a:	00038463          	beqz	t2,40922 <_tx_timer_not_ts_expiration>
   4091e:	1db040ef          	jal	452f8 <_tx_thread_time_slice>

00040922 <_tx_timer_not_ts_expiration>:
   40922:	4092                	lw	ra,4(sp)
   40924:	0141                	add	sp,sp,16

00040926 <_tx_timer_nothing_expired>:
   40926:	8082                	ret
   40928:	0000                	unimp
	...

0004092c <__disable_interrupt>:
   4092c:	42a1                	li	t0,8
   4092e:	3002b073          	csrc	mstatus,t0
   40932:	8082                	ret

00040934 <__get_interrupt_state>:
   40934:	30002573          	csrr	a0,mstatus
   40938:	8082                	ret
   4093a:	0001                	nop

0004093c <__set_interrupt_state>:
   4093c:	30051073          	csrw	mstatus,a0
   40940:	8082                	ret
	...

00040944 <board_timer_isr>:
   40944:	f000c737          	lui	a4,0xf000c
   40948:	20072783          	lw	a5,512(a4) # f000c200 <__share_mem_end__+0xeed0c200>
   4094c:	8bc1                	and	a5,a5,16
   4094e:	c799                	beqz	a5,4095c <board_timer_isr+0x18>
   40950:	47c1                	li	a5,16
   40952:	20f72023          	sw	a5,512(a4)
   40956:	4401a783          	lw	a5,1088(gp) # 12d0c40 <timer_cb>
   4095a:	8782                	jr	a5
   4095c:	8082                	ret

0004095e <default_isr_26>:
   4095e:	f000c737          	lui	a4,0xf000c
   40962:	20072783          	lw	a5,512(a4) # f000c200 <__share_mem_end__+0xeed0c200>
   40966:	8bc1                	and	a5,a5,16
   40968:	c799                	beqz	a5,40976 <default_isr_26+0x18>
   4096a:	47c1                	li	a5,16
   4096c:	20f72023          	sw	a5,512(a4)
   40970:	4401a783          	lw	a5,1088(gp) # 12d0c40 <timer_cb>
   40974:	8782                	jr	a5
   40976:	8082                	ret

00040978 <system_tick_isr>:
   40978:	f0018737          	lui	a4,0xf0018
   4097c:	20072783          	lw	a5,512(a4) # f0018200 <__share_mem_end__+0xeed18200>
   40980:	8bc1                	and	a5,a5,16
   40982:	e391                	bnez	a5,40986 <system_tick_isr+0xe>
   40984:	8082                	ret
   40986:	47c1                	li	a5,16
   40988:	20f72023          	sw	a5,512(a4)
   4098c:	b701                	j	4088c <_tx_timer_interrupt>

0004098e <default_isr_29>:
   4098e:	f0018737          	lui	a4,0xf0018
   40992:	20072783          	lw	a5,512(a4) # f0018200 <__share_mem_end__+0xeed18200>
   40996:	8bc1                	and	a5,a5,16
   40998:	e391                	bnez	a5,4099c <default_isr_29+0xe>
   4099a:	8082                	ret
   4099c:	47c1                	li	a5,16
   4099e:	20f72023          	sw	a5,512(a4)
   409a2:	b5ed                	j	4088c <_tx_timer_interrupt>

000409a4 <tx_risc_v_trap_handler>:
   409a4:	7135                	add	sp,sp,-160
   409a6:	d886                	sw	ra,112(sp)
   409a8:	c4dff0ef          	jal	405f4 <_tx_thread_context_save>
   409ac:	34202573          	csrr	a0,mcause

000409b0 <test_if_asynchronous>:
   409b0:	01f55613          	srl	a2,a0,0x1f
   409b4:	c601                	beqz	a2,409bc <handle_synchronous>

000409b6 <handle_asynchronous>:
   409b6:	a53ff0ef          	jal	40408 <irq_handler_trap>
   409ba:	a025                	j	409e2 <processed_source>

000409bc <handle_synchronous>:
   409bc:	0591                	add	a1,a1,4
   409be:	c02e                	sw	a1,0(sp)

000409c0 <test_if_environment_call>:
   409c0:	42ad                	li	t0,11
   409c2:	00551763          	bne	a0,t0,409d0 <is_exception>
   409c6:	fff28313          	add	t1,t0,-1
   409ca:	00604c63          	bgtz	t1,409e2 <processed_source>
   409ce:	a811                	j	409e2 <processed_source>

000409d0 <is_exception>:
   409d0:	342022f3          	csrr	t0,mcause
   409d4:	34102373          	csrr	t1,mepc
   409d8:	300023f3          	csrr	t2,mstatus
   409dc:	116040ef          	jal	44af2 <threadx_exception_handler>
   409e0:	bfc5                	j	409d0 <is_exception>

000409e2 <processed_source>:
   409e2:	b03ff06f          	j	404e4 <_tx_thread_context_restore>
	...

00040c00 <__vector_table>:
   40c00:	0408                	add	a0,sp,512
   40c02:	0004                	.insn	2, 0x0004
   40c04:	0404                	add	s1,sp,512
   40c06:	0004                	.insn	2, 0x0004
   40c08:	0404                	add	s1,sp,512
   40c0a:	0004                	.insn	2, 0x0004
   40c0c:	0404                	add	s1,sp,512
   40c0e:	0004                	.insn	2, 0x0004
   40c10:	0404                	add	s1,sp,512
   40c12:	0004                	.insn	2, 0x0004
   40c14:	0404                	add	s1,sp,512
   40c16:	0004                	.insn	2, 0x0004
   40c18:	0404                	add	s1,sp,512
   40c1a:	0004                	.insn	2, 0x0004
   40c1c:	0404                	add	s1,sp,512
   40c1e:	0004                	.insn	2, 0x0004
   40c20:	0404                	add	s1,sp,512
   40c22:	0004                	.insn	2, 0x0004
   40c24:	0404                	add	s1,sp,512
   40c26:	0004                	.insn	2, 0x0004
   40c28:	0404                	add	s1,sp,512
   40c2a:	0004                	.insn	2, 0x0004
   40c2c:	0404                	add	s1,sp,512
   40c2e:	0004                	.insn	2, 0x0004
   40c30:	0404                	add	s1,sp,512
   40c32:	0004                	.insn	2, 0x0004
   40c34:	0404                	add	s1,sp,512
   40c36:	0004                	.insn	2, 0x0004
   40c38:	0404                	add	s1,sp,512
   40c3a:	0004                	.insn	2, 0x0004
   40c3c:	0404                	add	s1,sp,512
   40c3e:	0004                	.insn	2, 0x0004
   40c40:	0404                	add	s1,sp,512
   40c42:	0004                	.insn	2, 0x0004
   40c44:	0404                	add	s1,sp,512
   40c46:	0004                	.insn	2, 0x0004
   40c48:	0404                	add	s1,sp,512
   40c4a:	0004                	.insn	2, 0x0004
   40c4c:	0404                	add	s1,sp,512
   40c4e:	0004                	.insn	2, 0x0004
   40c50:	0404                	add	s1,sp,512
   40c52:	0004                	.insn	2, 0x0004
   40c54:	0404                	add	s1,sp,512
   40c56:	0004                	.insn	2, 0x0004
   40c58:	0404                	add	s1,sp,512
   40c5a:	0004                	.insn	2, 0x0004
   40c5c:	0404                	add	s1,sp,512
   40c5e:	0004                	.insn	2, 0x0004
   40c60:	0404                	add	s1,sp,512
   40c62:	0004                	.insn	2, 0x0004
   40c64:	0404                	add	s1,sp,512
   40c66:	0004                	.insn	2, 0x0004
   40c68:	095e                	sll	s2,s2,0x17
   40c6a:	0004                	.insn	2, 0x0004
   40c6c:	0404                	add	s1,sp,512
   40c6e:	0004                	.insn	2, 0x0004
   40c70:	0404                	add	s1,sp,512
   40c72:	0004                	.insn	2, 0x0004
   40c74:	098e                	sll	s3,s3,0x3
   40c76:	0004                	.insn	2, 0x0004
   40c78:	0404                	add	s1,sp,512
   40c7a:	0004                	.insn	2, 0x0004
   40c7c:	0404                	add	s1,sp,512
   40c7e:	0004                	.insn	2, 0x0004
   40c80:	0404                	add	s1,sp,512
   40c82:	0004                	.insn	2, 0x0004
   40c84:	0404                	add	s1,sp,512
   40c86:	0004                	.insn	2, 0x0004
   40c88:	0404                	add	s1,sp,512
   40c8a:	0004                	.insn	2, 0x0004
   40c8c:	0404                	add	s1,sp,512
   40c8e:	0004                	.insn	2, 0x0004
   40c90:	0404                	add	s1,sp,512
   40c92:	0004                	.insn	2, 0x0004
   40c94:	0404                	add	s1,sp,512
   40c96:	0004                	.insn	2, 0x0004
   40c98:	0404                	add	s1,sp,512
   40c9a:	0004                	.insn	2, 0x0004
   40c9c:	0404                	add	s1,sp,512
   40c9e:	0004                	.insn	2, 0x0004
   40ca0:	0404                	add	s1,sp,512
   40ca2:	0004                	.insn	2, 0x0004
   40ca4:	0404                	add	s1,sp,512
   40ca6:	0004                	.insn	2, 0x0004
   40ca8:	0404                	add	s1,sp,512
   40caa:	0004                	.insn	2, 0x0004
   40cac:	0404                	add	s1,sp,512
   40cae:	0004                	.insn	2, 0x0004
   40cb0:	0404                	add	s1,sp,512
   40cb2:	0004                	.insn	2, 0x0004
   40cb4:	0404                	add	s1,sp,512
   40cb6:	0004                	.insn	2, 0x0004
   40cb8:	0404                	add	s1,sp,512
   40cba:	0004                	.insn	2, 0x0004
   40cbc:	0404                	add	s1,sp,512
   40cbe:	0004                	.insn	2, 0x0004
   40cc0:	0404                	add	s1,sp,512
   40cc2:	0004                	.insn	2, 0x0004
   40cc4:	0404                	add	s1,sp,512
   40cc6:	0004                	.insn	2, 0x0004
   40cc8:	0404                	add	s1,sp,512
   40cca:	0004                	.insn	2, 0x0004
   40ccc:	0404                	add	s1,sp,512
   40cce:	0004                	.insn	2, 0x0004
   40cd0:	0404                	add	s1,sp,512
   40cd2:	0004                	.insn	2, 0x0004
   40cd4:	0404                	add	s1,sp,512
   40cd6:	0004                	.insn	2, 0x0004
   40cd8:	0404                	add	s1,sp,512
   40cda:	0004                	.insn	2, 0x0004
   40cdc:	0404                	add	s1,sp,512
   40cde:	0004                	.insn	2, 0x0004
   40ce0:	0404                	add	s1,sp,512
   40ce2:	0004                	.insn	2, 0x0004
   40ce4:	0404                	add	s1,sp,512
   40ce6:	0004                	.insn	2, 0x0004
   40ce8:	0404                	add	s1,sp,512
   40cea:	0004                	.insn	2, 0x0004
   40cec:	0404                	add	s1,sp,512
   40cee:	0004                	.insn	2, 0x0004
   40cf0:	0404                	add	s1,sp,512
   40cf2:	0004                	.insn	2, 0x0004
   40cf4:	0404                	add	s1,sp,512
   40cf6:	0004                	.insn	2, 0x0004
   40cf8:	0404                	add	s1,sp,512
   40cfa:	0004                	.insn	2, 0x0004
   40cfc:	0404                	add	s1,sp,512
   40cfe:	0004                	.insn	2, 0x0004
   40d00:	0404                	add	s1,sp,512
   40d02:	0004                	.insn	2, 0x0004
   40d04:	0404                	add	s1,sp,512
   40d06:	0004                	.insn	2, 0x0004
   40d08:	0404                	add	s1,sp,512
   40d0a:	0004                	.insn	2, 0x0004
   40d0c:	0404                	add	s1,sp,512
   40d0e:	0004                	.insn	2, 0x0004
   40d10:	0404                	add	s1,sp,512
   40d12:	0004                	.insn	2, 0x0004
   40d14:	0404                	add	s1,sp,512
   40d16:	0004                	.insn	2, 0x0004
   40d18:	0404                	add	s1,sp,512
   40d1a:	0004                	.insn	2, 0x0004
   40d1c:	0404                	add	s1,sp,512
   40d1e:	0004                	.insn	2, 0x0004
   40d20:	0404                	add	s1,sp,512
   40d22:	0004                	.insn	2, 0x0004
   40d24:	0404                	add	s1,sp,512
   40d26:	0004                	.insn	2, 0x0004
   40d28:	0404                	add	s1,sp,512
   40d2a:	0004                	.insn	2, 0x0004
   40d2c:	0404                	add	s1,sp,512
   40d2e:	0004                	.insn	2, 0x0004
   40d30:	0404                	add	s1,sp,512
   40d32:	0004                	.insn	2, 0x0004
   40d34:	0404                	add	s1,sp,512
   40d36:	0004                	.insn	2, 0x0004
   40d38:	0404                	add	s1,sp,512
   40d3a:	0004                	.insn	2, 0x0004
   40d3c:	0404                	add	s1,sp,512
   40d3e:	0004                	.insn	2, 0x0004
   40d40:	0404                	add	s1,sp,512
   40d42:	0004                	.insn	2, 0x0004
   40d44:	0404                	add	s1,sp,512
   40d46:	0004                	.insn	2, 0x0004
   40d48:	0404                	add	s1,sp,512
   40d4a:	0004                	.insn	2, 0x0004
   40d4c:	0404                	add	s1,sp,512
   40d4e:	0004                	.insn	2, 0x0004
   40d50:	0404                	add	s1,sp,512
   40d52:	0004                	.insn	2, 0x0004
   40d54:	0404                	add	s1,sp,512
   40d56:	0004                	.insn	2, 0x0004
   40d58:	0404                	add	s1,sp,512
   40d5a:	0004                	.insn	2, 0x0004
   40d5c:	0404                	add	s1,sp,512
   40d5e:	0004                	.insn	2, 0x0004
   40d60:	0404                	add	s1,sp,512
   40d62:	0004                	.insn	2, 0x0004
   40d64:	0404                	add	s1,sp,512
   40d66:	0004                	.insn	2, 0x0004
   40d68:	0404                	add	s1,sp,512
   40d6a:	0004                	.insn	2, 0x0004
   40d6c:	0404                	add	s1,sp,512
   40d6e:	0004                	.insn	2, 0x0004
   40d70:	0404                	add	s1,sp,512
   40d72:	0004                	.insn	2, 0x0004
   40d74:	0404                	add	s1,sp,512
   40d76:	0004                	.insn	2, 0x0004
   40d78:	0404                	add	s1,sp,512
   40d7a:	0004                	.insn	2, 0x0004
   40d7c:	0404                	add	s1,sp,512
   40d7e:	0004                	.insn	2, 0x0004
   40d80:	0404                	add	s1,sp,512
   40d82:	0004                	.insn	2, 0x0004
   40d84:	0404                	add	s1,sp,512
   40d86:	0004                	.insn	2, 0x0004
   40d88:	0404                	add	s1,sp,512
   40d8a:	0004                	.insn	2, 0x0004
   40d8c:	0404                	add	s1,sp,512
   40d8e:	0004                	.insn	2, 0x0004
   40d90:	0404                	add	s1,sp,512
   40d92:	0004                	.insn	2, 0x0004
   40d94:	0404                	add	s1,sp,512
   40d96:	0004                	.insn	2, 0x0004
   40d98:	0404                	add	s1,sp,512
   40d9a:	0004                	.insn	2, 0x0004
   40d9c:	0404                	add	s1,sp,512
   40d9e:	0004                	.insn	2, 0x0004
   40da0:	0404                	add	s1,sp,512
   40da2:	0004                	.insn	2, 0x0004
   40da4:	0404                	add	s1,sp,512
   40da6:	0004                	.insn	2, 0x0004
   40da8:	0404                	add	s1,sp,512
   40daa:	0004                	.insn	2, 0x0004
   40dac:	0404                	add	s1,sp,512
   40dae:	0004                	.insn	2, 0x0004
   40db0:	0404                	add	s1,sp,512
   40db2:	0004                	.insn	2, 0x0004
   40db4:	0404                	add	s1,sp,512
   40db6:	0004                	.insn	2, 0x0004
   40db8:	0404                	add	s1,sp,512
   40dba:	0004                	.insn	2, 0x0004
   40dbc:	0404                	add	s1,sp,512
   40dbe:	0004                	.insn	2, 0x0004
   40dc0:	0404                	add	s1,sp,512
   40dc2:	0004                	.insn	2, 0x0004
   40dc4:	0404                	add	s1,sp,512
   40dc6:	0004                	.insn	2, 0x0004
   40dc8:	0404                	add	s1,sp,512
   40dca:	0004                	.insn	2, 0x0004
   40dcc:	0404                	add	s1,sp,512
   40dce:	0004                	.insn	2, 0x0004
   40dd0:	0404                	add	s1,sp,512
   40dd2:	0004                	.insn	2, 0x0004
   40dd4:	0404                	add	s1,sp,512
   40dd6:	0004                	.insn	2, 0x0004
   40dd8:	0404                	add	s1,sp,512
   40dda:	0004                	.insn	2, 0x0004
   40ddc:	0404                	add	s1,sp,512
   40dde:	0004                	.insn	2, 0x0004
   40de0:	0404                	add	s1,sp,512
   40de2:	0004                	.insn	2, 0x0004
   40de4:	0404                	add	s1,sp,512
   40de6:	0004                	.insn	2, 0x0004
   40de8:	0404                	add	s1,sp,512
   40dea:	0004                	.insn	2, 0x0004
   40dec:	0404                	add	s1,sp,512
   40dee:	0004                	.insn	2, 0x0004
   40df0:	0404                	add	s1,sp,512
   40df2:	0004                	.insn	2, 0x0004
   40df4:	0404                	add	s1,sp,512
   40df6:	0004                	.insn	2, 0x0004
   40df8:	0404                	add	s1,sp,512
   40dfa:	0004                	.insn	2, 0x0004
   40dfc:	0404                	add	s1,sp,512
   40dfe:	0004                	.insn	2, 0x0004
   40e00:	0404                	add	s1,sp,512
   40e02:	0004                	.insn	2, 0x0004
   40e04:	0404                	add	s1,sp,512
   40e06:	0004                	.insn	2, 0x0004
   40e08:	0404                	add	s1,sp,512
   40e0a:	0004                	.insn	2, 0x0004
   40e0c:	0404                	add	s1,sp,512
   40e0e:	0004                	.insn	2, 0x0004
   40e10:	0404                	add	s1,sp,512
   40e12:	0004                	.insn	2, 0x0004
   40e14:	0404                	add	s1,sp,512
   40e16:	0004                	.insn	2, 0x0004
   40e18:	0404                	add	s1,sp,512
   40e1a:	0004                	.insn	2, 0x0004
   40e1c:	0404                	add	s1,sp,512
   40e1e:	0004                	.insn	2, 0x0004
   40e20:	0404                	add	s1,sp,512
   40e22:	0004                	.insn	2, 0x0004
   40e24:	0404                	add	s1,sp,512
   40e26:	0004                	.insn	2, 0x0004
   40e28:	0404                	add	s1,sp,512
   40e2a:	0004                	.insn	2, 0x0004
   40e2c:	0404                	add	s1,sp,512
   40e2e:	0004                	.insn	2, 0x0004
   40e30:	0404                	add	s1,sp,512
   40e32:	0004                	.insn	2, 0x0004
   40e34:	0404                	add	s1,sp,512
   40e36:	0004                	.insn	2, 0x0004
   40e38:	0404                	add	s1,sp,512
   40e3a:	0004                	.insn	2, 0x0004
   40e3c:	0404                	add	s1,sp,512
   40e3e:	0004                	.insn	2, 0x0004
   40e40:	0404                	add	s1,sp,512
   40e42:	0004                	.insn	2, 0x0004
   40e44:	0404                	add	s1,sp,512
   40e46:	0004                	.insn	2, 0x0004
   40e48:	0404                	add	s1,sp,512
   40e4a:	0004                	.insn	2, 0x0004
   40e4c:	0404                	add	s1,sp,512
   40e4e:	0004                	.insn	2, 0x0004
   40e50:	0404                	add	s1,sp,512
   40e52:	0004                	.insn	2, 0x0004
   40e54:	0404                	add	s1,sp,512
   40e56:	0004                	.insn	2, 0x0004
   40e58:	0404                	add	s1,sp,512
   40e5a:	0004                	.insn	2, 0x0004
   40e5c:	0404                	add	s1,sp,512
   40e5e:	0004                	.insn	2, 0x0004
   40e60:	0404                	add	s1,sp,512
   40e62:	0004                	.insn	2, 0x0004
   40e64:	0404                	add	s1,sp,512
   40e66:	0004                	.insn	2, 0x0004
   40e68:	0404                	add	s1,sp,512
   40e6a:	0004                	.insn	2, 0x0004
   40e6c:	0404                	add	s1,sp,512
   40e6e:	0004                	.insn	2, 0x0004
   40e70:	0404                	add	s1,sp,512
   40e72:	0004                	.insn	2, 0x0004
   40e74:	0404                	add	s1,sp,512
   40e76:	0004                	.insn	2, 0x0004
   40e78:	0404                	add	s1,sp,512
   40e7a:	0004                	.insn	2, 0x0004
   40e7c:	0404                	add	s1,sp,512
   40e7e:	0004                	.insn	2, 0x0004
   40e80:	0404                	add	s1,sp,512
   40e82:	0004                	.insn	2, 0x0004
   40e84:	0404                	add	s1,sp,512
   40e86:	0004                	.insn	2, 0x0004

00040e88 <default_irq_s_handler>:
   40e88:	a001                	j	40e88 <default_irq_s_handler>

00040e8a <irq_handler_s_trap>:
   40e8a:	1101                	add	sp,sp,-32
   40e8c:	ce06                	sw	ra,28(sp)
   40e8e:	cc22                	sw	s0,24(sp)
   40e90:	ca26                	sw	s1,20(sp)
   40e92:	142027f3          	csrr	a5,scause
   40e96:	14102473          	csrr	s0,sepc
   40e9a:	8822                	mv	a6,s0
   40e9c:	100024f3          	csrr	s1,sstatus
   40ea0:	3ff7f713          	and	a4,a5,1023
   40ea4:	0207c363          	bltz	a5,40eca <irq_handler_s_trap+0x40>
   40ea8:	46a5                	li	a3,9
   40eaa:	04d70363          	beq	a4,a3,40ef0 <irq_handler_s_trap+0x66>
   40eae:	85c2                	mv	a1,a6
   40eb0:	853e                	mv	a0,a5
   40eb2:	5b9020ef          	jal	43c6a <exception_s_handler>
   40eb6:	842a                	mv	s0,a0
   40eb8:	10049073          	csrw	sstatus,s1
   40ebc:	14141073          	csrw	sepc,s0
   40ec0:	40f2                	lw	ra,28(sp)
   40ec2:	4462                	lw	s0,24(sp)
   40ec4:	44d2                	lw	s1,20(sp)
   40ec6:	6105                	add	sp,sp,32
   40ec8:	8082                	ret
   40eca:	4695                	li	a3,5
   40ecc:	08d70563          	beq	a4,a3,40f56 <irq_handler_s_trap+0xcc>
   40ed0:	46a5                	li	a3,9
   40ed2:	04d70363          	beq	a4,a3,40f18 <irq_handler_s_trap+0x8e>
   40ed6:	4685                	li	a3,1
   40ed8:	fcd71be3          	bne	a4,a3,40eae <irq_handler_s_trap+0x24>
   40edc:	e66007b7          	lui	a5,0xe6600
   40ee0:	0791                	add	a5,a5,4 # e6600004 <__share_mem_end__+0xe5300004>
   40ee2:	439c                	lw	a5,0(a5)
   40ee4:	58b020ef          	jal	43c6e <swi_s_isr>
   40ee8:	4789                	li	a5,2
   40eea:	1447b073          	csrc	sip,a5
   40eee:	b7e9                	j	40eb8 <irq_handler_s_trap+0x2e>
   40ef0:	000447b7          	lui	a5,0x44
   40ef4:	c6078793          	add	a5,a5,-928 # 43c60 <syscall_handler>
   40ef8:	8736                	mv	a4,a3
   40efa:	86b2                	mv	a3,a2
   40efc:	862e                	mv	a2,a1
   40efe:	85aa                	mv	a1,a0
   40f00:	8546                	mv	a0,a7
   40f02:	9782                	jalr	a5
   40f04:	0411                	add	s0,s0,4
   40f06:	10049073          	csrw	sstatus,s1
   40f0a:	14141073          	csrw	sepc,s0
   40f0e:	40f2                	lw	ra,28(sp)
   40f10:	4462                	lw	s0,24(sp)
   40f12:	44d2                	lw	s1,20(sp)
   40f14:	6105                	add	sp,sp,32
   40f16:	8082                	ret
   40f18:	c84a                	sw	s2,16(sp)
   40f1a:	e4201937          	lui	s2,0xe4201
   40f1e:	0911                	add	s2,s2,4 # e4201004 <__share_mem_end__+0xe2f01004>
   40f20:	c64e                	sw	s3,12(sp)
   40f22:	4789                	li	a5,2
   40f24:	00092983          	lw	s3,0(s2)
   40f28:	1007a073          	csrs	sstatus,a5
   40f2c:	000417b7          	lui	a5,0x41
   40f30:	00078793          	mv	a5,a5
   40f34:	20f9c7b3          	sh2add	a5,s3,a5
   40f38:	439c                	lw	a5,0(a5)
   40f3a:	9782                	jalr	a5
   40f3c:	01392023          	sw	s3,0(s2)
   40f40:	4942                	lw	s2,16(sp)
   40f42:	49b2                	lw	s3,12(sp)
   40f44:	10049073          	csrw	sstatus,s1
   40f48:	14141073          	csrw	sepc,s0
   40f4c:	40f2                	lw	ra,28(sp)
   40f4e:	4462                	lw	s0,24(sp)
   40f50:	44d2                	lw	s1,20(sp)
   40f52:	6105                	add	sp,sp,32
   40f54:	8082                	ret
   40f56:	51b020ef          	jal	43c70 <mchtmr_s_isr>
   40f5a:	bfb9                	j	40eb8 <irq_handler_s_trap+0x2e>
	...

00041000 <__vector_s_table>:
   41000:	0e8a                	sll	t4,t4,0x2
   41002:	0004                	.insn	2, 0x0004
   41004:	0e88                	add	a0,sp,848
   41006:	0004                	.insn	2, 0x0004
   41008:	0e88                	add	a0,sp,848
   4100a:	0004                	.insn	2, 0x0004
   4100c:	0e88                	add	a0,sp,848
   4100e:	0004                	.insn	2, 0x0004
   41010:	0e88                	add	a0,sp,848
   41012:	0004                	.insn	2, 0x0004
   41014:	0e88                	add	a0,sp,848
   41016:	0004                	.insn	2, 0x0004
   41018:	0e88                	add	a0,sp,848
   4101a:	0004                	.insn	2, 0x0004
   4101c:	0e88                	add	a0,sp,848
   4101e:	0004                	.insn	2, 0x0004
   41020:	0e88                	add	a0,sp,848
   41022:	0004                	.insn	2, 0x0004
   41024:	0e88                	add	a0,sp,848
   41026:	0004                	.insn	2, 0x0004
   41028:	0e88                	add	a0,sp,848
   4102a:	0004                	.insn	2, 0x0004
   4102c:	0e88                	add	a0,sp,848
   4102e:	0004                	.insn	2, 0x0004
   41030:	0e88                	add	a0,sp,848
   41032:	0004                	.insn	2, 0x0004
   41034:	0e88                	add	a0,sp,848
   41036:	0004                	.insn	2, 0x0004
   41038:	0e88                	add	a0,sp,848
   4103a:	0004                	.insn	2, 0x0004
   4103c:	0e88                	add	a0,sp,848
   4103e:	0004                	.insn	2, 0x0004
   41040:	0e88                	add	a0,sp,848
   41042:	0004                	.insn	2, 0x0004
   41044:	0e88                	add	a0,sp,848
   41046:	0004                	.insn	2, 0x0004
   41048:	0e88                	add	a0,sp,848
   4104a:	0004                	.insn	2, 0x0004
   4104c:	0e88                	add	a0,sp,848
   4104e:	0004                	.insn	2, 0x0004
   41050:	0e88                	add	a0,sp,848
   41052:	0004                	.insn	2, 0x0004
   41054:	0e88                	add	a0,sp,848
   41056:	0004                	.insn	2, 0x0004
   41058:	0e88                	add	a0,sp,848
   4105a:	0004                	.insn	2, 0x0004
   4105c:	0e88                	add	a0,sp,848
   4105e:	0004                	.insn	2, 0x0004
   41060:	0e88                	add	a0,sp,848
   41062:	0004                	.insn	2, 0x0004
   41064:	0e88                	add	a0,sp,848
   41066:	0004                	.insn	2, 0x0004
   41068:	0e88                	add	a0,sp,848
   4106a:	0004                	.insn	2, 0x0004
   4106c:	0e88                	add	a0,sp,848
   4106e:	0004                	.insn	2, 0x0004
   41070:	0e88                	add	a0,sp,848
   41072:	0004                	.insn	2, 0x0004
   41074:	0e88                	add	a0,sp,848
   41076:	0004                	.insn	2, 0x0004
   41078:	0e88                	add	a0,sp,848
   4107a:	0004                	.insn	2, 0x0004
   4107c:	0e88                	add	a0,sp,848
   4107e:	0004                	.insn	2, 0x0004
   41080:	0e88                	add	a0,sp,848
   41082:	0004                	.insn	2, 0x0004
   41084:	0e88                	add	a0,sp,848
   41086:	0004                	.insn	2, 0x0004
   41088:	0e88                	add	a0,sp,848
   4108a:	0004                	.insn	2, 0x0004
   4108c:	0e88                	add	a0,sp,848
   4108e:	0004                	.insn	2, 0x0004
   41090:	0e88                	add	a0,sp,848
   41092:	0004                	.insn	2, 0x0004
   41094:	0e88                	add	a0,sp,848
   41096:	0004                	.insn	2, 0x0004
   41098:	0e88                	add	a0,sp,848
   4109a:	0004                	.insn	2, 0x0004
   4109c:	0e88                	add	a0,sp,848
   4109e:	0004                	.insn	2, 0x0004
   410a0:	0e88                	add	a0,sp,848
   410a2:	0004                	.insn	2, 0x0004
   410a4:	0e88                	add	a0,sp,848
   410a6:	0004                	.insn	2, 0x0004
   410a8:	0e88                	add	a0,sp,848
   410aa:	0004                	.insn	2, 0x0004
   410ac:	0e88                	add	a0,sp,848
   410ae:	0004                	.insn	2, 0x0004
   410b0:	0e88                	add	a0,sp,848
   410b2:	0004                	.insn	2, 0x0004
   410b4:	0e88                	add	a0,sp,848
   410b6:	0004                	.insn	2, 0x0004
   410b8:	0e88                	add	a0,sp,848
   410ba:	0004                	.insn	2, 0x0004
   410bc:	0e88                	add	a0,sp,848
   410be:	0004                	.insn	2, 0x0004
   410c0:	0e88                	add	a0,sp,848
   410c2:	0004                	.insn	2, 0x0004
   410c4:	0e88                	add	a0,sp,848
   410c6:	0004                	.insn	2, 0x0004
   410c8:	0e88                	add	a0,sp,848
   410ca:	0004                	.insn	2, 0x0004
   410cc:	0e88                	add	a0,sp,848
   410ce:	0004                	.insn	2, 0x0004
   410d0:	0e88                	add	a0,sp,848
   410d2:	0004                	.insn	2, 0x0004
   410d4:	0e88                	add	a0,sp,848
   410d6:	0004                	.insn	2, 0x0004
   410d8:	0e88                	add	a0,sp,848
   410da:	0004                	.insn	2, 0x0004
   410dc:	0e88                	add	a0,sp,848
   410de:	0004                	.insn	2, 0x0004
   410e0:	0e88                	add	a0,sp,848
   410e2:	0004                	.insn	2, 0x0004
   410e4:	0e88                	add	a0,sp,848
   410e6:	0004                	.insn	2, 0x0004
   410e8:	0e88                	add	a0,sp,848
   410ea:	0004                	.insn	2, 0x0004
   410ec:	0e88                	add	a0,sp,848
   410ee:	0004                	.insn	2, 0x0004
   410f0:	0e88                	add	a0,sp,848
   410f2:	0004                	.insn	2, 0x0004
   410f4:	0e88                	add	a0,sp,848
   410f6:	0004                	.insn	2, 0x0004
   410f8:	0e88                	add	a0,sp,848
   410fa:	0004                	.insn	2, 0x0004
   410fc:	0e88                	add	a0,sp,848
   410fe:	0004                	.insn	2, 0x0004
   41100:	0e88                	add	a0,sp,848
   41102:	0004                	.insn	2, 0x0004
   41104:	0e88                	add	a0,sp,848
   41106:	0004                	.insn	2, 0x0004
   41108:	0e88                	add	a0,sp,848
   4110a:	0004                	.insn	2, 0x0004
   4110c:	0e88                	add	a0,sp,848
   4110e:	0004                	.insn	2, 0x0004
   41110:	0e88                	add	a0,sp,848
   41112:	0004                	.insn	2, 0x0004
   41114:	0e88                	add	a0,sp,848
   41116:	0004                	.insn	2, 0x0004
   41118:	0e88                	add	a0,sp,848
   4111a:	0004                	.insn	2, 0x0004
   4111c:	0e88                	add	a0,sp,848
   4111e:	0004                	.insn	2, 0x0004
   41120:	0e88                	add	a0,sp,848
   41122:	0004                	.insn	2, 0x0004
   41124:	0e88                	add	a0,sp,848
   41126:	0004                	.insn	2, 0x0004
   41128:	0e88                	add	a0,sp,848
   4112a:	0004                	.insn	2, 0x0004
   4112c:	0e88                	add	a0,sp,848
   4112e:	0004                	.insn	2, 0x0004
   41130:	0e88                	add	a0,sp,848
   41132:	0004                	.insn	2, 0x0004
   41134:	0e88                	add	a0,sp,848
   41136:	0004                	.insn	2, 0x0004
   41138:	0e88                	add	a0,sp,848
   4113a:	0004                	.insn	2, 0x0004
   4113c:	0e88                	add	a0,sp,848
   4113e:	0004                	.insn	2, 0x0004
   41140:	0e88                	add	a0,sp,848
   41142:	0004                	.insn	2, 0x0004
   41144:	0e88                	add	a0,sp,848
   41146:	0004                	.insn	2, 0x0004
   41148:	0e88                	add	a0,sp,848
   4114a:	0004                	.insn	2, 0x0004
   4114c:	0e88                	add	a0,sp,848
   4114e:	0004                	.insn	2, 0x0004
   41150:	0e88                	add	a0,sp,848
   41152:	0004                	.insn	2, 0x0004
   41154:	0e88                	add	a0,sp,848
   41156:	0004                	.insn	2, 0x0004
   41158:	0e88                	add	a0,sp,848
   4115a:	0004                	.insn	2, 0x0004
   4115c:	0e88                	add	a0,sp,848
   4115e:	0004                	.insn	2, 0x0004
   41160:	0e88                	add	a0,sp,848
   41162:	0004                	.insn	2, 0x0004
   41164:	0e88                	add	a0,sp,848
   41166:	0004                	.insn	2, 0x0004
   41168:	0e88                	add	a0,sp,848
   4116a:	0004                	.insn	2, 0x0004
   4116c:	0e88                	add	a0,sp,848
   4116e:	0004                	.insn	2, 0x0004
   41170:	0e88                	add	a0,sp,848
   41172:	0004                	.insn	2, 0x0004
   41174:	0e88                	add	a0,sp,848
   41176:	0004                	.insn	2, 0x0004
   41178:	0e88                	add	a0,sp,848
   4117a:	0004                	.insn	2, 0x0004
   4117c:	0e88                	add	a0,sp,848
   4117e:	0004                	.insn	2, 0x0004
   41180:	0e88                	add	a0,sp,848
   41182:	0004                	.insn	2, 0x0004
   41184:	0e88                	add	a0,sp,848
   41186:	0004                	.insn	2, 0x0004
   41188:	0e88                	add	a0,sp,848
   4118a:	0004                	.insn	2, 0x0004
   4118c:	0e88                	add	a0,sp,848
   4118e:	0004                	.insn	2, 0x0004
   41190:	0e88                	add	a0,sp,848
   41192:	0004                	.insn	2, 0x0004
   41194:	0e88                	add	a0,sp,848
   41196:	0004                	.insn	2, 0x0004
   41198:	0e88                	add	a0,sp,848
   4119a:	0004                	.insn	2, 0x0004
   4119c:	0e88                	add	a0,sp,848
   4119e:	0004                	.insn	2, 0x0004
   411a0:	0e88                	add	a0,sp,848
   411a2:	0004                	.insn	2, 0x0004
   411a4:	0e88                	add	a0,sp,848
   411a6:	0004                	.insn	2, 0x0004
   411a8:	0e88                	add	a0,sp,848
   411aa:	0004                	.insn	2, 0x0004
   411ac:	0e88                	add	a0,sp,848
   411ae:	0004                	.insn	2, 0x0004
   411b0:	0e88                	add	a0,sp,848
   411b2:	0004                	.insn	2, 0x0004
   411b4:	0e88                	add	a0,sp,848
   411b6:	0004                	.insn	2, 0x0004
   411b8:	0e88                	add	a0,sp,848
   411ba:	0004                	.insn	2, 0x0004
   411bc:	0e88                	add	a0,sp,848
   411be:	0004                	.insn	2, 0x0004
   411c0:	0e88                	add	a0,sp,848
   411c2:	0004                	.insn	2, 0x0004
   411c4:	0e88                	add	a0,sp,848
   411c6:	0004                	.insn	2, 0x0004
   411c8:	0e88                	add	a0,sp,848
   411ca:	0004                	.insn	2, 0x0004
   411cc:	0e88                	add	a0,sp,848
   411ce:	0004                	.insn	2, 0x0004
   411d0:	0e88                	add	a0,sp,848
   411d2:	0004                	.insn	2, 0x0004
   411d4:	0e88                	add	a0,sp,848
   411d6:	0004                	.insn	2, 0x0004
   411d8:	0e88                	add	a0,sp,848
   411da:	0004                	.insn	2, 0x0004
   411dc:	0e88                	add	a0,sp,848
   411de:	0004                	.insn	2, 0x0004
   411e0:	0e88                	add	a0,sp,848
   411e2:	0004                	.insn	2, 0x0004
   411e4:	0e88                	add	a0,sp,848
   411e6:	0004                	.insn	2, 0x0004
   411e8:	0e88                	add	a0,sp,848
   411ea:	0004                	.insn	2, 0x0004
   411ec:	0e88                	add	a0,sp,848
   411ee:	0004                	.insn	2, 0x0004
   411f0:	0e88                	add	a0,sp,848
   411f2:	0004                	.insn	2, 0x0004
   411f4:	0e88                	add	a0,sp,848
   411f6:	0004                	.insn	2, 0x0004
   411f8:	0e88                	add	a0,sp,848
   411fa:	0004                	.insn	2, 0x0004
   411fc:	0e88                	add	a0,sp,848
   411fe:	0004                	.insn	2, 0x0004
   41200:	0e88                	add	a0,sp,848
   41202:	0004                	.insn	2, 0x0004
   41204:	0e88                	add	a0,sp,848
   41206:	0004                	.insn	2, 0x0004
   41208:	0e88                	add	a0,sp,848
   4120a:	0004                	.insn	2, 0x0004
   4120c:	0e88                	add	a0,sp,848
   4120e:	0004                	.insn	2, 0x0004
   41210:	0e88                	add	a0,sp,848
   41212:	0004                	.insn	2, 0x0004
   41214:	0e88                	add	a0,sp,848
   41216:	0004                	.insn	2, 0x0004
   41218:	0e88                	add	a0,sp,848
   4121a:	0004                	.insn	2, 0x0004
   4121c:	0e88                	add	a0,sp,848
   4121e:	0004                	.insn	2, 0x0004
   41220:	0e88                	add	a0,sp,848
   41222:	0004                	.insn	2, 0x0004
   41224:	0e88                	add	a0,sp,848
   41226:	0004                	.insn	2, 0x0004
   41228:	0e88                	add	a0,sp,848
   4122a:	0004                	.insn	2, 0x0004
   4122c:	0e88                	add	a0,sp,848
   4122e:	0004                	.insn	2, 0x0004
   41230:	0e88                	add	a0,sp,848
   41232:	0004                	.insn	2, 0x0004
   41234:	0e88                	add	a0,sp,848
   41236:	0004                	.insn	2, 0x0004
   41238:	0e88                	add	a0,sp,848
   4123a:	0004                	.insn	2, 0x0004
   4123c:	0e88                	add	a0,sp,848
   4123e:	0004                	.insn	2, 0x0004
   41240:	0e88                	add	a0,sp,848
   41242:	0004                	.insn	2, 0x0004
   41244:	0e88                	add	a0,sp,848
   41246:	0004                	.insn	2, 0x0004
   41248:	0e88                	add	a0,sp,848
   4124a:	0004                	.insn	2, 0x0004
   4124c:	0e88                	add	a0,sp,848
   4124e:	0004                	.insn	2, 0x0004
   41250:	0e88                	add	a0,sp,848
   41252:	0004                	.insn	2, 0x0004
   41254:	0e88                	add	a0,sp,848
   41256:	0004                	.insn	2, 0x0004
   41258:	0e88                	add	a0,sp,848
   4125a:	0004                	.insn	2, 0x0004
   4125c:	0e88                	add	a0,sp,848
   4125e:	0004                	.insn	2, 0x0004
   41260:	0e88                	add	a0,sp,848
   41262:	0004                	.insn	2, 0x0004
   41264:	0e88                	add	a0,sp,848
   41266:	0004                	.insn	2, 0x0004
   41268:	0e88                	add	a0,sp,848
   4126a:	0004                	.insn	2, 0x0004
   4126c:	0e88                	add	a0,sp,848
   4126e:	0004                	.insn	2, 0x0004
   41270:	0e88                	add	a0,sp,848
   41272:	0004                	.insn	2, 0x0004
   41274:	0e88                	add	a0,sp,848
   41276:	0004                	.insn	2, 0x0004
   41278:	0e88                	add	a0,sp,848
   4127a:	0004                	.insn	2, 0x0004
   4127c:	0e88                	add	a0,sp,848
   4127e:	0004                	.insn	2, 0x0004
   41280:	0e88                	add	a0,sp,848
   41282:	0004                	.insn	2, 0x0004
   41284:	0e88                	add	a0,sp,848
   41286:	0004                	.insn	2, 0x0004

Disassembly of section .text:

00041288 <__udivdi3>:
   41288:	88aa                	mv	a7,a0
   4128a:	832e                	mv	t1,a1
   4128c:	8732                	mv	a4,a2
   4128e:	882a                	mv	a6,a0
   41290:	87ae                	mv	a5,a1
   41292:	20069163          	bnez	a3,41494 <__udivdi3+0x20c>
   41296:	0004b5b7          	lui	a1,0x4b
   4129a:	ab458593          	add	a1,a1,-1356 # 4aab4 <__clz_tab>
   4129e:	0ac37f63          	bgeu	t1,a2,4135c <__udivdi3+0xd4>
   412a2:	66c1                	lui	a3,0x10
   412a4:	0ad67563          	bgeu	a2,a3,4134e <__udivdi3+0xc6>
   412a8:	10063693          	sltiu	a3,a2,256
   412ac:	0016b693          	seqz	a3,a3
   412b0:	068e                	sll	a3,a3,0x3
   412b2:	00d65533          	srl	a0,a2,a3
   412b6:	95aa                	add	a1,a1,a0
   412b8:	0005c583          	lbu	a1,0(a1)
   412bc:	02000513          	li	a0,32
   412c0:	96ae                	add	a3,a3,a1
   412c2:	40d505b3          	sub	a1,a0,a3
   412c6:	00d50b63          	beq	a0,a3,412dc <__udivdi3+0x54>
   412ca:	00b317b3          	sll	a5,t1,a1
   412ce:	00d8d6b3          	srl	a3,a7,a3
   412d2:	00b61733          	sll	a4,a2,a1
   412d6:	8fd5                	or	a5,a5,a3
   412d8:	00b89833          	sll	a6,a7,a1
   412dc:	01075593          	srl	a1,a4,0x10
   412e0:	02b7d333          	divu	t1,a5,a1
   412e4:	08074633          	zext.h	a2,a4
   412e8:	02b7f7b3          	remu	a5,a5,a1
   412ec:	851a                	mv	a0,t1
   412ee:	026608b3          	mul	a7,a2,t1
   412f2:	01079693          	sll	a3,a5,0x10
   412f6:	01085793          	srl	a5,a6,0x10
   412fa:	8fd5                	or	a5,a5,a3
   412fc:	0117fc63          	bgeu	a5,a7,41314 <__udivdi3+0x8c>
   41300:	97ba                	add	a5,a5,a4
   41302:	fff30513          	add	a0,t1,-1
   41306:	00e7e763          	bltu	a5,a4,41314 <__udivdi3+0x8c>
   4130a:	0117f563          	bgeu	a5,a7,41314 <__udivdi3+0x8c>
   4130e:	ffe30513          	add	a0,t1,-2
   41312:	97ba                	add	a5,a5,a4
   41314:	411787b3          	sub	a5,a5,a7
   41318:	02b7d8b3          	divu	a7,a5,a1
   4131c:	08084833          	zext.h	a6,a6
   41320:	02b7f7b3          	remu	a5,a5,a1
   41324:	031606b3          	mul	a3,a2,a7
   41328:	07c2                	sll	a5,a5,0x10
   4132a:	00f86833          	or	a6,a6,a5
   4132e:	87c6                	mv	a5,a7
   41330:	00d87b63          	bgeu	a6,a3,41346 <__udivdi3+0xbe>
   41334:	983a                	add	a6,a6,a4
   41336:	fff88793          	add	a5,a7,-1
   4133a:	00e86663          	bltu	a6,a4,41346 <__udivdi3+0xbe>
   4133e:	00d87463          	bgeu	a6,a3,41346 <__udivdi3+0xbe>
   41342:	ffe88793          	add	a5,a7,-2
   41346:	0542                	sll	a0,a0,0x10
   41348:	8d5d                	or	a0,a0,a5
   4134a:	4581                	li	a1,0
   4134c:	8082                	ret
   4134e:	01000537          	lui	a0,0x1000
   41352:	46e1                	li	a3,24
   41354:	f4a67fe3          	bgeu	a2,a0,412b2 <__udivdi3+0x2a>
   41358:	46c1                	li	a3,16
   4135a:	bfa1                	j	412b2 <__udivdi3+0x2a>
   4135c:	4681                	li	a3,0
   4135e:	ca09                	beqz	a2,41370 <__udivdi3+0xe8>
   41360:	67c1                	lui	a5,0x10
   41362:	08f67d63          	bgeu	a2,a5,413fc <__udivdi3+0x174>
   41366:	10063693          	sltiu	a3,a2,256
   4136a:	0016b693          	seqz	a3,a3
   4136e:	068e                	sll	a3,a3,0x3
   41370:	00d657b3          	srl	a5,a2,a3
   41374:	95be                	add	a1,a1,a5
   41376:	0005c783          	lbu	a5,0(a1)
   4137a:	97b6                	add	a5,a5,a3
   4137c:	02000693          	li	a3,32
   41380:	40f685b3          	sub	a1,a3,a5
   41384:	08f69363          	bne	a3,a5,4140a <__udivdi3+0x182>
   41388:	40c307b3          	sub	a5,t1,a2
   4138c:	4585                	li	a1,1
   4138e:	01075893          	srl	a7,a4,0x10
   41392:	0317de33          	divu	t3,a5,a7
   41396:	08074633          	zext.h	a2,a4
   4139a:	01085693          	srl	a3,a6,0x10
   4139e:	0317f7b3          	remu	a5,a5,a7
   413a2:	8572                	mv	a0,t3
   413a4:	03c60333          	mul	t1,a2,t3
   413a8:	07c2                	sll	a5,a5,0x10
   413aa:	8fd5                	or	a5,a5,a3
   413ac:	0067fc63          	bgeu	a5,t1,413c4 <__udivdi3+0x13c>
   413b0:	97ba                	add	a5,a5,a4
   413b2:	fffe0513          	add	a0,t3,-1
   413b6:	00e7e763          	bltu	a5,a4,413c4 <__udivdi3+0x13c>
   413ba:	0067f563          	bgeu	a5,t1,413c4 <__udivdi3+0x13c>
   413be:	ffee0513          	add	a0,t3,-2
   413c2:	97ba                	add	a5,a5,a4
   413c4:	406787b3          	sub	a5,a5,t1
   413c8:	0317d333          	divu	t1,a5,a7
   413cc:	08084833          	zext.h	a6,a6
   413d0:	0317f7b3          	remu	a5,a5,a7
   413d4:	026606b3          	mul	a3,a2,t1
   413d8:	07c2                	sll	a5,a5,0x10
   413da:	00f86833          	or	a6,a6,a5
   413de:	879a                	mv	a5,t1
   413e0:	00d87b63          	bgeu	a6,a3,413f6 <__udivdi3+0x16e>
   413e4:	983a                	add	a6,a6,a4
   413e6:	fff30793          	add	a5,t1,-1
   413ea:	00e86663          	bltu	a6,a4,413f6 <__udivdi3+0x16e>
   413ee:	00d87463          	bgeu	a6,a3,413f6 <__udivdi3+0x16e>
   413f2:	ffe30793          	add	a5,t1,-2
   413f6:	0542                	sll	a0,a0,0x10
   413f8:	8d5d                	or	a0,a0,a5
   413fa:	8082                	ret
   413fc:	010007b7          	lui	a5,0x1000
   41400:	46e1                	li	a3,24
   41402:	f6f677e3          	bgeu	a2,a5,41370 <__udivdi3+0xe8>
   41406:	46c1                	li	a3,16
   41408:	b7a5                	j	41370 <__udivdi3+0xe8>
   4140a:	00b61733          	sll	a4,a2,a1
   4140e:	00f356b3          	srl	a3,t1,a5
   41412:	01075513          	srl	a0,a4,0x10
   41416:	00b31333          	sll	t1,t1,a1
   4141a:	00f8d7b3          	srl	a5,a7,a5
   4141e:	0067e7b3          	or	a5,a5,t1
   41422:	02a6d333          	divu	t1,a3,a0
   41426:	00b89833          	sll	a6,a7,a1
   4142a:	08074633          	zext.h	a2,a4
   4142e:	02a6f6b3          	remu	a3,a3,a0
   41432:	026608b3          	mul	a7,a2,t1
   41436:	01069593          	sll	a1,a3,0x10
   4143a:	0107d693          	srl	a3,a5,0x10
   4143e:	8ecd                	or	a3,a3,a1
   41440:	859a                	mv	a1,t1
   41442:	0116fc63          	bgeu	a3,a7,4145a <__udivdi3+0x1d2>
   41446:	96ba                	add	a3,a3,a4
   41448:	fff30593          	add	a1,t1,-1
   4144c:	00e6e763          	bltu	a3,a4,4145a <__udivdi3+0x1d2>
   41450:	0116f563          	bgeu	a3,a7,4145a <__udivdi3+0x1d2>
   41454:	ffe30593          	add	a1,t1,-2
   41458:	96ba                	add	a3,a3,a4
   4145a:	411686b3          	sub	a3,a3,a7
   4145e:	02a6d8b3          	divu	a7,a3,a0
   41462:	0807c7b3          	zext.h	a5,a5
   41466:	02a6f6b3          	remu	a3,a3,a0
   4146a:	03160633          	mul	a2,a2,a7
   4146e:	06c2                	sll	a3,a3,0x10
   41470:	8fd5                	or	a5,a5,a3
   41472:	86c6                	mv	a3,a7
   41474:	00c7fc63          	bgeu	a5,a2,4148c <__udivdi3+0x204>
   41478:	97ba                	add	a5,a5,a4
   4147a:	fff88693          	add	a3,a7,-1
   4147e:	00e7e763          	bltu	a5,a4,4148c <__udivdi3+0x204>
   41482:	00c7f563          	bgeu	a5,a2,4148c <__udivdi3+0x204>
   41486:	ffe88693          	add	a3,a7,-2
   4148a:	97ba                	add	a5,a5,a4
   4148c:	05c2                	sll	a1,a1,0x10
   4148e:	8f91                	sub	a5,a5,a2
   41490:	8dd5                	or	a1,a1,a3
   41492:	bdf5                	j	4138e <__udivdi3+0x106>
   41494:	12d5ef63          	bltu	a1,a3,415d2 <__udivdi3+0x34a>
   41498:	67c1                	lui	a5,0x10
   4149a:	02f6ff63          	bgeu	a3,a5,414d8 <__udivdi3+0x250>
   4149e:	1006b713          	sltiu	a4,a3,256
   414a2:	00173713          	seqz	a4,a4
   414a6:	070e                	sll	a4,a4,0x3
   414a8:	0004b7b7          	lui	a5,0x4b
   414ac:	00e6d5b3          	srl	a1,a3,a4
   414b0:	ab478793          	add	a5,a5,-1356 # 4aab4 <__clz_tab>
   414b4:	97ae                	add	a5,a5,a1
   414b6:	0007c783          	lbu	a5,0(a5)
   414ba:	97ba                	add	a5,a5,a4
   414bc:	02000713          	li	a4,32
   414c0:	40f705b3          	sub	a1,a4,a5
   414c4:	02f71163          	bne	a4,a5,414e6 <__udivdi3+0x25e>
   414c8:	4505                	li	a0,1
   414ca:	e866e1e3          	bltu	a3,t1,4134c <__udivdi3+0xc4>
   414ce:	00c8b533          	sltu	a0,a7,a2
   414d2:	00153513          	seqz	a0,a0
   414d6:	8082                	ret
   414d8:	010007b7          	lui	a5,0x1000
   414dc:	4761                	li	a4,24
   414de:	fcf6f5e3          	bgeu	a3,a5,414a8 <__udivdi3+0x220>
   414e2:	4741                	li	a4,16
   414e4:	b7d1                	j	414a8 <__udivdi3+0x220>
   414e6:	00f65733          	srl	a4,a2,a5
   414ea:	00b696b3          	sll	a3,a3,a1
   414ee:	8ed9                	or	a3,a3,a4
   414f0:	00f35733          	srl	a4,t1,a5
   414f4:	00b31333          	sll	t1,t1,a1
   414f8:	00f8d7b3          	srl	a5,a7,a5
   414fc:	0067e7b3          	or	a5,a5,t1
   41500:	0106d313          	srl	t1,a3,0x10
   41504:	02675eb3          	divu	t4,a4,t1
   41508:	0806c833          	zext.h	a6,a3
   4150c:	00b61633          	sll	a2,a2,a1
   41510:	02677733          	remu	a4,a4,t1
   41514:	03d80e33          	mul	t3,a6,t4
   41518:	01071513          	sll	a0,a4,0x10
   4151c:	0107d713          	srl	a4,a5,0x10
   41520:	8f49                	or	a4,a4,a0
   41522:	8576                	mv	a0,t4
   41524:	01c77c63          	bgeu	a4,t3,4153c <__udivdi3+0x2b4>
   41528:	9736                	add	a4,a4,a3
   4152a:	fffe8513          	add	a0,t4,-1
   4152e:	00d76763          	bltu	a4,a3,4153c <__udivdi3+0x2b4>
   41532:	01c77563          	bgeu	a4,t3,4153c <__udivdi3+0x2b4>
   41536:	ffee8513          	add	a0,t4,-2
   4153a:	9736                	add	a4,a4,a3
   4153c:	41c70733          	sub	a4,a4,t3
   41540:	02675e33          	divu	t3,a4,t1
   41544:	0807c7b3          	zext.h	a5,a5
   41548:	02677733          	remu	a4,a4,t1
   4154c:	03c80833          	mul	a6,a6,t3
   41550:	0742                	sll	a4,a4,0x10
   41552:	8fd9                	or	a5,a5,a4
   41554:	8772                	mv	a4,t3
   41556:	0107fc63          	bgeu	a5,a6,4156e <__udivdi3+0x2e6>
   4155a:	97b6                	add	a5,a5,a3
   4155c:	fffe0713          	add	a4,t3,-1
   41560:	00d7e763          	bltu	a5,a3,4156e <__udivdi3+0x2e6>
   41564:	0107f563          	bgeu	a5,a6,4156e <__udivdi3+0x2e6>
   41568:	ffee0713          	add	a4,t3,-2
   4156c:	97b6                	add	a5,a5,a3
   4156e:	0542                	sll	a0,a0,0x10
   41570:	6e41                	lui	t3,0x10
   41572:	8d59                	or	a0,a0,a4
   41574:	fffe0693          	add	a3,t3,-1 # ffff <__fw_size__+0x4d27>
   41578:	00d57733          	and	a4,a0,a3
   4157c:	410787b3          	sub	a5,a5,a6
   41580:	8ef1                	and	a3,a3,a2
   41582:	01055813          	srl	a6,a0,0x10
   41586:	8241                	srl	a2,a2,0x10
   41588:	02d70333          	mul	t1,a4,a3
   4158c:	02d806b3          	mul	a3,a6,a3
   41590:	02c70733          	mul	a4,a4,a2
   41594:	02c80833          	mul	a6,a6,a2
   41598:	00d70633          	add	a2,a4,a3
   4159c:	01035713          	srl	a4,t1,0x10
   415a0:	9732                	add	a4,a4,a2
   415a2:	00d77363          	bgeu	a4,a3,415a8 <__udivdi3+0x320>
   415a6:	9872                	add	a6,a6,t3
   415a8:	01075693          	srl	a3,a4,0x10
   415ac:	96c2                	add	a3,a3,a6
   415ae:	02d7e063          	bltu	a5,a3,415ce <__udivdi3+0x346>
   415b2:	d8d79ce3          	bne	a5,a3,4134a <__udivdi3+0xc2>
   415b6:	67c1                	lui	a5,0x10
   415b8:	17fd                	add	a5,a5,-1 # ffff <__fw_size__+0x4d27>
   415ba:	8f7d                	and	a4,a4,a5
   415bc:	0742                	sll	a4,a4,0x10
   415be:	00f37333          	and	t1,t1,a5
   415c2:	00b898b3          	sll	a7,a7,a1
   415c6:	971a                	add	a4,a4,t1
   415c8:	4581                	li	a1,0
   415ca:	d8e8f1e3          	bgeu	a7,a4,4134c <__udivdi3+0xc4>
   415ce:	157d                	add	a0,a0,-1 # ffffff <_flash_size+0xbfffff>
   415d0:	bbad                	j	4134a <__udivdi3+0xc2>
   415d2:	4581                	li	a1,0
   415d4:	4501                	li	a0,0
   415d6:	8082                	ret

000415d8 <__adddf3>:
   415d8:	00100837          	lui	a6,0x100
   415dc:	187d                	add	a6,a6,-1 # fffff <__fast_load_addr__+0xb497f>
   415de:	00b87333          	and	t1,a6,a1
   415e2:	0145d713          	srl	a4,a1,0x14
   415e6:	7ff77893          	and	a7,a4,2047
   415ea:	01d55793          	srl	a5,a0,0x1d
   415ee:	00331713          	sll	a4,t1,0x3
   415f2:	00d87833          	and	a6,a6,a3
   415f6:	0146d313          	srl	t1,a3,0x14
   415fa:	8fd9                	or	a5,a5,a4
   415fc:	7ff37313          	and	t1,t1,2047
   41600:	01d65713          	srl	a4,a2,0x1d
   41604:	080e                	sll	a6,a6,0x3
   41606:	81fd                	srl	a1,a1,0x1f
   41608:	82fd                	srl	a3,a3,0x1f
   4160a:	050e                	sll	a0,a0,0x3
   4160c:	01076733          	or	a4,a4,a6
   41610:	060e                	sll	a2,a2,0x3
   41612:	40688e33          	sub	t3,a7,t1
   41616:	22d59963          	bne	a1,a3,41848 <__adddf3+0x270>
   4161a:	0fc05463          	blez	t3,41702 <__adddf3+0x12a>
   4161e:	02031a63          	bnez	t1,41652 <__adddf3+0x7a>
   41622:	00c766b3          	or	a3,a4,a2
   41626:	52068363          	beqz	a3,41b4c <__adddf3+0x574>
   4162a:	fffe0813          	add	a6,t3,-1
   4162e:	00081b63          	bnez	a6,41644 <__adddf3+0x6c>
   41632:	962a                	add	a2,a2,a0
   41634:	00a636b3          	sltu	a3,a2,a0
   41638:	973e                	add	a4,a4,a5
   4163a:	8532                	mv	a0,a2
   4163c:	00d707b3          	add	a5,a4,a3
   41640:	4885                	li	a7,1
   41642:	a8b1                	j	4169e <__adddf3+0xc6>
   41644:	7ff00693          	li	a3,2047
   41648:	00de1c63          	bne	t3,a3,41660 <__adddf3+0x88>
   4164c:	7ff00893          	li	a7,2047
   41650:	a245                	j	417f0 <__adddf3+0x218>
   41652:	7ff00693          	li	a3,2047
   41656:	18d88d63          	beq	a7,a3,417f0 <__adddf3+0x218>
   4165a:	8872                	mv	a6,t3
   4165c:	29771713          	bset	a4,a4,0x17
   41660:	03800693          	li	a3,56
   41664:	0906ca63          	blt	a3,a6,416f8 <__adddf3+0x120>
   41668:	46fd                	li	a3,31
   4166a:	0706c063          	blt	a3,a6,416ca <__adddf3+0xf2>
   4166e:	02000313          	li	t1,32
   41672:	41030333          	sub	t1,t1,a6
   41676:	006716b3          	sll	a3,a4,t1
   4167a:	01065e33          	srl	t3,a2,a6
   4167e:	00661333          	sll	t1,a2,t1
   41682:	01c6e6b3          	or	a3,a3,t3
   41686:	00603333          	snez	t1,t1
   4168a:	0066e6b3          	or	a3,a3,t1
   4168e:	01075833          	srl	a6,a4,a6
   41692:	9536                	add	a0,a0,a3
   41694:	983e                	add	a6,a6,a5
   41696:	00d536b3          	sltu	a3,a0,a3
   4169a:	00d807b3          	add	a5,a6,a3
   4169e:	00879713          	sll	a4,a5,0x8
   416a2:	14075763          	bgez	a4,417f0 <__adddf3+0x218>
   416a6:	0885                	add	a7,a7,1
   416a8:	7ff00713          	li	a4,2047
   416ac:	48e88d63          	beq	a7,a4,41b46 <__adddf3+0x56e>
   416b0:	00155713          	srl	a4,a0,0x1
   416b4:	8905                	and	a0,a0,1
   416b6:	fff7f693          	and	a3,a5,-1
   416ba:	8d59                	or	a0,a0,a4
   416bc:	07fe                	sll	a5,a5,0x1f
   416be:	8d5d                	or	a0,a0,a5
   416c0:	49769693          	bclr	a3,a3,0x17
   416c4:	0016d793          	srl	a5,a3,0x1
   416c8:	a225                	j	417f0 <__adddf3+0x218>
   416ca:	fe080693          	add	a3,a6,-32
   416ce:	02000e13          	li	t3,32
   416d2:	00d756b3          	srl	a3,a4,a3
   416d6:	4301                	li	t1,0
   416d8:	01c80863          	beq	a6,t3,416e8 <__adddf3+0x110>
   416dc:	04000313          	li	t1,64
   416e0:	41030333          	sub	t1,t1,a6
   416e4:	00671333          	sll	t1,a4,t1
   416e8:	00c36333          	or	t1,t1,a2
   416ec:	00603333          	snez	t1,t1
   416f0:	0066e6b3          	or	a3,a3,t1
   416f4:	4801                	li	a6,0
   416f6:	bf71                	j	41692 <__adddf3+0xba>
   416f8:	00c766b3          	or	a3,a4,a2
   416fc:	00d036b3          	snez	a3,a3
   41700:	bfd5                	j	416f4 <__adddf3+0x11c>
   41702:	0a0e0a63          	beqz	t3,417b6 <__adddf3+0x1de>
   41706:	411306b3          	sub	a3,t1,a7
   4170a:	02089163          	bnez	a7,4172c <__adddf3+0x154>
   4170e:	00a7e833          	or	a6,a5,a0
   41712:	42080263          	beqz	a6,41b36 <__adddf3+0x55e>
   41716:	fff68813          	add	a6,a3,-1 # ffff <__fw_size__+0x4d27>
   4171a:	f0080ce3          	beqz	a6,41632 <__adddf3+0x5a>
   4171e:	7ff00893          	li	a7,2047
   41722:	01169c63          	bne	a3,a7,4173a <__adddf3+0x162>
   41726:	87ba                	mv	a5,a4
   41728:	8532                	mv	a0,a2
   4172a:	b70d                	j	4164c <__adddf3+0x74>
   4172c:	7ff00813          	li	a6,2047
   41730:	ff030be3          	beq	t1,a6,41726 <__adddf3+0x14e>
   41734:	8836                	mv	a6,a3
   41736:	29779793          	bset	a5,a5,0x17
   4173a:	03800693          	li	a3,56
   4173e:	0706c763          	blt	a3,a6,417ac <__adddf3+0x1d4>
   41742:	46fd                	li	a3,31
   41744:	0306cd63          	blt	a3,a6,4177e <__adddf3+0x1a6>
   41748:	02000893          	li	a7,32
   4174c:	410888b3          	sub	a7,a7,a6
   41750:	011796b3          	sll	a3,a5,a7
   41754:	01055e33          	srl	t3,a0,a6
   41758:	011518b3          	sll	a7,a0,a7
   4175c:	01c6e6b3          	or	a3,a3,t3
   41760:	011038b3          	snez	a7,a7
   41764:	0116e6b3          	or	a3,a3,a7
   41768:	0107d833          	srl	a6,a5,a6
   4176c:	9636                	add	a2,a2,a3
   4176e:	983a                	add	a6,a6,a4
   41770:	00d636b3          	sltu	a3,a2,a3
   41774:	8532                	mv	a0,a2
   41776:	00d807b3          	add	a5,a6,a3
   4177a:	889a                	mv	a7,t1
   4177c:	b70d                	j	4169e <__adddf3+0xc6>
   4177e:	fe080693          	add	a3,a6,-32
   41782:	02000e13          	li	t3,32
   41786:	00d7d6b3          	srl	a3,a5,a3
   4178a:	4881                	li	a7,0
   4178c:	01c80863          	beq	a6,t3,4179c <__adddf3+0x1c4>
   41790:	04000893          	li	a7,64
   41794:	410888b3          	sub	a7,a7,a6
   41798:	011798b3          	sll	a7,a5,a7
   4179c:	00a8e8b3          	or	a7,a7,a0
   417a0:	011038b3          	snez	a7,a7
   417a4:	0116e6b3          	or	a3,a3,a7
   417a8:	4801                	li	a6,0
   417aa:	b7c9                	j	4176c <__adddf3+0x194>
   417ac:	00a7e6b3          	or	a3,a5,a0
   417b0:	00d036b3          	snez	a3,a3
   417b4:	bfd5                	j	417a8 <__adddf3+0x1d0>
   417b6:	00188693          	add	a3,a7,1
   417ba:	7fe6f813          	and	a6,a3,2046
   417be:	06081463          	bnez	a6,41826 <__adddf3+0x24e>
   417c2:	00a7e6b3          	or	a3,a5,a0
   417c6:	04089563          	bnez	a7,41810 <__adddf3+0x238>
   417ca:	36068963          	beqz	a3,41b3c <__adddf3+0x564>
   417ce:	00c766b3          	or	a3,a4,a2
   417d2:	ce99                	beqz	a3,417f0 <__adddf3+0x218>
   417d4:	962a                	add	a2,a2,a0
   417d6:	00a636b3          	sltu	a3,a2,a0
   417da:	973e                	add	a4,a4,a5
   417dc:	00d707b3          	add	a5,a4,a3
   417e0:	00879713          	sll	a4,a5,0x8
   417e4:	8532                	mv	a0,a2
   417e6:	00075563          	bgez	a4,417f0 <__adddf3+0x218>
   417ea:	4885                	li	a7,1
   417ec:	49779793          	bclr	a5,a5,0x17
   417f0:	00757713          	and	a4,a0,7
   417f4:	36070463          	beqz	a4,41b5c <__adddf3+0x584>
   417f8:	00f57713          	and	a4,a0,15
   417fc:	4691                	li	a3,4
   417fe:	34d70f63          	beq	a4,a3,41b5c <__adddf3+0x584>
   41802:	00450713          	add	a4,a0,4
   41806:	00a736b3          	sltu	a3,a4,a0
   4180a:	97b6                	add	a5,a5,a3
   4180c:	853a                	mv	a0,a4
   4180e:	a6b9                	j	41b5c <__adddf3+0x584>
   41810:	da99                	beqz	a3,41726 <__adddf3+0x14e>
   41812:	8e59                	or	a2,a2,a4
   41814:	e2060ce3          	beqz	a2,4164c <__adddf3+0x74>
   41818:	4581                	li	a1,0
   4181a:	004007b7          	lui	a5,0x400
   4181e:	4501                	li	a0,0
   41820:	7ff00893          	li	a7,2047
   41824:	ae25                	j	41b5c <__adddf3+0x584>
   41826:	7ff00813          	li	a6,2047
   4182a:	31068c63          	beq	a3,a6,41b42 <__adddf3+0x56a>
   4182e:	962a                	add	a2,a2,a0
   41830:	00a63533          	sltu	a0,a2,a0
   41834:	973e                	add	a4,a4,a5
   41836:	972a                	add	a4,a4,a0
   41838:	01f71513          	sll	a0,a4,0x1f
   4183c:	8205                	srl	a2,a2,0x1
   4183e:	8d51                	or	a0,a0,a2
   41840:	00175793          	srl	a5,a4,0x1
   41844:	88b6                	mv	a7,a3
   41846:	b76d                	j	417f0 <__adddf3+0x218>
   41848:	0dc05a63          	blez	t3,4191c <__adddf3+0x344>
   4184c:	08031563          	bnez	t1,418d6 <__adddf3+0x2fe>
   41850:	00c766b3          	or	a3,a4,a2
   41854:	2e068c63          	beqz	a3,41b4c <__adddf3+0x574>
   41858:	fffe0693          	add	a3,t3,-1
   4185c:	ee81                	bnez	a3,41874 <__adddf3+0x29c>
   4185e:	40c50633          	sub	a2,a0,a2
   41862:	00c536b3          	sltu	a3,a0,a2
   41866:	40e78733          	sub	a4,a5,a4
   4186a:	8532                	mv	a0,a2
   4186c:	40d707b3          	sub	a5,a4,a3
   41870:	4885                	li	a7,1
   41872:	a0b9                	j	418c0 <__adddf3+0x2e8>
   41874:	7ff00813          	li	a6,2047
   41878:	dd0e0ae3          	beq	t3,a6,4164c <__adddf3+0x74>
   4187c:	03800813          	li	a6,56
   41880:	08d84a63          	blt	a6,a3,41914 <__adddf3+0x33c>
   41884:	487d                	li	a6,31
   41886:	06d84063          	blt	a6,a3,418e6 <__adddf3+0x30e>
   4188a:	02000313          	li	t1,32
   4188e:	40d30333          	sub	t1,t1,a3
   41892:	00d65e33          	srl	t3,a2,a3
   41896:	00671833          	sll	a6,a4,t1
   4189a:	00661333          	sll	t1,a2,t1
   4189e:	01c86833          	or	a6,a6,t3
   418a2:	00603333          	snez	t1,t1
   418a6:	00686633          	or	a2,a6,t1
   418aa:	00d756b3          	srl	a3,a4,a3
   418ae:	40c50633          	sub	a2,a0,a2
   418b2:	00c53733          	sltu	a4,a0,a2
   418b6:	40d786b3          	sub	a3,a5,a3
   418ba:	8532                	mv	a0,a2
   418bc:	40e687b3          	sub	a5,a3,a4
   418c0:	00879713          	sll	a4,a5,0x8
   418c4:	f20756e3          	bgez	a4,417f0 <__adddf3+0x218>
   418c8:	00800837          	lui	a6,0x800
   418cc:	187d                	add	a6,a6,-1 # 7fffff <_flash_size+0x3fffff>
   418ce:	0107f833          	and	a6,a5,a6
   418d2:	832a                	mv	t1,a0
   418d4:	aa5d                	j	41a8a <__adddf3+0x4b2>
   418d6:	7ff00693          	li	a3,2047
   418da:	f0d88be3          	beq	a7,a3,417f0 <__adddf3+0x218>
   418de:	86f2                	mv	a3,t3
   418e0:	29771713          	bset	a4,a4,0x17
   418e4:	bf61                	j	4187c <__adddf3+0x2a4>
   418e6:	fe068813          	add	a6,a3,-32
   418ea:	02000e13          	li	t3,32
   418ee:	01075833          	srl	a6,a4,a6
   418f2:	4301                	li	t1,0
   418f4:	01c68863          	beq	a3,t3,41904 <__adddf3+0x32c>
   418f8:	04000313          	li	t1,64
   418fc:	40d30333          	sub	t1,t1,a3
   41900:	00671333          	sll	t1,a4,t1
   41904:	00c36333          	or	t1,t1,a2
   41908:	00603333          	snez	t1,t1
   4190c:	00686633          	or	a2,a6,t1
   41910:	4681                	li	a3,0
   41912:	bf71                	j	418ae <__adddf3+0x2d6>
   41914:	8e59                	or	a2,a2,a4
   41916:	00c03633          	snez	a2,a2
   4191a:	bfdd                	j	41910 <__adddf3+0x338>
   4191c:	0c0e0563          	beqz	t3,419e6 <__adddf3+0x40e>
   41920:	41130833          	sub	a6,t1,a7
   41924:	02089b63          	bnez	a7,4195a <__adddf3+0x382>
   41928:	00a7e5b3          	or	a1,a5,a0
   4192c:	22058263          	beqz	a1,41b50 <__adddf3+0x578>
   41930:	fff80593          	add	a1,a6,-1
   41934:	e991                	bnez	a1,41948 <__adddf3+0x370>
   41936:	40a60533          	sub	a0,a2,a0
   4193a:	8f1d                	sub	a4,a4,a5
   4193c:	00a63633          	sltu	a2,a2,a0
   41940:	40c707b3          	sub	a5,a4,a2
   41944:	85b6                	mv	a1,a3
   41946:	b72d                	j	41870 <__adddf3+0x298>
   41948:	7ff00893          	li	a7,2047
   4194c:	01181e63          	bne	a6,a7,41968 <__adddf3+0x390>
   41950:	87ba                	mv	a5,a4
   41952:	8532                	mv	a0,a2
   41954:	7ff00893          	li	a7,2047
   41958:	a84d                	j	41a0a <__adddf3+0x432>
   4195a:	7ff00593          	li	a1,2047
   4195e:	feb309e3          	beq	t1,a1,41950 <__adddf3+0x378>
   41962:	85c2                	mv	a1,a6
   41964:	29779793          	bset	a5,a5,0x17
   41968:	03800813          	li	a6,56
   4196c:	06b84963          	blt	a6,a1,419de <__adddf3+0x406>
   41970:	487d                	li	a6,31
   41972:	02b84f63          	blt	a6,a1,419b0 <__adddf3+0x3d8>
   41976:	02000893          	li	a7,32
   4197a:	40b888b3          	sub	a7,a7,a1
   4197e:	00b55e33          	srl	t3,a0,a1
   41982:	01179833          	sll	a6,a5,a7
   41986:	011518b3          	sll	a7,a0,a7
   4198a:	01c86833          	or	a6,a6,t3
   4198e:	011038b3          	snez	a7,a7
   41992:	01186533          	or	a0,a6,a7
   41996:	00b7d5b3          	srl	a1,a5,a1
   4199a:	40a60533          	sub	a0,a2,a0
   4199e:	40b705b3          	sub	a1,a4,a1
   419a2:	00a63633          	sltu	a2,a2,a0
   419a6:	40c587b3          	sub	a5,a1,a2
   419aa:	889a                	mv	a7,t1
   419ac:	85b6                	mv	a1,a3
   419ae:	bf09                	j	418c0 <__adddf3+0x2e8>
   419b0:	fe058813          	add	a6,a1,-32
   419b4:	02000e13          	li	t3,32
   419b8:	0107d833          	srl	a6,a5,a6
   419bc:	4881                	li	a7,0
   419be:	01c58863          	beq	a1,t3,419ce <__adddf3+0x3f6>
   419c2:	04000893          	li	a7,64
   419c6:	40b888b3          	sub	a7,a7,a1
   419ca:	011798b3          	sll	a7,a5,a7
   419ce:	00a8e8b3          	or	a7,a7,a0
   419d2:	011038b3          	snez	a7,a7
   419d6:	01186533          	or	a0,a6,a7
   419da:	4581                	li	a1,0
   419dc:	bf7d                	j	4199a <__adddf3+0x3c2>
   419de:	8d5d                	or	a0,a0,a5
   419e0:	00a03533          	snez	a0,a0
   419e4:	bfdd                	j	419da <__adddf3+0x402>
   419e6:	00188813          	add	a6,a7,1
   419ea:	7fe87813          	and	a6,a6,2046
   419ee:	06081863          	bnez	a6,41a5e <__adddf3+0x486>
   419f2:	00a7e333          	or	t1,a5,a0
   419f6:	00c76833          	or	a6,a4,a2
   419fa:	04089763          	bnez	a7,41a48 <__adddf3+0x470>
   419fe:	00031863          	bnez	t1,41a0e <__adddf3+0x436>
   41a02:	0e080363          	beqz	a6,41ae8 <__adddf3+0x510>
   41a06:	87ba                	mv	a5,a4
   41a08:	8532                	mv	a0,a2
   41a0a:	85b6                	mv	a1,a3
   41a0c:	b3d5                	j	417f0 <__adddf3+0x218>
   41a0e:	de0801e3          	beqz	a6,417f0 <__adddf3+0x218>
   41a12:	40c50333          	sub	t1,a0,a2
   41a16:	00653e33          	sltu	t3,a0,t1
   41a1a:	40e78833          	sub	a6,a5,a4
   41a1e:	41c80833          	sub	a6,a6,t3
   41a22:	00881e13          	sll	t3,a6,0x8
   41a26:	000e5a63          	bgez	t3,41a3a <__adddf3+0x462>
   41a2a:	40a60533          	sub	a0,a2,a0
   41a2e:	8f1d                	sub	a4,a4,a5
   41a30:	00a63633          	sltu	a2,a2,a0
   41a34:	40c707b3          	sub	a5,a4,a2
   41a38:	bfc9                	j	41a0a <__adddf3+0x432>
   41a3a:	01036533          	or	a0,t1,a6
   41a3e:	10050d63          	beqz	a0,41b58 <__adddf3+0x580>
   41a42:	87c2                	mv	a5,a6
   41a44:	851a                	mv	a0,t1
   41a46:	b36d                	j	417f0 <__adddf3+0x218>
   41a48:	00031863          	bnez	t1,41a58 <__adddf3+0x480>
   41a4c:	dc0806e3          	beqz	a6,41818 <__adddf3+0x240>
   41a50:	87ba                	mv	a5,a4
   41a52:	8532                	mv	a0,a2
   41a54:	85b6                	mv	a1,a3
   41a56:	bedd                	j	4164c <__adddf3+0x74>
   41a58:	be080ae3          	beqz	a6,4164c <__adddf3+0x74>
   41a5c:	bb75                	j	41818 <__adddf3+0x240>
   41a5e:	40c50e33          	sub	t3,a0,a2
   41a62:	01c53eb3          	sltu	t4,a0,t3
   41a66:	40e78833          	sub	a6,a5,a4
   41a6a:	41d80833          	sub	a6,a6,t4
   41a6e:	00881e93          	sll	t4,a6,0x8
   41a72:	8372                	mv	t1,t3
   41a74:	060ed563          	bgez	t4,41ade <__adddf3+0x506>
   41a78:	40a60333          	sub	t1,a2,a0
   41a7c:	40f70833          	sub	a6,a4,a5
   41a80:	00663633          	sltu	a2,a2,t1
   41a84:	40c80833          	sub	a6,a6,a2
   41a88:	85b6                	mv	a1,a3
   41a8a:	06080163          	beqz	a6,41aec <__adddf3+0x514>
   41a8e:	60081513          	clz	a0,a6
   41a92:	1561                	add	a0,a0,-8
   41a94:	02000793          	li	a5,32
   41a98:	8f89                	sub	a5,a5,a0
   41a9a:	00a81833          	sll	a6,a6,a0
   41a9e:	00f357b3          	srl	a5,t1,a5
   41aa2:	0107e7b3          	or	a5,a5,a6
   41aa6:	00a31833          	sll	a6,t1,a0
   41aaa:	09154063          	blt	a0,a7,41b2a <__adddf3+0x552>
   41aae:	41150533          	sub	a0,a0,a7
   41ab2:	00150693          	add	a3,a0,1
   41ab6:	477d                	li	a4,31
   41ab8:	04d74563          	blt	a4,a3,41b02 <__adddf3+0x52a>
   41abc:	02000713          	li	a4,32
   41ac0:	8f15                	sub	a4,a4,a3
   41ac2:	00e79533          	sll	a0,a5,a4
   41ac6:	00d85633          	srl	a2,a6,a3
   41aca:	00e81733          	sll	a4,a6,a4
   41ace:	8d51                	or	a0,a0,a2
   41ad0:	00e03733          	snez	a4,a4
   41ad4:	8d59                	or	a0,a0,a4
   41ad6:	00d7d7b3          	srl	a5,a5,a3
   41ada:	4881                	li	a7,0
   41adc:	bb11                	j	417f0 <__adddf3+0x218>
   41ade:	010e6e33          	or	t3,t3,a6
   41ae2:	fa0e14e3          	bnez	t3,41a8a <__adddf3+0x4b2>
   41ae6:	4881                	li	a7,0
   41ae8:	4581                	li	a1,0
   41aea:	a8b1                	j	41b46 <__adddf3+0x56e>
   41aec:	60031793          	clz	a5,t1
   41af0:	477d                	li	a4,31
   41af2:	01878513          	add	a0,a5,24 # 400018 <_flash_size+0x18>
   41af6:	f8a75fe3          	bge	a4,a0,41a94 <__adddf3+0x4bc>
   41afa:	17e1                	add	a5,a5,-8
   41afc:	00f317b3          	sll	a5,t1,a5
   41b00:	b76d                	j	41aaa <__adddf3+0x4d2>
   41b02:	1505                	add	a0,a0,-31
   41b04:	02000613          	li	a2,32
   41b08:	00a7d533          	srl	a0,a5,a0
   41b0c:	4701                	li	a4,0
   41b0e:	00c68763          	beq	a3,a2,41b1c <__adddf3+0x544>
   41b12:	04000713          	li	a4,64
   41b16:	8f15                	sub	a4,a4,a3
   41b18:	00e79733          	sll	a4,a5,a4
   41b1c:	00e86733          	or	a4,a6,a4
   41b20:	00e03733          	snez	a4,a4
   41b24:	8d59                	or	a0,a0,a4
   41b26:	4781                	li	a5,0
   41b28:	bf4d                	j	41ada <__adddf3+0x502>
   41b2a:	40a888b3          	sub	a7,a7,a0
   41b2e:	49779793          	bclr	a5,a5,0x17
   41b32:	8542                	mv	a0,a6
   41b34:	b975                	j	417f0 <__adddf3+0x218>
   41b36:	87ba                	mv	a5,a4
   41b38:	8532                	mv	a0,a2
   41b3a:	b329                	j	41844 <__adddf3+0x26c>
   41b3c:	87ba                	mv	a5,a4
   41b3e:	8532                	mv	a0,a2
   41b40:	b945                	j	417f0 <__adddf3+0x218>
   41b42:	7ff00893          	li	a7,2047
   41b46:	4781                	li	a5,0
   41b48:	4501                	li	a0,0
   41b4a:	a809                	j	41b5c <__adddf3+0x584>
   41b4c:	88f2                	mv	a7,t3
   41b4e:	b14d                	j	417f0 <__adddf3+0x218>
   41b50:	87ba                	mv	a5,a4
   41b52:	8532                	mv	a0,a2
   41b54:	88c2                	mv	a7,a6
   41b56:	bd55                	j	41a0a <__adddf3+0x432>
   41b58:	4781                	li	a5,0
   41b5a:	4581                	li	a1,0
   41b5c:	00879713          	sll	a4,a5,0x8
   41b60:	00075b63          	bgez	a4,41b76 <__adddf3+0x59e>
   41b64:	0885                	add	a7,a7,1
   41b66:	7ff00713          	li	a4,2047
   41b6a:	49779793          	bclr	a5,a5,0x17
   41b6e:	00e89463          	bne	a7,a4,41b76 <__adddf3+0x59e>
   41b72:	4781                	li	a5,0
   41b74:	4501                	li	a0,0
   41b76:	01d79693          	sll	a3,a5,0x1d
   41b7a:	810d                	srl	a0,a0,0x3
   41b7c:	7ff00713          	li	a4,2047
   41b80:	8ec9                	or	a3,a3,a0
   41b82:	838d                	srl	a5,a5,0x3
   41b84:	00e89963          	bne	a7,a4,41b96 <__adddf3+0x5be>
   41b88:	8edd                	or	a3,a3,a5
   41b8a:	4781                	li	a5,0
   41b8c:	c689                	beqz	a3,41b96 <__adddf3+0x5be>
   41b8e:	000807b7          	lui	a5,0x80
   41b92:	4681                	li	a3,0
   41b94:	4581                	li	a1,0
   41b96:	01489713          	sll	a4,a7,0x14
   41b9a:	7ff00637          	lui	a2,0x7ff00
   41b9e:	07b2                	sll	a5,a5,0xc
   41ba0:	8f71                	and	a4,a4,a2
   41ba2:	83b1                	srl	a5,a5,0xc
   41ba4:	8fd9                	or	a5,a5,a4
   41ba6:	01f59713          	sll	a4,a1,0x1f
   41baa:	00e7e633          	or	a2,a5,a4
   41bae:	8536                	mv	a0,a3
   41bb0:	85b2                	mv	a1,a2
   41bb2:	8082                	ret

00041bb4 <__divdf3>:
   41bb4:	1141                	add	sp,sp,-16
   41bb6:	882a                	mv	a6,a0
   41bb8:	87aa                	mv	a5,a0
   41bba:	0145d513          	srl	a0,a1,0x14
   41bbe:	00c59713          	sll	a4,a1,0xc
   41bc2:	c622                	sw	s0,12(sp)
   41bc4:	c426                	sw	s1,8(sp)
   41bc6:	7ff57513          	and	a0,a0,2047
   41bca:	8331                	srl	a4,a4,0xc
   41bcc:	81fd                	srl	a1,a1,0x1f
   41bce:	c149                	beqz	a0,41c50 <__divdf3+0x9c>
   41bd0:	7ff00893          	li	a7,2047
   41bd4:	0d150663          	beq	a0,a7,41ca0 <__divdf3+0xec>
   41bd8:	01d85e93          	srl	t4,a6,0x1d
   41bdc:	070e                	sll	a4,a4,0x3
   41bde:	00eeeeb3          	or	t4,t4,a4
   41be2:	00381793          	sll	a5,a6,0x3
   41be6:	c0150513          	add	a0,a0,-1023
   41bea:	297e9e93          	bset	t4,t4,0x17
   41bee:	4301                	li	t1,0
   41bf0:	0146d893          	srl	a7,a3,0x14
   41bf4:	00c69813          	sll	a6,a3,0xc
   41bf8:	7ff8f893          	and	a7,a7,2047
   41bfc:	00c85813          	srl	a6,a6,0xc
   41c00:	82fd                	srl	a3,a3,0x1f
   41c02:	0c088163          	beqz	a7,41cc4 <__divdf3+0x110>
   41c06:	7ff00713          	li	a4,2047
   41c0a:	10e88863          	beq	a7,a4,41d1a <__divdf3+0x166>
   41c0e:	01d65713          	srl	a4,a2,0x1d
   41c12:	080e                	sll	a6,a6,0x3
   41c14:	01076833          	or	a6,a4,a6
   41c18:	00361f93          	sll	t6,a2,0x3
   41c1c:	c0188893          	add	a7,a7,-1023
   41c20:	29781813          	bset	a6,a6,0x17
   41c24:	4701                	li	a4,0
   41c26:	41150533          	sub	a0,a0,a7
   41c2a:	00231893          	sll	a7,t1,0x2
   41c2e:	00e8e8b3          	or	a7,a7,a4
   41c32:	18fd                	add	a7,a7,-1
   41c34:	4e39                	li	t3,14
   41c36:	00d5c633          	xor	a2,a1,a3
   41c3a:	111e6263          	bltu	t3,a7,41d3e <__divdf3+0x18a>
   41c3e:	0004be37          	lui	t3,0x4b
   41c42:	a78e0e13          	add	t3,t3,-1416 # 4aa78 <_lseek+0x2c>
   41c46:	21c8c8b3          	sh2add	a7,a7,t3
   41c4a:	0008a883          	lw	a7,0(a7)
   41c4e:	8882                	jr	a7
   41c50:	01076eb3          	or	t4,a4,a6
   41c54:	040e8f63          	beqz	t4,41cb2 <__divdf3+0xfe>
   41c58:	c71d                	beqz	a4,41c86 <__divdf3+0xd2>
   41c5a:	60071793          	clz	a5,a4
   41c5e:	ff578513          	add	a0,a5,-11 # 7fff5 <__fast_load_addr__+0x34975>
   41c62:	4ef5                	li	t4,29
   41c64:	ff878893          	add	a7,a5,-8
   41c68:	40ae8eb3          	sub	t4,t4,a0
   41c6c:	01171733          	sll	a4,a4,a7
   41c70:	01d85eb3          	srl	t4,a6,t4
   41c74:	00eeeeb3          	or	t4,t4,a4
   41c78:	01181733          	sll	a4,a6,a7
   41c7c:	c0d00513          	li	a0,-1011
   41c80:	8d1d                	sub	a0,a0,a5
   41c82:	87ba                	mv	a5,a4
   41c84:	b7ad                	j	41bee <__divdf3+0x3a>
   41c86:	60081e93          	clz	t4,a6
   41c8a:	48f1                	li	a7,28
   41c8c:	015e8513          	add	a0,t4,21
   41c90:	020e8793          	add	a5,t4,32
   41c94:	fca8d7e3          	bge	a7,a0,41c62 <__divdf3+0xae>
   41c98:	1ee1                	add	t4,t4,-8
   41c9a:	01d81eb3          	sll	t4,a6,t4
   41c9e:	bff9                	j	41c7c <__divdf3+0xc8>
   41ca0:	01076eb3          	or	t4,a4,a6
   41ca4:	000e9b63          	bnez	t4,41cba <__divdf3+0x106>
   41ca8:	4781                	li	a5,0
   41caa:	7ff00513          	li	a0,2047
   41cae:	4309                	li	t1,2
   41cb0:	b781                	j	41bf0 <__divdf3+0x3c>
   41cb2:	4781                	li	a5,0
   41cb4:	4501                	li	a0,0
   41cb6:	4305                	li	t1,1
   41cb8:	bf25                	j	41bf0 <__divdf3+0x3c>
   41cba:	8eba                	mv	t4,a4
   41cbc:	7ff00513          	li	a0,2047
   41cc0:	430d                	li	t1,3
   41cc2:	b73d                	j	41bf0 <__divdf3+0x3c>
   41cc4:	00c86fb3          	or	t6,a6,a2
   41cc8:	060f8263          	beqz	t6,41d2c <__divdf3+0x178>
   41ccc:	02080a63          	beqz	a6,41d00 <__divdf3+0x14c>
   41cd0:	60081e13          	clz	t3,a6
   41cd4:	ff5e0893          	add	a7,t3,-11
   41cd8:	4775                	li	a4,29
   41cda:	ff8e0f13          	add	t5,t3,-8
   41cde:	41170733          	sub	a4,a4,a7
   41ce2:	01e81833          	sll	a6,a6,t5
   41ce6:	00e65733          	srl	a4,a2,a4
   41cea:	01076733          	or	a4,a4,a6
   41cee:	01e61833          	sll	a6,a2,t5
   41cf2:	c0d00893          	li	a7,-1011
   41cf6:	8fc2                	mv	t6,a6
   41cf8:	41c888b3          	sub	a7,a7,t3
   41cfc:	883a                	mv	a6,a4
   41cfe:	b71d                	j	41c24 <__divdf3+0x70>
   41d00:	60061713          	clz	a4,a2
   41d04:	4f71                	li	t5,28
   41d06:	01570893          	add	a7,a4,21
   41d0a:	02070e13          	add	t3,a4,32
   41d0e:	fd1f55e3          	bge	t5,a7,41cd8 <__divdf3+0x124>
   41d12:	1761                	add	a4,a4,-8
   41d14:	00e61733          	sll	a4,a2,a4
   41d18:	bfe9                	j	41cf2 <__divdf3+0x13e>
   41d1a:	00c86fb3          	or	t6,a6,a2
   41d1e:	000f9b63          	bnez	t6,41d34 <__divdf3+0x180>
   41d22:	4801                	li	a6,0
   41d24:	7ff00893          	li	a7,2047
   41d28:	4709                	li	a4,2
   41d2a:	bdf5                	j	41c26 <__divdf3+0x72>
   41d2c:	4801                	li	a6,0
   41d2e:	4881                	li	a7,0
   41d30:	4705                	li	a4,1
   41d32:	bdd5                	j	41c26 <__divdf3+0x72>
   41d34:	8fb2                	mv	t6,a2
   41d36:	7ff00893          	li	a7,2047
   41d3a:	470d                	li	a4,3
   41d3c:	b5ed                	j	41c26 <__divdf3+0x72>
   41d3e:	01d86663          	bltu	a6,t4,41d4a <__divdf3+0x196>
   41d42:	290e9c63          	bne	t4,a6,41fda <__divdf3+0x426>
   41d46:	29f7ea63          	bltu	a5,t6,41fda <__divdf3+0x426>
   41d4a:	01fe9693          	sll	a3,t4,0x1f
   41d4e:	0017d713          	srl	a4,a5,0x1
   41d52:	01f79293          	sll	t0,a5,0x1f
   41d56:	001ede93          	srl	t4,t4,0x1
   41d5a:	00e6e7b3          	or	a5,a3,a4
   41d5e:	00881313          	sll	t1,a6,0x8
   41d62:	018fd593          	srl	a1,t6,0x18
   41d66:	0065e5b3          	or	a1,a1,t1
   41d6a:	01035313          	srl	t1,t1,0x10
   41d6e:	026edf33          	divu	t5,t4,t1
   41d72:	0805ce33          	zext.h	t3,a1
   41d76:	0107d713          	srl	a4,a5,0x10
   41d7a:	008f9893          	sll	a7,t6,0x8
   41d7e:	026efeb3          	remu	t4,t4,t1
   41d82:	86fa                	mv	a3,t5
   41d84:	03ee0833          	mul	a6,t3,t5
   41d88:	0ec2                	sll	t4,t4,0x10
   41d8a:	01d76733          	or	a4,a4,t4
   41d8e:	01077c63          	bgeu	a4,a6,41da6 <__divdf3+0x1f2>
   41d92:	972e                	add	a4,a4,a1
   41d94:	ffff0693          	add	a3,t5,-1
   41d98:	00b76763          	bltu	a4,a1,41da6 <__divdf3+0x1f2>
   41d9c:	01077563          	bgeu	a4,a6,41da6 <__divdf3+0x1f2>
   41da0:	ffef0693          	add	a3,t5,-2
   41da4:	972e                	add	a4,a4,a1
   41da6:	41070733          	sub	a4,a4,a6
   41daa:	02675eb3          	divu	t4,a4,t1
   41dae:	0807c7b3          	zext.h	a5,a5
   41db2:	02677733          	remu	a4,a4,t1
   41db6:	03de0833          	mul	a6,t3,t4
   41dba:	0742                	sll	a4,a4,0x10
   41dbc:	8fd9                	or	a5,a5,a4
   41dbe:	8776                	mv	a4,t4
   41dc0:	0107fc63          	bgeu	a5,a6,41dd8 <__divdf3+0x224>
   41dc4:	97ae                	add	a5,a5,a1
   41dc6:	fffe8713          	add	a4,t4,-1
   41dca:	00b7e763          	bltu	a5,a1,41dd8 <__divdf3+0x224>
   41dce:	0107f563          	bgeu	a5,a6,41dd8 <__divdf3+0x224>
   41dd2:	ffee8713          	add	a4,t4,-2
   41dd6:	97ae                	add	a5,a5,a1
   41dd8:	06c2                	sll	a3,a3,0x10
   41dda:	6441                	lui	s0,0x10
   41ddc:	00e6e3b3          	or	t2,a3,a4
   41de0:	fff40e93          	add	t4,s0,-1 # ffff <__fw_size__+0x4d27>
   41de4:	01d3f733          	and	a4,t2,t4
   41de8:	0108df13          	srl	t5,a7,0x10
   41dec:	01d8feb3          	and	t4,a7,t4
   41df0:	410787b3          	sub	a5,a5,a6
   41df4:	0103d813          	srl	a6,t2,0x10
   41df8:	02ee8fb3          	mul	t6,t4,a4
   41dfc:	03d804b3          	mul	s1,a6,t4
   41e00:	010fd693          	srl	a3,t6,0x10
   41e04:	02ef0733          	mul	a4,t5,a4
   41e08:	9726                	add	a4,a4,s1
   41e0a:	96ba                	add	a3,a3,a4
   41e0c:	03e80833          	mul	a6,a6,t5
   41e10:	0096f363          	bgeu	a3,s1,41e16 <__divdf3+0x262>
   41e14:	9822                	add	a6,a6,s0
   41e16:	0106d713          	srl	a4,a3,0x10
   41e1a:	9742                	add	a4,a4,a6
   41e1c:	6841                	lui	a6,0x10
   41e1e:	187d                	add	a6,a6,-1 # ffff <__fw_size__+0x4d27>
   41e20:	0106f6b3          	and	a3,a3,a6
   41e24:	06c2                	sll	a3,a3,0x10
   41e26:	010fffb3          	and	t6,t6,a6
   41e2a:	96fe                	add	a3,a3,t6
   41e2c:	00e7e763          	bltu	a5,a4,41e3a <__divdf3+0x286>
   41e30:	881e                	mv	a6,t2
   41e32:	04e79163          	bne	a5,a4,41e74 <__divdf3+0x2c0>
   41e36:	02d2ff63          	bgeu	t0,a3,41e74 <__divdf3+0x2c0>
   41e3a:	01128fb3          	add	t6,t0,a7
   41e3e:	005fb433          	sltu	s0,t6,t0
   41e42:	00b404b3          	add	s1,s0,a1
   41e46:	97a6                	add	a5,a5,s1
   41e48:	fff38813          	add	a6,t2,-1
   41e4c:	82fe                	mv	t0,t6
   41e4e:	00f5e563          	bltu	a1,a5,41e58 <__divdf3+0x2a4>
   41e52:	02f59163          	bne	a1,a5,41e74 <__divdf3+0x2c0>
   41e56:	ec19                	bnez	s0,41e74 <__divdf3+0x2c0>
   41e58:	00e7e663          	bltu	a5,a4,41e64 <__divdf3+0x2b0>
   41e5c:	00f71c63          	bne	a4,a5,41e74 <__divdf3+0x2c0>
   41e60:	00dffa63          	bgeu	t6,a3,41e74 <__divdf3+0x2c0>
   41e64:	9fc6                	add	t6,t6,a7
   41e66:	82fe                	mv	t0,t6
   41e68:	011fbfb3          	sltu	t6,t6,a7
   41e6c:	9fae                	add	t6,t6,a1
   41e6e:	ffe38813          	add	a6,t2,-2
   41e72:	97fe                	add	a5,a5,t6
   41e74:	40d286b3          	sub	a3,t0,a3
   41e78:	8f99                	sub	a5,a5,a4
   41e7a:	00d2b2b3          	sltu	t0,t0,a3
   41e7e:	405787b3          	sub	a5,a5,t0
   41e82:	5ffd                	li	t6,-1
   41e84:	0ef58863          	beq	a1,a5,41f74 <__divdf3+0x3c0>
   41e88:	0267d2b3          	divu	t0,a5,t1
   41e8c:	0106d713          	srl	a4,a3,0x10
   41e90:	0267f7b3          	remu	a5,a5,t1
   41e94:	025e0fb3          	mul	t6,t3,t0
   41e98:	07c2                	sll	a5,a5,0x10
   41e9a:	8fd9                	or	a5,a5,a4
   41e9c:	8716                	mv	a4,t0
   41e9e:	01f7fc63          	bgeu	a5,t6,41eb6 <__divdf3+0x302>
   41ea2:	97ae                	add	a5,a5,a1
   41ea4:	fff28713          	add	a4,t0,-1
   41ea8:	00b7e763          	bltu	a5,a1,41eb6 <__divdf3+0x302>
   41eac:	01f7f563          	bgeu	a5,t6,41eb6 <__divdf3+0x302>
   41eb0:	ffe28713          	add	a4,t0,-2
   41eb4:	97ae                	add	a5,a5,a1
   41eb6:	41f787b3          	sub	a5,a5,t6
   41eba:	0267dfb3          	divu	t6,a5,t1
   41ebe:	0806c6b3          	zext.h	a3,a3
   41ec2:	0267f7b3          	remu	a5,a5,t1
   41ec6:	837e                	mv	t1,t6
   41ec8:	03fe0e33          	mul	t3,t3,t6
   41ecc:	07c2                	sll	a5,a5,0x10
   41ece:	8fd5                	or	a5,a5,a3
   41ed0:	01c7fc63          	bgeu	a5,t3,41ee8 <__divdf3+0x334>
   41ed4:	97ae                	add	a5,a5,a1
   41ed6:	ffff8313          	add	t1,t6,-1
   41eda:	00b7e763          	bltu	a5,a1,41ee8 <__divdf3+0x334>
   41ede:	01c7f563          	bgeu	a5,t3,41ee8 <__divdf3+0x334>
   41ee2:	ffef8313          	add	t1,t6,-2
   41ee6:	97ae                	add	a5,a5,a1
   41ee8:	01071693          	sll	a3,a4,0x10
   41eec:	0066e6b3          	or	a3,a3,t1
   41ef0:	41c787b3          	sub	a5,a5,t3
   41ef4:	0106de13          	srl	t3,a3,0x10
   41ef8:	0806c733          	zext.h	a4,a3
   41efc:	03d70fb3          	mul	t6,a4,t4
   41f00:	03de0eb3          	mul	t4,t3,t4
   41f04:	03cf0e33          	mul	t3,t5,t3
   41f08:	02ef0f33          	mul	t5,t5,a4
   41f0c:	010fd713          	srl	a4,t6,0x10
   41f10:	9f76                	add	t5,t5,t4
   41f12:	977a                	add	a4,a4,t5
   41f14:	01d77463          	bgeu	a4,t4,41f1c <__divdf3+0x368>
   41f18:	6341                	lui	t1,0x10
   41f1a:	9e1a                	add	t3,t3,t1
   41f1c:	01075313          	srl	t1,a4,0x10
   41f20:	9372                	add	t1,t1,t3
   41f22:	6e41                	lui	t3,0x10
   41f24:	1e7d                	add	t3,t3,-1 # ffff <__fw_size__+0x4d27>
   41f26:	01c77733          	and	a4,a4,t3
   41f2a:	0742                	sll	a4,a4,0x10
   41f2c:	01cfffb3          	and	t6,t6,t3
   41f30:	977e                	add	a4,a4,t6
   41f32:	0067e663          	bltu	a5,t1,41f3e <__divdf3+0x38a>
   41f36:	18679263          	bne	a5,t1,420ba <__divdf3+0x506>
   41f3a:	8fb6                	mv	t6,a3
   41f3c:	cf05                	beqz	a4,41f74 <__divdf3+0x3c0>
   41f3e:	97ae                	add	a5,a5,a1
   41f40:	fff68f93          	add	t6,a3,-1
   41f44:	8e3e                	mv	t3,a5
   41f46:	02b7e163          	bltu	a5,a1,41f68 <__divdf3+0x3b4>
   41f4a:	0067e663          	bltu	a5,t1,41f56 <__divdf3+0x3a2>
   41f4e:	16679563          	bne	a5,t1,420b8 <__divdf3+0x504>
   41f52:	00e8fd63          	bgeu	a7,a4,41f6c <__divdf3+0x3b8>
   41f56:	ffe68f93          	add	t6,a3,-2
   41f5a:	00189693          	sll	a3,a7,0x1
   41f5e:	0116be33          	sltu	t3,a3,a7
   41f62:	9e2e                	add	t3,t3,a1
   41f64:	9e3e                	add	t3,t3,a5
   41f66:	88b6                	mv	a7,a3
   41f68:	006e1463          	bne	t3,t1,41f70 <__divdf3+0x3bc>
   41f6c:	01170463          	beq	a4,a7,41f74 <__divdf3+0x3c0>
   41f70:	001fef93          	or	t6,t6,1
   41f74:	3ff50693          	add	a3,a0,1023
   41f78:	08d05e63          	blez	a3,42014 <__divdf3+0x460>
   41f7c:	007ff793          	and	a5,t6,7
   41f80:	cf81                	beqz	a5,41f98 <__divdf3+0x3e4>
   41f82:	00fff793          	and	a5,t6,15
   41f86:	4711                	li	a4,4
   41f88:	00e78863          	beq	a5,a4,41f98 <__divdf3+0x3e4>
   41f8c:	004f8793          	add	a5,t6,4
   41f90:	01f7b733          	sltu	a4,a5,t6
   41f94:	983a                	add	a6,a6,a4
   41f96:	8fbe                	mv	t6,a5
   41f98:	00781793          	sll	a5,a6,0x7
   41f9c:	0007d663          	bgez	a5,41fa8 <__divdf3+0x3f4>
   41fa0:	40050693          	add	a3,a0,1024
   41fa4:	49881813          	bclr	a6,a6,0x18
   41fa8:	7fe00793          	li	a5,2046
   41fac:	04d7c763          	blt	a5,a3,41ffa <__divdf3+0x446>
   41fb0:	003fdf93          	srl	t6,t6,0x3
   41fb4:	01d81713          	sll	a4,a6,0x1d
   41fb8:	01f76733          	or	a4,a4,t6
   41fbc:	00385793          	srl	a5,a6,0x3
   41fc0:	07b2                	sll	a5,a5,0xc
   41fc2:	4432                	lw	s0,12(sp)
   41fc4:	83b1                	srl	a5,a5,0xc
   41fc6:	06d2                	sll	a3,a3,0x14
   41fc8:	8edd                	or	a3,a3,a5
   41fca:	067e                	sll	a2,a2,0x1f
   41fcc:	00c6e7b3          	or	a5,a3,a2
   41fd0:	44a2                	lw	s1,8(sp)
   41fd2:	853a                	mv	a0,a4
   41fd4:	85be                	mv	a1,a5
   41fd6:	0141                	add	sp,sp,16
   41fd8:	8082                	ret
   41fda:	157d                	add	a0,a0,-1
   41fdc:	4281                	li	t0,0
   41fde:	b341                	j	41d5e <__divdf3+0x1aa>
   41fe0:	862e                	mv	a2,a1
   41fe2:	8876                	mv	a6,t4
   41fe4:	8fbe                	mv	t6,a5
   41fe6:	871a                	mv	a4,t1
   41fe8:	478d                	li	a5,3
   41fea:	0af70963          	beq	a4,a5,4209c <__divdf3+0x4e8>
   41fee:	4785                	li	a5,1
   41ff0:	0af70d63          	beq	a4,a5,420aa <__divdf3+0x4f6>
   41ff4:	4789                	li	a5,2
   41ff6:	f6f71fe3          	bne	a4,a5,41f74 <__divdf3+0x3c0>
   41ffa:	4781                	li	a5,0
   41ffc:	4701                	li	a4,0
   41ffe:	7ff00693          	li	a3,2047
   42002:	bf7d                	j	41fc0 <__divdf3+0x40c>
   42004:	8636                	mv	a2,a3
   42006:	b7cd                	j	41fe8 <__divdf3+0x434>
   42008:	00080837          	lui	a6,0x80
   4200c:	4f81                	li	t6,0
   4200e:	4601                	li	a2,0
   42010:	470d                	li	a4,3
   42012:	bfd9                	j	41fe8 <__divdf3+0x434>
   42014:	4785                	li	a5,1
   42016:	8f95                	sub	a5,a5,a3
   42018:	03800713          	li	a4,56
   4201c:	08f74763          	blt	a4,a5,420aa <__divdf3+0x4f6>
   42020:	477d                	li	a4,31
   42022:	04f74963          	blt	a4,a5,42074 <__divdf3+0x4c0>
   42026:	41e50513          	add	a0,a0,1054
   4202a:	00a81733          	sll	a4,a6,a0
   4202e:	00ffd6b3          	srl	a3,t6,a5
   42032:	00af9533          	sll	a0,t6,a0
   42036:	8f55                	or	a4,a4,a3
   42038:	00a03533          	snez	a0,a0
   4203c:	8f49                	or	a4,a4,a0
   4203e:	00f857b3          	srl	a5,a6,a5
   42042:	00777693          	and	a3,a4,7
   42046:	ce81                	beqz	a3,4205e <__divdf3+0x4aa>
   42048:	00f77693          	and	a3,a4,15
   4204c:	4591                	li	a1,4
   4204e:	00b68863          	beq	a3,a1,4205e <__divdf3+0x4aa>
   42052:	00470693          	add	a3,a4,4
   42056:	00e6b5b3          	sltu	a1,a3,a4
   4205a:	97ae                	add	a5,a5,a1
   4205c:	8736                	mv	a4,a3
   4205e:	00879693          	sll	a3,a5,0x8
   42062:	0406c763          	bltz	a3,420b0 <__divdf3+0x4fc>
   42066:	01d79693          	sll	a3,a5,0x1d
   4206a:	830d                	srl	a4,a4,0x3
   4206c:	8f55                	or	a4,a4,a3
   4206e:	838d                	srl	a5,a5,0x3
   42070:	4681                	li	a3,0
   42072:	b7b9                	j	41fc0 <__divdf3+0x40c>
   42074:	5705                	li	a4,-31
   42076:	8f15                	sub	a4,a4,a3
   42078:	02000593          	li	a1,32
   4207c:	00e85733          	srl	a4,a6,a4
   42080:	4681                	li	a3,0
   42082:	00b78663          	beq	a5,a1,4208e <__divdf3+0x4da>
   42086:	43e50693          	add	a3,a0,1086
   4208a:	00d816b3          	sll	a3,a6,a3
   4208e:	01f6e6b3          	or	a3,a3,t6
   42092:	00d036b3          	snez	a3,a3
   42096:	8f55                	or	a4,a4,a3
   42098:	4781                	li	a5,0
   4209a:	b765                	j	42042 <__divdf3+0x48e>
   4209c:	000807b7          	lui	a5,0x80
   420a0:	4701                	li	a4,0
   420a2:	7ff00693          	li	a3,2047
   420a6:	4601                	li	a2,0
   420a8:	bf21                	j	41fc0 <__divdf3+0x40c>
   420aa:	4781                	li	a5,0
   420ac:	4701                	li	a4,0
   420ae:	b7c9                	j	42070 <__divdf3+0x4bc>
   420b0:	4781                	li	a5,0
   420b2:	4701                	li	a4,0
   420b4:	4685                	li	a3,1
   420b6:	b729                	j	41fc0 <__divdf3+0x40c>
   420b8:	86fe                	mv	a3,t6
   420ba:	8fb6                	mv	t6,a3
   420bc:	bd55                	j	41f70 <__divdf3+0x3bc>

000420be <__gedf2>:
   420be:	0146d793          	srl	a5,a3,0x14
   420c2:	0145d893          	srl	a7,a1,0x14
   420c6:	00100737          	lui	a4,0x100
   420ca:	177d                	add	a4,a4,-1 # fffff <__fast_load_addr__+0xb497f>
   420cc:	882a                	mv	a6,a0
   420ce:	8e2a                	mv	t3,a0
   420d0:	7ff8f893          	and	a7,a7,2047
   420d4:	7ff7f513          	and	a0,a5,2047
   420d8:	7ff00793          	li	a5,2047
   420dc:	00b77333          	and	t1,a4,a1
   420e0:	8eb2                	mv	t4,a2
   420e2:	8f75                	and	a4,a4,a3
   420e4:	81fd                	srl	a1,a1,0x1f
   420e6:	82fd                	srl	a3,a3,0x1f
   420e8:	00f89563          	bne	a7,a5,420f2 <__gedf2+0x34>
   420ec:	010367b3          	or	a5,t1,a6
   420f0:	eba9                	bnez	a5,42142 <__gedf2+0x84>
   420f2:	7ff00793          	li	a5,2047
   420f6:	00f51563          	bne	a0,a5,42100 <__gedf2+0x42>
   420fa:	00c767b3          	or	a5,a4,a2
   420fe:	e3b1                	bnez	a5,42142 <__gedf2+0x84>
   42100:	4781                	li	a5,0
   42102:	00089663          	bnez	a7,4210e <__gedf2+0x50>
   42106:	01036833          	or	a6,t1,a6
   4210a:	00183793          	seqz	a5,a6
   4210e:	ed05                	bnez	a0,42146 <__gedf2+0x88>
   42110:	8e59                	or	a2,a2,a4
   42112:	c791                	beqz	a5,4211e <__gedf2+0x60>
   42114:	ca01                	beqz	a2,42124 <__gedf2+0x66>
   42116:	4505                	li	a0,1
   42118:	e691                	bnez	a3,42124 <__gedf2+0x66>
   4211a:	557d                	li	a0,-1
   4211c:	8082                	ret
   4211e:	e60d                	bnez	a2,42148 <__gedf2+0x8a>
   42120:	557d                	li	a0,-1
   42122:	c98d                	beqz	a1,42154 <__gedf2+0x96>
   42124:	8082                	ret
   42126:	fea8c8e3          	blt	a7,a0,42116 <__gedf2+0x58>
   4212a:	fe676be3          	bltu	a4,t1,42120 <__gedf2+0x62>
   4212e:	00e31763          	bne	t1,a4,4213c <__gedf2+0x7e>
   42132:	ffcee7e3          	bltu	t4,t3,42120 <__gedf2+0x62>
   42136:	4501                	li	a0,0
   42138:	ffde76e3          	bgeu	t3,t4,42124 <__gedf2+0x66>
   4213c:	4505                	li	a0,1
   4213e:	f1fd                	bnez	a1,42124 <__gedf2+0x66>
   42140:	bfe9                	j	4211a <__gedf2+0x5c>
   42142:	5579                	li	a0,-2
   42144:	8082                	ret
   42146:	fbe1                	bnez	a5,42116 <__gedf2+0x58>
   42148:	fcb69ce3          	bne	a3,a1,42120 <__gedf2+0x62>
   4214c:	fd155de3          	bge	a0,a7,42126 <__gedf2+0x68>
   42150:	557d                	li	a0,-1
   42152:	fae9                	bnez	a3,42124 <__gedf2+0x66>
   42154:	4505                	li	a0,1
   42156:	8082                	ret

00042158 <__ledf2>:
   42158:	0146d793          	srl	a5,a3,0x14
   4215c:	0145d893          	srl	a7,a1,0x14
   42160:	00100737          	lui	a4,0x100
   42164:	177d                	add	a4,a4,-1 # fffff <__fast_load_addr__+0xb497f>
   42166:	882a                	mv	a6,a0
   42168:	8e2a                	mv	t3,a0
   4216a:	7ff8f893          	and	a7,a7,2047
   4216e:	7ff7f513          	and	a0,a5,2047
   42172:	7ff00793          	li	a5,2047
   42176:	00b77333          	and	t1,a4,a1
   4217a:	8eb2                	mv	t4,a2
   4217c:	8f75                	and	a4,a4,a3
   4217e:	81fd                	srl	a1,a1,0x1f
   42180:	82fd                	srl	a3,a3,0x1f
   42182:	00f89563          	bne	a7,a5,4218c <__ledf2+0x34>
   42186:	010367b3          	or	a5,t1,a6
   4218a:	eba9                	bnez	a5,421dc <__ledf2+0x84>
   4218c:	7ff00793          	li	a5,2047
   42190:	00f51563          	bne	a0,a5,4219a <__ledf2+0x42>
   42194:	00c767b3          	or	a5,a4,a2
   42198:	e3b1                	bnez	a5,421dc <__ledf2+0x84>
   4219a:	4781                	li	a5,0
   4219c:	00089663          	bnez	a7,421a8 <__ledf2+0x50>
   421a0:	01036833          	or	a6,t1,a6
   421a4:	00183793          	seqz	a5,a6
   421a8:	ed05                	bnez	a0,421e0 <__ledf2+0x88>
   421aa:	8e59                	or	a2,a2,a4
   421ac:	c791                	beqz	a5,421b8 <__ledf2+0x60>
   421ae:	ca01                	beqz	a2,421be <__ledf2+0x66>
   421b0:	4505                	li	a0,1
   421b2:	e691                	bnez	a3,421be <__ledf2+0x66>
   421b4:	557d                	li	a0,-1
   421b6:	8082                	ret
   421b8:	e60d                	bnez	a2,421e2 <__ledf2+0x8a>
   421ba:	557d                	li	a0,-1
   421bc:	c98d                	beqz	a1,421ee <__ledf2+0x96>
   421be:	8082                	ret
   421c0:	fea8c8e3          	blt	a7,a0,421b0 <__ledf2+0x58>
   421c4:	fe676be3          	bltu	a4,t1,421ba <__ledf2+0x62>
   421c8:	00e31763          	bne	t1,a4,421d6 <__ledf2+0x7e>
   421cc:	ffcee7e3          	bltu	t4,t3,421ba <__ledf2+0x62>
   421d0:	4501                	li	a0,0
   421d2:	ffde76e3          	bgeu	t3,t4,421be <__ledf2+0x66>
   421d6:	4505                	li	a0,1
   421d8:	f1fd                	bnez	a1,421be <__ledf2+0x66>
   421da:	bfe9                	j	421b4 <__ledf2+0x5c>
   421dc:	4509                	li	a0,2
   421de:	8082                	ret
   421e0:	fbe1                	bnez	a5,421b0 <__ledf2+0x58>
   421e2:	fcb69ce3          	bne	a3,a1,421ba <__ledf2+0x62>
   421e6:	fd155de3          	bge	a0,a7,421c0 <__ledf2+0x68>
   421ea:	557d                	li	a0,-1
   421ec:	fae9                	bnez	a3,421be <__ledf2+0x66>
   421ee:	4505                	li	a0,1
   421f0:	8082                	ret

000421f2 <__muldf3>:
   421f2:	1141                	add	sp,sp,-16
   421f4:	0145de13          	srl	t3,a1,0x14
   421f8:	00c59893          	sll	a7,a1,0xc
   421fc:	c622                	sw	s0,12(sp)
   421fe:	c426                	sw	s1,8(sp)
   42200:	c24a                	sw	s2,4(sp)
   42202:	c04e                	sw	s3,0(sp)
   42204:	7ffe7e13          	and	t3,t3,2047
   42208:	872a                	mv	a4,a0
   4220a:	00c8d893          	srl	a7,a7,0xc
   4220e:	01f5d513          	srl	a0,a1,0x1f
   42212:	1c0e0c63          	beqz	t3,423ea <__muldf3+0x1f8>
   42216:	7ff00793          	li	a5,2047
   4221a:	22fe0363          	beq	t3,a5,42440 <__muldf3+0x24e>
   4221e:	01d75793          	srl	a5,a4,0x1d
   42222:	088e                	sll	a7,a7,0x3
   42224:	0117e8b3          	or	a7,a5,a7
   42228:	00371813          	sll	a6,a4,0x3
   4222c:	c01e0e13          	add	t3,t3,-1023
   42230:	29789893          	bset	a7,a7,0x17
   42234:	4f01                	li	t5,0
   42236:	0146d313          	srl	t1,a3,0x14
   4223a:	00c69713          	sll	a4,a3,0xc
   4223e:	7ff37313          	and	t1,t1,2047
   42242:	8331                	srl	a4,a4,0xc
   42244:	82fd                	srl	a3,a3,0x1f
   42246:	20030f63          	beqz	t1,42464 <__muldf3+0x272>
   4224a:	7ff00793          	li	a5,2047
   4224e:	26f30363          	beq	t1,a5,424b4 <__muldf3+0x2c2>
   42252:	01d65793          	srl	a5,a2,0x1d
   42256:	070e                	sll	a4,a4,0x3
   42258:	8f5d                	or	a4,a4,a5
   4225a:	00361793          	sll	a5,a2,0x3
   4225e:	c0130613          	add	a2,t1,-1023 # fc01 <__fw_size__+0x4929>
   42262:	29771713          	bset	a4,a4,0x17
   42266:	4581                	li	a1,0
   42268:	00ce0eb3          	add	t4,t3,a2
   4226c:	002f1613          	sll	a2,t5,0x2
   42270:	8e4d                	or	a2,a2,a1
   42272:	4e29                	li	t3,10
   42274:	001e8313          	add	t1,t4,1
   42278:	2ece4a63          	blt	t3,a2,4256c <__muldf3+0x37a>
   4227c:	4e09                	li	t3,2
   4227e:	8d35                	xor	a0,a0,a3
   42280:	24ce4b63          	blt	t3,a2,424d6 <__muldf3+0x2e4>
   42284:	167d                	add	a2,a2,-1 # 7fefffff <__share_mem_end__+0x7ebfffff>
   42286:	4685                	li	a3,1
   42288:	26c6f663          	bgeu	a3,a2,424f4 <__muldf3+0x302>
   4228c:	63c1                	lui	t2,0x10
   4228e:	fff38f93          	add	t6,t2,-1 # ffff <__fw_size__+0x4d27>
   42292:	0107d293          	srl	t0,a5,0x10
   42296:	01f87f33          	and	t5,a6,t6
   4229a:	01085e13          	srl	t3,a6,0x10
   4229e:	01f7f4b3          	and	s1,a5,t6
   422a2:	029f07b3          	mul	a5,t5,s1
   422a6:	029e0833          	mul	a6,t3,s1
   422aa:	0107d593          	srl	a1,a5,0x10
   422ae:	03e286b3          	mul	a3,t0,t5
   422b2:	96c2                	add	a3,a3,a6
   422b4:	95b6                	add	a1,a1,a3
   422b6:	025e0633          	mul	a2,t3,t0
   422ba:	0105f363          	bgeu	a1,a6,422c0 <__muldf3+0xce>
   422be:	961e                	add	a2,a2,t2
   422c0:	0105d393          	srl	t2,a1,0x10
   422c4:	01f5f5b3          	and	a1,a1,t6
   422c8:	01f7f7b3          	and	a5,a5,t6
   422cc:	01075693          	srl	a3,a4,0x10
   422d0:	01f77fb3          	and	t6,a4,t6
   422d4:	05c2                	sll	a1,a1,0x10
   422d6:	95be                	add	a1,a1,a5
   422d8:	03ff0833          	mul	a6,t5,t6
   422dc:	03fe07b3          	mul	a5,t3,t6
   422e0:	01085713          	srl	a4,a6,0x10
   422e4:	03e68f33          	mul	t5,a3,t5
   422e8:	9f3e                	add	t5,t5,a5
   422ea:	977a                	add	a4,a4,t5
   422ec:	02de0e33          	mul	t3,t3,a3
   422f0:	00f77463          	bgeu	a4,a5,422f8 <__muldf3+0x106>
   422f4:	67c1                	lui	a5,0x10
   422f6:	9e3e                	add	t3,t3,a5
   422f8:	69c1                	lui	s3,0x10
   422fa:	fff98413          	add	s0,s3,-1 # ffff <__fw_size__+0x4d27>
   422fe:	008777b3          	and	a5,a4,s0
   42302:	01075f13          	srl	t5,a4,0x10
   42306:	00887833          	and	a6,a6,s0
   4230a:	9f72                	add	t5,t5,t3
   4230c:	0088f433          	and	s0,a7,s0
   42310:	0108de13          	srl	t3,a7,0x10
   42314:	07c2                	sll	a5,a5,0x10
   42316:	02848933          	mul	s2,s1,s0
   4231a:	97c2                	add	a5,a5,a6
   4231c:	93be                	add	t2,t2,a5
   4231e:	029e08b3          	mul	a7,t3,s1
   42322:	01095713          	srl	a4,s2,0x10
   42326:	02828833          	mul	a6,t0,s0
   4232a:	9846                	add	a6,a6,a7
   4232c:	9742                	add	a4,a4,a6
   4232e:	03c284b3          	mul	s1,t0,t3
   42332:	01177363          	bgeu	a4,a7,42338 <__muldf3+0x146>
   42336:	94ce                	add	s1,s1,s3
   42338:	01075893          	srl	a7,a4,0x10
   4233c:	69c1                	lui	s3,0x10
   4233e:	98a6                	add	a7,a7,s1
   42340:	fff98493          	add	s1,s3,-1 # ffff <__fw_size__+0x4d27>
   42344:	8f65                	and	a4,a4,s1
   42346:	0742                	sll	a4,a4,0x10
   42348:	00997933          	and	s2,s2,s1
   4234c:	028f82b3          	mul	t0,t6,s0
   42350:	01270833          	add	a6,a4,s2
   42354:	03fe0fb3          	mul	t6,t3,t6
   42358:	0102d713          	srl	a4,t0,0x10
   4235c:	03c68e33          	mul	t3,a3,t3
   42360:	028686b3          	mul	a3,a3,s0
   42364:	96fe                	add	a3,a3,t6
   42366:	96ba                	add	a3,a3,a4
   42368:	01f6f363          	bgeu	a3,t6,4236e <__muldf3+0x17c>
   4236c:	9e4e                	add	t3,t3,s3
   4236e:	0096f733          	and	a4,a3,s1
   42372:	0742                	sll	a4,a4,0x10
   42374:	0092f2b3          	and	t0,t0,s1
   42378:	961e                	add	a2,a2,t2
   4237a:	9716                	add	a4,a4,t0
   4237c:	9f3a                	add	t5,t5,a4
   4237e:	00f637b3          	sltu	a5,a2,a5
   42382:	97fa                	add	a5,a5,t5
   42384:	9832                	add	a6,a6,a2
   42386:	98be                	add	a7,a7,a5
   42388:	00ef3733          	sltu	a4,t5,a4
   4238c:	00c83633          	sltu	a2,a6,a2
   42390:	01e7bf33          	sltu	t5,a5,t5
   42394:	9646                	add	a2,a2,a7
   42396:	82c1                	srl	a3,a3,0x10
   42398:	01e76733          	or	a4,a4,t5
   4239c:	9736                	add	a4,a4,a3
   4239e:	00f8b6b3          	sltu	a3,a7,a5
   423a2:	011638b3          	sltu	a7,a2,a7
   423a6:	00981793          	sll	a5,a6,0x9
   423aa:	0116e6b3          	or	a3,a3,a7
   423ae:	96ba                	add	a3,a3,a4
   423b0:	8fcd                	or	a5,a5,a1
   423b2:	96f2                	add	a3,a3,t3
   423b4:	00f037b3          	snez	a5,a5
   423b8:	01785813          	srl	a6,a6,0x17
   423bc:	06a6                	sll	a3,a3,0x9
   423be:	01765713          	srl	a4,a2,0x17
   423c2:	0107e7b3          	or	a5,a5,a6
   423c6:	0626                	sll	a2,a2,0x9
   423c8:	8fd1                	or	a5,a5,a2
   423ca:	00769613          	sll	a2,a3,0x7
   423ce:	8f55                	or	a4,a4,a3
   423d0:	00065b63          	bgez	a2,423e6 <__muldf3+0x1f4>
   423d4:	0017d693          	srl	a3,a5,0x1
   423d8:	8b85                	and	a5,a5,1
   423da:	8edd                	or	a3,a3,a5
   423dc:	01f71793          	sll	a5,a4,0x1f
   423e0:	8fd5                	or	a5,a5,a3
   423e2:	8305                	srl	a4,a4,0x1
   423e4:	8e9a                	mv	t4,t1
   423e6:	8376                	mv	t1,t4
   423e8:	aa39                	j	42506 <__muldf3+0x314>
   423ea:	00e8e833          	or	a6,a7,a4
   423ee:	06080263          	beqz	a6,42452 <__muldf3+0x260>
   423f2:	02088a63          	beqz	a7,42426 <__muldf3+0x234>
   423f6:	60089593          	clz	a1,a7
   423fa:	ff558813          	add	a6,a1,-11
   423fe:	47f5                	li	a5,29
   42400:	ff858313          	add	t1,a1,-8
   42404:	410787b3          	sub	a5,a5,a6
   42408:	006898b3          	sll	a7,a7,t1
   4240c:	00f757b3          	srl	a5,a4,a5
   42410:	0117e7b3          	or	a5,a5,a7
   42414:	006718b3          	sll	a7,a4,t1
   42418:	c0d00e13          	li	t3,-1011
   4241c:	8846                	mv	a6,a7
   4241e:	40be0e33          	sub	t3,t3,a1
   42422:	88be                	mv	a7,a5
   42424:	bd01                	j	42234 <__muldf3+0x42>
   42426:	60071793          	clz	a5,a4
   4242a:	4371                	li	t1,28
   4242c:	01578813          	add	a6,a5,21 # 10015 <_noncacheable_size+0x15>
   42430:	02078593          	add	a1,a5,32
   42434:	fd0355e3          	bge	t1,a6,423fe <__muldf3+0x20c>
   42438:	17e1                	add	a5,a5,-8
   4243a:	00f717b3          	sll	a5,a4,a5
   4243e:	bfe9                	j	42418 <__muldf3+0x226>
   42440:	00e8e833          	or	a6,a7,a4
   42444:	00081b63          	bnez	a6,4245a <__muldf3+0x268>
   42448:	4881                	li	a7,0
   4244a:	7ff00e13          	li	t3,2047
   4244e:	4f09                	li	t5,2
   42450:	b3dd                	j	42236 <__muldf3+0x44>
   42452:	4881                	li	a7,0
   42454:	4e01                	li	t3,0
   42456:	4f05                	li	t5,1
   42458:	bbf9                	j	42236 <__muldf3+0x44>
   4245a:	883a                	mv	a6,a4
   4245c:	7ff00e13          	li	t3,2047
   42460:	4f0d                	li	t5,3
   42462:	bbd1                	j	42236 <__muldf3+0x44>
   42464:	00c767b3          	or	a5,a4,a2
   42468:	cfb1                	beqz	a5,424c4 <__muldf3+0x2d2>
   4246a:	cb05                	beqz	a4,4249a <__muldf3+0x2a8>
   4246c:	60071593          	clz	a1,a4
   42470:	ff558e93          	add	t4,a1,-11
   42474:	4375                	li	t1,29
   42476:	ff858793          	add	a5,a1,-8
   4247a:	41d30333          	sub	t1,t1,t4
   4247e:	00f71733          	sll	a4,a4,a5
   42482:	00665333          	srl	t1,a2,t1
   42486:	00e36333          	or	t1,t1,a4
   4248a:	00f61733          	sll	a4,a2,a5
   4248e:	c0d00613          	li	a2,-1011
   42492:	87ba                	mv	a5,a4
   42494:	8e0d                	sub	a2,a2,a1
   42496:	871a                	mv	a4,t1
   42498:	b3f9                	j	42266 <__muldf3+0x74>
   4249a:	60061793          	clz	a5,a2
   4249e:	4371                	li	t1,28
   424a0:	01578e93          	add	t4,a5,21
   424a4:	02078593          	add	a1,a5,32
   424a8:	fdd356e3          	bge	t1,t4,42474 <__muldf3+0x282>
   424ac:	17e1                	add	a5,a5,-8
   424ae:	00f61333          	sll	t1,a2,a5
   424b2:	bff1                	j	4248e <__muldf3+0x29c>
   424b4:	00c767b3          	or	a5,a4,a2
   424b8:	eb91                	bnez	a5,424cc <__muldf3+0x2da>
   424ba:	4701                	li	a4,0
   424bc:	7ff00613          	li	a2,2047
   424c0:	4589                	li	a1,2
   424c2:	b35d                	j	42268 <__muldf3+0x76>
   424c4:	4701                	li	a4,0
   424c6:	4601                	li	a2,0
   424c8:	4585                	li	a1,1
   424ca:	bb79                	j	42268 <__muldf3+0x76>
   424cc:	87b2                	mv	a5,a2
   424ce:	458d                	li	a1,3
   424d0:	7ff00613          	li	a2,2047
   424d4:	bb51                	j	42268 <__muldf3+0x76>
   424d6:	28c01633          	bset	a2,zero,a2
   424da:	53067e13          	and	t3,a2,1328
   424de:	080e1d63          	bnez	t3,42578 <__muldf3+0x386>
   424e2:	24067f13          	and	t5,a2,576
   424e6:	120f1863          	bnez	t5,42616 <__muldf3+0x424>
   424ea:	08867613          	and	a2,a2,136
   424ee:	d8060fe3          	beqz	a2,4228c <__muldf3+0x9a>
   424f2:	8536                	mv	a0,a3
   424f4:	4689                	li	a3,2
   424f6:	10d58b63          	beq	a1,a3,4260c <__muldf3+0x41a>
   424fa:	468d                	li	a3,3
   424fc:	12d58363          	beq	a1,a3,42622 <__muldf3+0x430>
   42500:	4685                	li	a3,1
   42502:	12d58463          	beq	a1,a3,4262a <__muldf3+0x438>
   42506:	3ff30593          	add	a1,t1,1023
   4250a:	06b05b63          	blez	a1,42580 <__muldf3+0x38e>
   4250e:	0077f693          	and	a3,a5,7
   42512:	ce81                	beqz	a3,4252a <__muldf3+0x338>
   42514:	00f7f693          	and	a3,a5,15
   42518:	4611                	li	a2,4
   4251a:	00c68863          	beq	a3,a2,4252a <__muldf3+0x338>
   4251e:	00478693          	add	a3,a5,4
   42522:	00f6b633          	sltu	a2,a3,a5
   42526:	9732                	add	a4,a4,a2
   42528:	87b6                	mv	a5,a3
   4252a:	00771693          	sll	a3,a4,0x7
   4252e:	0006d663          	bgez	a3,4253a <__muldf3+0x348>
   42532:	40030593          	add	a1,t1,1024
   42536:	49871713          	bclr	a4,a4,0x18
   4253a:	7fe00693          	li	a3,2046
   4253e:	0cb6c763          	blt	a3,a1,4260c <__muldf3+0x41a>
   42542:	01d71e13          	sll	t3,a4,0x1d
   42546:	838d                	srl	a5,a5,0x3
   42548:	00fe6e33          	or	t3,t3,a5
   4254c:	830d                	srl	a4,a4,0x3
   4254e:	0732                	sll	a4,a4,0xc
   42550:	4432                	lw	s0,12(sp)
   42552:	05d2                	sll	a1,a1,0x14
   42554:	8331                	srl	a4,a4,0xc
   42556:	8dd9                	or	a1,a1,a4
   42558:	057e                	sll	a0,a0,0x1f
   4255a:	00a5e7b3          	or	a5,a1,a0
   4255e:	44a2                	lw	s1,8(sp)
   42560:	4912                	lw	s2,4(sp)
   42562:	4982                	lw	s3,0(sp)
   42564:	8572                	mv	a0,t3
   42566:	85be                	mv	a1,a5
   42568:	0141                	add	sp,sp,16
   4256a:	8082                	ret
   4256c:	4e3d                	li	t3,15
   4256e:	0bc60a63          	beq	a2,t3,42622 <__muldf3+0x430>
   42572:	4e2d                	li	t3,11
   42574:	f7c60fe3          	beq	a2,t3,424f2 <__muldf3+0x300>
   42578:	8746                	mv	a4,a7
   4257a:	87c2                	mv	a5,a6
   4257c:	85fa                	mv	a1,t5
   4257e:	bf9d                	j	424f4 <__muldf3+0x302>
   42580:	4685                	li	a3,1
   42582:	8e8d                	sub	a3,a3,a1
   42584:	03800613          	li	a2,56
   42588:	0ad64163          	blt	a2,a3,4262a <__muldf3+0x438>
   4258c:	467d                	li	a2,31
   4258e:	04d64b63          	blt	a2,a3,425e4 <__muldf3+0x3f2>
   42592:	41e30313          	add	t1,t1,1054
   42596:	00671633          	sll	a2,a4,t1
   4259a:	00d7d5b3          	srl	a1,a5,a3
   4259e:	00679333          	sll	t1,a5,t1
   425a2:	8e4d                	or	a2,a2,a1
   425a4:	00603333          	snez	t1,t1
   425a8:	006667b3          	or	a5,a2,t1
   425ac:	00d75733          	srl	a4,a4,a3
   425b0:	0077f693          	and	a3,a5,7
   425b4:	ce81                	beqz	a3,425cc <__muldf3+0x3da>
   425b6:	00f7f693          	and	a3,a5,15
   425ba:	4611                	li	a2,4
   425bc:	00c68863          	beq	a3,a2,425cc <__muldf3+0x3da>
   425c0:	00478693          	add	a3,a5,4
   425c4:	00f6b633          	sltu	a2,a3,a5
   425c8:	9732                	add	a4,a4,a2
   425ca:	87b6                	mv	a5,a3
   425cc:	00871693          	sll	a3,a4,0x8
   425d0:	0606c063          	bltz	a3,42630 <__muldf3+0x43e>
   425d4:	01d71e13          	sll	t3,a4,0x1d
   425d8:	838d                	srl	a5,a5,0x3
   425da:	00fe6e33          	or	t3,t3,a5
   425de:	830d                	srl	a4,a4,0x3
   425e0:	4581                	li	a1,0
   425e2:	b7b5                	j	4254e <__muldf3+0x35c>
   425e4:	5605                	li	a2,-31
   425e6:	8e0d                	sub	a2,a2,a1
   425e8:	02000813          	li	a6,32
   425ec:	00c75633          	srl	a2,a4,a2
   425f0:	4581                	li	a1,0
   425f2:	01068663          	beq	a3,a6,425fe <__muldf3+0x40c>
   425f6:	43e30593          	add	a1,t1,1086
   425fa:	00b715b3          	sll	a1,a4,a1
   425fe:	8ddd                	or	a1,a1,a5
   42600:	00b035b3          	snez	a1,a1
   42604:	00b667b3          	or	a5,a2,a1
   42608:	4701                	li	a4,0
   4260a:	b75d                	j	425b0 <__muldf3+0x3be>
   4260c:	4701                	li	a4,0
   4260e:	4e01                	li	t3,0
   42610:	7ff00593          	li	a1,2047
   42614:	bf2d                	j	4254e <__muldf3+0x35c>
   42616:	00080737          	lui	a4,0x80
   4261a:	7ff00593          	li	a1,2047
   4261e:	4501                	li	a0,0
   42620:	b73d                	j	4254e <__muldf3+0x35c>
   42622:	00080737          	lui	a4,0x80
   42626:	4e01                	li	t3,0
   42628:	bfcd                	j	4261a <__muldf3+0x428>
   4262a:	4701                	li	a4,0
   4262c:	4e01                	li	t3,0
   4262e:	bf4d                	j	425e0 <__muldf3+0x3ee>
   42630:	4701                	li	a4,0
   42632:	4e01                	li	t3,0
   42634:	4585                	li	a1,1
   42636:	bf21                	j	4254e <__muldf3+0x35c>

00042638 <__subdf3>:
   42638:	00100837          	lui	a6,0x100
   4263c:	187d                	add	a6,a6,-1 # fffff <__fast_load_addr__+0xb497f>
   4263e:	00b87333          	and	t1,a6,a1
   42642:	0145d713          	srl	a4,a1,0x14
   42646:	01d55793          	srl	a5,a0,0x1d
   4264a:	00d87833          	and	a6,a6,a3
   4264e:	7ff77893          	and	a7,a4,2047
   42652:	00331713          	sll	a4,t1,0x3
   42656:	080e                	sll	a6,a6,0x3
   42658:	0146d313          	srl	t1,a3,0x14
   4265c:	8fd9                	or	a5,a5,a4
   4265e:	01d65713          	srl	a4,a2,0x1d
   42662:	01076733          	or	a4,a4,a6
   42666:	7ff37313          	and	t1,t1,2047
   4266a:	7ff00813          	li	a6,2047
   4266e:	81fd                	srl	a1,a1,0x1f
   42670:	050e                	sll	a0,a0,0x3
   42672:	82fd                	srl	a3,a3,0x1f
   42674:	060e                	sll	a2,a2,0x3
   42676:	01031663          	bne	t1,a6,42682 <__subdf3+0x4a>
   4267a:	00c76833          	or	a6,a4,a2
   4267e:	00081463          	bnez	a6,42686 <__subdf3+0x4e>
   42682:	0016c693          	xor	a3,a3,1
   42686:	40688e33          	sub	t3,a7,t1
   4268a:	22b69963          	bne	a3,a1,428bc <__subdf3+0x284>
   4268e:	0fc05463          	blez	t3,42776 <__subdf3+0x13e>
   42692:	02031a63          	bnez	t1,426c6 <__subdf3+0x8e>
   42696:	00c766b3          	or	a3,a4,a2
   4269a:	52068363          	beqz	a3,42bc0 <__subdf3+0x588>
   4269e:	fffe0813          	add	a6,t3,-1
   426a2:	00081b63          	bnez	a6,426b8 <__subdf3+0x80>
   426a6:	962a                	add	a2,a2,a0
   426a8:	00a636b3          	sltu	a3,a2,a0
   426ac:	973e                	add	a4,a4,a5
   426ae:	8532                	mv	a0,a2
   426b0:	00d707b3          	add	a5,a4,a3
   426b4:	4885                	li	a7,1
   426b6:	a8b1                	j	42712 <__subdf3+0xda>
   426b8:	7ff00693          	li	a3,2047
   426bc:	00de1c63          	bne	t3,a3,426d4 <__subdf3+0x9c>
   426c0:	7ff00893          	li	a7,2047
   426c4:	a245                	j	42864 <__subdf3+0x22c>
   426c6:	7ff00693          	li	a3,2047
   426ca:	18d88d63          	beq	a7,a3,42864 <__subdf3+0x22c>
   426ce:	8872                	mv	a6,t3
   426d0:	29771713          	bset	a4,a4,0x17
   426d4:	03800693          	li	a3,56
   426d8:	0906ca63          	blt	a3,a6,4276c <__subdf3+0x134>
   426dc:	46fd                	li	a3,31
   426de:	0706c063          	blt	a3,a6,4273e <__subdf3+0x106>
   426e2:	02000313          	li	t1,32
   426e6:	41030333          	sub	t1,t1,a6
   426ea:	006716b3          	sll	a3,a4,t1
   426ee:	01065e33          	srl	t3,a2,a6
   426f2:	00661333          	sll	t1,a2,t1
   426f6:	01c6e6b3          	or	a3,a3,t3
   426fa:	00603333          	snez	t1,t1
   426fe:	0066e6b3          	or	a3,a3,t1
   42702:	01075833          	srl	a6,a4,a6
   42706:	9536                	add	a0,a0,a3
   42708:	983e                	add	a6,a6,a5
   4270a:	00d536b3          	sltu	a3,a0,a3
   4270e:	00d807b3          	add	a5,a6,a3
   42712:	00879713          	sll	a4,a5,0x8
   42716:	14075763          	bgez	a4,42864 <__subdf3+0x22c>
   4271a:	0885                	add	a7,a7,1
   4271c:	7ff00713          	li	a4,2047
   42720:	48e88d63          	beq	a7,a4,42bba <__subdf3+0x582>
   42724:	00155713          	srl	a4,a0,0x1
   42728:	8905                	and	a0,a0,1
   4272a:	fff7f693          	and	a3,a5,-1
   4272e:	8d59                	or	a0,a0,a4
   42730:	07fe                	sll	a5,a5,0x1f
   42732:	8d5d                	or	a0,a0,a5
   42734:	49769693          	bclr	a3,a3,0x17
   42738:	0016d793          	srl	a5,a3,0x1
   4273c:	a225                	j	42864 <__subdf3+0x22c>
   4273e:	fe080693          	add	a3,a6,-32
   42742:	02000e13          	li	t3,32
   42746:	00d756b3          	srl	a3,a4,a3
   4274a:	4301                	li	t1,0
   4274c:	01c80863          	beq	a6,t3,4275c <__subdf3+0x124>
   42750:	04000313          	li	t1,64
   42754:	41030333          	sub	t1,t1,a6
   42758:	00671333          	sll	t1,a4,t1
   4275c:	00c36333          	or	t1,t1,a2
   42760:	00603333          	snez	t1,t1
   42764:	0066e6b3          	or	a3,a3,t1
   42768:	4801                	li	a6,0
   4276a:	bf71                	j	42706 <__subdf3+0xce>
   4276c:	00c766b3          	or	a3,a4,a2
   42770:	00d036b3          	snez	a3,a3
   42774:	bfd5                	j	42768 <__subdf3+0x130>
   42776:	0a0e0a63          	beqz	t3,4282a <__subdf3+0x1f2>
   4277a:	411306b3          	sub	a3,t1,a7
   4277e:	02089163          	bnez	a7,427a0 <__subdf3+0x168>
   42782:	00a7e833          	or	a6,a5,a0
   42786:	42080263          	beqz	a6,42baa <__subdf3+0x572>
   4278a:	fff68813          	add	a6,a3,-1
   4278e:	f0080ce3          	beqz	a6,426a6 <__subdf3+0x6e>
   42792:	7ff00893          	li	a7,2047
   42796:	01169c63          	bne	a3,a7,427ae <__subdf3+0x176>
   4279a:	87ba                	mv	a5,a4
   4279c:	8532                	mv	a0,a2
   4279e:	b70d                	j	426c0 <__subdf3+0x88>
   427a0:	7ff00813          	li	a6,2047
   427a4:	ff030be3          	beq	t1,a6,4279a <__subdf3+0x162>
   427a8:	8836                	mv	a6,a3
   427aa:	29779793          	bset	a5,a5,0x17
   427ae:	03800693          	li	a3,56
   427b2:	0706c763          	blt	a3,a6,42820 <__subdf3+0x1e8>
   427b6:	46fd                	li	a3,31
   427b8:	0306cd63          	blt	a3,a6,427f2 <__subdf3+0x1ba>
   427bc:	02000893          	li	a7,32
   427c0:	410888b3          	sub	a7,a7,a6
   427c4:	011796b3          	sll	a3,a5,a7
   427c8:	01055e33          	srl	t3,a0,a6
   427cc:	011518b3          	sll	a7,a0,a7
   427d0:	01c6e6b3          	or	a3,a3,t3
   427d4:	011038b3          	snez	a7,a7
   427d8:	0116e6b3          	or	a3,a3,a7
   427dc:	0107d833          	srl	a6,a5,a6
   427e0:	9636                	add	a2,a2,a3
   427e2:	983a                	add	a6,a6,a4
   427e4:	00d636b3          	sltu	a3,a2,a3
   427e8:	8532                	mv	a0,a2
   427ea:	00d807b3          	add	a5,a6,a3
   427ee:	889a                	mv	a7,t1
   427f0:	b70d                	j	42712 <__subdf3+0xda>
   427f2:	fe080693          	add	a3,a6,-32
   427f6:	02000e13          	li	t3,32
   427fa:	00d7d6b3          	srl	a3,a5,a3
   427fe:	4881                	li	a7,0
   42800:	01c80863          	beq	a6,t3,42810 <__subdf3+0x1d8>
   42804:	04000893          	li	a7,64
   42808:	410888b3          	sub	a7,a7,a6
   4280c:	011798b3          	sll	a7,a5,a7
   42810:	00a8e8b3          	or	a7,a7,a0
   42814:	011038b3          	snez	a7,a7
   42818:	0116e6b3          	or	a3,a3,a7
   4281c:	4801                	li	a6,0
   4281e:	b7c9                	j	427e0 <__subdf3+0x1a8>
   42820:	00a7e6b3          	or	a3,a5,a0
   42824:	00d036b3          	snez	a3,a3
   42828:	bfd5                	j	4281c <__subdf3+0x1e4>
   4282a:	00188693          	add	a3,a7,1
   4282e:	7fe6f813          	and	a6,a3,2046
   42832:	06081463          	bnez	a6,4289a <__subdf3+0x262>
   42836:	00a7e6b3          	or	a3,a5,a0
   4283a:	04089563          	bnez	a7,42884 <__subdf3+0x24c>
   4283e:	36068963          	beqz	a3,42bb0 <__subdf3+0x578>
   42842:	00c766b3          	or	a3,a4,a2
   42846:	ce99                	beqz	a3,42864 <__subdf3+0x22c>
   42848:	962a                	add	a2,a2,a0
   4284a:	00a636b3          	sltu	a3,a2,a0
   4284e:	973e                	add	a4,a4,a5
   42850:	00d707b3          	add	a5,a4,a3
   42854:	00879713          	sll	a4,a5,0x8
   42858:	8532                	mv	a0,a2
   4285a:	00075563          	bgez	a4,42864 <__subdf3+0x22c>
   4285e:	4885                	li	a7,1
   42860:	49779793          	bclr	a5,a5,0x17
   42864:	00757713          	and	a4,a0,7
   42868:	36070463          	beqz	a4,42bd0 <__subdf3+0x598>
   4286c:	00f57713          	and	a4,a0,15
   42870:	4691                	li	a3,4
   42872:	34d70f63          	beq	a4,a3,42bd0 <__subdf3+0x598>
   42876:	00450713          	add	a4,a0,4
   4287a:	00a736b3          	sltu	a3,a4,a0
   4287e:	97b6                	add	a5,a5,a3
   42880:	853a                	mv	a0,a4
   42882:	a6b9                	j	42bd0 <__subdf3+0x598>
   42884:	da99                	beqz	a3,4279a <__subdf3+0x162>
   42886:	8e59                	or	a2,a2,a4
   42888:	e2060ce3          	beqz	a2,426c0 <__subdf3+0x88>
   4288c:	4581                	li	a1,0
   4288e:	004007b7          	lui	a5,0x400
   42892:	4501                	li	a0,0
   42894:	7ff00893          	li	a7,2047
   42898:	ae25                	j	42bd0 <__subdf3+0x598>
   4289a:	7ff00813          	li	a6,2047
   4289e:	31068c63          	beq	a3,a6,42bb6 <__subdf3+0x57e>
   428a2:	962a                	add	a2,a2,a0
   428a4:	00a63533          	sltu	a0,a2,a0
   428a8:	973e                	add	a4,a4,a5
   428aa:	972a                	add	a4,a4,a0
   428ac:	01f71513          	sll	a0,a4,0x1f
   428b0:	8205                	srl	a2,a2,0x1
   428b2:	8d51                	or	a0,a0,a2
   428b4:	00175793          	srl	a5,a4,0x1
   428b8:	88b6                	mv	a7,a3
   428ba:	b76d                	j	42864 <__subdf3+0x22c>
   428bc:	0dc05a63          	blez	t3,42990 <__subdf3+0x358>
   428c0:	08031563          	bnez	t1,4294a <__subdf3+0x312>
   428c4:	00c766b3          	or	a3,a4,a2
   428c8:	2e068c63          	beqz	a3,42bc0 <__subdf3+0x588>
   428cc:	fffe0693          	add	a3,t3,-1
   428d0:	ee81                	bnez	a3,428e8 <__subdf3+0x2b0>
   428d2:	40c50633          	sub	a2,a0,a2
   428d6:	00c536b3          	sltu	a3,a0,a2
   428da:	40e78733          	sub	a4,a5,a4
   428de:	8532                	mv	a0,a2
   428e0:	40d707b3          	sub	a5,a4,a3
   428e4:	4885                	li	a7,1
   428e6:	a0b9                	j	42934 <__subdf3+0x2fc>
   428e8:	7ff00813          	li	a6,2047
   428ec:	dd0e0ae3          	beq	t3,a6,426c0 <__subdf3+0x88>
   428f0:	03800813          	li	a6,56
   428f4:	08d84a63          	blt	a6,a3,42988 <__subdf3+0x350>
   428f8:	487d                	li	a6,31
   428fa:	06d84063          	blt	a6,a3,4295a <__subdf3+0x322>
   428fe:	02000313          	li	t1,32
   42902:	40d30333          	sub	t1,t1,a3
   42906:	00d65e33          	srl	t3,a2,a3
   4290a:	00671833          	sll	a6,a4,t1
   4290e:	00661333          	sll	t1,a2,t1
   42912:	01c86833          	or	a6,a6,t3
   42916:	00603333          	snez	t1,t1
   4291a:	00686633          	or	a2,a6,t1
   4291e:	00d756b3          	srl	a3,a4,a3
   42922:	40c50633          	sub	a2,a0,a2
   42926:	00c53733          	sltu	a4,a0,a2
   4292a:	40d786b3          	sub	a3,a5,a3
   4292e:	8532                	mv	a0,a2
   42930:	40e687b3          	sub	a5,a3,a4
   42934:	00879713          	sll	a4,a5,0x8
   42938:	f20756e3          	bgez	a4,42864 <__subdf3+0x22c>
   4293c:	00800837          	lui	a6,0x800
   42940:	187d                	add	a6,a6,-1 # 7fffff <_flash_size+0x3fffff>
   42942:	0107f833          	and	a6,a5,a6
   42946:	832a                	mv	t1,a0
   42948:	aa5d                	j	42afe <__subdf3+0x4c6>
   4294a:	7ff00693          	li	a3,2047
   4294e:	f0d88be3          	beq	a7,a3,42864 <__subdf3+0x22c>
   42952:	86f2                	mv	a3,t3
   42954:	29771713          	bset	a4,a4,0x17
   42958:	bf61                	j	428f0 <__subdf3+0x2b8>
   4295a:	fe068813          	add	a6,a3,-32
   4295e:	02000e13          	li	t3,32
   42962:	01075833          	srl	a6,a4,a6
   42966:	4301                	li	t1,0
   42968:	01c68863          	beq	a3,t3,42978 <__subdf3+0x340>
   4296c:	04000313          	li	t1,64
   42970:	40d30333          	sub	t1,t1,a3
   42974:	00671333          	sll	t1,a4,t1
   42978:	00c36333          	or	t1,t1,a2
   4297c:	00603333          	snez	t1,t1
   42980:	00686633          	or	a2,a6,t1
   42984:	4681                	li	a3,0
   42986:	bf71                	j	42922 <__subdf3+0x2ea>
   42988:	8e59                	or	a2,a2,a4
   4298a:	00c03633          	snez	a2,a2
   4298e:	bfdd                	j	42984 <__subdf3+0x34c>
   42990:	0c0e0563          	beqz	t3,42a5a <__subdf3+0x422>
   42994:	41130833          	sub	a6,t1,a7
   42998:	02089b63          	bnez	a7,429ce <__subdf3+0x396>
   4299c:	00a7e5b3          	or	a1,a5,a0
   429a0:	22058263          	beqz	a1,42bc4 <__subdf3+0x58c>
   429a4:	fff80593          	add	a1,a6,-1
   429a8:	e991                	bnez	a1,429bc <__subdf3+0x384>
   429aa:	40a60533          	sub	a0,a2,a0
   429ae:	8f1d                	sub	a4,a4,a5
   429b0:	00a63633          	sltu	a2,a2,a0
   429b4:	40c707b3          	sub	a5,a4,a2
   429b8:	85b6                	mv	a1,a3
   429ba:	b72d                	j	428e4 <__subdf3+0x2ac>
   429bc:	7ff00893          	li	a7,2047
   429c0:	01181e63          	bne	a6,a7,429dc <__subdf3+0x3a4>
   429c4:	87ba                	mv	a5,a4
   429c6:	8532                	mv	a0,a2
   429c8:	7ff00893          	li	a7,2047
   429cc:	a84d                	j	42a7e <__subdf3+0x446>
   429ce:	7ff00593          	li	a1,2047
   429d2:	feb309e3          	beq	t1,a1,429c4 <__subdf3+0x38c>
   429d6:	85c2                	mv	a1,a6
   429d8:	29779793          	bset	a5,a5,0x17
   429dc:	03800813          	li	a6,56
   429e0:	06b84963          	blt	a6,a1,42a52 <__subdf3+0x41a>
   429e4:	487d                	li	a6,31
   429e6:	02b84f63          	blt	a6,a1,42a24 <__subdf3+0x3ec>
   429ea:	02000893          	li	a7,32
   429ee:	40b888b3          	sub	a7,a7,a1
   429f2:	00b55e33          	srl	t3,a0,a1
   429f6:	01179833          	sll	a6,a5,a7
   429fa:	011518b3          	sll	a7,a0,a7
   429fe:	01c86833          	or	a6,a6,t3
   42a02:	011038b3          	snez	a7,a7
   42a06:	01186533          	or	a0,a6,a7
   42a0a:	00b7d5b3          	srl	a1,a5,a1
   42a0e:	40a60533          	sub	a0,a2,a0
   42a12:	40b705b3          	sub	a1,a4,a1
   42a16:	00a63633          	sltu	a2,a2,a0
   42a1a:	40c587b3          	sub	a5,a1,a2
   42a1e:	889a                	mv	a7,t1
   42a20:	85b6                	mv	a1,a3
   42a22:	bf09                	j	42934 <__subdf3+0x2fc>
   42a24:	fe058813          	add	a6,a1,-32
   42a28:	02000e13          	li	t3,32
   42a2c:	0107d833          	srl	a6,a5,a6
   42a30:	4881                	li	a7,0
   42a32:	01c58863          	beq	a1,t3,42a42 <__subdf3+0x40a>
   42a36:	04000893          	li	a7,64
   42a3a:	40b888b3          	sub	a7,a7,a1
   42a3e:	011798b3          	sll	a7,a5,a7
   42a42:	00a8e8b3          	or	a7,a7,a0
   42a46:	011038b3          	snez	a7,a7
   42a4a:	01186533          	or	a0,a6,a7
   42a4e:	4581                	li	a1,0
   42a50:	bf7d                	j	42a0e <__subdf3+0x3d6>
   42a52:	8d5d                	or	a0,a0,a5
   42a54:	00a03533          	snez	a0,a0
   42a58:	bfdd                	j	42a4e <__subdf3+0x416>
   42a5a:	00188813          	add	a6,a7,1
   42a5e:	7fe87813          	and	a6,a6,2046
   42a62:	06081863          	bnez	a6,42ad2 <__subdf3+0x49a>
   42a66:	00c76833          	or	a6,a4,a2
   42a6a:	00a7e333          	or	t1,a5,a0
   42a6e:	04089763          	bnez	a7,42abc <__subdf3+0x484>
   42a72:	00031863          	bnez	t1,42a82 <__subdf3+0x44a>
   42a76:	0e080363          	beqz	a6,42b5c <__subdf3+0x524>
   42a7a:	87ba                	mv	a5,a4
   42a7c:	8532                	mv	a0,a2
   42a7e:	85b6                	mv	a1,a3
   42a80:	b3d5                	j	42864 <__subdf3+0x22c>
   42a82:	de0801e3          	beqz	a6,42864 <__subdf3+0x22c>
   42a86:	40c50333          	sub	t1,a0,a2
   42a8a:	00653e33          	sltu	t3,a0,t1
   42a8e:	40e78833          	sub	a6,a5,a4
   42a92:	41c80833          	sub	a6,a6,t3
   42a96:	00881e13          	sll	t3,a6,0x8
   42a9a:	000e5a63          	bgez	t3,42aae <__subdf3+0x476>
   42a9e:	40a60533          	sub	a0,a2,a0
   42aa2:	8f1d                	sub	a4,a4,a5
   42aa4:	00a63633          	sltu	a2,a2,a0
   42aa8:	40c707b3          	sub	a5,a4,a2
   42aac:	bfc9                	j	42a7e <__subdf3+0x446>
   42aae:	01036533          	or	a0,t1,a6
   42ab2:	10050d63          	beqz	a0,42bcc <__subdf3+0x594>
   42ab6:	87c2                	mv	a5,a6
   42ab8:	851a                	mv	a0,t1
   42aba:	b36d                	j	42864 <__subdf3+0x22c>
   42abc:	00031863          	bnez	t1,42acc <__subdf3+0x494>
   42ac0:	dc0806e3          	beqz	a6,4288c <__subdf3+0x254>
   42ac4:	87ba                	mv	a5,a4
   42ac6:	8532                	mv	a0,a2
   42ac8:	85b6                	mv	a1,a3
   42aca:	bedd                	j	426c0 <__subdf3+0x88>
   42acc:	be080ae3          	beqz	a6,426c0 <__subdf3+0x88>
   42ad0:	bb75                	j	4288c <__subdf3+0x254>
   42ad2:	40c50e33          	sub	t3,a0,a2
   42ad6:	01c53eb3          	sltu	t4,a0,t3
   42ada:	40e78833          	sub	a6,a5,a4
   42ade:	41d80833          	sub	a6,a6,t4
   42ae2:	00881e93          	sll	t4,a6,0x8
   42ae6:	8372                	mv	t1,t3
   42ae8:	060ed563          	bgez	t4,42b52 <__subdf3+0x51a>
   42aec:	40a60333          	sub	t1,a2,a0
   42af0:	40f70833          	sub	a6,a4,a5
   42af4:	00663633          	sltu	a2,a2,t1
   42af8:	40c80833          	sub	a6,a6,a2
   42afc:	85b6                	mv	a1,a3
   42afe:	06080163          	beqz	a6,42b60 <__subdf3+0x528>
   42b02:	60081513          	clz	a0,a6
   42b06:	1561                	add	a0,a0,-8
   42b08:	02000793          	li	a5,32
   42b0c:	8f89                	sub	a5,a5,a0
   42b0e:	00a81833          	sll	a6,a6,a0
   42b12:	00f357b3          	srl	a5,t1,a5
   42b16:	0107e7b3          	or	a5,a5,a6
   42b1a:	00a31833          	sll	a6,t1,a0
   42b1e:	09154063          	blt	a0,a7,42b9e <__subdf3+0x566>
   42b22:	41150533          	sub	a0,a0,a7
   42b26:	00150693          	add	a3,a0,1
   42b2a:	477d                	li	a4,31
   42b2c:	04d74563          	blt	a4,a3,42b76 <__subdf3+0x53e>
   42b30:	02000713          	li	a4,32
   42b34:	8f15                	sub	a4,a4,a3
   42b36:	00e79533          	sll	a0,a5,a4
   42b3a:	00d85633          	srl	a2,a6,a3
   42b3e:	00e81733          	sll	a4,a6,a4
   42b42:	8d51                	or	a0,a0,a2
   42b44:	00e03733          	snez	a4,a4
   42b48:	8d59                	or	a0,a0,a4
   42b4a:	00d7d7b3          	srl	a5,a5,a3
   42b4e:	4881                	li	a7,0
   42b50:	bb11                	j	42864 <__subdf3+0x22c>
   42b52:	010e6e33          	or	t3,t3,a6
   42b56:	fa0e14e3          	bnez	t3,42afe <__subdf3+0x4c6>
   42b5a:	4881                	li	a7,0
   42b5c:	4581                	li	a1,0
   42b5e:	a8b1                	j	42bba <__subdf3+0x582>
   42b60:	60031793          	clz	a5,t1
   42b64:	477d                	li	a4,31
   42b66:	01878513          	add	a0,a5,24 # 400018 <_flash_size+0x18>
   42b6a:	f8a75fe3          	bge	a4,a0,42b08 <__subdf3+0x4d0>
   42b6e:	17e1                	add	a5,a5,-8
   42b70:	00f317b3          	sll	a5,t1,a5
   42b74:	b76d                	j	42b1e <__subdf3+0x4e6>
   42b76:	1505                	add	a0,a0,-31
   42b78:	02000613          	li	a2,32
   42b7c:	00a7d533          	srl	a0,a5,a0
   42b80:	4701                	li	a4,0
   42b82:	00c68763          	beq	a3,a2,42b90 <__subdf3+0x558>
   42b86:	04000713          	li	a4,64
   42b8a:	8f15                	sub	a4,a4,a3
   42b8c:	00e79733          	sll	a4,a5,a4
   42b90:	00e86733          	or	a4,a6,a4
   42b94:	00e03733          	snez	a4,a4
   42b98:	8d59                	or	a0,a0,a4
   42b9a:	4781                	li	a5,0
   42b9c:	bf4d                	j	42b4e <__subdf3+0x516>
   42b9e:	40a888b3          	sub	a7,a7,a0
   42ba2:	49779793          	bclr	a5,a5,0x17
   42ba6:	8542                	mv	a0,a6
   42ba8:	b975                	j	42864 <__subdf3+0x22c>
   42baa:	87ba                	mv	a5,a4
   42bac:	8532                	mv	a0,a2
   42bae:	b329                	j	428b8 <__subdf3+0x280>
   42bb0:	87ba                	mv	a5,a4
   42bb2:	8532                	mv	a0,a2
   42bb4:	b945                	j	42864 <__subdf3+0x22c>
   42bb6:	7ff00893          	li	a7,2047
   42bba:	4781                	li	a5,0
   42bbc:	4501                	li	a0,0
   42bbe:	a809                	j	42bd0 <__subdf3+0x598>
   42bc0:	88f2                	mv	a7,t3
   42bc2:	b14d                	j	42864 <__subdf3+0x22c>
   42bc4:	87ba                	mv	a5,a4
   42bc6:	8532                	mv	a0,a2
   42bc8:	88c2                	mv	a7,a6
   42bca:	bd55                	j	42a7e <__subdf3+0x446>
   42bcc:	4781                	li	a5,0
   42bce:	4581                	li	a1,0
   42bd0:	00879713          	sll	a4,a5,0x8
   42bd4:	00075b63          	bgez	a4,42bea <__subdf3+0x5b2>
   42bd8:	0885                	add	a7,a7,1
   42bda:	7ff00713          	li	a4,2047
   42bde:	49779793          	bclr	a5,a5,0x17
   42be2:	00e89463          	bne	a7,a4,42bea <__subdf3+0x5b2>
   42be6:	4781                	li	a5,0
   42be8:	4501                	li	a0,0
   42bea:	01d79693          	sll	a3,a5,0x1d
   42bee:	810d                	srl	a0,a0,0x3
   42bf0:	7ff00713          	li	a4,2047
   42bf4:	8ec9                	or	a3,a3,a0
   42bf6:	838d                	srl	a5,a5,0x3
   42bf8:	00e89963          	bne	a7,a4,42c0a <__subdf3+0x5d2>
   42bfc:	8edd                	or	a3,a3,a5
   42bfe:	4781                	li	a5,0
   42c00:	c689                	beqz	a3,42c0a <__subdf3+0x5d2>
   42c02:	000807b7          	lui	a5,0x80
   42c06:	4681                	li	a3,0
   42c08:	4581                	li	a1,0
   42c0a:	01489713          	sll	a4,a7,0x14
   42c0e:	7ff00637          	lui	a2,0x7ff00
   42c12:	07b2                	sll	a5,a5,0xc
   42c14:	8f71                	and	a4,a4,a2
   42c16:	83b1                	srl	a5,a5,0xc
   42c18:	8fd9                	or	a5,a5,a4
   42c1a:	01f59713          	sll	a4,a1,0x1f
   42c1e:	00e7e633          	or	a2,a5,a4
   42c22:	8536                	mv	a0,a3
   42c24:	85b2                	mv	a1,a2
   42c26:	8082                	ret

00042c28 <__fixdfsi>:
   42c28:	0145d713          	srl	a4,a1,0x14
   42c2c:	00c59793          	sll	a5,a1,0xc
   42c30:	7ff77713          	and	a4,a4,2047
   42c34:	3fe00693          	li	a3,1022
   42c38:	83b1                	srl	a5,a5,0xc
   42c3a:	81fd                	srl	a1,a1,0x1f
   42c3c:	04e6d563          	bge	a3,a4,42c86 <__fixdfsi+0x5e>
   42c40:	41d00693          	li	a3,1053
   42c44:	00e6d763          	bge	a3,a4,42c52 <__fixdfsi+0x2a>
   42c48:	80000537          	lui	a0,0x80000
   42c4c:	157d                	add	a0,a0,-1 # 7fffffff <__share_mem_end__+0x7ecfffff>
   42c4e:	952e                	add	a0,a0,a1
   42c50:	8082                	ret
   42c52:	43300693          	li	a3,1075
   42c56:	8e99                	sub	a3,a3,a4
   42c58:	467d                	li	a2,31
   42c5a:	29479793          	bset	a5,a5,0x14
   42c5e:	00d64d63          	blt	a2,a3,42c78 <__fixdfsi+0x50>
   42c62:	bed70713          	add	a4,a4,-1043 # 7fbed <__fast_load_addr__+0x3456d>
   42c66:	00e797b3          	sll	a5,a5,a4
   42c6a:	00d55533          	srl	a0,a0,a3
   42c6e:	8d5d                	or	a0,a0,a5
   42c70:	cd81                	beqz	a1,42c88 <__fixdfsi+0x60>
   42c72:	40a00533          	neg	a0,a0
   42c76:	8082                	ret
   42c78:	41300693          	li	a3,1043
   42c7c:	40e68733          	sub	a4,a3,a4
   42c80:	00e7d533          	srl	a0,a5,a4
   42c84:	b7f5                	j	42c70 <__fixdfsi+0x48>
   42c86:	4501                	li	a0,0
   42c88:	8082                	ret

00042c8a <__fixunsdfsi>:
   42c8a:	0145d713          	srl	a4,a1,0x14
   42c8e:	00c59793          	sll	a5,a1,0xc
   42c92:	7ff77713          	and	a4,a4,2047
   42c96:	3fe00613          	li	a2,1022
   42c9a:	86aa                	mv	a3,a0
   42c9c:	83b1                	srl	a5,a5,0xc
   42c9e:	81fd                	srl	a1,a1,0x1f
   42ca0:	04e65363          	bge	a2,a4,42ce6 <__fixunsdfsi+0x5c>
   42ca4:	0015c613          	xor	a2,a1,1
   42ca8:	41e60613          	add	a2,a2,1054 # 7ff0041e <__share_mem_end__+0x7ec0041e>
   42cac:	fff58513          	add	a0,a1,-1
   42cb0:	02c75c63          	bge	a4,a2,42ce8 <__fixunsdfsi+0x5e>
   42cb4:	4501                	li	a0,0
   42cb6:	e98d                	bnez	a1,42ce8 <__fixunsdfsi+0x5e>
   42cb8:	43300613          	li	a2,1075
   42cbc:	8e19                	sub	a2,a2,a4
   42cbe:	45fd                	li	a1,31
   42cc0:	29479793          	bset	a5,a5,0x14
   42cc4:	00c5ca63          	blt	a1,a2,42cd8 <__fixunsdfsi+0x4e>
   42cc8:	bed70713          	add	a4,a4,-1043
   42ccc:	00e797b3          	sll	a5,a5,a4
   42cd0:	00c6d533          	srl	a0,a3,a2
   42cd4:	8d5d                	or	a0,a0,a5
   42cd6:	8082                	ret
   42cd8:	41300693          	li	a3,1043
   42cdc:	40e68733          	sub	a4,a3,a4
   42ce0:	00e7d533          	srl	a0,a5,a4
   42ce4:	8082                	ret
   42ce6:	4501                	li	a0,0
   42ce8:	8082                	ret

00042cea <__floatunsidf>:
   42cea:	cd15                	beqz	a0,42d26 <__floatunsidf+0x3c>
   42cec:	41e00693          	li	a3,1054
   42cf0:	47a9                	li	a5,10
   42cf2:	60051713          	clz	a4,a0
   42cf6:	8e99                	sub	a3,a3,a4
   42cf8:	02e7c263          	blt	a5,a4,42d1c <__floatunsidf+0x32>
   42cfc:	47ad                	li	a5,11
   42cfe:	8f99                	sub	a5,a5,a4
   42d00:	0755                	add	a4,a4,21
   42d02:	00f557b3          	srl	a5,a0,a5
   42d06:	00e51533          	sll	a0,a0,a4
   42d0a:	07b2                	sll	a5,a5,0xc
   42d0c:	06d2                	sll	a3,a3,0x14
   42d0e:	83b1                	srl	a5,a5,0xc
   42d10:	862a                	mv	a2,a0
   42d12:	00f6e733          	or	a4,a3,a5
   42d16:	8532                	mv	a0,a2
   42d18:	85ba                	mv	a1,a4
   42d1a:	8082                	ret
   42d1c:	1755                	add	a4,a4,-11
   42d1e:	00e517b3          	sll	a5,a0,a4
   42d22:	4501                	li	a0,0
   42d24:	b7dd                	j	42d0a <__floatunsidf+0x20>
   42d26:	4781                	li	a5,0
   42d28:	4681                	li	a3,0
   42d2a:	b7c5                	j	42d0a <__floatunsidf+0x20>

00042d2c <__truncdfsf2>:
   42d2c:	0145d613          	srl	a2,a1,0x14
   42d30:	7ff67613          	and	a2,a2,2047
   42d34:	00c59793          	sll	a5,a1,0xc
   42d38:	00160713          	add	a4,a2,1
   42d3c:	83a5                	srl	a5,a5,0x9
   42d3e:	01d55693          	srl	a3,a0,0x1d
   42d42:	7fe77713          	and	a4,a4,2046
   42d46:	8edd                	or	a3,a3,a5
   42d48:	81fd                	srl	a1,a1,0x1f
   42d4a:	00351793          	sll	a5,a0,0x3
   42d4e:	c341                	beqz	a4,42dce <__truncdfsf2+0xa2>
   42d50:	c8060713          	add	a4,a2,-896
   42d54:	0fe00813          	li	a6,254
   42d58:	08e84963          	blt	a6,a4,42dea <__truncdfsf2+0xbe>
   42d5c:	04e04e63          	bgtz	a4,42db8 <__truncdfsf2+0x8c>
   42d60:	5525                	li	a0,-23
   42d62:	0ca74563          	blt	a4,a0,42e2c <__truncdfsf2+0x100>
   42d66:	4579                	li	a0,30
   42d68:	8d19                	sub	a0,a0,a4
   42d6a:	487d                	li	a6,31
   42d6c:	29769693          	bset	a3,a3,0x17
   42d70:	02a84063          	blt	a6,a0,42d90 <__truncdfsf2+0x64>
   42d74:	c8260613          	add	a2,a2,-894
   42d78:	00a7d533          	srl	a0,a5,a0
   42d7c:	00c797b3          	sll	a5,a5,a2
   42d80:	00f037b3          	snez	a5,a5
   42d84:	00c696b3          	sll	a3,a3,a2
   42d88:	8fd5                	or	a5,a5,a3
   42d8a:	8fc9                	or	a5,a5,a0
   42d8c:	4701                	li	a4,0
   42d8e:	a825                	j	42dc6 <__truncdfsf2+0x9a>
   42d90:	5879                	li	a6,-2
   42d92:	40e80833          	sub	a6,a6,a4
   42d96:	02000893          	li	a7,32
   42d9a:	0106d833          	srl	a6,a3,a6
   42d9e:	4701                	li	a4,0
   42da0:	01150663          	beq	a0,a7,42dac <__truncdfsf2+0x80>
   42da4:	ca260613          	add	a2,a2,-862
   42da8:	00c69733          	sll	a4,a3,a2
   42dac:	8f5d                	or	a4,a4,a5
   42dae:	00e03733          	snez	a4,a4
   42db2:	00e867b3          	or	a5,a6,a4
   42db6:	bfd9                	j	42d8c <__truncdfsf2+0x60>
   42db8:	051a                	sll	a0,a0,0x6
   42dba:	00a03533          	snez	a0,a0
   42dbe:	068e                	sll	a3,a3,0x3
   42dc0:	83f5                	srl	a5,a5,0x1d
   42dc2:	8ec9                	or	a3,a3,a0
   42dc4:	8fd5                	or	a5,a5,a3
   42dc6:	0077f693          	and	a3,a5,7
   42dca:	c29d                	beqz	a3,42df0 <__truncdfsf2+0xc4>
   42dcc:	a095                	j	42e30 <__truncdfsf2+0x104>
   42dce:	8fd5                	or	a5,a5,a3
   42dd0:	e601                	bnez	a2,42dd8 <__truncdfsf2+0xac>
   42dd2:	00f037b3          	snez	a5,a5
   42dd6:	bf5d                	j	42d8c <__truncdfsf2+0x60>
   42dd8:	0ff00713          	li	a4,255
   42ddc:	cb91                	beqz	a5,42df0 <__truncdfsf2+0xc4>
   42dde:	068e                	sll	a3,a3,0x3
   42de0:	0006e793          	or	a5,a3,0
   42de4:	29979793          	bset	a5,a5,0x19
   42de8:	bff9                	j	42dc6 <__truncdfsf2+0x9a>
   42dea:	4781                	li	a5,0
   42dec:	0ff00713          	li	a4,255
   42df0:	00579693          	sll	a3,a5,0x5
   42df4:	0006da63          	bgez	a3,42e08 <__truncdfsf2+0xdc>
   42df8:	0705                	add	a4,a4,1
   42dfa:	0ff00693          	li	a3,255
   42dfe:	49a79793          	bclr	a5,a5,0x1a
   42e02:	00d71363          	bne	a4,a3,42e08 <__truncdfsf2+0xdc>
   42e06:	4781                	li	a5,0
   42e08:	0ff00693          	li	a3,255
   42e0c:	838d                	srl	a5,a5,0x3
   42e0e:	00d71663          	bne	a4,a3,42e1a <__truncdfsf2+0xee>
   42e12:	c781                	beqz	a5,42e1a <__truncdfsf2+0xee>
   42e14:	004007b7          	lui	a5,0x400
   42e18:	4581                	li	a1,0
   42e1a:	7f8006b7          	lui	a3,0x7f800
   42e1e:	075e                	sll	a4,a4,0x17
   42e20:	8f75                	and	a4,a4,a3
   42e22:	8f5d                	or	a4,a4,a5
   42e24:	01f59513          	sll	a0,a1,0x1f
   42e28:	8d59                	or	a0,a0,a4
   42e2a:	8082                	ret
   42e2c:	4785                	li	a5,1
   42e2e:	4701                	li	a4,0
   42e30:	00f7f693          	and	a3,a5,15
   42e34:	4611                	li	a2,4
   42e36:	fac68de3          	beq	a3,a2,42df0 <__truncdfsf2+0xc4>
   42e3a:	0791                	add	a5,a5,4 # 400004 <_flash_size+0x4>
   42e3c:	bf55                	j	42df0 <__truncdfsf2+0xc4>

00042e3e <__lshrdi3>:
   42e3e:	ca19                	beqz	a2,42e54 <__lshrdi3+0x16>
   42e40:	02000793          	li	a5,32
   42e44:	8f91                	sub	a5,a5,a2
   42e46:	00f04863          	bgtz	a5,42e56 <__lshrdi3+0x18>
   42e4a:	1601                	add	a2,a2,-32
   42e4c:	00c5d533          	srl	a0,a1,a2
   42e50:	4701                	li	a4,0
   42e52:	85ba                	mv	a1,a4
   42e54:	8082                	ret
   42e56:	00c5d733          	srl	a4,a1,a2
   42e5a:	00c55533          	srl	a0,a0,a2
   42e5e:	00f595b3          	sll	a1,a1,a5
   42e62:	8d4d                	or	a0,a0,a1
   42e64:	b7fd                	j	42e52 <__lshrdi3+0x14>

00042e66 <__ashldi3>:
   42e66:	ca19                	beqz	a2,42e7c <__ashldi3+0x16>
   42e68:	02000793          	li	a5,32
   42e6c:	8f91                	sub	a5,a5,a2
   42e6e:	00f04863          	bgtz	a5,42e7e <__ashldi3+0x18>
   42e72:	1601                	add	a2,a2,-32
   42e74:	00c515b3          	sll	a1,a0,a2
   42e78:	4701                	li	a4,0
   42e7a:	853a                	mv	a0,a4
   42e7c:	8082                	ret
   42e7e:	00c51733          	sll	a4,a0,a2
   42e82:	00c595b3          	sll	a1,a1,a2
   42e86:	00f55533          	srl	a0,a0,a5
   42e8a:	8dc9                	or	a1,a1,a0
   42e8c:	b7fd                	j	42e7a <__ashldi3+0x14>

00042e8e <memcpy>:
   42e8e:	832a                	mv	t1,a0
   42e90:	ca09                	beqz	a2,42ea2 <memcpy+0x14>
   42e92:	00058383          	lb	t2,0(a1)
   42e96:	00730023          	sb	t2,0(t1)
   42e9a:	167d                	add	a2,a2,-1
   42e9c:	0305                	add	t1,t1,1
   42e9e:	0585                	add	a1,a1,1
   42ea0:	fa6d                	bnez	a2,42e92 <memcpy+0x4>
   42ea2:	8082                	ret

00042ea4 <memset>:
   42ea4:	832a                	mv	t1,a0
   42ea6:	c611                	beqz	a2,42eb2 <memset+0xe>
   42ea8:	00b30023          	sb	a1,0(t1)
   42eac:	167d                	add	a2,a2,-1
   42eae:	0305                	add	t1,t1,1
   42eb0:	fe65                	bnez	a2,42ea8 <memset+0x4>
   42eb2:	8082                	ret

00042eb4 <memmove>:
   42eb4:	c215                	beqz	a2,42ed8 <memmove+0x24>
   42eb6:	832a                	mv	t1,a0
   42eb8:	4685                	li	a3,1
   42eba:	00b56763          	bltu	a0,a1,42ec8 <memmove+0x14>
   42ebe:	56fd                	li	a3,-1
   42ec0:	fff60713          	add	a4,a2,-1
   42ec4:	933a                	add	t1,t1,a4
   42ec6:	95ba                	add	a1,a1,a4
   42ec8:	00058383          	lb	t2,0(a1)
   42ecc:	00730023          	sb	t2,0(t1)
   42ed0:	167d                	add	a2,a2,-1
   42ed2:	9336                	add	t1,t1,a3
   42ed4:	95b6                	add	a1,a1,a3
   42ed6:	fa6d                	bnez	a2,42ec8 <memmove+0x14>
   42ed8:	8082                	ret

00042eda <__eqdf2>:
   42eda:	0145d713          	srl	a4,a1,0x14
   42ede:	001007b7          	lui	a5,0x100
   42ee2:	17fd                	add	a5,a5,-1 # fffff <__fast_load_addr__+0xb497f>
   42ee4:	0146d813          	srl	a6,a3,0x14
   42ee8:	832a                	mv	t1,a0
   42eea:	8eaa                	mv	t4,a0
   42eec:	7ff77713          	and	a4,a4,2047
   42ef0:	7ff00513          	li	a0,2047
   42ef4:	00b7f8b3          	and	a7,a5,a1
   42ef8:	8f32                	mv	t5,a2
   42efa:	8ff5                	and	a5,a5,a3
   42efc:	81fd                	srl	a1,a1,0x1f
   42efe:	7ff87813          	and	a6,a6,2047
   42f02:	82fd                	srl	a3,a3,0x1f
   42f04:	00a71a63          	bne	a4,a0,42f18 <__eqdf2+0x3e>
   42f08:	0068ee33          	or	t3,a7,t1
   42f0c:	4505                	li	a0,1
   42f0e:	000e1463          	bnez	t3,42f16 <__eqdf2+0x3c>
   42f12:	00e80563          	beq	a6,a4,42f1c <__eqdf2+0x42>
   42f16:	8082                	ret
   42f18:	00a81563          	bne	a6,a0,42f22 <__eqdf2+0x48>
   42f1c:	8e5d                	or	a2,a2,a5
   42f1e:	4505                	li	a0,1
   42f20:	fa7d                	bnez	a2,42f16 <__eqdf2+0x3c>
   42f22:	4505                	li	a0,1
   42f24:	ff0719e3          	bne	a4,a6,42f16 <__eqdf2+0x3c>
   42f28:	fef897e3          	bne	a7,a5,42f16 <__eqdf2+0x3c>
   42f2c:	ffee95e3          	bne	t4,t5,42f16 <__eqdf2+0x3c>
   42f30:	00d58863          	beq	a1,a3,42f40 <__eqdf2+0x66>
   42f34:	f36d                	bnez	a4,42f16 <__eqdf2+0x3c>
   42f36:	0068e8b3          	or	a7,a7,t1
   42f3a:	01103533          	snez	a0,a7
   42f3e:	8082                	ret
   42f40:	4501                	li	a0,0
   42f42:	8082                	ret

00042f44 <__unorddf2>:
   42f44:	001007b7          	lui	a5,0x100
   42f48:	17fd                	add	a5,a5,-1 # fffff <__fast_load_addr__+0xb497f>
   42f4a:	00b7f733          	and	a4,a5,a1
   42f4e:	81d1                	srl	a1,a1,0x14
   42f50:	fff5c593          	not	a1,a1
   42f54:	8ff5                	and	a5,a5,a3
   42f56:	01559813          	sll	a6,a1,0x15
   42f5a:	82d1                	srl	a3,a3,0x14
   42f5c:	7ff6f693          	and	a3,a3,2047
   42f60:	00081563          	bnez	a6,42f6a <__unorddf2+0x26>
   42f64:	8f49                	or	a4,a4,a0
   42f66:	4505                	li	a0,1
   42f68:	eb09                	bnez	a4,42f7a <__unorddf2+0x36>
   42f6a:	7ff00713          	li	a4,2047
   42f6e:	4501                	li	a0,0
   42f70:	00e69563          	bne	a3,a4,42f7a <__unorddf2+0x36>
   42f74:	8fd1                	or	a5,a5,a2
   42f76:	00f03533          	snez	a0,a5
   42f7a:	8082                	ret

00042f7c <__floatsidf>:
   42f7c:	c539                	beqz	a0,42fca <__floatsidf+0x4e>
   42f7e:	40a00733          	neg	a4,a0
   42f82:	41e00613          	li	a2,1054
   42f86:	47a9                	li	a5,10
   42f88:	0ae56733          	max	a4,a0,a4
   42f8c:	01f55593          	srl	a1,a0,0x1f
   42f90:	60071693          	clz	a3,a4
   42f94:	8e15                	sub	a2,a2,a3
   42f96:	02d7c463          	blt	a5,a3,42fbe <__floatsidf+0x42>
   42f9a:	47ad                	li	a5,11
   42f9c:	8f95                	sub	a5,a5,a3
   42f9e:	06d5                	add	a3,a3,21 # 7f800015 <__share_mem_end__+0x7e500015>
   42fa0:	00f757b3          	srl	a5,a4,a5
   42fa4:	852e                	mv	a0,a1
   42fa6:	00d71733          	sll	a4,a4,a3
   42faa:	07b2                	sll	a5,a5,0xc
   42fac:	83b1                	srl	a5,a5,0xc
   42fae:	0652                	sll	a2,a2,0x14
   42fb0:	8e5d                	or	a2,a2,a5
   42fb2:	057e                	sll	a0,a0,0x1f
   42fb4:	00a667b3          	or	a5,a2,a0
   42fb8:	85be                	mv	a1,a5
   42fba:	853a                	mv	a0,a4
   42fbc:	8082                	ret
   42fbe:	16d5                	add	a3,a3,-11
   42fc0:	00d717b3          	sll	a5,a4,a3
   42fc4:	852e                	mv	a0,a1
   42fc6:	4701                	li	a4,0
   42fc8:	b7cd                	j	42faa <__floatsidf+0x2e>
   42fca:	4601                	li	a2,0
   42fcc:	4781                	li	a5,0
   42fce:	bfe5                	j	42fc6 <__floatsidf+0x4a>

00042fd0 <__fixdfdi>:
   42fd0:	0145d613          	srl	a2,a1,0x14
   42fd4:	7ff67613          	and	a2,a2,2047
   42fd8:	3fe00713          	li	a4,1022
   42fdc:	08c75363          	bge	a4,a2,43062 <__fixdfdi+0x92>
   42fe0:	1141                	add	sp,sp,-16
   42fe2:	c422                	sw	s0,8(sp)
   42fe4:	c606                	sw	ra,12(sp)
   42fe6:	43d00713          	li	a4,1085
   42fea:	01f5d413          	srl	s0,a1,0x1f
   42fee:	00c75c63          	bge	a4,a2,43006 <__fixdfdi+0x36>
   42ff2:	800005b7          	lui	a1,0x80000
   42ff6:	15fd                	add	a1,a1,-1 # 7fffffff <__share_mem_end__+0x7ecfffff>
   42ff8:	fff40513          	add	a0,s0,-1
   42ffc:	95a2                	add	a1,a1,s0
   42ffe:	40b2                	lw	ra,12(sp)
   43000:	4422                	lw	s0,8(sp)
   43002:	0141                	add	sp,sp,16
   43004:	8082                	ret
   43006:	00c59793          	sll	a5,a1,0xc
   4300a:	83b1                	srl	a5,a5,0xc
   4300c:	0007e593          	or	a1,a5,0
   43010:	43200793          	li	a5,1074
   43014:	29459593          	bset	a1,a1,0x14
   43018:	00c7de63          	bge	a5,a2,43034 <__fixdfdi+0x64>
   4301c:	bcd60613          	add	a2,a2,-1075
   43020:	3599                	jal	42e66 <__ashldi3>
   43022:	dc71                	beqz	s0,42ffe <__fixdfdi+0x2e>
   43024:	00a037b3          	snez	a5,a0
   43028:	40b005b3          	neg	a1,a1
   4302c:	8d9d                	sub	a1,a1,a5
   4302e:	40a00533          	neg	a0,a0
   43032:	b7f1                	j	42ffe <__fixdfdi+0x2e>
   43034:	43300793          	li	a5,1075
   43038:	8f91                	sub	a5,a5,a2
   4303a:	477d                	li	a4,31
   4303c:	00f74c63          	blt	a4,a5,43054 <__fixdfdi+0x84>
   43040:	bed60613          	add	a2,a2,-1043
   43044:	00c59633          	sll	a2,a1,a2
   43048:	00f55533          	srl	a0,a0,a5
   4304c:	8d51                	or	a0,a0,a2
   4304e:	00f5d5b3          	srl	a1,a1,a5
   43052:	bfc1                	j	43022 <__fixdfdi+0x52>
   43054:	41300513          	li	a0,1043
   43058:	8d11                	sub	a0,a0,a2
   4305a:	00a5d533          	srl	a0,a1,a0
   4305e:	4581                	li	a1,0
   43060:	b7c9                	j	43022 <__fixdfdi+0x52>
   43062:	4501                	li	a0,0
   43064:	4581                	li	a1,0
   43066:	8082                	ret

00043068 <__floatdidf>:
   43068:	1101                	add	sp,sp,-32
   4306a:	ce06                	sw	ra,28(sp)
   4306c:	cc22                	sw	s0,24(sp)
   4306e:	ca26                	sw	s1,20(sp)
   43070:	c84a                	sw	s2,16(sp)
   43072:	c64e                	sw	s3,12(sp)
   43074:	c452                	sw	s4,8(sp)
   43076:	c256                	sw	s5,4(sp)
   43078:	c05a                	sw	s6,0(sp)
   4307a:	00b567b3          	or	a5,a0,a1
   4307e:	12078763          	beqz	a5,431ac <__floatdidf+0x144>
   43082:	842a                	mv	s0,a0
   43084:	84ae                	mv	s1,a1
   43086:	01f5da13          	srl	s4,a1,0x1f
   4308a:	0005d963          	bgez	a1,4309c <__floatdidf+0x34>
   4308e:	00a037b3          	snez	a5,a0
   43092:	40b004b3          	neg	s1,a1
   43096:	8c9d                	sub	s1,s1,a5
   43098:	40a00433          	neg	s0,a0
   4309c:	87a6                	mv	a5,s1
   4309e:	60049913          	clz	s2,s1
   430a2:	e489                	bnez	s1,430ac <__floatdidf+0x44>
   430a4:	60041913          	clz	s2,s0
   430a8:	02090913          	add	s2,s2,32
   430ac:	43e00993          	li	s3,1086
   430b0:	412989b3          	sub	s3,s3,s2
   430b4:	43300713          	li	a4,1075
   430b8:	07374063          	blt	a4,s3,43118 <__floatdidf+0xb0>
   430bc:	472d                	li	a4,11
   430be:	0ee90c63          	beq	s2,a4,431b6 <__floatdidf+0x14e>
   430c2:	02a00793          	li	a5,42
   430c6:	0527c363          	blt	a5,s2,4310c <__floatdidf+0xa4>
   430ca:	02b00793          	li	a5,43
   430ce:	ff590713          	add	a4,s2,-11
   430d2:	412787b3          	sub	a5,a5,s2
   430d6:	00f457b3          	srl	a5,s0,a5
   430da:	00e494b3          	sll	s1,s1,a4
   430de:	8fc5                	or	a5,a5,s1
   430e0:	00e41433          	sll	s0,s0,a4
   430e4:	07b2                	sll	a5,a5,0xc
   430e6:	40f2                	lw	ra,28(sp)
   430e8:	83b1                	srl	a5,a5,0xc
   430ea:	8522                	mv	a0,s0
   430ec:	09d2                	sll	s3,s3,0x14
   430ee:	4462                	lw	s0,24(sp)
   430f0:	00f9e9b3          	or	s3,s3,a5
   430f4:	0a7e                	sll	s4,s4,0x1f
   430f6:	0149e7b3          	or	a5,s3,s4
   430fa:	44d2                	lw	s1,20(sp)
   430fc:	4942                	lw	s2,16(sp)
   430fe:	49b2                	lw	s3,12(sp)
   43100:	4a22                	lw	s4,8(sp)
   43102:	4a92                	lw	s5,4(sp)
   43104:	4b02                	lw	s6,0(sp)
   43106:	85be                	mv	a1,a5
   43108:	6105                	add	sp,sp,32
   4310a:	8082                	ret
   4310c:	fd590793          	add	a5,s2,-43
   43110:	00f417b3          	sll	a5,s0,a5
   43114:	4401                	li	s0,0
   43116:	b7f9                	j	430e4 <__floatdidf+0x7c>
   43118:	43600793          	li	a5,1078
   4311c:	0337d663          	bge	a5,s3,43148 <__floatdidf+0xe0>
   43120:	4621                	li	a2,8
   43122:	41260633          	sub	a2,a2,s2
   43126:	8522                	mv	a0,s0
   43128:	85a6                	mv	a1,s1
   4312a:	3b11                	jal	42e3e <__lshrdi3>
   4312c:	8b2a                	mv	s6,a0
   4312e:	8aae                	mv	s5,a1
   43130:	8522                	mv	a0,s0
   43132:	85a6                	mv	a1,s1
   43134:	03890613          	add	a2,s2,56
   43138:	333d                	jal	42e66 <__ashldi3>
   4313a:	00b56433          	or	s0,a0,a1
   4313e:	00803433          	snez	s0,s0
   43142:	01646433          	or	s0,s0,s6
   43146:	84d6                	mv	s1,s5
   43148:	47a1                	li	a5,8
   4314a:	0127df63          	bge	a5,s2,43168 <__floatdidf+0x100>
   4314e:	02800793          	li	a5,40
   43152:	ff890713          	add	a4,s2,-8
   43156:	412787b3          	sub	a5,a5,s2
   4315a:	00f457b3          	srl	a5,s0,a5
   4315e:	00e494b3          	sll	s1,s1,a4
   43162:	8cdd                	or	s1,s1,a5
   43164:	00e41433          	sll	s0,s0,a4
   43168:	fff4f793          	and	a5,s1,-1
   4316c:	00747713          	and	a4,s0,7
   43170:	49779793          	bclr	a5,a5,0x17
   43174:	cf01                	beqz	a4,4318c <__floatdidf+0x124>
   43176:	00f47713          	and	a4,s0,15
   4317a:	4691                	li	a3,4
   4317c:	00d70863          	beq	a4,a3,4318c <__floatdidf+0x124>
   43180:	00440713          	add	a4,s0,4
   43184:	008736b3          	sltu	a3,a4,s0
   43188:	97b6                	add	a5,a5,a3
   4318a:	843a                	mv	s0,a4
   4318c:	00879713          	sll	a4,a5,0x8
   43190:	00075863          	bgez	a4,431a0 <__floatdidf+0x138>
   43194:	43f00993          	li	s3,1087
   43198:	412989b3          	sub	s3,s3,s2
   4319c:	49779793          	bclr	a5,a5,0x17
   431a0:	01d79713          	sll	a4,a5,0x1d
   431a4:	800d                	srl	s0,s0,0x3
   431a6:	8c59                	or	s0,s0,a4
   431a8:	838d                	srl	a5,a5,0x3
   431aa:	bf2d                	j	430e4 <__floatdidf+0x7c>
   431ac:	4781                	li	a5,0
   431ae:	4401                	li	s0,0
   431b0:	4981                	li	s3,0
   431b2:	4a01                	li	s4,0
   431b4:	bf05                	j	430e4 <__floatdidf+0x7c>
   431b6:	43300993          	li	s3,1075
   431ba:	b72d                	j	430e4 <__floatdidf+0x7c>

000431bc <__extenddftf2>:
   431bc:	01465713          	srl	a4,a2,0x14
   431c0:	00c61793          	sll	a5,a2,0xc
   431c4:	7ff77713          	and	a4,a4,2047
   431c8:	1101                	add	sp,sp,-32
   431ca:	83b1                	srl	a5,a5,0xc
   431cc:	00170693          	add	a3,a4,1
   431d0:	c82e                	sw	a1,16(sp)
   431d2:	ca3e                	sw	a5,20(sp)
   431d4:	ce02                	sw	zero,28(sp)
   431d6:	cc02                	sw	zero,24(sp)
   431d8:	7fe6f693          	and	a3,a3,2046
   431dc:	827d                	srl	a2,a2,0x1f
   431de:	c2b9                	beqz	a3,43224 <__extenddftf2+0x68>
   431e0:	6691                	lui	a3,0x4
   431e2:	c0068693          	add	a3,a3,-1024 # 3c00 <RISCV_MEIE_MTIE+0x3380>
   431e6:	9736                	add	a4,a4,a3
   431e8:	0047d693          	srl	a3,a5,0x4
   431ec:	ce36                	sw	a3,28(sp)
   431ee:	07f2                	sll	a5,a5,0x1c
   431f0:	0045d693          	srl	a3,a1,0x4
   431f4:	8fd5                	or	a5,a5,a3
   431f6:	05f2                	sll	a1,a1,0x1c
   431f8:	cc3e                	sw	a5,24(sp)
   431fa:	ca2e                	sw	a1,20(sp)
   431fc:	c802                	sw	zero,16(sp)
   431fe:	47f2                	lw	a5,28(sp)
   43200:	4842                	lw	a6,16(sp)
   43202:	45d2                	lw	a1,20(sp)
   43204:	00f11623          	sh	a5,12(sp)
   43208:	00f61793          	sll	a5,a2,0xf
   4320c:	8fd9                	or	a5,a5,a4
   4320e:	00f11723          	sh	a5,14(sp)
   43212:	46e2                	lw	a3,24(sp)
   43214:	47b2                	lw	a5,12(sp)
   43216:	01052023          	sw	a6,0(a0)
   4321a:	c14c                	sw	a1,4(a0)
   4321c:	c514                	sw	a3,8(a0)
   4321e:	c55c                	sw	a5,12(a0)
   43220:	6105                	add	sp,sp,32
   43222:	8082                	ret
   43224:	00b7e6b3          	or	a3,a5,a1
   43228:	e371                	bnez	a4,432ec <__extenddftf2+0x130>
   4322a:	daf1                	beqz	a3,431fe <__extenddftf2+0x42>
   4322c:	c7a1                	beqz	a5,43274 <__extenddftf2+0xb8>
   4322e:	60079793          	clz	a5,a5
   43232:	03178693          	add	a3,a5,49
   43236:	4056d813          	sra	a6,a3,0x5
   4323a:	8afd                	and	a3,a3,31
   4323c:	c2a9                	beqz	a3,4327e <__extenddftf2+0xc2>
   4323e:	58f1                	li	a7,-4
   43240:	031808b3          	mul	a7,a6,a7
   43244:	02000e13          	li	t3,32
   43248:	01010f13          	add	t5,sp,16
   4324c:	40de0e33          	sub	t3,t3,a3
   43250:	00c88713          	add	a4,a7,12
   43254:	977a                	add	a4,a4,t5
   43256:	411008b3          	neg	a7,a7
   4325a:	06ef1963          	bne	t5,a4,432cc <__extenddftf2+0x110>
   4325e:	02010893          	add	a7,sp,32
   43262:	00d596b3          	sll	a3,a1,a3
   43266:	fff80713          	add	a4,a6,-1
   4326a:	21184833          	sh2add	a6,a6,a7
   4326e:	fed82823          	sw	a3,-16(a6)
   43272:	a03d                	j	432a0 <__extenddftf2+0xe4>
   43274:	60069693          	clz	a3,a3
   43278:	02068793          	add	a5,a3,32
   4327c:	bf5d                	j	43232 <__extenddftf2+0x76>
   4327e:	55f1                	li	a1,-4
   43280:	02b805b3          	mul	a1,a6,a1
   43284:	0878                	add	a4,sp,28
   43286:	468d                	li	a3,3
   43288:	00b708b3          	add	a7,a4,a1
   4328c:	0008a883          	lw	a7,0(a7)
   43290:	16fd                	add	a3,a3,-1
   43292:	1771                	add	a4,a4,-4
   43294:	01172223          	sw	a7,4(a4)
   43298:	ff06d8e3          	bge	a3,a6,43288 <__extenddftf2+0xcc>
   4329c:	fff80713          	add	a4,a6,-1
   432a0:	0705                	add	a4,a4,1
   432a2:	070a                	sll	a4,a4,0x2
   432a4:	45a1                	li	a1,8
   432a6:	0814                	add	a3,sp,16
   432a8:	00b76863          	bltu	a4,a1,432b8 <__extenddftf2+0xfc>
   432ac:	0006a023          	sw	zero,0(a3)
   432b0:	0006a223          	sw	zero,4(a3)
   432b4:	1761                	add	a4,a4,-8
   432b6:	0834                	add	a3,sp,24
   432b8:	4591                	li	a1,4
   432ba:	00b76463          	bltu	a4,a1,432c2 <__extenddftf2+0x106>
   432be:	0006a023          	sw	zero,0(a3)
   432c2:	6711                	lui	a4,0x4
   432c4:	c0c70713          	add	a4,a4,-1012 # 3c0c <RISCV_MEIE_MTIE+0x338c>
   432c8:	8f1d                	sub	a4,a4,a5
   432ca:	bf15                	j	431fe <__extenddftf2+0x42>
   432cc:	00072303          	lw	t1,0(a4)
   432d0:	ffc72e83          	lw	t4,-4(a4)
   432d4:	01170fb3          	add	t6,a4,a7
   432d8:	00d31333          	sll	t1,t1,a3
   432dc:	01cedeb3          	srl	t4,t4,t3
   432e0:	01d36333          	or	t1,t1,t4
   432e4:	006fa023          	sw	t1,0(t6)
   432e8:	1771                	add	a4,a4,-4
   432ea:	bf85                	j	4325a <__extenddftf2+0x9e>
   432ec:	ce91                	beqz	a3,43308 <__extenddftf2+0x14c>
   432ee:	01c79713          	sll	a4,a5,0x1c
   432f2:	0045d693          	srl	a3,a1,0x4
   432f6:	8f55                	or	a4,a4,a3
   432f8:	05f2                	sll	a1,a1,0x1c
   432fa:	8391                	srl	a5,a5,0x4
   432fc:	28f79793          	bset	a5,a5,0xf
   43300:	cc3a                	sw	a4,24(sp)
   43302:	ca2e                	sw	a1,20(sp)
   43304:	c802                	sw	zero,16(sp)
   43306:	ce3e                	sw	a5,28(sp)
   43308:	6721                	lui	a4,0x8
   4330a:	177d                	add	a4,a4,-1 # 7fff <HEAP_SIZE+0x3fff>
   4330c:	bdcd                	j	431fe <__extenddftf2+0x42>

0004330e <__trunctfdf2>:
   4330e:	454c                	lw	a1,12(a0)
   43310:	4154                	lw	a3,4(a0)
   43312:	4518                	lw	a4,8(a0)
   43314:	411c                	lw	a5,0(a0)
   43316:	1101                	add	sp,sp,-32
   43318:	0810                	add	a2,sp,16
   4331a:	c236                	sw	a3,4(sp)
   4331c:	c43a                	sw	a4,8(sp)
   4331e:	ca36                	sw	a3,20(sp)
   43320:	cc3a                	sw	a4,24(sp)
   43322:	00159693          	sll	a3,a1,0x1
   43326:	0805c733          	zext.h	a4,a1
   4332a:	c62e                	sw	a1,12(sp)
   4332c:	ce3a                	sw	a4,28(sp)
   4332e:	c03e                	sw	a5,0(sp)
   43330:	c83e                	sw	a5,16(sp)
   43332:	82c5                	srl	a3,a3,0x11
   43334:	81fd                	srl	a1,a1,0x1f
   43336:	00410893          	add	a7,sp,4
   4333a:	8732                	mv	a4,a2
   4333c:	8e32                	mv	t3,a2
   4333e:	4748                	lw	a0,12(a4)
   43340:	00872803          	lw	a6,8(a4)
   43344:	1771                	add	a4,a4,-4
   43346:	050e                	sll	a0,a0,0x3
   43348:	01d85813          	srl	a6,a6,0x1d
   4334c:	01056533          	or	a0,a0,a6
   43350:	cb08                	sw	a0,16(a4)
   43352:	ff1716e3          	bne	a4,a7,4333e <__trunctfdf2+0x30>
   43356:	00379513          	sll	a0,a5,0x3
   4335a:	00168793          	add	a5,a3,1
   4335e:	01179713          	sll	a4,a5,0x11
   43362:	c82a                	sw	a0,16(sp)
   43364:	8349                	srl	a4,a4,0x12
   43366:	14070663          	beqz	a4,434b2 <__trunctfdf2+0x1a4>
   4336a:	77f1                	lui	a5,0xffffc
   4336c:	40078793          	add	a5,a5,1024 # ffffc400 <__share_mem_end__+0xfecfc400>
   43370:	96be                	add	a3,a3,a5
   43372:	7fe00793          	li	a5,2046
   43376:	16d7cb63          	blt	a5,a3,434ec <__trunctfdf2+0x1de>
   4337a:	04d05563          	blez	a3,433c4 <__trunctfdf2+0xb6>
   4337e:	4662                	lw	a2,24(sp)
   43380:	47f2                	lw	a5,28(sp)
   43382:	4752                	lw	a4,20(sp)
   43384:	01c65813          	srl	a6,a2,0x1c
   43388:	0792                	sll	a5,a5,0x4
   4338a:	0107e7b3          	or	a5,a5,a6
   4338e:	ca3e                	sw	a5,20(sp)
   43390:	00471793          	sll	a5,a4,0x4
   43394:	8fc9                	or	a5,a5,a0
   43396:	8371                	srl	a4,a4,0x1c
   43398:	0612                	sll	a2,a2,0x4
   4339a:	00f037b3          	snez	a5,a5
   4339e:	8f51                	or	a4,a4,a2
   433a0:	8fd9                	or	a5,a5,a4
   433a2:	4752                	lw	a4,20(sp)
   433a4:	0077f613          	and	a2,a5,7
   433a8:	14060663          	beqz	a2,434f4 <__trunctfdf2+0x1e6>
   433ac:	00f7f613          	and	a2,a5,15
   433b0:	4511                	li	a0,4
   433b2:	14a60163          	beq	a2,a0,434f4 <__trunctfdf2+0x1e6>
   433b6:	00478613          	add	a2,a5,4
   433ba:	00f63533          	sltu	a0,a2,a5
   433be:	972a                	add	a4,a4,a0
   433c0:	87b2                	mv	a5,a2
   433c2:	aa0d                	j	434f4 <__trunctfdf2+0x1e6>
   433c4:	fcc00793          	li	a5,-52
   433c8:	00f6d663          	bge	a3,a5,433d4 <__trunctfdf2+0xc6>
   433cc:	ca02                	sw	zero,20(sp)
   433ce:	4785                	li	a5,1
   433d0:	4681                	li	a3,0
   433d2:	bfc1                	j	433a2 <__trunctfdf2+0x94>
   433d4:	4ef2                	lw	t4,28(sp)
   433d6:	03d00793          	li	a5,61
   433da:	8f95                	sub	a5,a5,a3
   433dc:	4057d713          	sra	a4,a5,0x5
   433e0:	01f7f693          	and	a3,a5,31
   433e4:	293e9e93          	bset	t4,t4,0x13
   433e8:	00271813          	sll	a6,a4,0x2
   433ec:	ce76                	sw	t4,28(sp)
   433ee:	8532                	mv	a0,a2
   433f0:	4781                	li	a5,0
   433f2:	20c748b3          	sh2add	a7,a4,a2
   433f6:	00052303          	lw	t1,0(a0)
   433fa:	0511                	add	a0,a0,4
   433fc:	0067e7b3          	or	a5,a5,t1
   43400:	fea89be3          	bne	a7,a0,433f6 <__trunctfdf2+0xe8>
   43404:	450d                	li	a0,3
   43406:	8d19                	sub	a0,a0,a4
   43408:	ee99                	bnez	a3,43426 <__trunctfdf2+0x118>
   4340a:	010608b3          	add	a7,a2,a6
   4340e:	0008a883          	lw	a7,0(a7)
   43412:	0685                	add	a3,a3,1
   43414:	01162023          	sw	a7,0(a2)
   43418:	0611                	add	a2,a2,4
   4341a:	fed558e3          	bge	a0,a3,4340a <__trunctfdf2+0xfc>
   4341e:	4691                	li	a3,4
   43420:	40e68733          	sub	a4,a3,a4
   43424:	a835                	j	43460 <__trunctfdf2+0x152>
   43426:	02080893          	add	a7,a6,32
   4342a:	988a                	add	a7,a7,sp
   4342c:	ff08a883          	lw	a7,-16(a7)
   43430:	02000313          	li	t1,32
   43434:	40d30333          	sub	t1,t1,a3
   43438:	006898b3          	sll	a7,a7,t1
   4343c:	9642                	add	a2,a2,a6
   4343e:	0117e7b3          	or	a5,a5,a7
   43442:	41000833          	neg	a6,a6
   43446:	4f01                	li	t5,0
   43448:	04af4463          	blt	t5,a0,43490 <__trunctfdf2+0x182>
   4344c:	4611                	li	a2,4
   4344e:	40e60733          	sub	a4,a2,a4
   43452:	00ded6b3          	srl	a3,t4,a3
   43456:	1010                	add	a2,sp,32
   43458:	20c54533          	sh2add	a0,a0,a2
   4345c:	fed52823          	sw	a3,-16(a0)
   43460:	4691                	li	a3,4
   43462:	8e99                	sub	a3,a3,a4
   43464:	068a                	sll	a3,a3,0x2
   43466:	4621                	li	a2,8
   43468:	21c74733          	sh2add	a4,a4,t3
   4346c:	00c6e863          	bltu	a3,a2,4347c <__trunctfdf2+0x16e>
   43470:	00072023          	sw	zero,0(a4)
   43474:	00072223          	sw	zero,4(a4)
   43478:	16e1                	add	a3,a3,-8
   4347a:	0721                	add	a4,a4,8
   4347c:	4611                	li	a2,4
   4347e:	00c6e463          	bltu	a3,a2,43486 <__trunctfdf2+0x178>
   43482:	00072023          	sw	zero,0(a4)
   43486:	4742                	lw	a4,16(sp)
   43488:	00f037b3          	snez	a5,a5
   4348c:	8fd9                	or	a5,a5,a4
   4348e:	b789                	j	433d0 <__trunctfdf2+0xc2>
   43490:	00062883          	lw	a7,0(a2)
   43494:	00462f83          	lw	t6,4(a2)
   43498:	010602b3          	add	t0,a2,a6
   4349c:	00d8d8b3          	srl	a7,a7,a3
   434a0:	006f9fb3          	sll	t6,t6,t1
   434a4:	01f8e8b3          	or	a7,a7,t6
   434a8:	0112a023          	sw	a7,0(t0)
   434ac:	0f05                	add	t5,t5,1
   434ae:	0611                	add	a2,a2,4
   434b0:	bf61                	j	43448 <__trunctfdf2+0x13a>
   434b2:	4652                	lw	a2,20(sp)
   434b4:	4762                	lw	a4,24(sp)
   434b6:	4872                	lw	a6,28(sp)
   434b8:	00c767b3          	or	a5,a4,a2
   434bc:	0107e7b3          	or	a5,a5,a6
   434c0:	8fc9                	or	a5,a5,a0
   434c2:	e689                	bnez	a3,434cc <__trunctfdf2+0x1be>
   434c4:	00f037b3          	snez	a5,a5
   434c8:	4701                	li	a4,0
   434ca:	bde9                	j	433a4 <__trunctfdf2+0x96>
   434cc:	cfbd                	beqz	a5,4354a <__trunctfdf2+0x23c>
   434ce:	00471793          	sll	a5,a4,0x4
   434d2:	8271                	srl	a2,a2,0x1c
   434d4:	8371                	srl	a4,a4,0x1c
   434d6:	0812                	sll	a6,a6,0x4
   434d8:	8e5d                	or	a2,a2,a5
   434da:	01076733          	or	a4,a4,a6
   434de:	ff867793          	and	a5,a2,-8
   434e2:	7ff00693          	li	a3,2047
   434e6:	29671713          	bset	a4,a4,0x16
   434ea:	bd6d                	j	433a4 <__trunctfdf2+0x96>
   434ec:	4701                	li	a4,0
   434ee:	4781                	li	a5,0
   434f0:	7ff00693          	li	a3,2047
   434f4:	00871613          	sll	a2,a4,0x8
   434f8:	00065b63          	bgez	a2,4350e <__trunctfdf2+0x200>
   434fc:	0685                	add	a3,a3,1
   434fe:	7ff00613          	li	a2,2047
   43502:	49771713          	bclr	a4,a4,0x17
   43506:	00c69463          	bne	a3,a2,4350e <__trunctfdf2+0x200>
   4350a:	4701                	li	a4,0
   4350c:	4781                	li	a5,0
   4350e:	01d71613          	sll	a2,a4,0x1d
   43512:	838d                	srl	a5,a5,0x3
   43514:	8fd1                	or	a5,a5,a2
   43516:	7ff00613          	li	a2,2047
   4351a:	830d                	srl	a4,a4,0x3
   4351c:	00c69963          	bne	a3,a2,4352e <__trunctfdf2+0x220>
   43520:	8fd9                	or	a5,a5,a4
   43522:	4701                	li	a4,0
   43524:	c789                	beqz	a5,4352e <__trunctfdf2+0x220>
   43526:	00080737          	lui	a4,0x80
   4352a:	4781                	li	a5,0
   4352c:	4581                	li	a1,0
   4352e:	06d2                	sll	a3,a3,0x14
   43530:	7ff00637          	lui	a2,0x7ff00
   43534:	0732                	sll	a4,a4,0xc
   43536:	8331                	srl	a4,a4,0xc
   43538:	8ef1                	and	a3,a3,a2
   4353a:	05fe                	sll	a1,a1,0x1f
   4353c:	8ed9                	or	a3,a3,a4
   4353e:	00b6e733          	or	a4,a3,a1
   43542:	853e                	mv	a0,a5
   43544:	85ba                	mv	a1,a4
   43546:	6105                	add	sp,sp,32
   43548:	8082                	ret
   4354a:	4701                	li	a4,0
   4354c:	b755                	j	434f0 <__trunctfdf2+0x1e2>

0004354e <core1_thread_entry>:
   4354e:	1141                	add	sp,sp,-16
   43550:	c606                	sw	ra,12(sp)
   43552:	06400513          	li	a0,100
   43556:	141010ef          	jal	44e96 <_tx_thread_sleep>
   4355a:	bfe5                	j	43552 <core1_thread_entry+0x4>

0004355c <tx_application_define>:
   4355c:	1101                	add	sp,sp,-32
   4355e:	0b400793          	li	a5,180
   43562:	c43e                	sw	a5,8(sp)
   43564:	012d0737          	lui	a4,0x12d0
   43568:	4785                	li	a5,1
   4356a:	00043637          	lui	a2,0x43
   4356e:	0004b5b7          	lui	a1,0x4b
   43572:	c23e                	sw	a5,4(sp)
   43574:	c002                	sw	zero,0(sp)
   43576:	4885                	li	a7,1
   43578:	4805                	li	a6,1
   4357a:	40000793          	li	a5,1024
   4357e:	1d870713          	add	a4,a4,472 # 12d01d8 <core1_thread_stack>
   43582:	4681                	li	a3,0
   43584:	54e60613          	add	a2,a2,1358 # 4354e <core1_thread_entry>
   43588:	bb458593          	add	a1,a1,-1100 # 4abb4 <__clz_tab+0x100>
   4358c:	dd818513          	add	a0,gp,-552 # 12d05d8 <core1_thread>
   43590:	ce06                	sw	ra,28(sp)
   43592:	0e8020ef          	jal	4567a <_txe_thread_create>
   43596:	40f2                	lw	ra,28(sp)
   43598:	6105                	add	sp,sp,32
   4359a:	8082                	ret

0004359c <main>:
   4359c:	1141                	add	sp,sp,-16
   4359e:	c606                	sw	ra,12(sp)
   435a0:	2f39                	jal	43cbe <board_init_core1>
   435a2:	0004b5b7          	lui	a1,0x4b
   435a6:	0004b537          	lui	a0,0x4b
   435aa:	bbc58593          	add	a1,a1,-1092 # 4abbc <__clz_tab+0x108>
   435ae:	bc850513          	add	a0,a0,-1080 # 4abc8 <__clz_tab+0x114>
   435b2:	0ea030ef          	jal	4669c <iprintf>
   435b6:	658010ef          	jal	44c0e <_tx_initialize_kernel_enter>
   435ba:	40b2                	lw	ra,12(sp)
   435bc:	4501                	li	a0,0
   435be:	0141                	add	sp,sp,16
   435c0:	8082                	ret

000435c2 <__libc_init_array>:
   435c2:	1141                	add	sp,sp,-16
   435c4:	c422                	sw	s0,8(sp)
   435c6:	c04a                	sw	s2,0(sp)
   435c8:	9d818793          	add	a5,gp,-1576 # 12d01d8 <core1_thread_stack>
   435cc:	9d818713          	add	a4,gp,-1576 # 12d01d8 <core1_thread_stack>
   435d0:	c606                	sw	ra,12(sp)
   435d2:	c226                	sw	s1,4(sp)
   435d4:	40e78933          	sub	s2,a5,a4
   435d8:	00e78d63          	beq	a5,a4,435f2 <__libc_init_array+0x30>
   435dc:	40295913          	sra	s2,s2,0x2
   435e0:	9d818413          	add	s0,gp,-1576 # 12d01d8 <core1_thread_stack>
   435e4:	4481                	li	s1,0
   435e6:	401c                	lw	a5,0(s0)
   435e8:	0485                	add	s1,s1,1
   435ea:	0411                	add	s0,s0,4
   435ec:	9782                	jalr	a5
   435ee:	ff24ece3          	bltu	s1,s2,435e6 <__libc_init_array+0x24>
   435f2:	9d818793          	add	a5,gp,-1576 # 12d01d8 <core1_thread_stack>
   435f6:	9d818713          	add	a4,gp,-1576 # 12d01d8 <core1_thread_stack>
   435fa:	40e78933          	sub	s2,a5,a4
   435fe:	40295913          	sra	s2,s2,0x2
   43602:	00e78b63          	beq	a5,a4,43618 <__libc_init_array+0x56>
   43606:	9d818413          	add	s0,gp,-1576 # 12d01d8 <core1_thread_stack>
   4360a:	4481                	li	s1,0
   4360c:	401c                	lw	a5,0(s0)
   4360e:	0485                	add	s1,s1,1
   43610:	0411                	add	s0,s0,4
   43612:	9782                	jalr	a5
   43614:	ff24ece3          	bltu	s1,s2,4360c <__libc_init_array+0x4a>
   43618:	40b2                	lw	ra,12(sp)
   4361a:	4422                	lw	s0,8(sp)
   4361c:	4492                	lw	s1,4(sp)
   4361e:	4902                	lw	s2,0(sp)
   43620:	0141                	add	sp,sp,16
   43622:	8082                	ret

00043624 <_clean_up>:
   43624:	28b01793          	bset	a5,zero,0xb
   43628:	3047b073          	csrc	mie,a5
   4362c:	e42007b7          	lui	a5,0xe4200
   43630:	e4200737          	lui	a4,0xe4200
   43634:	0007a023          	sw	zero,0(a5) # e4200000 <__share_mem_end__+0xe2f00000>
   43638:	0711                	add	a4,a4,4 # e4200004 <__share_mem_end__+0xe2f00004>
   4363a:	4781                	li	a5,0
   4363c:	08000693          	li	a3,128
   43640:	c31c                	sw	a5,0(a4)
   43642:	0785                	add	a5,a5,1
   43644:	fed79ee3          	bne	a5,a3,43640 <_clean_up+0x1c>
   43648:	e40027b7          	lui	a5,0xe4002
   4364c:	0007a023          	sw	zero,0(a5) # e4002000 <__share_mem_end__+0xe2d02000>
   43650:	e40026b7          	lui	a3,0xe4002
   43654:	0006a223          	sw	zero,4(a3) # e4002004 <__share_mem_end__+0xe2d02004>
   43658:	e4002737          	lui	a4,0xe4002
   4365c:	00072423          	sw	zero,8(a4) # e4002008 <__share_mem_end__+0xe2d02008>
   43660:	0007a623          	sw	zero,12(a5)
   43664:	8082                	ret

00043666 <c_startup>:
   43666:	9d818593          	add	a1,gp,-1576 # 12d01d8 <core1_thread_stack>
   4366a:	9d818793          	add	a5,gp,-1576 # 12d01d8 <core1_thread_stack>
   4366e:	4f018713          	add	a4,gp,1264 # 12d0cf0 <__bss_end__>
   43672:	0035f613          	and	a2,a1,3
   43676:	8f1d                	sub	a4,a4,a5
   43678:	42060563          	beqz	a2,43aa2 <c_startup+0x43c>
   4367c:	c34d                	beqz	a4,4371e <c_startup+0xb8>
   4367e:	40b00633          	neg	a2,a1
   43682:	fff70513          	add	a0,a4,-1
   43686:	4815                	li	a6,5
   43688:	00367793          	and	a5,a2,3
   4368c:	5aa87f63          	bgeu	a6,a0,43c4a <c_startup+0x5e4>
   43690:	4501                	li	a0,0
   43692:	cf99                	beqz	a5,436b0 <c_startup+0x4a>
   43694:	9c018c23          	sb	zero,-1576(gp) # 12d01d8 <core1_thread_stack>
   43698:	8a09                	and	a2,a2,2
   4369a:	4505                	li	a0,1
   4369c:	ca11                	beqz	a2,436b0 <c_startup+0x4a>
   4369e:	000580a3          	sb	zero,1(a1)
   436a2:	468d                	li	a3,3
   436a4:	4509                	li	a0,2
   436a6:	00d79563          	bne	a5,a3,436b0 <c_startup+0x4a>
   436aa:	00058123          	sb	zero,2(a1)
   436ae:	450d                	li	a0,3
   436b0:	40f70833          	sub	a6,a4,a5
   436b4:	ffe87693          	and	a3,a6,-2
   436b8:	97ae                	add	a5,a5,a1
   436ba:	9af5                	and	a3,a3,-3
   436bc:	00d78633          	add	a2,a5,a3
   436c0:	0007a023          	sw	zero,0(a5)
   436c4:	0791                	add	a5,a5,4
   436c6:	fec79de3          	bne	a5,a2,436c0 <c_startup+0x5a>
   436ca:	05068a63          	beq	a3,a6,4371e <c_startup+0xb8>
   436ce:	96aa                	add	a3,a3,a0
   436d0:	00d587b3          	add	a5,a1,a3
   436d4:	00078023          	sb	zero,0(a5)
   436d8:	00168793          	add	a5,a3,1
   436dc:	04e7f163          	bgeu	a5,a4,4371e <c_startup+0xb8>
   436e0:	97ae                	add	a5,a5,a1
   436e2:	00078023          	sb	zero,0(a5)
   436e6:	00268793          	add	a5,a3,2
   436ea:	02e7fa63          	bgeu	a5,a4,4371e <c_startup+0xb8>
   436ee:	97ae                	add	a5,a5,a1
   436f0:	00078023          	sb	zero,0(a5)
   436f4:	00368793          	add	a5,a3,3
   436f8:	02e7f363          	bgeu	a5,a4,4371e <c_startup+0xb8>
   436fc:	97ae                	add	a5,a5,a1
   436fe:	00078023          	sb	zero,0(a5)
   43702:	00468793          	add	a5,a3,4
   43706:	00e7fc63          	bgeu	a5,a4,4371e <c_startup+0xb8>
   4370a:	97ae                	add	a5,a5,a1
   4370c:	00078023          	sb	zero,0(a5)
   43710:	0695                	add	a3,a3,5
   43712:	00e6f663          	bgeu	a3,a4,4371e <c_startup+0xb8>
   43716:	00d587b3          	add	a5,a1,a3
   4371a:	00078023          	sb	zero,0(a5)
   4371e:	012c06b7          	lui	a3,0x12c0
   43722:	00068593          	mv	a1,a3
   43726:	012c0737          	lui	a4,0x12c0
   4372a:	00068793          	mv	a5,a3
   4372e:	00070713          	mv	a4,a4
   43732:	0035f613          	and	a2,a1,3
   43736:	8f1d                	sub	a4,a4,a5
   43738:	30060c63          	beqz	a2,43a50 <c_startup+0x3ea>
   4373c:	c34d                	beqz	a4,437de <c_startup+0x178>
   4373e:	40b00633          	neg	a2,a1
   43742:	fff70513          	add	a0,a4,-1 # 12bffff <_flash_size+0xebffff>
   43746:	4815                	li	a6,5
   43748:	00367793          	and	a5,a2,3
   4374c:	4ea87d63          	bgeu	a6,a0,43c46 <c_startup+0x5e0>
   43750:	4501                	li	a0,0
   43752:	cf99                	beqz	a5,43770 <c_startup+0x10a>
   43754:	00068023          	sb	zero,0(a3) # 12c0000 <__noncacheable_bss_end__>
   43758:	8a09                	and	a2,a2,2
   4375a:	4505                	li	a0,1
   4375c:	ca11                	beqz	a2,43770 <c_startup+0x10a>
   4375e:	000580a3          	sb	zero,1(a1)
   43762:	468d                	li	a3,3
   43764:	4509                	li	a0,2
   43766:	00d79563          	bne	a5,a3,43770 <c_startup+0x10a>
   4376a:	00058123          	sb	zero,2(a1)
   4376e:	450d                	li	a0,3
   43770:	40f70833          	sub	a6,a4,a5
   43774:	ffe87693          	and	a3,a6,-2
   43778:	97ae                	add	a5,a5,a1
   4377a:	9af5                	and	a3,a3,-3
   4377c:	00f68633          	add	a2,a3,a5
   43780:	0007a023          	sw	zero,0(a5)
   43784:	0791                	add	a5,a5,4
   43786:	fef61de3          	bne	a2,a5,43780 <c_startup+0x11a>
   4378a:	05068a63          	beq	a3,a6,437de <c_startup+0x178>
   4378e:	96aa                	add	a3,a3,a0
   43790:	00d587b3          	add	a5,a1,a3
   43794:	00078023          	sb	zero,0(a5)
   43798:	00168793          	add	a5,a3,1
   4379c:	04e7f163          	bgeu	a5,a4,437de <c_startup+0x178>
   437a0:	97ae                	add	a5,a5,a1
   437a2:	00078023          	sb	zero,0(a5)
   437a6:	00268793          	add	a5,a3,2
   437aa:	02e7fa63          	bgeu	a5,a4,437de <c_startup+0x178>
   437ae:	97ae                	add	a5,a5,a1
   437b0:	00078023          	sb	zero,0(a5)
   437b4:	00368793          	add	a5,a3,3
   437b8:	02e7f363          	bgeu	a5,a4,437de <c_startup+0x178>
   437bc:	97ae                	add	a5,a5,a1
   437be:	00078023          	sb	zero,0(a5)
   437c2:	00468793          	add	a5,a3,4
   437c6:	00e7fc63          	bgeu	a5,a4,437de <c_startup+0x178>
   437ca:	97ae                	add	a5,a5,a1
   437cc:	00078023          	sb	zero,0(a5)
   437d0:	0695                	add	a3,a3,5
   437d2:	00e6f663          	bgeu	a3,a4,437de <c_startup+0x178>
   437d6:	00d587b3          	add	a5,a1,a3
   437da:	00078023          	sb	zero,0(a5)
   437de:	002406b7          	lui	a3,0x240
   437e2:	00068593          	mv	a1,a3
   437e6:	00240737          	lui	a4,0x240
   437ea:	00068793          	mv	a5,a3
   437ee:	00070713          	mv	a4,a4
   437f2:	0035f613          	and	a2,a1,3
   437f6:	8f1d                	sub	a4,a4,a5
   437f8:	20060363          	beqz	a2,439fe <c_startup+0x398>
   437fc:	c34d                	beqz	a4,4389e <c_startup+0x238>
   437fe:	40b00633          	neg	a2,a1
   43802:	fff70513          	add	a0,a4,-1 # 23ffff <__fast_load_addr__+0x1f497f>
   43806:	4815                	li	a6,5
   43808:	00367793          	and	a5,a2,3
   4380c:	42a87b63          	bgeu	a6,a0,43c42 <c_startup+0x5dc>
   43810:	4501                	li	a0,0
   43812:	cf99                	beqz	a5,43830 <c_startup+0x1ca>
   43814:	00068023          	sb	zero,0(a3) # 240000 <__fast_ram_bss_end__>
   43818:	8a09                	and	a2,a2,2
   4381a:	4505                	li	a0,1
   4381c:	ca11                	beqz	a2,43830 <c_startup+0x1ca>
   4381e:	000580a3          	sb	zero,1(a1)
   43822:	468d                	li	a3,3
   43824:	4509                	li	a0,2
   43826:	00d79563          	bne	a5,a3,43830 <c_startup+0x1ca>
   4382a:	00058123          	sb	zero,2(a1)
   4382e:	450d                	li	a0,3
   43830:	40f70833          	sub	a6,a4,a5
   43834:	ffe87693          	and	a3,a6,-2
   43838:	97ae                	add	a5,a5,a1
   4383a:	9af5                	and	a3,a3,-3
   4383c:	00f68633          	add	a2,a3,a5
   43840:	0007a023          	sw	zero,0(a5)
   43844:	0791                	add	a5,a5,4
   43846:	fec79de3          	bne	a5,a2,43840 <c_startup+0x1da>
   4384a:	05068a63          	beq	a3,a6,4389e <c_startup+0x238>
   4384e:	96aa                	add	a3,a3,a0
   43850:	00d587b3          	add	a5,a1,a3
   43854:	00078023          	sb	zero,0(a5)
   43858:	00168793          	add	a5,a3,1
   4385c:	04e7f163          	bgeu	a5,a4,4389e <c_startup+0x238>
   43860:	97ae                	add	a5,a5,a1
   43862:	00078023          	sb	zero,0(a5)
   43866:	00268793          	add	a5,a3,2
   4386a:	02e7fa63          	bgeu	a5,a4,4389e <c_startup+0x238>
   4386e:	97ae                	add	a5,a5,a1
   43870:	00078023          	sb	zero,0(a5)
   43874:	00368793          	add	a5,a3,3
   43878:	02e7f363          	bgeu	a5,a4,4389e <c_startup+0x238>
   4387c:	97ae                	add	a5,a5,a1
   4387e:	00078023          	sb	zero,0(a5)
   43882:	00468793          	add	a5,a3,4
   43886:	00e7fc63          	bgeu	a5,a4,4389e <c_startup+0x238>
   4388a:	97ae                	add	a5,a5,a1
   4388c:	00078023          	sb	zero,0(a5)
   43890:	0695                	add	a3,a3,5
   43892:	00e6f663          	bgeu	a3,a4,4389e <c_startup+0x238>
   43896:	00d587b3          	add	a5,a1,a3
   4389a:	00078023          	sb	zero,0(a5)
   4389e:	012d0637          	lui	a2,0x12d0
   438a2:	0004b6b7          	lui	a3,0x4b
   438a6:	00060793          	mv	a5,a2
   438aa:	4a868713          	add	a4,a3,1192 # 4b4a8 <__data_load_addr__>
   438ae:	00e7e533          	or	a0,a5,a4
   438b2:	00060813          	mv	a6,a2
   438b6:	9d818593          	add	a1,gp,-1576 # 12d01d8 <core1_thread_stack>
   438ba:	890d                	and	a0,a0,3
   438bc:	410585b3          	sub	a1,a1,a6
   438c0:	00060613          	mv	a2,a2
   438c4:	4a868813          	add	a6,a3,1192
   438c8:	22050263          	beqz	a0,43aec <c_startup+0x486>
   438cc:	00b70633          	add	a2,a4,a1
   438d0:	c989                	beqz	a1,438e2 <c_startup+0x27c>
   438d2:	00074683          	lbu	a3,0(a4)
   438d6:	0705                	add	a4,a4,1
   438d8:	0785                	add	a5,a5,1
   438da:	fed78fa3          	sb	a3,-1(a5)
   438de:	fec71ae3          	bne	a4,a2,438d2 <c_startup+0x26c>
   438e2:	0004b637          	lui	a2,0x4b
   438e6:	0004b6b7          	lui	a3,0x4b
   438ea:	4a860793          	add	a5,a2,1192 # 4b4a8 <__data_load_addr__>
   438ee:	68068713          	add	a4,a3,1664 # 4b680 <__fast_load_addr__>
   438f2:	00e7e533          	or	a0,a5,a4
   438f6:	0004b5b7          	lui	a1,0x4b
   438fa:	4a860813          	add	a6,a2,1192
   438fe:	4a858593          	add	a1,a1,1192 # 4b4a8 <__data_load_addr__>
   43902:	890d                	and	a0,a0,3
   43904:	410585b3          	sub	a1,a1,a6
   43908:	4a860613          	add	a2,a2,1192
   4390c:	68068813          	add	a6,a3,1664
   43910:	2e050663          	beqz	a0,43bfc <c_startup+0x596>
   43914:	00b70633          	add	a2,a4,a1
   43918:	c989                	beqz	a1,4392a <c_startup+0x2c4>
   4391a:	00074683          	lbu	a3,0(a4)
   4391e:	0705                	add	a4,a4,1
   43920:	0785                	add	a5,a5,1
   43922:	fed78fa3          	sb	a3,-1(a5)
   43926:	fee61ae3          	bne	a2,a4,4391a <c_startup+0x2b4>
   4392a:	0004b6b7          	lui	a3,0x4b
   4392e:	9d818793          	add	a5,gp,-1576 # 12d01d8 <core1_thread_stack>
   43932:	68068713          	add	a4,a3,1664 # 4b680 <__fast_load_addr__>
   43936:	00e7e533          	or	a0,a5,a4
   4393a:	9d818813          	add	a6,gp,-1576 # 12d01d8 <core1_thread_stack>
   4393e:	9d818593          	add	a1,gp,-1576 # 12d01d8 <core1_thread_stack>
   43942:	890d                	and	a0,a0,3
   43944:	410585b3          	sub	a1,a1,a6
   43948:	9d818613          	add	a2,gp,-1576 # 12d01d8 <core1_thread_stack>
   4394c:	68068813          	add	a6,a3,1664
   43950:	26050463          	beqz	a0,43bb8 <c_startup+0x552>
   43954:	00b70633          	add	a2,a4,a1
   43958:	c989                	beqz	a1,4396a <c_startup+0x304>
   4395a:	00074683          	lbu	a3,0(a4)
   4395e:	0705                	add	a4,a4,1
   43960:	0785                	add	a5,a5,1
   43962:	fed78fa3          	sb	a3,-1(a5)
   43966:	fee61ae3          	bne	a2,a4,4395a <c_startup+0x2f4>
   4396a:	012c0637          	lui	a2,0x12c0
   4396e:	0004b6b7          	lui	a3,0x4b
   43972:	00060793          	mv	a5,a2
   43976:	68068713          	add	a4,a3,1664 # 4b680 <__fast_load_addr__>
   4397a:	00e7e533          	or	a0,a5,a4
   4397e:	012c05b7          	lui	a1,0x12c0
   43982:	00060813          	mv	a6,a2
   43986:	00058593          	mv	a1,a1
   4398a:	890d                	and	a0,a0,3
   4398c:	410585b3          	sub	a1,a1,a6
   43990:	00060613          	mv	a2,a2
   43994:	68068813          	add	a6,a3,1664
   43998:	1c050e63          	beqz	a0,43b74 <c_startup+0x50e>
   4399c:	00b70633          	add	a2,a4,a1
   439a0:	c989                	beqz	a1,439b2 <c_startup+0x34c>
   439a2:	00074683          	lbu	a3,0(a4)
   439a6:	0705                	add	a4,a4,1
   439a8:	0785                	add	a5,a5,1
   439aa:	fed78fa3          	sb	a3,-1(a5)
   439ae:	fee61ae3          	bne	a2,a4,439a2 <c_startup+0x33c>
   439b2:	00240637          	lui	a2,0x240
   439b6:	0004b6b7          	lui	a3,0x4b
   439ba:	00060793          	mv	a5,a2
   439be:	68068713          	add	a4,a3,1664 # 4b680 <__fast_load_addr__>
   439c2:	00e7e533          	or	a0,a5,a4
   439c6:	002405b7          	lui	a1,0x240
   439ca:	00060813          	mv	a6,a2
   439ce:	00058593          	mv	a1,a1
   439d2:	890d                	and	a0,a0,3
   439d4:	410585b3          	sub	a1,a1,a6
   439d8:	00060613          	mv	a2,a2
   439dc:	68068813          	add	a6,a3,1664
   439e0:	14050863          	beqz	a0,43b30 <c_startup+0x4ca>
   439e4:	00b70633          	add	a2,a4,a1
   439e8:	24058c63          	beqz	a1,43c40 <c_startup+0x5da>
   439ec:	00074683          	lbu	a3,0(a4)
   439f0:	0705                	add	a4,a4,1
   439f2:	0785                	add	a5,a5,1
   439f4:	fed78fa3          	sb	a3,-1(a5)
   439f8:	fee61ae3          	bne	a2,a4,439ec <c_startup+0x386>
   439fc:	8082                	ret
   439fe:	00275693          	srl	a3,a4,0x2
   43a02:	00377613          	and	a2,a4,3
   43a06:	ca81                	beqz	a3,43a16 <c_startup+0x3b0>
   43a08:	20b6c6b3          	sh2add	a3,a3,a1
   43a0c:	0007a023          	sw	zero,0(a5)
   43a10:	0791                	add	a5,a5,4
   43a12:	fed79de3          	bne	a5,a3,43a0c <c_startup+0x3a6>
   43a16:	9b79                	and	a4,a4,-2
   43a18:	9b75                	and	a4,a4,-3
   43a1a:	e80602e3          	beqz	a2,4389e <c_startup+0x238>
   43a1e:	00e587b3          	add	a5,a1,a4
   43a22:	00078023          	sb	zero,0(a5)
   43a26:	4785                	li	a5,1
   43a28:	e6f60be3          	beq	a2,a5,4389e <c_startup+0x238>
   43a2c:	002407b7          	lui	a5,0x240
   43a30:	00178793          	add	a5,a5,1 # 240001 <__fast_ram_bss_end__+0x1>
   43a34:	97ba                	add	a5,a5,a4
   43a36:	00078023          	sb	zero,0(a5)
   43a3a:	478d                	li	a5,3
   43a3c:	e6f611e3          	bne	a2,a5,4389e <c_startup+0x238>
   43a40:	002407b7          	lui	a5,0x240
   43a44:	00278793          	add	a5,a5,2 # 240002 <__fast_ram_bss_end__+0x2>
   43a48:	973e                	add	a4,a4,a5
   43a4a:	00070023          	sb	zero,0(a4)
   43a4e:	bd81                	j	4389e <c_startup+0x238>
   43a50:	00275693          	srl	a3,a4,0x2
   43a54:	00377613          	and	a2,a4,3
   43a58:	ca81                	beqz	a3,43a68 <c_startup+0x402>
   43a5a:	20b6c6b3          	sh2add	a3,a3,a1
   43a5e:	0007a023          	sw	zero,0(a5)
   43a62:	0791                	add	a5,a5,4
   43a64:	fed79de3          	bne	a5,a3,43a5e <c_startup+0x3f8>
   43a68:	9b79                	and	a4,a4,-2
   43a6a:	9b75                	and	a4,a4,-3
   43a6c:	d60609e3          	beqz	a2,437de <c_startup+0x178>
   43a70:	00e587b3          	add	a5,a1,a4
   43a74:	00078023          	sb	zero,0(a5)
   43a78:	4785                	li	a5,1
   43a7a:	d6f602e3          	beq	a2,a5,437de <c_startup+0x178>
   43a7e:	012c07b7          	lui	a5,0x12c0
   43a82:	00178793          	add	a5,a5,1 # 12c0001 <__noncacheable_bss_end__+0x1>
   43a86:	97ba                	add	a5,a5,a4
   43a88:	00078023          	sb	zero,0(a5)
   43a8c:	478d                	li	a5,3
   43a8e:	d4f618e3          	bne	a2,a5,437de <c_startup+0x178>
   43a92:	012c07b7          	lui	a5,0x12c0
   43a96:	00278793          	add	a5,a5,2 # 12c0002 <__noncacheable_bss_end__+0x2>
   43a9a:	973e                	add	a4,a4,a5
   43a9c:	00070023          	sb	zero,0(a4)
   43aa0:	bb3d                	j	437de <c_startup+0x178>
   43aa2:	00275693          	srl	a3,a4,0x2
   43aa6:	00377613          	and	a2,a4,3
   43aaa:	ca81                	beqz	a3,43aba <c_startup+0x454>
   43aac:	20b6c6b3          	sh2add	a3,a3,a1
   43ab0:	0007a023          	sw	zero,0(a5)
   43ab4:	0791                	add	a5,a5,4
   43ab6:	fed79de3          	bne	a5,a3,43ab0 <c_startup+0x44a>
   43aba:	9b79                	and	a4,a4,-2
   43abc:	9b75                	and	a4,a4,-3
   43abe:	c60600e3          	beqz	a2,4371e <c_startup+0xb8>
   43ac2:	00e587b3          	add	a5,a1,a4
   43ac6:	00078023          	sb	zero,0(a5)
   43aca:	4785                	li	a5,1
   43acc:	c4f609e3          	beq	a2,a5,4371e <c_startup+0xb8>
   43ad0:	9d918793          	add	a5,gp,-1575 # 12d01d9 <core1_thread_stack+0x1>
   43ad4:	97ba                	add	a5,a5,a4
   43ad6:	00078023          	sb	zero,0(a5)
   43ada:	478d                	li	a5,3
   43adc:	c4f611e3          	bne	a2,a5,4371e <c_startup+0xb8>
   43ae0:	9da18793          	add	a5,gp,-1574 # 12d01da <core1_thread_stack+0x2>
   43ae4:	973e                	add	a4,a4,a5
   43ae6:	00070023          	sb	zero,0(a4)
   43aea:	b915                	j	4371e <c_startup+0xb8>
   43aec:	0025d513          	srl	a0,a1,0x2
   43af0:	0035f893          	and	a7,a1,3
   43af4:	cd01                	beqz	a0,43b0c <c_startup+0x4a6>
   43af6:	4a868713          	add	a4,a3,1192
   43afa:	21054533          	sh2add	a0,a0,a6
   43afe:	4314                	lw	a3,0(a4)
   43b00:	0711                	add	a4,a4,4
   43b02:	0791                	add	a5,a5,4
   43b04:	fed7ae23          	sw	a3,-4(a5)
   43b08:	fee51be3          	bne	a0,a4,43afe <c_startup+0x498>
   43b0c:	ffe5f713          	and	a4,a1,-2
   43b10:	9b75                	and	a4,a4,-3
   43b12:	dc0888e3          	beqz	a7,438e2 <c_startup+0x27c>
   43b16:	00e807b3          	add	a5,a6,a4
   43b1a:	963a                	add	a2,a2,a4
   43b1c:	982e                	add	a6,a6,a1
   43b1e:	0007c703          	lbu	a4,0(a5)
   43b22:	0785                	add	a5,a5,1
   43b24:	0605                	add	a2,a2,1 # 240001 <__fast_ram_bss_end__+0x1>
   43b26:	fee60fa3          	sb	a4,-1(a2)
   43b2a:	fef81ae3          	bne	a6,a5,43b1e <c_startup+0x4b8>
   43b2e:	bb55                	j	438e2 <c_startup+0x27c>
   43b30:	0025d513          	srl	a0,a1,0x2
   43b34:	0035f893          	and	a7,a1,3
   43b38:	cd01                	beqz	a0,43b50 <c_startup+0x4ea>
   43b3a:	68068713          	add	a4,a3,1664
   43b3e:	21054533          	sh2add	a0,a0,a6
   43b42:	4314                	lw	a3,0(a4)
   43b44:	0711                	add	a4,a4,4
   43b46:	0791                	add	a5,a5,4
   43b48:	fed7ae23          	sw	a3,-4(a5)
   43b4c:	fee51be3          	bne	a0,a4,43b42 <c_startup+0x4dc>
   43b50:	ffe5f713          	and	a4,a1,-2
   43b54:	9b75                	and	a4,a4,-3
   43b56:	ea0883e3          	beqz	a7,439fc <c_startup+0x396>
   43b5a:	00e807b3          	add	a5,a6,a4
   43b5e:	963a                	add	a2,a2,a4
   43b60:	982e                	add	a6,a6,a1
   43b62:	0007c703          	lbu	a4,0(a5)
   43b66:	0785                	add	a5,a5,1
   43b68:	0605                	add	a2,a2,1
   43b6a:	fee60fa3          	sb	a4,-1(a2)
   43b6e:	fef81ae3          	bne	a6,a5,43b62 <c_startup+0x4fc>
   43b72:	8082                	ret
   43b74:	0025d513          	srl	a0,a1,0x2
   43b78:	0035f893          	and	a7,a1,3
   43b7c:	cd01                	beqz	a0,43b94 <c_startup+0x52e>
   43b7e:	68068713          	add	a4,a3,1664
   43b82:	21054533          	sh2add	a0,a0,a6
   43b86:	4314                	lw	a3,0(a4)
   43b88:	0711                	add	a4,a4,4
   43b8a:	0791                	add	a5,a5,4
   43b8c:	fed7ae23          	sw	a3,-4(a5)
   43b90:	fea71be3          	bne	a4,a0,43b86 <c_startup+0x520>
   43b94:	ffe5f713          	and	a4,a1,-2
   43b98:	9b75                	and	a4,a4,-3
   43b9a:	e0088ce3          	beqz	a7,439b2 <c_startup+0x34c>
   43b9e:	00e807b3          	add	a5,a6,a4
   43ba2:	963a                	add	a2,a2,a4
   43ba4:	982e                	add	a6,a6,a1
   43ba6:	0007c703          	lbu	a4,0(a5)
   43baa:	0785                	add	a5,a5,1
   43bac:	0605                	add	a2,a2,1
   43bae:	fee60fa3          	sb	a4,-1(a2)
   43bb2:	ff079ae3          	bne	a5,a6,43ba6 <c_startup+0x540>
   43bb6:	bbf5                	j	439b2 <c_startup+0x34c>
   43bb8:	0025d513          	srl	a0,a1,0x2
   43bbc:	0035f893          	and	a7,a1,3
   43bc0:	cd01                	beqz	a0,43bd8 <c_startup+0x572>
   43bc2:	68068713          	add	a4,a3,1664
   43bc6:	21054533          	sh2add	a0,a0,a6
   43bca:	4314                	lw	a3,0(a4)
   43bcc:	0711                	add	a4,a4,4
   43bce:	0791                	add	a5,a5,4
   43bd0:	fed7ae23          	sw	a3,-4(a5)
   43bd4:	fea71be3          	bne	a4,a0,43bca <c_startup+0x564>
   43bd8:	ffe5f713          	and	a4,a1,-2
   43bdc:	9b75                	and	a4,a4,-3
   43bde:	d80886e3          	beqz	a7,4396a <c_startup+0x304>
   43be2:	00e807b3          	add	a5,a6,a4
   43be6:	963a                	add	a2,a2,a4
   43be8:	982e                	add	a6,a6,a1
   43bea:	0007c703          	lbu	a4,0(a5)
   43bee:	0785                	add	a5,a5,1
   43bf0:	0605                	add	a2,a2,1
   43bf2:	fee60fa3          	sb	a4,-1(a2)
   43bf6:	fef81ae3          	bne	a6,a5,43bea <c_startup+0x584>
   43bfa:	bb85                	j	4396a <c_startup+0x304>
   43bfc:	0025d513          	srl	a0,a1,0x2
   43c00:	0035f893          	and	a7,a1,3
   43c04:	cd01                	beqz	a0,43c1c <c_startup+0x5b6>
   43c06:	68068713          	add	a4,a3,1664
   43c0a:	21054533          	sh2add	a0,a0,a6
   43c0e:	4314                	lw	a3,0(a4)
   43c10:	0711                	add	a4,a4,4
   43c12:	0791                	add	a5,a5,4
   43c14:	fed7ae23          	sw	a3,-4(a5)
   43c18:	fea71be3          	bne	a4,a0,43c0e <c_startup+0x5a8>
   43c1c:	ffe5f713          	and	a4,a1,-2
   43c20:	9b75                	and	a4,a4,-3
   43c22:	d00884e3          	beqz	a7,4392a <c_startup+0x2c4>
   43c26:	00e807b3          	add	a5,a6,a4
   43c2a:	963a                	add	a2,a2,a4
   43c2c:	982e                	add	a6,a6,a1
   43c2e:	0007c703          	lbu	a4,0(a5)
   43c32:	0785                	add	a5,a5,1
   43c34:	0605                	add	a2,a2,1
   43c36:	fee60fa3          	sb	a4,-1(a2)
   43c3a:	fef81ae3          	bne	a6,a5,43c2e <c_startup+0x5c8>
   43c3e:	b1f5                	j	4392a <c_startup+0x2c4>
   43c40:	8082                	ret
   43c42:	4681                	li	a3,0
   43c44:	b131                	j	43850 <c_startup+0x1ea>
   43c46:	4681                	li	a3,0
   43c48:	b6a1                	j	43790 <c_startup+0x12a>
   43c4a:	4681                	li	a3,0
   43c4c:	b451                	j	436d0 <c_startup+0x6a>

00043c4e <reset_handler>:
   43c4e:	1141                	add	sp,sp,-16
   43c50:	c606                	sw	ra,12(sp)
   43c52:	0000100f          	fence.i
   43c56:	2a1d                	jal	43d8c <system_init>
   43c58:	40b2                	lw	ra,12(sp)
   43c5a:	0141                	add	sp,sp,16
   43c5c:	b281                	j	4359c <main>

00043c5e <_init>:
   43c5e:	8082                	ret

00043c60 <syscall_handler>:
   43c60:	8082                	ret

00043c62 <mchtmr_isr>:
   43c62:	8082                	ret

00043c64 <swi_isr>:
   43c64:	8082                	ret

00043c66 <exception_handler>:
   43c66:	852e                	mv	a0,a1
   43c68:	8082                	ret

00043c6a <exception_s_handler>:
   43c6a:	852e                	mv	a0,a1
   43c6c:	8082                	ret

00043c6e <swi_s_isr>:
   43c6e:	8082                	ret

00043c70 <mchtmr_s_isr>:
   43c70:	8082                	ret

00043c72 <_tx_initialize_low_level>:
   43c72:	1141                	add	sp,sp,-16
   43c74:	c606                	sw	ra,12(sp)
   43c76:	cb7fc0ef          	jal	4092c <__disable_interrupt>
   43c7a:	4a21a623          	sw	sp,1196(gp) # 12d0cac <_tx_thread_system_stack_ptr>
   43c7e:	40b2                	lw	ra,12(sp)
   43c80:	577d                	li	a4,-1
   43c82:	44e1a823          	sw	a4,1104(gp) # 12d0c50 <_tx_initialize_unused_memory>
   43c86:	0141                	add	sp,sp,16
   43c88:	5eb0006f          	j	44a72 <tx_cpu_ts_setup>

00043c8c <l1c_dc_enable>:
   43c8c:	7ca027f3          	csrr	a5,0x7ca
   43c90:	8b89                	and	a5,a5,2
   43c92:	eb81                	bnez	a5,43ca2 <l1c_dc_enable+0x16>
   43c94:	6799                	lui	a5,0x6
   43c96:	7ca7a073          	csrs	0x7ca,a5
   43c9a:	40200793          	li	a5,1026
   43c9e:	7ca7a073          	csrs	0x7ca,a5
   43ca2:	8082                	ret

00043ca4 <l1c_ic_enable>:
   43ca4:	7ca027f3          	csrr	a5,0x7ca
   43ca8:	8b85                	and	a5,a5,1
   43caa:	e789                	bnez	a5,43cb4 <l1c_ic_enable+0x10>
   43cac:	30100793          	li	a5,769
   43cb0:	7ca7a073          	csrs	0x7ca,a5
   43cb4:	8082                	ret

00043cb6 <l1c_dc_invalidate_all>:
   43cb6:	47dd                	li	a5,23
   43cb8:	7cc79073          	csrw	0x7cc,a5
   43cbc:	8082                	ret

00043cbe <board_init_core1>:
   43cbe:	716d                	add	sp,sp,-272
   43cc0:	10112623          	sw	ra,268(sp)
   43cc4:	26f9                	jal	44092 <clock_update_core_clock>
   43cc6:	012c0537          	lui	a0,0x12c0
   43cca:	f018c7b7          	lui	a5,0xf018c
   43cce:	02c50513          	add	a0,a0,44 # 12c002c <__noncacheable_bss_end__+0x2c>
   43cd2:	c23e                	sw	a5,4(sp)
   43cd4:	c002                	sw	zero,0(sp)
   43cd6:	22e5                	jal	43ebe <clock_get_frequency>
   43cd8:	001e87b7          	lui	a5,0x1e8
   43cdc:	872a                	mv	a4,a0
   43cde:	48078793          	add	a5,a5,1152 # 1e8480 <__fast_load_addr__+0x19ce00>
   43ce2:	850a                	mv	a0,sp
   43ce4:	c43a                	sw	a4,8(sp)
   43ce6:	c63e                	sw	a5,12(sp)
   43ce8:	475000ef          	jal	4495c <console_init>
   43cec:	e141                	bnez	a0,43d6c <board_init_core1+0xae>
   43cee:	10000613          	li	a2,256
   43cf2:	4581                	li	a1,0
   43cf4:	850a                	mv	a0,sp
   43cf6:	9aeff0ef          	jal	42ea4 <memset>
   43cfa:	56fd                	li	a3,-1
   43cfc:	467d                	li	a2,31
   43cfe:	012c07b7          	lui	a5,0x12c0
   43d02:	012d0737          	lui	a4,0x12d0
   43d06:	00078793          	mv	a5,a5
   43d0a:	00070713          	mv	a4,a4
   43d0e:	c236                	sw	a3,4(sp)
   43d10:	00c10023          	sb	a2,0(sp)
   43d14:	40f706b3          	sub	a3,a4,a5
   43d18:	04f71b63          	bne	a4,a5,43d6e <board_init_core1+0xb0>
   43d1c:	4585                	li	a1,1
   43d1e:	4509                	li	a0,2
   43d20:	4705                	li	a4,1
   43d22:	012fc7b7          	lui	a5,0x12fc
   43d26:	013006b7          	lui	a3,0x1300
   43d2a:	00078793          	mv	a5,a5
   43d2e:	00068693          	mv	a3,a3
   43d32:	40f68633          	sub	a2,a3,a5
   43d36:	02f68563          	beq	a3,a5,43d60 <board_init_core1+0xa2>
   43d3a:	17fd                	add	a5,a5,-1 # 12fbfff <__bss_end__+0x2b30f>
   43d3c:	8205                	srl	a2,a2,0x1
   43d3e:	0712                	sll	a4,a4,0x4
   43d40:	97b2                	add	a5,a5,a2
   43d42:	10070713          	add	a4,a4,256 # 12d0100 <__global_locale+0xa0>
   43d46:	970a                	add	a4,a4,sp
   43d48:	8389                	srl	a5,a5,0x2
   43d4a:	f0f72223          	sw	a5,-252(a4)
   43d4e:	46fd                	li	a3,31
   43d50:	f0f72623          	sw	a5,-244(a4)
   43d54:	47bd                	li	a5,15
   43d56:	f0d70023          	sb	a3,-256(a4)
   43d5a:	f0f70423          	sb	a5,-248(a4)
   43d5e:	85aa                	mv	a1,a0
   43d60:	850a                	mv	a0,sp
   43d62:	279d                	jal	444c8 <pmp_config>
   43d64:	10c12083          	lw	ra,268(sp)
   43d68:	6151                	add	sp,sp,272
   43d6a:	8082                	ret
   43d6c:	a001                	j	43d6c <board_init_core1+0xae>
   43d6e:	17fd                	add	a5,a5,-1
   43d70:	8285                	srl	a3,a3,0x1
   43d72:	97b6                	add	a5,a5,a3
   43d74:	8389                	srl	a5,a5,0x2
   43d76:	ca3e                	sw	a5,20(sp)
   43d78:	ce3e                	sw	a5,28(sp)
   43d7a:	47bd                	li	a5,15
   43d7c:	00c10823          	sb	a2,16(sp)
   43d80:	00f10c23          	sb	a5,24(sp)
   43d84:	4589                	li	a1,2
   43d86:	450d                	li	a0,3
   43d88:	4709                	li	a4,2
   43d8a:	bf61                	j	43d22 <board_init_core1+0x64>

00043d8c <system_init>:
   43d8c:	1141                	add	sp,sp,-16
   43d8e:	306027f3          	csrr	a5,mcounteren
   43d92:	0017e793          	or	a5,a5,1
   43d96:	30679073          	csrw	mcounteren,a5
   43d9a:	47a1                	li	a5,8
   43d9c:	c602                	sw	zero,12(sp)
   43d9e:	3007b7f3          	csrrc	a5,mstatus,a5
   43da2:	c63e                	sw	a5,12(sp)
   43da4:	47b2                	lw	a5,12(sp)
   43da6:	28b01793          	bset	a5,zero,0xb
   43daa:	3047b073          	csrc	mie,a5
   43dae:	e4000737          	lui	a4,0xe4000
   43db2:	4685                	li	a3,1
   43db4:	c314                	sw	a3,0(a4)
   43db6:	3047a073          	csrs	mie,a5
   43dba:	0141                	add	sp,sp,16
   43dbc:	8082                	ret

00043dbe <sysctl_enable_group_resource>:
   43dbe:	0ff00793          	li	a5,255
   43dc2:	00c7fb63          	bgeu	a5,a2,43dd8 <sysctl_enable_group_resource+0x1a>
   43dc6:	f0060793          	add	a5,a2,-256
   43dca:	8395                	srl	a5,a5,0x5
   43dcc:	01f67713          	and	a4,a2,31
   43dd0:	c99d                	beqz	a1,43e06 <sysctl_enable_group_resource+0x48>
   43dd2:	4805                	li	a6,1
   43dd4:	01058463          	beq	a1,a6,43ddc <sysctl_enable_group_resource+0x1e>
   43dd8:	4509                	li	a0,2
   43dda:	8082                	ret
   43ddc:	0792                	sll	a5,a5,0x4
   43dde:	6585                	lui	a1,0x1
   43de0:	97aa                	add	a5,a5,a0
   43de2:	97ae                	add	a5,a5,a1
   43de4:	8407a583          	lw	a1,-1984(a5)
   43de8:	28e01733          	bset	a4,zero,a4
   43dec:	caa1                	beqz	a3,43e3c <sysctl_enable_group_resource+0x7e>
   43dee:	8dd9                	or	a1,a1,a4
   43df0:	84b7a023          	sw	a1,-1984(a5)
   43df4:	20a64633          	sh2add	a2,a2,a0
   43df8:	421c                	lw	a5,0(a2)
   43dfa:	00179713          	sll	a4,a5,0x1
   43dfe:	fe074de3          	bltz	a4,43df8 <sysctl_enable_group_resource+0x3a>
   43e02:	4501                	li	a0,0
   43e04:	8082                	ret
   43e06:	0792                	sll	a5,a5,0x4
   43e08:	6585                	lui	a1,0x1
   43e0a:	97aa                	add	a5,a5,a0
   43e0c:	97ae                	add	a5,a5,a1
   43e0e:	8007a583          	lw	a1,-2048(a5)
   43e12:	28e01733          	bset	a4,zero,a4
   43e16:	ce89                	beqz	a3,43e30 <sysctl_enable_group_resource+0x72>
   43e18:	8dd9                	or	a1,a1,a4
   43e1a:	80b7a023          	sw	a1,-2048(a5)
   43e1e:	20a64633          	sh2add	a2,a2,a0
   43e22:	421c                	lw	a5,0(a2)
   43e24:	00179713          	sll	a4,a5,0x1
   43e28:	fe074de3          	bltz	a4,43e22 <sysctl_enable_group_resource+0x64>
   43e2c:	4501                	li	a0,0
   43e2e:	8082                	ret
   43e30:	40e5f733          	andn	a4,a1,a4
   43e34:	80e7a023          	sw	a4,-2048(a5)
   43e38:	4501                	li	a0,0
   43e3a:	8082                	ret
   43e3c:	40e5f733          	andn	a4,a1,a4
   43e40:	84e7a023          	sw	a4,-1984(a5)
   43e44:	bfd5                	j	43e38 <sysctl_enable_group_resource+0x7a>

00043e46 <get_frequency_for_source>:
   43e46:	479d                	li	a5,7
   43e48:	06a7e963          	bltu	a5,a0,43eba <get_frequency_for_source+0x74>
   43e4c:	0004b7b7          	lui	a5,0x4b
   43e50:	f4078793          	add	a5,a5,-192 # 4af40 <__clz_tab+0x48c>
   43e54:	20f54533          	sh2add	a0,a0,a5
   43e58:	411c                	lw	a5,0(a0)
   43e5a:	8782                	jr	a5
   43e5c:	016e3537          	lui	a0,0x16e3
   43e60:	60050513          	add	a0,a0,1536 # 16e3600 <__share_mem_end__+0x3e3600>
   43e64:	8082                	ret
   43e66:	4601                	li	a2,0
   43e68:	4581                	li	a1,0
   43e6a:	f40c0537          	lui	a0,0xf40c0
   43e6e:	1c10006f          	j	4482e <pllctlv2_get_pll_postdiv_freq_in_hz>
   43e72:	4605                	li	a2,1
   43e74:	4581                	li	a1,0
   43e76:	f40c0537          	lui	a0,0xf40c0
   43e7a:	1b50006f          	j	4482e <pllctlv2_get_pll_postdiv_freq_in_hz>
   43e7e:	4601                	li	a2,0
   43e80:	4585                	li	a1,1
   43e82:	f40c0537          	lui	a0,0xf40c0
   43e86:	1a90006f          	j	4482e <pllctlv2_get_pll_postdiv_freq_in_hz>
   43e8a:	4605                	li	a2,1
   43e8c:	4585                	li	a1,1
   43e8e:	f40c0537          	lui	a0,0xf40c0
   43e92:	19d0006f          	j	4482e <pllctlv2_get_pll_postdiv_freq_in_hz>
   43e96:	4609                	li	a2,2
   43e98:	4585                	li	a1,1
   43e9a:	f40c0537          	lui	a0,0xf40c0
   43e9e:	1910006f          	j	4482e <pllctlv2_get_pll_postdiv_freq_in_hz>
   43ea2:	4601                	li	a2,0
   43ea4:	4589                	li	a1,2
   43ea6:	f40c0537          	lui	a0,0xf40c0
   43eaa:	1850006f          	j	4482e <pllctlv2_get_pll_postdiv_freq_in_hz>
   43eae:	4605                	li	a2,1
   43eb0:	4589                	li	a1,2
   43eb2:	f40c0537          	lui	a0,0xf40c0
   43eb6:	1790006f          	j	4482e <pllctlv2_get_pll_postdiv_freq_in_hz>
   43eba:	4501                	li	a0,0
   43ebc:	8082                	ret

00043ebe <clock_get_frequency>:
   43ebe:	872a                	mv	a4,a0
   43ec0:	8121                	srl	a0,a0,0x8
   43ec2:	0ff57513          	zext.b	a0,a0
   43ec6:	47b5                	li	a5,13
   43ec8:	1aa7e663          	bltu	a5,a0,44074 <clock_get_frequency+0x1b6>
   43ecc:	0004b7b7          	lui	a5,0x4b
   43ed0:	f6078793          	add	a5,a5,-160 # 4af60 <__clz_tab+0x4ac>
   43ed4:	20f547b3          	sh2add	a5,a0,a5
   43ed8:	439c                	lw	a5,0(a5)
   43eda:	1141                	add	sp,sp,-16
   43edc:	c606                	sw	ra,12(sp)
   43ede:	0ff77693          	zext.b	a3,a4
   43ee2:	8782                	jr	a5
   43ee4:	0004b7b7          	lui	a5,0x4b
   43ee8:	f9878793          	add	a5,a5,-104 # 4af98 <s_wdgs>
   43eec:	20f6c7b3          	sh2add	a5,a3,a5
   43ef0:	439c                	lw	a5,0(a5)
   43ef2:	6521                	lui	a0,0x8
   43ef4:	439c                	lw	a5,0(a5)
   43ef6:	00279713          	sll	a4,a5,0x2
   43efa:	02074263          	bltz	a4,43f1e <clock_get_frequency+0x60>
   43efe:	f40027b7          	lui	a5,0xf4002
   43f02:	c422                	sw	s0,8(sp)
   43f04:	8107a403          	lw	s0,-2032(a5) # f4001810 <__share_mem_end__+0xf2d01810>
   43f08:	8107a503          	lw	a0,-2032(a5)
   43f0c:	8121                	srl	a0,a0,0x8
   43f0e:	891d                	and	a0,a0,7
   43f10:	0ff47413          	zext.b	s0,s0
   43f14:	3f0d                	jal	43e46 <get_frequency_for_source>
   43f16:	0405                	add	s0,s0,1
   43f18:	02855533          	divu	a0,a0,s0
   43f1c:	4422                	lw	s0,8(sp)
   43f1e:	40b2                	lw	ra,12(sp)
   43f20:	0141                	add	sp,sp,16
   43f22:	8082                	ret
   43f24:	016e3537          	lui	a0,0x16e3
   43f28:	60050513          	add	a0,a0,1536 # 16e3600 <__share_mem_end__+0x3e3600>
   43f2c:	bfcd                	j	43f1e <clock_get_frequency+0x60>
   43f2e:	f41287b7          	lui	a5,0xf4128
   43f32:	439c                	lw	a5,0(a5)
   43f34:	016e3537          	lui	a0,0x16e3
   43f38:	60050513          	add	a0,a0,1536 # 16e3600 <__share_mem_end__+0x3e3600>
   43f3c:	00279713          	sll	a4,a5,0x2
   43f40:	fc075fe3          	bgez	a4,43f1e <clock_get_frequency+0x60>
   43f44:	6521                	lui	a0,0x8
   43f46:	bfe1                	j	43f1e <clock_get_frequency+0x60>
   43f48:	f40027b7          	lui	a5,0xf4002
   43f4c:	c422                	sw	s0,8(sp)
   43f4e:	8187a403          	lw	s0,-2024(a5) # f4001818 <__share_mem_end__+0xf2d01818>
   43f52:	8187a503          	lw	a0,-2024(a5)
   43f56:	bf5d                	j	43f0c <clock_get_frequency+0x4e>
   43f58:	f40027b7          	lui	a5,0xf4002
   43f5c:	c422                	sw	s0,8(sp)
   43f5e:	81c7a403          	lw	s0,-2020(a5) # f400181c <__share_mem_end__+0xf2d0181c>
   43f62:	81c7a503          	lw	a0,-2020(a5)
   43f66:	b75d                	j	43f0c <clock_get_frequency+0x4e>
   43f68:	f40027b7          	lui	a5,0xf4002
   43f6c:	c422                	sw	s0,8(sp)
   43f6e:	8207a403          	lw	s0,-2016(a5) # f4001820 <__share_mem_end__+0xf2d01820>
   43f72:	8207a503          	lw	a0,-2016(a5)
   43f76:	bf59                	j	43f0c <clock_get_frequency+0x4e>
   43f78:	c422                	sw	s0,8(sp)
   43f7a:	f40027b7          	lui	a5,0xf4002
   43f7e:	8007a403          	lw	s0,-2048(a5) # f4001800 <__share_mem_end__+0xf2d01800>
   43f82:	8007a503          	lw	a0,-2048(a5)
   43f86:	b759                	j	43f0c <clock_get_frequency+0x4e>
   43f88:	f40027b7          	lui	a5,0xf4002
   43f8c:	c422                	sw	s0,8(sp)
   43f8e:	8147a403          	lw	s0,-2028(a5) # f4001814 <__share_mem_end__+0xf2d01814>
   43f92:	8147a503          	lw	a0,-2028(a5)
   43f96:	bf9d                	j	43f0c <clock_get_frequency+0x4e>
   43f98:	04e00793          	li	a5,78
   43f9c:	f8d7e1e3          	bltu	a5,a3,43f1e <clock_get_frequency+0x60>
   43fa0:	f4000737          	lui	a4,0xf4000
   43fa4:	c422                	sw	s0,8(sp)
   43fa6:	20e6c7b3          	sh2add	a5,a3,a4
   43faa:	a879                	j	44048 <clock_get_frequency+0x18a>
   43fac:	0fc77513          	and	a0,a4,252
   43fb0:	e15d                	bnez	a0,44056 <clock_get_frequency+0x198>
   43fb2:	f4000637          	lui	a2,0xf4000
   43fb6:	70068793          	add	a5,a3,1792 # 1300700 <__share_mem_end__+0x700>
   43fba:	20c7c7b3          	sh2add	a5,a5,a2
   43fbe:	4398                	lw	a4,0(a5)
   43fc0:	0004b7b7          	lui	a5,0x4b
   43fc4:	3e078793          	add	a5,a5,992 # 4b3e0 <s_adc_clk_mux_node>
   43fc8:	48875713          	bext	a4,a4,0x8
   43fcc:	20f74733          	sh2add	a4,a4,a5
   43fd0:	431c                	lw	a5,0(a4)
   43fd2:	4711                	li	a4,4
   43fd4:	08e78863          	beq	a5,a4,44064 <clock_get_frequency+0x1a6>
   43fd8:	97b6                	add	a5,a5,a3
   43fda:	0ff7f793          	zext.b	a5,a5
   43fde:	04e00713          	li	a4,78
   43fe2:	f2f76ee3          	bltu	a4,a5,43f1e <clock_get_frequency+0x60>
   43fe6:	6709                	lui	a4,0x2
   43fe8:	20c7c7b3          	sh2add	a5,a5,a2
   43fec:	97ba                	add	a5,a5,a4
   43fee:	c422                	sw	s0,8(sp)
   43ff0:	8007a403          	lw	s0,-2048(a5)
   43ff4:	8007a503          	lw	a0,-2048(a5)
   43ff8:	8121                	srl	a0,a0,0x8
   43ffa:	891d                	and	a0,a0,7
   43ffc:	35a9                	jal	43e46 <get_frequency_for_source>
   43ffe:	0ff47793          	zext.b	a5,s0
   44002:	0785                	add	a5,a5,1
   44004:	02f55533          	divu	a0,a0,a5
   44008:	4422                	lw	s0,8(sp)
   4400a:	bf11                	j	43f1e <clock_get_frequency+0x60>
   4400c:	f40027b7          	lui	a5,0xf4002
   44010:	c422                	sw	s0,8(sp)
   44012:	8087a403          	lw	s0,-2040(a5) # f4001808 <__share_mem_end__+0xf2d01808>
   44016:	8087a503          	lw	a0,-2040(a5)
   4401a:	bdcd                	j	43f0c <clock_get_frequency+0x4e>
   4401c:	0fe77713          	and	a4,a4,254
   44020:	4501                	li	a0,0
   44022:	ee071ee3          	bnez	a4,43f1e <clock_get_frequency+0x60>
   44026:	f40007b7          	lui	a5,0xf4000
   4402a:	70468713          	add	a4,a3,1796
   4402e:	20f74733          	sh2add	a4,a4,a5
   44032:	431c                	lw	a5,0(a4)
   44034:	c422                	sw	s0,8(sp)
   44036:	1007f793          	and	a5,a5,256
   4403a:	e385                	bnez	a5,4405a <clock_get_frequency+0x19c>
   4403c:	03568793          	add	a5,a3,53
   44040:	f4000737          	lui	a4,0xf4000
   44044:	20e7c7b3          	sh2add	a5,a5,a4
   44048:	6709                	lui	a4,0x2
   4404a:	97ba                	add	a5,a5,a4
   4404c:	bf0d                	j	43f7e <clock_get_frequency+0xc0>
   4404e:	40b2                	lw	ra,12(sp)
   44050:	8536                	mv	a0,a3
   44052:	0141                	add	sp,sp,16
   44054:	bbcd                	j	43e46 <get_frequency_for_source>
   44056:	4501                	li	a0,0
   44058:	b5d9                	j	43f1e <clock_get_frequency+0x60>
   4405a:	0016b793          	seqz	a5,a3
   4405e:	03578793          	add	a5,a5,53 # f4000035 <__share_mem_end__+0xf2d00035>
   44062:	bff9                	j	44040 <clock_get_frequency+0x182>
   44064:	f40027b7          	lui	a5,0xf4002
   44068:	c422                	sw	s0,8(sp)
   4406a:	8107a403          	lw	s0,-2032(a5) # f4001810 <__share_mem_end__+0xf2d01810>
   4406e:	8107a503          	lw	a0,-2032(a5)
   44072:	b759                	j	43ff8 <clock_get_frequency+0x13a>
   44074:	4501                	li	a0,0
   44076:	8082                	ret

00044078 <clock_add_to_group>:
   44078:	01055613          	srl	a2,a0,0x10
   4407c:	17b00793          	li	a5,379
   44080:	00c7f363          	bgeu	a5,a2,44086 <clock_add_to_group+0xe>
   44084:	8082                	ret
   44086:	4685                	li	a3,1
   44088:	0ff5f593          	zext.b	a1,a1
   4408c:	f4000537          	lui	a0,0xf4000
   44090:	b33d                	j	43dbe <sysctl_enable_group_resource>

00044092 <clock_update_core_clock>:
   44092:	1141                	add	sp,sp,-16
   44094:	c606                	sw	ra,12(sp)
   44096:	f1402773          	csrr	a4,mhartid
   4409a:	00080537          	lui	a0,0x80
   4409e:	4785                	li	a5,1
   440a0:	0509                	add	a0,a0,2 # 80002 <__fast_load_addr__+0x34982>
   440a2:	00f70363          	beq	a4,a5,440a8 <clock_update_core_clock+0x16>
   440a6:	4501                	li	a0,0
   440a8:	3d19                	jal	43ebe <clock_get_frequency>
   440aa:	40b2                	lw	ra,12(sp)
   440ac:	44a1a223          	sw	a0,1092(gp) # 12d0c44 <hpm_core_clock>
   440b0:	0141                	add	sp,sp,16
   440b2:	8082                	ret

000440b4 <uart_default_config>:
   440b4:	1f0007b7          	lui	a5,0x1f000
   440b8:	30078793          	add	a5,a5,768 # 1f000300 <__share_mem_end__+0x1dd00300>
   440bc:	6771                	lui	a4,0x1c
   440be:	c59c                	sw	a5,8(a1)
   440c0:	67c1                	lui	a5,0x10
   440c2:	46a9                	li	a3,10
   440c4:	20070713          	add	a4,a4,512 # 1c200 <_noncacheable_size+0xc200>
   440c8:	c5dc                	sw	a5,12(a1)
   440ca:	4785                	li	a5,1
   440cc:	c1d8                	sw	a4,4(a1)
   440ce:	00059823          	sh	zero,16(a1) # 1010 <RISCV_MEIE_MTIE+0x790>
   440d2:	00059a23          	sh	zero,20(a1)
   440d6:	0005ac23          	sw	zero,24(a1)
   440da:	00d58e23          	sb	a3,28(a1)
   440de:	02059023          	sh	zero,32(a1)
   440e2:	0205a223          	sw	zero,36(a1)
   440e6:	02d58423          	sb	a3,40(a1)
   440ea:	02f58623          	sb	a5,44(a1)
   440ee:	8082                	ret

000440f0 <uart_init>:
   440f0:	02052223          	sw	zero,36(a0)
   440f4:	555c                	lw	a5,44(a0)
   440f6:	4198                	lw	a4,0(a1)
   440f8:	0807e793          	or	a5,a5,128
   440fc:	d55c                	sw	a5,44(a0)
   440fe:	12070663          	beqz	a4,4422a <uart_init+0x13a>
   44102:	41d0                	lw	a2,4(a1)
   44104:	7139                	add	sp,sp,-64
   44106:	dc22                	sw	s0,56(sp)
   44108:	da26                	sw	s1,52(sp)
   4410a:	de06                	sw	ra,60(sp)
   4410c:	0c700793          	li	a5,199
   44110:	842a                	mv	s0,a0
   44112:	84ae                	mv	s1,a1
   44114:	3e900513          	li	a0,1001
   44118:	00c7e763          	bltu	a5,a2,44126 <uart_init+0x36>
   4411c:	50f2                	lw	ra,60(sp)
   4411e:	5462                	lw	s0,56(sp)
   44120:	54d2                	lw	s1,52(sp)
   44122:	6121                	add	sp,sp,64
   44124:	8082                	ret
   44126:	00361793          	sll	a5,a2,0x3
   4412a:	fef769e3          	bltu	a4,a5,4411c <uart_init+0x2c>
   4412e:	67c1                	lui	a5,0x10
   44130:	17fd                	add	a5,a5,-1 # ffff <__fw_size__+0x4d27>
   44132:	02f757b3          	divu	a5,a4,a5
   44136:	00561693          	sll	a3,a2,0x5
   4413a:	fef6e1e3          	bltu	a3,a5,4411c <uart_init+0x2c>
   4413e:	3e800513          	li	a0,1000
   44142:	02a735b3          	mulhu	a1,a4,a0
   44146:	d84a                	sw	s2,48(sp)
   44148:	4681                	li	a3,0
   4414a:	6905                	lui	s2,0x1
   4414c:	d64e                	sw	s3,44(sp)
   4414e:	d452                	sw	s4,40(sp)
   44150:	d256                	sw	s5,36(sp)
   44152:	d05a                	sw	s6,32(sp)
   44154:	ce5e                	sw	s7,28(sp)
   44156:	cc62                	sw	s8,24(sp)
   44158:	02a70533          	mul	a0,a4,a0
   4415c:	c86a                	sw	s10,16(sp)
   4415e:	c66e                	sw	s11,12(sp)
   44160:	ca66                	sw	s9,20(sp)
   44162:	fa090913          	add	s2,s2,-96 # fa0 <RISCV_MEIE_MTIE+0x720>
   44166:	6d89                	lui	s11,0x2
   44168:	6bc1                	lui	s7,0x10
   4416a:	f40d8d93          	add	s11,s11,-192 # 1f40 <RISCV_MEIE_MTIE+0x16c0>
   4416e:	4b01                	li	s6,0
   44170:	4d21                	li	s10,8
   44172:	916fd0ef          	jal	41288 <__udivdi3>
   44176:	992a                	add	s2,s2,a0
   44178:	00a93ab3          	sltu	s5,s2,a0
   4417c:	89aa                	mv	s3,a0
   4417e:	8a2e                	mv	s4,a1
   44180:	9aae                	add	s5,s5,a1
   44182:	1bf9                	add	s7,s7,-2 # fffe <__fw_size__+0x4d26>
   44184:	02200c13          	li	s8,34
   44188:	866e                	mv	a2,s11
   4418a:	86da                	mv	a3,s6
   4418c:	854a                	mv	a0,s2
   4418e:	85d6                	mv	a1,s5
   44190:	8f8fd0ef          	jal	41288 <__udivdi3>
   44194:	fff50793          	add	a5,a0,-1
   44198:	8caa                	mv	s9,a0
   4419a:	1cfbe763          	bltu	s7,a5,44368 <uart_init+0x278>
   4419e:	02ad07b3          	mul	a5,s10,a0
   441a2:	20f7c7b3          	sh2add	a5,a5,a5
   441a6:	20f7c7b3          	sh2add	a5,a5,a5
   441aa:	20f7c7b3          	sh2add	a5,a5,a5
   441ae:	078e                	sll	a5,a5,0x3
   441b0:	1e0a1f63          	bnez	s4,443ae <uart_init+0x2be>
   441b4:	1ef9fb63          	bgeu	s3,a5,443aa <uart_init+0x2ba>
   441b8:	413787b3          	sub	a5,a5,s3
   441bc:	c38d                	beqz	a5,441de <uart_init+0xee>
   441be:	20f7c7b3          	sh2add	a5,a5,a5
   441c2:	864e                	mv	a2,s3
   441c4:	20f7c7b3          	sh2add	a5,a5,a5
   441c8:	86d2                	mv	a3,s4
   441ca:	00279513          	sll	a0,a5,0x2
   441ce:	4581                	li	a1,0
   441d0:	8b8fd0ef          	jal	41288 <__udivdi3>
   441d4:	18059a63          	bnez	a1,44368 <uart_init+0x278>
   441d8:	478d                	li	a5,3
   441da:	18a7e763          	bltu	a5,a0,44368 <uart_init+0x278>
   441de:	485c                	lw	a5,20(s0)
   441e0:	fe0d0713          	add	a4,s10,-32
   441e4:	00e03733          	snez	a4,a4
   441e8:	40e00733          	neg	a4,a4
   441ec:	00ed7d33          	and	s10,s10,a4
   441f0:	9b81                	and	a5,a5,-32
   441f2:	01a7e7b3          	or	a5,a5,s10
   441f6:	c85c                	sw	a5,20(s0)
   441f8:	0ffcf793          	zext.b	a5,s9
   441fc:	d01c                	sw	a5,32(s0)
   441fe:	080cccb3          	zext.h	s9,s9
   44202:	008cdc93          	srl	s9,s9,0x8
   44206:	03942223          	sw	s9,36(s0)
   4420a:	545c                	lw	a5,44(s0)
   4420c:	00a4c683          	lbu	a3,10(s1)
   44210:	4711                	li	a4,4
   44212:	f477f793          	and	a5,a5,-185
   44216:	18d76f63          	bltu	a4,a3,443b4 <uart_init+0x2c4>
   4421a:	0004b737          	lui	a4,0x4b
   4421e:	fa870713          	add	a4,a4,-88 # 4afa8 <s_wdgs+0x10>
   44222:	20e6c733          	sh2add	a4,a3,a4
   44226:	4318                	lw	a4,0(a4)
   44228:	8702                	jr	a4
   4422a:	3e900513          	li	a0,1001
   4422e:	8082                	ret
   44230:	0387e793          	or	a5,a5,56
   44234:	0084c703          	lbu	a4,8(s1)
   44238:	4685                	li	a3,1
   4423a:	9be1                	and	a5,a5,-8
   4423c:	10d70b63          	beq	a4,a3,44352 <uart_init+0x262>
   44240:	4689                	li	a3,2
   44242:	14d70d63          	beq	a4,a3,4439c <uart_init+0x2ac>
   44246:	4509                	li	a0,2
   44248:	ef71                	bnez	a4,44324 <uart_init+0x234>
   4424a:	0094c703          	lbu	a4,9(s1)
   4424e:	8b0d                	and	a4,a4,3
   44250:	8f5d                	or	a4,a4,a5
   44252:	d458                	sw	a4,44(s0)
   44254:	4799                	li	a5,6
   44256:	cc1c                	sw	a5,24(s0)
   44258:	00c4c783          	lbu	a5,12(s1)
   4425c:	00e4c883          	lbu	a7,14(s1)
   44260:	00d4c503          	lbu	a0,13(s1)
   44264:	6809                	lui	a6,0x2
   44266:	00b4c603          	lbu	a2,11(s1)
   4426a:	07a2                	sll	a5,a5,0x8
   4426c:	f0080813          	add	a6,a6,-256 # 1f00 <RISCV_MEIE_MTIE+0x1680>
   44270:	00f4c703          	lbu	a4,15(s1)
   44274:	0104c583          	lbu	a1,16(s1)
   44278:	0114c683          	lbu	a3,17(s1)
   4427c:	0107f7b3          	and	a5,a5,a6
   44280:	050e                	sll	a0,a0,0x3
   44282:	0117e7b3          	or	a5,a5,a7
   44286:	8fc9                	or	a5,a5,a0
   44288:	0642                	sll	a2,a2,0x10
   4428a:	001f0537          	lui	a0,0x1f0
   4428e:	8e69                	and	a2,a2,a0
   44290:	0592                	sll	a1,a1,0x4
   44292:	0716                	sll	a4,a4,0x5
   44294:	0016c693          	xor	a3,a3,1
   44298:	8fd1                	or	a5,a5,a2
   4429a:	8f4d                	or	a4,a4,a1
   4429c:	0686                	sll	a3,a3,0x1
   4429e:	8f55                	or	a4,a4,a3
   442a0:	29779793          	bset	a5,a5,0x17
   442a4:	cc1c                	sw	a5,24(s0)
   442a6:	d818                	sw	a4,48(s0)
   442a8:	4050                	lw	a2,4(s0)
   442aa:	0144c703          	lbu	a4,20(s1)
   442ae:	4c9c                	lw	a5,24(s1)
   442b0:	c0067613          	and	a2,a2,-1024
   442b4:	01c4c683          	lbu	a3,28(s1)
   442b8:	0154c583          	lbu	a1,21(s1)
   442bc:	c050                	sw	a2,4(s0)
   442be:	4050                	lw	a2,4(s0)
   442c0:	07a6                	sll	a5,a5,0x9
   442c2:	2007f793          	and	a5,a5,512
   442c6:	8ed1                	or	a3,a3,a2
   442c8:	8fd5                	or	a5,a5,a3
   442ca:	0722                	sll	a4,a4,0x8
   442cc:	8fd9                	or	a5,a5,a4
   442ce:	c05c                	sw	a5,4(s0)
   442d0:	505c                	lw	a5,36(s0)
   442d2:	c1e9                	beqz	a1,44394 <uart_init+0x2a4>
   442d4:	29f79793          	bset	a5,a5,0x1f
   442d8:	d05c                	sw	a5,36(s0)
   442da:	4050                	lw	a2,4(s0)
   442dc:	fc010737          	lui	a4,0xfc010
   442e0:	50dc                	lw	a5,36(s1)
   442e2:	177d                	add	a4,a4,-1 # fc00ffff <__share_mem_end__+0xfad0ffff>
   442e4:	0284c683          	lbu	a3,40(s1)
   442e8:	8e79                	and	a2,a2,a4
   442ea:	0214c583          	lbu	a1,33(s1)
   442ee:	0204c703          	lbu	a4,32(s1)
   442f2:	c050                	sw	a2,4(s0)
   442f4:	4050                	lw	a2,4(s0)
   442f6:	07e6                	sll	a5,a5,0x19
   442f8:	02000537          	lui	a0,0x2000
   442fc:	8fe9                	and	a5,a5,a0
   442fe:	06c2                	sll	a3,a3,0x10
   44300:	8fd5                	or	a5,a5,a3
   44302:	8fd1                	or	a5,a5,a2
   44304:	0762                	sll	a4,a4,0x18
   44306:	8fd9                	or	a5,a5,a4
   44308:	c05c                	sw	a5,4(s0)
   4430a:	505c                	lw	a5,36(s0)
   4430c:	c1c1                	beqz	a1,4438c <uart_init+0x29c>
   4430e:	29e79793          	bset	a5,a5,0x1e
   44312:	d05c                	sw	a5,36(s0)
   44314:	02c4c783          	lbu	a5,44(s1)
   44318:	c789                	beqz	a5,44322 <uart_init+0x232>
   4431a:	405c                	lw	a5,4(s0)
   4431c:	28b79793          	bset	a5,a5,0xb
   44320:	c05c                	sw	a5,4(s0)
   44322:	4501                	li	a0,0
   44324:	50f2                	lw	ra,60(sp)
   44326:	5462                	lw	s0,56(sp)
   44328:	5942                	lw	s2,48(sp)
   4432a:	59b2                	lw	s3,44(sp)
   4432c:	5a22                	lw	s4,40(sp)
   4432e:	5a92                	lw	s5,36(sp)
   44330:	5b02                	lw	s6,32(sp)
   44332:	4bf2                	lw	s7,28(sp)
   44334:	4c62                	lw	s8,24(sp)
   44336:	4cd2                	lw	s9,20(sp)
   44338:	4d42                	lw	s10,16(sp)
   4433a:	4db2                	lw	s11,12(sp)
   4433c:	54d2                	lw	s1,52(sp)
   4433e:	6121                	add	sp,sp,64
   44340:	8082                	ret
   44342:	0084c703          	lbu	a4,8(s1)
   44346:	0287e793          	or	a5,a5,40
   4434a:	4685                	li	a3,1
   4434c:	9be1                	and	a5,a5,-8
   4434e:	eed719e3          	bne	a4,a3,44240 <uart_init+0x150>
   44352:	0094c703          	lbu	a4,9(s1)
   44356:	0047e793          	or	a5,a5,4
   4435a:	bdd5                	j	4424e <uart_init+0x15e>
   4435c:	0187e793          	or	a5,a5,24
   44360:	bdd1                	j	44234 <uart_init+0x144>
   44362:	0087e793          	or	a5,a5,8
   44366:	b5f9                	j	44234 <uart_init+0x144>
   44368:	3e890713          	add	a4,s2,1000
   4436c:	7d0d8793          	add	a5,s11,2000
   44370:	01273633          	sltu	a2,a4,s2
   44374:	01b7b6b3          	sltu	a3,a5,s11
   44378:	0d09                	add	s10,s10,2
   4437a:	893a                	mv	s2,a4
   4437c:	9ab2                	add	s5,s5,a2
   4437e:	8dbe                	mv	s11,a5
   44380:	9b36                	add	s6,s6,a3
   44382:	e18d13e3          	bne	s10,s8,44188 <uart_init+0x98>
   44386:	3e900513          	li	a0,1001
   4438a:	bf69                	j	44324 <uart_init+0x234>
   4438c:	49e79793          	bclr	a5,a5,0x1e
   44390:	d05c                	sw	a5,36(s0)
   44392:	b749                	j	44314 <uart_init+0x224>
   44394:	49f79793          	bclr	a5,a5,0x1f
   44398:	d05c                	sw	a5,36(s0)
   4439a:	b781                	j	442da <uart_init+0x1ea>
   4439c:	0094c703          	lbu	a4,9(s1)
   443a0:	4509                	li	a0,2
   443a2:	d349                	beqz	a4,44324 <uart_init+0x234>
   443a4:	0047e793          	or	a5,a5,4
   443a8:	b55d                	j	4424e <uart_init+0x15e>
   443aa:	e337fae3          	bgeu	a5,s3,441de <uart_init+0xee>
   443ae:	40f987b3          	sub	a5,s3,a5
   443b2:	b529                	j	441bc <uart_init+0xcc>
   443b4:	4509                	li	a0,2
   443b6:	b7bd                	j	44324 <uart_init+0x234>

000443b8 <uart_send_byte>:
   443b8:	5958                	lw	a4,52(a0)
   443ba:	6685                	lui	a3,0x1
   443bc:	38968693          	add	a3,a3,905 # 1389 <RISCV_MEIE_MTIE+0xb09>
   443c0:	02077713          	and	a4,a4,32
   443c4:	c701                	beqz	a4,443cc <uart_send_byte+0x14>
   443c6:	a829                	j	443e0 <uart_send_byte+0x28>
   443c8:	00d70f63          	beq	a4,a3,443e6 <uart_send_byte+0x2e>
   443cc:	595c                	lw	a5,52(a0)
   443ce:	0705                	add	a4,a4,1
   443d0:	0207f793          	and	a5,a5,32
   443d4:	dbf5                	beqz	a5,443c8 <uart_send_byte+0x10>
   443d6:	6785                	lui	a5,0x1
   443d8:	38978793          	add	a5,a5,905 # 1389 <RISCV_MEIE_MTIE+0xb09>
   443dc:	00f70563          	beq	a4,a5,443e6 <uart_send_byte+0x2e>
   443e0:	d10c                	sw	a1,32(a0)
   443e2:	4501                	li	a0,0
   443e4:	8082                	ret
   443e6:	450d                	li	a0,3
   443e8:	8082                	ret

000443ea <uart_flush>:
   443ea:	86aa                	mv	a3,a0
   443ec:	5948                	lw	a0,52(a0)
   443ee:	6605                	lui	a2,0x1
   443f0:	4701                	li	a4,0
   443f2:	04057513          	and	a0,a0,64
   443f6:	38960613          	add	a2,a2,905 # 1389 <RISCV_MEIE_MTIE+0xb09>
   443fa:	c501                	beqz	a0,44402 <uart_flush+0x18>
   443fc:	a005                	j	4441c <uart_flush+0x32>
   443fe:	00c70d63          	beq	a4,a2,44418 <uart_flush+0x2e>
   44402:	5adc                	lw	a5,52(a3)
   44404:	0705                	add	a4,a4,1
   44406:	0407f793          	and	a5,a5,64
   4440a:	dbf5                	beqz	a5,443fe <uart_flush+0x14>
   4440c:	6785                	lui	a5,0x1
   4440e:	38978793          	add	a5,a5,905 # 1389 <RISCV_MEIE_MTIE+0xb09>
   44412:	00f70363          	beq	a4,a5,44418 <uart_flush+0x2e>
   44416:	8082                	ret
   44418:	450d                	li	a0,3
   4441a:	8082                	ret
   4441c:	4501                	li	a0,0
   4441e:	8082                	ret

00044420 <uart_receive_byte>:
   44420:	5958                	lw	a4,52(a0)
   44422:	6685                	lui	a3,0x1
   44424:	38968693          	add	a3,a3,905 # 1389 <RISCV_MEIE_MTIE+0xb09>
   44428:	8b05                	and	a4,a4,1
   4442a:	c701                	beqz	a4,44432 <uart_receive_byte+0x12>
   4442c:	a821                	j	44444 <uart_receive_byte+0x24>
   4442e:	02d70063          	beq	a4,a3,4444e <uart_receive_byte+0x2e>
   44432:	595c                	lw	a5,52(a0)
   44434:	0705                	add	a4,a4,1
   44436:	8b85                	and	a5,a5,1
   44438:	dbfd                	beqz	a5,4442e <uart_receive_byte+0xe>
   4443a:	6785                	lui	a5,0x1
   4443c:	38978793          	add	a5,a5,905 # 1389 <RISCV_MEIE_MTIE+0xb09>
   44440:	00f70763          	beq	a4,a5,4444e <uart_receive_byte+0x2e>
   44444:	511c                	lw	a5,32(a0)
   44446:	4501                	li	a0,0
   44448:	00f58023          	sb	a5,0(a1)
   4444c:	8082                	ret
   4444e:	450d                	li	a0,3
   44450:	8082                	ret

00044452 <write_pma_addr>:
   44452:	47bd                	li	a5,15
   44454:	00b7ec63          	bltu	a5,a1,4446c <write_pma_addr+0x1a>
   44458:	0004b7b7          	lui	a5,0x4b
   4445c:	fbc78793          	add	a5,a5,-68 # 4afbc <s_wdgs+0x24>
   44460:	20f5c5b3          	sh2add	a1,a1,a5
   44464:	419c                	lw	a5,0(a1)
   44466:	8782                	jr	a5
   44468:	bdf51073          	csrw	0xbdf,a0
   4446c:	8082                	ret
   4446e:	bde51073          	csrw	0xbde,a0
   44472:	8082                	ret
   44474:	bd051073          	csrw	0xbd0,a0
   44478:	8082                	ret
   4447a:	bd151073          	csrw	0xbd1,a0
   4447e:	8082                	ret
   44480:	bd251073          	csrw	0xbd2,a0
   44484:	8082                	ret
   44486:	bd351073          	csrw	0xbd3,a0
   4448a:	8082                	ret
   4448c:	bd451073          	csrw	0xbd4,a0
   44490:	8082                	ret
   44492:	bd551073          	csrw	0xbd5,a0
   44496:	8082                	ret
   44498:	bd651073          	csrw	0xbd6,a0
   4449c:	8082                	ret
   4449e:	bd751073          	csrw	0xbd7,a0
   444a2:	8082                	ret
   444a4:	bd851073          	csrw	0xbd8,a0
   444a8:	8082                	ret
   444aa:	bd951073          	csrw	0xbd9,a0
   444ae:	8082                	ret
   444b0:	bda51073          	csrw	0xbda,a0
   444b4:	8082                	ret
   444b6:	bdb51073          	csrw	0xbdb,a0
   444ba:	8082                	ret
   444bc:	bdc51073          	csrw	0xbdc,a0
   444c0:	8082                	ret
   444c2:	bdd51073          	csrw	0xbdd,a0
   444c6:	8082                	ret

000444c8 <pmp_config>:
   444c8:	1101                	add	sp,sp,-32
   444ca:	ce06                	sw	ra,28(sp)
   444cc:	ca26                	sw	s1,20(sp)
   444ce:	cd41                	beqz	a0,44566 <pmp_config+0x9e>
   444d0:	c84a                	sw	s2,16(sp)
   444d2:	fff58793          	add	a5,a1,-1
   444d6:	473d                	li	a4,15
   444d8:	892e                	mv	s2,a1
   444da:	4489                	li	s1,2
   444dc:	06f76963          	bltu	a4,a5,4454e <pmp_config+0x86>
   444e0:	cc22                	sw	s0,24(sp)
   444e2:	c64e                	sw	s3,12(sp)
   444e4:	c452                	sw	s4,8(sp)
   444e6:	c256                	sw	s5,4(sp)
   444e8:	842a                	mv	s0,a0
   444ea:	4a81                	li	s5,0
   444ec:	4989                	li	s3,2
   444ee:	0ff00a13          	li	s4,255
   444f2:	003a9793          	sll	a5,s5,0x3
   444f6:	002ad713          	srl	a4,s5,0x2
   444fa:	8be1                	and	a5,a5,24
   444fc:	07370263          	beq	a4,s3,44560 <pmp_config+0x98>
   44500:	468d                	li	a3,3
   44502:	06d70863          	beq	a4,a3,44572 <pmp_config+0xaa>
   44506:	4685                	li	a3,1
   44508:	04d71963          	bne	a4,a3,4455a <pmp_config+0x92>
   4450c:	3a102673          	csrr	a2,pmpcfg1
   44510:	00fa1733          	sll	a4,s4,a5
   44514:	00c774b3          	and	s1,a4,a2
   44518:	00f4d4b3          	srl	s1,s1,a5
   4451c:	0804f493          	and	s1,s1,128
   44520:	12049a63          	bnez	s1,44654 <pmp_config+0x18c>
   44524:	00044683          	lbu	a3,0(s0)
   44528:	45bd                	li	a1,15
   4452a:	40e67633          	andn	a2,a2,a4
   4452e:	00f696b3          	sll	a3,a3,a5
   44532:	4048                	lw	a0,4(s0)
   44534:	fff74713          	not	a4,a4
   44538:	8e55                	or	a2,a2,a3
   4453a:	1155ea63          	bltu	a1,s5,4464e <pmp_config+0x186>
   4453e:	0004b6b7          	lui	a3,0x4b
   44542:	ffc68693          	add	a3,a3,-4 # 4affc <s_wdgs+0x64>
   44546:	20dac6b3          	sh2add	a3,s5,a3
   4454a:	4294                	lw	a3,0(a3)
   4454c:	8682                	jr	a3
   4454e:	4942                	lw	s2,16(sp)
   44550:	40f2                	lw	ra,28(sp)
   44552:	8526                	mv	a0,s1
   44554:	44d2                	lw	s1,20(sp)
   44556:	6105                	add	sp,sp,32
   44558:	8082                	ret
   4455a:	3a002673          	csrr	a2,pmpcfg0
   4455e:	bf4d                	j	44510 <pmp_config+0x48>
   44560:	3a202673          	csrr	a2,pmpcfg2
   44564:	b775                	j	44510 <pmp_config+0x48>
   44566:	40f2                	lw	ra,28(sp)
   44568:	4489                	li	s1,2
   4456a:	8526                	mv	a0,s1
   4456c:	44d2                	lw	s1,20(sp)
   4456e:	6105                	add	sp,sp,32
   44570:	8082                	ret
   44572:	3a302673          	csrr	a2,pmpcfg3
   44576:	bf69                	j	44510 <pmp_config+0x48>
   44578:	3be51073          	csrw	pmpaddr14,a0
   4457c:	3a361073          	csrw	pmpcfg3,a2
   44580:	bc302673          	csrr	a2,0xbc3
   44584:	00844683          	lbu	a3,8(s0)
   44588:	8f71                	and	a4,a4,a2
   4458a:	00f697b3          	sll	a5,a3,a5
   4458e:	8fd9                	or	a5,a5,a4
   44590:	bc379073          	csrw	0xbc3,a5
   44594:	4448                	lw	a0,12(s0)
   44596:	85d6                	mv	a1,s5
   44598:	0a85                	add	s5,s5,1
   4459a:	3d65                	jal	44452 <write_pma_addr>
   4459c:	0441                	add	s0,s0,16
   4459e:	f5591ae3          	bne	s2,s5,444f2 <pmp_config+0x2a>
   445a2:	0000100f          	fence.i
   445a6:	4462                	lw	s0,24(sp)
   445a8:	4942                	lw	s2,16(sp)
   445aa:	49b2                	lw	s3,12(sp)
   445ac:	4a22                	lw	s4,8(sp)
   445ae:	4a92                	lw	s5,4(sp)
   445b0:	b745                	j	44550 <pmp_config+0x88>
   445b2:	3bd51073          	csrw	pmpaddr13,a0
   445b6:	b7d9                	j	4457c <pmp_config+0xb4>
   445b8:	3bc51073          	csrw	pmpaddr12,a0
   445bc:	b7c1                	j	4457c <pmp_config+0xb4>
   445be:	3bb51073          	csrw	pmpaddr11,a0
   445c2:	3a261073          	csrw	pmpcfg2,a2
   445c6:	bc202673          	csrr	a2,0xbc2
   445ca:	00844683          	lbu	a3,8(s0)
   445ce:	8f71                	and	a4,a4,a2
   445d0:	00f697b3          	sll	a5,a3,a5
   445d4:	8fd9                	or	a5,a5,a4
   445d6:	bc279073          	csrw	0xbc2,a5
   445da:	bf6d                	j	44594 <pmp_config+0xcc>
   445dc:	3ba51073          	csrw	pmpaddr10,a0
   445e0:	b7cd                	j	445c2 <pmp_config+0xfa>
   445e2:	3b951073          	csrw	pmpaddr9,a0
   445e6:	bff1                	j	445c2 <pmp_config+0xfa>
   445e8:	3b851073          	csrw	pmpaddr8,a0
   445ec:	bfd9                	j	445c2 <pmp_config+0xfa>
   445ee:	3b751073          	csrw	pmpaddr7,a0
   445f2:	3a161073          	csrw	pmpcfg1,a2
   445f6:	bc102673          	csrr	a2,0xbc1
   445fa:	00844683          	lbu	a3,8(s0)
   445fe:	8f71                	and	a4,a4,a2
   44600:	00f697b3          	sll	a5,a3,a5
   44604:	8fd9                	or	a5,a5,a4
   44606:	bc179073          	csrw	0xbc1,a5
   4460a:	b769                	j	44594 <pmp_config+0xcc>
   4460c:	3b651073          	csrw	pmpaddr6,a0
   44610:	b7cd                	j	445f2 <pmp_config+0x12a>
   44612:	3b551073          	csrw	pmpaddr5,a0
   44616:	bff1                	j	445f2 <pmp_config+0x12a>
   44618:	3b451073          	csrw	pmpaddr4,a0
   4461c:	bfd9                	j	445f2 <pmp_config+0x12a>
   4461e:	3b351073          	csrw	pmpaddr3,a0
   44622:	3a061073          	csrw	pmpcfg0,a2
   44626:	bc002673          	csrr	a2,0xbc0
   4462a:	00844683          	lbu	a3,8(s0)
   4462e:	8f71                	and	a4,a4,a2
   44630:	00f697b3          	sll	a5,a3,a5
   44634:	8fd9                	or	a5,a5,a4
   44636:	bc079073          	csrw	0xbc0,a5
   4463a:	bfa9                	j	44594 <pmp_config+0xcc>
   4463c:	3b251073          	csrw	pmpaddr2,a0
   44640:	b7cd                	j	44622 <pmp_config+0x15a>
   44642:	3b151073          	csrw	pmpaddr1,a0
   44646:	bff1                	j	44622 <pmp_config+0x15a>
   44648:	3bf51073          	csrw	pmpaddr15,a0
   4464c:	bf05                	j	4457c <pmp_config+0xb4>
   4464e:	3b051073          	csrw	pmpaddr0,a0
   44652:	bfc1                	j	44622 <pmp_config+0x15a>
   44654:	4485                	li	s1,1
   44656:	bf81                	j	445a6 <pmp_config+0xde>

00044658 <gptmr_channel_get_default_config>:
   44658:	57f9                	li	a5,-2
   4465a:	4705                	li	a4,1
   4465c:	0ff00693          	li	a3,255
   44660:	c5dc                	sw	a5,12(a1)
   44662:	c99c                	sw	a5,16(a1)
   44664:	c9dc                	sw	a5,20(a1)
   44666:	10100793          	li	a5,257
   4466a:	0005a023          	sw	zero,0(a1)
   4466e:	c1d4                	sw	a3,4(a1)
   44670:	0005a423          	sw	zero,8(a1)
   44674:	cd9c                	sw	a5,24(a1)
   44676:	0205a623          	sw	zero,44(a1)
   4467a:	02058823          	sb	zero,48(a1)
   4467e:	00e59e23          	sh	a4,28(a1)
   44682:	0205a223          	sw	zero,36(a1)
   44686:	0205a423          	sw	zero,40(a1)
   4468a:	d198                	sw	a4,32(a1)
   4468c:	8082                	ret

0004468e <gptmr_channel_config>:
   4468e:	01a64883          	lbu	a7,26(a2)
   44692:	882a                	mv	a6,a0
   44694:	00088563          	beqz	a7,4469e <gptmr_channel_config+0x10>
   44698:	4509                	li	a0,2
   4469a:	10058f63          	beqz	a1,447b8 <gptmr_channel_config+0x12a>
   4469e:	425c                	lw	a5,4(a2)
   446a0:	0ff00713          	li	a4,255
   446a4:	4e81                	li	t4,0
   446a6:	00e78763          	beq	a5,a4,446b4 <gptmr_channel_config+0x26>
   446aa:	079a                	sll	a5,a5,0x6
   446ac:	0ff7f793          	zext.b	a5,a5
   446b0:	0207ee93          	or	t4,a5,32
   446b4:	421c                	lw	a5,0(a2)
   446b6:	00862f03          	lw	t5,8(a2)
   446ba:	01c64503          	lbu	a0,28(a2)
   446be:	01b64e03          	lbu	t3,27(a2)
   446c2:	01864303          	lbu	t1,24(a2)
   446c6:	8b9d                	and	a5,a5,7
   446c8:	050e                	sll	a0,a0,0x3
   446ca:	01e7e7b3          	or	a5,a5,t5
   446ce:	8fc9                	or	a5,a5,a0
   446d0:	0e12                	sll	t3,t3,0x4
   446d2:	5658                	lw	a4,44(a2)
   446d4:	01c7e7b3          	or	a5,a5,t3
   446d8:	0326                	sll	t1,t1,0x9
   446da:	03064503          	lbu	a0,48(a2)
   446de:	08b6                	sll	a7,a7,0xd
   446e0:	0067e7b3          	or	a5,a5,t1
   446e4:	0117e7b3          	or	a5,a5,a7
   446e8:	01062e03          	lw	t3,16(a2)
   446ec:	074a                	sll	a4,a4,0x12
   446ee:	000408b7          	lui	a7,0x40
   446f2:	01177733          	and	a4,a4,a7
   446f6:	8fd9                	or	a5,a5,a4
   446f8:	01151713          	sll	a4,a0,0x11
   446fc:	8fd9                	or	a5,a5,a4
   446fe:	5575                	li	a0,-3
   44700:	fffe0713          	add	a4,t3,-1
   44704:	01d7e7b3          	or	a5,a5,t4
   44708:	0ee56663          	bltu	a0,a4,447f4 <gptmr_channel_config+0x166>
   4470c:	00c62883          	lw	a7,12(a2)
   44710:	059a                	sll	a1,a1,0x6
   44712:	00b80533          	add	a0,a6,a1
   44716:	c518                	sw	a4,8(a0)
   44718:	fff88513          	add	a0,a7,-1 # 3ffff <_noncacheable_size+0x2ffff>
   4471c:	5775                	li	a4,-3
   4471e:	0aa76f63          	bltu	a4,a0,447dc <gptmr_channel_config+0x14e>
   44722:	01462883          	lw	a7,20(a2)
   44726:	00b80733          	add	a4,a6,a1
   4472a:	c348                	sw	a0,4(a4)
   4472c:	5375                	li	t1,-3
   4472e:	fff88513          	add	a0,a7,-1
   44732:	08a36963          	bltu	t1,a0,447c4 <gptmr_channel_config+0x136>
   44736:	01964883          	lbu	a7,25(a2)
   4473a:	c748                	sw	a0,12(a4)
   4473c:	c31c                	sw	a5,0(a4)
   4473e:	431c                	lw	a5,0(a4)
   44740:	01d64303          	lbu	t1,29(a2)
   44744:	06aa                	sll	a3,a3,0xa
   44746:	06089a63          	bnez	a7,447ba <gptmr_channel_config+0x12c>
   4474a:	eff7f793          	and	a5,a5,-257
   4474e:	8fd5                	or	a5,a5,a3
   44750:	c31c                	sw	a5,0(a4)
   44752:	5254                	lw	a3,36(a2)
   44754:	5608                	lw	a0,40(a2)
   44756:	04a6ef63          	bltu	a3,a0,447b4 <gptmr_channel_config+0x126>
   4475a:	0a030a63          	beqz	t1,4480e <gptmr_channel_config+0x180>
   4475e:	521c                	lw	a5,32(a2)
   44760:	4310                	lw	a2,0(a4)
   44762:	68c1                	lui	a7,0x10
   44764:	07c2                	sll	a5,a5,0x10
   44766:	0117f7b3          	and	a5,a5,a7
   4476a:	49061613          	bclr	a2,a2,0x10
   4476e:	8fd1                	or	a5,a5,a2
   44770:	c31c                	sw	a5,0(a4)
   44772:	5675                	li	a2,-3
   44774:	fff50793          	add	a5,a0,-1 # 1ffffff <__share_mem_end__+0xcfffff>
   44778:	0af66363          	bltu	a2,a5,4481e <gptmr_channel_config+0x190>
   4477c:	c35c                	sw	a5,4(a4)
   4477e:	5675                	li	a2,-3
   44780:	fff68793          	add	a5,a3,-1
   44784:	08f66b63          	bltu	a2,a5,4481a <gptmr_channel_config+0x18c>
   44788:	982e                	add	a6,a6,a1
   4478a:	00f82423          	sw	a5,8(a6)
   4478e:	57fd                	li	a5,-1
   44790:	c75c                	sw	a5,12(a4)
   44792:	431c                	lw	a5,0(a4)
   44794:	9be1                	and	a5,a5,-8
   44796:	0047e793          	or	a5,a5,4
   4479a:	c31c                	sw	a5,0(a4)
   4479c:	431c                	lw	a5,0(a4)
   4479e:	28e79793          	bset	a5,a5,0xe
   447a2:	c31c                	sw	a5,0(a4)
   447a4:	431c                	lw	a5,0(a4)
   447a6:	48e79793          	bclr	a5,a5,0xe
   447aa:	c31c                	sw	a5,0(a4)
   447ac:	431c                	lw	a5,0(a4)
   447ae:	28f79793          	bset	a5,a5,0xf
   447b2:	c31c                	sw	a5,0(a4)
   447b4:	4501                	li	a0,0
   447b6:	8082                	ret
   447b8:	8082                	ret
   447ba:	8fd5                	or	a5,a5,a3
   447bc:	1007e793          	or	a5,a5,256
   447c0:	c31c                	sw	a5,0(a4)
   447c2:	bf41                	j	44752 <gptmr_channel_config+0xc4>
   447c4:	8546                	mv	a0,a7
   447c6:	01964883          	lbu	a7,25(a2)
   447ca:	c748                	sw	a0,12(a4)
   447cc:	c31c                	sw	a5,0(a4)
   447ce:	431c                	lw	a5,0(a4)
   447d0:	01d64303          	lbu	t1,29(a2)
   447d4:	06aa                	sll	a3,a3,0xa
   447d6:	f6088ae3          	beqz	a7,4474a <gptmr_channel_config+0xbc>
   447da:	b7c5                	j	447ba <gptmr_channel_config+0x12c>
   447dc:	8546                	mv	a0,a7
   447de:	01462883          	lw	a7,20(a2)
   447e2:	00b80733          	add	a4,a6,a1
   447e6:	c348                	sw	a0,4(a4)
   447e8:	5375                	li	t1,-3
   447ea:	fff88513          	add	a0,a7,-1 # ffff <__fw_size__+0x4d27>
   447ee:	f4a374e3          	bgeu	t1,a0,44736 <gptmr_channel_config+0xa8>
   447f2:	bfc9                	j	447c4 <gptmr_channel_config+0x136>
   447f4:	00c62883          	lw	a7,12(a2)
   447f8:	059a                	sll	a1,a1,0x6
   447fa:	8772                	mv	a4,t3
   447fc:	00b80533          	add	a0,a6,a1
   44800:	c518                	sw	a4,8(a0)
   44802:	fff88513          	add	a0,a7,-1
   44806:	5775                	li	a4,-3
   44808:	f0a77de3          	bgeu	a4,a0,44722 <gptmr_channel_config+0x94>
   4480c:	bfc1                	j	447dc <gptmr_channel_config+0x14e>
   4480e:	431c                	lw	a5,0(a4)
   44810:	4501                	li	a0,0
   44812:	48f79793          	bclr	a5,a5,0xf
   44816:	c31c                	sw	a5,0(a4)
   44818:	8082                	ret
   4481a:	87b6                	mv	a5,a3
   4481c:	b7b5                	j	44788 <gptmr_channel_config+0xfa>
   4481e:	87aa                	mv	a5,a0
   44820:	c35c                	sw	a5,4(a4)
   44822:	5675                	li	a2,-3
   44824:	fff68793          	add	a5,a3,-1
   44828:	f6f670e3          	bgeu	a2,a5,44788 <gptmr_channel_config+0xfa>
   4482c:	b7fd                	j	4481a <gptmr_channel_config+0x18c>

0004482e <pllctlv2_get_pll_postdiv_freq_in_hz>:
   4482e:	87aa                	mv	a5,a0
   44830:	cd41                	beqz	a0,448c8 <pllctlv2_get_pll_postdiv_freq_in_hz+0x9a>
   44832:	4709                	li	a4,2
   44834:	4501                	li	a0,0
   44836:	00b77363          	bgeu	a4,a1,4483c <pllctlv2_get_pll_postdiv_freq_in_hz+0xe>
   4483a:	8082                	ret
   4483c:	00559713          	sll	a4,a1,0x5
   44840:	9732                	add	a4,a4,a2
   44842:	059e                	sll	a1,a1,0x7
   44844:	95be                	add	a1,a1,a5
   44846:	03070713          	add	a4,a4,48
   4484a:	20f747b3          	sh2add	a5,a4,a5
   4484e:	439c                	lw	a5,0(a5)
   44850:	0805a603          	lw	a2,128(a1)
   44854:	0845a683          	lw	a3,132(a1)
   44858:	40000837          	lui	a6,0x40000
   4485c:	0885a503          	lw	a0,136(a1)
   44860:	187d                	add	a6,a6,-1 # 3fffffff <__share_mem_end__+0x3ecfffff>
   44862:	0aaab8b7          	lui	a7,0xaaab
   44866:	0106f6b3          	and	a3,a3,a6
   4486a:	aa988893          	add	a7,a7,-1367 # aaaaaa9 <__share_mem_end__+0x97aaaa9>
   4486e:	03f7f713          	and	a4,a5,63
   44872:	07f67593          	and	a1,a2,127
   44876:	01057533          	and	a0,a0,a6
   4487a:	04d8e963          	bltu	a7,a3,448cc <pllctlv2_get_pll_postdiv_freq_in_hz+0x9e>
   4487e:	000f47b7          	lui	a5,0xf4
   44882:	24078793          	add	a5,a5,576 # f4240 <__fast_load_addr__+0xa8bc0>
   44886:	02f55533          	divu	a0,a0,a5
   4488a:	20d6a6b3          	sh1add	a3,a3,a3
   4488e:	068e                	sll	a3,a3,0x3
   44890:	016e37b7          	lui	a5,0x16e3
   44894:	60078793          	add	a5,a5,1536 # 16e3600 <__share_mem_end__+0x3e3600>
   44898:	02a6d6b3          	divu	a3,a3,a0
   4489c:	02f585b3          	mul	a1,a1,a5
   448a0:	00b68533          	add	a0,a3,a1
   448a4:	20e747b3          	sh2add	a5,a4,a4
   448a8:	4715                	li	a4,5
   448aa:	20f7c7b3          	sh2add	a5,a5,a5
   448ae:	078a                	sll	a5,a5,0x2
   448b0:	02e7d7b3          	divu	a5,a5,a4
   448b4:	06478793          	add	a5,a5,100
   448b8:	02f55533          	divu	a0,a0,a5
   448bc:	20a54533          	sh2add	a0,a0,a0
   448c0:	20a54533          	sh2add	a0,a0,a0
   448c4:	050a                	sll	a0,a0,0x2
   448c6:	8082                	ret
   448c8:	4501                	li	a0,0
   448ca:	8082                	ret
   448cc:	000f4837          	lui	a6,0xf4
   448d0:	0aaab637          	lui	a2,0xaaab
   448d4:	24080813          	add	a6,a6,576 # f4240 <__fast_load_addr__+0xa8bc0>
   448d8:	aaa60613          	add	a2,a2,-1366 # aaaaaaa <__share_mem_end__+0x97aaaaa>
   448dc:	03055833          	divu	a6,a0,a6
   448e0:	87b6                	mv	a5,a3
   448e2:	02c68963          	beq	a3,a2,44914 <pllctlv2_get_pll_postdiv_freq_in_hz+0xe6>
   448e6:	8385                	srl	a5,a5,0x1
   448e8:	fef66fe3          	bltu	a2,a5,448e6 <pllctlv2_get_pll_postdiv_freq_in_hz+0xb8>
   448ec:	8e9d                	sub	a3,a3,a5
   448ee:	20d6a6b3          	sh1add	a3,a3,a3
   448f2:	068e                	sll	a3,a3,0x3
   448f4:	0306d6b3          	divu	a3,a3,a6
   448f8:	20f7a533          	sh1add	a0,a5,a5
   448fc:	050e                	sll	a0,a0,0x3
   448fe:	016e37b7          	lui	a5,0x16e3
   44902:	60078793          	add	a5,a5,1536 # 16e3600 <__share_mem_end__+0x3e3600>
   44906:	03055533          	divu	a0,a0,a6
   4490a:	02f585b3          	mul	a1,a1,a5
   4490e:	95b6                	add	a1,a1,a3
   44910:	952e                	add	a0,a0,a1
   44912:	bf49                	j	448a4 <pllctlv2_get_pll_postdiv_freq_in_hz+0x76>
   44914:	4681                	li	a3,0
   44916:	b7cd                	j	448f8 <pllctlv2_get_pll_postdiv_freq_in_hz+0xca>

00044918 <_sbrk>:
   44918:	4481a783          	lw	a5,1096(gp) # 12d0c48 <heap_end.0>
   4491c:	c79d                	beqz	a5,4494a <_sbrk+0x32>
   4491e:	00244737          	lui	a4,0x244
   44922:	953e                	add	a0,a0,a5
   44924:	00070713          	mv	a4,a4
   44928:	00a76663          	bltu	a4,a0,44934 <_sbrk+0x1c>
   4492c:	44a1a423          	sw	a0,1096(gp) # 12d0c48 <heap_end.0>
   44930:	853e                	mv	a0,a5
   44932:	8082                	ret
   44934:	1141                	add	sp,sp,-16
   44936:	c606                	sw	ra,12(sp)
   44938:	747000ef          	jal	4587e <__errno>
   4493c:	40b2                	lw	ra,12(sp)
   4493e:	47b1                	li	a5,12
   44940:	c11c                	sw	a5,0(a0)
   44942:	57fd                	li	a5,-1
   44944:	853e                	mv	a0,a5
   44946:	0141                	add	sp,sp,16
   44948:	8082                	ret
   4494a:	002407b7          	lui	a5,0x240
   4494e:	00078713          	mv	a4,a5
   44952:	44e1a423          	sw	a4,1096(gp) # 12d0c48 <heap_end.0>
   44956:	00078793          	mv	a5,a5
   4495a:	b7d1                	j	4491e <_sbrk+0x6>

0004495c <console_init>:
   4495c:	7139                	add	sp,sp,-64
   4495e:	da26                	sw	s1,52(sp)
   44960:	9d01a783          	lw	a5,-1584(gp) # 12d01d0 <_impure_ptr>
   44964:	dc22                	sw	s0,56(sp)
   44966:	842a                	mv	s0,a0
   44968:	43c8                	lw	a0,4(a5)
   4496a:	4681                	li	a3,0
   4496c:	4609                	li	a2,2
   4496e:	4581                	li	a1,0
   44970:	de06                	sw	ra,60(sp)
   44972:	567010ef          	jal	466d8 <setvbuf>
   44976:	9d01a783          	lw	a5,-1584(gp) # 12d01d0 <_impure_ptr>
   4497a:	4681                	li	a3,0
   4497c:	4609                	li	a2,2
   4497e:	4788                	lw	a0,8(a5)
   44980:	4581                	li	a1,0
   44982:	557010ef          	jal	466d8 <setvbuf>
   44986:	401c                	lw	a5,0(s0)
   44988:	4505                	li	a0,1
   4498a:	c791                	beqz	a5,44996 <console_init+0x3a>
   4498c:	50f2                	lw	ra,60(sp)
   4498e:	5462                	lw	s0,56(sp)
   44990:	54d2                	lw	s1,52(sp)
   44992:	6121                	add	sp,sp,64
   44994:	8082                	ret
   44996:	4048                	lw	a0,4(s0)
   44998:	858a                	mv	a1,sp
   4499a:	c002                	sw	zero,0(sp)
   4499c:	c202                	sw	zero,4(sp)
   4499e:	c402                	sw	zero,8(sp)
   449a0:	c602                	sw	zero,12(sp)
   449a2:	c802                	sw	zero,16(sp)
   449a4:	ca02                	sw	zero,20(sp)
   449a6:	cc02                	sw	zero,24(sp)
   449a8:	ce02                	sw	zero,28(sp)
   449aa:	d002                	sw	zero,32(sp)
   449ac:	d202                	sw	zero,36(sp)
   449ae:	d402                	sw	zero,40(sp)
   449b0:	d602                	sw	zero,44(sp)
   449b2:	f02ff0ef          	jal	440b4 <uart_default_config>
   449b6:	445c                	lw	a5,12(s0)
   449b8:	4418                	lw	a4,8(s0)
   449ba:	4048                	lw	a0,4(s0)
   449bc:	858a                	mv	a1,sp
   449be:	c03a                	sw	a4,0(sp)
   449c0:	c23e                	sw	a5,4(sp)
   449c2:	f2eff0ef          	jal	440f0 <uart_init>
   449c6:	f179                	bnez	a0,4498c <console_init+0x30>
   449c8:	4058                	lw	a4,4(s0)
   449ca:	50f2                	lw	ra,60(sp)
   449cc:	5462                	lw	s0,56(sp)
   449ce:	44e1a623          	sw	a4,1100(gp) # 12d0c4c <g_console_uart>
   449d2:	54d2                	lw	s1,52(sp)
   449d4:	6121                	add	sp,sp,64
   449d6:	8082                	ret

000449d8 <_write>:
   449d8:	1101                	add	sp,sp,-32
   449da:	ce06                	sw	ra,28(sp)
   449dc:	ca26                	sw	s1,20(sp)
   449de:	c452                	sw	s4,8(sp)
   449e0:	06c05363          	blez	a2,44a46 <_write+0x6e>
   449e4:	cc22                	sw	s0,24(sp)
   449e6:	c84a                	sw	s2,16(sp)
   449e8:	c64e                	sw	s3,12(sp)
   449ea:	8a32                	mv	s4,a2
   449ec:	842e                	mv	s0,a1
   449ee:	00c589b3          	add	s3,a1,a2
   449f2:	4929                	li	s2,10
   449f4:	00044583          	lbu	a1,0(s0)
   449f8:	03258c63          	beq	a1,s2,44a30 <_write+0x58>
   449fc:	44c1a503          	lw	a0,1100(gp) # 12d0c4c <g_console_uart>
   44a00:	3a65                	jal	443b8 <uart_send_byte>
   44a02:	c519                	beqz	a0,44a10 <_write+0x38>
   44a04:	00044583          	lbu	a1,0(s0)
   44a08:	44c1a503          	lw	a0,1100(gp) # 12d0c4c <g_console_uart>
   44a0c:	3275                	jal	443b8 <uart_send_byte>
   44a0e:	f97d                	bnez	a0,44a04 <_write+0x2c>
   44a10:	0405                	add	s0,s0,1
   44a12:	ff3411e3          	bne	s0,s3,449f4 <_write+0x1c>
   44a16:	4462                	lw	s0,24(sp)
   44a18:	4942                	lw	s2,16(sp)
   44a1a:	49b2                	lw	s3,12(sp)
   44a1c:	44c1a503          	lw	a0,1100(gp) # 12d0c4c <g_console_uart>
   44a20:	32e9                	jal	443ea <uart_flush>
   44a22:	fd6d                	bnez	a0,44a1c <_write+0x44>
   44a24:	40f2                	lw	ra,28(sp)
   44a26:	44d2                	lw	s1,20(sp)
   44a28:	8552                	mv	a0,s4
   44a2a:	4a22                	lw	s4,8(sp)
   44a2c:	6105                	add	sp,sp,32
   44a2e:	8082                	ret
   44a30:	44c1a503          	lw	a0,1100(gp) # 12d0c4c <g_console_uart>
   44a34:	45b5                	li	a1,13
   44a36:	3249                	jal	443b8 <uart_send_byte>
   44a38:	d571                	beqz	a0,44a04 <_write+0x2c>
   44a3a:	44c1a503          	lw	a0,1100(gp) # 12d0c4c <g_console_uart>
   44a3e:	45b5                	li	a1,13
   44a40:	3aa5                	jal	443b8 <uart_send_byte>
   44a42:	f57d                	bnez	a0,44a30 <_write+0x58>
   44a44:	b7c1                	j	44a04 <_write+0x2c>
   44a46:	4a01                	li	s4,0
   44a48:	bfd1                	j	44a1c <_write+0x44>

00044a4a <_read>:
   44a4a:	1141                	add	sp,sp,-16
   44a4c:	c422                	sw	s0,8(sp)
   44a4e:	c226                	sw	s1,4(sp)
   44a50:	c606                	sw	ra,12(sp)
   44a52:	842e                	mv	s0,a1
   44a54:	44c1a503          	lw	a0,1100(gp) # 12d0c4c <g_console_uart>
   44a58:	85a2                	mv	a1,s0
   44a5a:	32d9                	jal	44420 <uart_receive_byte>
   44a5c:	fd65                	bnez	a0,44a54 <_read+0xa>
   44a5e:	40b2                	lw	ra,12(sp)
   44a60:	4422                	lw	s0,8(sp)
   44a62:	4492                	lw	s1,4(sp)
   44a64:	4505                	li	a0,1
   44a66:	0141                	add	sp,sp,16
   44a68:	8082                	ret

00044a6a <_fstat>:
   44a6a:	6789                	lui	a5,0x2
   44a6c:	c1dc                	sw	a5,4(a1)
   44a6e:	4501                	li	a0,0
   44a70:	8082                	ret

00044a72 <tx_cpu_ts_setup>:
   44a72:	010f0537          	lui	a0,0x10f0
   44a76:	715d                	add	sp,sp,-80
   44a78:	4581                	li	a1,0
   44a7a:	053d                	add	a0,a0,15 # 10f000f <_flash_size+0xcf000f>
   44a7c:	c686                	sw	ra,76(sp)
   44a7e:	dfaff0ef          	jal	44078 <clock_add_to_group>
   44a82:	006c                	add	a1,sp,12
   44a84:	f0018537          	lui	a0,0xf0018
   44a88:	3ec1                	jal	44658 <gptmr_channel_get_default_config>
   44a8a:	010f0537          	lui	a0,0x10f0
   44a8e:	053d                	add	a0,a0,15 # 10f000f <_flash_size+0xcf000f>
   44a90:	c2eff0ef          	jal	43ebe <clock_get_frequency>
   44a94:	06400793          	li	a5,100
   44a98:	02f557b3          	divu	a5,a0,a5
   44a9c:	4681                	li	a3,0
   44a9e:	0070                	add	a2,sp,12
   44aa0:	4585                	li	a1,1
   44aa2:	f0018537          	lui	a0,0xf0018
   44aa6:	d03e                	sw	a5,32(sp)
   44aa8:	36dd                	jal	4468e <gptmr_channel_config>
   44aaa:	f00187b7          	lui	a5,0xf0018
   44aae:	43b8                	lw	a4,64(a5)
   44ab0:	00e71693          	sll	a3,a4,0xe
   44ab4:	0006d663          	bgez	a3,44ac0 <tx_cpu_ts_setup+0x4e>
   44ab8:	43b8                	lw	a4,64(a5)
   44aba:	bff77713          	and	a4,a4,-1025
   44abe:	c3b8                	sw	a4,64(a5)
   44ac0:	f00187b7          	lui	a5,0xf0018
   44ac4:	43b4                	lw	a3,64(a5)
   44ac6:	e4000737          	lui	a4,0xe4000
   44aca:	e4002637          	lui	a2,0xe4002
   44ace:	4006e693          	or	a3,a3,1024
   44ad2:	c3b4                	sw	a3,64(a5)
   44ad4:	2047a683          	lw	a3,516(a5) # f0018204 <__share_mem_end__+0xeed18204>
   44ad8:	40b6                	lw	ra,76(sp)
   44ada:	0106e693          	or	a3,a3,16
   44ade:	20d7a223          	sw	a3,516(a5)
   44ae2:	4789                	li	a5,2
   44ae4:	db7c                	sw	a5,116(a4)
   44ae6:	421c                	lw	a5,0(a2)
   44ae8:	29d79793          	bset	a5,a5,0x1d
   44aec:	c21c                	sw	a5,0(a2)
   44aee:	6161                	add	sp,sp,80
   44af0:	8082                	ret

00044af2 <threadx_exception_handler>:
   44af2:	1101                	add	sp,sp,-32
   44af4:	ce06                	sw	ra,28(sp)
   44af6:	cc22                	sw	s0,24(sp)
   44af8:	ca26                	sw	s1,20(sp)
   44afa:	c84a                	sw	s2,16(sp)
   44afc:	34202473          	csrr	s0,mcause
   44b00:	341024f3          	csrr	s1,mepc
   44b04:	34302973          	csrr	s2,mtval
   44b08:	0004b537          	lui	a0,0x4b
   44b0c:	bf050513          	add	a0,a0,-1040 # 4abf0 <__clz_tab+0x13c>
   44b10:	38d010ef          	jal	4669c <iprintf>
   44b14:	0004b537          	lui	a0,0x4b
   44b18:	86ca                	mv	a3,s2
   44b1a:	8626                	mv	a2,s1
   44b1c:	85a2                	mv	a1,s0
   44b1e:	c2050513          	add	a0,a0,-992 # 4ac20 <__clz_tab+0x16c>
   44b22:	37b010ef          	jal	4669c <iprintf>
   44b26:	9cc1a683          	lw	a3,-1588(gp) # 12d01cc <_tx_thread_system_state>
   44b2a:	4705                	li	a4,1
   44b2c:	00d77c63          	bgeu	a4,a3,44b44 <threadx_exception_handler+0x52>
   44b30:	9cc1a583          	lw	a1,-1588(gp) # 12d01cc <_tx_thread_system_state>
   44b34:	0004b537          	lui	a0,0x4b
   44b38:	d1c50513          	add	a0,a0,-740 # 4ad1c <__clz_tab+0x268>
   44b3c:	15fd                	add	a1,a1,-1
   44b3e:	35f010ef          	jal	4669c <iprintf>
   44b42:	a001                	j	44b42 <threadx_exception_handler+0x50>
   44b44:	4a81a483          	lw	s1,1192(gp) # 12d0ca8 <_tx_thread_current_ptr>
   44b48:	0004b537          	lui	a0,0x4b
   44b4c:	c5050513          	add	a0,a0,-944 # 4ac50 <__clz_tab+0x19c>
   44b50:	548c                	lw	a1,40(s1)
   44b52:	c64e                	sw	s3,12(sp)
   44b54:	c452                	sw	s4,8(sp)
   44b56:	c256                	sw	s5,4(sp)
   44b58:	345010ef          	jal	4669c <iprintf>
   44b5c:	44cc                	lw	a1,12(s1)
   44b5e:	0004b537          	lui	a0,0x4b
   44b62:	c6c50513          	add	a0,a0,-916 # 4ac6c <__clz_tab+0x1b8>
   44b66:	337010ef          	jal	4669c <iprintf>
   44b6a:	48dc                	lw	a5,20(s1)
   44b6c:	44cc                	lw	a1,12(s1)
   44b6e:	0004b537          	lui	a0,0x4b
   44b72:	c8c50513          	add	a0,a0,-884 # 4ac8c <__clz_tab+0x1d8>
   44b76:	95be                	add	a1,a1,a5
   44b78:	325010ef          	jal	4669c <iprintf>
   44b7c:	0004b537          	lui	a0,0x4b
   44b80:	cb050513          	add	a0,a0,-848 # 4acb0 <__clz_tab+0x1fc>
   44b84:	319010ef          	jal	4669c <iprintf>
   44b88:	4401                	li	s0,0
   44b8a:	0004ba37          	lui	s4,0x4b
   44b8e:	0004bab7          	lui	s5,0x4b
   44b92:	498d                	li	s3,3
   44b94:	0b400913          	li	s2,180
   44b98:	a029                	j	44ba2 <threadx_exception_handler+0xb0>
   44b9a:	0405                	add	s0,s0,1
   44b9c:	0491                	add	s1,s1,4
   44b9e:	03240463          	beq	s0,s2,44bc6 <threadx_exception_handler+0xd4>
   44ba2:	4090                	lw	a2,0(s1)
   44ba4:	85a2                	mv	a1,s0
   44ba6:	d08a0513          	add	a0,s4,-760 # 4ad08 <__clz_tab+0x254>
   44baa:	2f3010ef          	jal	4669c <iprintf>
   44bae:	00347793          	and	a5,s0,3
   44bb2:	ff3794e3          	bne	a5,s3,44b9a <threadx_exception_handler+0xa8>
   44bb6:	d18a8513          	add	a0,s5,-744 # 4ad18 <__clz_tab+0x264>
   44bba:	0405                	add	s0,s0,1
   44bbc:	2e1010ef          	jal	4669c <iprintf>
   44bc0:	0491                	add	s1,s1,4
   44bc2:	ff2410e3          	bne	s0,s2,44ba2 <threadx_exception_handler+0xb0>
   44bc6:	49b2                	lw	s3,12(sp)
   44bc8:	4a22                	lw	s4,8(sp)
   44bca:	4a92                	lw	s5,4(sp)
   44bcc:	bf9d                	j	44b42 <threadx_exception_handler+0x50>

00044bce <_tx_initialize_high_level>:
   44bce:	1141                	add	sp,sp,-16
   44bd0:	c606                	sw	ra,12(sp)
   44bd2:	2ad5                	jal	44dc6 <_tx_thread_initialize>
   44bd4:	019000ef          	jal	453ec <_tx_timer_initialize>
   44bd8:	4801a023          	sw	zero,1152(gp) # 12d0c80 <_tx_semaphore_created_ptr>
   44bdc:	4601ae23          	sw	zero,1148(gp) # 12d0c7c <_tx_semaphore_created_count>
   44be0:	4601ac23          	sw	zero,1144(gp) # 12d0c78 <_tx_queue_created_ptr>
   44be4:	4601aa23          	sw	zero,1140(gp) # 12d0c74 <_tx_queue_created_count>
   44be8:	4601a823          	sw	zero,1136(gp) # 12d0c70 <_tx_event_flags_created_ptr>
   44bec:	4601a623          	sw	zero,1132(gp) # 12d0c6c <_tx_event_flags_created_count>
   44bf0:	4601a023          	sw	zero,1120(gp) # 12d0c60 <_tx_block_pool_created_ptr>
   44bf4:	4401ae23          	sw	zero,1116(gp) # 12d0c5c <_tx_block_pool_created_count>
   44bf8:	4401ac23          	sw	zero,1112(gp) # 12d0c58 <_tx_byte_pool_created_ptr>
   44bfc:	40b2                	lw	ra,12(sp)
   44bfe:	4401aa23          	sw	zero,1108(gp) # 12d0c54 <_tx_byte_pool_created_count>
   44c02:	4601a423          	sw	zero,1128(gp) # 12d0c68 <_tx_mutex_created_ptr>
   44c06:	4601a223          	sw	zero,1124(gp) # 12d0c64 <_tx_mutex_created_count>
   44c0a:	0141                	add	sp,sp,16
   44c0c:	8082                	ret

00044c0e <_tx_initialize_kernel_enter>:
   44c0e:	1141                	add	sp,sp,-16
   44c10:	c422                	sw	s0,8(sp)
   44c12:	9cc1a703          	lw	a4,-1588(gp) # 12d01cc <_tx_thread_system_state>
   44c16:	f0f0f7b7          	lui	a5,0xf0f0f
   44c1a:	c606                	sw	ra,12(sp)
   44c1c:	0f178793          	add	a5,a5,241 # f0f0f0f1 <__share_mem_end__+0xefc0f0f1>
   44c20:	00f70b63          	beq	a4,a5,44c36 <_tx_initialize_kernel_enter+0x28>
   44c24:	f0f0f7b7          	lui	a5,0xf0f0f
   44c28:	0f078793          	add	a5,a5,240 # f0f0f0f0 <__share_mem_end__+0xefc0f0f0>
   44c2c:	9cf1a623          	sw	a5,-1588(gp) # 12d01cc <_tx_thread_system_state>
   44c30:	842ff0ef          	jal	43c72 <_tx_initialize_low_level>
   44c34:	3f69                	jal	44bce <_tx_initialize_high_level>
   44c36:	4501a503          	lw	a0,1104(gp) # 12d0c50 <_tx_initialize_unused_memory>
   44c3a:	f0f0f7b7          	lui	a5,0xf0f0f
   44c3e:	0f078793          	add	a5,a5,240 # f0f0f0f0 <__share_mem_end__+0xefc0f0f0>
   44c42:	9cf1a623          	sw	a5,-1588(gp) # 12d01cc <_tx_thread_system_state>
   44c46:	917fe0ef          	jal	4355c <tx_application_define>
   44c4a:	9c01a623          	sw	zero,-1588(gp) # 12d01cc <_tx_thread_system_state>
   44c4e:	4422                	lw	s0,8(sp)
   44c50:	40b2                	lw	ra,12(sp)
   44c52:	0141                	add	sp,sp,16
   44c54:	a59fb06f          	j	406ac <_tx_thread_schedule>

00044c58 <_tx_thread_create>:
   44c58:	7179                	add	sp,sp,-48
   44c5a:	d422                	sw	s0,40(sp)
   44c5c:	c65e                	sw	s7,12(sp)
   44c5e:	842a                	mv	s0,a0
   44c60:	c462                	sw	s8,8(sp)
   44c62:	853a                	mv	a0,a4
   44c64:	8c2e                	mv	s8,a1
   44c66:	8bb2                	mv	s7,a2
   44c68:	0ef00593          	li	a1,239
   44c6c:	863e                	mv	a2,a5
   44c6e:	d606                	sw	ra,44(sp)
   44c70:	d226                	sw	s1,36(sp)
   44c72:	d04a                	sw	s2,32(sp)
   44c74:	84be                	mv	s1,a5
   44c76:	893a                	mv	s2,a4
   44c78:	ce4e                	sw	s3,28(sp)
   44c7a:	cc52                	sw	s4,24(sp)
   44c7c:	89c6                	mv	s3,a7
   44c7e:	8a42                	mv	s4,a6
   44c80:	ca56                	sw	s5,20(sp)
   44c82:	c85a                	sw	s6,16(sp)
   44c84:	5ac2                	lw	s5,48(sp)
   44c86:	8b36                	mv	s6,a3
   44c88:	a1cfe0ef          	jal	42ea4 <memset>
   44c8c:	0b400613          	li	a2,180
   44c90:	4581                	li	a1,0
   44c92:	8522                	mv	a0,s0
   44c94:	a10fe0ef          	jal	42ea4 <memset>
   44c98:	fff48793          	add	a5,s1,-1
   44c9c:	97ca                	add	a5,a5,s2
   44c9e:	c81c                	sw	a5,16(s0)
   44ca0:	478d                	li	a5,3
   44ca2:	d81c                	sw	a5,48(s0)
   44ca4:	000457b7          	lui	a5,0x45
   44ca8:	02000713          	li	a4,32
   44cac:	35678793          	add	a5,a5,854 # 45356 <_tx_thread_timeout>
   44cb0:	000455b7          	lui	a1,0x45
   44cb4:	08e42e23          	sw	a4,156(s0)
   44cb8:	c87c                	sw	a5,84(s0)
   44cba:	e2258593          	add	a1,a1,-478 # 44e22 <_tx_thread_shell_entry>
   44cbe:	c844                	sw	s1,20(s0)
   44cc0:	8522                	mv	a0,s0
   44cc2:	03842423          	sw	s8,40(s0)
   44cc6:	05742223          	sw	s7,68(s0)
   44cca:	05642423          	sw	s6,72(s0)
   44cce:	01242623          	sw	s2,12(s0)
   44cd2:	03442623          	sw	s4,44(s0)
   44cd6:	09442a23          	sw	s4,148(s0)
   44cda:	01542c23          	sw	s5,24(s0)
   44cde:	01542e23          	sw	s5,28(s0)
   44ce2:	03342e23          	sw	s3,60(s0)
   44ce6:	09342c23          	sw	s3,152(s0)
   44cea:	cc20                	sw	s0,88(s0)
   44cec:	a95fb0ef          	jal	40780 <_tx_thread_stack_build>
   44cf0:	c45fb0ef          	jal	40934 <__get_interrupt_state>
   44cf4:	84aa                	mv	s1,a0
   44cf6:	c37fb0ef          	jal	4092c <__disable_interrupt>
   44cfa:	49c1a783          	lw	a5,1180(gp) # 12d0c9c <_tx_thread_created_count>
   44cfe:	54485737          	lui	a4,0x54485
   44d02:	24470713          	add	a4,a4,580 # 54485244 <__share_mem_end__+0x53185244>
   44d06:	c018                	sw	a4,0(s0)
   44d08:	e3c1                	bnez	a5,44d88 <_tx_thread_create+0x130>
   44d0a:	4a81a023          	sw	s0,1184(gp) # 12d0ca0 <_tx_thread_created_ptr>
   44d0e:	08842423          	sw	s0,136(s0)
   44d12:	08842623          	sw	s0,140(s0)
   44d16:	48c1a703          	lw	a4,1164(gp) # 12d0c8c <_tx_thread_preempt_disable>
   44d1a:	0785                	add	a5,a5,1
   44d1c:	48f1ae23          	sw	a5,1180(gp) # 12d0c9c <_tx_thread_created_count>
   44d20:	00170793          	add	a5,a4,1
   44d24:	5752                	lw	a4,52(sp)
   44d26:	48f1a623          	sw	a5,1164(gp) # 12d0c8c <_tx_thread_preempt_disable>
   44d2a:	4785                	li	a5,1
   44d2c:	06f71b63          	bne	a4,a5,44da2 <_tx_thread_create+0x14a>
   44d30:	9cc1a703          	lw	a4,-1588(gp) # 12d01cc <_tx_thread_system_state>
   44d34:	f0f0f7b7          	lui	a5,0xf0f0f
   44d38:	0ef78793          	add	a5,a5,239 # f0f0f0ef <__share_mem_end__+0xefc0f0ef>
   44d3c:	02e7e463          	bltu	a5,a4,44d64 <_tx_thread_create+0x10c>
   44d40:	8526                	mv	a0,s1
   44d42:	bfbfb0ef          	jal	4093c <__set_interrupt_state>
   44d46:	8522                	mv	a0,s0
   44d48:	2af5                	jal	44f44 <_tx_thread_system_resume>
   44d4a:	50b2                	lw	ra,44(sp)
   44d4c:	5422                	lw	s0,40(sp)
   44d4e:	5492                	lw	s1,36(sp)
   44d50:	5902                	lw	s2,32(sp)
   44d52:	49f2                	lw	s3,28(sp)
   44d54:	4a62                	lw	s4,24(sp)
   44d56:	4ad2                	lw	s5,20(sp)
   44d58:	4b42                	lw	s6,16(sp)
   44d5a:	4bb2                	lw	s7,12(sp)
   44d5c:	4c22                	lw	s8,8(sp)
   44d5e:	4501                	li	a0,0
   44d60:	6145                	add	sp,sp,48
   44d62:	8082                	ret
   44d64:	4a41a903          	lw	s2,1188(gp) # 12d0ca4 <_tx_thread_execute_ptr>
   44d68:	fc090ce3          	beqz	s2,44d40 <_tx_thread_create+0xe8>
   44d6c:	02c92783          	lw	a5,44(s2)
   44d70:	03c92983          	lw	s3,60(s2)
   44d74:	8526                	mv	a0,s1
   44d76:	02f92e23          	sw	a5,60(s2)
   44d7a:	bc3fb0ef          	jal	4093c <__set_interrupt_state>
   44d7e:	8522                	mv	a0,s0
   44d80:	22d1                	jal	44f44 <_tx_thread_system_resume>
   44d82:	03392e23          	sw	s3,60(s2)
   44d86:	b7d1                	j	44d4a <_tx_thread_create+0xf2>
   44d88:	4a01a703          	lw	a4,1184(gp) # 12d0ca0 <_tx_thread_created_ptr>
   44d8c:	08c72603          	lw	a2,140(a4)
   44d90:	08872623          	sw	s0,140(a4)
   44d94:	08862423          	sw	s0,136(a2) # e4002088 <__share_mem_end__+0xe2d02088>
   44d98:	08c42623          	sw	a2,140(s0)
   44d9c:	08e42423          	sw	a4,136(s0)
   44da0:	bf9d                	j	44d16 <_tx_thread_create+0xbe>
   44da2:	8526                	mv	a0,s1
   44da4:	b99fb0ef          	jal	4093c <__set_interrupt_state>
   44da8:	b8dfb0ef          	jal	40934 <__get_interrupt_state>
   44dac:	842a                	mv	s0,a0
   44dae:	b7ffb0ef          	jal	4092c <__disable_interrupt>
   44db2:	48c1a783          	lw	a5,1164(gp) # 12d0c8c <_tx_thread_preempt_disable>
   44db6:	8522                	mv	a0,s0
   44db8:	17fd                	add	a5,a5,-1
   44dba:	48f1a623          	sw	a5,1164(gp) # 12d0c8c <_tx_thread_preempt_disable>
   44dbe:	b7ffb0ef          	jal	4093c <__set_interrupt_state>
   44dc2:	2295                	jal	44f26 <_tx_thread_system_preempt_check>
   44dc4:	b759                	j	44d4a <_tx_thread_create+0xf2>

00044dc6 <_tx_thread_initialize>:
   44dc6:	1141                	add	sp,sp,-16
   44dc8:	4611                	li	a2,4
   44dca:	4581                	li	a1,0
   44dcc:	4a01a423          	sw	zero,1192(gp) # 12d0ca8 <_tx_thread_current_ptr>
   44dd0:	49818513          	add	a0,gp,1176 # 12d0c98 <_tx_thread_priority_maps>
   44dd4:	c606                	sw	ra,12(sp)
   44dd6:	4a01a223          	sw	zero,1188(gp) # 12d0ca4 <_tx_thread_execute_ptr>
   44dda:	8cafe0ef          	jal	42ea4 <memset>
   44dde:	4611                	li	a2,4
   44de0:	4581                	li	a1,0
   44de2:	49418513          	add	a0,gp,1172 # 12d0c94 <_tx_thread_preempted_maps>
   44de6:	8befe0ef          	jal	42ea4 <memset>
   44dea:	02000713          	li	a4,32
   44dee:	08000613          	li	a2,128
   44df2:	4581                	li	a1,0
   44df4:	e8c18513          	add	a0,gp,-372 # 12d068c <_tx_thread_priority_list>
   44df8:	48e1a823          	sw	a4,1168(gp) # 12d0c90 <_tx_thread_highest_priority>
   44dfc:	8a8fe0ef          	jal	42ea4 <memset>
   44e00:	4841a783          	lw	a5,1156(gp) # 12d0c84 <_tx_build_options>
   44e04:	4a01a023          	sw	zero,1184(gp) # 12d0ca0 <_tx_thread_created_ptr>
   44e08:	40b2                	lw	ra,12(sp)
   44e0a:	4801ae23          	sw	zero,1180(gp) # 12d0c9c <_tx_thread_created_count>
   44e0e:	4801a623          	sw	zero,1164(gp) # 12d0c8c <_tx_thread_preempt_disable>
   44e12:	4801a423          	sw	zero,1160(gp) # 12d0c88 <_tx_thread_mutex_release>
   44e16:	29879793          	bset	a5,a5,0x18
   44e1a:	48f1a223          	sw	a5,1156(gp) # 12d0c84 <_tx_build_options>
   44e1e:	0141                	add	sp,sp,16
   44e20:	8082                	ret

00044e22 <_tx_thread_shell_entry>:
   44e22:	1141                	add	sp,sp,-16
   44e24:	c422                	sw	s0,8(sp)
   44e26:	4a81a403          	lw	s0,1192(gp) # 12d0ca8 <_tx_thread_current_ptr>
   44e2a:	c606                	sw	ra,12(sp)
   44e2c:	c226                	sw	s1,4(sp)
   44e2e:	b07fb0ef          	jal	40934 <__get_interrupt_state>
   44e32:	84aa                	mv	s1,a0
   44e34:	af9fb0ef          	jal	4092c <__disable_interrupt>
   44e38:	8526                	mv	a0,s1
   44e3a:	0ac42483          	lw	s1,172(s0)
   44e3e:	afffb0ef          	jal	4093c <__set_interrupt_state>
   44e42:	c481                	beqz	s1,44e4a <_tx_thread_shell_entry+0x28>
   44e44:	4581                	li	a1,0
   44e46:	8522                	mv	a0,s0
   44e48:	9482                	jalr	s1
   44e4a:	407c                	lw	a5,68(s0)
   44e4c:	4428                	lw	a0,72(s0)
   44e4e:	9782                	jalr	a5
   44e50:	4881a783          	lw	a5,1160(gp) # 12d0c88 <_tx_thread_mutex_release>
   44e54:	c399                	beqz	a5,44e5a <_tx_thread_shell_entry+0x38>
   44e56:	8522                	mv	a0,s0
   44e58:	9782                	jalr	a5
   44e5a:	adbfb0ef          	jal	40934 <__get_interrupt_state>
   44e5e:	84aa                	mv	s1,a0
   44e60:	acdfb0ef          	jal	4092c <__disable_interrupt>
   44e64:	48c1a783          	lw	a5,1164(gp) # 12d0c8c <_tx_thread_preempt_disable>
   44e68:	8526                	mv	a0,s1
   44e6a:	0ac42483          	lw	s1,172(s0)
   44e6e:	4685                	li	a3,1
   44e70:	0785                	add	a5,a5,1
   44e72:	d814                	sw	a3,48(s0)
   44e74:	dc14                	sw	a3,56(s0)
   44e76:	04042623          	sw	zero,76(s0)
   44e7a:	48f1a623          	sw	a5,1164(gp) # 12d0c8c <_tx_thread_preempt_disable>
   44e7e:	abffb0ef          	jal	4093c <__set_interrupt_state>
   44e82:	c481                	beqz	s1,44e8a <_tx_thread_shell_entry+0x68>
   44e84:	4585                	li	a1,1
   44e86:	8522                	mv	a0,s0
   44e88:	9482                	jalr	s1
   44e8a:	8522                	mv	a0,s0
   44e8c:	4422                	lw	s0,8(sp)
   44e8e:	40b2                	lw	ra,12(sp)
   44e90:	4492                	lw	s1,4(sp)
   44e92:	0141                	add	sp,sp,16
   44e94:	aa5d                	j	4504a <_tx_thread_system_suspend>

00044e96 <_tx_thread_sleep>:
   44e96:	1141                	add	sp,sp,-16
   44e98:	c606                	sw	ra,12(sp)
   44e9a:	c422                	sw	s0,8(sp)
   44e9c:	c226                	sw	s1,4(sp)
   44e9e:	c04a                	sw	s2,0(sp)
   44ea0:	892a                	mv	s2,a0
   44ea2:	a93fb0ef          	jal	40934 <__get_interrupt_state>
   44ea6:	84aa                	mv	s1,a0
   44ea8:	a85fb0ef          	jal	4092c <__disable_interrupt>
   44eac:	4a81a403          	lw	s0,1192(gp) # 12d0ca8 <_tx_thread_current_ptr>
   44eb0:	c439                	beqz	s0,44efe <_tx_thread_sleep+0x68>
   44eb2:	9cc1a783          	lw	a5,-1588(gp) # 12d01cc <_tx_thread_system_state>
   44eb6:	e7a1                	bnez	a5,44efe <_tx_thread_sleep+0x68>
   44eb8:	30c18793          	add	a5,gp,780 # 12d0b0c <_tx_timer_thread>
   44ebc:	04f40163          	beq	s0,a5,44efe <_tx_thread_sleep+0x68>
   44ec0:	04090963          	beqz	s2,44f12 <_tx_thread_sleep+0x7c>
   44ec4:	48c1a703          	lw	a4,1164(gp) # 12d0c8c <_tx_thread_preempt_disable>
   44ec8:	eb1d                	bnez	a4,44efe <_tx_thread_sleep+0x68>
   44eca:	48c1a703          	lw	a4,1164(gp) # 12d0c8c <_tx_thread_preempt_disable>
   44ece:	4691                	li	a3,4
   44ed0:	d814                	sw	a3,48(s0)
   44ed2:	4685                	li	a3,1
   44ed4:	0705                	add	a4,a4,1
   44ed6:	dc14                	sw	a3,56(s0)
   44ed8:	05242623          	sw	s2,76(s0)
   44edc:	8526                	mv	a0,s1
   44ede:	08042223          	sw	zero,132(s0)
   44ee2:	48e1a623          	sw	a4,1164(gp) # 12d0c8c <_tx_thread_preempt_disable>
   44ee6:	a57fb0ef          	jal	4093c <__set_interrupt_state>
   44eea:	8522                	mv	a0,s0
   44eec:	2ab9                	jal	4504a <_tx_thread_system_suspend>
   44eee:	08442503          	lw	a0,132(s0)
   44ef2:	40b2                	lw	ra,12(sp)
   44ef4:	4422                	lw	s0,8(sp)
   44ef6:	4492                	lw	s1,4(sp)
   44ef8:	4902                	lw	s2,0(sp)
   44efa:	0141                	add	sp,sp,16
   44efc:	8082                	ret
   44efe:	8526                	mv	a0,s1
   44f00:	a3dfb0ef          	jal	4093c <__set_interrupt_state>
   44f04:	40b2                	lw	ra,12(sp)
   44f06:	4422                	lw	s0,8(sp)
   44f08:	4492                	lw	s1,4(sp)
   44f0a:	4902                	lw	s2,0(sp)
   44f0c:	454d                	li	a0,19
   44f0e:	0141                	add	sp,sp,16
   44f10:	8082                	ret
   44f12:	8526                	mv	a0,s1
   44f14:	a29fb0ef          	jal	4093c <__set_interrupt_state>
   44f18:	40b2                	lw	ra,12(sp)
   44f1a:	4422                	lw	s0,8(sp)
   44f1c:	4492                	lw	s1,4(sp)
   44f1e:	4902                	lw	s2,0(sp)
   44f20:	4501                	li	a0,0
   44f22:	0141                	add	sp,sp,16
   44f24:	8082                	ret

00044f26 <_tx_thread_system_preempt_check>:
   44f26:	48c1a703          	lw	a4,1164(gp) # 12d0c8c <_tx_thread_preempt_disable>
   44f2a:	9cc1a783          	lw	a5,-1588(gp) # 12d01cc <_tx_thread_system_state>
   44f2e:	8fd9                	or	a5,a5,a4
   44f30:	eb89                	bnez	a5,44f42 <_tx_thread_system_preempt_check+0x1c>
   44f32:	4a81a703          	lw	a4,1192(gp) # 12d0ca8 <_tx_thread_current_ptr>
   44f36:	4a41a783          	lw	a5,1188(gp) # 12d0ca4 <_tx_thread_execute_ptr>
   44f3a:	00f70463          	beq	a4,a5,44f42 <_tx_thread_system_preempt_check+0x1c>
   44f3e:	8dffb06f          	j	4081c <_tx_thread_system_return>
   44f42:	8082                	ret

00044f44 <_tx_thread_system_resume>:
   44f44:	1101                	add	sp,sp,-32
   44f46:	ce06                	sw	ra,28(sp)
   44f48:	cc22                	sw	s0,24(sp)
   44f4a:	ca26                	sw	s1,20(sp)
   44f4c:	842a                	mv	s0,a0
   44f4e:	c84a                	sw	s2,16(sp)
   44f50:	c64e                	sw	s3,12(sp)
   44f52:	9e3fb0ef          	jal	40934 <__get_interrupt_state>
   44f56:	84aa                	mv	s1,a0
   44f58:	9d5fb0ef          	jal	4092c <__disable_interrupt>
   44f5c:	507c                	lw	a5,100(s0)
   44f5e:	c7d9                	beqz	a5,44fec <_tx_thread_system_resume+0xa8>
   44f60:	04c40513          	add	a0,s0,76
   44f64:	2b41                	jal	454f4 <_tx_timer_system_deactivate>
   44f66:	48c1a783          	lw	a5,1164(gp) # 12d0c8c <_tx_thread_preempt_disable>
   44f6a:	5c14                	lw	a3,56(s0)
   44f6c:	5818                	lw	a4,48(s0)
   44f6e:	17fd                	add	a5,a5,-1
   44f70:	48f1a623          	sw	a5,1164(gp) # 12d0c8c <_tx_thread_preempt_disable>
   44f74:	e2ad                	bnez	a3,44fd6 <_tx_thread_system_resume+0x92>
   44f76:	e71d                	bnez	a4,44fa4 <_tx_thread_system_resume+0x60>
   44f78:	8526                	mv	a0,s1
   44f7a:	4a81a403          	lw	s0,1192(gp) # 12d0ca8 <_tx_thread_current_ptr>
   44f7e:	9bffb0ef          	jal	4093c <__set_interrupt_state>
   44f82:	4a41a783          	lw	a5,1188(gp) # 12d0ca4 <_tx_thread_execute_ptr>
   44f86:	00878863          	beq	a5,s0,44f96 <_tx_thread_system_resume+0x52>
   44f8a:	48c1a703          	lw	a4,1164(gp) # 12d0c8c <_tx_thread_preempt_disable>
   44f8e:	9cc1a783          	lw	a5,-1588(gp) # 12d01cc <_tx_thread_system_state>
   44f92:	8fd9                	or	a5,a5,a4
   44f94:	cb8d                	beqz	a5,44fc6 <_tx_thread_system_resume+0x82>
   44f96:	40f2                	lw	ra,28(sp)
   44f98:	4462                	lw	s0,24(sp)
   44f9a:	44d2                	lw	s1,20(sp)
   44f9c:	4942                	lw	s2,16(sp)
   44f9e:	49b2                	lw	s3,12(sp)
   44fa0:	6105                	add	sp,sp,32
   44fa2:	8082                	ret
   44fa4:	585c                	lw	a5,52(s0)
   44fa6:	ef95                	bnez	a5,44fe2 <_tx_thread_system_resume+0x9e>
   44fa8:	5454                	lw	a3,44(s0)
   44faa:	e8c18793          	add	a5,gp,-372 # 12d068c <_tx_thread_priority_list>
   44fae:	20f6c7b3          	sh2add	a5,a3,a5
   44fb2:	4398                	lw	a4,0(a5)
   44fb4:	02042823          	sw	zero,48(s0)
   44fb8:	c331                	beqz	a4,44ffc <_tx_thread_system_resume+0xb8>
   44fba:	535c                	lw	a5,36(a4)
   44fbc:	d380                	sw	s0,32(a5)
   44fbe:	d340                	sw	s0,36(a4)
   44fc0:	d05c                	sw	a5,36(s0)
   44fc2:	d018                	sw	a4,32(s0)
   44fc4:	bf55                	j	44f78 <_tx_thread_system_resume+0x34>
   44fc6:	4462                	lw	s0,24(sp)
   44fc8:	40f2                	lw	ra,28(sp)
   44fca:	44d2                	lw	s1,20(sp)
   44fcc:	4942                	lw	s2,16(sp)
   44fce:	49b2                	lw	s3,12(sp)
   44fd0:	6105                	add	sp,sp,32
   44fd2:	84bfb06f          	j	4081c <_tx_thread_system_return>
   44fd6:	177d                	add	a4,a4,-1
   44fd8:	4785                	li	a5,1
   44fda:	f8e7ffe3          	bgeu	a5,a4,44f78 <_tx_thread_system_resume+0x34>
   44fde:	585c                	lw	a5,52(s0)
   44fe0:	cb89                	beqz	a5,44ff2 <_tx_thread_system_resume+0xae>
   44fe2:	478d                	li	a5,3
   44fe4:	02042a23          	sw	zero,52(s0)
   44fe8:	d81c                	sw	a5,48(s0)
   44fea:	b779                	j	44f78 <_tx_thread_system_resume+0x34>
   44fec:	04042623          	sw	zero,76(s0)
   44ff0:	bf9d                	j	44f66 <_tx_thread_system_resume+0x22>
   44ff2:	02042c23          	sw	zero,56(s0)
   44ff6:	02042823          	sw	zero,48(s0)
   44ffa:	bfbd                	j	44f78 <_tx_thread_system_resume+0x34>
   44ffc:	4981a703          	lw	a4,1176(gp) # 12d0c98 <_tx_thread_priority_maps>
   45000:	4901a503          	lw	a0,1168(gp) # 12d0c90 <_tx_thread_highest_priority>
   45004:	c380                	sw	s0,0(a5)
   45006:	d000                	sw	s0,32(s0)
   45008:	28d717b3          	bset	a5,a4,a3
   4500c:	d040                	sw	s0,36(s0)
   4500e:	48f1ac23          	sw	a5,1176(gp) # 12d0c98 <_tx_thread_priority_maps>
   45012:	f6a6f3e3          	bgeu	a3,a0,44f78 <_tx_thread_system_resume+0x34>
   45016:	4a41a783          	lw	a5,1188(gp) # 12d0ca4 <_tx_thread_execute_ptr>
   4501a:	48d1a823          	sw	a3,1168(gp) # 12d0c90 <_tx_thread_highest_priority>
   4501e:	c39d                	beqz	a5,45044 <_tx_thread_system_resume+0x100>
   45020:	5fd8                	lw	a4,60(a5)
   45022:	f4e6fbe3          	bgeu	a3,a4,44f78 <_tx_thread_system_resume+0x34>
   45026:	57dc                	lw	a5,44(a5)
   45028:	00f70863          	beq	a4,a5,45038 <_tx_thread_system_resume+0xf4>
   4502c:	4941a703          	lw	a4,1172(gp) # 12d0c94 <_tx_thread_preempted_maps>
   45030:	28f717b3          	bset	a5,a4,a5
   45034:	48f1aa23          	sw	a5,1172(gp) # 12d0c94 <_tx_thread_preempted_maps>
   45038:	8526                	mv	a0,s1
   4503a:	4a81a223          	sw	s0,1188(gp) # 12d0ca4 <_tx_thread_execute_ptr>
   4503e:	8fffb0ef          	jal	4093c <__set_interrupt_state>
   45042:	b7a1                	j	44f8a <_tx_thread_system_resume+0x46>
   45044:	4a81a223          	sw	s0,1188(gp) # 12d0ca4 <_tx_thread_execute_ptr>
   45048:	bf05                	j	44f78 <_tx_thread_system_resume+0x34>

0004504a <_tx_thread_system_suspend>:
   4504a:	1101                	add	sp,sp,-32
   4504c:	c256                	sw	s5,4(sp)
   4504e:	4a81aa83          	lw	s5,1192(gp) # 12d0ca8 <_tx_thread_current_ptr>
   45052:	cc22                	sw	s0,24(sp)
   45054:	c452                	sw	s4,8(sp)
   45056:	ce06                	sw	ra,28(sp)
   45058:	ca26                	sw	s1,20(sp)
   4505a:	c84a                	sw	s2,16(sp)
   4505c:	842a                	mv	s0,a0
   4505e:	8d7fb0ef          	jal	40934 <__get_interrupt_state>
   45062:	8a2a                	mv	s4,a0
   45064:	8c9fb0ef          	jal	4092c <__disable_interrupt>
   45068:	068a8763          	beq	s5,s0,450d6 <_tx_thread_system_suspend+0x8c>
   4506c:	48c1a783          	lw	a5,1164(gp) # 12d0c8c <_tx_thread_preempt_disable>
   45070:	5c14                	lw	a3,56(s0)
   45072:	4705                	li	a4,1
   45074:	17fd                	add	a5,a5,-1
   45076:	48f1a623          	sw	a5,1164(gp) # 12d0c8c <_tx_thread_preempt_disable>
   4507a:	04e69d63          	bne	a3,a4,450d4 <_tx_thread_system_suspend+0x8a>
   4507e:	501c                	lw	a5,32(s0)
   45080:	c64e                	sw	s3,12(sp)
   45082:	02042c23          	sw	zero,56(s0)
   45086:	5458                	lw	a4,44(s0)
   45088:	0af40163          	beq	s0,a5,4512a <_tx_thread_system_suspend+0xe0>
   4508c:	5054                	lw	a3,36(s0)
   4508e:	e8c18993          	add	s3,gp,-372 # 12d068c <_tx_thread_priority_list>
   45092:	21374633          	sh2add	a2,a4,s3
   45096:	420c                	lw	a1,0(a2)
   45098:	d3d4                	sw	a3,36(a5)
   4509a:	d29c                	sw	a5,32(a3)
   4509c:	0c858d63          	beq	a1,s0,45176 <_tx_thread_system_suspend+0x12c>
   450a0:	4a41a783          	lw	a5,1188(gp) # 12d0ca4 <_tx_thread_execute_ptr>
   450a4:	04878663          	beq	a5,s0,450f0 <_tx_thread_system_suspend+0xa6>
   450a8:	49b2                	lw	s3,12(sp)
   450aa:	8552                	mv	a0,s4
   450ac:	891fb0ef          	jal	4093c <__set_interrupt_state>
   450b0:	4a41a783          	lw	a5,1188(gp) # 12d0ca4 <_tx_thread_execute_ptr>
   450b4:	01578863          	beq	a5,s5,450c4 <_tx_thread_system_suspend+0x7a>
   450b8:	48c1a703          	lw	a4,1164(gp) # 12d0c8c <_tx_thread_preempt_disable>
   450bc:	9cc1a783          	lw	a5,-1588(gp) # 12d01cc <_tx_thread_system_state>
   450c0:	8fd9                	or	a5,a5,a4
   450c2:	cbb9                	beqz	a5,45118 <_tx_thread_system_suspend+0xce>
   450c4:	40f2                	lw	ra,28(sp)
   450c6:	4462                	lw	s0,24(sp)
   450c8:	44d2                	lw	s1,20(sp)
   450ca:	4942                	lw	s2,16(sp)
   450cc:	4a22                	lw	s4,8(sp)
   450ce:	4a92                	lw	s5,4(sp)
   450d0:	6105                	add	sp,sp,32
   450d2:	8082                	ret
   450d4:	bfd9                	j	450aa <_tx_thread_system_suspend+0x60>
   450d6:	04caa783          	lw	a5,76(s5)
   450da:	5775                	li	a4,-3
   450dc:	17fd                	add	a5,a5,-1
   450de:	00f76563          	bltu	a4,a5,450e8 <_tx_thread_system_suspend+0x9e>
   450e2:	04ca8513          	add	a0,s5,76
   450e6:	2e75                	jal	454a2 <_tx_timer_system_activate>
   450e8:	4c58                	lw	a4,28(s0)
   450ea:	4ae1a823          	sw	a4,1200(gp) # 12d0cb0 <_tx_timer_time_slice>
   450ee:	bfbd                	j	4506c <_tx_thread_system_suspend+0x22>
   450f0:	4901a783          	lw	a5,1168(gp) # 12d0c90 <_tx_thread_highest_priority>
   450f4:	4941a703          	lw	a4,1172(gp) # 12d0c94 <_tx_thread_preempted_maps>
   450f8:	2137c7b3          	sh2add	a5,a5,s3
   450fc:	439c                	lw	a5,0(a5)
   450fe:	4af1a223          	sw	a5,1188(gp) # 12d0ca4 <_tx_thread_execute_ptr>
   45102:	eb79                	bnez	a4,451d8 <_tx_thread_system_suspend+0x18e>
   45104:	8552                	mv	a0,s4
   45106:	837fb0ef          	jal	4093c <__set_interrupt_state>
   4510a:	48c1a703          	lw	a4,1164(gp) # 12d0c8c <_tx_thread_preempt_disable>
   4510e:	9cc1a783          	lw	a5,-1588(gp) # 12d01cc <_tx_thread_system_state>
   45112:	49b2                	lw	s3,12(sp)
   45114:	8fd9                	or	a5,a5,a4
   45116:	f7dd                	bnez	a5,450c4 <_tx_thread_system_suspend+0x7a>
   45118:	4462                	lw	s0,24(sp)
   4511a:	40f2                	lw	ra,28(sp)
   4511c:	44d2                	lw	s1,20(sp)
   4511e:	4942                	lw	s2,16(sp)
   45120:	4a22                	lw	s4,8(sp)
   45122:	4a92                	lw	s5,4(sp)
   45124:	6105                	add	sp,sp,32
   45126:	ef6fb06f          	j	4081c <_tx_thread_system_return>
   4512a:	4981a683          	lw	a3,1176(gp) # 12d0c98 <_tx_thread_priority_maps>
   4512e:	4941a503          	lw	a0,1172(gp) # 12d0c94 <_tx_thread_preempted_maps>
   45132:	e8c18993          	add	s3,gp,-372 # 12d068c <_tx_thread_priority_list>
   45136:	28e017b3          	bset	a5,zero,a4
   4513a:	21374733          	sh2add	a4,a4,s3
   4513e:	40f6f6b3          	andn	a3,a3,a5
   45142:	00072023          	sw	zero,0(a4)
   45146:	48d1ac23          	sw	a3,1176(gp) # 12d0c98 <_tx_thread_priority_maps>
   4514a:	fff7c793          	not	a5,a5
   4514e:	c501                	beqz	a0,45156 <_tx_thread_system_suspend+0x10c>
   45150:	8fe9                	and	a5,a5,a0
   45152:	48f1aa23          	sw	a5,1172(gp) # 12d0c94 <_tx_thread_preempted_maps>
   45156:	c2fd                	beqz	a3,4523c <_tx_thread_system_suspend+0x1f2>
   45158:	40d007b3          	neg	a5,a3
   4515c:	8ff5                	and	a5,a5,a3
   4515e:	473d                	li	a4,15
   45160:	02f76563          	bltu	a4,a5,4518a <_tx_thread_system_suspend+0x140>
   45164:	468d                	li	a3,3
   45166:	4701                	li	a4,0
   45168:	06f6e563          	bltu	a3,a5,451d2 <_tx_thread_system_suspend+0x188>
   4516c:	8385                	srl	a5,a5,0x1
   4516e:	97ba                	add	a5,a5,a4
   45170:	48f1a823          	sw	a5,1168(gp) # 12d0c90 <_tx_thread_highest_priority>
   45174:	b735                	j	450a0 <_tx_thread_system_suspend+0x56>
   45176:	4941a683          	lw	a3,1172(gp) # 12d0c94 <_tx_thread_preempted_maps>
   4517a:	c21c                	sw	a5,0(a2)
   4517c:	f20682e3          	beqz	a3,450a0 <_tx_thread_system_suspend+0x56>
   45180:	48e696b3          	bclr	a3,a3,a4
   45184:	48d1aa23          	sw	a3,1172(gp) # 12d0c94 <_tx_thread_preempted_maps>
   45188:	bf21                	j	450a0 <_tx_thread_system_suspend+0x56>
   4518a:	0ff00693          	li	a3,255
   4518e:	02f6f563          	bgeu	a3,a5,451b8 <_tx_thread_system_suspend+0x16e>
   45192:	6641                	lui	a2,0x10
   45194:	0ac7fc63          	bgeu	a5,a2,4524c <_tx_thread_system_suspend+0x202>
   45198:	0087d693          	srl	a3,a5,0x8
   4519c:	10d77163          	bgeu	a4,a3,4529e <_tx_thread_system_suspend+0x254>
   451a0:	00c7d693          	srl	a3,a5,0xc
   451a4:	4639                	li	a2,14
   451a6:	47b1                	li	a5,12
   451a8:	470d                	li	a4,3
   451aa:	00d77463          	bgeu	a4,a3,451b2 <_tx_thread_system_suspend+0x168>
   451ae:	8289                	srl	a3,a3,0x2
   451b0:	87b2                	mv	a5,a2
   451b2:	8285                	srl	a3,a3,0x1
   451b4:	97b6                	add	a5,a5,a3
   451b6:	bf6d                	j	45170 <_tx_thread_system_suspend+0x126>
   451b8:	0047d713          	srl	a4,a5,0x4
   451bc:	460d                	li	a2,3
   451be:	4691                	li	a3,4
   451c0:	00e67563          	bgeu	a2,a4,451ca <_tx_thread_system_suspend+0x180>
   451c4:	0067d713          	srl	a4,a5,0x6
   451c8:	4699                	li	a3,6
   451ca:	8305                	srl	a4,a4,0x1
   451cc:	00d707b3          	add	a5,a4,a3
   451d0:	b745                	j	45170 <_tx_thread_system_suspend+0x126>
   451d2:	8389                	srl	a5,a5,0x2
   451d4:	4709                	li	a4,2
   451d6:	bf59                	j	4516c <_tx_thread_system_suspend+0x122>
   451d8:	48c1a783          	lw	a5,1164(gp) # 12d0c8c <_tx_thread_preempt_disable>
   451dc:	8552                	mv	a0,s4
   451de:	0785                	add	a5,a5,1
   451e0:	48f1a623          	sw	a5,1164(gp) # 12d0c8c <_tx_thread_preempt_disable>
   451e4:	f58fb0ef          	jal	4093c <__set_interrupt_state>
   451e8:	f4cfb0ef          	jal	40934 <__get_interrupt_state>
   451ec:	8a2a                	mv	s4,a0
   451ee:	f3efb0ef          	jal	4092c <__disable_interrupt>
   451f2:	48c1a703          	lw	a4,1164(gp) # 12d0c8c <_tx_thread_preempt_disable>
   451f6:	4941a683          	lw	a3,1172(gp) # 12d0c94 <_tx_thread_preempted_maps>
   451fa:	463d                	li	a2,15
   451fc:	177d                	add	a4,a4,-1
   451fe:	40d007b3          	neg	a5,a3
   45202:	48e1a623          	sw	a4,1164(gp) # 12d0c8c <_tx_thread_preempt_disable>
   45206:	8ff5                	and	a5,a5,a3
   45208:	06f66763          	bltu	a2,a5,45276 <_tx_thread_system_suspend+0x22c>
   4520c:	460d                	li	a2,3
   4520e:	4701                	li	a4,0
   45210:	00f67463          	bgeu	a2,a5,45218 <_tx_thread_system_suspend+0x1ce>
   45214:	8389                	srl	a5,a5,0x2
   45216:	4709                	li	a4,2
   45218:	8385                	srl	a5,a5,0x1
   4521a:	97ba                	add	a5,a5,a4
   4521c:	2137c9b3          	sh2add	s3,a5,s3
   45220:	0009a703          	lw	a4,0(s3)
   45224:	4901a603          	lw	a2,1168(gp) # 12d0c90 <_tx_thread_highest_priority>
   45228:	5f4c                	lw	a1,60(a4)
   4522a:	ecb66de3          	bltu	a2,a1,45104 <_tx_thread_system_suspend+0xba>
   4522e:	48f696b3          	bclr	a3,a3,a5
   45232:	4ae1a223          	sw	a4,1188(gp) # 12d0ca4 <_tx_thread_execute_ptr>
   45236:	48d1aa23          	sw	a3,1172(gp) # 12d0c94 <_tx_thread_preempted_maps>
   4523a:	b5e9                	j	45104 <_tx_thread_system_suspend+0xba>
   4523c:	02000713          	li	a4,32
   45240:	48e1a823          	sw	a4,1168(gp) # 12d0c90 <_tx_thread_highest_priority>
   45244:	8552                	mv	a0,s4
   45246:	4a01a223          	sw	zero,1188(gp) # 12d0ca4 <_tx_thread_execute_ptr>
   4524a:	bd75                	j	45106 <_tx_thread_system_suspend+0xbc>
   4524c:	0107d713          	srl	a4,a5,0x10
   45250:	04e6f463          	bgeu	a3,a4,45298 <_tx_thread_system_suspend+0x24e>
   45254:	0187d713          	srl	a4,a5,0x18
   45258:	4671                	li	a2,28
   4525a:	47e1                	li	a5,24
   4525c:	46bd                	li	a3,15
   4525e:	00e6f463          	bgeu	a3,a4,45266 <_tx_thread_system_suspend+0x21c>
   45262:	8311                	srl	a4,a4,0x4
   45264:	87b2                	mv	a5,a2
   45266:	468d                	li	a3,3
   45268:	00e6f463          	bgeu	a3,a4,45270 <_tx_thread_system_suspend+0x226>
   4526c:	8309                	srl	a4,a4,0x2
   4526e:	0789                	add	a5,a5,2
   45270:	8305                	srl	a4,a4,0x1
   45272:	97ba                	add	a5,a5,a4
   45274:	bdf5                	j	45170 <_tx_thread_system_suspend+0x126>
   45276:	0ff00593          	li	a1,255
   4527a:	02f5e563          	bltu	a1,a5,452a4 <_tx_thread_system_suspend+0x25a>
   4527e:	0047d713          	srl	a4,a5,0x4
   45282:	458d                	li	a1,3
   45284:	4611                	li	a2,4
   45286:	00e5f563          	bgeu	a1,a4,45290 <_tx_thread_system_suspend+0x246>
   4528a:	0067d713          	srl	a4,a5,0x6
   4528e:	4619                	li	a2,6
   45290:	00175793          	srl	a5,a4,0x1
   45294:	97b2                	add	a5,a5,a2
   45296:	b759                	j	4521c <_tx_thread_system_suspend+0x1d2>
   45298:	4651                	li	a2,20
   4529a:	47c1                	li	a5,16
   4529c:	b7c1                	j	4525c <_tx_thread_system_suspend+0x212>
   4529e:	4629                	li	a2,10
   452a0:	47a1                	li	a5,8
   452a2:	b719                	j	451a8 <_tx_thread_system_suspend+0x15e>
   452a4:	6741                	lui	a4,0x10
   452a6:	02e7f063          	bgeu	a5,a4,452c6 <_tx_thread_system_suspend+0x27c>
   452aa:	0087d713          	srl	a4,a5,0x8
   452ae:	04e67263          	bgeu	a2,a4,452f2 <_tx_thread_system_suspend+0x2a8>
   452b2:	00c7d713          	srl	a4,a5,0xc
   452b6:	45b9                	li	a1,14
   452b8:	4631                	li	a2,12
   452ba:	478d                	li	a5,3
   452bc:	fce7fae3          	bgeu	a5,a4,45290 <_tx_thread_system_suspend+0x246>
   452c0:	8309                	srl	a4,a4,0x2
   452c2:	862e                	mv	a2,a1
   452c4:	b7f1                	j	45290 <_tx_thread_system_suspend+0x246>
   452c6:	0107d713          	srl	a4,a5,0x10
   452ca:	02e5f163          	bgeu	a1,a4,452ec <_tx_thread_system_suspend+0x2a2>
   452ce:	0187d713          	srl	a4,a5,0x18
   452d2:	45f1                	li	a1,28
   452d4:	4661                	li	a2,24
   452d6:	47bd                	li	a5,15
   452d8:	00e7f463          	bgeu	a5,a4,452e0 <_tx_thread_system_suspend+0x296>
   452dc:	8311                	srl	a4,a4,0x4
   452de:	862e                	mv	a2,a1
   452e0:	478d                	li	a5,3
   452e2:	fae7f7e3          	bgeu	a5,a4,45290 <_tx_thread_system_suspend+0x246>
   452e6:	8309                	srl	a4,a4,0x2
   452e8:	0609                	add	a2,a2,2 # 10002 <_noncacheable_size+0x2>
   452ea:	b75d                	j	45290 <_tx_thread_system_suspend+0x246>
   452ec:	45d1                	li	a1,20
   452ee:	4641                	li	a2,16
   452f0:	b7dd                	j	452d6 <_tx_thread_system_suspend+0x28c>
   452f2:	45a9                	li	a1,10
   452f4:	4621                	li	a2,8
   452f6:	b7d1                	j	452ba <_tx_thread_system_suspend+0x270>

000452f8 <_tx_thread_time_slice>:
   452f8:	1141                	add	sp,sp,-16
   452fa:	c606                	sw	ra,12(sp)
   452fc:	c422                	sw	s0,8(sp)
   452fe:	c226                	sw	s1,4(sp)
   45300:	4a81a403          	lw	s0,1192(gp) # 12d0ca8 <_tx_thread_current_ptr>
   45304:	e30fb0ef          	jal	40934 <__get_interrupt_state>
   45308:	84aa                	mv	s1,a0
   4530a:	e22fb0ef          	jal	4092c <__disable_interrupt>
   4530e:	4c01ae23          	sw	zero,1244(gp) # 12d0cdc <_tx_timer_expired_time_slice>
   45312:	cc11                	beqz	s0,4532e <_tx_thread_time_slice+0x36>
   45314:	581c                	lw	a5,48(s0)
   45316:	ef81                	bnez	a5,4532e <_tx_thread_time_slice+0x36>
   45318:	4c5c                	lw	a5,28(s0)
   4531a:	5018                	lw	a4,32(s0)
   4531c:	cc1c                	sw	a5,24(s0)
   4531e:	4af1a823          	sw	a5,1200(gp) # 12d0cb0 <_tx_timer_time_slice>
   45322:	00870663          	beq	a4,s0,4532e <_tx_thread_time_slice+0x36>
   45326:	545c                	lw	a5,44(s0)
   45328:	5c54                	lw	a3,60(s0)
   4532a:	00d78963          	beq	a5,a3,4533c <_tx_thread_time_slice+0x44>
   4532e:	4422                	lw	s0,8(sp)
   45330:	40b2                	lw	ra,12(sp)
   45332:	8526                	mv	a0,s1
   45334:	4492                	lw	s1,4(sp)
   45336:	0141                	add	sp,sp,16
   45338:	e04fb06f          	j	4093c <__set_interrupt_state>
   4533c:	4901a603          	lw	a2,1168(gp) # 12d0c90 <_tx_thread_highest_priority>
   45340:	e8c18693          	add	a3,gp,-372 # 12d068c <_tx_thread_priority_list>
   45344:	20d7c7b3          	sh2add	a5,a5,a3
   45348:	c398                	sw	a4,0(a5)
   4534a:	20d647b3          	sh2add	a5,a2,a3
   4534e:	4398                	lw	a4,0(a5)
   45350:	4ae1a223          	sw	a4,1188(gp) # 12d0ca4 <_tx_thread_execute_ptr>
   45354:	bfe9                	j	4532e <_tx_thread_time_slice+0x36>

00045356 <_tx_thread_timeout>:
   45356:	1141                	add	sp,sp,-16
   45358:	c606                	sw	ra,12(sp)
   4535a:	c422                	sw	s0,8(sp)
   4535c:	c226                	sw	s1,4(sp)
   4535e:	842a                	mv	s0,a0
   45360:	dd4fb0ef          	jal	40934 <__get_interrupt_state>
   45364:	84aa                	mv	s1,a0
   45366:	dc6fb0ef          	jal	4092c <__disable_interrupt>
   4536a:	5818                	lw	a4,48(s0)
   4536c:	4791                	li	a5,4
   4536e:	02f70363          	beq	a4,a5,45394 <_tx_thread_timeout+0x3e>
   45372:	8526                	mv	a0,s1
   45374:	5424                	lw	s1,104(s0)
   45376:	c04a                	sw	s2,0(sp)
   45378:	0b042903          	lw	s2,176(s0)
   4537c:	dc0fb0ef          	jal	4093c <__set_interrupt_state>
   45380:	c88d                	beqz	s1,453b2 <_tx_thread_timeout+0x5c>
   45382:	8522                	mv	a0,s0
   45384:	4422                	lw	s0,8(sp)
   45386:	40b2                	lw	ra,12(sp)
   45388:	85ca                	mv	a1,s2
   4538a:	87a6                	mv	a5,s1
   4538c:	4902                	lw	s2,0(sp)
   4538e:	4492                	lw	s1,4(sp)
   45390:	0141                	add	sp,sp,16
   45392:	8782                	jr	a5
   45394:	48c1a783          	lw	a5,1164(gp) # 12d0c8c <_tx_thread_preempt_disable>
   45398:	8526                	mv	a0,s1
   4539a:	0785                	add	a5,a5,1
   4539c:	48f1a623          	sw	a5,1164(gp) # 12d0c8c <_tx_thread_preempt_disable>
   453a0:	d9cfb0ef          	jal	4093c <__set_interrupt_state>
   453a4:	8522                	mv	a0,s0
   453a6:	4422                	lw	s0,8(sp)
   453a8:	40b2                	lw	ra,12(sp)
   453aa:	4492                	lw	s1,4(sp)
   453ac:	0141                	add	sp,sp,16
   453ae:	b97ff06f          	j	44f44 <_tx_thread_system_resume>
   453b2:	40b2                	lw	ra,12(sp)
   453b4:	4422                	lw	s0,8(sp)
   453b6:	4902                	lw	s2,0(sp)
   453b8:	4492                	lw	s1,4(sp)
   453ba:	0141                	add	sp,sp,16
   453bc:	8082                	ret

000453be <_tx_timer_expiration_process>:
   453be:	1141                	add	sp,sp,-16
   453c0:	c606                	sw	ra,12(sp)
   453c2:	c422                	sw	s0,8(sp)
   453c4:	d70fb0ef          	jal	40934 <__get_interrupt_state>
   453c8:	842a                	mv	s0,a0
   453ca:	d62fb0ef          	jal	4092c <__disable_interrupt>
   453ce:	48c1a783          	lw	a5,1164(gp) # 12d0c8c <_tx_thread_preempt_disable>
   453d2:	8522                	mv	a0,s0
   453d4:	0785                	add	a5,a5,1
   453d6:	48f1a623          	sw	a5,1164(gp) # 12d0c8c <_tx_thread_preempt_disable>
   453da:	d62fb0ef          	jal	4093c <__set_interrupt_state>
   453de:	4422                	lw	s0,8(sp)
   453e0:	40b2                	lw	ra,12(sp)
   453e2:	30c18513          	add	a0,gp,780 # 12d0b0c <_tx_timer_thread>
   453e6:	0141                	add	sp,sp,16
   453e8:	b5dff06f          	j	44f44 <_tx_thread_system_resume>

000453ec <_tx_timer_initialize>:
   453ec:	4e01a023          	sw	zero,1248(gp) # 12d0ce0 <_tx_timer_system_clock>
   453f0:	7179                	add	sp,sp,-48
   453f2:	4a01a823          	sw	zero,1200(gp) # 12d0cb0 <_tx_timer_time_slice>
   453f6:	d422                	sw	s0,40(sp)
   453f8:	4c01ae23          	sw	zero,1244(gp) # 12d0cdc <_tx_timer_expired_time_slice>
   453fc:	08000613          	li	a2,128
   45400:	3c018513          	add	a0,gp,960 # 12d0bc0 <_tx_timer_list>
   45404:	4c01a623          	sw	zero,1228(gp) # 12d0ccc <_tx_timer_expired>
   45408:	4581                	li	a1,0
   4540a:	d226                	sw	s1,36(sp)
   4540c:	d04a                	sw	s2,32(sp)
   4540e:	ce4e                	sw	s3,28(sp)
   45410:	cc52                	sw	s4,24(sp)
   45412:	ca56                	sw	s5,20(sp)
   45414:	c85a                	sw	s6,16(sp)
   45416:	4c01a023          	sw	zero,1216(gp) # 12d0cc0 <_tx_timer_expired_timer_ptr>
   4541a:	d606                	sw	ra,44(sp)
   4541c:	a89fd0ef          	jal	42ea4 <memset>
   45420:	3c018793          	add	a5,gp,960 # 12d0bc0 <_tx_timer_list>
   45424:	4cf1ac23          	sw	a5,1240(gp) # 12d0cd8 <_tx_timer_list_start>
   45428:	4cf1a823          	sw	a5,1232(gp) # 12d0cd0 <_tx_timer_current_ptr>
   4542c:	44018793          	add	a5,gp,1088 # 12d0c40 <timer_cb>
   45430:	f0c18693          	add	a3,gp,-244 # 12d070c <_tx_timer_thread_stack_area>
   45434:	41545437          	lui	s0,0x41545
   45438:	4cf1aa23          	sw	a5,1236(gp) # 12d0cd4 <_tx_timer_list_end>
   4543c:	40000793          	li	a5,1024
   45440:	4ad1ae23          	sw	a3,1212(gp) # 12d0cbc <_tx_timer_stack_start>
   45444:	4af1ac23          	sw	a5,1208(gp) # 12d0cb8 <_tx_timer_stack_size>
   45448:	4a01aa23          	sw	zero,1204(gp) # 12d0cb4 <_tx_timer_priority>
   4544c:	4881                	li	a7,0
   4544e:	f0c18713          	add	a4,gp,-244 # 12d070c <_tx_timer_thread_stack_area>
   45452:	000459b7          	lui	s3,0x45
   45456:	0004b937          	lui	s2,0x4b
   4545a:	94d40413          	add	s0,s0,-1715 # 4154494d <__share_mem_end__+0x4024494d>
   4545e:	a039                	j	4546c <_tx_timer_initialize+0x80>
   45460:	4bc1a703          	lw	a4,1212(gp) # 12d0cbc <_tx_timer_stack_start>
   45464:	4b81a783          	lw	a5,1208(gp) # 12d0cb8 <_tx_timer_stack_size>
   45468:	4b41a883          	lw	a7,1204(gp) # 12d0cb4 <_tx_timer_priority>
   4546c:	c202                	sw	zero,4(sp)
   4546e:	c002                	sw	zero,0(sp)
   45470:	8846                	mv	a6,a7
   45472:	86a2                	mv	a3,s0
   45474:	52a98613          	add	a2,s3,1322 # 4552a <_tx_timer_thread_entry>
   45478:	d4c90593          	add	a1,s2,-692 # 4ad4c <__clz_tab+0x298>
   4547c:	30c18513          	add	a0,gp,780 # 12d0b0c <_tx_timer_thread>
   45480:	fd8ff0ef          	jal	44c58 <_tx_thread_create>
   45484:	fd71                	bnez	a0,45460 <_tx_timer_initialize+0x74>
   45486:	50b2                	lw	ra,44(sp)
   45488:	5422                	lw	s0,40(sp)
   4548a:	4c01a423          	sw	zero,1224(gp) # 12d0cc8 <_tx_timer_created_ptr>
   4548e:	4c01a223          	sw	zero,1220(gp) # 12d0cc4 <_tx_timer_created_count>
   45492:	5492                	lw	s1,36(sp)
   45494:	5902                	lw	s2,32(sp)
   45496:	49f2                	lw	s3,28(sp)
   45498:	4a62                	lw	s4,24(sp)
   4549a:	4ad2                	lw	s5,20(sp)
   4549c:	4b42                	lw	s6,16(sp)
   4549e:	6145                	add	sp,sp,48
   454a0:	8082                	ret

000454a2 <_tx_timer_system_activate>:
   454a2:	411c                	lw	a5,0(a0)
   454a4:	5775                	li	a4,-3
   454a6:	fff78693          	add	a3,a5,-1
   454aa:	00d76463          	bltu	a4,a3,454b2 <_tx_timer_system_activate+0x10>
   454ae:	4d18                	lw	a4,24(a0)
   454b0:	c311                	beqz	a4,454b4 <_tx_timer_system_activate+0x12>
   454b2:	8082                	ret
   454b4:	4d01a683          	lw	a3,1232(gp) # 12d0cd0 <_tx_timer_current_ptr>
   454b8:	4d41a703          	lw	a4,1236(gp) # 12d0cd4 <_tx_timer_list_end>
   454bc:	02000613          	li	a2,32
   454c0:	0ac7d7b3          	minu	a5,a5,a2
   454c4:	17fd                	add	a5,a5,-1
   454c6:	20d7c7b3          	sh2add	a5,a5,a3
   454ca:	00e7fb63          	bgeu	a5,a4,454e0 <_tx_timer_system_activate+0x3e>
   454ce:	4398                	lw	a4,0(a5)
   454d0:	cf09                	beqz	a4,454ea <_tx_timer_system_activate+0x48>
   454d2:	4b54                	lw	a3,20(a4)
   454d4:	ca88                	sw	a0,16(a3)
   454d6:	cb48                	sw	a0,20(a4)
   454d8:	c918                	sw	a4,16(a0)
   454da:	c954                	sw	a3,20(a0)
   454dc:	cd1c                	sw	a5,24(a0)
   454de:	8082                	ret
   454e0:	4d81a683          	lw	a3,1240(gp) # 12d0cd8 <_tx_timer_list_start>
   454e4:	8f99                	sub	a5,a5,a4
   454e6:	97b6                	add	a5,a5,a3
   454e8:	b7dd                	j	454ce <_tx_timer_system_activate+0x2c>
   454ea:	c908                	sw	a0,16(a0)
   454ec:	c948                	sw	a0,20(a0)
   454ee:	c388                	sw	a0,0(a5)
   454f0:	cd1c                	sw	a5,24(a0)
   454f2:	8082                	ret

000454f4 <_tx_timer_system_deactivate>:
   454f4:	4d1c                	lw	a5,24(a0)
   454f6:	cf81                	beqz	a5,4550e <_tx_timer_system_deactivate+0x1a>
   454f8:	4918                	lw	a4,16(a0)
   454fa:	00e50b63          	beq	a0,a4,45510 <_tx_timer_system_deactivate+0x1c>
   454fe:	4954                	lw	a3,20(a0)
   45500:	cb54                	sw	a3,20(a4)
   45502:	ca98                	sw	a4,16(a3)
   45504:	4394                	lw	a3,0(a5)
   45506:	00a68d63          	beq	a3,a0,45520 <_tx_timer_system_deactivate+0x2c>
   4550a:	00052c23          	sw	zero,24(a0)
   4550e:	8082                	ret
   45510:	4398                	lw	a4,0(a5)
   45512:	fea71ce3          	bne	a4,a0,4550a <_tx_timer_system_deactivate+0x16>
   45516:	0007a023          	sw	zero,0(a5)
   4551a:	00052c23          	sw	zero,24(a0)
   4551e:	8082                	ret
   45520:	cf1c                	sw	a5,24(a4)
   45522:	c398                	sw	a4,0(a5)
   45524:	00052c23          	sw	zero,24(a0)
   45528:	8082                	ret

0004552a <_tx_timer_thread_entry>:
   4552a:	415457b7          	lui	a5,0x41545
   4552e:	94d78793          	add	a5,a5,-1715 # 4154494d <__share_mem_end__+0x4024494d>
   45532:	00f50363          	beq	a0,a5,45538 <_tx_timer_thread_entry+0xe>
   45536:	8082                	ret
   45538:	715d                	add	sp,sp,-80
   4553a:	c2a6                	sw	s1,68(sp)
   4553c:	c0ca                	sw	s2,64(sp)
   4553e:	de4e                	sw	s3,60(sp)
   45540:	dc52                	sw	s4,56(sp)
   45542:	da56                	sw	s5,52(sp)
   45544:	d85a                	sw	s6,48(sp)
   45546:	d65e                	sw	s7,44(sp)
   45548:	d462                	sw	s8,40(sp)
   4554a:	c686                	sw	ra,76(sp)
   4554c:	c4a2                	sw	s0,72(sp)
   4554e:	d266                	sw	s9,36(sp)
   45550:	d06a                	sw	s10,32(sp)
   45552:	ce6e                	sw	s11,28(sp)
   45554:	00810993          	add	s3,sp,8
   45558:	00c10a13          	add	s4,sp,12
   4555c:	30c18c13          	add	s8,gp,780 # 12d0b0c <_tx_timer_thread>
   45560:	02000913          	li	s2,32
   45564:	bd0fb0ef          	jal	40934 <__get_interrupt_state>
   45568:	842a                	mv	s0,a0
   4556a:	bc2fb0ef          	jal	4092c <__disable_interrupt>
   4556e:	4d01a783          	lw	a5,1232(gp) # 12d0cd0 <_tx_timer_current_ptr>
   45572:	4398                	lw	a4,0(a5)
   45574:	c43a                	sw	a4,8(sp)
   45576:	c319                	beqz	a4,4557c <_tx_timer_thread_entry+0x52>
   45578:	01372c23          	sw	s3,24(a4) # 10018 <_noncacheable_size+0x18>
   4557c:	4d41a703          	lw	a4,1236(gp) # 12d0cd4 <_tx_timer_list_end>
   45580:	0791                	add	a5,a5,4
   45582:	fe07ae23          	sw	zero,-4(a5)
   45586:	4cf1a823          	sw	a5,1232(gp) # 12d0cd0 <_tx_timer_current_ptr>
   4558a:	0ee78363          	beq	a5,a4,45670 <_tx_timer_thread_entry+0x146>
   4558e:	8522                	mv	a0,s0
   45590:	4c01a623          	sw	zero,1228(gp) # 12d0ccc <_tx_timer_expired>
   45594:	ba8fb0ef          	jal	4093c <__set_interrupt_state>
   45598:	b9cfb0ef          	jal	40934 <__get_interrupt_state>
   4559c:	8daa                	mv	s11,a0
   4559e:	b8efb0ef          	jal	4092c <__disable_interrupt>
   455a2:	4d22                	lw	s10,8(sp)
   455a4:	080d0c63          	beqz	s10,4563c <_tx_timer_thread_entry+0x112>
   455a8:	010d2703          	lw	a4,16(s10)
   455ac:	c602                	sw	zero,12(sp)
   455ae:	09a70563          	beq	a4,s10,45638 <_tx_timer_thread_entry+0x10e>
   455b2:	014d2683          	lw	a3,20(s10)
   455b6:	cb54                	sw	a3,20(a4)
   455b8:	ca98                	sw	a4,16(a3)
   455ba:	01372c23          	sw	s3,24(a4)
   455be:	000d2683          	lw	a3,0(s10)
   455c2:	c43a                	sw	a4,8(sp)
   455c4:	04d97063          	bgeu	s2,a3,45604 <_tx_timer_thread_entry+0xda>
   455c8:	1681                	add	a3,a3,-32
   455ca:	00dd2023          	sw	a3,0(s10)
   455ce:	014d2c23          	sw	s4,24(s10)
   455d2:	01ad2823          	sw	s10,16(s10)
   455d6:	856e                	mv	a0,s11
   455d8:	c66a                	sw	s10,12(sp)
   455da:	4da1a023          	sw	s10,1216(gp) # 12d0cc0 <_tx_timer_expired_timer_ptr>
   455de:	b5efb0ef          	jal	4093c <__set_interrupt_state>
   455e2:	b52fb0ef          	jal	40934 <__get_interrupt_state>
   455e6:	842a                	mv	s0,a0
   455e8:	b44fb0ef          	jal	4092c <__disable_interrupt>
   455ec:	4732                	lw	a4,12(sp)
   455ee:	4c01a023          	sw	zero,1216(gp) # 12d0cc0 <_tx_timer_expired_timer_ptr>
   455f2:	8522                	mv	a0,s0
   455f4:	fba710e3          	bne	a4,s10,45594 <_tx_timer_thread_entry+0x6a>
   455f8:	856a                	mv	a0,s10
   455fa:	000d2c23          	sw	zero,24(s10)
   455fe:	3555                	jal	454a2 <_tx_timer_system_activate>
   45600:	8522                	mv	a0,s0
   45602:	bf49                	j	45594 <_tx_timer_thread_entry+0x6a>
   45604:	004d2683          	lw	a3,4(s10)
   45608:	008d2c83          	lw	s9,8(s10)
   4560c:	00cd2403          	lw	s0,12(s10)
   45610:	00dd2023          	sw	a3,0(s10)
   45614:	4601                	li	a2,0
   45616:	c689                	beqz	a3,45620 <_tx_timer_thread_entry+0xf6>
   45618:	01ad2823          	sw	s10,16(s10)
   4561c:	c66a                	sw	s10,12(sp)
   4561e:	8652                	mv	a2,s4
   45620:	00cd2c23          	sw	a2,24(s10)
   45624:	856e                	mv	a0,s11
   45626:	4da1a023          	sw	s10,1216(gp) # 12d0cc0 <_tx_timer_expired_timer_ptr>
   4562a:	b12fb0ef          	jal	4093c <__set_interrupt_state>
   4562e:	fa0c8ae3          	beqz	s9,455e2 <_tx_timer_thread_entry+0xb8>
   45632:	8522                	mv	a0,s0
   45634:	9c82                	jalr	s9
   45636:	b775                	j	455e2 <_tx_timer_thread_entry+0xb8>
   45638:	4701                	li	a4,0
   4563a:	b751                	j	455be <_tx_timer_thread_entry+0x94>
   4563c:	4cc1a783          	lw	a5,1228(gp) # 12d0ccc <_tx_timer_expired>
   45640:	e785                	bnez	a5,45668 <_tx_timer_thread_entry+0x13e>
   45642:	48c1a783          	lw	a5,1164(gp) # 12d0c8c <_tx_thread_preempt_disable>
   45646:	470d                	li	a4,3
   45648:	856e                	mv	a0,s11
   4564a:	02ec2823          	sw	a4,48(s8)
   4564e:	0785                	add	a5,a5,1
   45650:	4705                	li	a4,1
   45652:	48f1a623          	sw	a5,1164(gp) # 12d0c8c <_tx_thread_preempt_disable>
   45656:	02ec2c23          	sw	a4,56(s8)
   4565a:	ae2fb0ef          	jal	4093c <__set_interrupt_state>
   4565e:	30c18513          	add	a0,gp,780 # 12d0b0c <_tx_timer_thread>
   45662:	9e9ff0ef          	jal	4504a <_tx_thread_system_suspend>
   45666:	bdfd                	j	45564 <_tx_timer_thread_entry+0x3a>
   45668:	856e                	mv	a0,s11
   4566a:	ad2fb0ef          	jal	4093c <__set_interrupt_state>
   4566e:	bddd                	j	45564 <_tx_timer_thread_entry+0x3a>
   45670:	4d81a783          	lw	a5,1240(gp) # 12d0cd8 <_tx_timer_list_start>
   45674:	4cf1a823          	sw	a5,1232(gp) # 12d0cd0 <_tx_timer_current_ptr>
   45678:	bf19                	j	4558e <_tx_timer_thread_entry+0x64>

0004567a <_txe_thread_create>:
   4567a:	715d                	add	sp,sp,-80
   4567c:	c0ca                	sw	s2,64(sp)
   4567e:	d266                	sw	s9,36(sp)
   45680:	d06a                	sw	s10,32(sp)
   45682:	892a                	mv	s2,a0
   45684:	c686                	sw	ra,76(sp)
   45686:	4d46                	lw	s10,80(sp)
   45688:	4cd6                	lw	s9,84(sp)
   4568a:	4566                	lw	a0,88(sp)
   4568c:	00090963          	beqz	s2,4569e <_txe_thread_create+0x24>
   45690:	da56                	sw	s5,52(sp)
   45692:	8abe                	mv	s5,a5
   45694:	0b400793          	li	a5,180
   45698:	00f50a63          	beq	a0,a5,456ac <_txe_thread_create+0x32>
   4569c:	5ad2                	lw	s5,52(sp)
   4569e:	40b6                	lw	ra,76(sp)
   456a0:	4906                	lw	s2,64(sp)
   456a2:	5c92                	lw	s9,36(sp)
   456a4:	5d02                	lw	s10,32(sp)
   456a6:	4539                	li	a0,14
   456a8:	6161                	add	sp,sp,80
   456aa:	8082                	ret
   456ac:	c4a2                	sw	s0,72(sp)
   456ae:	c2a6                	sw	s1,68(sp)
   456b0:	de4e                	sw	s3,60(sp)
   456b2:	84ba                	mv	s1,a4
   456b4:	89c6                	mv	s3,a7
   456b6:	dc52                	sw	s4,56(sp)
   456b8:	d85a                	sw	s6,48(sp)
   456ba:	8a42                	mv	s4,a6
   456bc:	8b2e                	mv	s6,a1
   456be:	d65e                	sw	s7,44(sp)
   456c0:	d462                	sw	s8,40(sp)
   456c2:	8bb2                	mv	s7,a2
   456c4:	8c36                	mv	s8,a3
   456c6:	ce6e                	sw	s11,28(sp)
   456c8:	a6cfb0ef          	jal	40934 <__get_interrupt_state>
   456cc:	842a                	mv	s0,a0
   456ce:	a5efb0ef          	jal	4092c <__disable_interrupt>
   456d2:	48c1a783          	lw	a5,1164(gp) # 12d0c8c <_tx_thread_preempt_disable>
   456d6:	8522                	mv	a0,s0
   456d8:	0785                	add	a5,a5,1
   456da:	48f1a623          	sw	a5,1164(gp) # 12d0c8c <_tx_thread_preempt_disable>
   456de:	a5efb0ef          	jal	4093c <__set_interrupt_state>
   456e2:	49c1af03          	lw	t5,1180(gp) # 12d0c9c <_tx_thread_created_count>
   456e6:	fffa8313          	add	t1,s5,-1
   456ea:	4a01a403          	lw	s0,1184(gp) # 12d0ca0 <_tx_thread_created_ptr>
   456ee:	9326                	add	t1,t1,s1
   456f0:	160f0563          	beqz	t5,4585a <_txe_thread_create+0x1e0>
   456f4:	10890a63          	beq	s2,s0,45808 <_txe_thread_create+0x18e>
   456f8:	4501                	li	a0,0
   456fa:	4785                	li	a5,1
   456fc:	4458                	lw	a4,12(s0)
   456fe:	0505                	add	a0,a0,1
   45700:	4e01                	li	t3,0
   45702:	00e4e863          	bltu	s1,a4,45712 <_txe_thread_create+0x98>
   45706:	01042e83          	lw	t4,16(s0)
   4570a:	01d4f463          	bgeu	s1,t4,45712 <_txe_thread_create+0x98>
   4570e:	4e05                	li	t3,1
   45710:	4481                	li	s1,0
   45712:	04e36863          	bltu	t1,a4,45762 <_txe_thread_create+0xe8>
   45716:	4818                	lw	a4,16(s0)
   45718:	04e37563          	bgeu	t1,a4,45762 <_txe_thread_create+0xe8>
   4571c:	08842483          	lw	s1,136(s0)
   45720:	a14fb0ef          	jal	40934 <__get_interrupt_state>
   45724:	842a                	mv	s0,a0
   45726:	a06fb0ef          	jal	4092c <__disable_interrupt>
   4572a:	48c1a783          	lw	a5,1164(gp) # 12d0c8c <_tx_thread_preempt_disable>
   4572e:	8522                	mv	a0,s0
   45730:	17fd                	add	a5,a5,-1
   45732:	48f1a623          	sw	a5,1164(gp) # 12d0c8c <_tx_thread_preempt_disable>
   45736:	a06fb0ef          	jal	4093c <__set_interrupt_state>
   4573a:	fecff0ef          	jal	44f26 <_tx_thread_system_preempt_check>
   4573e:	0e990463          	beq	s2,s1,45826 <_txe_thread_create+0x1ac>
   45742:	450d                	li	a0,3
   45744:	4426                	lw	s0,72(sp)
   45746:	40b6                	lw	ra,76(sp)
   45748:	4496                	lw	s1,68(sp)
   4574a:	59f2                	lw	s3,60(sp)
   4574c:	5a62                	lw	s4,56(sp)
   4574e:	5ad2                	lw	s5,52(sp)
   45750:	5b42                	lw	s6,48(sp)
   45752:	5bb2                	lw	s7,44(sp)
   45754:	5c22                	lw	s8,40(sp)
   45756:	4df2                	lw	s11,28(sp)
   45758:	4906                	lw	s2,64(sp)
   4575a:	5c92                	lw	s9,36(sp)
   4575c:	5d02                	lw	s10,32(sp)
   4575e:	6161                	add	sp,sp,80
   45760:	8082                	ret
   45762:	08842403          	lw	s0,136(s0)
   45766:	0eaf0a63          	beq	t5,a0,4585a <_txe_thread_create+0x1e0>
   4576a:	08890f63          	beq	s2,s0,45808 <_txe_thread_create+0x18e>
   4576e:	f8fe17e3          	bne	t3,a5,456fc <_txe_thread_create+0x82>
   45772:	9c2fb0ef          	jal	40934 <__get_interrupt_state>
   45776:	842a                	mv	s0,a0
   45778:	9b4fb0ef          	jal	4092c <__disable_interrupt>
   4577c:	48c1a783          	lw	a5,1164(gp) # 12d0c8c <_tx_thread_preempt_disable>
   45780:	8522                	mv	a0,s0
   45782:	17fd                	add	a5,a5,-1
   45784:	48f1a623          	sw	a5,1164(gp) # 12d0c8c <_tx_thread_preempt_disable>
   45788:	9b4fb0ef          	jal	4093c <__set_interrupt_state>
   4578c:	f9aff0ef          	jal	44f26 <_tx_thread_system_preempt_check>
   45790:	d8cd                	beqz	s1,45742 <_txe_thread_create+0xc8>
   45792:	fa0b88e3          	beqz	s7,45742 <_txe_thread_create+0xc8>
   45796:	1ff00793          	li	a5,511
   4579a:	0757f563          	bgeu	a5,s5,45804 <_txe_thread_create+0x18a>
   4579e:	47fd                	li	a5,31
   457a0:	0947ed63          	bltu	a5,s4,4583a <_txe_thread_create+0x1c0>
   457a4:	093a6d63          	bltu	s4,s3,4583e <_txe_thread_create+0x1c4>
   457a8:	4785                	li	a5,1
   457aa:	0997ec63          	bltu	a5,s9,45842 <_txe_thread_create+0x1c8>
   457ae:	4a81a703          	lw	a4,1192(gp) # 12d0ca8 <_tx_thread_current_ptr>
   457b2:	30c18793          	add	a5,gp,780 # 12d0b0c <_tx_timer_thread>
   457b6:	08f70863          	beq	a4,a5,45846 <_txe_thread_create+0x1cc>
   457ba:	9cc1a703          	lw	a4,-1588(gp) # 12d01cc <_tx_thread_system_state>
   457be:	cb09                	beqz	a4,457d0 <_txe_thread_create+0x156>
   457c0:	9cc1a703          	lw	a4,-1588(gp) # 12d01cc <_tx_thread_system_state>
   457c4:	f0f0f7b7          	lui	a5,0xf0f0f
   457c8:	0ef78793          	add	a5,a5,239 # f0f0f0ef <__share_mem_end__+0xefc0f0ef>
   457cc:	08e7f563          	bgeu	a5,a4,45856 <_txe_thread_create+0x1dc>
   457d0:	4426                	lw	s0,72(sp)
   457d2:	cae6                	sw	s9,84(sp)
   457d4:	c8ea                	sw	s10,80(sp)
   457d6:	4df2                	lw	s11,28(sp)
   457d8:	40b6                	lw	ra,76(sp)
   457da:	5c92                	lw	s9,36(sp)
   457dc:	5d02                	lw	s10,32(sp)
   457de:	88ce                	mv	a7,s3
   457e0:	8852                	mv	a6,s4
   457e2:	59f2                	lw	s3,60(sp)
   457e4:	5a62                	lw	s4,56(sp)
   457e6:	87d6                	mv	a5,s5
   457e8:	8726                	mv	a4,s1
   457ea:	5ad2                	lw	s5,52(sp)
   457ec:	4496                	lw	s1,68(sp)
   457ee:	86e2                	mv	a3,s8
   457f0:	865e                	mv	a2,s7
   457f2:	5c22                	lw	s8,40(sp)
   457f4:	5bb2                	lw	s7,44(sp)
   457f6:	85da                	mv	a1,s6
   457f8:	854a                	mv	a0,s2
   457fa:	5b42                	lw	s6,48(sp)
   457fc:	4906                	lw	s2,64(sp)
   457fe:	6161                	add	sp,sp,80
   45800:	c58ff06f          	j	44c58 <_tx_thread_create>
   45804:	4515                	li	a0,5
   45806:	bf3d                	j	45744 <_txe_thread_create+0xca>
   45808:	92cfb0ef          	jal	40934 <__get_interrupt_state>
   4580c:	842a                	mv	s0,a0
   4580e:	91efb0ef          	jal	4092c <__disable_interrupt>
   45812:	48c1a783          	lw	a5,1164(gp) # 12d0c8c <_tx_thread_preempt_disable>
   45816:	8522                	mv	a0,s0
   45818:	17fd                	add	a5,a5,-1
   4581a:	48f1a623          	sw	a5,1164(gp) # 12d0c8c <_tx_thread_preempt_disable>
   4581e:	91efb0ef          	jal	4093c <__set_interrupt_state>
   45822:	f04ff0ef          	jal	44f26 <_tx_thread_system_preempt_check>
   45826:	4426                	lw	s0,72(sp)
   45828:	4496                	lw	s1,68(sp)
   4582a:	59f2                	lw	s3,60(sp)
   4582c:	5a62                	lw	s4,56(sp)
   4582e:	5ad2                	lw	s5,52(sp)
   45830:	5b42                	lw	s6,48(sp)
   45832:	5bb2                	lw	s7,44(sp)
   45834:	5c22                	lw	s8,40(sp)
   45836:	4df2                	lw	s11,28(sp)
   45838:	b59d                	j	4569e <_txe_thread_create+0x24>
   4583a:	453d                	li	a0,15
   4583c:	b721                	j	45744 <_txe_thread_create+0xca>
   4583e:	4561                	li	a0,24
   45840:	b711                	j	45744 <_txe_thread_create+0xca>
   45842:	4541                	li	a0,16
   45844:	b701                	j	45744 <_txe_thread_create+0xca>
   45846:	9cc1a703          	lw	a4,-1588(gp) # 12d01cc <_tx_thread_system_state>
   4584a:	454d                	li	a0,19
   4584c:	ee070ce3          	beqz	a4,45744 <_txe_thread_create+0xca>
   45850:	9cc1a783          	lw	a5,-1588(gp) # 12d01cc <_tx_thread_system_state>
   45854:	bdc5                	j	45744 <_txe_thread_create+0xca>
   45856:	454d                	li	a0,19
   45858:	b5f5                	j	45744 <_txe_thread_create+0xca>
   4585a:	8dafb0ef          	jal	40934 <__get_interrupt_state>
   4585e:	c62a                	sw	a0,12(sp)
   45860:	8ccfb0ef          	jal	4092c <__disable_interrupt>
   45864:	48c1a783          	lw	a5,1164(gp) # 12d0c8c <_tx_thread_preempt_disable>
   45868:	4532                	lw	a0,12(sp)
   4586a:	17fd                	add	a5,a5,-1
   4586c:	48f1a623          	sw	a5,1164(gp) # 12d0c8c <_tx_thread_preempt_disable>
   45870:	8ccfb0ef          	jal	4093c <__set_interrupt_state>
   45874:	eb2ff0ef          	jal	44f26 <_tx_thread_system_preempt_check>
   45878:	f0891ce3          	bne	s2,s0,45790 <_txe_thread_create+0x116>
   4587c:	b76d                	j	45826 <_txe_thread_create+0x1ac>

0004587e <__errno>:
   4587e:	9d01a503          	lw	a0,-1584(gp) # 12d01d0 <_impure_ptr>
   45882:	8082                	ret

00045884 <__cvt>:
   45884:	7179                	add	sp,sp,-48
   45886:	d422                	sw	s0,40(sp)
   45888:	d226                	sw	s1,36(sp)
   4588a:	cc52                	sw	s4,24(sp)
   4588c:	ca56                	sw	s5,20(sp)
   4588e:	c85a                	sw	s6,16(sp)
   45890:	d606                	sw	ra,44(sp)
   45892:	d04a                	sw	s2,32(sp)
   45894:	ce4e                	sw	s3,28(sp)
   45896:	8a3a                	mv	s4,a4
   45898:	8aae                	mv	s5,a1
   4589a:	8432                	mv	s0,a2
   4589c:	84b6                	mv	s1,a3
   4589e:	8b42                	mv	s6,a6
   458a0:	4701                	li	a4,0
   458a2:	00065663          	bgez	a2,458ae <__cvt+0x2a>
   458a6:	02d00713          	li	a4,45
   458aa:	69f61413          	binv	s0,a2,0x1f
   458ae:	00e78023          	sb	a4,0(a5)
   458b2:	fdf8f913          	and	s2,a7,-33
   458b6:	04600793          	li	a5,70
   458ba:	468d                	li	a3,3
   458bc:	00f90863          	beq	s2,a5,458cc <__cvt+0x48>
   458c0:	04500793          	li	a5,69
   458c4:	4689                	li	a3,2
   458c6:	00f91363          	bne	s2,a5,458cc <__cvt+0x48>
   458ca:	0485                	add	s1,s1,1
   458cc:	87da                	mv	a5,s6
   458ce:	00c10893          	add	a7,sp,12
   458d2:	00810813          	add	a6,sp,8
   458d6:	8726                	mv	a4,s1
   458d8:	85d6                	mv	a1,s5
   458da:	8622                	mv	a2,s0
   458dc:	701010ef          	jal	477dc <_dtoa_r>
   458e0:	04700793          	li	a5,71
   458e4:	89aa                	mv	s3,a0
   458e6:	04f91563          	bne	s2,a5,45930 <__cvt+0xac>
   458ea:	001a7a13          	and	s4,s4,1
   458ee:	020a0163          	beqz	s4,45910 <__cvt+0x8c>
   458f2:	00950a33          	add	s4,a0,s1
   458f6:	4601                	li	a2,0
   458f8:	4681                	li	a3,0
   458fa:	8556                	mv	a0,s5
   458fc:	85a2                	mv	a1,s0
   458fe:	ddcfd0ef          	jal	42eda <__eqdf2>
   45902:	e111                	bnez	a0,45906 <__cvt+0x82>
   45904:	c652                	sw	s4,12(sp)
   45906:	03000713          	li	a4,48
   4590a:	47b2                	lw	a5,12(sp)
   4590c:	0547ed63          	bltu	a5,s4,45966 <__cvt+0xe2>
   45910:	47b2                	lw	a5,12(sp)
   45912:	5742                	lw	a4,48(sp)
   45914:	50b2                	lw	ra,44(sp)
   45916:	5422                	lw	s0,40(sp)
   45918:	413787b3          	sub	a5,a5,s3
   4591c:	c31c                	sw	a5,0(a4)
   4591e:	5492                	lw	s1,36(sp)
   45920:	5902                	lw	s2,32(sp)
   45922:	4a62                	lw	s4,24(sp)
   45924:	4ad2                	lw	s5,20(sp)
   45926:	4b42                	lw	s6,16(sp)
   45928:	854e                	mv	a0,s3
   4592a:	49f2                	lw	s3,28(sp)
   4592c:	6145                	add	sp,sp,48
   4592e:	8082                	ret
   45930:	04600793          	li	a5,70
   45934:	00950a33          	add	s4,a0,s1
   45938:	faf91fe3          	bne	s2,a5,458f6 <__cvt+0x72>
   4593c:	00054703          	lbu	a4,0(a0)
   45940:	03000793          	li	a5,48
   45944:	00f71d63          	bne	a4,a5,4595e <__cvt+0xda>
   45948:	4601                	li	a2,0
   4594a:	4681                	li	a3,0
   4594c:	8556                	mv	a0,s5
   4594e:	85a2                	mv	a1,s0
   45950:	d8afd0ef          	jal	42eda <__eqdf2>
   45954:	c509                	beqz	a0,4595e <__cvt+0xda>
   45956:	4785                	li	a5,1
   45958:	8f85                	sub	a5,a5,s1
   4595a:	00fb2023          	sw	a5,0(s6)
   4595e:	000b2783          	lw	a5,0(s6)
   45962:	9a3e                	add	s4,s4,a5
   45964:	bf49                	j	458f6 <__cvt+0x72>
   45966:	00178693          	add	a3,a5,1
   4596a:	c636                	sw	a3,12(sp)
   4596c:	00e78023          	sb	a4,0(a5)
   45970:	bf69                	j	4590a <__cvt+0x86>

00045972 <__exponent>:
   45972:	00c50023          	sb	a2,0(a0)
   45976:	02b00793          	li	a5,43
   4597a:	0005d663          	bgez	a1,45986 <__exponent+0x14>
   4597e:	40b005b3          	neg	a1,a1
   45982:	02d00793          	li	a5,45
   45986:	00f500a3          	sb	a5,1(a0)
   4598a:	47a5                	li	a5,9
   4598c:	06b7d463          	bge	a5,a1,459f4 <__exponent+0x82>
   45990:	1141                	add	sp,sp,-16
   45992:	00f10713          	add	a4,sp,15
   45996:	883a                	mv	a6,a4
   45998:	4629                	li	a2,10
   4599a:	06300893          	li	a7,99
   4599e:	02c5e7b3          	rem	a5,a1,a2
   459a2:	86ba                	mv	a3,a4
   459a4:	177d                	add	a4,a4,-1
   459a6:	03078793          	add	a5,a5,48
   459aa:	fef68fa3          	sb	a5,-1(a3)
   459ae:	87ae                	mv	a5,a1
   459b0:	02c5c5b3          	div	a1,a1,a2
   459b4:	fef8c5e3          	blt	a7,a5,4599e <__exponent+0x2c>
   459b8:	00250793          	add	a5,a0,2
   459bc:	ffe68893          	add	a7,a3,-2
   459c0:	03058593          	add	a1,a1,48
   459c4:	feb70fa3          	sb	a1,-1(a4)
   459c8:	863e                	mv	a2,a5
   459ca:	8746                	mv	a4,a7
   459cc:	01076d63          	bltu	a4,a6,459e6 <__exponent+0x74>
   459d0:	4701                	li	a4,0
   459d2:	01186563          	bltu	a6,a7,459dc <__exponent+0x6a>
   459d6:	01110713          	add	a4,sp,17
   459da:	8f15                	sub	a4,a4,a3
   459dc:	97ba                	add	a5,a5,a4
   459de:	40a78533          	sub	a0,a5,a0
   459e2:	0141                	add	sp,sp,16
   459e4:	8082                	ret
   459e6:	00074583          	lbu	a1,0(a4)
   459ea:	0705                	add	a4,a4,1
   459ec:	0605                	add	a2,a2,1
   459ee:	feb60fa3          	sb	a1,-1(a2)
   459f2:	bfe9                	j	459cc <__exponent+0x5a>
   459f4:	03000793          	li	a5,48
   459f8:	00f50123          	sb	a5,2(a0)
   459fc:	03058593          	add	a1,a1,48
   45a00:	00450793          	add	a5,a0,4
   45a04:	00b501a3          	sb	a1,3(a0)
   45a08:	40a78533          	sub	a0,a5,a0
   45a0c:	8082                	ret

00045a0e <_printf_float>:
   45a0e:	7119                	add	sp,sp,-128
   45a10:	de86                	sw	ra,124(sp)
   45a12:	dca2                	sw	s0,120(sp)
   45a14:	d8ca                	sw	s2,112(sp)
   45a16:	842e                	mv	s0,a1
   45a18:	893a                	mv	s2,a4
   45a1a:	d4d2                	sw	s4,104(sp)
   45a1c:	d2d6                	sw	s5,100(sp)
   45a1e:	d0da                	sw	s6,96(sp)
   45a20:	cede                	sw	s7,92(sp)
   45a22:	cce2                	sw	s8,88(sp)
   45a24:	cae6                	sw	s9,84(sp)
   45a26:	8a32                	mv	s4,a2
   45a28:	8ab6                	mv	s5,a3
   45a2a:	daa6                	sw	s1,116(sp)
   45a2c:	d6ce                	sw	s3,108(sp)
   45a2e:	c8ea                	sw	s10,80(sp)
   45a30:	c6ee                	sw	s11,76(sp)
   45a32:	ce2a                	sw	a0,28(sp)
   45a34:	532030ef          	jal	48f66 <_localeconv_r>
   45a38:	00052c83          	lw	s9,0(a0)
   45a3c:	8566                	mv	a0,s9
   45a3e:	673000ef          	jal	468b0 <strlen>
   45a42:	00042b83          	lw	s7,0(s0)
   45a46:	dc02                	sw	zero,56(sp)
   45a48:	01844b03          	lbu	s6,24(s0)
   45a4c:	100bf713          	and	a4,s7,256
   45a50:	00092783          	lw	a5,0(s2)
   45a54:	8c2a                	mv	s8,a0
   45a56:	c371                	beqz	a4,45b1a <_printf_float+0x10c>
   45a58:	00478713          	add	a4,a5,4
   45a5c:	00e92023          	sw	a4,0(s2)
   45a60:	439c                	lw	a5,0(a5)
   45a62:	1008                	add	a0,sp,32
   45a64:	4398                	lw	a4,0(a5)
   45a66:	d03a                	sw	a4,32(sp)
   45a68:	43d8                	lw	a4,4(a5)
   45a6a:	d23a                	sw	a4,36(sp)
   45a6c:	4798                	lw	a4,8(a5)
   45a6e:	d43a                	sw	a4,40(sp)
   45a70:	47dc                	lw	a5,12(a5)
   45a72:	d63e                	sw	a5,44(sp)
   45a74:	89bfd0ef          	jal	4330e <__trunctfdf2>
   45a78:	8d2a                	mv	s10,a0
   45a7a:	8dae                	mv	s11,a1
   45a7c:	0004b7b7          	lui	a5,0x4b
   45a80:	3f07a903          	lw	s2,1008(a5) # 4b3f0 <_global_impure_ptr+0x8>
   45a84:	3f47a983          	lw	s3,1012(a5)
   45a88:	49fd9493          	bclr	s1,s11,0x1f
   45a8c:	05a42423          	sw	s10,72(s0)
   45a90:	05b42623          	sw	s11,76(s0)
   45a94:	864a                	mv	a2,s2
   45a96:	86ce                	mv	a3,s3
   45a98:	856a                	mv	a0,s10
   45a9a:	85a6                	mv	a1,s1
   45a9c:	ca8fd0ef          	jal	42f44 <__unorddf2>
   45aa0:	e941                	bnez	a0,45b30 <_printf_float+0x122>
   45aa2:	864a                	mv	a2,s2
   45aa4:	86ce                	mv	a3,s3
   45aa6:	856a                	mv	a0,s10
   45aa8:	85a6                	mv	a1,s1
   45aaa:	eaefc0ef          	jal	42158 <__ledf2>
   45aae:	08a05163          	blez	a0,45b30 <_printf_float+0x122>
   45ab2:	4601                	li	a2,0
   45ab4:	4681                	li	a3,0
   45ab6:	856a                	mv	a0,s10
   45ab8:	85ee                	mv	a1,s11
   45aba:	e9efc0ef          	jal	42158 <__ledf2>
   45abe:	00055663          	bgez	a0,45aca <_printf_float+0xbc>
   45ac2:	02d00793          	li	a5,45
   45ac6:	04f401a3          	sb	a5,67(s0)
   45aca:	04700793          	li	a5,71
   45ace:	0967e763          	bltu	a5,s6,45b5c <_printf_float+0x14e>
   45ad2:	0004b937          	lui	s2,0x4b
   45ad6:	d6090913          	add	s2,s2,-672 # 4ad60 <__clz_tab+0x2ac>
   45ada:	478d                	li	a5,3
   45adc:	ffbbfb93          	and	s7,s7,-5
   45ae0:	c81c                	sw	a5,16(s0)
   45ae2:	01742023          	sw	s7,0(s0)
   45ae6:	4981                	li	s3,0
   45ae8:	4572                	lw	a0,28(sp)
   45aea:	8756                	mv	a4,s5
   45aec:	86d2                	mv	a3,s4
   45aee:	1870                	add	a2,sp,60
   45af0:	85a2                	mv	a1,s0
   45af2:	26e1                	jal	45eba <_printf_common>
   45af4:	5bfd                	li	s7,-1
   45af6:	17751a63          	bne	a0,s7,45c6a <_printf_float+0x25c>
   45afa:	557d                	li	a0,-1
   45afc:	50f6                	lw	ra,124(sp)
   45afe:	5466                	lw	s0,120(sp)
   45b00:	54d6                	lw	s1,116(sp)
   45b02:	5946                	lw	s2,112(sp)
   45b04:	59b6                	lw	s3,108(sp)
   45b06:	5a26                	lw	s4,104(sp)
   45b08:	5a96                	lw	s5,100(sp)
   45b0a:	5b06                	lw	s6,96(sp)
   45b0c:	4bf6                	lw	s7,92(sp)
   45b0e:	4c66                	lw	s8,88(sp)
   45b10:	4cd6                	lw	s9,84(sp)
   45b12:	4d46                	lw	s10,80(sp)
   45b14:	4db6                	lw	s11,76(sp)
   45b16:	6109                	add	sp,sp,128
   45b18:	8082                	ret
   45b1a:	079d                	add	a5,a5,7
   45b1c:	9be1                	and	a5,a5,-8
   45b1e:	00878713          	add	a4,a5,8
   45b22:	0007ad03          	lw	s10,0(a5)
   45b26:	0047ad83          	lw	s11,4(a5)
   45b2a:	00e92023          	sw	a4,0(s2)
   45b2e:	b7b9                	j	45a7c <_printf_float+0x6e>
   45b30:	866a                	mv	a2,s10
   45b32:	86ee                	mv	a3,s11
   45b34:	856a                	mv	a0,s10
   45b36:	85ee                	mv	a1,s11
   45b38:	c0cfd0ef          	jal	42f44 <__unorddf2>
   45b3c:	c915                	beqz	a0,45b70 <_printf_float+0x162>
   45b3e:	000dd663          	bgez	s11,45b4a <_printf_float+0x13c>
   45b42:	02d00793          	li	a5,45
   45b46:	04f401a3          	sb	a5,67(s0)
   45b4a:	04700793          	li	a5,71
   45b4e:	0167ec63          	bltu	a5,s6,45b66 <_printf_float+0x158>
   45b52:	0004b937          	lui	s2,0x4b
   45b56:	d6890913          	add	s2,s2,-664 # 4ad68 <__clz_tab+0x2b4>
   45b5a:	b741                	j	45ada <_printf_float+0xcc>
   45b5c:	0004b937          	lui	s2,0x4b
   45b60:	d6490913          	add	s2,s2,-668 # 4ad64 <__clz_tab+0x2b0>
   45b64:	bf9d                	j	45ada <_printf_float+0xcc>
   45b66:	0004b937          	lui	s2,0x4b
   45b6a:	d6c90913          	add	s2,s2,-660 # 4ad6c <__clz_tab+0x2b8>
   45b6e:	b7b5                	j	45ada <_printf_float+0xcc>
   45b70:	405c                	lw	a5,4(s0)
   45b72:	577d                	li	a4,-1
   45b74:	0dfb7993          	and	s3,s6,223
   45b78:	08e79063          	bne	a5,a4,45bf8 <_printf_float+0x1ea>
   45b7c:	4799                	li	a5,6
   45b7e:	c05c                	sw	a5,4(s0)
   45b80:	400be713          	or	a4,s7,1024
   45b84:	c018                	sw	a4,0(s0)
   45b86:	183c                	add	a5,sp,56
   45b88:	c03e                	sw	a5,0(sp)
   45b8a:	c202                	sw	zero,4(sp)
   45b8c:	4054                	lw	a3,4(s0)
   45b8e:	4572                	lw	a0,28(sp)
   45b90:	03310793          	add	a5,sp,51
   45b94:	85ea                	mv	a1,s10
   45b96:	88da                	mv	a7,s6
   45b98:	03410813          	add	a6,sp,52
   45b9c:	866e                	mv	a2,s11
   45b9e:	ce7ff0ef          	jal	45884 <__cvt>
   45ba2:	04700793          	li	a5,71
   45ba6:	55d2                	lw	a1,52(sp)
   45ba8:	892a                	mv	s2,a0
   45baa:	04f99e63          	bne	s3,a5,45c06 <_printf_float+0x1f8>
   45bae:	57f5                	li	a5,-3
   45bb0:	00f5c563          	blt	a1,a5,45bba <_printf_float+0x1ac>
   45bb4:	405c                	lw	a5,4(s0)
   45bb6:	08b7d763          	bge	a5,a1,45c44 <_printf_float+0x236>
   45bba:	1b79                	add	s6,s6,-2
   45bbc:	0ffb7b13          	zext.b	s6,s6
   45bc0:	15fd                	add	a1,a1,-1
   45bc2:	865a                	mv	a2,s6
   45bc4:	05040513          	add	a0,s0,80
   45bc8:	da2e                	sw	a1,52(sp)
   45bca:	3365                	jal	45972 <__exponent>
   45bcc:	5762                	lw	a4,56(sp)
   45bce:	4685                	li	a3,1
   45bd0:	89aa                	mv	s3,a0
   45bd2:	00a707b3          	add	a5,a4,a0
   45bd6:	c81c                	sw	a5,16(s0)
   45bd8:	00e6c563          	blt	a3,a4,45be2 <_printf_float+0x1d4>
   45bdc:	4018                	lw	a4,0(s0)
   45bde:	8b05                	and	a4,a4,1
   45be0:	c319                	beqz	a4,45be6 <_printf_float+0x1d8>
   45be2:	0785                	add	a5,a5,1
   45be4:	c81c                	sw	a5,16(s0)
   45be6:	03314783          	lbu	a5,51(sp)
   45bea:	ee078fe3          	beqz	a5,45ae8 <_printf_float+0xda>
   45bee:	02d00793          	li	a5,45
   45bf2:	04f401a3          	sb	a5,67(s0)
   45bf6:	bdcd                	j	45ae8 <_printf_float+0xda>
   45bf8:	04700713          	li	a4,71
   45bfc:	f8e992e3          	bne	s3,a4,45b80 <_printf_float+0x172>
   45c00:	f3c1                	bnez	a5,45b80 <_printf_float+0x172>
   45c02:	4785                	li	a5,1
   45c04:	bfad                	j	45b7e <_printf_float+0x170>
   45c06:	06500793          	li	a5,101
   45c0a:	fb67fbe3          	bgeu	a5,s6,45bc0 <_printf_float+0x1b2>
   45c0e:	06600793          	li	a5,102
   45c12:	02fb1b63          	bne	s6,a5,45c48 <_printf_float+0x23a>
   45c16:	405c                	lw	a5,4(s0)
   45c18:	00b05b63          	blez	a1,45c2e <_printf_float+0x220>
   45c1c:	c80c                	sw	a1,16(s0)
   45c1e:	e781                	bnez	a5,45c26 <_printf_float+0x218>
   45c20:	4018                	lw	a4,0(s0)
   45c22:	8b05                	and	a4,a4,1
   45c24:	cf09                	beqz	a4,45c3e <_printf_float+0x230>
   45c26:	0785                	add	a5,a5,1
   45c28:	97ae                	add	a5,a5,a1
   45c2a:	c81c                	sw	a5,16(s0)
   45c2c:	a809                	j	45c3e <_printf_float+0x230>
   45c2e:	e789                	bnez	a5,45c38 <_printf_float+0x22a>
   45c30:	4018                	lw	a4,0(s0)
   45c32:	4685                	li	a3,1
   45c34:	8b05                	and	a4,a4,1
   45c36:	c319                	beqz	a4,45c3c <_printf_float+0x22e>
   45c38:	00278693          	add	a3,a5,2
   45c3c:	c814                	sw	a3,16(s0)
   45c3e:	cc2c                	sw	a1,88(s0)
   45c40:	4981                	li	s3,0
   45c42:	b755                	j	45be6 <_printf_float+0x1d8>
   45c44:	06700b13          	li	s6,103
   45c48:	57e2                	lw	a5,56(sp)
   45c4a:	00f5c963          	blt	a1,a5,45c5c <_printf_float+0x24e>
   45c4e:	401c                	lw	a5,0(s0)
   45c50:	c80c                	sw	a1,16(s0)
   45c52:	8b85                	and	a5,a5,1
   45c54:	d7ed                	beqz	a5,45c3e <_printf_float+0x230>
   45c56:	00158793          	add	a5,a1,1
   45c5a:	bfc1                	j	45c2a <_printf_float+0x21c>
   45c5c:	4705                	li	a4,1
   45c5e:	00b04463          	bgtz	a1,45c66 <_printf_float+0x258>
   45c62:	4709                	li	a4,2
   45c64:	8f0d                	sub	a4,a4,a1
   45c66:	97ba                	add	a5,a5,a4
   45c68:	b7c9                	j	45c2a <_printf_float+0x21c>
   45c6a:	401c                	lw	a5,0(s0)
   45c6c:	4007f713          	and	a4,a5,1024
   45c70:	e30d                	bnez	a4,45c92 <_printf_float+0x284>
   45c72:	4814                	lw	a3,16(s0)
   45c74:	4572                	lw	a0,28(sp)
   45c76:	864a                	mv	a2,s2
   45c78:	85d2                	mv	a1,s4
   45c7a:	9a82                	jalr	s5
   45c7c:	e7750fe3          	beq	a0,s7,45afa <_printf_float+0xec>
   45c80:	401c                	lw	a5,0(s0)
   45c82:	8b89                	and	a5,a5,2
   45c84:	22079663          	bnez	a5,45eb0 <_printf_float+0x4a2>
   45c88:	4448                	lw	a0,12(s0)
   45c8a:	57f2                	lw	a5,60(sp)
   45c8c:	0af56533          	max	a0,a0,a5
   45c90:	b5b5                	j	45afc <_printf_float+0xee>
   45c92:	06500713          	li	a4,101
   45c96:	19677663          	bgeu	a4,s6,45e22 <_printf_float+0x414>
   45c9a:	4428                	lw	a0,72(s0)
   45c9c:	446c                	lw	a1,76(s0)
   45c9e:	4601                	li	a2,0
   45ca0:	4681                	li	a3,0
   45ca2:	a38fd0ef          	jal	42eda <__eqdf2>
   45ca6:	e931                	bnez	a0,45cfa <_printf_float+0x2ec>
   45ca8:	4572                	lw	a0,28(sp)
   45caa:	0004b637          	lui	a2,0x4b
   45cae:	4685                	li	a3,1
   45cb0:	d7060613          	add	a2,a2,-656 # 4ad70 <__clz_tab+0x2bc>
   45cb4:	85d2                	mv	a1,s4
   45cb6:	9a82                	jalr	s5
   45cb8:	e57501e3          	beq	a0,s7,45afa <_printf_float+0xec>
   45cbc:	5962                	lw	s2,56(sp)
   45cbe:	57d2                	lw	a5,52(sp)
   45cc0:	0127c563          	blt	a5,s2,45cca <_printf_float+0x2bc>
   45cc4:	401c                	lw	a5,0(s0)
   45cc6:	8b85                	and	a5,a5,1
   45cc8:	dfc5                	beqz	a5,45c80 <_printf_float+0x272>
   45cca:	4572                	lw	a0,28(sp)
   45ccc:	86e2                	mv	a3,s8
   45cce:	8666                	mv	a2,s9
   45cd0:	85d2                	mv	a1,s4
   45cd2:	9a82                	jalr	s5
   45cd4:	57fd                	li	a5,-1
   45cd6:	e2f502e3          	beq	a0,a5,45afa <_printf_float+0xec>
   45cda:	4981                	li	s3,0
   45cdc:	197d                	add	s2,s2,-1
   45cde:	01a40b13          	add	s6,s0,26
   45ce2:	5bfd                	li	s7,-1
   45ce4:	f929dee3          	bge	s3,s2,45c80 <_printf_float+0x272>
   45ce8:	4572                	lw	a0,28(sp)
   45cea:	4685                	li	a3,1
   45cec:	865a                	mv	a2,s6
   45cee:	85d2                	mv	a1,s4
   45cf0:	9a82                	jalr	s5
   45cf2:	e17504e3          	beq	a0,s7,45afa <_printf_float+0xec>
   45cf6:	0985                	add	s3,s3,1
   45cf8:	b7f5                	j	45ce4 <_printf_float+0x2d6>
   45cfa:	57d2                	lw	a5,52(sp)
   45cfc:	06f04763          	bgtz	a5,45d6a <_printf_float+0x35c>
   45d00:	4572                	lw	a0,28(sp)
   45d02:	0004b637          	lui	a2,0x4b
   45d06:	4685                	li	a3,1
   45d08:	d7060613          	add	a2,a2,-656 # 4ad70 <__clz_tab+0x2bc>
   45d0c:	85d2                	mv	a1,s4
   45d0e:	9a82                	jalr	s5
   45d10:	df7505e3          	beq	a0,s7,45afa <_printf_float+0xec>
   45d14:	5b62                	lw	s6,56(sp)
   45d16:	57d2                	lw	a5,52(sp)
   45d18:	00fb67b3          	or	a5,s6,a5
   45d1c:	e781                	bnez	a5,45d24 <_printf_float+0x316>
   45d1e:	401c                	lw	a5,0(s0)
   45d20:	8b85                	and	a5,a5,1
   45d22:	dfb9                	beqz	a5,45c80 <_printf_float+0x272>
   45d24:	4572                	lw	a0,28(sp)
   45d26:	86e2                	mv	a3,s8
   45d28:	8666                	mv	a2,s9
   45d2a:	85d2                	mv	a1,s4
   45d2c:	9a82                	jalr	s5
   45d2e:	57fd                	li	a5,-1
   45d30:	dcf505e3          	beq	a0,a5,45afa <_printf_float+0xec>
   45d34:	4981                	li	s3,0
   45d36:	01a40b93          	add	s7,s0,26
   45d3a:	5c7d                	li	s8,-1
   45d3c:	57d2                	lw	a5,52(sp)
   45d3e:	40f007b3          	neg	a5,a5
   45d42:	00f9cb63          	blt	s3,a5,45d58 <_printf_float+0x34a>
   45d46:	86da                	mv	a3,s6
   45d48:	864a                	mv	a2,s2
   45d4a:	4572                	lw	a0,28(sp)
   45d4c:	85d2                	mv	a1,s4
   45d4e:	9a82                	jalr	s5
   45d50:	57fd                	li	a5,-1
   45d52:	f2f517e3          	bne	a0,a5,45c80 <_printf_float+0x272>
   45d56:	b355                	j	45afa <_printf_float+0xec>
   45d58:	4572                	lw	a0,28(sp)
   45d5a:	4685                	li	a3,1
   45d5c:	865e                	mv	a2,s7
   45d5e:	85d2                	mv	a1,s4
   45d60:	9a82                	jalr	s5
   45d62:	d9850ce3          	beq	a0,s8,45afa <_printf_float+0xec>
   45d66:	0985                	add	s3,s3,1
   45d68:	bfd1                	j	45d3c <_printf_float+0x32e>
   45d6a:	5b62                	lw	s6,56(sp)
   45d6c:	05842983          	lw	s3,88(s0)
   45d70:	0b3b49b3          	min	s3,s6,s3
   45d74:	07304363          	bgtz	s3,45dda <_printf_float+0x3cc>
   45d78:	4d01                	li	s10,0
   45d7a:	01a40d93          	add	s11,s0,26
   45d7e:	54fd                	li	s1,-1
   45d80:	0a09e9b3          	max	s3,s3,zero
   45d84:	05842b83          	lw	s7,88(s0)
   45d88:	413b87b3          	sub	a5,s7,s3
   45d8c:	04fd4f63          	blt	s10,a5,45dea <_printf_float+0x3dc>
   45d90:	57d2                	lw	a5,52(sp)
   45d92:	0767c563          	blt	a5,s6,45dfc <_printf_float+0x3ee>
   45d96:	401c                	lw	a5,0(s0)
   45d98:	8b85                	and	a5,a5,1
   45d9a:	e3ad                	bnez	a5,45dfc <_printf_float+0x3ee>
   45d9c:	59d2                	lw	s3,52(sp)
   45d9e:	417b07b3          	sub	a5,s6,s7
   45da2:	413b09b3          	sub	s3,s6,s3
   45da6:	0af9c9b3          	min	s3,s3,a5
   45daa:	07304263          	bgtz	s3,45e0e <_printf_float+0x400>
   45dae:	4901                	li	s2,0
   45db0:	01a40b93          	add	s7,s0,26
   45db4:	5c7d                	li	s8,-1
   45db6:	0a09e9b3          	max	s3,s3,zero
   45dba:	57d2                	lw	a5,52(sp)
   45dbc:	40fb07b3          	sub	a5,s6,a5
   45dc0:	413787b3          	sub	a5,a5,s3
   45dc4:	eaf95ee3          	bge	s2,a5,45c80 <_printf_float+0x272>
   45dc8:	4572                	lw	a0,28(sp)
   45dca:	4685                	li	a3,1
   45dcc:	865e                	mv	a2,s7
   45dce:	85d2                	mv	a1,s4
   45dd0:	9a82                	jalr	s5
   45dd2:	d38504e3          	beq	a0,s8,45afa <_printf_float+0xec>
   45dd6:	0905                	add	s2,s2,1
   45dd8:	b7cd                	j	45dba <_printf_float+0x3ac>
   45dda:	4572                	lw	a0,28(sp)
   45ddc:	86ce                	mv	a3,s3
   45dde:	864a                	mv	a2,s2
   45de0:	85d2                	mv	a1,s4
   45de2:	9a82                	jalr	s5
   45de4:	f9751ae3          	bne	a0,s7,45d78 <_printf_float+0x36a>
   45de8:	bb09                	j	45afa <_printf_float+0xec>
   45dea:	4572                	lw	a0,28(sp)
   45dec:	4685                	li	a3,1
   45dee:	866e                	mv	a2,s11
   45df0:	85d2                	mv	a1,s4
   45df2:	9a82                	jalr	s5
   45df4:	d09503e3          	beq	a0,s1,45afa <_printf_float+0xec>
   45df8:	0d05                	add	s10,s10,1
   45dfa:	b769                	j	45d84 <_printf_float+0x376>
   45dfc:	4572                	lw	a0,28(sp)
   45dfe:	86e2                	mv	a3,s8
   45e00:	8666                	mv	a2,s9
   45e02:	85d2                	mv	a1,s4
   45e04:	9a82                	jalr	s5
   45e06:	57fd                	li	a5,-1
   45e08:	f8f51ae3          	bne	a0,a5,45d9c <_printf_float+0x38e>
   45e0c:	b1fd                	j	45afa <_printf_float+0xec>
   45e0e:	4572                	lw	a0,28(sp)
   45e10:	86ce                	mv	a3,s3
   45e12:	01790633          	add	a2,s2,s7
   45e16:	85d2                	mv	a1,s4
   45e18:	9a82                	jalr	s5
   45e1a:	57fd                	li	a5,-1
   45e1c:	f8f519e3          	bne	a0,a5,45dae <_printf_float+0x3a0>
   45e20:	b9e9                	j	45afa <_printf_float+0xec>
   45e22:	5b62                	lw	s6,56(sp)
   45e24:	4705                	li	a4,1
   45e26:	4685                	li	a3,1
   45e28:	864a                	mv	a2,s2
   45e2a:	01674463          	blt	a4,s6,45e32 <_printf_float+0x424>
   45e2e:	8b85                	and	a5,a5,1
   45e30:	cb8d                	beqz	a5,45e62 <_printf_float+0x454>
   45e32:	4572                	lw	a0,28(sp)
   45e34:	85d2                	mv	a1,s4
   45e36:	5bfd                	li	s7,-1
   45e38:	9a82                	jalr	s5
   45e3a:	cd7500e3          	beq	a0,s7,45afa <_printf_float+0xec>
   45e3e:	4572                	lw	a0,28(sp)
   45e40:	86e2                	mv	a3,s8
   45e42:	8666                	mv	a2,s9
   45e44:	85d2                	mv	a1,s4
   45e46:	9a82                	jalr	s5
   45e48:	cb7509e3          	beq	a0,s7,45afa <_printf_float+0xec>
   45e4c:	4428                	lw	a0,72(s0)
   45e4e:	446c                	lw	a1,76(s0)
   45e50:	4601                	li	a2,0
   45e52:	4681                	li	a3,0
   45e54:	1b7d                	add	s6,s6,-1
   45e56:	884fd0ef          	jal	42eda <__eqdf2>
   45e5a:	c905                	beqz	a0,45e8a <_printf_float+0x47c>
   45e5c:	86da                	mv	a3,s6
   45e5e:	00190613          	add	a2,s2,1
   45e62:	4572                	lw	a0,28(sp)
   45e64:	85d2                	mv	a1,s4
   45e66:	9a82                	jalr	s5
   45e68:	01751d63          	bne	a0,s7,45e82 <_printf_float+0x474>
   45e6c:	b179                	j	45afa <_printf_float+0xec>
   45e6e:	4572                	lw	a0,28(sp)
   45e70:	4685                	li	a3,1
   45e72:	865e                	mv	a2,s7
   45e74:	85d2                	mv	a1,s4
   45e76:	9a82                	jalr	s5
   45e78:	c98501e3          	beq	a0,s8,45afa <_printf_float+0xec>
   45e7c:	0905                	add	s2,s2,1
   45e7e:	ff6948e3          	blt	s2,s6,45e6e <_printf_float+0x460>
   45e82:	86ce                	mv	a3,s3
   45e84:	05040613          	add	a2,s0,80
   45e88:	b5c9                	j	45d4a <_printf_float+0x33c>
   45e8a:	4901                	li	s2,0
   45e8c:	01a40b93          	add	s7,s0,26
   45e90:	5c7d                	li	s8,-1
   45e92:	b7f5                	j	45e7e <_printf_float+0x470>
   45e94:	4572                	lw	a0,28(sp)
   45e96:	4685                	li	a3,1
   45e98:	864e                	mv	a2,s3
   45e9a:	85d2                	mv	a1,s4
   45e9c:	9a82                	jalr	s5
   45e9e:	c5650ee3          	beq	a0,s6,45afa <_printf_float+0xec>
   45ea2:	0905                	add	s2,s2,1
   45ea4:	445c                	lw	a5,12(s0)
   45ea6:	5772                	lw	a4,60(sp)
   45ea8:	8f99                	sub	a5,a5,a4
   45eaa:	fef945e3          	blt	s2,a5,45e94 <_printf_float+0x486>
   45eae:	bbe9                	j	45c88 <_printf_float+0x27a>
   45eb0:	4901                	li	s2,0
   45eb2:	01940993          	add	s3,s0,25
   45eb6:	5b7d                	li	s6,-1
   45eb8:	b7f5                	j	45ea4 <_printf_float+0x496>

00045eba <_printf_common>:
   45eba:	7179                	add	sp,sp,-48
   45ebc:	ca56                	sw	s5,20(sp)
   45ebe:	499c                	lw	a5,16(a1)
   45ec0:	8aba                	mv	s5,a4
   45ec2:	4598                	lw	a4,8(a1)
   45ec4:	d422                	sw	s0,40(sp)
   45ec6:	d04a                	sw	s2,32(sp)
   45ec8:	ce4e                	sw	s3,28(sp)
   45eca:	cc52                	sw	s4,24(sp)
   45ecc:	d606                	sw	ra,44(sp)
   45ece:	d226                	sw	s1,36(sp)
   45ed0:	c85a                	sw	s6,16(sp)
   45ed2:	c65e                	sw	s7,12(sp)
   45ed4:	0ae7e7b3          	max	a5,a5,a4
   45ed8:	c21c                	sw	a5,0(a2)
   45eda:	0435c703          	lbu	a4,67(a1)
   45ede:	89aa                	mv	s3,a0
   45ee0:	842e                	mv	s0,a1
   45ee2:	8932                	mv	s2,a2
   45ee4:	8a36                	mv	s4,a3
   45ee6:	c319                	beqz	a4,45eec <_printf_common+0x32>
   45ee8:	0785                	add	a5,a5,1
   45eea:	c21c                	sw	a5,0(a2)
   45eec:	401c                	lw	a5,0(s0)
   45eee:	0207f793          	and	a5,a5,32
   45ef2:	c791                	beqz	a5,45efe <_printf_common+0x44>
   45ef4:	00092783          	lw	a5,0(s2)
   45ef8:	0789                	add	a5,a5,2
   45efa:	00f92023          	sw	a5,0(s2)
   45efe:	4004                	lw	s1,0(s0)
   45f00:	8899                	and	s1,s1,6
   45f02:	e891                	bnez	s1,45f16 <_printf_common+0x5c>
   45f04:	01940b13          	add	s6,s0,25
   45f08:	5bfd                	li	s7,-1
   45f0a:	445c                	lw	a5,12(s0)
   45f0c:	00092703          	lw	a4,0(s2)
   45f10:	8f99                	sub	a5,a5,a4
   45f12:	04f4cb63          	blt	s1,a5,45f68 <_printf_common+0xae>
   45f16:	04344783          	lbu	a5,67(s0)
   45f1a:	00f036b3          	snez	a3,a5
   45f1e:	401c                	lw	a5,0(s0)
   45f20:	0207f793          	and	a5,a5,32
   45f24:	e7bd                	bnez	a5,45f92 <_printf_common+0xd8>
   45f26:	04340613          	add	a2,s0,67
   45f2a:	85d2                	mv	a1,s4
   45f2c:	854e                	mv	a0,s3
   45f2e:	9a82                	jalr	s5
   45f30:	57fd                	li	a5,-1
   45f32:	04f50263          	beq	a0,a5,45f76 <_printf_common+0xbc>
   45f36:	401c                	lw	a5,0(s0)
   45f38:	4711                	li	a4,4
   45f3a:	4481                	li	s1,0
   45f3c:	8b99                	and	a5,a5,6
   45f3e:	00e79863          	bne	a5,a4,45f4e <_printf_common+0x94>
   45f42:	4444                	lw	s1,12(s0)
   45f44:	00092783          	lw	a5,0(s2)
   45f48:	8c9d                	sub	s1,s1,a5
   45f4a:	0a04e4b3          	max	s1,s1,zero
   45f4e:	441c                	lw	a5,8(s0)
   45f50:	4818                	lw	a4,16(s0)
   45f52:	00f75463          	bge	a4,a5,45f5a <_printf_common+0xa0>
   45f56:	8f99                	sub	a5,a5,a4
   45f58:	94be                	add	s1,s1,a5
   45f5a:	4901                	li	s2,0
   45f5c:	0469                	add	s0,s0,26
   45f5e:	5b7d                	li	s6,-1
   45f60:	05249863          	bne	s1,s2,45fb0 <_printf_common+0xf6>
   45f64:	4501                	li	a0,0
   45f66:	a809                	j	45f78 <_printf_common+0xbe>
   45f68:	4685                	li	a3,1
   45f6a:	865a                	mv	a2,s6
   45f6c:	85d2                	mv	a1,s4
   45f6e:	854e                	mv	a0,s3
   45f70:	9a82                	jalr	s5
   45f72:	01751e63          	bne	a0,s7,45f8e <_printf_common+0xd4>
   45f76:	557d                	li	a0,-1
   45f78:	50b2                	lw	ra,44(sp)
   45f7a:	5422                	lw	s0,40(sp)
   45f7c:	5492                	lw	s1,36(sp)
   45f7e:	5902                	lw	s2,32(sp)
   45f80:	49f2                	lw	s3,28(sp)
   45f82:	4a62                	lw	s4,24(sp)
   45f84:	4ad2                	lw	s5,20(sp)
   45f86:	4b42                	lw	s6,16(sp)
   45f88:	4bb2                	lw	s7,12(sp)
   45f8a:	6145                	add	sp,sp,48
   45f8c:	8082                	ret
   45f8e:	0485                	add	s1,s1,1
   45f90:	bfad                	j	45f0a <_printf_common+0x50>
   45f92:	00d40733          	add	a4,s0,a3
   45f96:	03000613          	li	a2,48
   45f9a:	04c701a3          	sb	a2,67(a4)
   45f9e:	04544703          	lbu	a4,69(s0)
   45fa2:	00168793          	add	a5,a3,1
   45fa6:	97a2                	add	a5,a5,s0
   45fa8:	0689                	add	a3,a3,2
   45faa:	04e781a3          	sb	a4,67(a5)
   45fae:	bfa5                	j	45f26 <_printf_common+0x6c>
   45fb0:	4685                	li	a3,1
   45fb2:	8622                	mv	a2,s0
   45fb4:	85d2                	mv	a1,s4
   45fb6:	854e                	mv	a0,s3
   45fb8:	9a82                	jalr	s5
   45fba:	fb650ee3          	beq	a0,s6,45f76 <_printf_common+0xbc>
   45fbe:	0905                	add	s2,s2,1
   45fc0:	b745                	j	45f60 <_printf_common+0xa6>

00045fc2 <_printf_i>:
   45fc2:	7179                	add	sp,sp,-48
   45fc4:	d422                	sw	s0,40(sp)
   45fc6:	d04a                	sw	s2,32(sp)
   45fc8:	ce4e                	sw	s3,28(sp)
   45fca:	cc52                	sw	s4,24(sp)
   45fcc:	d606                	sw	ra,44(sp)
   45fce:	d226                	sw	s1,36(sp)
   45fd0:	ca56                	sw	s5,20(sp)
   45fd2:	c85a                	sw	s6,16(sp)
   45fd4:	8a36                	mv	s4,a3
   45fd6:	0185c683          	lbu	a3,24(a1)
   45fda:	07800793          	li	a5,120
   45fde:	892a                	mv	s2,a0
   45fe0:	842e                	mv	s0,a1
   45fe2:	89b2                	mv	s3,a2
   45fe4:	00d7ee63          	bltu	a5,a3,46000 <_printf_i+0x3e>
   45fe8:	06200793          	li	a5,98
   45fec:	04358613          	add	a2,a1,67
   45ff0:	00d7ed63          	bltu	a5,a3,4600a <_printf_i+0x48>
   45ff4:	1a068c63          	beqz	a3,461ac <_printf_i+0x1ea>
   45ff8:	05800793          	li	a5,88
   45ffc:	16f68863          	beq	a3,a5,4616c <_printf_i+0x1aa>
   46000:	04240493          	add	s1,s0,66
   46004:	04d40123          	sb	a3,66(s0)
   46008:	a80d                	j	4603a <_printf_i+0x78>
   4600a:	f9d68793          	add	a5,a3,-99
   4600e:	0ff7f793          	zext.b	a5,a5
   46012:	45d5                	li	a1,21
   46014:	fef5e6e3          	bltu	a1,a5,46000 <_printf_i+0x3e>
   46018:	0004b5b7          	lui	a1,0x4b
   4601c:	03c58593          	add	a1,a1,60 # 4b03c <s_wdgs+0xa4>
   46020:	20b7c7b3          	sh2add	a5,a5,a1
   46024:	439c                	lw	a5,0(a5)
   46026:	8782                	jr	a5
   46028:	431c                	lw	a5,0(a4)
   4602a:	04240493          	add	s1,s0,66
   4602e:	00478693          	add	a3,a5,4
   46032:	439c                	lw	a5,0(a5)
   46034:	c314                	sw	a3,0(a4)
   46036:	04f40123          	sb	a5,66(s0)
   4603a:	4785                	li	a5,1
   4603c:	aa51                	j	461d0 <_printf_i+0x20e>
   4603e:	401c                	lw	a5,0(s0)
   46040:	4308                	lw	a0,0(a4)
   46042:	0807f693          	and	a3,a5,128
   46046:	00450593          	add	a1,a0,4
   4604a:	c28d                	beqz	a3,4606c <_printf_i+0xaa>
   4604c:	411c                	lw	a5,0(a0)
   4604e:	c30c                	sw	a1,0(a4)
   46050:	0004b837          	lui	a6,0x4b
   46054:	0007d863          	bgez	a5,46064 <_printf_i+0xa2>
   46058:	02d00713          	li	a4,45
   4605c:	40f007b3          	neg	a5,a5
   46060:	04e401a3          	sb	a4,67(s0)
   46064:	d7480813          	add	a6,a6,-652 # 4ad74 <__clz_tab+0x2c0>
   46068:	4729                	li	a4,10
   4606a:	a091                	j	460ae <_printf_i+0xec>
   4606c:	0407f693          	and	a3,a5,64
   46070:	411c                	lw	a5,0(a0)
   46072:	c30c                	sw	a1,0(a4)
   46074:	def1                	beqz	a3,46050 <_printf_i+0x8e>
   46076:	60579793          	sext.h	a5,a5
   4607a:	bfd9                	j	46050 <_printf_i+0x8e>
   4607c:	4008                	lw	a0,0(s0)
   4607e:	430c                	lw	a1,0(a4)
   46080:	08057813          	and	a6,a0,128
   46084:	419c                	lw	a5,0(a1)
   46086:	0591                	add	a1,a1,4
   46088:	00081763          	bnez	a6,46096 <_printf_i+0xd4>
   4608c:	04057513          	and	a0,a0,64
   46090:	c119                	beqz	a0,46096 <_printf_i+0xd4>
   46092:	0807c7b3          	zext.h	a5,a5
   46096:	c30c                	sw	a1,0(a4)
   46098:	0004b837          	lui	a6,0x4b
   4609c:	06f00713          	li	a4,111
   460a0:	d7480813          	add	a6,a6,-652 # 4ad74 <__clz_tab+0x2c0>
   460a4:	0ce69e63          	bne	a3,a4,46180 <_printf_i+0x1be>
   460a8:	4721                	li	a4,8
   460aa:	040401a3          	sb	zero,67(s0)
   460ae:	4054                	lw	a3,4(s0)
   460b0:	c414                	sw	a3,8(s0)
   460b2:	0006c863          	bltz	a3,460c2 <_printf_i+0x100>
   460b6:	400c                	lw	a1,0(s0)
   460b8:	8edd                	or	a3,a3,a5
   460ba:	84b2                	mv	s1,a2
   460bc:	99ed                	and	a1,a1,-5
   460be:	c00c                	sw	a1,0(s0)
   460c0:	ce99                	beqz	a3,460de <_printf_i+0x11c>
   460c2:	84b2                	mv	s1,a2
   460c4:	02e7f6b3          	remu	a3,a5,a4
   460c8:	14fd                	add	s1,s1,-1
   460ca:	96c2                	add	a3,a3,a6
   460cc:	0006c683          	lbu	a3,0(a3)
   460d0:	00d48023          	sb	a3,0(s1)
   460d4:	86be                	mv	a3,a5
   460d6:	02e7d7b3          	divu	a5,a5,a4
   460da:	fee6f5e3          	bgeu	a3,a4,460c4 <_printf_i+0x102>
   460de:	47a1                	li	a5,8
   460e0:	00f71e63          	bne	a4,a5,460fc <_printf_i+0x13a>
   460e4:	401c                	lw	a5,0(s0)
   460e6:	8b85                	and	a5,a5,1
   460e8:	cb91                	beqz	a5,460fc <_printf_i+0x13a>
   460ea:	4058                	lw	a4,4(s0)
   460ec:	481c                	lw	a5,16(s0)
   460ee:	00e7c763          	blt	a5,a4,460fc <_printf_i+0x13a>
   460f2:	03000793          	li	a5,48
   460f6:	fef48fa3          	sb	a5,-1(s1)
   460fa:	14fd                	add	s1,s1,-1
   460fc:	8e05                	sub	a2,a2,s1
   460fe:	c810                	sw	a2,16(s0)
   46100:	8752                	mv	a4,s4
   46102:	86ce                	mv	a3,s3
   46104:	0070                	add	a2,sp,12
   46106:	85a2                	mv	a1,s0
   46108:	854a                	mv	a0,s2
   4610a:	3b45                	jal	45eba <_printf_common>
   4610c:	5afd                	li	s5,-1
   4610e:	0d551563          	bne	a0,s5,461d8 <_printf_i+0x216>
   46112:	557d                	li	a0,-1
   46114:	50b2                	lw	ra,44(sp)
   46116:	5422                	lw	s0,40(sp)
   46118:	5492                	lw	s1,36(sp)
   4611a:	5902                	lw	s2,32(sp)
   4611c:	49f2                	lw	s3,28(sp)
   4611e:	4a62                	lw	s4,24(sp)
   46120:	4ad2                	lw	s5,20(sp)
   46122:	4b42                	lw	s6,16(sp)
   46124:	6145                	add	sp,sp,48
   46126:	8082                	ret
   46128:	401c                	lw	a5,0(s0)
   4612a:	0207e793          	or	a5,a5,32
   4612e:	c01c                	sw	a5,0(s0)
   46130:	0004b837          	lui	a6,0x4b
   46134:	07800693          	li	a3,120
   46138:	d8880813          	add	a6,a6,-632 # 4ad88 <__clz_tab+0x2d4>
   4613c:	04d402a3          	sb	a3,69(s0)
   46140:	4014                	lw	a3,0(s0)
   46142:	430c                	lw	a1,0(a4)
   46144:	0806f513          	and	a0,a3,128
   46148:	419c                	lw	a5,0(a1)
   4614a:	0591                	add	a1,a1,4
   4614c:	e511                	bnez	a0,46158 <_printf_i+0x196>
   4614e:	0406f513          	and	a0,a3,64
   46152:	c119                	beqz	a0,46158 <_printf_i+0x196>
   46154:	0807c7b3          	zext.h	a5,a5
   46158:	c30c                	sw	a1,0(a4)
   4615a:	0016f713          	and	a4,a3,1
   4615e:	c701                	beqz	a4,46166 <_printf_i+0x1a4>
   46160:	0206e693          	or	a3,a3,32
   46164:	c014                	sw	a3,0(s0)
   46166:	cb81                	beqz	a5,46176 <_printf_i+0x1b4>
   46168:	4741                	li	a4,16
   4616a:	b781                	j	460aa <_printf_i+0xe8>
   4616c:	0004b837          	lui	a6,0x4b
   46170:	d7480813          	add	a6,a6,-652 # 4ad74 <__clz_tab+0x2c0>
   46174:	b7e1                	j	4613c <_printf_i+0x17a>
   46176:	4018                	lw	a4,0(s0)
   46178:	fdf77713          	and	a4,a4,-33
   4617c:	c018                	sw	a4,0(s0)
   4617e:	b7ed                	j	46168 <_printf_i+0x1a6>
   46180:	4729                	li	a4,10
   46182:	b725                	j	460aa <_printf_i+0xe8>
   46184:	4014                	lw	a3,0(s0)
   46186:	431c                	lw	a5,0(a4)
   46188:	484c                	lw	a1,20(s0)
   4618a:	0806f813          	and	a6,a3,128
   4618e:	00478513          	add	a0,a5,4
   46192:	00080663          	beqz	a6,4619e <_printf_i+0x1dc>
   46196:	c308                	sw	a0,0(a4)
   46198:	439c                	lw	a5,0(a5)
   4619a:	c38c                	sw	a1,0(a5)
   4619c:	a801                	j	461ac <_printf_i+0x1ea>
   4619e:	c308                	sw	a0,0(a4)
   461a0:	0406f693          	and	a3,a3,64
   461a4:	439c                	lw	a5,0(a5)
   461a6:	daf5                	beqz	a3,4619a <_printf_i+0x1d8>
   461a8:	00b79023          	sh	a1,0(a5)
   461ac:	00042823          	sw	zero,16(s0)
   461b0:	84b2                	mv	s1,a2
   461b2:	b7b9                	j	46100 <_printf_i+0x13e>
   461b4:	431c                	lw	a5,0(a4)
   461b6:	4050                	lw	a2,4(s0)
   461b8:	4581                	li	a1,0
   461ba:	00478693          	add	a3,a5,4
   461be:	c314                	sw	a3,0(a4)
   461c0:	4384                	lw	s1,0(a5)
   461c2:	8526                	mv	a0,s1
   461c4:	6f5020ef          	jal	490b8 <memchr>
   461c8:	c119                	beqz	a0,461ce <_printf_i+0x20c>
   461ca:	8d05                	sub	a0,a0,s1
   461cc:	c048                	sw	a0,4(s0)
   461ce:	405c                	lw	a5,4(s0)
   461d0:	c81c                	sw	a5,16(s0)
   461d2:	040401a3          	sb	zero,67(s0)
   461d6:	b72d                	j	46100 <_printf_i+0x13e>
   461d8:	4814                	lw	a3,16(s0)
   461da:	8626                	mv	a2,s1
   461dc:	85ce                	mv	a1,s3
   461de:	854a                	mv	a0,s2
   461e0:	9a02                	jalr	s4
   461e2:	f35508e3          	beq	a0,s5,46112 <_printf_i+0x150>
   461e6:	401c                	lw	a5,0(s0)
   461e8:	8b89                	and	a5,a5,2
   461ea:	e785                	bnez	a5,46212 <_printf_i+0x250>
   461ec:	4448                	lw	a0,12(s0)
   461ee:	47b2                	lw	a5,12(sp)
   461f0:	0af56533          	max	a0,a0,a5
   461f4:	b705                	j	46114 <_printf_i+0x152>
   461f6:	4685                	li	a3,1
   461f8:	8656                	mv	a2,s5
   461fa:	85ce                	mv	a1,s3
   461fc:	854a                	mv	a0,s2
   461fe:	9a02                	jalr	s4
   46200:	f16509e3          	beq	a0,s6,46112 <_printf_i+0x150>
   46204:	0485                	add	s1,s1,1
   46206:	445c                	lw	a5,12(s0)
   46208:	4732                	lw	a4,12(sp)
   4620a:	8f99                	sub	a5,a5,a4
   4620c:	fef4c5e3          	blt	s1,a5,461f6 <_printf_i+0x234>
   46210:	bff1                	j	461ec <_printf_i+0x22a>
   46212:	4481                	li	s1,0
   46214:	01940a93          	add	s5,s0,25
   46218:	5b7d                	li	s6,-1
   4621a:	b7f5                	j	46206 <_printf_i+0x244>

0004621c <_scanf_float>:
   4621c:	459c                	lw	a5,8(a1)
   4621e:	711d                	add	sp,sp,-96
   46220:	cca2                	sw	s0,88(sp)
   46222:	c6ce                	sw	s3,76(sp)
   46224:	c2d6                	sw	s5,68(sp)
   46226:	c0da                	sw	s6,64(sp)
   46228:	89b2                	mv	s3,a2
   4622a:	ce86                	sw	ra,92(sp)
   4622c:	caa6                	sw	s1,84(sp)
   4622e:	c8ca                	sw	s2,80(sp)
   46230:	c4d2                	sw	s4,72(sp)
   46232:	de5e                	sw	s7,60(sp)
   46234:	dc62                	sw	s8,56(sp)
   46236:	da66                	sw	s9,52(sp)
   46238:	d86a                	sw	s10,48(sp)
   4623a:	d66e                	sw	s11,44(sp)
   4623c:	c42a                	sw	a0,8(sp)
   4623e:	fff78613          	add	a2,a5,-1
   46242:	15c00713          	li	a4,348
   46246:	842e                	mv	s0,a1
   46248:	8b36                	mv	s6,a3
   4624a:	4a81                	li	s5,0
   4624c:	00c77763          	bgeu	a4,a2,4625a <_scanf_float+0x3e>
   46250:	ea378a93          	add	s5,a5,-349
   46254:	15d00793          	li	a5,349
   46258:	c59c                	sw	a5,8(a1)
   4625a:	401c                	lw	a5,0(s0)
   4625c:	01c40b93          	add	s7,s0,28
   46260:	0004b637          	lui	a2,0x4b
   46264:	7807e793          	or	a5,a5,1920
   46268:	0004b837          	lui	a6,0x4b
   4626c:	0004b8b7          	lui	a7,0x4b
   46270:	c01c                	sw	a5,0(s0)
   46272:	84de                	mv	s1,s7
   46274:	4901                	li	s2,0
   46276:	4d81                	li	s11,0
   46278:	4d01                	li	s10,0
   4627a:	4c81                	li	s9,0
   4627c:	4a01                	li	s4,0
   4627e:	4c01                	li	s8,0
   46280:	04e00313          	li	t1,78
   46284:	06e00e13          	li	t3,110
   46288:	09460613          	add	a2,a2,148 # 4b094 <s_wdgs+0xfc>
   4628c:	09480813          	add	a6,a6,148 # 4b094 <s_wdgs+0xfc>
   46290:	0cc88893          	add	a7,a7,204 # 4b0cc <s_wdgs+0x134>
   46294:	440c                	lw	a1,8(s0)
   46296:	c195                	beqz	a1,462ba <_scanf_float+0x9e>
   46298:	0009a783          	lw	a5,0(s3)
   4629c:	0007c783          	lbu	a5,0(a5)
   462a0:	08f36263          	bltu	t1,a5,46324 <_scanf_float+0x108>
   462a4:	04000713          	li	a4,64
   462a8:	06f76063          	bltu	a4,a5,46308 <_scanf_float+0xec>
   462ac:	fd578713          	add	a4,a5,-43
   462b0:	0ff77713          	zext.b	a4,a4
   462b4:	4539                	li	a0,14
   462b6:	06e57363          	bgeu	a0,a4,4631c <_scanf_float+0x100>
   462ba:	000a0663          	beqz	s4,462c6 <_scanf_float+0xaa>
   462be:	401c                	lw	a5,0(s0)
   462c0:	eff7f793          	and	a5,a5,-257
   462c4:	c01c                	sw	a5,0(s0)
   462c6:	1dfd                	add	s11,s11,-1
   462c8:	4785                	li	a5,1
   462ca:	21b7ed63          	bltu	a5,s11,464e4 <_scanf_float+0x2c8>
   462ce:	1e9bef63          	bltu	s7,s1,464cc <_scanf_float+0x2b0>
   462d2:	4505                	li	a0,1
   462d4:	40f6                	lw	ra,92(sp)
   462d6:	4466                	lw	s0,88(sp)
   462d8:	44d6                	lw	s1,84(sp)
   462da:	4946                	lw	s2,80(sp)
   462dc:	49b6                	lw	s3,76(sp)
   462de:	4a26                	lw	s4,72(sp)
   462e0:	4a96                	lw	s5,68(sp)
   462e2:	4b06                	lw	s6,64(sp)
   462e4:	5bf2                	lw	s7,60(sp)
   462e6:	5c62                	lw	s8,56(sp)
   462e8:	5cd2                	lw	s9,52(sp)
   462ea:	5d42                	lw	s10,48(sp)
   462ec:	5db2                	lw	s11,44(sp)
   462ee:	6125                	add	sp,sp,96
   462f0:	8082                	ret
   462f2:	f9f78713          	add	a4,a5,-97
   462f6:	0ff77713          	zext.b	a4,a4
   462fa:	45b5                	li	a1,13
   462fc:	fae5efe3          	bltu	a1,a4,462ba <_scanf_float+0x9e>
   46300:	20c74733          	sh2add	a4,a4,a2
   46304:	4318                	lw	a4,0(a4)
   46306:	8702                	jr	a4
   46308:	fbf78713          	add	a4,a5,-65
   4630c:	0ff77713          	zext.b	a4,a4
   46310:	45b5                	li	a1,13
   46312:	fae5e4e3          	bltu	a1,a4,462ba <_scanf_float+0x9e>
   46316:	21074733          	sh2add	a4,a4,a6
   4631a:	b7ed                	j	46304 <_scanf_float+0xe8>
   4631c:	21174733          	sh2add	a4,a4,a7
   46320:	4318                	lw	a4,0(a4)
   46322:	8702                	jr	a4
   46324:	02fe6363          	bltu	t3,a5,4634a <_scanf_float+0x12e>
   46328:	06000713          	li	a4,96
   4632c:	fcf763e3          	bltu	a4,a5,462f2 <_scanf_float+0xd6>
   46330:	05400713          	li	a4,84
   46334:	10e78763          	beq	a5,a4,46442 <_scanf_float+0x226>
   46338:	05900713          	li	a4,89
   4633c:	f6e79fe3          	bne	a5,a4,462ba <_scanf_float+0x9e>
   46340:	471d                	li	a4,7
   46342:	f6e91ce3          	bne	s2,a4,462ba <_scanf_float+0x9e>
   46346:	4921                	li	s2,8
   46348:	a09d                	j	463ae <_scanf_float+0x192>
   4634a:	07400713          	li	a4,116
   4634e:	0ee78a63          	beq	a5,a4,46442 <_scanf_float+0x226>
   46352:	07900713          	li	a4,121
   46356:	b7dd                	j	4633c <_scanf_float+0x120>
   46358:	4018                	lw	a4,0(s0)
   4635a:	10077513          	and	a0,a4,256
   4635e:	cd0d                	beqz	a0,46398 <_scanf_float+0x17c>
   46360:	f7f77713          	and	a4,a4,-129
   46364:	c018                	sw	a4,0(s0)
   46366:	0a05                	add	s4,s4,1
   46368:	000a8563          	beqz	s5,46372 <_scanf_float+0x156>
   4636c:	0585                	add	a1,a1,1
   4636e:	1afd                	add	s5,s5,-1
   46370:	c40c                	sw	a1,8(s0)
   46372:	441c                	lw	a5,8(s0)
   46374:	17fd                	add	a5,a5,-1
   46376:	c41c                	sw	a5,8(s0)
   46378:	481c                	lw	a5,16(s0)
   4637a:	0785                	add	a5,a5,1
   4637c:	c81c                	sw	a5,16(s0)
   4637e:	0049a783          	lw	a5,4(s3)
   46382:	17fd                	add	a5,a5,-1
   46384:	00f9a223          	sw	a5,4(s3)
   46388:	10f05a63          	blez	a5,4649c <_scanf_float+0x280>
   4638c:	0009a783          	lw	a5,0(s3)
   46390:	0785                	add	a5,a5,1
   46392:	00f9a023          	sw	a5,0(s3)
   46396:	bdfd                	j	46294 <_scanf_float+0x78>
   46398:	012d8733          	add	a4,s11,s2
   4639c:	ff19                	bnez	a4,462ba <_scanf_float+0x9e>
   4639e:	4018                	lw	a4,0(s0)
   463a0:	4901                	li	s2,0
   463a2:	4d81                	li	s11,0
   463a4:	f7f77713          	and	a4,a4,-129
   463a8:	eff77713          	and	a4,a4,-257
   463ac:	c018                	sw	a4,0(s0)
   463ae:	00f48023          	sb	a5,0(s1)
   463b2:	0485                	add	s1,s1,1
   463b4:	bf7d                	j	46372 <_scanf_float+0x156>
   463b6:	4018                	lw	a4,0(s0)
   463b8:	08077593          	and	a1,a4,128
   463bc:	ee058fe3          	beqz	a1,462ba <_scanf_float+0x9e>
   463c0:	f7f77713          	and	a4,a4,-129
   463c4:	c018                	sw	a4,0(s0)
   463c6:	b7e5                	j	463ae <_scanf_float+0x192>
   463c8:	020d9063          	bnez	s11,463e8 <_scanf_float+0x1cc>
   463cc:	020a1163          	bnez	s4,463ee <_scanf_float+0x1d2>
   463d0:	4018                	lw	a4,0(s0)
   463d2:	70000593          	li	a1,1792
   463d6:	70077513          	and	a0,a4,1792
   463da:	00b51a63          	bne	a0,a1,463ee <_scanf_float+0x1d2>
   463de:	87f77713          	and	a4,a4,-1921
   463e2:	c018                	sw	a4,0(s0)
   463e4:	4d85                	li	s11,1
   463e6:	b7e1                	j	463ae <_scanf_float+0x192>
   463e8:	4709                	li	a4,2
   463ea:	0aed8763          	beq	s11,a4,46498 <_scanf_float+0x27c>
   463ee:	4705                	li	a4,1
   463f0:	00e90563          	beq	s2,a4,463fa <_scanf_float+0x1de>
   463f4:	4711                	li	a4,4
   463f6:	ece912e3          	bne	s2,a4,462ba <_scanf_float+0x9e>
   463fa:	0905                	add	s2,s2,1
   463fc:	0ff97913          	zext.b	s2,s2
   46400:	b77d                	j	463ae <_scanf_float+0x192>
   46402:	4705                	li	a4,1
   46404:	eaed9be3          	bne	s11,a4,462ba <_scanf_float+0x9e>
   46408:	4d89                	li	s11,2
   4640a:	b755                	j	463ae <_scanf_float+0x192>
   4640c:	02091063          	bnez	s2,4642c <_scanf_float+0x210>
   46410:	ea0a17e3          	bnez	s4,462be <_scanf_float+0xa2>
   46414:	4018                	lw	a4,0(s0)
   46416:	70000593          	li	a1,1792
   4641a:	70077513          	and	a0,a4,1792
   4641e:	26b51d63          	bne	a0,a1,46698 <_scanf_float+0x47c>
   46422:	87f77713          	and	a4,a4,-1921
   46426:	c018                	sw	a4,0(s0)
   46428:	4905                	li	s2,1
   4642a:	b751                	j	463ae <_scanf_float+0x192>
   4642c:	ffd90713          	add	a4,s2,-3
   46430:	0fd77713          	and	a4,a4,253
   46434:	d379                	beqz	a4,463fa <_scanf_float+0x1de>
   46436:	b551                	j	462ba <_scanf_float+0x9e>
   46438:	4709                	li	a4,2
   4643a:	e8e910e3          	bne	s2,a4,462ba <_scanf_float+0x9e>
   4643e:	490d                	li	s2,3
   46440:	b7bd                	j	463ae <_scanf_float+0x192>
   46442:	4719                	li	a4,6
   46444:	e6e91be3          	bne	s2,a4,462ba <_scanf_float+0x9e>
   46448:	491d                	li	s2,7
   4644a:	b795                	j	463ae <_scanf_float+0x192>
   4644c:	4018                	lw	a4,0(s0)
   4644e:	20077593          	and	a1,a4,512
   46452:	e60584e3          	beqz	a1,462ba <_scanf_float+0x9e>
   46456:	f7f77713          	and	a4,a4,-129
   4645a:	dff77713          	and	a4,a4,-513
   4645e:	c018                	sw	a4,0(s0)
   46460:	8c52                	mv	s8,s4
   46462:	b7b1                	j	463ae <_scanf_float+0x192>
   46464:	4018                	lw	a4,0(s0)
   46466:	40000593          	li	a1,1024
   4646a:	50077513          	and	a0,a4,1280
   4646e:	00b50863          	beq	a0,a1,4647e <_scanf_float+0x262>
   46472:	40077593          	and	a1,a4,1024
   46476:	e40582e3          	beqz	a1,462ba <_scanf_float+0x9e>
   4647a:	200a0f63          	beqz	s4,46698 <_scanf_float+0x47c>
   4647e:	20077593          	and	a1,a4,512
   46482:	e581                	bnez	a1,4648a <_scanf_float+0x26e>
   46484:	418a0cb3          	sub	s9,s4,s8
   46488:	8d26                	mv	s10,s1
   4648a:	87f77713          	and	a4,a4,-1921
   4648e:	18076713          	or	a4,a4,384
   46492:	c018                	sw	a4,0(s0)
   46494:	4a01                	li	s4,0
   46496:	bf21                	j	463ae <_scanf_float+0x192>
   46498:	4d8d                	li	s11,3
   4649a:	bf11                	j	463ae <_scanf_float+0x192>
   4649c:	18042783          	lw	a5,384(s0)
   464a0:	4522                	lw	a0,8(sp)
   464a2:	85ce                	mv	a1,s3
   464a4:	9782                	jalr	a5
   464a6:	0004b7b7          	lui	a5,0x4b
   464aa:	09478613          	add	a2,a5,148 # 4b094 <s_wdgs+0xfc>
   464ae:	0004b7b7          	lui	a5,0x4b
   464b2:	09478813          	add	a6,a5,148 # 4b094 <s_wdgs+0xfc>
   464b6:	0004b7b7          	lui	a5,0x4b
   464ba:	04e00313          	li	t1,78
   464be:	06e00e13          	li	t3,110
   464c2:	0cc78893          	add	a7,a5,204 # 4b0cc <s_wdgs+0x134>
   464c6:	dc0507e3          	beqz	a0,46294 <_scanf_float+0x78>
   464ca:	bbc5                	j	462ba <_scanf_float+0x9e>
   464cc:	17c42783          	lw	a5,380(s0)
   464d0:	4522                	lw	a0,8(sp)
   464d2:	fff4c583          	lbu	a1,-1(s1)
   464d6:	864e                	mv	a2,s3
   464d8:	14fd                	add	s1,s1,-1
   464da:	9782                	jalr	a5
   464dc:	481c                	lw	a5,16(s0)
   464de:	17fd                	add	a5,a5,-1
   464e0:	c81c                	sw	a5,16(s0)
   464e2:	b3f5                	j	462ce <_scanf_float+0xb2>
   464e4:	fff90793          	add	a5,s2,-1
   464e8:	4719                	li	a4,6
   464ea:	02f76663          	bltu	a4,a5,46516 <_scanf_float+0x2fa>
   464ee:	4789                	li	a5,2
   464f0:	8da6                	mv	s11,s1
   464f2:	0927f063          	bgeu	a5,s2,46572 <_scanf_float+0x356>
   464f6:	40990733          	sub	a4,s2,s1
   464fa:	0ff77713          	zext.b	a4,a4
   464fe:	4a8d                	li	s5,3
   46500:	00ed87b3          	add	a5,s11,a4
   46504:	0ff7f793          	zext.b	a5,a5
   46508:	03579c63          	bne	a5,s5,46540 <_scanf_float+0x324>
   4650c:	1975                	add	s2,s2,-3
   4650e:	0ff97913          	zext.b	s2,s2
   46512:	412484b3          	sub	s1,s1,s2
   46516:	401c                	lw	a5,0(s0)
   46518:	1007f713          	and	a4,a5,256
   4651c:	cf59                	beqz	a4,465ba <_scanf_float+0x39e>
   4651e:	4007f793          	and	a5,a5,1024
   46522:	cbb9                	beqz	a5,46578 <_scanf_float+0x35c>
   46524:	da9bf7e3          	bgeu	s7,s1,462d2 <_scanf_float+0xb6>
   46528:	17c42783          	lw	a5,380(s0)
   4652c:	4522                	lw	a0,8(sp)
   4652e:	fff4c583          	lbu	a1,-1(s1)
   46532:	864e                	mv	a2,s3
   46534:	14fd                	add	s1,s1,-1
   46536:	9782                	jalr	a5
   46538:	481c                	lw	a5,16(s0)
   4653a:	17fd                	add	a5,a5,-1
   4653c:	c81c                	sw	a5,16(s0)
   4653e:	b7dd                	j	46524 <_scanf_float+0x308>
   46540:	17c42783          	lw	a5,380(s0)
   46544:	4522                	lw	a0,8(sp)
   46546:	fffdc583          	lbu	a1,-1(s11)
   4654a:	864e                	mv	a2,s3
   4654c:	c63a                	sw	a4,12(sp)
   4654e:	9782                	jalr	a5
   46550:	481c                	lw	a5,16(s0)
   46552:	1dfd                	add	s11,s11,-1
   46554:	4732                	lw	a4,12(sp)
   46556:	17fd                	add	a5,a5,-1
   46558:	c81c                	sw	a5,16(s0)
   4655a:	b75d                	j	46500 <_scanf_float+0x2e4>
   4655c:	17c42783          	lw	a5,380(s0)
   46560:	4522                	lw	a0,8(sp)
   46562:	fff4c583          	lbu	a1,-1(s1)
   46566:	864e                	mv	a2,s3
   46568:	14fd                	add	s1,s1,-1
   4656a:	9782                	jalr	a5
   4656c:	481c                	lw	a5,16(s0)
   4656e:	17fd                	add	a5,a5,-1
   46570:	c81c                	sw	a5,16(s0)
   46572:	fe9be5e3          	bltu	s7,s1,4655c <_scanf_float+0x340>
   46576:	bbb1                	j	462d2 <_scanf_float+0xb6>
   46578:	481c                	lw	a5,16(s0)
   4657a:	fff4c583          	lbu	a1,-1(s1)
   4657e:	fff48913          	add	s2,s1,-1
   46582:	17fd                	add	a5,a5,-1
   46584:	c81c                	sw	a5,16(s0)
   46586:	06500793          	li	a5,101
   4658a:	02f58263          	beq	a1,a5,465ae <_scanf_float+0x392>
   4658e:	04500793          	li	a5,69
   46592:	00f58e63          	beq	a1,a5,465ae <_scanf_float+0x392>
   46596:	17c42783          	lw	a5,380(s0)
   4659a:	4522                	lw	a0,8(sp)
   4659c:	864e                	mv	a2,s3
   4659e:	ffe48913          	add	s2,s1,-2
   465a2:	9782                	jalr	a5
   465a4:	481c                	lw	a5,16(s0)
   465a6:	ffe4c583          	lbu	a1,-2(s1)
   465aa:	17fd                	add	a5,a5,-1
   465ac:	c81c                	sw	a5,16(s0)
   465ae:	17c42783          	lw	a5,380(s0)
   465b2:	4522                	lw	a0,8(sp)
   465b4:	864e                	mv	a2,s3
   465b6:	84ca                	mv	s1,s2
   465b8:	9782                	jalr	a5
   465ba:	401c                	lw	a5,0(s0)
   465bc:	8bc1                	and	a5,a5,16
   465be:	c399                	beqz	a5,465c4 <_scanf_float+0x3a8>
   465c0:	4501                	li	a0,0
   465c2:	bb09                	j	462d4 <_scanf_float+0xb8>
   465c4:	00048023          	sb	zero,0(s1)
   465c8:	401c                	lw	a5,0(s0)
   465ca:	40000713          	li	a4,1024
   465ce:	6007f793          	and	a5,a5,1536
   465d2:	02e79e63          	bne	a5,a4,4660e <_scanf_float+0x3f2>
   465d6:	414c0633          	sub	a2,s8,s4
   465da:	054c1663          	bne	s8,s4,46626 <_scanf_float+0x40a>
   465de:	4522                	lw	a0,8(sp)
   465e0:	4601                	li	a2,0
   465e2:	85de                	mv	a1,s7
   465e4:	789000ef          	jal	4756c <_strtod_r>
   465e8:	4018                	lw	a4,0(s0)
   465ea:	000b2783          	lw	a5,0(s6)
   465ee:	892a                	mv	s2,a0
   465f0:	00277693          	and	a3,a4,2
   465f4:	84ae                	mv	s1,a1
   465f6:	c6a9                	beqz	a3,46640 <_scanf_float+0x424>
   465f8:	00478713          	add	a4,a5,4
   465fc:	00eb2023          	sw	a4,0(s6)
   46600:	4394                	lw	a3,0(a5)
   46602:	c288                	sw	a0,0(a3)
   46604:	c2cc                	sw	a1,4(a3)
   46606:	445c                	lw	a5,12(s0)
   46608:	0785                	add	a5,a5,1
   4660a:	c45c                	sw	a5,12(s0)
   4660c:	bf55                	j	465c0 <_scanf_float+0x3a4>
   4660e:	fc0c88e3          	beqz	s9,465de <_scanf_float+0x3c2>
   46612:	4522                	lw	a0,8(sp)
   46614:	4601                	li	a2,0
   46616:	46a9                	li	a3,10
   46618:	001d0593          	add	a1,s10,1
   4661c:	092010ef          	jal	476ae <_strtol_r>
   46620:	41950633          	sub	a2,a0,s9
   46624:	84ea                	mv	s1,s10
   46626:	16f40793          	add	a5,s0,367
   4662a:	00f4e463          	bltu	s1,a5,46632 <_scanf_float+0x416>
   4662e:	16e40493          	add	s1,s0,366
   46632:	0004b5b7          	lui	a1,0x4b
   46636:	d9c58593          	add	a1,a1,-612 # 4ad9c <__clz_tab+0x2e8>
   4663a:	8526                	mv	a0,s1
   4663c:	2c0d                	jal	4686e <siprintf>
   4663e:	b745                	j	465de <_scanf_float+0x3c2>
   46640:	00478693          	add	a3,a5,4
   46644:	00db2023          	sw	a3,0(s6)
   46648:	8b11                	and	a4,a4,4
   4664a:	0007a983          	lw	s3,0(a5)
   4664e:	c31d                	beqz	a4,46674 <_scanf_float+0x458>
   46650:	85aa                	mv	a1,a0
   46652:	8626                	mv	a2,s1
   46654:	0808                	add	a0,sp,16
   46656:	b67fc0ef          	jal	431bc <__extenddftf2>
   4665a:	4642                	lw	a2,16(sp)
   4665c:	46d2                	lw	a3,20(sp)
   4665e:	4762                	lw	a4,24(sp)
   46660:	47f2                	lw	a5,28(sp)
   46662:	00c9a023          	sw	a2,0(s3)
   46666:	00d9a223          	sw	a3,4(s3)
   4666a:	00e9a423          	sw	a4,8(s3)
   4666e:	00f9a623          	sw	a5,12(s3)
   46672:	bf51                	j	46606 <_scanf_float+0x3ea>
   46674:	862a                	mv	a2,a0
   46676:	86ae                	mv	a3,a1
   46678:	8cdfc0ef          	jal	42f44 <__unorddf2>
   4667c:	c909                	beqz	a0,4668e <_scanf_float+0x472>
   4667e:	0004b537          	lui	a0,0x4b
   46682:	c8850513          	add	a0,a0,-888 # 4ac88 <__clz_tab+0x1d4>
   46686:	2af9                	jal	46864 <nanf>
   46688:	00a9a023          	sw	a0,0(s3)
   4668c:	bfad                	j	46606 <_scanf_float+0x3ea>
   4668e:	854a                	mv	a0,s2
   46690:	85a6                	mv	a1,s1
   46692:	e9afc0ef          	jal	42d2c <__truncdfsf2>
   46696:	bfcd                	j	46688 <_scanf_float+0x46c>
   46698:	4a01                	li	s4,0
   4669a:	b135                	j	462c6 <_scanf_float+0xaa>

0004669c <iprintf>:
   4669c:	715d                	add	sp,sp,-80
   4669e:	c2be                	sw	a5,68(sp)
   466a0:	d422                	sw	s0,40(sp)
   466a2:	842a                	mv	s0,a0
   466a4:	9d01a503          	lw	a0,-1584(gp) # 12d01d0 <_impure_ptr>
   466a8:	d606                	sw	ra,44(sp)
   466aa:	da2e                	sw	a1,52(sp)
   466ac:	dc32                	sw	a2,56(sp)
   466ae:	de36                	sw	a3,60(sp)
   466b0:	c0ba                	sw	a4,64(sp)
   466b2:	c4c2                	sw	a6,72(sp)
   466b4:	c6c6                	sw	a7,76(sp)
   466b6:	c519                	beqz	a0,466c4 <iprintf+0x28>
   466b8:	4d1c                	lw	a5,24(a0)
   466ba:	e789                	bnez	a5,466c4 <iprintf+0x28>
   466bc:	c62a                	sw	a0,12(sp)
   466be:	795010ef          	jal	48652 <__sinit>
   466c2:	4532                	lw	a0,12(sp)
   466c4:	450c                	lw	a1,8(a0)
   466c6:	1854                	add	a3,sp,52
   466c8:	8622                	mv	a2,s0
   466ca:	ce36                	sw	a3,28(sp)
   466cc:	2b7030ef          	jal	4a182 <_vfiprintf_r>
   466d0:	50b2                	lw	ra,44(sp)
   466d2:	5422                	lw	s0,40(sp)
   466d4:	6161                	add	sp,sp,80
   466d6:	8082                	ret

000466d8 <setvbuf>:
   466d8:	7179                	add	sp,sp,-48
   466da:	ce4e                	sw	s3,28(sp)
   466dc:	9d01a983          	lw	s3,-1584(gp) # 12d01d0 <_impure_ptr>
   466e0:	d422                	sw	s0,40(sp)
   466e2:	d226                	sw	s1,36(sp)
   466e4:	d04a                	sw	s2,32(sp)
   466e6:	cc52                	sw	s4,24(sp)
   466e8:	d606                	sw	ra,44(sp)
   466ea:	ca56                	sw	s5,20(sp)
   466ec:	842a                	mv	s0,a0
   466ee:	892e                	mv	s2,a1
   466f0:	8a32                	mv	s4,a2
   466f2:	84b6                	mv	s1,a3
   466f4:	00098863          	beqz	s3,46704 <setvbuf+0x2c>
   466f8:	0189a783          	lw	a5,24(s3)
   466fc:	e781                	bnez	a5,46704 <setvbuf+0x2c>
   466fe:	854e                	mv	a0,s3
   46700:	753010ef          	jal	48652 <__sinit>
   46704:	0004b7b7          	lui	a5,0x4b
   46708:	2b478793          	add	a5,a5,692 # 4b2b4 <__sf_fake_stdin>
   4670c:	0cf41263          	bne	s0,a5,467d0 <setvbuf+0xf8>
   46710:	0049a403          	lw	s0,4(s3)
   46714:	4789                	li	a5,2
   46716:	00fa0863          	beq	s4,a5,46726 <setvbuf+0x4e>
   4671a:	4785                	li	a5,1
   4671c:	557d                	li	a0,-1
   4671e:	0b47e063          	bltu	a5,s4,467be <setvbuf+0xe6>
   46722:	0804ce63          	bltz	s1,467be <setvbuf+0xe6>
   46726:	85a2                	mv	a1,s0
   46728:	854e                	mv	a0,s3
   4672a:	607010ef          	jal	48530 <_fflush_r>
   4672e:	584c                	lw	a1,52(s0)
   46730:	c991                	beqz	a1,46744 <setvbuf+0x6c>
   46732:	04440793          	add	a5,s0,68
   46736:	00f58563          	beq	a1,a5,46740 <setvbuf+0x68>
   4673a:	854e                	mv	a0,s3
   4673c:	502030ef          	jal	49c3e <_free_r>
   46740:	02042a23          	sw	zero,52(s0)
   46744:	00c45783          	lhu	a5,12(s0)
   46748:	00042c23          	sw	zero,24(s0)
   4674c:	00042223          	sw	zero,4(s0)
   46750:	0807f793          	and	a5,a5,128
   46754:	c789                	beqz	a5,4675e <setvbuf+0x86>
   46756:	480c                	lw	a1,16(s0)
   46758:	854e                	mv	a0,s3
   4675a:	4e4030ef          	jal	49c3e <_free_r>
   4675e:	00c45783          	lhu	a5,12(s0)
   46762:	777d                	lui	a4,0xfffff
   46764:	35c70713          	add	a4,a4,860 # fffff35c <__share_mem_end__+0xfecff35c>
   46768:	8ff9                	and	a5,a5,a4
   4676a:	00f41623          	sh	a5,12(s0)
   4676e:	4789                	li	a5,2
   46770:	0efa0363          	beq	s4,a5,46856 <setvbuf+0x17e>
   46774:	0074                	add	a3,sp,12
   46776:	0030                	add	a2,sp,8
   46778:	85a2                	mv	a1,s0
   4677a:	854e                	mv	a0,s3
   4677c:	7f0020ef          	jal	48f6c <__swhatbuf_r>
   46780:	00c45783          	lhu	a5,12(s0)
   46784:	8fc9                	or	a5,a5,a0
   46786:	00f41623          	sh	a5,12(s0)
   4678a:	e4ad                	bnez	s1,467f4 <setvbuf+0x11c>
   4678c:	44a2                	lw	s1,8(sp)
   4678e:	8526                	mv	a0,s1
   46790:	0e5020ef          	jal	49074 <malloc>
   46794:	892a                	mv	s2,a0
   46796:	8aa6                	mv	s5,s1
   46798:	e55d                	bnez	a0,46846 <setvbuf+0x16e>
   4679a:	4aa2                	lw	s5,8(sp)
   4679c:	0a9a9063          	bne	s5,s1,4683c <setvbuf+0x164>
   467a0:	557d                	li	a0,-1
   467a2:	00c45783          	lhu	a5,12(s0)
   467a6:	00042423          	sw	zero,8(s0)
   467aa:	0027e793          	or	a5,a5,2
   467ae:	00f41623          	sh	a5,12(s0)
   467b2:	04740793          	add	a5,s0,71
   467b6:	c01c                	sw	a5,0(s0)
   467b8:	c81c                	sw	a5,16(s0)
   467ba:	4785                	li	a5,1
   467bc:	c85c                	sw	a5,20(s0)
   467be:	50b2                	lw	ra,44(sp)
   467c0:	5422                	lw	s0,40(sp)
   467c2:	5492                	lw	s1,36(sp)
   467c4:	5902                	lw	s2,32(sp)
   467c6:	49f2                	lw	s3,28(sp)
   467c8:	4a62                	lw	s4,24(sp)
   467ca:	4ad2                	lw	s5,20(sp)
   467cc:	6145                	add	sp,sp,48
   467ce:	8082                	ret
   467d0:	0004b7b7          	lui	a5,0x4b
   467d4:	29478793          	add	a5,a5,660 # 4b294 <__sf_fake_stdout>
   467d8:	00f41563          	bne	s0,a5,467e2 <setvbuf+0x10a>
   467dc:	0089a403          	lw	s0,8(s3)
   467e0:	bf15                	j	46714 <setvbuf+0x3c>
   467e2:	0004b7b7          	lui	a5,0x4b
   467e6:	27478793          	add	a5,a5,628 # 4b274 <__sf_fake_stderr>
   467ea:	f2f415e3          	bne	s0,a5,46714 <setvbuf+0x3c>
   467ee:	00c9a403          	lw	s0,12(s3)
   467f2:	b70d                	j	46714 <setvbuf+0x3c>
   467f4:	f8090de3          	beqz	s2,4678e <setvbuf+0xb6>
   467f8:	0189a783          	lw	a5,24(s3)
   467fc:	e781                	bnez	a5,46804 <setvbuf+0x12c>
   467fe:	854e                	mv	a0,s3
   46800:	653010ef          	jal	48652 <__sinit>
   46804:	4785                	li	a5,1
   46806:	00fa1863          	bne	s4,a5,46816 <setvbuf+0x13e>
   4680a:	00c45783          	lhu	a5,12(s0)
   4680e:	0017e793          	or	a5,a5,1
   46812:	00f41623          	sh	a5,12(s0)
   46816:	00c41783          	lh	a5,12(s0)
   4681a:	01242023          	sw	s2,0(s0)
   4681e:	01242823          	sw	s2,16(s0)
   46822:	c844                	sw	s1,20(s0)
   46824:	0087f713          	and	a4,a5,8
   46828:	cb1d                	beqz	a4,4685e <setvbuf+0x186>
   4682a:	8b85                	and	a5,a5,1
   4682c:	c79d                	beqz	a5,4685a <setvbuf+0x182>
   4682e:	409004b3          	neg	s1,s1
   46832:	00042423          	sw	zero,8(s0)
   46836:	cc04                	sw	s1,24(s0)
   46838:	4501                	li	a0,0
   4683a:	b751                	j	467be <setvbuf+0xe6>
   4683c:	8556                	mv	a0,s5
   4683e:	037020ef          	jal	49074 <malloc>
   46842:	892a                	mv	s2,a0
   46844:	dd31                	beqz	a0,467a0 <setvbuf+0xc8>
   46846:	00c45783          	lhu	a5,12(s0)
   4684a:	84d6                	mv	s1,s5
   4684c:	0807e793          	or	a5,a5,128
   46850:	00f41623          	sh	a5,12(s0)
   46854:	b755                	j	467f8 <setvbuf+0x120>
   46856:	4501                	li	a0,0
   46858:	b7a9                	j	467a2 <setvbuf+0xca>
   4685a:	c404                	sw	s1,8(s0)
   4685c:	bff1                	j	46838 <setvbuf+0x160>
   4685e:	00042423          	sw	zero,8(s0)
   46862:	bfd9                	j	46838 <setvbuf+0x160>

00046864 <nanf>:
   46864:	0004b7b7          	lui	a5,0x4b
   46868:	4787a503          	lw	a0,1144(a5) # 4b478 <_global_impure_ptr+0x90>
   4686c:	8082                	ret

0004686e <siprintf>:
   4686e:	7135                	add	sp,sp,-160
   46870:	cb3e                	sw	a5,148(sp)
   46872:	800007b7          	lui	a5,0x80000
   46876:	17fd                	add	a5,a5,-1 # 7fffffff <__share_mem_end__+0x7ecfffff>
   46878:	ce3e                	sw	a5,28(sp)
   4687a:	c83e                	sw	a5,16(sp)
   4687c:	77c1                	lui	a5,0xffff0
   4687e:	20878793          	add	a5,a5,520 # ffff0208 <__share_mem_end__+0xfecf0208>
   46882:	ca3e                	sw	a5,20(sp)
   46884:	c42a                	sw	a0,8(sp)
   46886:	cc2a                	sw	a0,24(sp)
   46888:	9d01a503          	lw	a0,-1584(gp) # 12d01d0 <_impure_ptr>
   4688c:	c532                	sw	a2,136(sp)
   4688e:	c736                	sw	a3,140(sp)
   46890:	862e                	mv	a2,a1
   46892:	0134                	add	a3,sp,136
   46894:	002c                	add	a1,sp,8
   46896:	de86                	sw	ra,124(sp)
   46898:	c93a                	sw	a4,144(sp)
   4689a:	cd42                	sw	a6,152(sp)
   4689c:	cf46                	sw	a7,156(sp)
   4689e:	c236                	sw	a3,4(sp)
   468a0:	5fe030ef          	jal	49e9e <_svfiprintf_r>
   468a4:	47a2                	lw	a5,8(sp)
   468a6:	00078023          	sb	zero,0(a5)
   468aa:	50f6                	lw	ra,124(sp)
   468ac:	610d                	add	sp,sp,160
   468ae:	8082                	ret

000468b0 <strlen>:
   468b0:	87aa                	mv	a5,a0
   468b2:	0007c703          	lbu	a4,0(a5)
   468b6:	0785                	add	a5,a5,1
   468b8:	ff6d                	bnez	a4,468b2 <strlen+0x2>
   468ba:	40a78533          	sub	a0,a5,a0
   468be:	157d                	add	a0,a0,-1
   468c0:	8082                	ret

000468c2 <sulp>:
   468c2:	1141                	add	sp,sp,-16
   468c4:	872a                	mv	a4,a0
   468c6:	c422                	sw	s0,8(sp)
   468c8:	842e                	mv	s0,a1
   468ca:	853a                	mv	a0,a4
   468cc:	85a2                	mv	a1,s0
   468ce:	c226                	sw	s1,4(sp)
   468d0:	c606                	sw	ra,12(sp)
   468d2:	84b2                	mv	s1,a2
   468d4:	05e030ef          	jal	49932 <__ulp>
   468d8:	872a                	mv	a4,a0
   468da:	87ae                	mv	a5,a1
   468dc:	c485                	beqz	s1,46904 <sulp+0x42>
   468de:	8051                	srl	s0,s0,0x14
   468e0:	7ff47413          	and	s0,s0,2047
   468e4:	06b00693          	li	a3,107
   468e8:	8e81                	sub	a3,a3,s0
   468ea:	00d05d63          	blez	a3,46904 <sulp+0x42>
   468ee:	06d2                	sll	a3,a3,0x14
   468f0:	3ff007b7          	lui	a5,0x3ff00
   468f4:	4701                	li	a4,0
   468f6:	97b6                	add	a5,a5,a3
   468f8:	863a                	mv	a2,a4
   468fa:	86be                	mv	a3,a5
   468fc:	8f7fb0ef          	jal	421f2 <__muldf3>
   46900:	872a                	mv	a4,a0
   46902:	87ae                	mv	a5,a1
   46904:	40b2                	lw	ra,12(sp)
   46906:	4422                	lw	s0,8(sp)
   46908:	4492                	lw	s1,4(sp)
   4690a:	853a                	mv	a0,a4
   4690c:	85be                	mv	a1,a5
   4690e:	0141                	add	sp,sp,16
   46910:	8082                	ret

00046912 <_strtod_l>:
   46912:	7171                	add	sp,sp,-176
   46914:	0004b7b7          	lui	a5,0x4b
   46918:	cf4e                	sw	s3,156(sp)
   4691a:	2d47a983          	lw	s3,724(a5) # 4b2d4 <_C_numeric_locale>
   4691e:	c42a                	sw	a0,8(sp)
   46920:	d522                	sw	s0,168(sp)
   46922:	854e                	mv	a0,s3
   46924:	d326                	sw	s1,164(sp)
   46926:	cd52                	sw	s4,152(sp)
   46928:	c75e                	sw	s7,140(sp)
   4692a:	c636                	sw	a3,12(sp)
   4692c:	8bae                	mv	s7,a1
   4692e:	d706                	sw	ra,172(sp)
   46930:	d14a                	sw	s2,160(sp)
   46932:	cb56                	sw	s5,148(sp)
   46934:	c95a                	sw	s6,144(sp)
   46936:	c562                	sw	s8,136(sp)
   46938:	c366                	sw	s9,132(sp)
   4693a:	c16a                	sw	s10,128(sp)
   4693c:	deee                	sw	s11,124(sp)
   4693e:	d232                	sw	a2,36(sp)
   46940:	d082                	sw	zero,96(sp)
   46942:	37bd                	jal	468b0 <strlen>
   46944:	4832                	lw	a6,12(sp)
   46946:	8a2a                	mv	s4,a0
   46948:	4481                	li	s1,0
   4694a:	4401                	li	s0,0
   4694c:	875e                	mv	a4,s7
   4694e:	02b00693          	li	a3,43
   46952:	ceba                	sw	a4,92(sp)
   46954:	00074783          	lbu	a5,0(a4)
   46958:	0cd78563          	beq	a5,a3,46a22 <_strtod_l+0x110>
   4695c:	08f6e263          	bltu	a3,a5,469e0 <_strtod_l+0xce>
   46960:	4635                	li	a2,13
   46962:	06f66963          	bltu	a2,a5,469d4 <_strtod_l+0xc2>
   46966:	4621                	li	a2,8
   46968:	06f66a63          	bltu	a2,a5,469dc <_strtod_l+0xca>
   4696c:	c7d1                	beqz	a5,469f8 <_strtod_l+0xe6>
   4696e:	c802                	sw	zero,16(sp)
   46970:	4af6                	lw	s5,92(sp)
   46972:	03000793          	li	a5,48
   46976:	4c81                	li	s9,0
   46978:	000ac703          	lbu	a4,0(s5)
   4697c:	12f71263          	bne	a4,a5,46aa0 <_strtod_l+0x18e>
   46980:	001ac783          	lbu	a5,1(s5)
   46984:	05800693          	li	a3,88
   46988:	03000713          	li	a4,48
   4698c:	0df7f793          	and	a5,a5,223
   46990:	0ed79e63          	bne	a5,a3,46a8c <_strtod_l+0x17a>
   46994:	47c2                	lw	a5,16(sp)
   46996:	4522                	lw	a0,8(sp)
   46998:	0004b637          	lui	a2,0x4b
   4699c:	1098                	add	a4,sp,96
   4699e:	10d4                	add	a3,sp,100
   469a0:	13060613          	add	a2,a2,304 # 4b130 <fpi.1>
   469a4:	08ec                	add	a1,sp,92
   469a6:	71d010ef          	jal	488c2 <__gethex>
   469aa:	00757993          	and	s3,a0,7
   469ae:	8a2a                	mv	s4,a0
   469b0:	00098863          	beqz	s3,469c0 <_strtod_l+0xae>
   469b4:	4799                	li	a5,6
   469b6:	06f99863          	bne	s3,a5,46a26 <_strtod_l+0x114>
   469ba:	0a85                	add	s5,s5,1
   469bc:	ced6                	sw	s5,92(sp)
   469be:	c802                	sw	zero,16(sp)
   469c0:	5792                	lw	a5,36(sp)
   469c2:	c781                	beqz	a5,469ca <_strtod_l+0xb8>
   469c4:	47f6                	lw	a5,92(sp)
   469c6:	5712                	lw	a4,36(sp)
   469c8:	c31c                	sw	a5,0(a4)
   469ca:	47c2                	lw	a5,16(sp)
   469cc:	cb95                	beqz	a5,46a00 <_strtod_l+0xee>
   469ce:	69f41413          	binv	s0,s0,0x1f
   469d2:	a03d                	j	46a00 <_strtod_l+0xee>
   469d4:	02000613          	li	a2,32
   469d8:	f8c79be3          	bne	a5,a2,4696e <_strtod_l+0x5c>
   469dc:	0705                	add	a4,a4,1
   469de:	bf95                	j	46952 <_strtod_l+0x40>
   469e0:	02d00693          	li	a3,45
   469e4:	f8d795e3          	bne	a5,a3,4696e <_strtod_l+0x5c>
   469e8:	4785                	li	a5,1
   469ea:	c83e                	sw	a5,16(sp)
   469ec:	00170793          	add	a5,a4,1
   469f0:	cebe                	sw	a5,92(sp)
   469f2:	00174783          	lbu	a5,1(a4)
   469f6:	ffad                	bnez	a5,46970 <_strtod_l+0x5e>
   469f8:	5792                	lw	a5,36(sp)
   469fa:	cede                	sw	s7,92(sp)
   469fc:	c802                	sw	zero,16(sp)
   469fe:	f3f9                	bnez	a5,469c4 <_strtod_l+0xb2>
   46a00:	50ba                	lw	ra,172(sp)
   46a02:	85a2                	mv	a1,s0
   46a04:	542a                	lw	s0,168(sp)
   46a06:	590a                	lw	s2,160(sp)
   46a08:	49fa                	lw	s3,156(sp)
   46a0a:	4a6a                	lw	s4,152(sp)
   46a0c:	4ada                	lw	s5,148(sp)
   46a0e:	4b4a                	lw	s6,144(sp)
   46a10:	4bba                	lw	s7,140(sp)
   46a12:	4c2a                	lw	s8,136(sp)
   46a14:	4c9a                	lw	s9,132(sp)
   46a16:	4d0a                	lw	s10,128(sp)
   46a18:	5df6                	lw	s11,124(sp)
   46a1a:	8526                	mv	a0,s1
   46a1c:	549a                	lw	s1,164(sp)
   46a1e:	614d                	add	sp,sp,176
   46a20:	8082                	ret
   46a22:	c802                	sw	zero,16(sp)
   46a24:	b7e1                	j	469ec <_strtod_l+0xda>
   46a26:	5606                	lw	a2,96(sp)
   46a28:	ca11                	beqz	a2,46a3c <_strtod_l+0x12a>
   46a2a:	03500593          	li	a1,53
   46a2e:	10a8                	add	a0,sp,104
   46a30:	14a030ef          	jal	49b7a <__copybits>
   46a34:	5586                	lw	a1,96(sp)
   46a36:	4522                	lw	a0,8(sp)
   46a38:	744020ef          	jal	4917c <_Bfree>
   46a3c:	19fd                	add	s3,s3,-1
   46a3e:	4711                	li	a4,4
   46a40:	5796                	lw	a5,100(sp)
   46a42:	01376d63          	bltu	a4,s3,46a5c <_strtod_l+0x14a>
   46a46:	0004b737          	lui	a4,0x4b
   46a4a:	10870713          	add	a4,a4,264 # 4b108 <s_wdgs+0x170>
   46a4e:	20e9c9b3          	sh2add	s3,s3,a4
   46a52:	0009a703          	lw	a4,0(s3)
   46a56:	8702                	jr	a4
   46a58:	54a6                	lw	s1,104(sp)
   46a5a:	5436                	lw	s0,108(sp)
   46a5c:	008a7a13          	and	s4,s4,8
   46a60:	f60a00e3          	beqz	s4,469c0 <_strtod_l+0xae>
   46a64:	29f41413          	bset	s0,s0,0x1f
   46a68:	bfa1                	j	469c0 <_strtod_l+0xae>
   46a6a:	5436                	lw	s0,108(sp)
   46a6c:	43378793          	add	a5,a5,1075
   46a70:	07d2                	sll	a5,a5,0x14
   46a72:	49441413          	bclr	s0,s0,0x14
   46a76:	54a6                	lw	s1,104(sp)
   46a78:	8c5d                	or	s0,s0,a5
   46a7a:	b7cd                	j	46a5c <_strtod_l+0x14a>
   46a7c:	7ff00437          	lui	s0,0x7ff00
   46a80:	bff1                	j	46a5c <_strtod_l+0x14a>
   46a82:	80000437          	lui	s0,0x80000
   46a86:	147d                	add	s0,s0,-1 # 7fffffff <__share_mem_end__+0x7ecfffff>
   46a88:	54fd                	li	s1,-1
   46a8a:	bfc9                	j	46a5c <_strtod_l+0x14a>
   46a8c:	47f6                	lw	a5,92(sp)
   46a8e:	00178693          	add	a3,a5,1
   46a92:	ceb6                	sw	a3,92(sp)
   46a94:	0017c783          	lbu	a5,1(a5)
   46a98:	fee78ae3          	beq	a5,a4,46a8c <_strtod_l+0x17a>
   46a9c:	d395                	beqz	a5,469c0 <_strtod_l+0xae>
   46a9e:	4c85                	li	s9,1
   46aa0:	4c76                	lw	s8,92(sp)
   46aa2:	4d81                	li	s11,0
   46aa4:	4a81                	li	s5,0
   46aa6:	4b01                	li	s6,0
   46aa8:	4625                	li	a2,9
   46aaa:	45a1                	li	a1,8
   46aac:	46a9                	li	a3,10
   46aae:	4576                	lw	a0,92(sp)
   46ab0:	00054d03          	lbu	s10,0(a0)
   46ab4:	fd0d0713          	add	a4,s10,-48
   46ab8:	0ff77793          	zext.b	a5,a4
   46abc:	04f67d63          	bgeu	a2,a5,46b16 <_strtod_l+0x204>
   46ac0:	8652                	mv	a2,s4
   46ac2:	85ce                	mv	a1,s3
   46ac4:	24f030ef          	jal	4a512 <strncmp>
   46ac8:	c52d                	beqz	a0,46b32 <_strtod_l+0x220>
   46aca:	87ea                	mv	a5,s10
   46acc:	4601                	li	a2,0
   46ace:	8d5a                	mv	s10,s6
   46ad0:	4a01                	li	s4,0
   46ad2:	4501                	li	a0,0
   46ad4:	06500713          	li	a4,101
   46ad8:	00e78763          	beq	a5,a4,46ae6 <_strtod_l+0x1d4>
   46adc:	04500713          	li	a4,69
   46ae0:	4981                	li	s3,0
   46ae2:	16e79f63          	bne	a5,a4,46c60 <_strtod_l+0x34e>
   46ae6:	000d1763          	bnez	s10,46af4 <_strtod_l+0x1e2>
   46aea:	019667b3          	or	a5,a2,s9
   46aee:	f00785e3          	beqz	a5,469f8 <_strtod_l+0xe6>
   46af2:	4d01                	li	s10,0
   46af4:	4bf6                	lw	s7,92(sp)
   46af6:	02b00713          	li	a4,43
   46afa:	001b8793          	add	a5,s7,1
   46afe:	cebe                	sw	a5,92(sp)
   46b00:	001bc783          	lbu	a5,1(s7)
   46b04:	0ee78a63          	beq	a5,a4,46bf8 <_strtod_l+0x2e6>
   46b08:	02d00713          	li	a4,45
   46b0c:	4801                	li	a6,0
   46b0e:	0ee79b63          	bne	a5,a4,46c04 <_strtod_l+0x2f2>
   46b12:	4805                	li	a6,1
   46b14:	a0dd                	j	46bfa <_strtod_l+0x2e8>
   46b16:	0165ca63          	blt	a1,s6,46b2a <_strtod_l+0x218>
   46b1a:	02da8ab3          	mul	s5,s5,a3
   46b1e:	9aba                	add	s5,s5,a4
   46b20:	00150793          	add	a5,a0,1
   46b24:	0b05                	add	s6,s6,1
   46b26:	cebe                	sw	a5,92(sp)
   46b28:	b759                	j	46aae <_strtod_l+0x19c>
   46b2a:	02dd8db3          	mul	s11,s11,a3
   46b2e:	9dba                	add	s11,s11,a4
   46b30:	bfc5                	j	46b20 <_strtod_l+0x20e>
   46b32:	47f6                	lw	a5,92(sp)
   46b34:	4601                	li	a2,0
   46b36:	01478533          	add	a0,a5,s4
   46b3a:	ceaa                	sw	a0,92(sp)
   46b3c:	00054783          	lbu	a5,0(a0)
   46b40:	080b0463          	beqz	s6,46bc8 <_strtod_l+0x2b6>
   46b44:	4a01                	li	s4,0
   46b46:	8d5a                	mv	s10,s6
   46b48:	fd078713          	add	a4,a5,-48
   46b4c:	46a5                	li	a3,9
   46b4e:	02e6f663          	bgeu	a3,a4,46b7a <_strtod_l+0x268>
   46b52:	4505                	li	a0,1
   46b54:	b741                	j	46ad4 <_strtod_l+0x1c2>
   46b56:	47f6                	lw	a5,92(sp)
   46b58:	0605                	add	a2,a2,1
   46b5a:	00178693          	add	a3,a5,1
   46b5e:	ceb6                	sw	a3,92(sp)
   46b60:	0017c783          	lbu	a5,1(a5)
   46b64:	fee789e3          	beq	a5,a4,46b56 <_strtod_l+0x244>
   46b68:	fcf78713          	add	a4,a5,-49
   46b6c:	46a1                	li	a3,8
   46b6e:	1ee6e2e3          	bltu	a3,a4,47552 <_strtod_l+0xc40>
   46b72:	4c76                	lw	s8,92(sp)
   46b74:	8a32                	mv	s4,a2
   46b76:	4d01                	li	s10,0
   46b78:	4601                	li	a2,0
   46b7a:	fd078793          	add	a5,a5,-48
   46b7e:	00160713          	add	a4,a2,1
   46b82:	cb9d                	beqz	a5,46bb8 <_strtod_l+0x2a6>
   46b84:	9a3a                	add	s4,s4,a4
   46b86:	85ea                	mv	a1,s10
   46b88:	48a1                	li	a7,8
   46b8a:	4341                	li	t1,16
   46b8c:	4529                	li	a0,10
   46b8e:	00158693          	add	a3,a1,1
   46b92:	41a68833          	sub	a6,a3,s10
   46b96:	02e84c63          	blt	a6,a4,46bce <_strtod_l+0x2bc>
   46b9a:	0a066633          	max	a2,a2,zero
   46b9e:	4721                	li	a4,8
   46ba0:	00cd06b3          	add	a3,s10,a2
   46ba4:	0d05                	add	s10,s10,1
   46ba6:	9d32                	add	s10,s10,a2
   46ba8:	02d74e63          	blt	a4,a3,46be4 <_strtod_l+0x2d2>
   46bac:	4729                	li	a4,10
   46bae:	02ea8733          	mul	a4,s5,a4
   46bb2:	00e78ab3          	add	s5,a5,a4
   46bb6:	4701                	li	a4,0
   46bb8:	47f6                	lw	a5,92(sp)
   46bba:	863a                	mv	a2,a4
   46bbc:	00178693          	add	a3,a5,1
   46bc0:	ceb6                	sw	a3,92(sp)
   46bc2:	0017c783          	lbu	a5,1(a5)
   46bc6:	b749                	j	46b48 <_strtod_l+0x236>
   46bc8:	03000713          	li	a4,48
   46bcc:	bf61                	j	46b64 <_strtod_l+0x252>
   46bce:	00b8c663          	blt	a7,a1,46bda <_strtod_l+0x2c8>
   46bd2:	02aa8ab3          	mul	s5,s5,a0
   46bd6:	85b6                	mv	a1,a3
   46bd8:	bf5d                	j	46b8e <_strtod_l+0x27c>
   46bda:	fed34ee3          	blt	t1,a3,46bd6 <_strtod_l+0x2c4>
   46bde:	02ad8db3          	mul	s11,s11,a0
   46be2:	bfd5                	j	46bd6 <_strtod_l+0x2c4>
   46be4:	463d                	li	a2,15
   46be6:	4701                	li	a4,0
   46be8:	fcd648e3          	blt	a2,a3,46bb8 <_strtod_l+0x2a6>
   46bec:	46a9                	li	a3,10
   46bee:	02dd86b3          	mul	a3,s11,a3
   46bf2:	00d78db3          	add	s11,a5,a3
   46bf6:	b7c9                	j	46bb8 <_strtod_l+0x2a6>
   46bf8:	4801                	li	a6,0
   46bfa:	002b8793          	add	a5,s7,2
   46bfe:	cebe                	sw	a5,92(sp)
   46c00:	002bc783          	lbu	a5,2(s7)
   46c04:	fd078713          	add	a4,a5,-48
   46c08:	46a5                	li	a3,9
   46c0a:	0ce6ef63          	bltu	a3,a4,46ce8 <_strtod_l+0x3d6>
   46c0e:	03000713          	li	a4,48
   46c12:	0ae78e63          	beq	a5,a4,46cce <_strtod_l+0x3bc>
   46c16:	fcf78713          	add	a4,a5,-49
   46c1a:	46a1                	li	a3,8
   46c1c:	4981                	li	s3,0
   46c1e:	04e6e163          	bltu	a3,a4,46c60 <_strtod_l+0x34e>
   46c22:	48f6                	lw	a7,92(sp)
   46c24:	fd078713          	add	a4,a5,-48
   46c28:	4325                	li	t1,9
   46c2a:	4e29                	li	t3,10
   46c2c:	47f6                	lw	a5,92(sp)
   46c2e:	00178693          	add	a3,a5,1
   46c32:	ceb6                	sw	a3,92(sp)
   46c34:	0017c783          	lbu	a5,1(a5)
   46c38:	fd078593          	add	a1,a5,-48
   46c3c:	0ff5f593          	zext.b	a1,a1
   46c40:	08b37e63          	bgeu	t1,a1,46cdc <_strtod_l+0x3ca>
   46c44:	6995                	lui	s3,0x5
   46c46:	411686b3          	sub	a3,a3,a7
   46c4a:	45a1                	li	a1,8
   46c4c:	e1f98993          	add	s3,s3,-481 # 4e1f <HEAP_SIZE+0xe1f>
   46c50:	00d5c463          	blt	a1,a3,46c58 <_strtod_l+0x346>
   46c54:	0b3749b3          	min	s3,a4,s3
   46c58:	00080463          	beqz	a6,46c60 <_strtod_l+0x34e>
   46c5c:	413009b3          	neg	s3,s3
   46c60:	0c0d1e63          	bnez	s10,46d3c <_strtod_l+0x42a>
   46c64:	00cce633          	or	a2,s9,a2
   46c68:	d4061ce3          	bnez	a2,469c0 <_strtod_l+0xae>
   46c6c:	d80516e3          	bnez	a0,469f8 <_strtod_l+0xe6>
   46c70:	06900713          	li	a4,105
   46c74:	08e78063          	beq	a5,a4,46cf4 <_strtod_l+0x3e2>
   46c78:	06f74b63          	blt	a4,a5,46cee <_strtod_l+0x3dc>
   46c7c:	04900713          	li	a4,73
   46c80:	06e78a63          	beq	a5,a4,46cf4 <_strtod_l+0x3e2>
   46c84:	04e00713          	li	a4,78
   46c88:	d6e798e3          	bne	a5,a4,469f8 <_strtod_l+0xe6>
   46c8c:	0004b5b7          	lui	a1,0x4b
   46c90:	db058593          	add	a1,a1,-592 # 4adb0 <__clz_tab+0x2fc>
   46c94:	08e8                	add	a0,sp,92
   46c96:	12a020ef          	jal	48dc0 <__match>
   46c9a:	d4050fe3          	beqz	a0,469f8 <_strtod_l+0xe6>
   46c9e:	47f6                	lw	a5,92(sp)
   46ca0:	0007c703          	lbu	a4,0(a5)
   46ca4:	02800793          	li	a5,40
   46ca8:	08f71163          	bne	a4,a5,46d2a <_strtod_l+0x418>
   46cac:	0004b5b7          	lui	a1,0x4b
   46cb0:	10b0                	add	a2,sp,104
   46cb2:	11c58593          	add	a1,a1,284 # 4b11c <fpinan.0>
   46cb6:	08e8                	add	a0,sp,92
   46cb8:	138020ef          	jal	48df0 <__hexnan>
   46cbc:	4795                	li	a5,5
   46cbe:	06f51663          	bne	a0,a5,46d2a <_strtod_l+0x418>
   46cc2:	57b6                	lw	a5,108(sp)
   46cc4:	7ff00437          	lui	s0,0x7ff00
   46cc8:	54a6                	lw	s1,104(sp)
   46cca:	8c5d                	or	s0,s0,a5
   46ccc:	b9d5                	j	469c0 <_strtod_l+0xae>
   46cce:	47f6                	lw	a5,92(sp)
   46cd0:	00178693          	add	a3,a5,1
   46cd4:	ceb6                	sw	a3,92(sp)
   46cd6:	0017c783          	lbu	a5,1(a5)
   46cda:	bf25                	j	46c12 <_strtod_l+0x300>
   46cdc:	03c70733          	mul	a4,a4,t3
   46ce0:	973e                	add	a4,a4,a5
   46ce2:	fd070713          	add	a4,a4,-48
   46ce6:	b799                	j	46c2c <_strtod_l+0x31a>
   46ce8:	cede                	sw	s7,92(sp)
   46cea:	4981                	li	s3,0
   46cec:	bf95                	j	46c60 <_strtod_l+0x34e>
   46cee:	06e00713          	li	a4,110
   46cf2:	bf59                	j	46c88 <_strtod_l+0x376>
   46cf4:	0004b5b7          	lui	a1,0x4b
   46cf8:	da458593          	add	a1,a1,-604 # 4ada4 <__clz_tab+0x2f0>
   46cfc:	08e8                	add	a0,sp,92
   46cfe:	0c2020ef          	jal	48dc0 <__match>
   46d02:	ce050be3          	beqz	a0,469f8 <_strtod_l+0xe6>
   46d06:	47f6                	lw	a5,92(sp)
   46d08:	0004b5b7          	lui	a1,0x4b
   46d0c:	da858593          	add	a1,a1,-600 # 4ada8 <__clz_tab+0x2f4>
   46d10:	17fd                	add	a5,a5,-1
   46d12:	08e8                	add	a0,sp,92
   46d14:	cebe                	sw	a5,92(sp)
   46d16:	0aa020ef          	jal	48dc0 <__match>
   46d1a:	e501                	bnez	a0,46d22 <_strtod_l+0x410>
   46d1c:	47f6                	lw	a5,92(sp)
   46d1e:	0785                	add	a5,a5,1
   46d20:	cebe                	sw	a5,92(sp)
   46d22:	7ff00437          	lui	s0,0x7ff00
   46d26:	4481                	li	s1,0
   46d28:	b961                	j	469c0 <_strtod_l+0xae>
   46d2a:	0004b537          	lui	a0,0x4b
   46d2e:	c8850513          	add	a0,a0,-888 # 4ac88 <__clz_tab+0x1d4>
   46d32:	71e030ef          	jal	4a450 <nan>
   46d36:	84aa                	mv	s1,a0
   46d38:	842e                	mv	s0,a1
   46d3a:	b159                	j	469c0 <_strtod_l+0xae>
   46d3c:	41498bb3          	sub	s7,s3,s4
   46d40:	000b1363          	bnez	s6,46d46 <_strtod_l+0x434>
   46d44:	8b6a                	mv	s6,s10
   46d46:	8556                	mv	a0,s5
   46d48:	fa3fb0ef          	jal	42cea <__floatunsidf>
   46d4c:	4cc1                	li	s9,16
   46d4e:	47a5                	li	a5,9
   46d50:	84aa                	mv	s1,a0
   46d52:	842e                	mv	s0,a1
   46d54:	0b9d4cb3          	min	s9,s10,s9
   46d58:	03a7c663          	blt	a5,s10,46d84 <_strtod_l+0x472>
   46d5c:	c60b82e3          	beqz	s7,469c0 <_strtod_l+0xae>
   46d60:	11705d63          	blez	s7,46e7a <_strtod_l+0x568>
   46d64:	47d9                	li	a5,22
   46d66:	0d77cc63          	blt	a5,s7,46e3e <_strtod_l+0x52c>
   46d6a:	0004b7b7          	lui	a5,0x4b
   46d6e:	31878793          	add	a5,a5,792 # 4b318 <__mprec_tens>
   46d72:	20fbe7b3          	sh3add	a5,s7,a5
   46d76:	4388                	lw	a0,0(a5)
   46d78:	43cc                	lw	a1,4(a5)
   46d7a:	8626                	mv	a2,s1
   46d7c:	86a2                	mv	a3,s0
   46d7e:	c74fb0ef          	jal	421f2 <__muldf3>
   46d82:	bf55                	j	46d36 <_strtod_l+0x424>
   46d84:	0004b7b7          	lui	a5,0x4b
   46d88:	31878793          	add	a5,a5,792 # 4b318 <__mprec_tens>
   46d8c:	20fce7b3          	sh3add	a5,s9,a5
   46d90:	fb87a603          	lw	a2,-72(a5)
   46d94:	fbc7a683          	lw	a3,-68(a5)
   46d98:	c5afb0ef          	jal	421f2 <__muldf3>
   46d9c:	84aa                	mv	s1,a0
   46d9e:	856e                	mv	a0,s11
   46da0:	842e                	mv	s0,a1
   46da2:	f49fb0ef          	jal	42cea <__floatunsidf>
   46da6:	862a                	mv	a2,a0
   46da8:	86ae                	mv	a3,a1
   46daa:	8526                	mv	a0,s1
   46dac:	85a2                	mv	a1,s0
   46dae:	82bfa0ef          	jal	415d8 <__adddf3>
   46db2:	47bd                	li	a5,15
   46db4:	84aa                	mv	s1,a0
   46db6:	842e                	mv	s0,a1
   46db8:	fba7d2e3          	bge	a5,s10,46d5c <_strtod_l+0x44a>
   46dbc:	419d0cb3          	sub	s9,s10,s9
   46dc0:	9cde                	add	s9,s9,s7
   46dc2:	17905763          	blez	s9,46f30 <_strtod_l+0x61e>
   46dc6:	00fcf793          	and	a5,s9,15
   46dca:	cf99                	beqz	a5,46de8 <_strtod_l+0x4d6>
   46dcc:	0004b737          	lui	a4,0x4b
   46dd0:	31870713          	add	a4,a4,792 # 4b318 <__mprec_tens>
   46dd4:	20e7e7b3          	sh3add	a5,a5,a4
   46dd8:	4388                	lw	a0,0(a5)
   46dda:	43cc                	lw	a1,4(a5)
   46ddc:	8626                	mv	a2,s1
   46dde:	86a2                	mv	a3,s0
   46de0:	c12fb0ef          	jal	421f2 <__muldf3>
   46de4:	84aa                	mv	s1,a0
   46de6:	842e                	mv	s0,a1
   46de8:	ff0cfc93          	and	s9,s9,-16
   46dec:	100c8863          	beqz	s9,46efc <_strtod_l+0x5ea>
   46df0:	13400793          	li	a5,308
   46df4:	0b97d763          	bge	a5,s9,46ea2 <_strtod_l+0x590>
   46df8:	4a81                	li	s5,0
   46dfa:	4981                	li	s3,0
   46dfc:	c602                	sw	zero,12(sp)
   46dfe:	4a01                	li	s4,0
   46e00:	4722                	lw	a4,8(sp)
   46e02:	02200793          	li	a5,34
   46e06:	7ff00437          	lui	s0,0x7ff00
   46e0a:	c31c                	sw	a5,0(a4)
   46e0c:	4481                	li	s1,0
   46e0e:	47b2                	lw	a5,12(sp)
   46e10:	ba0788e3          	beqz	a5,469c0 <_strtod_l+0xae>
   46e14:	5586                	lw	a1,96(sp)
   46e16:	4522                	lw	a0,8(sp)
   46e18:	364020ef          	jal	4917c <_Bfree>
   46e1c:	4522                	lw	a0,8(sp)
   46e1e:	85d2                	mv	a1,s4
   46e20:	35c020ef          	jal	4917c <_Bfree>
   46e24:	4522                	lw	a0,8(sp)
   46e26:	85ce                	mv	a1,s3
   46e28:	354020ef          	jal	4917c <_Bfree>
   46e2c:	45b2                	lw	a1,12(sp)
   46e2e:	4522                	lw	a0,8(sp)
   46e30:	34c020ef          	jal	4917c <_Bfree>
   46e34:	4522                	lw	a0,8(sp)
   46e36:	85d6                	mv	a1,s5
   46e38:	344020ef          	jal	4917c <_Bfree>
   46e3c:	b651                	j	469c0 <_strtod_l+0xae>
   46e3e:	02500793          	li	a5,37
   46e42:	41a787b3          	sub	a5,a5,s10
   46e46:	f777cbe3          	blt	a5,s7,46dbc <_strtod_l+0x4aa>
   46e4a:	493d                	li	s2,15
   46e4c:	0004b9b7          	lui	s3,0x4b
   46e50:	41a90933          	sub	s2,s2,s10
   46e54:	31898993          	add	s3,s3,792 # 4b318 <__mprec_tens>
   46e58:	213965b3          	sh3add	a1,s2,s3
   46e5c:	4188                	lw	a0,0(a1)
   46e5e:	41cc                	lw	a1,4(a1)
   46e60:	8626                	mv	a2,s1
   46e62:	86a2                	mv	a3,s0
   46e64:	b8efb0ef          	jal	421f2 <__muldf3>
   46e68:	412b8933          	sub	s2,s7,s2
   46e6c:	21396933          	sh3add	s2,s2,s3
   46e70:	00092603          	lw	a2,0(s2)
   46e74:	00492683          	lw	a3,4(s2)
   46e78:	b719                	j	46d7e <_strtod_l+0x46c>
   46e7a:	57a9                	li	a5,-22
   46e7c:	f4fbc0e3          	blt	s7,a5,46dbc <_strtod_l+0x4aa>
   46e80:	0004b7b7          	lui	a5,0x4b
   46e84:	413a09b3          	sub	s3,s4,s3
   46e88:	31878793          	add	a5,a5,792 # 4b318 <__mprec_tens>
   46e8c:	20f9e9b3          	sh3add	s3,s3,a5
   46e90:	0009a603          	lw	a2,0(s3)
   46e94:	0049a683          	lw	a3,4(s3)
   46e98:	8526                	mv	a0,s1
   46e9a:	85a2                	mv	a1,s0
   46e9c:	d19fa0ef          	jal	41bb4 <__divdf3>
   46ea0:	bd59                	j	46d36 <_strtod_l+0x424>
   46ea2:	0004b737          	lui	a4,0x4b
   46ea6:	404cdc93          	sra	s9,s9,0x4
   46eaa:	87a6                	mv	a5,s1
   46eac:	85a2                	mv	a1,s0
   46eae:	2f070313          	add	t1,a4,752 # 4b2f0 <__mprec_bigtens>
   46eb2:	4681                	li	a3,0
   46eb4:	4d81                	li	s11,0
   46eb6:	2f070913          	add	s2,a4,752
   46eba:	4e05                	li	t3,1
   46ebc:	059e4263          	blt	t3,s9,46f00 <_strtod_l+0x5ee>
   46ec0:	c299                	beqz	a3,46ec6 <_strtod_l+0x5b4>
   46ec2:	84be                	mv	s1,a5
   46ec4:	842e                	mv	s0,a1
   46ec6:	212de7b3          	sh3add	a5,s11,s2
   46eca:	fcb00737          	lui	a4,0xfcb00
   46ece:	4388                	lw	a0,0(a5)
   46ed0:	43cc                	lw	a1,4(a5)
   46ed2:	9722                	add	a4,a4,s0
   46ed4:	8626                	mv	a2,s1
   46ed6:	86ba                	mv	a3,a4
   46ed8:	b1afb0ef          	jal	421f2 <__muldf3>
   46edc:	7ff007b7          	lui	a5,0x7ff00
   46ee0:	8fed                	and	a5,a5,a1
   46ee2:	7ca00737          	lui	a4,0x7ca00
   46ee6:	84aa                	mv	s1,a0
   46ee8:	f0f768e3          	bltu	a4,a5,46df8 <_strtod_l+0x4e6>
   46eec:	7c900737          	lui	a4,0x7c900
   46ef0:	02f77c63          	bgeu	a4,a5,46f28 <_strtod_l+0x616>
   46ef4:	7ff00437          	lui	s0,0x7ff00
   46ef8:	147d                	add	s0,s0,-1 # 7fefffff <__share_mem_end__+0x7ebfffff>
   46efa:	54fd                	li	s1,-1
   46efc:	4901                	li	s2,0
   46efe:	a8ed                	j	46ff8 <_strtod_l+0x6e6>
   46f00:	001cf613          	and	a2,s9,1
   46f04:	ce09                	beqz	a2,46f1e <_strtod_l+0x60c>
   46f06:	00432683          	lw	a3,4(t1)
   46f0a:	00032603          	lw	a2,0(t1)
   46f0e:	853e                	mv	a0,a5
   46f10:	c61a                	sw	t1,12(sp)
   46f12:	ae0fb0ef          	jal	421f2 <__muldf3>
   46f16:	4332                	lw	t1,12(sp)
   46f18:	87aa                	mv	a5,a0
   46f1a:	4685                	li	a3,1
   46f1c:	4e05                	li	t3,1
   46f1e:	0d85                	add	s11,s11,1
   46f20:	401cdc93          	sra	s9,s9,0x1
   46f24:	0321                	add	t1,t1,8
   46f26:	bf59                	j	46ebc <_strtod_l+0x5aa>
   46f28:	03500437          	lui	s0,0x3500
   46f2c:	942e                	add	s0,s0,a1
   46f2e:	b7f9                	j	46efc <_strtod_l+0x5ea>
   46f30:	fc0c86e3          	beqz	s9,46efc <_strtod_l+0x5ea>
   46f34:	41900cb3          	neg	s9,s9
   46f38:	00fcf793          	and	a5,s9,15
   46f3c:	cf99                	beqz	a5,46f5a <_strtod_l+0x648>
   46f3e:	0004b737          	lui	a4,0x4b
   46f42:	31870713          	add	a4,a4,792 # 4b318 <__mprec_tens>
   46f46:	20e7e7b3          	sh3add	a5,a5,a4
   46f4a:	4390                	lw	a2,0(a5)
   46f4c:	43d4                	lw	a3,4(a5)
   46f4e:	8526                	mv	a0,s1
   46f50:	85a2                	mv	a1,s0
   46f52:	c63fa0ef          	jal	41bb4 <__divdf3>
   46f56:	84aa                	mv	s1,a0
   46f58:	842e                	mv	s0,a1
   46f5a:	404cdc93          	sra	s9,s9,0x4
   46f5e:	f80c8fe3          	beqz	s9,46efc <_strtod_l+0x5ea>
   46f62:	47fd                	li	a5,31
   46f64:	0197dd63          	bge	a5,s9,46f7e <_strtod_l+0x66c>
   46f68:	4a81                	li	s5,0
   46f6a:	4981                	li	s3,0
   46f6c:	c602                	sw	zero,12(sp)
   46f6e:	4a01                	li	s4,0
   46f70:	4722                	lw	a4,8(sp)
   46f72:	02200793          	li	a5,34
   46f76:	4481                	li	s1,0
   46f78:	4401                	li	s0,0
   46f7a:	c31c                	sw	a5,0(a4)
   46f7c:	bd49                	j	46e0e <_strtod_l+0x4fc>
   46f7e:	010cf913          	and	s2,s9,16
   46f82:	00090463          	beqz	s2,46f8a <_strtod_l+0x678>
   46f86:	06a00913          	li	s2,106
   46f8a:	0004bdb7          	lui	s11,0x4b
   46f8e:	87a6                	mv	a5,s1
   46f90:	85a2                	mv	a1,s0
   46f92:	148d8d93          	add	s11,s11,328 # 4b148 <tinytens>
   46f96:	4701                	li	a4,0
   46f98:	001cf693          	and	a3,s9,1
   46f9c:	ca91                	beqz	a3,46fb0 <_strtod_l+0x69e>
   46f9e:	000da603          	lw	a2,0(s11)
   46fa2:	004da683          	lw	a3,4(s11)
   46fa6:	853e                	mv	a0,a5
   46fa8:	a4afb0ef          	jal	421f2 <__muldf3>
   46fac:	87aa                	mv	a5,a0
   46fae:	4705                	li	a4,1
   46fb0:	401cdc93          	sra	s9,s9,0x1
   46fb4:	0da1                	add	s11,s11,8
   46fb6:	fe0c91e3          	bnez	s9,46f98 <_strtod_l+0x686>
   46fba:	c319                	beqz	a4,46fc0 <_strtod_l+0x6ae>
   46fbc:	84be                	mv	s1,a5
   46fbe:	842e                	mv	s0,a1
   46fc0:	02090563          	beqz	s2,46fea <_strtod_l+0x6d8>
   46fc4:	01445713          	srl	a4,s0,0x14
   46fc8:	7ff77713          	and	a4,a4,2047
   46fcc:	06b00793          	li	a5,107
   46fd0:	8f99                	sub	a5,a5,a4
   46fd2:	00f05c63          	blez	a5,46fea <_strtod_l+0x6d8>
   46fd6:	46fd                	li	a3,31
   46fd8:	0cf6de63          	bge	a3,a5,470b4 <_strtod_l+0x7a2>
   46fdc:	03400693          	li	a3,52
   46fe0:	4481                	li	s1,0
   46fe2:	0cf6d063          	bge	a3,a5,470a2 <_strtod_l+0x790>
   46fe6:	03700437          	lui	s0,0x3700
   46fea:	4601                	li	a2,0
   46fec:	4681                	li	a3,0
   46fee:	8526                	mv	a0,s1
   46ff0:	85a2                	mv	a1,s0
   46ff2:	ee9fb0ef          	jal	42eda <__eqdf2>
   46ff6:	d92d                	beqz	a0,46f68 <_strtod_l+0x656>
   46ff8:	4522                	lw	a0,8(sp)
   46ffa:	8756                	mv	a4,s5
   46ffc:	86ea                	mv	a3,s10
   46ffe:	865a                	mv	a2,s6
   47000:	85e2                	mv	a1,s8
   47002:	294020ef          	jal	49296 <__s2b>
   47006:	c62a                	sw	a0,12(sp)
   47008:	de0508e3          	beqz	a0,46df8 <_strtod_l+0x4e6>
   4700c:	41fbd793          	sra	a5,s7,0x1f
   47010:	413a0a33          	sub	s4,s4,s3
   47014:	00fa7a33          	and	s4,s4,a5
   47018:	0a0be7b3          	max	a5,s7,zero
   4701c:	d03e                	sw	a5,32(sp)
   4701e:	00c50793          	add	a5,a0,12
   47022:	c0be                	sw	a5,64(sp)
   47024:	0004b7b7          	lui	a5,0x4b
   47028:	40c7a803          	lw	a6,1036(a5) # 4b40c <_global_impure_ptr+0x24>
   4702c:	4087a783          	lw	a5,1032(a5)
   47030:	ce52                	sw	s4,28(sp)
   47032:	d642                	sw	a6,44(sp)
   47034:	d43e                	sw	a5,40(sp)
   47036:	0004b7b7          	lui	a5,0x4b
   4703a:	3fc7a803          	lw	a6,1020(a5) # 4b3fc <_global_impure_ptr+0x14>
   4703e:	3f87a783          	lw	a5,1016(a5)
   47042:	4a81                	li	s5,0
   47044:	da42                	sw	a6,52(sp)
   47046:	d83e                	sw	a5,48(sp)
   47048:	0004b7b7          	lui	a5,0x4b
   4704c:	4147a803          	lw	a6,1044(a5) # 4b414 <_global_impure_ptr+0x2c>
   47050:	4107a783          	lw	a5,1040(a5)
   47054:	4981                	li	s3,0
   47056:	de42                	sw	a6,60(sp)
   47058:	dc3e                	sw	a5,56(sp)
   4705a:	47b2                	lw	a5,12(sp)
   4705c:	4522                	lw	a0,8(sp)
   4705e:	43cc                	lw	a1,4(a5)
   47060:	072020ef          	jal	490d2 <_Balloc>
   47064:	8a2a                	mv	s4,a0
   47066:	d8050de3          	beqz	a0,46e00 <_strtod_l+0x4ee>
   4706a:	47b2                	lw	a5,12(sp)
   4706c:	4586                	lw	a1,64(sp)
   4706e:	0531                	add	a0,a0,12
   47070:	4b90                	lw	a2,16(a5)
   47072:	0609                	add	a2,a2,2
   47074:	060a                	sll	a2,a2,0x2
   47076:	e19fb0ef          	jal	42e8e <memcpy>
   4707a:	4522                	lw	a0,8(sp)
   4707c:	10b8                	add	a4,sp,104
   4707e:	10d4                	add	a3,sp,100
   47080:	8622                	mv	a2,s0
   47082:	85a6                	mv	a1,s1
   47084:	ca26                	sw	s1,20(sp)
   47086:	cc22                	sw	s0,24(sp)
   47088:	1a5020ef          	jal	49a2c <__d2b>
   4708c:	d0aa                	sw	a0,96(sp)
   4708e:	d60509e3          	beqz	a0,46e00 <_strtod_l+0x4ee>
   47092:	4522                	lw	a0,8(sp)
   47094:	4585                	li	a1,1
   47096:	370020ef          	jal	49406 <__i2b>
   4709a:	89aa                	mv	s3,a0
   4709c:	e10d                	bnez	a0,470be <_strtod_l+0x7ac>
   4709e:	4981                	li	s3,0
   470a0:	b385                	j	46e00 <_strtod_l+0x4ee>
   470a2:	04b00793          	li	a5,75
   470a6:	40e78733          	sub	a4,a5,a4
   470aa:	57fd                	li	a5,-1
   470ac:	00e797b3          	sll	a5,a5,a4
   470b0:	8c7d                	and	s0,s0,a5
   470b2:	bf25                	j	46fea <_strtod_l+0x6d8>
   470b4:	577d                	li	a4,-1
   470b6:	00f717b3          	sll	a5,a4,a5
   470ba:	8cfd                	and	s1,s1,a5
   470bc:	b73d                	j	46fea <_strtod_l+0x6d8>
   470be:	5796                	lw	a5,100(sp)
   470c0:	1607c863          	bltz	a5,47230 <_strtod_l+0x91e>
   470c4:	4772                	lw	a4,28(sp)
   470c6:	5c82                	lw	s9,32(sp)
   470c8:	00e78d33          	add	s10,a5,a4
   470cc:	56a6                	lw	a3,104(sp)
   470ce:	412787b3          	sub	a5,a5,s2
   470d2:	03600713          	li	a4,54
   470d6:	97b6                	add	a5,a5,a3
   470d8:	17fd                	add	a5,a5,-1
   470da:	c0200b13          	li	s6,-1022
   470de:	8f15                	sub	a4,a4,a3
   470e0:	1767d563          	bge	a5,s6,4724a <_strtod_l+0x938>
   470e4:	40fb0b33          	sub	s6,s6,a5
   470e8:	46fd                	li	a3,31
   470ea:	41670733          	sub	a4,a4,s6
   470ee:	1566c663          	blt	a3,s6,4723a <_strtod_l+0x928>
   470f2:	4c01                	li	s8,0
   470f4:	29601b33          	bset	s6,zero,s6
   470f8:	9cba                	add	s9,s9,a4
   470fa:	00ed0db3          	add	s11,s10,a4
   470fe:	9cca                	add	s9,s9,s2
   47100:	0bbd47b3          	min	a5,s10,s11
   47104:	0b97c7b3          	min	a5,a5,s9
   47108:	00f05863          	blez	a5,47118 <_strtod_l+0x806>
   4710c:	40fd8db3          	sub	s11,s11,a5
   47110:	40fc8cb3          	sub	s9,s9,a5
   47114:	40fd0d33          	sub	s10,s10,a5
   47118:	47f2                	lw	a5,28(sp)
   4711a:	02f05763          	blez	a5,47148 <_strtod_l+0x836>
   4711e:	4522                	lw	a0,8(sp)
   47120:	85ce                	mv	a1,s3
   47122:	863e                	mv	a2,a5
   47124:	492020ef          	jal	495b6 <__pow5mult>
   47128:	89aa                	mv	s3,a0
   4712a:	d935                	beqz	a0,4709e <_strtod_l+0x78c>
   4712c:	85aa                	mv	a1,a0
   4712e:	5606                	lw	a2,96(sp)
   47130:	4522                	lw	a0,8(sp)
   47132:	30c020ef          	jal	4943e <__multiply>
   47136:	c2aa                	sw	a0,68(sp)
   47138:	cc0504e3          	beqz	a0,46e00 <_strtod_l+0x4ee>
   4713c:	5586                	lw	a1,96(sp)
   4713e:	4522                	lw	a0,8(sp)
   47140:	03c020ef          	jal	4917c <_Bfree>
   47144:	4796                	lw	a5,68(sp)
   47146:	d0be                	sw	a5,96(sp)
   47148:	11b04363          	bgtz	s11,4724e <_strtod_l+0x93c>
   4714c:	01705a63          	blez	s7,47160 <_strtod_l+0x84e>
   47150:	5602                	lw	a2,32(sp)
   47152:	4522                	lw	a0,8(sp)
   47154:	85d2                	mv	a1,s4
   47156:	460020ef          	jal	495b6 <__pow5mult>
   4715a:	8a2a                	mv	s4,a0
   4715c:	ca0501e3          	beqz	a0,46dfe <_strtod_l+0x4ec>
   47160:	01905a63          	blez	s9,47174 <_strtod_l+0x862>
   47164:	4522                	lw	a0,8(sp)
   47166:	85d2                	mv	a1,s4
   47168:	8666                	mv	a2,s9
   4716a:	526020ef          	jal	49690 <__lshift>
   4716e:	8a2a                	mv	s4,a0
   47170:	c80507e3          	beqz	a0,46dfe <_strtod_l+0x4ec>
   47174:	01a05a63          	blez	s10,47188 <_strtod_l+0x876>
   47178:	4522                	lw	a0,8(sp)
   4717a:	85ce                	mv	a1,s3
   4717c:	866a                	mv	a2,s10
   4717e:	512020ef          	jal	49690 <__lshift>
   47182:	89aa                	mv	s3,a0
   47184:	c6050ee3          	beqz	a0,46e00 <_strtod_l+0x4ee>
   47188:	5586                	lw	a1,96(sp)
   4718a:	4522                	lw	a0,8(sp)
   4718c:	8652                	mv	a2,s4
   4718e:	63a020ef          	jal	497c8 <__mdiff>
   47192:	8aaa                	mv	s5,a0
   47194:	c60506e3          	beqz	a0,46e00 <_strtod_l+0x4ee>
   47198:	00c52c83          	lw	s9,12(a0)
   4719c:	85ce                	mv	a1,s3
   4719e:	00052623          	sw	zero,12(a0)
   471a2:	5f0020ef          	jal	49792 <__mcmp>
   471a6:	0a055d63          	bgez	a0,47260 <_strtod_l+0x94e>
   471aa:	009cecb3          	or	s9,s9,s1
   471ae:	100c9563          	bnez	s9,472b8 <_strtod_l+0x9a6>
   471b2:	00c41793          	sll	a5,s0,0xc
   471b6:	10079163          	bnez	a5,472b8 <_strtod_l+0x9a6>
   471ba:	7ff007b7          	lui	a5,0x7ff00
   471be:	8fe1                	and	a5,a5,s0
   471c0:	06b00737          	lui	a4,0x6b00
   471c4:	0ef77a63          	bgeu	a4,a5,472b8 <_strtod_l+0x9a6>
   471c8:	014aa783          	lw	a5,20(s5)
   471cc:	e791                	bnez	a5,471d8 <_strtod_l+0x8c6>
   471ce:	010aa703          	lw	a4,16(s5)
   471d2:	4785                	li	a5,1
   471d4:	0ee7d263          	bge	a5,a4,472b8 <_strtod_l+0x9a6>
   471d8:	4522                	lw	a0,8(sp)
   471da:	85d6                	mv	a1,s5
   471dc:	4605                	li	a2,1
   471de:	4b2020ef          	jal	49690 <__lshift>
   471e2:	85ce                	mv	a1,s3
   471e4:	8aaa                	mv	s5,a0
   471e6:	5ac020ef          	jal	49792 <__mcmp>
   471ea:	0ca05763          	blez	a0,472b8 <_strtod_l+0x9a6>
   471ee:	7ff007b7          	lui	a5,0x7ff00
   471f2:	8fe1                	and	a5,a5,s0
   471f4:	0e090d63          	beqz	s2,472ee <_strtod_l+0x9dc>
   471f8:	06b00737          	lui	a4,0x6b00
   471fc:	0ef76963          	bltu	a4,a5,472ee <_strtod_l+0x9dc>
   47200:	03700737          	lui	a4,0x3700
   47204:	d6f776e3          	bgeu	a4,a5,46f70 <_strtod_l+0x65e>
   47208:	0004b7b7          	lui	a5,0x4b
   4720c:	4307a603          	lw	a2,1072(a5) # 4b430 <_global_impure_ptr+0x48>
   47210:	4347a683          	lw	a3,1076(a5)
   47214:	8526                	mv	a0,s1
   47216:	85a2                	mv	a1,s0
   47218:	fdbfa0ef          	jal	421f2 <__muldf3>
   4721c:	842e                	mv	s0,a1
   4721e:	8dc9                	or	a1,a1,a0
   47220:	84aa                	mv	s1,a0
   47222:	be0599e3          	bnez	a1,46e14 <_strtod_l+0x502>
   47226:	4722                	lw	a4,8(sp)
   47228:	02200793          	li	a5,34
   4722c:	c31c                	sw	a5,0(a4)
   4722e:	b6dd                	j	46e14 <_strtod_l+0x502>
   47230:	5702                	lw	a4,32(sp)
   47232:	4d72                	lw	s10,28(sp)
   47234:	40f70cb3          	sub	s9,a4,a5
   47238:	bd51                	j	470cc <_strtod_l+0x7ba>
   4723a:	be200c13          	li	s8,-1054
   4723e:	40fc0c33          	sub	s8,s8,a5
   47242:	29801c33          	bset	s8,zero,s8
   47246:	4b05                	li	s6,1
   47248:	bd45                	j	470f8 <_strtod_l+0x7e6>
   4724a:	4c01                	li	s8,0
   4724c:	bfed                	j	47246 <_strtod_l+0x934>
   4724e:	5586                	lw	a1,96(sp)
   47250:	4522                	lw	a0,8(sp)
   47252:	866e                	mv	a2,s11
   47254:	43c020ef          	jal	49690 <__lshift>
   47258:	d0aa                	sw	a0,96(sp)
   4725a:	ee0519e3          	bnez	a0,4714c <_strtod_l+0x83a>
   4725e:	b64d                	j	46e00 <_strtod_l+0x4ee>
   47260:	e569                	bnez	a0,4732a <_strtod_l+0xa18>
   47262:	00100737          	lui	a4,0x100
   47266:	177d                	add	a4,a4,-1 # fffff <__fast_load_addr__+0xb497f>
   47268:	00e477b3          	and	a5,s0,a4
   4726c:	040c8963          	beqz	s9,472be <_strtod_l+0x9ac>
   47270:	04e79963          	bne	a5,a4,472c2 <_strtod_l+0x9b0>
   47274:	577d                	li	a4,-1
   47276:	02090063          	beqz	s2,47296 <_strtod_l+0x984>
   4727a:	7ff007b7          	lui	a5,0x7ff00
   4727e:	8fe1                	and	a5,a5,s0
   47280:	06a006b7          	lui	a3,0x6a00
   47284:	00f6e963          	bltu	a3,a5,47296 <_strtod_l+0x984>
   47288:	83d1                	srl	a5,a5,0x14
   4728a:	06b00693          	li	a3,107
   4728e:	40f687b3          	sub	a5,a3,a5
   47292:	00f71733          	sll	a4,a4,a5
   47296:	02e49663          	bne	s1,a4,472c2 <_strtod_l+0x9b0>
   4729a:	7ff007b7          	lui	a5,0x7ff00
   4729e:	17fd                	add	a5,a5,-1 # 7fefffff <__share_mem_end__+0x7ebfffff>
   472a0:	00f41563          	bne	s0,a5,472aa <_strtod_l+0x998>
   472a4:	57fd                	li	a5,-1
   472a6:	b4f48de3          	beq	s1,a5,46e00 <_strtod_l+0x4ee>
   472aa:	7ff007b7          	lui	a5,0x7ff00
   472ae:	8fe1                	and	a5,a5,s0
   472b0:	00100437          	lui	s0,0x100
   472b4:	943e                	add	s0,s0,a5
   472b6:	4481                	li	s1,0
   472b8:	f40918e3          	bnez	s2,47208 <_strtod_l+0x8f6>
   472bc:	bea1                	j	46e14 <_strtod_l+0x502>
   472be:	8fc5                	or	a5,a5,s1
   472c0:	d79d                	beqz	a5,471ee <_strtod_l+0x8dc>
   472c2:	020c0f63          	beqz	s8,47300 <_strtod_l+0x9ee>
   472c6:	008c7c33          	and	s8,s8,s0
   472ca:	fe0c07e3          	beqz	s8,472b8 <_strtod_l+0x9a6>
   472ce:	864a                	mv	a2,s2
   472d0:	8526                	mv	a0,s1
   472d2:	85a2                	mv	a1,s0
   472d4:	020c8b63          	beqz	s9,4730a <_strtod_l+0x9f8>
   472d8:	deaff0ef          	jal	468c2 <sulp>
   472dc:	862a                	mv	a2,a0
   472de:	86ae                	mv	a3,a1
   472e0:	4552                	lw	a0,20(sp)
   472e2:	45e2                	lw	a1,24(sp)
   472e4:	af4fa0ef          	jal	415d8 <__adddf3>
   472e8:	84aa                	mv	s1,a0
   472ea:	842e                	mv	s0,a1
   472ec:	b7f1                	j	472b8 <_strtod_l+0x9a6>
   472ee:	fff00737          	lui	a4,0xfff00
   472f2:	00100437          	lui	s0,0x100
   472f6:	97ba                	add	a5,a5,a4
   472f8:	147d                	add	s0,s0,-1 # fffff <__fast_load_addr__+0xb497f>
   472fa:	8c5d                	or	s0,s0,a5
   472fc:	54fd                	li	s1,-1
   472fe:	bf6d                	j	472b8 <_strtod_l+0x9a6>
   47300:	009b7b33          	and	s6,s6,s1
   47304:	fa0b0ae3          	beqz	s6,472b8 <_strtod_l+0x9a6>
   47308:	b7d9                	j	472ce <_strtod_l+0x9bc>
   4730a:	db8ff0ef          	jal	468c2 <sulp>
   4730e:	862a                	mv	a2,a0
   47310:	86ae                	mv	a3,a1
   47312:	4552                	lw	a0,20(sp)
   47314:	45e2                	lw	a1,24(sp)
   47316:	b22fb0ef          	jal	42638 <__subdf3>
   4731a:	4601                	li	a2,0
   4731c:	4681                	li	a3,0
   4731e:	84aa                	mv	s1,a0
   47320:	842e                	mv	s0,a1
   47322:	bb9fb0ef          	jal	42eda <__eqdf2>
   47326:	f949                	bnez	a0,472b8 <_strtod_l+0x9a6>
   47328:	b1a1                	j	46f70 <_strtod_l+0x65e>
   4732a:	85ce                	mv	a1,s3
   4732c:	8556                	mv	a0,s5
   4732e:	7da020ef          	jal	49b08 <__ratio>
   47332:	5622                	lw	a2,40(sp)
   47334:	56b2                	lw	a3,44(sp)
   47336:	8c2a                	mv	s8,a0
   47338:	8b2e                	mv	s6,a1
   4733a:	e1ffa0ef          	jal	42158 <__ledf2>
   4733e:	0ea04763          	bgtz	a0,4742c <_strtod_l+0xb1a>
   47342:	100c9463          	bnez	s9,4744a <_strtod_l+0xb38>
   47346:	e4f1                	bnez	s1,47412 <_strtod_l+0xb00>
   47348:	00c41793          	sll	a5,s0,0xc
   4734c:	ebe1                	bnez	a5,4741c <_strtod_l+0xb0a>
   4734e:	0004b7b7          	lui	a5,0x4b
   47352:	4007a603          	lw	a2,1024(a5) # 4b400 <_global_impure_ptr+0x18>
   47356:	4047a683          	lw	a3,1028(a5)
   4735a:	8562                	mv	a0,s8
   4735c:	85da                	mv	a1,s6
   4735e:	dfbfa0ef          	jal	42158 <__ledf2>
   47362:	0c054163          	bltz	a0,47424 <_strtod_l+0xb12>
   47366:	0004b7b7          	lui	a5,0x4b
   4736a:	3f87a603          	lw	a2,1016(a5) # 4b3f8 <_global_impure_ptr+0x10>
   4736e:	3fc7a683          	lw	a3,1020(a5)
   47372:	8562                	mv	a0,s8
   47374:	85da                	mv	a1,s6
   47376:	e7dfa0ef          	jal	421f2 <__muldf3>
   4737a:	8d2a                	mv	s10,a0
   4737c:	8c2e                	mv	s8,a1
   4737e:	87ea                	mv	a5,s10
   47380:	69fc1d93          	binv	s11,s8,0x1f
   47384:	7ff00837          	lui	a6,0x7ff00
   47388:	01047b33          	and	s6,s0,a6
   4738c:	7fe006b7          	lui	a3,0x7fe00
   47390:	88be                	mv	a7,a5
   47392:	876e                	mv	a4,s11
   47394:	12db1863          	bne	s6,a3,474c4 <_strtod_l+0xbb2>
   47398:	fcb00737          	lui	a4,0xfcb00
   4739c:	9722                	add	a4,a4,s0
   4739e:	85ba                	mv	a1,a4
   473a0:	8526                	mv	a0,s1
   473a2:	c2ba                	sw	a4,68(sp)
   473a4:	c6be                	sw	a5,76(sp)
   473a6:	c4a6                	sw	s1,72(sp)
   473a8:	58a020ef          	jal	49932 <__ulp>
   473ac:	47b6                	lw	a5,76(sp)
   473ae:	86ee                	mv	a3,s11
   473b0:	863e                	mv	a2,a5
   473b2:	e41fa0ef          	jal	421f2 <__muldf3>
   473b6:	48a6                	lw	a7,72(sp)
   473b8:	4716                	lw	a4,68(sp)
   473ba:	8646                	mv	a2,a7
   473bc:	86ba                	mv	a3,a4
   473be:	a1afa0ef          	jal	415d8 <__adddf3>
   473c2:	7ff00837          	lui	a6,0x7ff00
   473c6:	00b87833          	and	a6,a6,a1
   473ca:	7ca007b7          	lui	a5,0x7ca00
   473ce:	84aa                	mv	s1,a0
   473d0:	08f86463          	bltu	a6,a5,47458 <_strtod_l+0xb46>
   473d4:	4762                	lw	a4,24(sp)
   473d6:	7ff007b7          	lui	a5,0x7ff00
   473da:	17fd                	add	a5,a5,-1 # 7fefffff <__share_mem_end__+0x7ebfffff>
   473dc:	00e79663          	bne	a5,a4,473e8 <_strtod_l+0xad6>
   473e0:	4752                	lw	a4,20(sp)
   473e2:	57fd                	li	a5,-1
   473e4:	a0e78ee3          	beq	a5,a4,46e00 <_strtod_l+0x4ee>
   473e8:	7ff00437          	lui	s0,0x7ff00
   473ec:	147d                	add	s0,s0,-1 # 7fefffff <__share_mem_end__+0x7ebfffff>
   473ee:	54fd                	li	s1,-1
   473f0:	5586                	lw	a1,96(sp)
   473f2:	4522                	lw	a0,8(sp)
   473f4:	589010ef          	jal	4917c <_Bfree>
   473f8:	4522                	lw	a0,8(sp)
   473fa:	85d2                	mv	a1,s4
   473fc:	581010ef          	jal	4917c <_Bfree>
   47400:	4522                	lw	a0,8(sp)
   47402:	85ce                	mv	a1,s3
   47404:	579010ef          	jal	4917c <_Bfree>
   47408:	4522                	lw	a0,8(sp)
   4740a:	85d6                	mv	a1,s5
   4740c:	571010ef          	jal	4917c <_Bfree>
   47410:	b1a9                	j	4705a <_strtod_l+0x748>
   47412:	4785                	li	a5,1
   47414:	00f49463          	bne	s1,a5,4741c <_strtod_l+0xb0a>
   47418:	b4040ce3          	beqz	s0,46f70 <_strtod_l+0x65e>
   4741c:	4781                	li	a5,0
   4741e:	bff00db7          	lui	s11,0xbff00
   47422:	a03d                	j	47450 <_strtod_l+0xb3e>
   47424:	4d01                	li	s10,0
   47426:	3fe00c37          	lui	s8,0x3fe00
   4742a:	bf91                	j	4737e <_strtod_l+0xa6c>
   4742c:	5642                	lw	a2,48(sp)
   4742e:	56d2                	lw	a3,52(sp)
   47430:	8562                	mv	a0,s8
   47432:	85da                	mv	a1,s6
   47434:	dbffa0ef          	jal	421f2 <__muldf3>
   47438:	87aa                	mv	a5,a0
   4743a:	8dae                	mv	s11,a1
   4743c:	8d2a                	mv	s10,a0
   4743e:	8c2e                	mv	s8,a1
   47440:	f40c92e3          	bnez	s9,47384 <_strtod_l+0xa72>
   47444:	69f59d93          	binv	s11,a1,0x1f
   47448:	bf35                	j	47384 <_strtod_l+0xa72>
   4744a:	4781                	li	a5,0
   4744c:	3ff00db7          	lui	s11,0x3ff00
   47450:	4d01                	li	s10,0
   47452:	3ff00c37          	lui	s8,0x3ff00
   47456:	b73d                	j	47384 <_strtod_l+0xa72>
   47458:	03500437          	lui	s0,0x3500
   4745c:	942e                	add	s0,s0,a1
   4745e:	f80919e3          	bnez	s2,473f0 <_strtod_l+0xade>
   47462:	7ff007b7          	lui	a5,0x7ff00
   47466:	8fe1                	and	a5,a5,s0
   47468:	f8fb14e3          	bne	s6,a5,473f0 <_strtod_l+0xade>
   4746c:	85e2                	mv	a1,s8
   4746e:	856a                	mv	a0,s10
   47470:	b61fb0ef          	jal	42fd0 <__fixdfdi>
   47474:	bf5fb0ef          	jal	43068 <__floatdidf>
   47478:	862a                	mv	a2,a0
   4747a:	86ae                	mv	a3,a1
   4747c:	856a                	mv	a0,s10
   4747e:	85e2                	mv	a1,s8
   47480:	9b8fb0ef          	jal	42638 <__subdf3>
   47484:	00c41793          	sll	a5,s0,0xc
   47488:	83b1                	srl	a5,a5,0xc
   4748a:	8fc5                	or	a5,a5,s1
   4748c:	0197e7b3          	or	a5,a5,s9
   47490:	8c2a                	mv	s8,a0
   47492:	8b2e                	mv	s6,a1
   47494:	c3dd                	beqz	a5,4753a <_strtod_l+0xc28>
   47496:	0004b7b7          	lui	a5,0x4b
   4749a:	4187a603          	lw	a2,1048(a5) # 4b418 <_global_impure_ptr+0x30>
   4749e:	41c7a683          	lw	a3,1052(a5)
   474a2:	cb7fa0ef          	jal	42158 <__ledf2>
   474a6:	960547e3          	bltz	a0,46e14 <_strtod_l+0x502>
   474aa:	0004b7b7          	lui	a5,0x4b
   474ae:	4207a603          	lw	a2,1056(a5) # 4b420 <_global_impure_ptr+0x38>
   474b2:	4247a683          	lw	a3,1060(a5)
   474b6:	8562                	mv	a0,s8
   474b8:	85da                	mv	a1,s6
   474ba:	c05fa0ef          	jal	420be <__gedf2>
   474be:	f2a059e3          	blez	a0,473f0 <_strtod_l+0xade>
   474c2:	ba89                	j	46e14 <_strtod_l+0x502>
   474c4:	04090863          	beqz	s2,47514 <_strtod_l+0xc02>
   474c8:	06a007b7          	lui	a5,0x6a00
   474cc:	0567e463          	bltu	a5,s6,47514 <_strtod_l+0xc02>
   474d0:	5662                	lw	a2,56(sp)
   474d2:	56f2                	lw	a3,60(sp)
   474d4:	856a                	mv	a0,s10
   474d6:	85e2                	mv	a1,s8
   474d8:	c2c6                	sw	a7,68(sp)
   474da:	c4ee                	sw	s11,72(sp)
   474dc:	c7dfa0ef          	jal	42158 <__ledf2>
   474e0:	4896                	lw	a7,68(sp)
   474e2:	4726                	lw	a4,72(sp)
   474e4:	02a04363          	bgtz	a0,4750a <_strtod_l+0xbf8>
   474e8:	85e2                	mv	a1,s8
   474ea:	856a                	mv	a0,s10
   474ec:	f9efb0ef          	jal	42c8a <__fixunsdfsi>
   474f0:	4785                	li	a5,1
   474f2:	0af57533          	maxu	a0,a0,a5
   474f6:	ff4fb0ef          	jal	42cea <__floatunsidf>
   474fa:	88aa                	mv	a7,a0
   474fc:	8d2a                	mv	s10,a0
   474fe:	8c2e                	mv	s8,a1
   47500:	69f59713          	binv	a4,a1,0x1f
   47504:	000c8363          	beqz	s9,4750a <_strtod_l+0xbf8>
   47508:	872e                	mv	a4,a1
   4750a:	06b007b7          	lui	a5,0x6b00
   4750e:	97ba                	add	a5,a5,a4
   47510:	41678733          	sub	a4,a5,s6
   47514:	4552                	lw	a0,20(sp)
   47516:	45e2                	lw	a1,24(sp)
   47518:	84c6                	mv	s1,a7
   4751a:	843a                	mv	s0,a4
   4751c:	416020ef          	jal	49932 <__ulp>
   47520:	862a                	mv	a2,a0
   47522:	86ae                	mv	a3,a1
   47524:	8526                	mv	a0,s1
   47526:	85a2                	mv	a1,s0
   47528:	ccbfa0ef          	jal	421f2 <__muldf3>
   4752c:	4652                	lw	a2,20(sp)
   4752e:	46e2                	lw	a3,24(sp)
   47530:	8a8fa0ef          	jal	415d8 <__adddf3>
   47534:	84aa                	mv	s1,a0
   47536:	842e                	mv	s0,a1
   47538:	b71d                	j	4745e <_strtod_l+0xb4c>
   4753a:	0004b7b7          	lui	a5,0x4b
   4753e:	4287a603          	lw	a2,1064(a5) # 4b428 <_global_impure_ptr+0x40>
   47542:	42c7a683          	lw	a3,1068(a5)
   47546:	c13fa0ef          	jal	42158 <__ledf2>
   4754a:	ea0553e3          	bgez	a0,473f0 <_strtod_l+0xade>
   4754e:	8c7ff06f          	j	46e14 <_strtod_l+0x502>
   47552:	06500713          	li	a4,101
   47556:	00e78763          	beq	a5,a4,47564 <_strtod_l+0xc52>
   4755a:	04500713          	li	a4,69
   4755e:	4505                	li	a0,1
   47560:	f0e79263          	bne	a5,a4,46c64 <_strtod_l+0x352>
   47564:	4a01                	li	s4,0
   47566:	4505                	li	a0,1
   47568:	d82ff06f          	j	46aea <_strtod_l+0x1d8>

0004756c <_strtod_r>:
   4756c:	012d06b7          	lui	a3,0x12d0
   47570:	06068693          	add	a3,a3,96 # 12d0060 <__global_locale>
   47574:	b9eff06f          	j	46912 <_strtod_l>

00047578 <_strtol_l.isra.0>:
   47578:	1141                	add	sp,sp,-16
   4757a:	c606                	sw	ra,12(sp)
   4757c:	c422                	sw	s0,8(sp)
   4757e:	02400793          	li	a5,36
   47582:	06d7e463          	bltu	a5,a3,475ea <_strtol_l.isra.0+0x72>
   47586:	4705                	li	a4,1
   47588:	87ae                	mv	a5,a1
   4758a:	06e68063          	beq	a3,a4,475ea <_strtol_l.isra.0+0x72>
   4758e:	0004b8b7          	lui	a7,0x4b
   47592:	8f2a                	mv	t5,a0
   47594:	17188893          	add	a7,a7,369 # 4b171 <_ctype_+0x1>
   47598:	833e                	mv	t1,a5
   4759a:	0007c703          	lbu	a4,0(a5)
   4759e:	0785                	add	a5,a5,1
   475a0:	01170533          	add	a0,a4,a7
   475a4:	00054803          	lbu	a6,0(a0)
   475a8:	00887813          	and	a6,a6,8
   475ac:	fe0816e3          	bnez	a6,47598 <_strtol_l.isra.0+0x20>
   475b0:	02d00513          	li	a0,45
   475b4:	04a71463          	bne	a4,a0,475fc <_strtol_l.isra.0+0x84>
   475b8:	0007c703          	lbu	a4,0(a5)
   475bc:	4f85                	li	t6,1
   475be:	00230793          	add	a5,t1,2
   475c2:	fef6f513          	and	a0,a3,-17
   475c6:	ed21                	bnez	a0,4761e <_strtol_l.isra.0+0xa6>
   475c8:	03000513          	li	a0,48
   475cc:	04a71263          	bne	a4,a0,47610 <_strtol_l.isra.0+0x98>
   475d0:	0007c803          	lbu	a6,0(a5)
   475d4:	05800513          	li	a0,88
   475d8:	0df87813          	and	a6,a6,223
   475dc:	02a81a63          	bne	a6,a0,47610 <_strtol_l.isra.0+0x98>
   475e0:	0017c703          	lbu	a4,1(a5)
   475e4:	0789                	add	a5,a5,2
   475e6:	46c1                	li	a3,16
   475e8:	a81d                	j	4761e <_strtol_l.isra.0+0xa6>
   475ea:	a94fe0ef          	jal	4587e <__errno>
   475ee:	47d9                	li	a5,22
   475f0:	c11c                	sw	a5,0(a0)
   475f2:	4501                	li	a0,0
   475f4:	40b2                	lw	ra,12(sp)
   475f6:	4422                	lw	s0,8(sp)
   475f8:	0141                	add	sp,sp,16
   475fa:	8082                	ret
   475fc:	02b00513          	li	a0,43
   47600:	4f81                	li	t6,0
   47602:	fca710e3          	bne	a4,a0,475c2 <_strtol_l.isra.0+0x4a>
   47606:	0007c703          	lbu	a4,0(a5)
   4760a:	00230793          	add	a5,t1,2
   4760e:	bf55                	j	475c2 <_strtol_l.isra.0+0x4a>
   47610:	faf9                	bnez	a3,475e6 <_strtol_l.isra.0+0x6e>
   47612:	03000513          	li	a0,48
   47616:	46a9                	li	a3,10
   47618:	00a71363          	bne	a4,a0,4761e <_strtol_l.isra.0+0xa6>
   4761c:	46a1                	li	a3,8
   4761e:	800008b7          	lui	a7,0x80000
   47622:	18fd                	add	a7,a7,-1 # 7fffffff <__share_mem_end__+0x7ecfffff>
   47624:	98fe                	add	a7,a7,t6
   47626:	02d8f2b3          	remu	t0,a7,a3
   4762a:	4301                	li	t1,0
   4762c:	4501                	li	a0,0
   4762e:	43a5                	li	t2,9
   47630:	4ee5                	li	t4,25
   47632:	547d                	li	s0,-1
   47634:	02d8de33          	divu	t3,a7,a3
   47638:	fd070813          	add	a6,a4,-48 # fcafffd0 <__share_mem_end__+0xfb7fffd0>
   4763c:	0303e663          	bltu	t2,a6,47668 <_strtol_l.isra.0+0xf0>
   47640:	8742                	mv	a4,a6
   47642:	04d75163          	bge	a4,a3,47684 <_strtol_l.isra.0+0x10c>
   47646:	00830d63          	beq	t1,s0,47660 <_strtol_l.isra.0+0xe8>
   4764a:	537d                	li	t1,-1
   4764c:	00ae6a63          	bltu	t3,a0,47660 <_strtol_l.isra.0+0xe8>
   47650:	00ae1463          	bne	t3,a0,47658 <_strtol_l.isra.0+0xe0>
   47654:	00e2c663          	blt	t0,a4,47660 <_strtol_l.isra.0+0xe8>
   47658:	4305                	li	t1,1
   4765a:	02a68533          	mul	a0,a3,a0
   4765e:	953a                	add	a0,a0,a4
   47660:	0785                	add	a5,a5,1
   47662:	fff7c703          	lbu	a4,-1(a5)
   47666:	bfc9                	j	47638 <_strtol_l.isra.0+0xc0>
   47668:	fbf70813          	add	a6,a4,-65
   4766c:	010ee563          	bltu	t4,a6,47676 <_strtol_l.isra.0+0xfe>
   47670:	fc970713          	add	a4,a4,-55
   47674:	b7f9                	j	47642 <_strtol_l.isra.0+0xca>
   47676:	f9f70813          	add	a6,a4,-97
   4767a:	010ee563          	bltu	t4,a6,47684 <_strtol_l.isra.0+0x10c>
   4767e:	fa970713          	add	a4,a4,-87
   47682:	b7c1                	j	47642 <_strtol_l.isra.0+0xca>
   47684:	577d                	li	a4,-1
   47686:	00e31b63          	bne	t1,a4,4769c <_strtol_l.isra.0+0x124>
   4768a:	02200713          	li	a4,34
   4768e:	00ef2023          	sw	a4,0(t5)
   47692:	8546                	mv	a0,a7
   47694:	d225                	beqz	a2,475f4 <_strtol_l.isra.0+0x7c>
   47696:	fff78593          	add	a1,a5,-1
   4769a:	a801                	j	476aa <_strtol_l.isra.0+0x132>
   4769c:	000f8463          	beqz	t6,476a4 <_strtol_l.isra.0+0x12c>
   476a0:	40a00533          	neg	a0,a0
   476a4:	da21                	beqz	a2,475f4 <_strtol_l.isra.0+0x7c>
   476a6:	fe0318e3          	bnez	t1,47696 <_strtol_l.isra.0+0x11e>
   476aa:	c20c                	sw	a1,0(a2)
   476ac:	b7a1                	j	475f4 <_strtol_l.isra.0+0x7c>

000476ae <_strtol_r>:
   476ae:	b5e9                	j	47578 <_strtol_l.isra.0>

000476b0 <quorem>:
   476b0:	1101                	add	sp,sp,-32
   476b2:	cc22                	sw	s0,24(sp)
   476b4:	491c                	lw	a5,16(a0)
   476b6:	4980                	lw	s0,16(a1)
   476b8:	ce06                	sw	ra,28(sp)
   476ba:	ca26                	sw	s1,20(sp)
   476bc:	c84a                	sw	s2,16(sp)
   476be:	c64e                	sw	s3,12(sp)
   476c0:	c452                	sw	s4,8(sp)
   476c2:	c256                	sw	s5,4(sp)
   476c4:	1087ca63          	blt	a5,s0,477d8 <quorem+0x128>
   476c8:	147d                	add	s0,s0,-1 # 34fffff <__share_mem_end__+0x21fffff>
   476ca:	01458a93          	add	s5,a1,20
   476ce:	01450993          	add	s3,a0,20
   476d2:	21544a33          	sh2add	s4,s0,s5
   476d6:	000a2783          	lw	a5,0(s4)
   476da:	21344833          	sh2add	a6,s0,s3
   476de:	00082703          	lw	a4,0(a6) # 7ff00000 <__share_mem_end__+0x7ec00000>
   476e2:	0785                	add	a5,a5,1
   476e4:	892a                	mv	s2,a0
   476e6:	02f754b3          	divu	s1,a4,a5
   476ea:	06f76263          	bltu	a4,a5,4774e <quorem+0x9e>
   476ee:	6541                	lui	a0,0x10
   476f0:	834e                	mv	t1,s3
   476f2:	88d6                	mv	a7,s5
   476f4:	4e01                	li	t3,0
   476f6:	4e81                	li	t4,0
   476f8:	157d                	add	a0,a0,-1 # ffff <__fw_size__+0x4d27>
   476fa:	0008a703          	lw	a4,0(a7)
   476fe:	0891                	add	a7,a7,4
   47700:	0311                	add	t1,t1,4
   47702:	00a77633          	and	a2,a4,a0
   47706:	8341                	srl	a4,a4,0x10
   47708:	02960633          	mul	a2,a2,s1
   4770c:	02970733          	mul	a4,a4,s1
   47710:	9672                	add	a2,a2,t3
   47712:	01065793          	srl	a5,a2,0x10
   47716:	8e69                	and	a2,a2,a0
   47718:	973e                	add	a4,a4,a5
   4771a:	ffc32783          	lw	a5,-4(t1)
   4771e:	01075e13          	srl	t3,a4,0x10
   47722:	8f69                	and	a4,a4,a0
   47724:	00a7f6b3          	and	a3,a5,a0
   47728:	8e91                	sub	a3,a3,a2
   4772a:	96f6                	add	a3,a3,t4
   4772c:	83c1                	srl	a5,a5,0x10
   4772e:	8f99                	sub	a5,a5,a4
   47730:	4106d713          	sra	a4,a3,0x10
   47734:	97ba                	add	a5,a5,a4
   47736:	4107de93          	sra	t4,a5,0x10
   4773a:	8ee9                	and	a3,a3,a0
   4773c:	07c2                	sll	a5,a5,0x10
   4773e:	8edd                	or	a3,a3,a5
   47740:	fed32e23          	sw	a3,-4(t1)
   47744:	fb1a7be3          	bgeu	s4,a7,476fa <quorem+0x4a>
   47748:	00082783          	lw	a5,0(a6)
   4774c:	c7bd                	beqz	a5,477ba <quorem+0x10a>
   4774e:	854a                	mv	a0,s2
   47750:	042020ef          	jal	49792 <__mcmp>
   47754:	04054563          	bltz	a0,4779e <quorem+0xee>
   47758:	6641                	lui	a2,0x10
   4775a:	85ce                	mv	a1,s3
   4775c:	86d6                	mv	a3,s5
   4775e:	4801                	li	a6,0
   47760:	167d                	add	a2,a2,-1 # ffff <__fw_size__+0x4d27>
   47762:	4288                	lw	a0,0(a3)
   47764:	419c                	lw	a5,0(a1)
   47766:	0691                	add	a3,a3,4
   47768:	00c578b3          	and	a7,a0,a2
   4776c:	00c7f733          	and	a4,a5,a2
   47770:	41170733          	sub	a4,a4,a7
   47774:	9742                	add	a4,a4,a6
   47776:	8141                	srl	a0,a0,0x10
   47778:	83c1                	srl	a5,a5,0x10
   4777a:	8f89                	sub	a5,a5,a0
   4777c:	41075513          	sra	a0,a4,0x10
   47780:	97aa                	add	a5,a5,a0
   47782:	4107d813          	sra	a6,a5,0x10
   47786:	8f71                	and	a4,a4,a2
   47788:	07c2                	sll	a5,a5,0x10
   4778a:	8f5d                	or	a4,a4,a5
   4778c:	c198                	sw	a4,0(a1)
   4778e:	0591                	add	a1,a1,4
   47790:	fcda79e3          	bgeu	s4,a3,47762 <quorem+0xb2>
   47794:	213447b3          	sh2add	a5,s0,s3
   47798:	4398                	lw	a4,0(a5)
   4779a:	cb0d                	beqz	a4,477cc <quorem+0x11c>
   4779c:	0485                	add	s1,s1,1
   4779e:	8526                	mv	a0,s1
   477a0:	40f2                	lw	ra,28(sp)
   477a2:	4462                	lw	s0,24(sp)
   477a4:	44d2                	lw	s1,20(sp)
   477a6:	4942                	lw	s2,16(sp)
   477a8:	49b2                	lw	s3,12(sp)
   477aa:	4a22                	lw	s4,8(sp)
   477ac:	4a92                	lw	s5,4(sp)
   477ae:	6105                	add	sp,sp,32
   477b0:	8082                	ret
   477b2:	00082783          	lw	a5,0(a6)
   477b6:	e789                	bnez	a5,477c0 <quorem+0x110>
   477b8:	147d                	add	s0,s0,-1
   477ba:	1871                	add	a6,a6,-4
   477bc:	ff09ebe3          	bltu	s3,a6,477b2 <quorem+0x102>
   477c0:	00892823          	sw	s0,16(s2)
   477c4:	b769                	j	4774e <quorem+0x9e>
   477c6:	4398                	lw	a4,0(a5)
   477c8:	e709                	bnez	a4,477d2 <quorem+0x122>
   477ca:	147d                	add	s0,s0,-1
   477cc:	17f1                	add	a5,a5,-4
   477ce:	fef9ece3          	bltu	s3,a5,477c6 <quorem+0x116>
   477d2:	00892823          	sw	s0,16(s2)
   477d6:	b7d9                	j	4779c <quorem+0xec>
   477d8:	4501                	li	a0,0
   477da:	b7d9                	j	477a0 <quorem+0xf0>

000477dc <_dtoa_r>:
   477dc:	7135                	add	sp,sp,-160
   477de:	d83e                	sw	a5,48(sp)
   477e0:	515c                	lw	a5,36(a0)
   477e2:	cd22                	sw	s0,152(sp)
   477e4:	c94a                	sw	s2,144(sp)
   477e6:	c552                	sw	s4,136(sp)
   477e8:	c356                	sw	s5,132(sp)
   477ea:	c15a                	sw	s6,128(sp)
   477ec:	cf06                	sw	ra,156(sp)
   477ee:	cb26                	sw	s1,148(sp)
   477f0:	c74e                	sw	s3,140(sp)
   477f2:	dede                	sw	s7,124(sp)
   477f4:	dce2                	sw	s8,120(sp)
   477f6:	dae6                	sw	s9,116(sp)
   477f8:	d8ea                	sw	s10,112(sp)
   477fa:	d6ee                	sw	s11,108(sp)
   477fc:	c02a                	sw	a0,0(sp)
   477fe:	c836                	sw	a3,16(sp)
   47800:	cc3a                	sw	a4,24(sp)
   47802:	ce46                	sw	a7,28(sp)
   47804:	8aae                	mv	s5,a1
   47806:	8432                	mv	s0,a2
   47808:	8942                	mv	s2,a6
   4780a:	8a2e                	mv	s4,a1
   4780c:	8b32                	mv	s6,a2
   4780e:	ef85                	bnez	a5,47846 <_dtoa_r+0x6a>
   47810:	4541                	li	a0,16
   47812:	063010ef          	jal	49074 <malloc>
   47816:	4782                	lw	a5,0(sp)
   47818:	d3c8                	sw	a0,36(a5)
   4781a:	ed11                	bnez	a0,47836 <_dtoa_r+0x5a>
   4781c:	0004b6b7          	lui	a3,0x4b
   47820:	dc468693          	add	a3,a3,-572 # 4adc4 <__clz_tab+0x310>
   47824:	4601                	li	a2,0
   47826:	0ea00593          	li	a1,234
   4782a:	0004b537          	lui	a0,0x4b
   4782e:	ddc50513          	add	a0,a0,-548 # 4addc <__clz_tab+0x328>
   47832:	725020ef          	jal	4a756 <__assert_func>
   47836:	00052223          	sw	zero,4(a0)
   4783a:	00052423          	sw	zero,8(a0)
   4783e:	00052023          	sw	zero,0(a0)
   47842:	00052623          	sw	zero,12(a0)
   47846:	4782                	lw	a5,0(sp)
   47848:	53dc                	lw	a5,36(a5)
   4784a:	438c                	lw	a1,0(a5)
   4784c:	cd89                	beqz	a1,47866 <_dtoa_r+0x8a>
   4784e:	43dc                	lw	a5,4(a5)
   47850:	4502                	lw	a0,0(sp)
   47852:	c1dc                	sw	a5,4(a1)
   47854:	28f017b3          	bset	a5,zero,a5
   47858:	c59c                	sw	a5,8(a1)
   4785a:	123010ef          	jal	4917c <_Bfree>
   4785e:	4782                	lw	a5,0(sp)
   47860:	53dc                	lw	a5,36(a5)
   47862:	0007a023          	sw	zero,0(a5)
   47866:	04045663          	bgez	s0,478b2 <_dtoa_r+0xd6>
   4786a:	4785                	li	a5,1
   4786c:	00f92023          	sw	a5,0(s2)
   47870:	49f41b13          	bclr	s6,s0,0x1f
   47874:	7ff007b7          	lui	a5,0x7ff00
   47878:	00fb7733          	and	a4,s6,a5
   4787c:	02f71e63          	bne	a4,a5,478b8 <_dtoa_r+0xdc>
   47880:	5742                	lw	a4,48(sp)
   47882:	6789                	lui	a5,0x2
   47884:	0b32                	sll	s6,s6,0xc
   47886:	70f78793          	add	a5,a5,1807 # 270f <RISCV_MEIE_MTIE+0x1e8f>
   4788a:	00cb5b13          	srl	s6,s6,0xc
   4788e:	c31c                	sw	a5,0(a4)
   47890:	015b6b33          	or	s6,s6,s5
   47894:	2e0b04e3          	beqz	s6,4837c <_dtoa_r+0xba0>
   47898:	4772                	lw	a4,28(sp)
   4789a:	0004b7b7          	lui	a5,0x4b
   4789e:	dc078413          	add	s0,a5,-576 # 4adc0 <__clz_tab+0x30c>
   478a2:	2e0709e3          	beqz	a4,48394 <_dtoa_r+0xbb8>
   478a6:	0004b7b7          	lui	a5,0x4b
   478aa:	dc378793          	add	a5,a5,-573 # 4adc3 <__clz_tab+0x30f>
   478ae:	2e30006f          	j	48390 <_dtoa_r+0xbb4>
   478b2:	00092023          	sw	zero,0(s2)
   478b6:	bf7d                	j	47874 <_dtoa_r+0x98>
   478b8:	4601                	li	a2,0
   478ba:	4681                	li	a3,0
   478bc:	8556                	mv	a0,s5
   478be:	85da                	mv	a1,s6
   478c0:	8bd6                	mv	s7,s5
   478c2:	d656                	sw	s5,44(sp)
   478c4:	d25a                	sw	s6,36(sp)
   478c6:	e14fb0ef          	jal	42eda <__eqdf2>
   478ca:	e115                	bnez	a0,478ee <_dtoa_r+0x112>
   478cc:	5742                	lw	a4,48(sp)
   478ce:	4785                	li	a5,1
   478d0:	c31c                	sw	a5,0(a4)
   478d2:	47f2                	lw	a5,28(sp)
   478d4:	c799                	beqz	a5,478e2 <_dtoa_r+0x106>
   478d6:	4772                	lw	a4,28(sp)
   478d8:	0004b7b7          	lui	a5,0x4b
   478dc:	d7178793          	add	a5,a5,-655 # 4ad71 <__clz_tab+0x2bd>
   478e0:	c31c                	sw	a5,0(a4)
   478e2:	0004b7b7          	lui	a5,0x4b
   478e6:	d7078413          	add	s0,a5,-656 # 4ad70 <__clz_tab+0x2bc>
   478ea:	2ab0006f          	j	48394 <_dtoa_r+0xbb8>
   478ee:	4502                	lw	a0,0(sp)
   478f0:	08b8                	add	a4,sp,88
   478f2:	08f4                	add	a3,sp,92
   478f4:	865a                	mv	a2,s6
   478f6:	85d6                	mv	a1,s5
   478f8:	134020ef          	jal	49a2c <__d2b>
   478fc:	014b5913          	srl	s2,s6,0x14
   47900:	c22a                	sw	a0,4(sp)
   47902:	7ff97913          	and	s2,s2,2047
   47906:	49e6                	lw	s3,88(sp)
   47908:	12090563          	beqz	s2,47a32 <_dtoa_r+0x256>
   4790c:	5792                	lw	a5,36(sp)
   4790e:	3ff00737          	lui	a4,0x3ff00
   47912:	c0190913          	add	s2,s2,-1023
   47916:	07b2                	sll	a5,a5,0xc
   47918:	83b1                	srl	a5,a5,0xc
   4791a:	8fd9                	or	a5,a5,a4
   4791c:	c482                	sw	zero,72(sp)
   4791e:	0004b737          	lui	a4,0x4b
   47922:	43872603          	lw	a2,1080(a4) # 4b438 <_global_impure_ptr+0x50>
   47926:	43c72683          	lw	a3,1084(a4)
   4792a:	855e                	mv	a0,s7
   4792c:	85be                	mv	a1,a5
   4792e:	d0bfa0ef          	jal	42638 <__subdf3>
   47932:	0004b7b7          	lui	a5,0x4b
   47936:	4407a603          	lw	a2,1088(a5) # 4b440 <_global_impure_ptr+0x58>
   4793a:	4447a683          	lw	a3,1092(a5)
   4793e:	8b5fa0ef          	jal	421f2 <__muldf3>
   47942:	0004b7b7          	lui	a5,0x4b
   47946:	4487a603          	lw	a2,1096(a5) # 4b448 <_global_impure_ptr+0x60>
   4794a:	44c7a683          	lw	a3,1100(a5)
   4794e:	c8bf90ef          	jal	415d8 <__adddf3>
   47952:	8baa                	mv	s7,a0
   47954:	854a                	mv	a0,s2
   47956:	8aae                	mv	s5,a1
   47958:	e24fb0ef          	jal	42f7c <__floatsidf>
   4795c:	0004b7b7          	lui	a5,0x4b
   47960:	4507a603          	lw	a2,1104(a5) # 4b450 <_global_impure_ptr+0x68>
   47964:	4547a683          	lw	a3,1108(a5)
   47968:	88bfa0ef          	jal	421f2 <__muldf3>
   4796c:	862a                	mv	a2,a0
   4796e:	86ae                	mv	a3,a1
   47970:	855e                	mv	a0,s7
   47972:	85d6                	mv	a1,s5
   47974:	c65f90ef          	jal	415d8 <__adddf3>
   47978:	8baa                	mv	s7,a0
   4797a:	8aae                	mv	s5,a1
   4797c:	aacfb0ef          	jal	42c28 <__fixdfsi>
   47980:	8c2a                	mv	s8,a0
   47982:	4601                	li	a2,0
   47984:	4681                	li	a3,0
   47986:	855e                	mv	a0,s7
   47988:	85d6                	mv	a1,s5
   4798a:	fcefa0ef          	jal	42158 <__ledf2>
   4798e:	00055b63          	bgez	a0,479a4 <_dtoa_r+0x1c8>
   47992:	8562                	mv	a0,s8
   47994:	de8fb0ef          	jal	42f7c <__floatsidf>
   47998:	865e                	mv	a2,s7
   4799a:	86d6                	mv	a3,s5
   4799c:	d3efb0ef          	jal	42eda <__eqdf2>
   479a0:	c111                	beqz	a0,479a4 <_dtoa_r+0x1c8>
   479a2:	1c7d                	add	s8,s8,-1 # 3fefffff <__share_mem_end__+0x3ebfffff>
   479a4:	4705                	li	a4,1
   479a6:	47d9                	li	a5,22
   479a8:	d43a                	sw	a4,40(sp)
   479aa:	0387e263          	bltu	a5,s8,479ce <_dtoa_r+0x1f2>
   479ae:	0004b7b7          	lui	a5,0x4b
   479b2:	31878793          	add	a5,a5,792 # 4b318 <__mprec_tens>
   479b6:	20fc67b3          	sh3add	a5,s8,a5
   479ba:	5532                	lw	a0,44(sp)
   479bc:	4390                	lw	a2,0(a5)
   479be:	43d4                	lw	a3,4(a5)
   479c0:	5592                	lw	a1,36(sp)
   479c2:	f96fa0ef          	jal	42158 <__ledf2>
   479c6:	00055363          	bgez	a0,479cc <_dtoa_r+0x1f0>
   479ca:	1c7d                	add	s8,s8,-1
   479cc:	d402                	sw	zero,40(sp)
   479ce:	412989b3          	sub	s3,s3,s2
   479d2:	fff98d13          	add	s10,s3,-1
   479d6:	4b81                	li	s7,0
   479d8:	000d5663          	bgez	s10,479e4 <_dtoa_r+0x208>
   479dc:	4b85                	li	s7,1
   479de:	413b8bb3          	sub	s7,s7,s3
   479e2:	4d01                	li	s10,0
   479e4:	080c4863          	bltz	s8,47a74 <_dtoa_r+0x298>
   479e8:	9d62                	add	s10,s10,s8
   479ea:	d062                	sw	s8,32(sp)
   479ec:	4c81                	li	s9,0
   479ee:	4742                	lw	a4,16(sp)
   479f0:	47a5                	li	a5,9
   479f2:	0ee7e163          	bltu	a5,a4,47ad4 <_dtoa_r+0x2f8>
   479f6:	4795                	li	a5,5
   479f8:	4905                	li	s2,1
   479fa:	00e7d663          	bge	a5,a4,47a06 <_dtoa_r+0x22a>
   479fe:	ffc70793          	add	a5,a4,-4
   47a02:	c83e                	sw	a5,16(sp)
   47a04:	4901                	li	s2,0
   47a06:	4742                	lw	a4,16(sp)
   47a08:	4791                	li	a5,4
   47a0a:	06f70b63          	beq	a4,a5,47a80 <_dtoa_r+0x2a4>
   47a0e:	4795                	li	a5,5
   47a10:	0af70763          	beq	a4,a5,47abe <_dtoa_r+0x2e2>
   47a14:	4789                	li	a5,2
   47a16:	0af70263          	beq	a4,a5,47aba <_dtoa_r+0x2de>
   47a1a:	478d                	li	a5,3
   47a1c:	ca02                	sw	zero,20(sp)
   47a1e:	0af70263          	beq	a4,a5,47ac2 <_dtoa_r+0x2e6>
   47a22:	4785                	li	a5,1
   47a24:	ca3e                	sw	a5,20(sp)
   47a26:	57fd                	li	a5,-1
   47a28:	c43e                	sw	a5,8(sp)
   47a2a:	5dfd                	li	s11,-1
   47a2c:	47c9                	li	a5,18
   47a2e:	cc02                	sw	zero,24(sp)
   47a30:	a8b9                	j	47a8e <_dtoa_r+0x2b2>
   47a32:	4976                	lw	s2,92(sp)
   47a34:	02000793          	li	a5,32
   47a38:	994e                	add	s2,s2,s3
   47a3a:	43290713          	add	a4,s2,1074
   47a3e:	02e7d763          	bge	a5,a4,47a6c <_dtoa_r+0x290>
   47a42:	04000793          	li	a5,64
   47a46:	8f99                	sub	a5,a5,a4
   47a48:	41290713          	add	a4,s2,1042
   47a4c:	00fb17b3          	sll	a5,s6,a5
   47a50:	00ead733          	srl	a4,s5,a4
   47a54:	00e7e533          	or	a0,a5,a4
   47a58:	a92fb0ef          	jal	42cea <__floatunsidf>
   47a5c:	fe1007b7          	lui	a5,0xfe100
   47a60:	4705                	li	a4,1
   47a62:	8baa                	mv	s7,a0
   47a64:	97ae                	add	a5,a5,a1
   47a66:	197d                	add	s2,s2,-1
   47a68:	c4ba                	sw	a4,72(sp)
   47a6a:	bd55                	j	4791e <_dtoa_r+0x142>
   47a6c:	8f99                	sub	a5,a5,a4
   47a6e:	00fa9533          	sll	a0,s5,a5
   47a72:	b7dd                	j	47a58 <_dtoa_r+0x27c>
   47a74:	418b8bb3          	sub	s7,s7,s8
   47a78:	41800cb3          	neg	s9,s8
   47a7c:	d002                	sw	zero,32(sp)
   47a7e:	bf85                	j	479ee <_dtoa_r+0x212>
   47a80:	4785                	li	a5,1
   47a82:	ca3e                	sw	a5,20(sp)
   47a84:	47e2                	lw	a5,24(sp)
   47a86:	04f05a63          	blez	a5,47ada <_dtoa_r+0x2fe>
   47a8a:	c43e                	sw	a5,8(sp)
   47a8c:	8dbe                	mv	s11,a5
   47a8e:	4702                	lw	a4,0(sp)
   47a90:	4581                	li	a1,0
   47a92:	5354                	lw	a3,36(a4)
   47a94:	4711                	li	a4,4
   47a96:	01470613          	add	a2,a4,20
   47a9a:	04c7f663          	bgeu	a5,a2,47ae6 <_dtoa_r+0x30a>
   47a9e:	4502                	lw	a0,0(sp)
   47aa0:	c2cc                	sw	a1,4(a3)
   47aa2:	630010ef          	jal	490d2 <_Balloc>
   47aa6:	842a                	mv	s0,a0
   47aa8:	e131                	bnez	a0,47aec <_dtoa_r+0x310>
   47aaa:	0004b6b7          	lui	a3,0x4b
   47aae:	e2868693          	add	a3,a3,-472 # 4ae28 <__clz_tab+0x374>
   47ab2:	4601                	li	a2,0
   47ab4:	1aa00593          	li	a1,426
   47ab8:	bb8d                	j	4782a <_dtoa_r+0x4e>
   47aba:	ca02                	sw	zero,20(sp)
   47abc:	b7e1                	j	47a84 <_dtoa_r+0x2a8>
   47abe:	4785                	li	a5,1
   47ac0:	ca3e                	sw	a5,20(sp)
   47ac2:	47e2                	lw	a5,24(sp)
   47ac4:	97e2                	add	a5,a5,s8
   47ac6:	00178d93          	add	s11,a5,1 # fe100001 <__share_mem_end__+0xfce00001>
   47aca:	c43e                	sw	a5,8(sp)
   47acc:	4785                	li	a5,1
   47ace:	0afde7b3          	max	a5,s11,a5
   47ad2:	bf75                	j	47a8e <_dtoa_r+0x2b2>
   47ad4:	4905                	li	s2,1
   47ad6:	c802                	sw	zero,16(sp)
   47ad8:	b7a9                	j	47a22 <_dtoa_r+0x246>
   47ada:	4785                	li	a5,1
   47adc:	4705                	li	a4,1
   47ade:	c43e                	sw	a5,8(sp)
   47ae0:	4d85                	li	s11,1
   47ae2:	cc3a                	sw	a4,24(sp)
   47ae4:	b76d                	j	47a8e <_dtoa_r+0x2b2>
   47ae6:	0585                	add	a1,a1,1
   47ae8:	0706                	sll	a4,a4,0x1
   47aea:	b775                	j	47a96 <_dtoa_r+0x2ba>
   47aec:	4782                	lw	a5,0(sp)
   47aee:	53dc                	lw	a5,36(a5)
   47af0:	c388                	sw	a0,0(a5)
   47af2:	47b9                	li	a5,14
   47af4:	13b7e063          	bltu	a5,s11,47c14 <_dtoa_r+0x438>
   47af8:	10090e63          	beqz	s2,47c14 <_dtoa_r+0x438>
   47afc:	1d805063          	blez	s8,47cbc <_dtoa_r+0x4e0>
   47b00:	0004b737          	lui	a4,0x4b
   47b04:	404c5993          	sra	s3,s8,0x4
   47b08:	31870713          	add	a4,a4,792 # 4b318 <__mprec_tens>
   47b0c:	00fc7793          	and	a5,s8,15
   47b10:	0004b937          	lui	s2,0x4b
   47b14:	0109f693          	and	a3,s3,16
   47b18:	20e7e7b3          	sh3add	a5,a5,a4
   47b1c:	2f090913          	add	s2,s2,752 # 4b2f0 <__mprec_bigtens>
   47b20:	4398                	lw	a4,0(a5)
   47b22:	43c4                	lw	s1,4(a5)
   47b24:	4a89                	li	s5,2
   47b26:	c285                	beqz	a3,47b46 <_dtoa_r+0x36a>
   47b28:	02092603          	lw	a2,32(s2)
   47b2c:	02492683          	lw	a3,36(s2)
   47b30:	5532                	lw	a0,44(sp)
   47b32:	5592                	lw	a1,36(sp)
   47b34:	da3a                	sw	a4,52(sp)
   47b36:	00f9f993          	and	s3,s3,15
   47b3a:	87afa0ef          	jal	41bb4 <__divdf3>
   47b3e:	5752                	lw	a4,52(sp)
   47b40:	8a2a                	mv	s4,a0
   47b42:	8b2e                	mv	s6,a1
   47b44:	4a8d                	li	s5,3
   47b46:	14099963          	bnez	s3,47c98 <_dtoa_r+0x4bc>
   47b4a:	8552                	mv	a0,s4
   47b4c:	863a                	mv	a2,a4
   47b4e:	86a6                	mv	a3,s1
   47b50:	85da                	mv	a1,s6
   47b52:	862fa0ef          	jal	41bb4 <__divdf3>
   47b56:	8a2a                	mv	s4,a0
   47b58:	8b2e                	mv	s6,a1
   47b5a:	57a2                	lw	a5,40(sp)
   47b5c:	1c078163          	beqz	a5,47d1e <_dtoa_r+0x542>
   47b60:	0004b7b7          	lui	a5,0x4b
   47b64:	4007a603          	lw	a2,1024(a5) # 4b400 <_global_impure_ptr+0x18>
   47b68:	4047a683          	lw	a3,1028(a5)
   47b6c:	8552                	mv	a0,s4
   47b6e:	85da                	mv	a1,s6
   47b70:	de8fa0ef          	jal	42158 <__ledf2>
   47b74:	1a055563          	bgez	a0,47d1e <_dtoa_r+0x542>
   47b78:	1a0d8663          	beqz	s11,47d24 <_dtoa_r+0x548>
   47b7c:	47a2                	lw	a5,8(sp)
   47b7e:	08f05963          	blez	a5,47c10 <_dtoa_r+0x434>
   47b82:	0004b7b7          	lui	a5,0x4b
   47b86:	4587a603          	lw	a2,1112(a5) # 4b458 <_global_impure_ptr+0x70>
   47b8a:	45c7a683          	lw	a3,1116(a5)
   47b8e:	8552                	mv	a0,s4
   47b90:	85da                	mv	a1,s6
   47b92:	e60fa0ef          	jal	421f2 <__muldf3>
   47b96:	4822                	lw	a6,8(sp)
   47b98:	fffc0493          	add	s1,s8,-1
   47b9c:	8a2a                	mv	s4,a0
   47b9e:	8b2e                	mv	s6,a1
   47ba0:	0a85                	add	s5,s5,1
   47ba2:	8556                	mv	a0,s5
   47ba4:	c0c2                	sw	a6,64(sp)
   47ba6:	dc52                	sw	s4,56(sp)
   47ba8:	da5a                	sw	s6,52(sp)
   47baa:	bd2fb0ef          	jal	42f7c <__floatsidf>
   47bae:	8652                	mv	a2,s4
   47bb0:	86da                	mv	a3,s6
   47bb2:	e40fa0ef          	jal	421f2 <__muldf3>
   47bb6:	0004b6b7          	lui	a3,0x4b
   47bba:	4606a603          	lw	a2,1120(a3) # 4b460 <_global_impure_ptr+0x78>
   47bbe:	4646a683          	lw	a3,1124(a3)
   47bc2:	89d2                	mv	s3,s4
   47bc4:	fcc00a37          	lui	s4,0xfcc00
   47bc8:	a11f90ef          	jal	415d8 <__adddf3>
   47bcc:	4806                	lw	a6,64(sp)
   47bce:	895a                	mv	s2,s6
   47bd0:	8aaa                	mv	s5,a0
   47bd2:	9a2e                	add	s4,s4,a1
   47bd4:	14081b63          	bnez	a6,47d2a <_dtoa_r+0x54e>
   47bd8:	0004b6b7          	lui	a3,0x4b
   47bdc:	4686a603          	lw	a2,1128(a3) # 4b468 <_global_impure_ptr+0x80>
   47be0:	46c6a683          	lw	a3,1132(a3)
   47be4:	854e                	mv	a0,s3
   47be6:	85da                	mv	a1,s6
   47be8:	a51fa0ef          	jal	42638 <__subdf3>
   47bec:	8656                	mv	a2,s5
   47bee:	86d2                	mv	a3,s4
   47bf0:	89aa                	mv	s3,a0
   47bf2:	892e                	mv	s2,a1
   47bf4:	ccafa0ef          	jal	420be <__gedf2>
   47bf8:	58a04f63          	bgtz	a0,48196 <_dtoa_r+0x9ba>
   47bfc:	69fa1a13          	binv	s4,s4,0x1f
   47c00:	8656                	mv	a2,s5
   47c02:	86d2                	mv	a3,s4
   47c04:	854e                	mv	a0,s3
   47c06:	85ca                	mv	a1,s2
   47c08:	d50fa0ef          	jal	42158 <__ledf2>
   47c0c:	04054c63          	bltz	a0,47c64 <_dtoa_r+0x488>
   47c10:	5a32                	lw	s4,44(sp)
   47c12:	5b12                	lw	s6,36(sp)
   47c14:	47f6                	lw	a5,92(sp)
   47c16:	3807c563          	bltz	a5,47fa0 <_dtoa_r+0x7c4>
   47c1a:	4739                	li	a4,14
   47c1c:	39874263          	blt	a4,s8,47fa0 <_dtoa_r+0x7c4>
   47c20:	0004b7b7          	lui	a5,0x4b
   47c24:	31878793          	add	a5,a5,792 # 4b318 <__mprec_tens>
   47c28:	20fc67b3          	sh3add	a5,s8,a5
   47c2c:	0047a803          	lw	a6,4(a5)
   47c30:	439c                	lw	a5,0(a5)
   47c32:	c642                	sw	a6,12(sp)
   47c34:	c43e                	sw	a5,8(sp)
   47c36:	47e2                	lw	a5,24(sp)
   47c38:	2807d263          	bgez	a5,47ebc <_dtoa_r+0x6e0>
   47c3c:	29b04063          	bgtz	s11,47ebc <_dtoa_r+0x6e0>
   47c40:	020d9263          	bnez	s11,47c64 <_dtoa_r+0x488>
   47c44:	0004b7b7          	lui	a5,0x4b
   47c48:	4687a603          	lw	a2,1128(a5) # 4b468 <_global_impure_ptr+0x80>
   47c4c:	46c7a683          	lw	a3,1132(a5)
   47c50:	4522                	lw	a0,8(sp)
   47c52:	45b2                	lw	a1,12(sp)
   47c54:	d9efa0ef          	jal	421f2 <__muldf3>
   47c58:	8652                	mv	a2,s4
   47c5a:	86da                	mv	a3,s6
   47c5c:	c62fa0ef          	jal	420be <__gedf2>
   47c60:	52054a63          	bltz	a0,48194 <_dtoa_r+0x9b8>
   47c64:	4a81                	li	s5,0
   47c66:	4901                	li	s2,0
   47c68:	47e2                	lw	a5,24(sp)
   47c6a:	8a22                	mv	s4,s0
   47c6c:	fff7c493          	not	s1,a5
   47c70:	4b01                	li	s6,0
   47c72:	4502                	lw	a0,0(sp)
   47c74:	85d6                	mv	a1,s5
   47c76:	506010ef          	jal	4917c <_Bfree>
   47c7a:	22090863          	beqz	s2,47eaa <_dtoa_r+0x6ce>
   47c7e:	000b0863          	beqz	s6,47c8e <_dtoa_r+0x4b2>
   47c82:	012b0663          	beq	s6,s2,47c8e <_dtoa_r+0x4b2>
   47c86:	4502                	lw	a0,0(sp)
   47c88:	85da                	mv	a1,s6
   47c8a:	4f2010ef          	jal	4917c <_Bfree>
   47c8e:	4502                	lw	a0,0(sp)
   47c90:	85ca                	mv	a1,s2
   47c92:	4ea010ef          	jal	4917c <_Bfree>
   47c96:	ac11                	j	47eaa <_dtoa_r+0x6ce>
   47c98:	0019f693          	and	a3,s3,1
   47c9c:	ce81                	beqz	a3,47cb4 <_dtoa_r+0x4d8>
   47c9e:	00092603          	lw	a2,0(s2)
   47ca2:	00492683          	lw	a3,4(s2)
   47ca6:	853a                	mv	a0,a4
   47ca8:	85a6                	mv	a1,s1
   47caa:	d48fa0ef          	jal	421f2 <__muldf3>
   47cae:	0a85                	add	s5,s5,1
   47cb0:	872a                	mv	a4,a0
   47cb2:	84ae                	mv	s1,a1
   47cb4:	4019d993          	sra	s3,s3,0x1
   47cb8:	0921                	add	s2,s2,8
   47cba:	b571                	j	47b46 <_dtoa_r+0x36a>
   47cbc:	4a89                	li	s5,2
   47cbe:	e80c0ee3          	beqz	s8,47b5a <_dtoa_r+0x37e>
   47cc2:	41800933          	neg	s2,s8
   47cc6:	0004b737          	lui	a4,0x4b
   47cca:	00f97793          	and	a5,s2,15
   47cce:	31870713          	add	a4,a4,792 # 4b318 <__mprec_tens>
   47cd2:	20e7e7b3          	sh3add	a5,a5,a4
   47cd6:	5532                	lw	a0,44(sp)
   47cd8:	4390                	lw	a2,0(a5)
   47cda:	43d4                	lw	a3,4(a5)
   47cdc:	5592                	lw	a1,36(sp)
   47cde:	0004b9b7          	lui	s3,0x4b
   47ce2:	40495913          	sra	s2,s2,0x4
   47ce6:	d0cfa0ef          	jal	421f2 <__muldf3>
   47cea:	8a2a                	mv	s4,a0
   47cec:	8b2e                	mv	s6,a1
   47cee:	2f098993          	add	s3,s3,752 # 4b2f0 <__mprec_bigtens>
   47cf2:	4781                	li	a5,0
   47cf4:	00091663          	bnez	s2,47d00 <_dtoa_r+0x524>
   47cf8:	e60781e3          	beqz	a5,47b5a <_dtoa_r+0x37e>
   47cfc:	8a2a                	mv	s4,a0
   47cfe:	bda9                	j	47b58 <_dtoa_r+0x37c>
   47d00:	00197713          	and	a4,s2,1
   47d04:	cb09                	beqz	a4,47d16 <_dtoa_r+0x53a>
   47d06:	0009a603          	lw	a2,0(s3)
   47d0a:	0049a683          	lw	a3,4(s3)
   47d0e:	0a85                	add	s5,s5,1
   47d10:	ce2fa0ef          	jal	421f2 <__muldf3>
   47d14:	4785                	li	a5,1
   47d16:	40195913          	sra	s2,s2,0x1
   47d1a:	09a1                	add	s3,s3,8
   47d1c:	bfe1                	j	47cf4 <_dtoa_r+0x518>
   47d1e:	84e2                	mv	s1,s8
   47d20:	886e                	mv	a6,s11
   47d22:	b541                	j	47ba2 <_dtoa_r+0x3c6>
   47d24:	84e2                	mv	s1,s8
   47d26:	4801                	li	a6,0
   47d28:	bdad                	j	47ba2 <_dtoa_r+0x3c6>
   47d2a:	0004b7b7          	lui	a5,0x4b
   47d2e:	31878793          	add	a5,a5,792 # 4b318 <__mprec_tens>
   47d32:	20f867b3          	sh3add	a5,a6,a5
   47d36:	ff87a603          	lw	a2,-8(a5)
   47d3a:	ffc7a683          	lw	a3,-4(a5)
   47d3e:	010407b3          	add	a5,s0,a6
   47d42:	da3e                	sw	a5,52(sp)
   47d44:	47d2                	lw	a5,20(sp)
   47d46:	cfc5                	beqz	a5,47dfe <_dtoa_r+0x622>
   47d48:	0004b7b7          	lui	a5,0x4b
   47d4c:	3f87a503          	lw	a0,1016(a5) # 4b3f8 <_global_impure_ptr+0x10>
   47d50:	3fc7a583          	lw	a1,1020(a5)
   47d54:	dc52                	sw	s4,56(sp)
   47d56:	e5ff90ef          	jal	41bb4 <__divdf3>
   47d5a:	8656                	mv	a2,s5
   47d5c:	86d2                	mv	a3,s4
   47d5e:	8dbfa0ef          	jal	42638 <__subdf3>
   47d62:	0004b7b7          	lui	a5,0x4b
   47d66:	4047a803          	lw	a6,1028(a5) # 4b404 <_global_impure_ptr+0x1c>
   47d6a:	4007a783          	lw	a5,1024(a5)
   47d6e:	8aaa                	mv	s5,a0
   47d70:	c2c2                	sw	a6,68(sp)
   47d72:	c0be                	sw	a5,64(sp)
   47d74:	0004b7b7          	lui	a5,0x4b
   47d78:	45c7a803          	lw	a6,1116(a5) # 4b45c <_global_impure_ptr+0x74>
   47d7c:	4587a783          	lw	a5,1112(a5)
   47d80:	8b2e                	mv	s6,a1
   47d82:	8a22                	mv	s4,s0
   47d84:	dc3e                	sw	a5,56(sp)
   47d86:	de42                	sw	a6,60(sp)
   47d88:	85ca                	mv	a1,s2
   47d8a:	854e                	mv	a0,s3
   47d8c:	e9dfa0ef          	jal	42c28 <__fixdfsi>
   47d90:	c6aa                	sw	a0,76(sp)
   47d92:	9eafb0ef          	jal	42f7c <__floatsidf>
   47d96:	862a                	mv	a2,a0
   47d98:	86ae                	mv	a3,a1
   47d9a:	854e                	mv	a0,s3
   47d9c:	85ca                	mv	a1,s2
   47d9e:	89bfa0ef          	jal	42638 <__subdf3>
   47da2:	47b6                	lw	a5,76(sp)
   47da4:	0a05                	add	s4,s4,1 # fcc00001 <__share_mem_end__+0xfb900001>
   47da6:	8656                	mv	a2,s5
   47da8:	03078793          	add	a5,a5,48
   47dac:	fefa0fa3          	sb	a5,-1(s4)
   47db0:	86da                	mv	a3,s6
   47db2:	892a                	mv	s2,a0
   47db4:	89ae                	mv	s3,a1
   47db6:	ba2fa0ef          	jal	42158 <__ledf2>
   47dba:	0e054863          	bltz	a0,47eaa <_dtoa_r+0x6ce>
   47dbe:	4506                	lw	a0,64(sp)
   47dc0:	4596                	lw	a1,68(sp)
   47dc2:	864a                	mv	a2,s2
   47dc4:	86ce                	mv	a3,s3
   47dc6:	873fa0ef          	jal	42638 <__subdf3>
   47dca:	8656                	mv	a2,s5
   47dcc:	86da                	mv	a3,s6
   47dce:	b8afa0ef          	jal	42158 <__ledf2>
   47dd2:	18054463          	bltz	a0,47f5a <_dtoa_r+0x77e>
   47dd6:	57d2                	lw	a5,52(sp)
   47dd8:	e2fa0ce3          	beq	s4,a5,47c10 <_dtoa_r+0x434>
   47ddc:	5662                	lw	a2,56(sp)
   47dde:	56f2                	lw	a3,60(sp)
   47de0:	8556                	mv	a0,s5
   47de2:	85da                	mv	a1,s6
   47de4:	c0efa0ef          	jal	421f2 <__muldf3>
   47de8:	5662                	lw	a2,56(sp)
   47dea:	56f2                	lw	a3,60(sp)
   47dec:	8aaa                	mv	s5,a0
   47dee:	8b2e                	mv	s6,a1
   47df0:	854a                	mv	a0,s2
   47df2:	85ce                	mv	a1,s3
   47df4:	bfefa0ef          	jal	421f2 <__muldf3>
   47df8:	89aa                	mv	s3,a0
   47dfa:	892e                	mv	s2,a1
   47dfc:	b771                	j	47d88 <_dtoa_r+0x5ac>
   47dfe:	85d2                	mv	a1,s4
   47e00:	bf2fa0ef          	jal	421f2 <__muldf3>
   47e04:	57d2                	lw	a5,52(sp)
   47e06:	8b2a                	mv	s6,a0
   47e08:	8aae                	mv	s5,a1
   47e0a:	dc3e                	sw	a5,56(sp)
   47e0c:	0004b7b7          	lui	a5,0x4b
   47e10:	45c7a803          	lw	a6,1116(a5) # 4b45c <_global_impure_ptr+0x74>
   47e14:	4587a783          	lw	a5,1112(a5)
   47e18:	8a22                	mv	s4,s0
   47e1a:	c2c2                	sw	a6,68(sp)
   47e1c:	c0be                	sw	a5,64(sp)
   47e1e:	85ca                	mv	a1,s2
   47e20:	854e                	mv	a0,s3
   47e22:	e07fa0ef          	jal	42c28 <__fixdfsi>
   47e26:	c6aa                	sw	a0,76(sp)
   47e28:	954fb0ef          	jal	42f7c <__floatsidf>
   47e2c:	862a                	mv	a2,a0
   47e2e:	86ae                	mv	a3,a1
   47e30:	854e                	mv	a0,s3
   47e32:	85ca                	mv	a1,s2
   47e34:	805fa0ef          	jal	42638 <__subdf3>
   47e38:	47b6                	lw	a5,76(sp)
   47e3a:	0a05                	add	s4,s4,1
   47e3c:	89aa                	mv	s3,a0
   47e3e:	03078793          	add	a5,a5,48
   47e42:	fefa0fa3          	sb	a5,-1(s4)
   47e46:	57d2                	lw	a5,52(sp)
   47e48:	892e                	mv	s2,a1
   47e4a:	06fa1263          	bne	s4,a5,47eae <_dtoa_r+0x6d2>
   47e4e:	0004b7b7          	lui	a5,0x4b
   47e52:	3f87a603          	lw	a2,1016(a5) # 4b3f8 <_global_impure_ptr+0x10>
   47e56:	3fc7a683          	lw	a3,1020(a5)
   47e5a:	855a                	mv	a0,s6
   47e5c:	85d6                	mv	a1,s5
   47e5e:	f7af90ef          	jal	415d8 <__adddf3>
   47e62:	862a                	mv	a2,a0
   47e64:	86ae                	mv	a3,a1
   47e66:	854e                	mv	a0,s3
   47e68:	85ca                	mv	a1,s2
   47e6a:	a54fa0ef          	jal	420be <__gedf2>
   47e6e:	0ea04663          	bgtz	a0,47f5a <_dtoa_r+0x77e>
   47e72:	0004b7b7          	lui	a5,0x4b
   47e76:	3f87a503          	lw	a0,1016(a5) # 4b3f8 <_global_impure_ptr+0x10>
   47e7a:	3fc7a583          	lw	a1,1020(a5)
   47e7e:	865a                	mv	a2,s6
   47e80:	86d6                	mv	a3,s5
   47e82:	fb6fa0ef          	jal	42638 <__subdf3>
   47e86:	862a                	mv	a2,a0
   47e88:	86ae                	mv	a3,a1
   47e8a:	854e                	mv	a0,s3
   47e8c:	85ca                	mv	a1,s2
   47e8e:	acafa0ef          	jal	42158 <__ledf2>
   47e92:	d6055fe3          	bgez	a0,47c10 <_dtoa_r+0x434>
   47e96:	03000793          	li	a5,48
   47e9a:	5a62                	lw	s4,56(sp)
   47e9c:	fffa0713          	add	a4,s4,-1
   47ea0:	dc3a                	sw	a4,56(sp)
   47ea2:	fffa4703          	lbu	a4,-1(s4)
   47ea6:	fef70ae3          	beq	a4,a5,47e9a <_dtoa_r+0x6be>
   47eaa:	8c26                	mv	s8,s1
   47eac:	a071                	j	47f38 <_dtoa_r+0x75c>
   47eae:	4606                	lw	a2,64(sp)
   47eb0:	4696                	lw	a3,68(sp)
   47eb2:	b40fa0ef          	jal	421f2 <__muldf3>
   47eb6:	89aa                	mv	s3,a0
   47eb8:	892e                	mv	s2,a1
   47eba:	b795                	j	47e1e <_dtoa_r+0x642>
   47ebc:	0004b6b7          	lui	a3,0x4b
   47ec0:	84da                	mv	s1,s6
   47ec2:	45c6ab83          	lw	s7,1116(a3) # 4b45c <_global_impure_ptr+0x74>
   47ec6:	4586ab03          	lw	s6,1112(a3)
   47eca:	8952                	mv	s2,s4
   47ecc:	00140c93          	add	s9,s0,1
   47ed0:	9da2                	add	s11,s11,s0
   47ed2:	4622                	lw	a2,8(sp)
   47ed4:	46b2                	lw	a3,12(sp)
   47ed6:	854a                	mv	a0,s2
   47ed8:	85a6                	mv	a1,s1
   47eda:	cdbf90ef          	jal	41bb4 <__divdf3>
   47ede:	d4bfa0ef          	jal	42c28 <__fixdfsi>
   47ee2:	8aaa                	mv	s5,a0
   47ee4:	898fb0ef          	jal	42f7c <__floatsidf>
   47ee8:	4622                	lw	a2,8(sp)
   47eea:	46b2                	lw	a3,12(sp)
   47eec:	8a66                	mv	s4,s9
   47eee:	b04fa0ef          	jal	421f2 <__muldf3>
   47ef2:	86ae                	mv	a3,a1
   47ef4:	862a                	mv	a2,a0
   47ef6:	85a6                	mv	a1,s1
   47ef8:	854a                	mv	a0,s2
   47efa:	f3efa0ef          	jal	42638 <__subdf3>
   47efe:	030a8693          	add	a3,s5,48
   47f02:	fedc8fa3          	sb	a3,-1(s9)
   47f06:	099d9063          	bne	s11,s9,47f86 <_dtoa_r+0x7aa>
   47f0a:	862a                	mv	a2,a0
   47f0c:	86ae                	mv	a3,a1
   47f0e:	ecaf90ef          	jal	415d8 <__adddf3>
   47f12:	4622                	lw	a2,8(sp)
   47f14:	46b2                	lw	a3,12(sp)
   47f16:	8baa                	mv	s7,a0
   47f18:	8b2e                	mv	s6,a1
   47f1a:	9a4fa0ef          	jal	420be <__gedf2>
   47f1e:	02a04d63          	bgtz	a0,47f58 <_dtoa_r+0x77c>
   47f22:	4622                	lw	a2,8(sp)
   47f24:	46b2                	lw	a3,12(sp)
   47f26:	855e                	mv	a0,s7
   47f28:	85da                	mv	a1,s6
   47f2a:	fb1fa0ef          	jal	42eda <__eqdf2>
   47f2e:	e509                	bnez	a0,47f38 <_dtoa_r+0x75c>
   47f30:	001afa93          	and	s5,s5,1
   47f34:	020a9263          	bnez	s5,47f58 <_dtoa_r+0x77c>
   47f38:	4592                	lw	a1,4(sp)
   47f3a:	4502                	lw	a0,0(sp)
   47f3c:	0c05                	add	s8,s8,1
   47f3e:	23e010ef          	jal	4917c <_Bfree>
   47f42:	57c2                	lw	a5,48(sp)
   47f44:	000a0023          	sb	zero,0(s4)
   47f48:	0187a023          	sw	s8,0(a5)
   47f4c:	47f2                	lw	a5,28(sp)
   47f4e:	44078363          	beqz	a5,48394 <_dtoa_r+0xbb8>
   47f52:	0147a023          	sw	s4,0(a5)
   47f56:	a93d                	j	48394 <_dtoa_r+0xbb8>
   47f58:	84e2                	mv	s1,s8
   47f5a:	87d2                	mv	a5,s4
   47f5c:	03900713          	li	a4,57
   47f60:	8a3e                	mv	s4,a5
   47f62:	fff7c683          	lbu	a3,-1(a5)
   47f66:	17fd                	add	a5,a5,-1
   47f68:	00e69963          	bne	a3,a4,47f7a <_dtoa_r+0x79e>
   47f6c:	fef41ae3          	bne	s0,a5,47f60 <_dtoa_r+0x784>
   47f70:	03000713          	li	a4,48
   47f74:	0485                	add	s1,s1,1
   47f76:	00e40023          	sb	a4,0(s0)
   47f7a:	0007c703          	lbu	a4,0(a5)
   47f7e:	0705                	add	a4,a4,1
   47f80:	00e78023          	sb	a4,0(a5)
   47f84:	b71d                	j	47eaa <_dtoa_r+0x6ce>
   47f86:	865a                	mv	a2,s6
   47f88:	86de                	mv	a3,s7
   47f8a:	a68fa0ef          	jal	421f2 <__muldf3>
   47f8e:	4601                	li	a2,0
   47f90:	4681                	li	a3,0
   47f92:	892a                	mv	s2,a0
   47f94:	84ae                	mv	s1,a1
   47f96:	0c85                	add	s9,s9,1
   47f98:	f43fa0ef          	jal	42eda <__eqdf2>
   47f9c:	f91d                	bnez	a0,47ed2 <_dtoa_r+0x6f6>
   47f9e:	bf69                	j	47f38 <_dtoa_r+0x75c>
   47fa0:	4752                	lw	a4,20(sp)
   47fa2:	18070d63          	beqz	a4,4813c <_dtoa_r+0x960>
   47fa6:	46c2                	lw	a3,16(sp)
   47fa8:	4705                	li	a4,1
   47faa:	16d74063          	blt	a4,a3,4810a <_dtoa_r+0x92e>
   47fae:	4726                	lw	a4,72(sp)
   47fb0:	43378793          	add	a5,a5,1075
   47fb4:	e709                	bnez	a4,47fbe <_dtoa_r+0x7e2>
   47fb6:	4766                	lw	a4,88(sp)
   47fb8:	03600793          	li	a5,54
   47fbc:	8f99                	sub	a5,a5,a4
   47fbe:	8ae6                	mv	s5,s9
   47fc0:	89de                	mv	s3,s7
   47fc2:	4502                	lw	a0,0(sp)
   47fc4:	4585                	li	a1,1
   47fc6:	9bbe                	add	s7,s7,a5
   47fc8:	9d3e                	add	s10,s10,a5
   47fca:	43c010ef          	jal	49406 <__i2b>
   47fce:	892a                	mv	s2,a0
   47fd0:	00098c63          	beqz	s3,47fe8 <_dtoa_r+0x80c>
   47fd4:	01a05a63          	blez	s10,47fe8 <_dtoa_r+0x80c>
   47fd8:	0ba9c7b3          	min	a5,s3,s10
   47fdc:	40fb8bb3          	sub	s7,s7,a5
   47fe0:	40f989b3          	sub	s3,s3,a5
   47fe4:	40fd0d33          	sub	s10,s10,a5
   47fe8:	040c8163          	beqz	s9,4802a <_dtoa_r+0x84e>
   47fec:	47d2                	lw	a5,20(sp)
   47fee:	14078b63          	beqz	a5,48144 <_dtoa_r+0x968>
   47ff2:	020a8363          	beqz	s5,48018 <_dtoa_r+0x83c>
   47ff6:	4502                	lw	a0,0(sp)
   47ff8:	85ca                	mv	a1,s2
   47ffa:	8656                	mv	a2,s5
   47ffc:	5ba010ef          	jal	495b6 <__pow5mult>
   48000:	85aa                	mv	a1,a0
   48002:	4612                	lw	a2,4(sp)
   48004:	892a                	mv	s2,a0
   48006:	4502                	lw	a0,0(sp)
   48008:	436010ef          	jal	4943e <__multiply>
   4800c:	84aa                	mv	s1,a0
   4800e:	4592                	lw	a1,4(sp)
   48010:	4502                	lw	a0,0(sp)
   48012:	16a010ef          	jal	4917c <_Bfree>
   48016:	c226                	sw	s1,4(sp)
   48018:	415c8633          	sub	a2,s9,s5
   4801c:	015c8763          	beq	s9,s5,4802a <_dtoa_r+0x84e>
   48020:	4592                	lw	a1,4(sp)
   48022:	4502                	lw	a0,0(sp)
   48024:	592010ef          	jal	495b6 <__pow5mult>
   48028:	c22a                	sw	a0,4(sp)
   4802a:	4502                	lw	a0,0(sp)
   4802c:	4585                	li	a1,1
   4802e:	3d8010ef          	jal	49406 <__i2b>
   48032:	5782                	lw	a5,32(sp)
   48034:	8aaa                	mv	s5,a0
   48036:	36078f63          	beqz	a5,483b4 <_dtoa_r+0xbd8>
   4803a:	85aa                	mv	a1,a0
   4803c:	4502                	lw	a0,0(sp)
   4803e:	863e                	mv	a2,a5
   48040:	4c81                	li	s9,0
   48042:	574010ef          	jal	495b6 <__pow5mult>
   48046:	4742                	lw	a4,16(sp)
   48048:	4785                	li	a5,1
   4804a:	8aaa                	mv	s5,a0
   4804c:	02e7c363          	blt	a5,a4,48072 <_dtoa_r+0x896>
   48050:	4c81                	li	s9,0
   48052:	000a1d63          	bnez	s4,4806c <_dtoa_r+0x890>
   48056:	00cb1793          	sll	a5,s6,0xc
   4805a:	eb89                	bnez	a5,4806c <_dtoa_r+0x890>
   4805c:	014b5793          	srl	a5,s6,0x14
   48060:	7ff7f793          	and	a5,a5,2047
   48064:	c781                	beqz	a5,4806c <_dtoa_r+0x890>
   48066:	0b85                	add	s7,s7,1
   48068:	0d05                	add	s10,s10,1
   4806a:	4c85                	li	s9,1
   4806c:	5782                	lw	a5,32(sp)
   4806e:	4505                	li	a0,1
   48070:	cf81                	beqz	a5,48088 <_dtoa_r+0x8ac>
   48072:	010aa783          	lw	a5,16(s5)
   48076:	2157c7b3          	sh2add	a5,a5,s5
   4807a:	4b88                	lw	a0,16(a5)
   4807c:	2dc010ef          	jal	49358 <__hi0bits>
   48080:	02000793          	li	a5,32
   48084:	40a78533          	sub	a0,a5,a0
   48088:	956a                	add	a0,a0,s10
   4808a:	897d                	and	a0,a0,31
   4808c:	c171                	beqz	a0,48150 <_dtoa_r+0x974>
   4808e:	02000793          	li	a5,32
   48092:	8f89                	sub	a5,a5,a0
   48094:	4711                	li	a4,4
   48096:	0af75963          	bge	a4,a5,48148 <_dtoa_r+0x96c>
   4809a:	47f1                	li	a5,28
   4809c:	8f89                	sub	a5,a5,a0
   4809e:	9bbe                	add	s7,s7,a5
   480a0:	99be                	add	s3,s3,a5
   480a2:	9d3e                	add	s10,s10,a5
   480a4:	01705863          	blez	s7,480b4 <_dtoa_r+0x8d8>
   480a8:	4592                	lw	a1,4(sp)
   480aa:	4502                	lw	a0,0(sp)
   480ac:	865e                	mv	a2,s7
   480ae:	5e2010ef          	jal	49690 <__lshift>
   480b2:	c22a                	sw	a0,4(sp)
   480b4:	01a05863          	blez	s10,480c4 <_dtoa_r+0x8e8>
   480b8:	4502                	lw	a0,0(sp)
   480ba:	85d6                	mv	a1,s5
   480bc:	866a                	mv	a2,s10
   480be:	5d2010ef          	jal	49690 <__lshift>
   480c2:	8aaa                	mv	s5,a0
   480c4:	57a2                	lw	a5,40(sp)
   480c6:	c7d9                	beqz	a5,48154 <_dtoa_r+0x978>
   480c8:	4512                	lw	a0,4(sp)
   480ca:	85d6                	mv	a1,s5
   480cc:	6c6010ef          	jal	49792 <__mcmp>
   480d0:	08055263          	bgez	a0,48154 <_dtoa_r+0x978>
   480d4:	4592                	lw	a1,4(sp)
   480d6:	4502                	lw	a0,0(sp)
   480d8:	4681                	li	a3,0
   480da:	4629                	li	a2,10
   480dc:	100010ef          	jal	491dc <__multadd>
   480e0:	47d2                	lw	a5,20(sp)
   480e2:	c22a                	sw	a0,4(sp)
   480e4:	fffc0493          	add	s1,s8,-1
   480e8:	2c078d63          	beqz	a5,483c2 <_dtoa_r+0xbe6>
   480ec:	4502                	lw	a0,0(sp)
   480ee:	85ca                	mv	a1,s2
   480f0:	4681                	li	a3,0
   480f2:	4629                	li	a2,10
   480f4:	0e8010ef          	jal	491dc <__multadd>
   480f8:	47a2                	lw	a5,8(sp)
   480fa:	892a                	mv	s2,a0
   480fc:	0af04363          	bgtz	a5,481a2 <_dtoa_r+0x9c6>
   48100:	4742                	lw	a4,16(sp)
   48102:	4789                	li	a5,2
   48104:	06e7c063          	blt	a5,a4,48164 <_dtoa_r+0x988>
   48108:	a869                	j	481a2 <_dtoa_r+0x9c6>
   4810a:	fffd8a93          	add	s5,s11,-1 # 3fefffff <__share_mem_end__+0x3ebfffff>
   4810e:	015cc963          	blt	s9,s5,48120 <_dtoa_r+0x944>
   48112:	415c8ab3          	sub	s5,s9,s5
   48116:	000dcf63          	bltz	s11,48134 <_dtoa_r+0x958>
   4811a:	89de                	mv	s3,s7
   4811c:	87ee                	mv	a5,s11
   4811e:	b555                	j	47fc2 <_dtoa_r+0x7e6>
   48120:	5702                	lw	a4,32(sp)
   48122:	419a87b3          	sub	a5,s5,s9
   48126:	89de                	mv	s3,s7
   48128:	97ba                	add	a5,a5,a4
   4812a:	d03e                	sw	a5,32(sp)
   4812c:	8cd6                	mv	s9,s5
   4812e:	87ee                	mv	a5,s11
   48130:	4a81                	li	s5,0
   48132:	bd41                	j	47fc2 <_dtoa_r+0x7e6>
   48134:	41bb89b3          	sub	s3,s7,s11
   48138:	4781                	li	a5,0
   4813a:	b561                	j	47fc2 <_dtoa_r+0x7e6>
   4813c:	8ae6                	mv	s5,s9
   4813e:	89de                	mv	s3,s7
   48140:	4901                	li	s2,0
   48142:	b579                	j	47fd0 <_dtoa_r+0x7f4>
   48144:	8666                	mv	a2,s9
   48146:	bde9                	j	48020 <_dtoa_r+0x844>
   48148:	f4e78ee3          	beq	a5,a4,480a4 <_dtoa_r+0x8c8>
   4814c:	07f1                	add	a5,a5,28
   4814e:	bf81                	j	4809e <_dtoa_r+0x8c2>
   48150:	4781                	li	a5,0
   48152:	bfed                	j	4814c <_dtoa_r+0x970>
   48154:	c46e                	sw	s11,8(sp)
   48156:	84e2                	mv	s1,s8
   48158:	05b04263          	bgtz	s11,4819c <_dtoa_r+0x9c0>
   4815c:	4742                	lw	a4,16(sp)
   4815e:	4789                	li	a5,2
   48160:	02e7de63          	bge	a5,a4,4819c <_dtoa_r+0x9c0>
   48164:	47a2                	lw	a5,8(sp)
   48166:	b00791e3          	bnez	a5,47c68 <_dtoa_r+0x48c>
   4816a:	4502                	lw	a0,0(sp)
   4816c:	85d6                	mv	a1,s5
   4816e:	4681                	li	a3,0
   48170:	4615                	li	a2,5
   48172:	06a010ef          	jal	491dc <__multadd>
   48176:	8aaa                	mv	s5,a0
   48178:	85aa                	mv	a1,a0
   4817a:	4512                	lw	a0,4(sp)
   4817c:	616010ef          	jal	49792 <__mcmp>
   48180:	aea054e3          	blez	a0,47c68 <_dtoa_r+0x48c>
   48184:	03100793          	li	a5,49
   48188:	00140a13          	add	s4,s0,1
   4818c:	00f40023          	sb	a5,0(s0)
   48190:	0485                	add	s1,s1,1
   48192:	bcf9                	j	47c70 <_dtoa_r+0x494>
   48194:	84e2                	mv	s1,s8
   48196:	4a81                	li	s5,0
   48198:	4901                	li	s2,0
   4819a:	b7ed                	j	48184 <_dtoa_r+0x9a8>
   4819c:	47d2                	lw	a5,20(sp)
   4819e:	22078563          	beqz	a5,483c8 <_dtoa_r+0xbec>
   481a2:	01305863          	blez	s3,481b2 <_dtoa_r+0x9d6>
   481a6:	4502                	lw	a0,0(sp)
   481a8:	85ca                	mv	a1,s2
   481aa:	864e                	mv	a2,s3
   481ac:	4e4010ef          	jal	49690 <__lshift>
   481b0:	892a                	mv	s2,a0
   481b2:	854a                	mv	a0,s2
   481b4:	040c8063          	beqz	s9,481f4 <_dtoa_r+0xa18>
   481b8:	00492583          	lw	a1,4(s2)
   481bc:	4502                	lw	a0,0(sp)
   481be:	715000ef          	jal	490d2 <_Balloc>
   481c2:	89aa                	mv	s3,a0
   481c4:	e911                	bnez	a0,481d8 <_dtoa_r+0x9fc>
   481c6:	0004b6b7          	lui	a3,0x4b
   481ca:	e2868693          	add	a3,a3,-472 # 4ae28 <__clz_tab+0x374>
   481ce:	4601                	li	a2,0
   481d0:	2ea00593          	li	a1,746
   481d4:	e56ff06f          	j	4782a <_dtoa_r+0x4e>
   481d8:	01092603          	lw	a2,16(s2)
   481dc:	00c90593          	add	a1,s2,12
   481e0:	0531                	add	a0,a0,12
   481e2:	0609                	add	a2,a2,2
   481e4:	060a                	sll	a2,a2,0x2
   481e6:	ca9fa0ef          	jal	42e8e <memcpy>
   481ea:	4502                	lw	a0,0(sp)
   481ec:	4605                	li	a2,1
   481ee:	85ce                	mv	a1,s3
   481f0:	4a0010ef          	jal	49690 <__lshift>
   481f4:	47a2                	lw	a5,8(sp)
   481f6:	8b4a                	mv	s6,s2
   481f8:	00140c13          	add	s8,s0,1
   481fc:	97a2                	add	a5,a5,s0
   481fe:	c43e                	sw	a5,8(sp)
   48200:	892a                	mv	s2,a0
   48202:	001a7993          	and	s3,s4,1
   48206:	4512                	lw	a0,4(sp)
   48208:	85d6                	mv	a1,s5
   4820a:	fffc0d13          	add	s10,s8,-1
   4820e:	ca2ff0ef          	jal	476b0 <quorem>
   48212:	8caa                	mv	s9,a0
   48214:	03050d93          	add	s11,a0,48
   48218:	4512                	lw	a0,4(sp)
   4821a:	85da                	mv	a1,s6
   4821c:	576010ef          	jal	49792 <__mcmp>
   48220:	8baa                	mv	s7,a0
   48222:	4502                	lw	a0,0(sp)
   48224:	85d6                	mv	a1,s5
   48226:	864a                	mv	a2,s2
   48228:	5a0010ef          	jal	497c8 <__mdiff>
   4822c:	4554                	lw	a3,12(a0)
   4822e:	85aa                	mv	a1,a0
   48230:	4705                	li	a4,1
   48232:	e699                	bnez	a3,48240 <_dtoa_r+0xa64>
   48234:	ca2a                	sw	a0,20(sp)
   48236:	4512                	lw	a0,4(sp)
   48238:	55a010ef          	jal	49792 <__mcmp>
   4823c:	45d2                	lw	a1,20(sp)
   4823e:	872a                	mv	a4,a0
   48240:	4502                	lw	a0,0(sp)
   48242:	ca3a                	sw	a4,20(sp)
   48244:	8a62                	mv	s4,s8
   48246:	737000ef          	jal	4917c <_Bfree>
   4824a:	47c2                	lw	a5,16(sp)
   4824c:	4752                	lw	a4,20(sp)
   4824e:	00f766b3          	or	a3,a4,a5
   48252:	0136e6b3          	or	a3,a3,s3
   48256:	ee81                	bnez	a3,4826e <_dtoa_r+0xa92>
   48258:	03900713          	li	a4,57
   4825c:	04ed8763          	beq	s11,a4,482aa <_dtoa_r+0xace>
   48260:	01705463          	blez	s7,48268 <_dtoa_r+0xa8c>
   48264:	031c8d93          	add	s11,s9,49
   48268:	01bd0023          	sb	s11,0(s10)
   4826c:	b419                	j	47c72 <_dtoa_r+0x496>
   4826e:	000bc963          	bltz	s7,48280 <_dtoa_r+0xaa4>
   48272:	47c2                	lw	a5,16(sp)
   48274:	0177ebb3          	or	s7,a5,s7
   48278:	013bebb3          	or	s7,s7,s3
   4827c:	040b9863          	bnez	s7,482cc <_dtoa_r+0xaf0>
   48280:	fee054e3          	blez	a4,48268 <_dtoa_r+0xa8c>
   48284:	4592                	lw	a1,4(sp)
   48286:	4502                	lw	a0,0(sp)
   48288:	4605                	li	a2,1
   4828a:	406010ef          	jal	49690 <__lshift>
   4828e:	85d6                	mv	a1,s5
   48290:	c22a                	sw	a0,4(sp)
   48292:	500010ef          	jal	49792 <__mcmp>
   48296:	00a04663          	bgtz	a0,482a2 <_dtoa_r+0xac6>
   4829a:	f579                	bnez	a0,48268 <_dtoa_r+0xa8c>
   4829c:	001df713          	and	a4,s11,1
   482a0:	d761                	beqz	a4,48268 <_dtoa_r+0xa8c>
   482a2:	03900713          	li	a4,57
   482a6:	faed9fe3          	bne	s11,a4,48264 <_dtoa_r+0xa88>
   482aa:	03900793          	li	a5,57
   482ae:	00fd0023          	sb	a5,0(s10)
   482b2:	87d2                	mv	a5,s4
   482b4:	03900693          	li	a3,57
   482b8:	8a3e                	mv	s4,a5
   482ba:	fffa4703          	lbu	a4,-1(s4)
   482be:	17fd                	add	a5,a5,-1
   482c0:	0ad70563          	beq	a4,a3,4836a <_dtoa_r+0xb8e>
   482c4:	0705                	add	a4,a4,1
   482c6:	00e78023          	sb	a4,0(a5)
   482ca:	b265                	j	47c72 <_dtoa_r+0x496>
   482cc:	00e05b63          	blez	a4,482e2 <_dtoa_r+0xb06>
   482d0:	03900713          	li	a4,57
   482d4:	fced8be3          	beq	s11,a4,482aa <_dtoa_r+0xace>
   482d8:	001d8793          	add	a5,s11,1
   482dc:	00fd0023          	sb	a5,0(s10)
   482e0:	ba49                	j	47c72 <_dtoa_r+0x496>
   482e2:	47a2                	lw	a5,8(sp)
   482e4:	ffbc0fa3          	sb	s11,-1(s8)
   482e8:	05878763          	beq	a5,s8,48336 <_dtoa_r+0xb5a>
   482ec:	4592                	lw	a1,4(sp)
   482ee:	4502                	lw	a0,0(sp)
   482f0:	4681                	li	a3,0
   482f2:	4629                	li	a2,10
   482f4:	6e9000ef          	jal	491dc <__multadd>
   482f8:	c22a                	sw	a0,4(sp)
   482fa:	4681                	li	a3,0
   482fc:	4502                	lw	a0,0(sp)
   482fe:	4629                	li	a2,10
   48300:	85da                	mv	a1,s6
   48302:	012b1863          	bne	s6,s2,48312 <_dtoa_r+0xb36>
   48306:	6d7000ef          	jal	491dc <__multadd>
   4830a:	8b2a                	mv	s6,a0
   4830c:	892a                	mv	s2,a0
   4830e:	0c05                	add	s8,s8,1
   48310:	bddd                	j	48206 <_dtoa_r+0xa2a>
   48312:	6cb000ef          	jal	491dc <__multadd>
   48316:	8b2a                	mv	s6,a0
   48318:	4502                	lw	a0,0(sp)
   4831a:	85ca                	mv	a1,s2
   4831c:	4681                	li	a3,0
   4831e:	4629                	li	a2,10
   48320:	6bd000ef          	jal	491dc <__multadd>
   48324:	892a                	mv	s2,a0
   48326:	b7e5                	j	4830e <_dtoa_r+0xb32>
   48328:	47a2                	lw	a5,8(sp)
   4832a:	4a05                	li	s4,1
   4832c:	00f05363          	blez	a5,48332 <_dtoa_r+0xb56>
   48330:	8a3e                	mv	s4,a5
   48332:	9a22                	add	s4,s4,s0
   48334:	4b01                	li	s6,0
   48336:	4592                	lw	a1,4(sp)
   48338:	4502                	lw	a0,0(sp)
   4833a:	4605                	li	a2,1
   4833c:	354010ef          	jal	49690 <__lshift>
   48340:	85d6                	mv	a1,s5
   48342:	c22a                	sw	a0,4(sp)
   48344:	44e010ef          	jal	49792 <__mcmp>
   48348:	f6a045e3          	bgtz	a0,482b2 <_dtoa_r+0xad6>
   4834c:	e501                	bnez	a0,48354 <_dtoa_r+0xb78>
   4834e:	001df793          	and	a5,s11,1
   48352:	f3a5                	bnez	a5,482b2 <_dtoa_r+0xad6>
   48354:	87d2                	mv	a5,s4
   48356:	03000713          	li	a4,48
   4835a:	8a3e                	mv	s4,a5
   4835c:	fff7c683          	lbu	a3,-1(a5)
   48360:	17fd                	add	a5,a5,-1
   48362:	fee68ce3          	beq	a3,a4,4835a <_dtoa_r+0xb7e>
   48366:	90dff06f          	j	47c72 <_dtoa_r+0x496>
   4836a:	f4f417e3          	bne	s0,a5,482b8 <_dtoa_r+0xadc>
   4836e:	03100793          	li	a5,49
   48372:	0485                	add	s1,s1,1
   48374:	00f40023          	sb	a5,0(s0)
   48378:	8fbff06f          	j	47c72 <_dtoa_r+0x496>
   4837c:	4772                	lw	a4,28(sp)
   4837e:	0004b7b7          	lui	a5,0x4b
   48382:	db478413          	add	s0,a5,-588 # 4adb4 <__clz_tab+0x300>
   48386:	c719                	beqz	a4,48394 <_dtoa_r+0xbb8>
   48388:	0004b7b7          	lui	a5,0x4b
   4838c:	dbc78793          	add	a5,a5,-580 # 4adbc <__clz_tab+0x308>
   48390:	4772                	lw	a4,28(sp)
   48392:	c31c                	sw	a5,0(a4)
   48394:	40fa                	lw	ra,156(sp)
   48396:	8522                	mv	a0,s0
   48398:	446a                	lw	s0,152(sp)
   4839a:	44da                	lw	s1,148(sp)
   4839c:	494a                	lw	s2,144(sp)
   4839e:	49ba                	lw	s3,140(sp)
   483a0:	4a2a                	lw	s4,136(sp)
   483a2:	4a9a                	lw	s5,132(sp)
   483a4:	4b0a                	lw	s6,128(sp)
   483a6:	5bf6                	lw	s7,124(sp)
   483a8:	5c66                	lw	s8,120(sp)
   483aa:	5cd6                	lw	s9,116(sp)
   483ac:	5d46                	lw	s10,112(sp)
   483ae:	5db6                	lw	s11,108(sp)
   483b0:	610d                	add	sp,sp,160
   483b2:	8082                	ret
   483b4:	4742                	lw	a4,16(sp)
   483b6:	4785                	li	a5,1
   483b8:	c8e7dce3          	bge	a5,a4,48050 <_dtoa_r+0x874>
   483bc:	4c81                	li	s9,0
   483be:	4505                	li	a0,1
   483c0:	b1e1                	j	48088 <_dtoa_r+0x8ac>
   483c2:	47a2                	lw	a5,8(sp)
   483c4:	d8f05ce3          	blez	a5,4815c <_dtoa_r+0x980>
   483c8:	4981                	li	s3,0
   483ca:	4512                	lw	a0,4(sp)
   483cc:	85d6                	mv	a1,s5
   483ce:	ae2ff0ef          	jal	476b0 <quorem>
   483d2:	47a2                	lw	a5,8(sp)
   483d4:	01340733          	add	a4,s0,s3
   483d8:	03050d93          	add	s11,a0,48
   483dc:	01b70023          	sb	s11,0(a4)
   483e0:	0985                	add	s3,s3,1
   483e2:	f4f9d3e3          	bge	s3,a5,48328 <_dtoa_r+0xb4c>
   483e6:	4592                	lw	a1,4(sp)
   483e8:	4502                	lw	a0,0(sp)
   483ea:	4681                	li	a3,0
   483ec:	4629                	li	a2,10
   483ee:	5ef000ef          	jal	491dc <__multadd>
   483f2:	c22a                	sw	a0,4(sp)
   483f4:	bfd9                	j	483ca <_dtoa_r+0xbee>

000483f6 <__sflush_r>:
   483f6:	00c59783          	lh	a5,12(a1)
   483fa:	1101                	add	sp,sp,-32
   483fc:	cc22                	sw	s0,24(sp)
   483fe:	ca26                	sw	s1,20(sp)
   48400:	ce06                	sw	ra,28(sp)
   48402:	c84a                	sw	s2,16(sp)
   48404:	c64e                	sw	s3,12(sp)
   48406:	0087f713          	and	a4,a5,8
   4840a:	84aa                	mv	s1,a0
   4840c:	842e                	mv	s0,a1
   4840e:	e771                	bnez	a4,484da <__sflush_r+0xe4>
   48410:	41d8                	lw	a4,4(a1)
   48412:	00e04563          	bgtz	a4,4841c <__sflush_r+0x26>
   48416:	41b8                	lw	a4,64(a1)
   48418:	0ae05a63          	blez	a4,484cc <__sflush_r+0xd6>
   4841c:	5458                	lw	a4,44(s0)
   4841e:	c75d                	beqz	a4,484cc <__sflush_r+0xd6>
   48420:	0004a903          	lw	s2,0(s1)
   48424:	01379693          	sll	a3,a5,0x13
   48428:	0004a023          	sw	zero,0(s1)
   4842c:	500c                	lw	a1,32(s0)
   4842e:	0606dd63          	bgez	a3,484a8 <__sflush_r+0xb2>
   48432:	4870                	lw	a2,84(s0)
   48434:	00c45783          	lhu	a5,12(s0)
   48438:	8b91                	and	a5,a5,4
   4843a:	c799                	beqz	a5,48448 <__sflush_r+0x52>
   4843c:	405c                	lw	a5,4(s0)
   4843e:	8e1d                	sub	a2,a2,a5
   48440:	585c                	lw	a5,52(s0)
   48442:	c399                	beqz	a5,48448 <__sflush_r+0x52>
   48444:	403c                	lw	a5,64(s0)
   48446:	8e1d                	sub	a2,a2,a5
   48448:	545c                	lw	a5,44(s0)
   4844a:	500c                	lw	a1,32(s0)
   4844c:	4681                	li	a3,0
   4844e:	8526                	mv	a0,s1
   48450:	9782                	jalr	a5
   48452:	577d                	li	a4,-1
   48454:	00c45783          	lhu	a5,12(s0)
   48458:	00e51c63          	bne	a0,a4,48470 <__sflush_r+0x7a>
   4845c:	4094                	lw	a3,0(s1)
   4845e:	4775                	li	a4,29
   48460:	06d76863          	bltu	a4,a3,484d0 <__sflush_r+0xda>
   48464:	20400737          	lui	a4,0x20400
   48468:	0705                	add	a4,a4,1 # 20400001 <__share_mem_end__+0x1f100001>
   4846a:	48d75733          	bext	a4,a4,a3
   4846e:	c32d                	beqz	a4,484d0 <__sflush_r+0xda>
   48470:	4818                	lw	a4,16(s0)
   48472:	00042223          	sw	zero,4(s0)
   48476:	c018                	sw	a4,0(s0)
   48478:	01379713          	sll	a4,a5,0x13
   4847c:	00075863          	bgez	a4,4848c <__sflush_r+0x96>
   48480:	57fd                	li	a5,-1
   48482:	00f51463          	bne	a0,a5,4848a <__sflush_r+0x94>
   48486:	409c                	lw	a5,0(s1)
   48488:	e391                	bnez	a5,4848c <__sflush_r+0x96>
   4848a:	c868                	sw	a0,84(s0)
   4848c:	584c                	lw	a1,52(s0)
   4848e:	0124a023          	sw	s2,0(s1)
   48492:	cd8d                	beqz	a1,484cc <__sflush_r+0xd6>
   48494:	04440793          	add	a5,s0,68
   48498:	00f58563          	beq	a1,a5,484a2 <__sflush_r+0xac>
   4849c:	8526                	mv	a0,s1
   4849e:	7a0010ef          	jal	49c3e <_free_r>
   484a2:	02042a23          	sw	zero,52(s0)
   484a6:	a01d                	j	484cc <__sflush_r+0xd6>
   484a8:	4601                	li	a2,0
   484aa:	4685                	li	a3,1
   484ac:	8526                	mv	a0,s1
   484ae:	9702                	jalr	a4
   484b0:	57fd                	li	a5,-1
   484b2:	862a                	mv	a2,a0
   484b4:	f8f510e3          	bne	a0,a5,48434 <__sflush_r+0x3e>
   484b8:	409c                	lw	a5,0(s1)
   484ba:	dfad                	beqz	a5,48434 <__sflush_r+0x3e>
   484bc:	4775                	li	a4,29
   484be:	00e78563          	beq	a5,a4,484c8 <__sflush_r+0xd2>
   484c2:	4759                	li	a4,22
   484c4:	04e79463          	bne	a5,a4,4850c <__sflush_r+0x116>
   484c8:	0124a023          	sw	s2,0(s1)
   484cc:	4501                	li	a0,0
   484ce:	a0b1                	j	4851a <__sflush_r+0x124>
   484d0:	0407e793          	or	a5,a5,64
   484d4:	60579793          	sext.h	a5,a5
   484d8:	a835                	j	48514 <__sflush_r+0x11e>
   484da:	0105a983          	lw	s3,16(a1)
   484de:	fe0987e3          	beqz	s3,484cc <__sflush_r+0xd6>
   484e2:	0005a903          	lw	s2,0(a1)
   484e6:	8b8d                	and	a5,a5,3
   484e8:	0135a023          	sw	s3,0(a1)
   484ec:	41390933          	sub	s2,s2,s3
   484f0:	4701                	li	a4,0
   484f2:	e391                	bnez	a5,484f6 <__sflush_r+0x100>
   484f4:	49d8                	lw	a4,20(a1)
   484f6:	c418                	sw	a4,8(s0)
   484f8:	fd205ae3          	blez	s2,484cc <__sflush_r+0xd6>
   484fc:	541c                	lw	a5,40(s0)
   484fe:	500c                	lw	a1,32(s0)
   48500:	86ca                	mv	a3,s2
   48502:	864e                	mv	a2,s3
   48504:	8526                	mv	a0,s1
   48506:	9782                	jalr	a5
   48508:	02a04063          	bgtz	a0,48528 <__sflush_r+0x132>
   4850c:	00c41783          	lh	a5,12(s0)
   48510:	0407e793          	or	a5,a5,64
   48514:	00f41623          	sh	a5,12(s0)
   48518:	557d                	li	a0,-1
   4851a:	40f2                	lw	ra,28(sp)
   4851c:	4462                	lw	s0,24(sp)
   4851e:	44d2                	lw	s1,20(sp)
   48520:	4942                	lw	s2,16(sp)
   48522:	49b2                	lw	s3,12(sp)
   48524:	6105                	add	sp,sp,32
   48526:	8082                	ret
   48528:	99aa                	add	s3,s3,a0
   4852a:	40a90933          	sub	s2,s2,a0
   4852e:	b7e9                	j	484f8 <__sflush_r+0x102>

00048530 <_fflush_r>:
   48530:	499c                	lw	a5,16(a1)
   48532:	c3a5                	beqz	a5,48592 <_fflush_r+0x62>
   48534:	1101                	add	sp,sp,-32
   48536:	cc22                	sw	s0,24(sp)
   48538:	ce06                	sw	ra,28(sp)
   4853a:	842a                	mv	s0,a0
   4853c:	c511                	beqz	a0,48548 <_fflush_r+0x18>
   4853e:	4d1c                	lw	a5,24(a0)
   48540:	e781                	bnez	a5,48548 <_fflush_r+0x18>
   48542:	c62e                	sw	a1,12(sp)
   48544:	2239                	jal	48652 <__sinit>
   48546:	45b2                	lw	a1,12(sp)
   48548:	0004b7b7          	lui	a5,0x4b
   4854c:	2b478793          	add	a5,a5,692 # 4b2b4 <__sf_fake_stdin>
   48550:	00f59c63          	bne	a1,a5,48568 <_fflush_r+0x38>
   48554:	404c                	lw	a1,4(s0)
   48556:	00c59783          	lh	a5,12(a1)
   4855a:	c79d                	beqz	a5,48588 <_fflush_r+0x58>
   4855c:	8522                	mv	a0,s0
   4855e:	4462                	lw	s0,24(sp)
   48560:	40f2                	lw	ra,28(sp)
   48562:	6105                	add	sp,sp,32
   48564:	e93ff06f          	j	483f6 <__sflush_r>
   48568:	0004b7b7          	lui	a5,0x4b
   4856c:	29478793          	add	a5,a5,660 # 4b294 <__sf_fake_stdout>
   48570:	00f59463          	bne	a1,a5,48578 <_fflush_r+0x48>
   48574:	440c                	lw	a1,8(s0)
   48576:	b7c5                	j	48556 <_fflush_r+0x26>
   48578:	0004b7b7          	lui	a5,0x4b
   4857c:	27478793          	add	a5,a5,628 # 4b274 <__sf_fake_stderr>
   48580:	fcf59be3          	bne	a1,a5,48556 <_fflush_r+0x26>
   48584:	444c                	lw	a1,12(s0)
   48586:	bfc1                	j	48556 <_fflush_r+0x26>
   48588:	40f2                	lw	ra,28(sp)
   4858a:	4462                	lw	s0,24(sp)
   4858c:	4501                	li	a0,0
   4858e:	6105                	add	sp,sp,32
   48590:	8082                	ret
   48592:	4501                	li	a0,0
   48594:	8082                	ret

00048596 <std>:
   48596:	1141                	add	sp,sp,-16
   48598:	c422                	sw	s0,8(sp)
   4859a:	c606                	sw	ra,12(sp)
   4859c:	842a                	mv	s0,a0
   4859e:	00b51623          	sh	a1,12(a0)
   485a2:	00c51723          	sh	a2,14(a0)
   485a6:	00052023          	sw	zero,0(a0)
   485aa:	00052223          	sw	zero,4(a0)
   485ae:	00052423          	sw	zero,8(a0)
   485b2:	06052223          	sw	zero,100(a0)
   485b6:	00052823          	sw	zero,16(a0)
   485ba:	00052a23          	sw	zero,20(a0)
   485be:	00052c23          	sw	zero,24(a0)
   485c2:	4621                	li	a2,8
   485c4:	4581                	li	a1,0
   485c6:	05c50513          	add	a0,a0,92
   485ca:	8dbfa0ef          	jal	42ea4 <memset>
   485ce:	0004a7b7          	lui	a5,0x4a
   485d2:	45e78793          	add	a5,a5,1118 # 4a45e <__sread>
   485d6:	d05c                	sw	a5,36(s0)
   485d8:	0004a7b7          	lui	a5,0x4a
   485dc:	48c78793          	add	a5,a5,1164 # 4a48c <__swrite>
   485e0:	d41c                	sw	a5,40(s0)
   485e2:	0004a7b7          	lui	a5,0x4a
   485e6:	4d878793          	add	a5,a5,1240 # 4a4d8 <__sseek>
   485ea:	d45c                	sw	a5,44(s0)
   485ec:	0004a7b7          	lui	a5,0x4a
   485f0:	50c78793          	add	a5,a5,1292 # 4a50c <__sclose>
   485f4:	40b2                	lw	ra,12(sp)
   485f6:	d000                	sw	s0,32(s0)
   485f8:	d81c                	sw	a5,48(s0)
   485fa:	4422                	lw	s0,8(sp)
   485fc:	0141                	add	sp,sp,16
   485fe:	8082                	ret

00048600 <_cleanup_r>:
   48600:	000485b7          	lui	a1,0x48
   48604:	53058593          	add	a1,a1,1328 # 48530 <_fflush_r>
   48608:	aab1                	j	48764 <_fwalk_reent>

0004860a <__sfmoreglue>:
   4860a:	1141                	add	sp,sp,-16
   4860c:	c226                	sw	s1,4(sp)
   4860e:	06800793          	li	a5,104
   48612:	fff58493          	add	s1,a1,-1
   48616:	02f484b3          	mul	s1,s1,a5
   4861a:	c04a                	sw	s2,0(sp)
   4861c:	892e                	mv	s2,a1
   4861e:	c422                	sw	s0,8(sp)
   48620:	c606                	sw	ra,12(sp)
   48622:	07448593          	add	a1,s1,116
   48626:	6ba010ef          	jal	49ce0 <_malloc_r>
   4862a:	842a                	mv	s0,a0
   4862c:	cd01                	beqz	a0,48644 <__sfmoreglue+0x3a>
   4862e:	00052023          	sw	zero,0(a0)
   48632:	01252223          	sw	s2,4(a0)
   48636:	0531                	add	a0,a0,12
   48638:	c408                	sw	a0,8(s0)
   4863a:	06848613          	add	a2,s1,104
   4863e:	4581                	li	a1,0
   48640:	865fa0ef          	jal	42ea4 <memset>
   48644:	40b2                	lw	ra,12(sp)
   48646:	8522                	mv	a0,s0
   48648:	4422                	lw	s0,8(sp)
   4864a:	4492                	lw	s1,4(sp)
   4864c:	4902                	lw	s2,0(sp)
   4864e:	0141                	add	sp,sp,16
   48650:	8082                	ret

00048652 <__sinit>:
   48652:	4d1c                	lw	a5,24(a0)
   48654:	e7b5                	bnez	a5,486c0 <__sinit+0x6e>
   48656:	1141                	add	sp,sp,-16
   48658:	000487b7          	lui	a5,0x48
   4865c:	c422                	sw	s0,8(sp)
   4865e:	c606                	sw	ra,12(sp)
   48660:	60078793          	add	a5,a5,1536 # 48600 <_cleanup_r>
   48664:	d51c                	sw	a5,40(a0)
   48666:	0004b7b7          	lui	a5,0x4b
   4866a:	3e87a783          	lw	a5,1000(a5) # 4b3e8 <_global_impure_ptr>
   4866e:	04052423          	sw	zero,72(a0)
   48672:	04052623          	sw	zero,76(a0)
   48676:	04052823          	sw	zero,80(a0)
   4867a:	842a                	mv	s0,a0
   4867c:	00f51463          	bne	a0,a5,48684 <__sinit+0x32>
   48680:	4785                	li	a5,1
   48682:	cd1c                	sw	a5,24(a0)
   48684:	8522                	mv	a0,s0
   48686:	2835                	jal	486c2 <__sfp>
   48688:	c048                	sw	a0,4(s0)
   4868a:	8522                	mv	a0,s0
   4868c:	281d                	jal	486c2 <__sfp>
   4868e:	c408                	sw	a0,8(s0)
   48690:	8522                	mv	a0,s0
   48692:	2805                	jal	486c2 <__sfp>
   48694:	c448                	sw	a0,12(s0)
   48696:	4048                	lw	a0,4(s0)
   48698:	4601                	li	a2,0
   4869a:	4591                	li	a1,4
   4869c:	efbff0ef          	jal	48596 <std>
   486a0:	4408                	lw	a0,8(s0)
   486a2:	4605                	li	a2,1
   486a4:	45a5                	li	a1,9
   486a6:	ef1ff0ef          	jal	48596 <std>
   486aa:	4448                	lw	a0,12(s0)
   486ac:	4609                	li	a2,2
   486ae:	45c9                	li	a1,18
   486b0:	ee7ff0ef          	jal	48596 <std>
   486b4:	4785                	li	a5,1
   486b6:	40b2                	lw	ra,12(sp)
   486b8:	cc1c                	sw	a5,24(s0)
   486ba:	4422                	lw	s0,8(sp)
   486bc:	0141                	add	sp,sp,16
   486be:	8082                	ret
   486c0:	8082                	ret

000486c2 <__sfp>:
   486c2:	1141                	add	sp,sp,-16
   486c4:	0004b7b7          	lui	a5,0x4b
   486c8:	c226                	sw	s1,4(sp)
   486ca:	3e87a483          	lw	s1,1000(a5) # 4b3e8 <_global_impure_ptr>
   486ce:	c04a                	sw	s2,0(sp)
   486d0:	c606                	sw	ra,12(sp)
   486d2:	4c9c                	lw	a5,24(s1)
   486d4:	c422                	sw	s0,8(sp)
   486d6:	892a                	mv	s2,a0
   486d8:	e781                	bnez	a5,486e0 <__sfp+0x1e>
   486da:	8526                	mv	a0,s1
   486dc:	f77ff0ef          	jal	48652 <__sinit>
   486e0:	04848493          	add	s1,s1,72
   486e4:	4480                	lw	s0,8(s1)
   486e6:	40dc                	lw	a5,4(s1)
   486e8:	17fd                	add	a5,a5,-1
   486ea:	0007d663          	bgez	a5,486f6 <__sfp+0x34>
   486ee:	409c                	lw	a5,0(s1)
   486f0:	cfb9                	beqz	a5,4874e <__sfp+0x8c>
   486f2:	4084                	lw	s1,0(s1)
   486f4:	bfc5                	j	486e4 <__sfp+0x22>
   486f6:	00c41703          	lh	a4,12(s0)
   486fa:	e739                	bnez	a4,48748 <__sfp+0x86>
   486fc:	77c1                	lui	a5,0xffff0
   486fe:	0785                	add	a5,a5,1 # ffff0001 <__share_mem_end__+0xfecf0001>
   48700:	06042223          	sw	zero,100(s0)
   48704:	00042023          	sw	zero,0(s0)
   48708:	00042223          	sw	zero,4(s0)
   4870c:	00042423          	sw	zero,8(s0)
   48710:	c45c                	sw	a5,12(s0)
   48712:	00042823          	sw	zero,16(s0)
   48716:	00042a23          	sw	zero,20(s0)
   4871a:	00042c23          	sw	zero,24(s0)
   4871e:	4621                	li	a2,8
   48720:	4581                	li	a1,0
   48722:	05c40513          	add	a0,s0,92
   48726:	f7efa0ef          	jal	42ea4 <memset>
   4872a:	02042a23          	sw	zero,52(s0)
   4872e:	02042c23          	sw	zero,56(s0)
   48732:	04042423          	sw	zero,72(s0)
   48736:	04042623          	sw	zero,76(s0)
   4873a:	40b2                	lw	ra,12(sp)
   4873c:	8522                	mv	a0,s0
   4873e:	4422                	lw	s0,8(sp)
   48740:	4492                	lw	s1,4(sp)
   48742:	4902                	lw	s2,0(sp)
   48744:	0141                	add	sp,sp,16
   48746:	8082                	ret
   48748:	06840413          	add	s0,s0,104
   4874c:	bf71                	j	486e8 <__sfp+0x26>
   4874e:	4591                	li	a1,4
   48750:	854a                	mv	a0,s2
   48752:	eb9ff0ef          	jal	4860a <__sfmoreglue>
   48756:	c088                	sw	a0,0(s1)
   48758:	842a                	mv	s0,a0
   4875a:	fd41                	bnez	a0,486f2 <__sfp+0x30>
   4875c:	47b1                	li	a5,12
   4875e:	00f92023          	sw	a5,0(s2)
   48762:	bfe1                	j	4873a <__sfp+0x78>

00048764 <_fwalk_reent>:
   48764:	7179                	add	sp,sp,-48
   48766:	d422                	sw	s0,40(sp)
   48768:	d04a                	sw	s2,32(sp)
   4876a:	ce4e                	sw	s3,28(sp)
   4876c:	cc52                	sw	s4,24(sp)
   4876e:	c85a                	sw	s6,16(sp)
   48770:	c65e                	sw	s7,12(sp)
   48772:	d606                	sw	ra,44(sp)
   48774:	d226                	sw	s1,36(sp)
   48776:	ca56                	sw	s5,20(sp)
   48778:	892a                	mv	s2,a0
   4877a:	8a2e                	mv	s4,a1
   4877c:	04850413          	add	s0,a0,72
   48780:	4981                	li	s3,0
   48782:	4b05                	li	s6,1
   48784:	5bfd                	li	s7,-1
   48786:	4404                	lw	s1,8(s0)
   48788:	00442a83          	lw	s5,4(s0)
   4878c:	1afd                	add	s5,s5,-1
   4878e:	020ad063          	bgez	s5,487ae <_fwalk_reent+0x4a>
   48792:	4000                	lw	s0,0(s0)
   48794:	f86d                	bnez	s0,48786 <_fwalk_reent+0x22>
   48796:	50b2                	lw	ra,44(sp)
   48798:	5422                	lw	s0,40(sp)
   4879a:	5492                	lw	s1,36(sp)
   4879c:	5902                	lw	s2,32(sp)
   4879e:	4a62                	lw	s4,24(sp)
   487a0:	4ad2                	lw	s5,20(sp)
   487a2:	4b42                	lw	s6,16(sp)
   487a4:	4bb2                	lw	s7,12(sp)
   487a6:	854e                	mv	a0,s3
   487a8:	49f2                	lw	s3,28(sp)
   487aa:	6145                	add	sp,sp,48
   487ac:	8082                	ret
   487ae:	00c4d783          	lhu	a5,12(s1)
   487b2:	00fb7b63          	bgeu	s6,a5,487c8 <_fwalk_reent+0x64>
   487b6:	00e49783          	lh	a5,14(s1)
   487ba:	01778763          	beq	a5,s7,487c8 <_fwalk_reent+0x64>
   487be:	85a6                	mv	a1,s1
   487c0:	854a                	mv	a0,s2
   487c2:	9a02                	jalr	s4
   487c4:	00a9e9b3          	or	s3,s3,a0
   487c8:	06848493          	add	s1,s1,104
   487cc:	b7c1                	j	4878c <_fwalk_reent+0x28>

000487ce <rshift>:
   487ce:	4918                	lw	a4,16(a0)
   487d0:	01450693          	add	a3,a0,20
   487d4:	4055d313          	sra	t1,a1,0x5
   487d8:	87b6                	mv	a5,a3
   487da:	06e35463          	bge	t1,a4,48842 <rshift+0x74>
   487de:	89fd                	and	a1,a1,31
   487e0:	20d74e33          	sh2add	t3,a4,a3
   487e4:	20d347b3          	sh2add	a5,t1,a3
   487e8:	e185                	bnez	a1,48808 <rshift+0x3a>
   487ea:	85b6                	mv	a1,a3
   487ec:	863e                	mv	a2,a5
   487ee:	09c66263          	bltu	a2,t3,48872 <rshift+0xa4>
   487f2:	ffd78613          	add	a2,a5,-3
   487f6:	4781                	li	a5,0
   487f8:	00ce6663          	bltu	t3,a2,48804 <rshift+0x36>
   487fc:	40670733          	sub	a4,a4,t1
   48800:	00271793          	sll	a5,a4,0x2
   48804:	97b6                	add	a5,a5,a3
   48806:	a835                	j	48842 <rshift+0x74>
   48808:	0007a803          	lw	a6,0(a5)
   4880c:	02000e93          	li	t4,32
   48810:	40be8eb3          	sub	t4,t4,a1
   48814:	00b85833          	srl	a6,a6,a1
   48818:	00478613          	add	a2,a5,4
   4881c:	8f36                	mv	t5,a3
   4881e:	03c66b63          	bltu	a2,t3,48854 <rshift+0x86>
   48822:	00178613          	add	a2,a5,1
   48826:	4781                	li	a5,0
   48828:	00ce6763          	bltu	t3,a2,48836 <rshift+0x68>
   4882c:	40670733          	sub	a4,a4,t1
   48830:	070a                	sll	a4,a4,0x2
   48832:	ffc70793          	add	a5,a4,-4
   48836:	97b6                	add	a5,a5,a3
   48838:	0107a023          	sw	a6,0(a5)
   4883c:	00080363          	beqz	a6,48842 <rshift+0x74>
   48840:	0791                	add	a5,a5,4
   48842:	40d78733          	sub	a4,a5,a3
   48846:	8709                	sra	a4,a4,0x2
   48848:	c918                	sw	a4,16(a0)
   4884a:	00d79463          	bne	a5,a3,48852 <rshift+0x84>
   4884e:	00052a23          	sw	zero,20(a0)
   48852:	8082                	ret
   48854:	00062883          	lw	a7,0(a2)
   48858:	0f11                	add	t5,t5,4
   4885a:	01d898b3          	sll	a7,a7,t4
   4885e:	0108e833          	or	a6,a7,a6
   48862:	ff0f2e23          	sw	a6,-4(t5)
   48866:	00062803          	lw	a6,0(a2)
   4886a:	0611                	add	a2,a2,4
   4886c:	00b85833          	srl	a6,a6,a1
   48870:	b77d                	j	4881e <rshift+0x50>
   48872:	00062803          	lw	a6,0(a2)
   48876:	0611                	add	a2,a2,4
   48878:	0105a023          	sw	a6,0(a1)
   4887c:	0591                	add	a1,a1,4
   4887e:	bf85                	j	487ee <rshift+0x20>

00048880 <__hexdig_fun>:
   48880:	fd050713          	add	a4,a0,-48
   48884:	0ff77713          	zext.b	a4,a4
   48888:	46a5                	li	a3,9
   4888a:	87aa                	mv	a5,a0
   4888c:	00e6e763          	bltu	a3,a4,4889a <__hexdig_fun+0x1a>
   48890:	fe050793          	add	a5,a0,-32
   48894:	0ff7f513          	zext.b	a0,a5
   48898:	8082                	ret
   4889a:	f9f50713          	add	a4,a0,-97
   4889e:	0ff77713          	zext.b	a4,a4
   488a2:	4695                	li	a3,5
   488a4:	00e6e563          	bltu	a3,a4,488ae <__hexdig_fun+0x2e>
   488a8:	fb950793          	add	a5,a0,-71
   488ac:	b7e5                	j	48894 <__hexdig_fun+0x14>
   488ae:	fbf50713          	add	a4,a0,-65
   488b2:	0ff77713          	zext.b	a4,a4
   488b6:	4501                	li	a0,0
   488b8:	fee6e0e3          	bltu	a3,a4,48898 <__hexdig_fun+0x18>
   488bc:	fd978793          	add	a5,a5,-39
   488c0:	bfd1                	j	48894 <__hexdig_fun+0x14>

000488c2 <__gethex>:
   488c2:	711d                	add	sp,sp,-96
   488c4:	c0da                	sw	s6,64(sp)
   488c6:	8b3e                	mv	s6,a5
   488c8:	0004b7b7          	lui	a5,0x4b
   488cc:	2d47a783          	lw	a5,724(a5) # 4b2d4 <_C_numeric_locale>
   488d0:	c22a                	sw	a0,4(sp)
   488d2:	cca2                	sw	s0,88(sp)
   488d4:	853e                	mv	a0,a5
   488d6:	c6ce                	sw	s3,76(sp)
   488d8:	c4d2                	sw	s4,72(sp)
   488da:	dc62                	sw	s8,56(sp)
   488dc:	c43e                	sw	a5,8(sp)
   488de:	8c3a                	mv	s8,a4
   488e0:	ce86                	sw	ra,92(sp)
   488e2:	caa6                	sw	s1,84(sp)
   488e4:	c8ca                	sw	s2,80(sp)
   488e6:	c2d6                	sw	s5,68(sp)
   488e8:	de5e                	sw	s7,60(sp)
   488ea:	da66                	sw	s9,52(sp)
   488ec:	d86a                	sw	s10,48(sp)
   488ee:	d66e                	sw	s11,44(sp)
   488f0:	c62e                	sw	a1,12(sp)
   488f2:	89b2                	mv	s3,a2
   488f4:	c836                	sw	a3,16(sp)
   488f6:	fbbfd0ef          	jal	468b0 <strlen>
   488fa:	47a2                	lw	a5,8(sp)
   488fc:	8a2a                	mv	s4,a0
   488fe:	03000713          	li	a4,48
   48902:	97aa                	add	a5,a5,a0
   48904:	fff7c783          	lbu	a5,-1(a5)
   48908:	ca3e                	sw	a5,20(sp)
   4890a:	47b2                	lw	a5,12(sp)
   4890c:	4380                	lw	s0,0(a5)
   4890e:	00240793          	add	a5,s0,2
   48912:	893e                	mv	s2,a5
   48914:	0007c503          	lbu	a0,0(a5)
   48918:	0785                	add	a5,a5,1
   4891a:	fee50ce3          	beq	a0,a4,48912 <__gethex+0x50>
   4891e:	40890433          	sub	s0,s2,s0
   48922:	1479                	add	s0,s0,-2
   48924:	f5dff0ef          	jal	48880 <__hexdig_fun>
   48928:	e93d                	bnez	a0,4899e <__gethex+0xdc>
   4892a:	45a2                	lw	a1,8(sp)
   4892c:	8652                	mv	a2,s4
   4892e:	854a                	mv	a0,s2
   48930:	3e3010ef          	jal	4a512 <strncmp>
   48934:	84aa                	mv	s1,a0
   48936:	e169                	bnez	a0,489f8 <__gethex+0x136>
   48938:	01490cb3          	add	s9,s2,s4
   4893c:	000cc503          	lbu	a0,0(s9)
   48940:	4b85                	li	s7,1
   48942:	f3fff0ef          	jal	48880 <__hexdig_fun>
   48946:	c525                	beqz	a0,489ae <__gethex+0xec>
   48948:	8966                	mv	s2,s9
   4894a:	03000793          	li	a5,48
   4894e:	00094503          	lbu	a0,0(s2)
   48952:	00f50a63          	beq	a0,a5,48966 <__gethex+0xa4>
   48956:	f2bff0ef          	jal	48880 <__hexdig_fun>
   4895a:	00153b93          	seqz	s7,a0
   4895e:	8de6                	mv	s11,s9
   48960:	4405                	li	s0,1
   48962:	8cca                	mv	s9,s2
   48964:	a021                	j	4896c <__gethex+0xaa>
   48966:	0905                	add	s2,s2,1
   48968:	b7dd                	j	4894e <__gethex+0x8c>
   4896a:	0c85                	add	s9,s9,1
   4896c:	000cc503          	lbu	a0,0(s9)
   48970:	f11ff0ef          	jal	48880 <__hexdig_fun>
   48974:	f97d                	bnez	a0,4896a <__gethex+0xa8>
   48976:	45a2                	lw	a1,8(sp)
   48978:	8652                	mv	a2,s4
   4897a:	8566                	mv	a0,s9
   4897c:	397010ef          	jal	4a512 <strncmp>
   48980:	e505                	bnez	a0,489a8 <__gethex+0xe6>
   48982:	000d9963          	bnez	s11,48994 <__gethex+0xd2>
   48986:	9cd2                	add	s9,s9,s4
   48988:	8de6                	mv	s11,s9
   4898a:	000cc503          	lbu	a0,0(s9)
   4898e:	ef3ff0ef          	jal	48880 <__hexdig_fun>
   48992:	e909                	bnez	a0,489a4 <__gethex+0xe2>
   48994:	419d8db3          	sub	s11,s11,s9
   48998:	002d9493          	sll	s1,s11,0x2
   4899c:	a809                	j	489ae <__gethex+0xec>
   4899e:	4b81                	li	s7,0
   489a0:	4d81                	li	s11,0
   489a2:	b7c1                	j	48962 <__gethex+0xa0>
   489a4:	0c85                	add	s9,s9,1
   489a6:	b7d5                	j	4898a <__gethex+0xc8>
   489a8:	4481                	li	s1,0
   489aa:	fe0d95e3          	bnez	s11,48994 <__gethex+0xd2>
   489ae:	000cc683          	lbu	a3,0(s9)
   489b2:	05000613          	li	a2,80
   489b6:	8ae6                	mv	s5,s9
   489b8:	0df6f693          	and	a3,a3,223
   489bc:	06c69e63          	bne	a3,a2,48a38 <__gethex+0x176>
   489c0:	001cc783          	lbu	a5,1(s9)
   489c4:	02b00693          	li	a3,43
   489c8:	02d78c63          	beq	a5,a3,48a00 <__gethex+0x13e>
   489cc:	02d00693          	li	a3,45
   489d0:	02d78c63          	beq	a5,a3,48a08 <__gethex+0x146>
   489d4:	001c8a93          	add	s5,s9,1
   489d8:	4d01                	li	s10,0
   489da:	000ac503          	lbu	a0,0(s5)
   489de:	ea3ff0ef          	jal	48880 <__hexdig_fun>
   489e2:	fff50613          	add	a2,a0,-1
   489e6:	0ff67613          	zext.b	a2,a2
   489ea:	45e1                	li	a1,24
   489ec:	ff050d93          	add	s11,a0,-16
   489f0:	02c5f263          	bgeu	a1,a2,48a14 <__gethex+0x152>
   489f4:	8ae6                	mv	s5,s9
   489f6:	a089                	j	48a38 <__gethex+0x176>
   489f8:	8cca                	mv	s9,s2
   489fa:	4481                	li	s1,0
   489fc:	4b85                	li	s7,1
   489fe:	bf45                	j	489ae <__gethex+0xec>
   48a00:	4d01                	li	s10,0
   48a02:	002c8a93          	add	s5,s9,2
   48a06:	bfd1                	j	489da <__gethex+0x118>
   48a08:	4d05                	li	s10,1
   48a0a:	bfe5                	j	48a02 <__gethex+0x140>
   48a0c:	030d8db3          	mul	s11,s11,a6
   48a10:	9daa                	add	s11,s11,a0
   48a12:	1dc1                	add	s11,s11,-16
   48a14:	001ac503          	lbu	a0,1(s5)
   48a18:	0a85                	add	s5,s5,1
   48a1a:	e67ff0ef          	jal	48880 <__hexdig_fun>
   48a1e:	fff50613          	add	a2,a0,-1
   48a22:	0ff67613          	zext.b	a2,a2
   48a26:	45e1                	li	a1,24
   48a28:	4829                	li	a6,10
   48a2a:	fec5f1e3          	bgeu	a1,a2,48a0c <__gethex+0x14a>
   48a2e:	000d0463          	beqz	s10,48a36 <__gethex+0x174>
   48a32:	41b00db3          	neg	s11,s11
   48a36:	94ee                	add	s1,s1,s11
   48a38:	47b2                	lw	a5,12(sp)
   48a3a:	0157a023          	sw	s5,0(a5)
   48a3e:	020b8563          	beqz	s7,48a68 <__gethex+0x1a6>
   48a42:	4919                	li	s2,6
   48a44:	c011                	beqz	s0,48a48 <__gethex+0x186>
   48a46:	4901                	li	s2,0
   48a48:	40f6                	lw	ra,92(sp)
   48a4a:	4466                	lw	s0,88(sp)
   48a4c:	44d6                	lw	s1,84(sp)
   48a4e:	49b6                	lw	s3,76(sp)
   48a50:	4a26                	lw	s4,72(sp)
   48a52:	4a96                	lw	s5,68(sp)
   48a54:	4b06                	lw	s6,64(sp)
   48a56:	5bf2                	lw	s7,60(sp)
   48a58:	5c62                	lw	s8,56(sp)
   48a5a:	5cd2                	lw	s9,52(sp)
   48a5c:	5d42                	lw	s10,48(sp)
   48a5e:	5db2                	lw	s11,44(sp)
   48a60:	854a                	mv	a0,s2
   48a62:	4946                	lw	s2,80(sp)
   48a64:	6125                	add	sp,sp,96
   48a66:	8082                	ret
   48a68:	412c87b3          	sub	a5,s9,s2
   48a6c:	17fd                	add	a5,a5,-1
   48a6e:	4581                	li	a1,0
   48a70:	469d                	li	a3,7
   48a72:	02f6c363          	blt	a3,a5,48a98 <__gethex+0x1d6>
   48a76:	4512                	lw	a0,4(sp)
   48a78:	2da9                	jal	490d2 <_Balloc>
   48a7a:	842a                	mv	s0,a0
   48a7c:	e10d                	bnez	a0,48a9e <__gethex+0x1dc>
   48a7e:	0004b6b7          	lui	a3,0x4b
   48a82:	e2868693          	add	a3,a3,-472 # 4ae28 <__clz_tab+0x374>
   48a86:	4601                	li	a2,0
   48a88:	0de00593          	li	a1,222
   48a8c:	0004b537          	lui	a0,0x4b
   48a90:	e3c50513          	add	a0,a0,-452 # 4ae3c <__clz_tab+0x388>
   48a94:	4c3010ef          	jal	4a756 <__assert_func>
   48a98:	0585                	add	a1,a1,1
   48a9a:	8785                	sra	a5,a5,0x1
   48a9c:	bfd9                	j	48a72 <__gethex+0x1b0>
   48a9e:	4605                	li	a2,1
   48aa0:	01450b93          	add	s7,a0,20
   48aa4:	414607b3          	sub	a5,a2,s4
   48aa8:	8dde                	mv	s11,s7
   48aaa:	4d01                	li	s10,0
   48aac:	4a81                	li	s5,0
   48aae:	cc3e                	sw	a5,24(sp)
   48ab0:	07996e63          	bltu	s2,s9,48b2c <__gethex+0x26a>
   48ab4:	004d8913          	add	s2,s11,4
   48ab8:	41790933          	sub	s2,s2,s7
   48abc:	015da023          	sw	s5,0(s11)
   48ac0:	40295913          	sra	s2,s2,0x2
   48ac4:	01242823          	sw	s2,16(s0)
   48ac8:	8556                	mv	a0,s5
   48aca:	08f000ef          	jal	49358 <__hi0bits>
   48ace:	0009aa03          	lw	s4,0(s3)
   48ad2:	0916                	sll	s2,s2,0x5
   48ad4:	40a90933          	sub	s2,s2,a0
   48ad8:	0d2a5063          	bge	s4,s2,48b98 <__gethex+0x2d6>
   48adc:	41490933          	sub	s2,s2,s4
   48ae0:	85ca                	mv	a1,s2
   48ae2:	8522                	mv	a0,s0
   48ae4:	0e2010ef          	jal	49bc6 <__any_on>
   48ae8:	8d2a                	mv	s10,a0
   48aea:	c105                	beqz	a0,48b0a <__gethex+0x248>
   48aec:	fff90793          	add	a5,s2,-1
   48af0:	4057d693          	sra	a3,a5,0x5
   48af4:	2176c6b3          	sh2add	a3,a3,s7
   48af8:	4294                	lw	a3,0(a3)
   48afa:	28f01733          	bset	a4,zero,a5
   48afe:	4d05                	li	s10,1
   48b00:	8f75                	and	a4,a4,a3
   48b02:	c701                	beqz	a4,48b0a <__gethex+0x248>
   48b04:	08fd4263          	blt	s10,a5,48b88 <__gethex+0x2c6>
   48b08:	4d09                	li	s10,2
   48b0a:	85ca                	mv	a1,s2
   48b0c:	8522                	mv	a0,s0
   48b0e:	cc1ff0ef          	jal	487ce <rshift>
   48b12:	94ca                	add	s1,s1,s2
   48b14:	0089a783          	lw	a5,8(s3)
   48b18:	0a97d063          	bge	a5,s1,48bb8 <__gethex+0x2f6>
   48b1c:	4512                	lw	a0,4(sp)
   48b1e:	85a2                	mv	a1,s0
   48b20:	0a300913          	li	s2,163
   48b24:	2da1                	jal	4917c <_Bfree>
   48b26:	000c2023          	sw	zero,0(s8)
   48b2a:	bf39                	j	48a48 <__gethex+0x186>
   48b2c:	fffc8793          	add	a5,s9,-1
   48b30:	c63e                	sw	a5,12(sp)
   48b32:	fffcc603          	lbu	a2,-1(s9)
   48b36:	47d2                	lw	a5,20(sp)
   48b38:	02f60763          	beq	a2,a5,48b66 <__gethex+0x2a4>
   48b3c:	02000793          	li	a5,32
   48b40:	00fd1763          	bne	s10,a5,48b4e <__gethex+0x28c>
   48b44:	015da023          	sw	s5,0(s11)
   48b48:	4d01                	li	s10,0
   48b4a:	0d91                	add	s11,s11,4
   48b4c:	4a81                	li	s5,0
   48b4e:	fffcc503          	lbu	a0,-1(s9)
   48b52:	d2fff0ef          	jal	48880 <__hexdig_fun>
   48b56:	893d                	and	a0,a0,15
   48b58:	01a51533          	sll	a0,a0,s10
   48b5c:	48b2                	lw	a7,12(sp)
   48b5e:	00aaeab3          	or	s5,s5,a0
   48b62:	0d11                	add	s10,s10,4
   48b64:	a005                	j	48b84 <__gethex+0x2c2>
   48b66:	4762                	lw	a4,24(sp)
   48b68:	fffc8793          	add	a5,s9,-1
   48b6c:	00e788b3          	add	a7,a5,a4
   48b70:	fd28e6e3          	bltu	a7,s2,48b3c <__gethex+0x27a>
   48b74:	45a2                	lw	a1,8(sp)
   48b76:	8546                	mv	a0,a7
   48b78:	8652                	mv	a2,s4
   48b7a:	ce46                	sw	a7,28(sp)
   48b7c:	197010ef          	jal	4a512 <strncmp>
   48b80:	48f2                	lw	a7,28(sp)
   48b82:	fd4d                	bnez	a0,48b3c <__gethex+0x27a>
   48b84:	8cc6                	mv	s9,a7
   48b86:	b72d                	j	48ab0 <__gethex+0x1ee>
   48b88:	ffe90593          	add	a1,s2,-2
   48b8c:	8522                	mv	a0,s0
   48b8e:	038010ef          	jal	49bc6 <__any_on>
   48b92:	d93d                	beqz	a0,48b08 <__gethex+0x246>
   48b94:	4d0d                	li	s10,3
   48b96:	bf95                	j	48b0a <__gethex+0x248>
   48b98:	4d01                	li	s10,0
   48b9a:	f7495de3          	bge	s2,s4,48b14 <__gethex+0x252>
   48b9e:	4512                	lw	a0,4(sp)
   48ba0:	412a0933          	sub	s2,s4,s2
   48ba4:	85a2                	mv	a1,s0
   48ba6:	864a                	mv	a2,s2
   48ba8:	2e9000ef          	jal	49690 <__lshift>
   48bac:	842a                	mv	s0,a0
   48bae:	412484b3          	sub	s1,s1,s2
   48bb2:	01450b93          	add	s7,a0,20
   48bb6:	bfb9                	j	48b14 <__gethex+0x252>
   48bb8:	0049a783          	lw	a5,4(s3)
   48bbc:	0ef4d463          	bge	s1,a5,48ca4 <__gethex+0x3e2>
   48bc0:	409784b3          	sub	s1,a5,s1
   48bc4:	0744c263          	blt	s1,s4,48c28 <__gethex+0x366>
   48bc8:	00c9a783          	lw	a5,12(s3)
   48bcc:	4709                	li	a4,2
   48bce:	04e78763          	beq	a5,a4,48c1c <__gethex+0x35a>
   48bd2:	470d                	li	a4,3
   48bd4:	04e78763          	beq	a5,a4,48c22 <__gethex+0x360>
   48bd8:	4705                	li	a4,1
   48bda:	02e79963          	bne	a5,a4,48c0c <__gethex+0x34a>
   48bde:	029a1763          	bne	s4,s1,48c0c <__gethex+0x34a>
   48be2:	00fa1f63          	bne	s4,a5,48c00 <__gethex+0x33e>
   48be6:	0049a783          	lw	a5,4(s3)
   48bea:	4742                	lw	a4,16(sp)
   48bec:	06200913          	li	s2,98
   48bf0:	c31c                	sw	a5,0(a4)
   48bf2:	4785                	li	a5,1
   48bf4:	c81c                	sw	a5,16(s0)
   48bf6:	00fba023          	sw	a5,0(s7)
   48bfa:	008c2023          	sw	s0,0(s8)
   48bfe:	b5a9                	j	48a48 <__gethex+0x186>
   48c00:	fffa0593          	add	a1,s4,-1
   48c04:	8522                	mv	a0,s0
   48c06:	7c1000ef          	jal	49bc6 <__any_on>
   48c0a:	fd71                	bnez	a0,48be6 <__gethex+0x324>
   48c0c:	4512                	lw	a0,4(sp)
   48c0e:	85a2                	mv	a1,s0
   48c10:	05000913          	li	s2,80
   48c14:	23a5                	jal	4917c <_Bfree>
   48c16:	000c2023          	sw	zero,0(s8)
   48c1a:	b53d                	j	48a48 <__gethex+0x186>
   48c1c:	fe0b18e3          	bnez	s6,48c0c <__gethex+0x34a>
   48c20:	b7d9                	j	48be6 <__gethex+0x324>
   48c22:	fc0b12e3          	bnez	s6,48be6 <__gethex+0x324>
   48c26:	b7dd                	j	48c0c <__gethex+0x34a>
   48c28:	fff48913          	add	s2,s1,-1
   48c2c:	060d1a63          	bnez	s10,48ca0 <__gethex+0x3de>
   48c30:	00090763          	beqz	s2,48c3e <__gethex+0x37c>
   48c34:	85ca                	mv	a1,s2
   48c36:	8522                	mv	a0,s0
   48c38:	78f000ef          	jal	49bc6 <__any_on>
   48c3c:	8d2a                	mv	s10,a0
   48c3e:	40595793          	sra	a5,s2,0x5
   48c42:	2177c7b3          	sh2add	a5,a5,s7
   48c46:	439c                	lw	a5,0(a5)
   48c48:	29201933          	bset	s2,zero,s2
   48c4c:	00f97933          	and	s2,s2,a5
   48c50:	00090463          	beqz	s2,48c58 <__gethex+0x396>
   48c54:	002d6d13          	or	s10,s10,2
   48c58:	85a6                	mv	a1,s1
   48c5a:	8522                	mv	a0,s0
   48c5c:	409a0a33          	sub	s4,s4,s1
   48c60:	b6fff0ef          	jal	487ce <rshift>
   48c64:	0049a483          	lw	s1,4(s3)
   48c68:	4909                	li	s2,2
   48c6a:	080d0963          	beqz	s10,48cfc <__gethex+0x43a>
   48c6e:	00c9a783          	lw	a5,12(s3)
   48c72:	4709                	li	a4,2
   48c74:	02e78a63          	beq	a5,a4,48ca8 <__gethex+0x3e6>
   48c78:	470d                	li	a4,3
   48c7a:	02e78a63          	beq	a5,a4,48cae <__gethex+0x3ec>
   48c7e:	4705                	li	a4,1
   48c80:	00e79d63          	bne	a5,a4,48c9a <__gethex+0x3d8>
   48c84:	002d7793          	and	a5,s10,2
   48c88:	cb89                	beqz	a5,48c9a <__gethex+0x3d8>
   48c8a:	000ba783          	lw	a5,0(s7)
   48c8e:	00fd6d33          	or	s10,s10,a5
   48c92:	001d7d13          	and	s10,s10,1
   48c96:	000d1e63          	bnez	s10,48cb2 <__gethex+0x3f0>
   48c9a:	01096913          	or	s2,s2,16
   48c9e:	a8b9                	j	48cfc <__gethex+0x43a>
   48ca0:	4d05                	li	s10,1
   48ca2:	bf71                	j	48c3e <__gethex+0x37c>
   48ca4:	4905                	li	s2,1
   48ca6:	b7d1                	j	48c6a <__gethex+0x3a8>
   48ca8:	4785                	li	a5,1
   48caa:	41678b33          	sub	s6,a5,s6
   48cae:	fe0b06e3          	beqz	s6,48c9a <__gethex+0x3d8>
   48cb2:	01042d03          	lw	s10,16(s0)
   48cb6:	01440793          	add	a5,s0,20
   48cba:	567d                	li	a2,-1
   48cbc:	002d1b13          	sll	s6,s10,0x2
   48cc0:	20fd46b3          	sh2add	a3,s10,a5
   48cc4:	4398                	lw	a4,0(a5)
   48cc6:	04c70063          	beq	a4,a2,48d06 <__gethex+0x444>
   48cca:	0705                	add	a4,a4,1
   48ccc:	c398                	sw	a4,0(a5)
   48cce:	4709                	li	a4,2
   48cd0:	01440793          	add	a5,s0,20
   48cd4:	08e91463          	bne	s2,a4,48d5c <__gethex+0x49a>
   48cd8:	0009a703          	lw	a4,0(s3)
   48cdc:	177d                	add	a4,a4,-1
   48cde:	01471d63          	bne	a4,s4,48cf8 <__gethex+0x436>
   48ce2:	405a5713          	sra	a4,s4,0x5
   48ce6:	20f747b3          	sh2add	a5,a4,a5
   48cea:	439c                	lw	a5,0(a5)
   48cec:	29401a33          	bset	s4,zero,s4
   48cf0:	00fa7a33          	and	s4,s4,a5
   48cf4:	080a1063          	bnez	s4,48d74 <__gethex+0x4b2>
   48cf8:	02096913          	or	s2,s2,32
   48cfc:	47c2                	lw	a5,16(sp)
   48cfe:	008c2023          	sw	s0,0(s8)
   48d02:	c384                	sw	s1,0(a5)
   48d04:	b391                	j	48a48 <__gethex+0x186>
   48d06:	0007a023          	sw	zero,0(a5)
   48d0a:	0791                	add	a5,a5,4
   48d0c:	fad7ece3          	bltu	a5,a3,48cc4 <__gethex+0x402>
   48d10:	441c                	lw	a5,8(s0)
   48d12:	02fd4c63          	blt	s10,a5,48d4a <__gethex+0x488>
   48d16:	404c                	lw	a1,4(s0)
   48d18:	4512                	lw	a0,4(sp)
   48d1a:	0585                	add	a1,a1,1
   48d1c:	2e5d                	jal	490d2 <_Balloc>
   48d1e:	8baa                	mv	s7,a0
   48d20:	e909                	bnez	a0,48d32 <__gethex+0x470>
   48d22:	0004b6b7          	lui	a3,0x4b
   48d26:	e2868693          	add	a3,a3,-472 # 4ae28 <__clz_tab+0x374>
   48d2a:	4601                	li	a2,0
   48d2c:	08400593          	li	a1,132
   48d30:	bbb1                	j	48a8c <__gethex+0x1ca>
   48d32:	4810                	lw	a2,16(s0)
   48d34:	00c40593          	add	a1,s0,12
   48d38:	0531                	add	a0,a0,12
   48d3a:	0609                	add	a2,a2,2
   48d3c:	060a                	sll	a2,a2,0x2
   48d3e:	950fa0ef          	jal	42e8e <memcpy>
   48d42:	4512                	lw	a0,4(sp)
   48d44:	85a2                	mv	a1,s0
   48d46:	845e                	mv	s0,s7
   48d48:	2915                	jal	4917c <_Bfree>
   48d4a:	481c                	lw	a5,16(s0)
   48d4c:	00178713          	add	a4,a5,1
   48d50:	c818                	sw	a4,16(s0)
   48d52:	4705                	li	a4,1
   48d54:	2087c7b3          	sh2add	a5,a5,s0
   48d58:	cbd8                	sw	a4,20(a5)
   48d5a:	bf95                	j	48cce <__gethex+0x40c>
   48d5c:	4818                	lw	a4,16(s0)
   48d5e:	00ed5d63          	bge	s10,a4,48d78 <__gethex+0x4b6>
   48d62:	4585                	li	a1,1
   48d64:	8522                	mv	a0,s0
   48d66:	a69ff0ef          	jal	487ce <rshift>
   48d6a:	0089a783          	lw	a5,8(s3)
   48d6e:	0485                	add	s1,s1,1
   48d70:	da97c6e3          	blt	a5,s1,48b1c <__gethex+0x25a>
   48d74:	4905                	li	s2,1
   48d76:	b749                	j	48cf8 <__gethex+0x436>
   48d78:	01fa7a13          	and	s4,s4,31
   48d7c:	fe0a0ce3          	beqz	s4,48d74 <__gethex+0x4b2>
   48d80:	97da                	add	a5,a5,s6
   48d82:	ffc7a503          	lw	a0,-4(a5)
   48d86:	2bc9                	jal	49358 <__hi0bits>
   48d88:	02000793          	li	a5,32
   48d8c:	414787b3          	sub	a5,a5,s4
   48d90:	fcf549e3          	blt	a0,a5,48d62 <__gethex+0x4a0>
   48d94:	b7c5                	j	48d74 <__gethex+0x4b2>

00048d96 <L_shift>:
   48d96:	47a1                	li	a5,8
   48d98:	40c78633          	sub	a2,a5,a2
   48d9c:	060a                	sll	a2,a2,0x2
   48d9e:	02000693          	li	a3,32
   48da2:	8e91                	sub	a3,a3,a2
   48da4:	415c                	lw	a5,4(a0)
   48da6:	4118                	lw	a4,0(a0)
   48da8:	00d79833          	sll	a6,a5,a3
   48dac:	01076733          	or	a4,a4,a6
   48db0:	00c7d7b3          	srl	a5,a5,a2
   48db4:	c118                	sw	a4,0(a0)
   48db6:	c15c                	sw	a5,4(a0)
   48db8:	0511                	add	a0,a0,4
   48dba:	feb565e3          	bltu	a0,a1,48da4 <L_shift+0xe>
   48dbe:	8082                	ret

00048dc0 <__match>:
   48dc0:	411c                	lw	a5,0(a0)
   48dc2:	4865                	li	a6,25
   48dc4:	0005c603          	lbu	a2,0(a1)
   48dc8:	0585                	add	a1,a1,1
   48dca:	0785                	add	a5,a5,1
   48dcc:	e601                	bnez	a2,48dd4 <__match+0x14>
   48dce:	c11c                	sw	a5,0(a0)
   48dd0:	4505                	li	a0,1
   48dd2:	8082                	ret
   48dd4:	0007c703          	lbu	a4,0(a5)
   48dd8:	fbf70693          	add	a3,a4,-65
   48ddc:	0ff6f693          	zext.b	a3,a3
   48de0:	00d86463          	bltu	a6,a3,48de8 <__match+0x28>
   48de4:	02070713          	add	a4,a4,32
   48de8:	fcc70ee3          	beq	a4,a2,48dc4 <__match+0x4>
   48dec:	4501                	li	a0,0
   48dee:	8082                	ret

00048df0 <__hexnan>:
   48df0:	715d                	add	sp,sp,-80
   48df2:	dc52                	sw	s4,56(sp)
   48df4:	0005aa03          	lw	s4,0(a1)
   48df8:	c2a6                	sw	s1,68(sp)
   48dfa:	de4e                	sw	s3,60(sp)
   48dfc:	405a5493          	sra	s1,s4,0x5
   48e00:	da56                	sw	s5,52(sp)
   48e02:	c686                	sw	ra,76(sp)
   48e04:	c4a2                	sw	s0,72(sp)
   48e06:	c0ca                	sw	s2,64(sp)
   48e08:	d85a                	sw	s6,48(sp)
   48e0a:	d65e                	sw	s7,44(sp)
   48e0c:	d462                	sw	s8,40(sp)
   48e0e:	d266                	sw	s9,36(sp)
   48e10:	d06a                	sw	s10,32(sp)
   48e12:	ce6e                	sw	s11,28(sp)
   48e14:	01fa7a13          	and	s4,s4,31
   48e18:	8aaa                	mv	s5,a0
   48e1a:	89b2                	mv	s3,a2
   48e1c:	20c4c4b3          	sh2add	s1,s1,a2
   48e20:	000a0363          	beqz	s4,48e26 <__hexnan+0x36>
   48e24:	0491                	add	s1,s1,4
   48e26:	000aa783          	lw	a5,0(s5)
   48e2a:	ffc48913          	add	s2,s1,-4
   48e2e:	fe04ae23          	sw	zero,-4(s1)
   48e32:	8dca                	mv	s11,s2
   48e34:	844a                	mv	s0,s2
   48e36:	4601                	li	a2,0
   48e38:	4b01                	li	s6,0
   48e3a:	4b81                	li	s7,0
   48e3c:	4c21                	li	s8,8
   48e3e:	02000c93          	li	s9,32
   48e42:	4d1d                	li	s10,7
   48e44:	0017c683          	lbu	a3,1(a5)
   48e48:	00178713          	add	a4,a5,1
   48e4c:	c03a                	sw	a4,0(sp)
   48e4e:	cab1                	beqz	a3,48ea2 <__hexnan+0xb2>
   48e50:	8536                	mv	a0,a3
   48e52:	c632                	sw	a2,12(sp)
   48e54:	c43e                	sw	a5,8(sp)
   48e56:	c236                	sw	a3,4(sp)
   48e58:	a29ff0ef          	jal	48880 <__hexdig_fun>
   48e5c:	4632                	lw	a2,12(sp)
   48e5e:	e169                	bnez	a0,48f20 <__hexnan+0x130>
   48e60:	4692                	lw	a3,4(sp)
   48e62:	47a2                	lw	a5,8(sp)
   48e64:	02dce863          	bltu	s9,a3,48e94 <__hexnan+0xa4>
   48e68:	037b5463          	bge	s6,s7,48e90 <__hexnan+0xa0>
   48e6c:	01b47863          	bgeu	s0,s11,48e7c <__hexnan+0x8c>
   48e70:	00cd4663          	blt	s10,a2,48e7c <__hexnan+0x8c>
   48e74:	85ee                	mv	a1,s11
   48e76:	8522                	mv	a0,s0
   48e78:	f1fff0ef          	jal	48d96 <L_shift>
   48e7c:	4621                	li	a2,8
   48e7e:	0089f963          	bgeu	s3,s0,48e90 <__hexnan+0xa0>
   48e82:	ffc40d93          	add	s11,s0,-4
   48e86:	fe042e23          	sw	zero,-4(s0)
   48e8a:	8b5e                	mv	s6,s7
   48e8c:	846e                	mv	s0,s11
   48e8e:	4601                	li	a2,0
   48e90:	4782                	lw	a5,0(sp)
   48e92:	bf4d                	j	48e44 <__hexnan+0x54>
   48e94:	02900593          	li	a1,41
   48e98:	0cb69563          	bne	a3,a1,48f62 <__hexnan+0x172>
   48e9c:	0789                	add	a5,a5,2
   48e9e:	00faa023          	sw	a5,0(s5)
   48ea2:	0c0b8063          	beqz	s7,48f62 <__hexnan+0x172>
   48ea6:	01b47963          	bgeu	s0,s11,48eb8 <__hexnan+0xc8>
   48eaa:	479d                	li	a5,7
   48eac:	00c7c663          	blt	a5,a2,48eb8 <__hexnan+0xc8>
   48eb0:	85ee                	mv	a1,s11
   48eb2:	8522                	mv	a0,s0
   48eb4:	ee3ff0ef          	jal	48d96 <L_shift>
   48eb8:	0889f463          	bgeu	s3,s0,48f40 <__hexnan+0x150>
   48ebc:	874e                	mv	a4,s3
   48ebe:	87a2                	mv	a5,s0
   48ec0:	4394                	lw	a3,0(a5)
   48ec2:	0791                	add	a5,a5,4
   48ec4:	c314                	sw	a3,0(a4)
   48ec6:	0711                	add	a4,a4,4
   48ec8:	fef97ce3          	bgeu	s2,a5,48ec0 <__hexnan+0xd0>
   48ecc:	00140713          	add	a4,s0,1
   48ed0:	14f5                	add	s1,s1,-3
   48ed2:	4791                	li	a5,4
   48ed4:	00e4e863          	bltu	s1,a4,48ee4 <__hexnan+0xf4>
   48ed8:	40890433          	sub	s0,s2,s0
   48edc:	9879                	and	s0,s0,-2
   48ede:	9875                	and	s0,s0,-3
   48ee0:	00440793          	add	a5,s0,4
   48ee4:	97ce                	add	a5,a5,s3
   48ee6:	0007a023          	sw	zero,0(a5)
   48eea:	0791                	add	a5,a5,4
   48eec:	fef97de3          	bgeu	s2,a5,48ee6 <__hexnan+0xf6>
   48ef0:	00092783          	lw	a5,0(s2)
   48ef4:	e791                	bnez	a5,48f00 <__hexnan+0x110>
   48ef6:	07391463          	bne	s2,s3,48f5e <__hexnan+0x16e>
   48efa:	4785                	li	a5,1
   48efc:	00f92023          	sw	a5,0(s2)
   48f00:	4515                	li	a0,5
   48f02:	40b6                	lw	ra,76(sp)
   48f04:	4426                	lw	s0,72(sp)
   48f06:	4496                	lw	s1,68(sp)
   48f08:	4906                	lw	s2,64(sp)
   48f0a:	59f2                	lw	s3,60(sp)
   48f0c:	5a62                	lw	s4,56(sp)
   48f0e:	5ad2                	lw	s5,52(sp)
   48f10:	5b42                	lw	s6,48(sp)
   48f12:	5bb2                	lw	s7,44(sp)
   48f14:	5c22                	lw	s8,40(sp)
   48f16:	5c92                	lw	s9,36(sp)
   48f18:	5d02                	lw	s10,32(sp)
   48f1a:	4df2                	lw	s11,28(sp)
   48f1c:	6161                	add	sp,sp,80
   48f1e:	8082                	ret
   48f20:	0605                	add	a2,a2,1
   48f22:	0b85                	add	s7,s7,1
   48f24:	00cc5863          	bge	s8,a2,48f34 <__hexnan+0x144>
   48f28:	f689f4e3          	bgeu	s3,s0,48e90 <__hexnan+0xa0>
   48f2c:	fe042e23          	sw	zero,-4(s0)
   48f30:	4605                	li	a2,1
   48f32:	1471                	add	s0,s0,-4
   48f34:	401c                	lw	a5,0(s0)
   48f36:	893d                	and	a0,a0,15
   48f38:	0792                	sll	a5,a5,0x4
   48f3a:	8fc9                	or	a5,a5,a0
   48f3c:	c01c                	sw	a5,0(s0)
   48f3e:	bf89                	j	48e90 <__hexnan+0xa0>
   48f40:	fa0a08e3          	beqz	s4,48ef0 <__hexnan+0x100>
   48f44:	02000793          	li	a5,32
   48f48:	414787b3          	sub	a5,a5,s4
   48f4c:	577d                	li	a4,-1
   48f4e:	00f75733          	srl	a4,a4,a5
   48f52:	ffc4a783          	lw	a5,-4(s1)
   48f56:	8ff9                	and	a5,a5,a4
   48f58:	fef4ae23          	sw	a5,-4(s1)
   48f5c:	bf51                	j	48ef0 <__hexnan+0x100>
   48f5e:	1971                	add	s2,s2,-4
   48f60:	bf41                	j	48ef0 <__hexnan+0x100>
   48f62:	4511                	li	a0,4
   48f64:	bf79                	j	48f02 <__hexnan+0x112>

00048f66 <_localeconv_r>:
   48f66:	95018513          	add	a0,gp,-1712 # 12d0150 <__global_locale+0xf0>
   48f6a:	8082                	ret

00048f6c <__swhatbuf_r>:
   48f6c:	7159                	add	sp,sp,-112
   48f6e:	d4a2                	sw	s0,104(sp)
   48f70:	842e                	mv	s0,a1
   48f72:	00e59583          	lh	a1,14(a1)
   48f76:	d2a6                	sw	s1,100(sp)
   48f78:	d0ca                	sw	s2,96(sp)
   48f7a:	d686                	sw	ra,108(sp)
   48f7c:	84b2                	mv	s1,a2
   48f7e:	8936                	mv	s2,a3
   48f80:	0205d363          	bgez	a1,48fa6 <__swhatbuf_r+0x3a>
   48f84:	00c45783          	lhu	a5,12(s0)
   48f88:	0807f793          	and	a5,a5,128
   48f8c:	eb95                	bnez	a5,48fc0 <__swhatbuf_r+0x54>
   48f8e:	40000713          	li	a4,1024
   48f92:	50b6                	lw	ra,108(sp)
   48f94:	5426                	lw	s0,104(sp)
   48f96:	00f92023          	sw	a5,0(s2)
   48f9a:	c098                	sw	a4,0(s1)
   48f9c:	5906                	lw	s2,96(sp)
   48f9e:	5496                	lw	s1,100(sp)
   48fa0:	4501                	li	a0,0
   48fa2:	6165                	add	sp,sp,112
   48fa4:	8082                	ret
   48fa6:	0030                	add	a2,sp,8
   48fa8:	039010ef          	jal	4a7e0 <_fstat_r>
   48fac:	fc054ce3          	bltz	a0,48f84 <__swhatbuf_r+0x18>
   48fb0:	4732                	lw	a4,12(sp)
   48fb2:	67bd                	lui	a5,0xf
   48fb4:	8ff9                	and	a5,a5,a4
   48fb6:	7779                	lui	a4,0xffffe
   48fb8:	97ba                	add	a5,a5,a4
   48fba:	0017b793          	seqz	a5,a5
   48fbe:	bfc1                	j	48f8e <__swhatbuf_r+0x22>
   48fc0:	4781                	li	a5,0
   48fc2:	04000713          	li	a4,64
   48fc6:	b7f1                	j	48f92 <__swhatbuf_r+0x26>

00048fc8 <__smakebuf_r>:
   48fc8:	00c5d783          	lhu	a5,12(a1)
   48fcc:	7179                	add	sp,sp,-48
   48fce:	d422                	sw	s0,40(sp)
   48fd0:	d606                	sw	ra,44(sp)
   48fd2:	d226                	sw	s1,36(sp)
   48fd4:	d04a                	sw	s2,32(sp)
   48fd6:	ce4e                	sw	s3,28(sp)
   48fd8:	8b89                	and	a5,a5,2
   48fda:	842e                	mv	s0,a1
   48fdc:	cf91                	beqz	a5,48ff8 <__smakebuf_r+0x30>
   48fde:	04740793          	add	a5,s0,71
   48fe2:	c01c                	sw	a5,0(s0)
   48fe4:	c81c                	sw	a5,16(s0)
   48fe6:	4785                	li	a5,1
   48fe8:	c85c                	sw	a5,20(s0)
   48fea:	50b2                	lw	ra,44(sp)
   48fec:	5422                	lw	s0,40(sp)
   48fee:	5492                	lw	s1,36(sp)
   48ff0:	5902                	lw	s2,32(sp)
   48ff2:	49f2                	lw	s3,28(sp)
   48ff4:	6145                	add	sp,sp,48
   48ff6:	8082                	ret
   48ff8:	0074                	add	a3,sp,12
   48ffa:	0030                	add	a2,sp,8
   48ffc:	84aa                	mv	s1,a0
   48ffe:	f6fff0ef          	jal	48f6c <__swhatbuf_r>
   49002:	49a2                	lw	s3,8(sp)
   49004:	892a                	mv	s2,a0
   49006:	8526                	mv	a0,s1
   49008:	85ce                	mv	a1,s3
   4900a:	4d7000ef          	jal	49ce0 <_malloc_r>
   4900e:	ed09                	bnez	a0,49028 <__smakebuf_r+0x60>
   49010:	00c41783          	lh	a5,12(s0)
   49014:	2007f713          	and	a4,a5,512
   49018:	fb69                	bnez	a4,48fea <__smakebuf_r+0x22>
   4901a:	9bf9                	and	a5,a5,-2
   4901c:	9bf5                	and	a5,a5,-3
   4901e:	0027e793          	or	a5,a5,2
   49022:	00f41623          	sh	a5,12(s0)
   49026:	bf65                	j	48fde <__smakebuf_r+0x16>
   49028:	000487b7          	lui	a5,0x48
   4902c:	60078793          	add	a5,a5,1536 # 48600 <_cleanup_r>
   49030:	d49c                	sw	a5,40(s1)
   49032:	00c45783          	lhu	a5,12(s0)
   49036:	c008                	sw	a0,0(s0)
   49038:	c808                	sw	a0,16(s0)
   4903a:	0807e793          	or	a5,a5,128
   4903e:	00f41623          	sh	a5,12(s0)
   49042:	47b2                	lw	a5,12(sp)
   49044:	01342a23          	sw	s3,20(s0)
   49048:	cf99                	beqz	a5,49066 <__smakebuf_r+0x9e>
   4904a:	00e41583          	lh	a1,14(s0)
   4904e:	8526                	mv	a0,s1
   49050:	7be010ef          	jal	4a80e <_isatty_r>
   49054:	c909                	beqz	a0,49066 <__smakebuf_r+0x9e>
   49056:	00c45783          	lhu	a5,12(s0)
   4905a:	9bf9                	and	a5,a5,-2
   4905c:	9bf5                	and	a5,a5,-3
   4905e:	0017e793          	or	a5,a5,1
   49062:	00f41623          	sh	a5,12(s0)
   49066:	00c45783          	lhu	a5,12(s0)
   4906a:	0127e533          	or	a0,a5,s2
   4906e:	00a41623          	sh	a0,12(s0)
   49072:	bfa5                	j	48fea <__smakebuf_r+0x22>

00049074 <malloc>:
   49074:	85aa                	mv	a1,a0
   49076:	9d01a503          	lw	a0,-1584(gp) # 12d01d0 <_impure_ptr>
   4907a:	4670006f          	j	49ce0 <_malloc_r>

0004907e <__ascii_mbtowc>:
   4907e:	e185                	bnez	a1,4909e <__ascii_mbtowc+0x20>
   49080:	1141                	add	sp,sp,-16
   49082:	006c                	add	a1,sp,12
   49084:	4501                	li	a0,0
   49086:	ca11                	beqz	a2,4909a <__ascii_mbtowc+0x1c>
   49088:	5579                	li	a0,-2
   4908a:	ca81                	beqz	a3,4909a <__ascii_mbtowc+0x1c>
   4908c:	00064783          	lbu	a5,0(a2)
   49090:	c19c                	sw	a5,0(a1)
   49092:	00064503          	lbu	a0,0(a2)
   49096:	00a03533          	snez	a0,a0
   4909a:	0141                	add	sp,sp,16
   4909c:	8082                	ret
   4909e:	4501                	li	a0,0
   490a0:	ca19                	beqz	a2,490b6 <__ascii_mbtowc+0x38>
   490a2:	5579                	li	a0,-2
   490a4:	ca89                	beqz	a3,490b6 <__ascii_mbtowc+0x38>
   490a6:	00064783          	lbu	a5,0(a2)
   490aa:	c19c                	sw	a5,0(a1)
   490ac:	00064503          	lbu	a0,0(a2)
   490b0:	00a03533          	snez	a0,a0
   490b4:	8082                	ret
   490b6:	8082                	ret

000490b8 <memchr>:
   490b8:	0ff5f593          	zext.b	a1,a1
   490bc:	962a                	add	a2,a2,a0
   490be:	00c51463          	bne	a0,a2,490c6 <memchr+0xe>
   490c2:	4501                	li	a0,0
   490c4:	8082                	ret
   490c6:	00054783          	lbu	a5,0(a0)
   490ca:	feb78de3          	beq	a5,a1,490c4 <memchr+0xc>
   490ce:	0505                	add	a0,a0,1
   490d0:	b7fd                	j	490be <memchr+0x6>

000490d2 <_Balloc>:
   490d2:	515c                	lw	a5,36(a0)
   490d4:	1141                	add	sp,sp,-16
   490d6:	c422                	sw	s0,8(sp)
   490d8:	c226                	sw	s1,4(sp)
   490da:	c606                	sw	ra,12(sp)
   490dc:	c04a                	sw	s2,0(sp)
   490de:	842a                	mv	s0,a0
   490e0:	84ae                	mv	s1,a1
   490e2:	eb9d                	bnez	a5,49118 <_Balloc+0x46>
   490e4:	4541                	li	a0,16
   490e6:	f8fff0ef          	jal	49074 <malloc>
   490ea:	d048                	sw	a0,36(s0)
   490ec:	ed11                	bnez	a0,49108 <_Balloc+0x36>
   490ee:	0004b6b7          	lui	a3,0x4b
   490f2:	0004b537          	lui	a0,0x4b
   490f6:	dc468693          	add	a3,a3,-572 # 4adc4 <__clz_tab+0x310>
   490fa:	4601                	li	a2,0
   490fc:	06600593          	li	a1,102
   49100:	ea050513          	add	a0,a0,-352 # 4aea0 <__clz_tab+0x3ec>
   49104:	652010ef          	jal	4a756 <__assert_func>
   49108:	00052223          	sw	zero,4(a0)
   4910c:	00052423          	sw	zero,8(a0)
   49110:	00052023          	sw	zero,0(a0)
   49114:	00052623          	sw	zero,12(a0)
   49118:	02442903          	lw	s2,36(s0)
   4911c:	00c92783          	lw	a5,12(s2)
   49120:	c78d                	beqz	a5,4914a <_Balloc+0x78>
   49122:	505c                	lw	a5,36(s0)
   49124:	47dc                	lw	a5,12(a5)
   49126:	20f4c7b3          	sh2add	a5,s1,a5
   4912a:	4388                	lw	a0,0(a5)
   4912c:	e129                	bnez	a0,4916e <_Balloc+0x9c>
   4912e:	28901933          	bset	s2,zero,s1
   49132:	00590613          	add	a2,s2,5
   49136:	060a                	sll	a2,a2,0x2
   49138:	4585                	li	a1,1
   4913a:	8522                	mv	a0,s0
   4913c:	2cf000ef          	jal	49c0a <_calloc_r>
   49140:	c105                	beqz	a0,49160 <_Balloc+0x8e>
   49142:	c144                	sw	s1,4(a0)
   49144:	01252423          	sw	s2,8(a0)
   49148:	a02d                	j	49172 <_Balloc+0xa0>
   4914a:	02100613          	li	a2,33
   4914e:	4591                	li	a1,4
   49150:	8522                	mv	a0,s0
   49152:	2b9000ef          	jal	49c0a <_calloc_r>
   49156:	505c                	lw	a5,36(s0)
   49158:	00a92623          	sw	a0,12(s2)
   4915c:	47dc                	lw	a5,12(a5)
   4915e:	f3f1                	bnez	a5,49122 <_Balloc+0x50>
   49160:	4501                	li	a0,0
   49162:	40b2                	lw	ra,12(sp)
   49164:	4422                	lw	s0,8(sp)
   49166:	4492                	lw	s1,4(sp)
   49168:	4902                	lw	s2,0(sp)
   4916a:	0141                	add	sp,sp,16
   4916c:	8082                	ret
   4916e:	4118                	lw	a4,0(a0)
   49170:	c398                	sw	a4,0(a5)
   49172:	00052823          	sw	zero,16(a0)
   49176:	00052623          	sw	zero,12(a0)
   4917a:	b7e5                	j	49162 <_Balloc+0x90>

0004917c <_Bfree>:
   4917c:	515c                	lw	a5,36(a0)
   4917e:	1141                	add	sp,sp,-16
   49180:	c422                	sw	s0,8(sp)
   49182:	c226                	sw	s1,4(sp)
   49184:	c606                	sw	ra,12(sp)
   49186:	84aa                	mv	s1,a0
   49188:	842e                	mv	s0,a1
   4918a:	eb9d                	bnez	a5,491c0 <_Bfree+0x44>
   4918c:	4541                	li	a0,16
   4918e:	ee7ff0ef          	jal	49074 <malloc>
   49192:	d0c8                	sw	a0,36(s1)
   49194:	ed11                	bnez	a0,491b0 <_Bfree+0x34>
   49196:	0004b6b7          	lui	a3,0x4b
   4919a:	0004b537          	lui	a0,0x4b
   4919e:	dc468693          	add	a3,a3,-572 # 4adc4 <__clz_tab+0x310>
   491a2:	4601                	li	a2,0
   491a4:	08a00593          	li	a1,138
   491a8:	ea050513          	add	a0,a0,-352 # 4aea0 <__clz_tab+0x3ec>
   491ac:	5aa010ef          	jal	4a756 <__assert_func>
   491b0:	00052223          	sw	zero,4(a0)
   491b4:	00052423          	sw	zero,8(a0)
   491b8:	00052023          	sw	zero,0(a0)
   491bc:	00052623          	sw	zero,12(a0)
   491c0:	c809                	beqz	s0,491d2 <_Bfree+0x56>
   491c2:	50d8                	lw	a4,36(s1)
   491c4:	405c                	lw	a5,4(s0)
   491c6:	4758                	lw	a4,12(a4)
   491c8:	20e7c7b3          	sh2add	a5,a5,a4
   491cc:	4398                	lw	a4,0(a5)
   491ce:	c018                	sw	a4,0(s0)
   491d0:	c380                	sw	s0,0(a5)
   491d2:	40b2                	lw	ra,12(sp)
   491d4:	4422                	lw	s0,8(sp)
   491d6:	4492                	lw	s1,4(sp)
   491d8:	0141                	add	sp,sp,16
   491da:	8082                	ret

000491dc <__multadd>:
   491dc:	1101                	add	sp,sp,-32
   491de:	cc22                	sw	s0,24(sp)
   491e0:	c84a                	sw	s2,16(sp)
   491e2:	c64e                	sw	s3,12(sp)
   491e4:	0105a903          	lw	s2,16(a1)
   491e8:	842e                	mv	s0,a1
   491ea:	89b6                	mv	s3,a3
   491ec:	01458693          	add	a3,a1,20
   491f0:	65c1                	lui	a1,0x10
   491f2:	ca26                	sw	s1,20(sp)
   491f4:	ce06                	sw	ra,28(sp)
   491f6:	84aa                	mv	s1,a0
   491f8:	c452                	sw	s4,8(sp)
   491fa:	4501                	li	a0,0
   491fc:	15fd                	add	a1,a1,-1 # ffff <__fw_size__+0x4d27>
   491fe:	429c                	lw	a5,0(a3)
   49200:	0505                	add	a0,a0,1
   49202:	00b7f733          	and	a4,a5,a1
   49206:	02c70733          	mul	a4,a4,a2
   4920a:	83c1                	srl	a5,a5,0x10
   4920c:	02c787b3          	mul	a5,a5,a2
   49210:	974e                	add	a4,a4,s3
   49212:	01075813          	srl	a6,a4,0x10
   49216:	8f6d                	and	a4,a4,a1
   49218:	97c2                	add	a5,a5,a6
   4921a:	0107d993          	srl	s3,a5,0x10
   4921e:	07c2                	sll	a5,a5,0x10
   49220:	97ba                	add	a5,a5,a4
   49222:	c29c                	sw	a5,0(a3)
   49224:	0691                	add	a3,a3,4
   49226:	fd254ce3          	blt	a0,s2,491fe <__multadd+0x22>
   4922a:	04098d63          	beqz	s3,49284 <__multadd+0xa8>
   4922e:	441c                	lw	a5,8(s0)
   49230:	04f94363          	blt	s2,a5,49276 <__multadd+0x9a>
   49234:	404c                	lw	a1,4(s0)
   49236:	8526                	mv	a0,s1
   49238:	0585                	add	a1,a1,1
   4923a:	e99ff0ef          	jal	490d2 <_Balloc>
   4923e:	8a2a                	mv	s4,a0
   49240:	ed11                	bnez	a0,4925c <__multadd+0x80>
   49242:	0004b6b7          	lui	a3,0x4b
   49246:	0004b537          	lui	a0,0x4b
   4924a:	e2868693          	add	a3,a3,-472 # 4ae28 <__clz_tab+0x374>
   4924e:	4601                	li	a2,0
   49250:	0b500593          	li	a1,181
   49254:	ea050513          	add	a0,a0,-352 # 4aea0 <__clz_tab+0x3ec>
   49258:	4fe010ef          	jal	4a756 <__assert_func>
   4925c:	4810                	lw	a2,16(s0)
   4925e:	00c40593          	add	a1,s0,12
   49262:	0531                	add	a0,a0,12
   49264:	0609                	add	a2,a2,2
   49266:	060a                	sll	a2,a2,0x2
   49268:	c27f90ef          	jal	42e8e <memcpy>
   4926c:	85a2                	mv	a1,s0
   4926e:	8526                	mv	a0,s1
   49270:	f0dff0ef          	jal	4917c <_Bfree>
   49274:	8452                	mv	s0,s4
   49276:	208947b3          	sh2add	a5,s2,s0
   4927a:	0905                	add	s2,s2,1
   4927c:	0137aa23          	sw	s3,20(a5)
   49280:	01242823          	sw	s2,16(s0)
   49284:	40f2                	lw	ra,28(sp)
   49286:	8522                	mv	a0,s0
   49288:	4462                	lw	s0,24(sp)
   4928a:	44d2                	lw	s1,20(sp)
   4928c:	4942                	lw	s2,16(sp)
   4928e:	49b2                	lw	s3,12(sp)
   49290:	4a22                	lw	s4,8(sp)
   49292:	6105                	add	sp,sp,32
   49294:	8082                	ret

00049296 <__s2b>:
   49296:	1101                	add	sp,sp,-32
   49298:	c452                	sw	s4,8(sp)
   4929a:	00868793          	add	a5,a3,8
   4929e:	8a3a                	mv	s4,a4
   492a0:	4725                	li	a4,9
   492a2:	02e7c7b3          	div	a5,a5,a4
   492a6:	cc22                	sw	s0,24(sp)
   492a8:	ca26                	sw	s1,20(sp)
   492aa:	c84a                	sw	s2,16(sp)
   492ac:	c64e                	sw	s3,12(sp)
   492ae:	842e                	mv	s0,a1
   492b0:	ce06                	sw	ra,28(sp)
   492b2:	c256                	sw	s5,4(sp)
   492b4:	892a                	mv	s2,a0
   492b6:	84b2                	mv	s1,a2
   492b8:	89b6                	mv	s3,a3
   492ba:	4705                	li	a4,1
   492bc:	4581                	li	a1,0
   492be:	02f74363          	blt	a4,a5,492e4 <__s2b+0x4e>
   492c2:	854a                	mv	a0,s2
   492c4:	e0fff0ef          	jal	490d2 <_Balloc>
   492c8:	e10d                	bnez	a0,492ea <__s2b+0x54>
   492ca:	0004b6b7          	lui	a3,0x4b
   492ce:	0004b537          	lui	a0,0x4b
   492d2:	e2868693          	add	a3,a3,-472 # 4ae28 <__clz_tab+0x374>
   492d6:	4601                	li	a2,0
   492d8:	0ce00593          	li	a1,206
   492dc:	ea050513          	add	a0,a0,-352 # 4aea0 <__clz_tab+0x3ec>
   492e0:	476010ef          	jal	4a756 <__assert_func>
   492e4:	0706                	sll	a4,a4,0x1
   492e6:	0585                	add	a1,a1,1
   492e8:	bfd9                	j	492be <__s2b+0x28>
   492ea:	4785                	li	a5,1
   492ec:	c91c                	sw	a5,16(a0)
   492ee:	01452a23          	sw	s4,20(a0)
   492f2:	47a5                	li	a5,9
   492f4:	0497d163          	bge	a5,s1,49336 <__s2b+0xa0>
   492f8:	00940a93          	add	s5,s0,9
   492fc:	8a56                	mv	s4,s5
   492fe:	9426                	add	s0,s0,s1
   49300:	000a4683          	lbu	a3,0(s4)
   49304:	0a05                	add	s4,s4,1
   49306:	85aa                	mv	a1,a0
   49308:	fd068693          	add	a3,a3,-48
   4930c:	4629                	li	a2,10
   4930e:	854a                	mv	a0,s2
   49310:	ecdff0ef          	jal	491dc <__multadd>
   49314:	fe8a16e3          	bne	s4,s0,49300 <__s2b+0x6a>
   49318:	ff848413          	add	s0,s1,-8
   4931c:	9456                	add	s0,s0,s5
   4931e:	8a26                	mv	s4,s1
   49320:	013a4e63          	blt	s4,s3,4933c <__s2b+0xa6>
   49324:	40f2                	lw	ra,28(sp)
   49326:	4462                	lw	s0,24(sp)
   49328:	44d2                	lw	s1,20(sp)
   4932a:	4942                	lw	s2,16(sp)
   4932c:	49b2                	lw	s3,12(sp)
   4932e:	4a22                	lw	s4,8(sp)
   49330:	4a92                	lw	s5,4(sp)
   49332:	6105                	add	sp,sp,32
   49334:	8082                	ret
   49336:	0429                	add	s0,s0,10
   49338:	44a5                	li	s1,9
   4933a:	b7d5                	j	4931e <__s2b+0x88>
   4933c:	409a07b3          	sub	a5,s4,s1
   49340:	97a2                	add	a5,a5,s0
   49342:	0007c683          	lbu	a3,0(a5)
   49346:	85aa                	mv	a1,a0
   49348:	4629                	li	a2,10
   4934a:	fd068693          	add	a3,a3,-48
   4934e:	854a                	mv	a0,s2
   49350:	e8dff0ef          	jal	491dc <__multadd>
   49354:	0a05                	add	s4,s4,1
   49356:	b7e9                	j	49320 <__s2b+0x8a>

00049358 <__hi0bits>:
   49358:	87aa                	mv	a5,a0
   4935a:	6741                	lui	a4,0x10
   4935c:	4501                	li	a0,0
   4935e:	00e7f463          	bgeu	a5,a4,49366 <__hi0bits+0xe>
   49362:	07c2                	sll	a5,a5,0x10
   49364:	4541                	li	a0,16
   49366:	01000737          	lui	a4,0x1000
   4936a:	00e7f463          	bgeu	a5,a4,49372 <__hi0bits+0x1a>
   4936e:	0521                	add	a0,a0,8
   49370:	07a2                	sll	a5,a5,0x8
   49372:	10000737          	lui	a4,0x10000
   49376:	00e7f463          	bgeu	a5,a4,4937e <__hi0bits+0x26>
   4937a:	0511                	add	a0,a0,4
   4937c:	0792                	sll	a5,a5,0x4
   4937e:	40000737          	lui	a4,0x40000
   49382:	00e7f463          	bgeu	a5,a4,4938a <__hi0bits+0x32>
   49386:	0509                	add	a0,a0,2
   49388:	078a                	sll	a5,a5,0x2
   4938a:	0007c963          	bltz	a5,4939c <__hi0bits+0x44>
   4938e:	00179713          	sll	a4,a5,0x1
   49392:	0505                	add	a0,a0,1
   49394:	00074463          	bltz	a4,4939c <__hi0bits+0x44>
   49398:	02000513          	li	a0,32
   4939c:	8082                	ret

0004939e <__lo0bits>:
   4939e:	411c                	lw	a5,0(a0)
   493a0:	872a                	mv	a4,a0
   493a2:	0077f693          	and	a3,a5,7
   493a6:	c285                	beqz	a3,493c6 <__lo0bits+0x28>
   493a8:	0017f693          	and	a3,a5,1
   493ac:	4501                	li	a0,0
   493ae:	eab9                	bnez	a3,49404 <__lo0bits+0x66>
   493b0:	0027f693          	and	a3,a5,2
   493b4:	c689                	beqz	a3,493be <__lo0bits+0x20>
   493b6:	8385                	srl	a5,a5,0x1
   493b8:	c31c                	sw	a5,0(a4)
   493ba:	4505                	li	a0,1
   493bc:	8082                	ret
   493be:	8389                	srl	a5,a5,0x2
   493c0:	c31c                	sw	a5,0(a4)
   493c2:	4509                	li	a0,2
   493c4:	8082                	ret
   493c6:	4501                	li	a0,0
   493c8:	0807c6b3          	zext.h	a3,a5
   493cc:	e299                	bnez	a3,493d2 <__lo0bits+0x34>
   493ce:	83c1                	srl	a5,a5,0x10
   493d0:	4541                	li	a0,16
   493d2:	0ff7f693          	zext.b	a3,a5
   493d6:	e299                	bnez	a3,493dc <__lo0bits+0x3e>
   493d8:	0521                	add	a0,a0,8
   493da:	83a1                	srl	a5,a5,0x8
   493dc:	00f7f693          	and	a3,a5,15
   493e0:	e299                	bnez	a3,493e6 <__lo0bits+0x48>
   493e2:	0511                	add	a0,a0,4
   493e4:	8391                	srl	a5,a5,0x4
   493e6:	0037f693          	and	a3,a5,3
   493ea:	e299                	bnez	a3,493f0 <__lo0bits+0x52>
   493ec:	0509                	add	a0,a0,2
   493ee:	8389                	srl	a5,a5,0x2
   493f0:	0017f693          	and	a3,a5,1
   493f4:	e681                	bnez	a3,493fc <__lo0bits+0x5e>
   493f6:	8385                	srl	a5,a5,0x1
   493f8:	0505                	add	a0,a0,1
   493fa:	c399                	beqz	a5,49400 <__lo0bits+0x62>
   493fc:	c31c                	sw	a5,0(a4)
   493fe:	8082                	ret
   49400:	02000513          	li	a0,32
   49404:	8082                	ret

00049406 <__i2b>:
   49406:	1141                	add	sp,sp,-16
   49408:	c422                	sw	s0,8(sp)
   4940a:	842e                	mv	s0,a1
   4940c:	4585                	li	a1,1
   4940e:	c606                	sw	ra,12(sp)
   49410:	cc3ff0ef          	jal	490d2 <_Balloc>
   49414:	ed11                	bnez	a0,49430 <__i2b+0x2a>
   49416:	0004b6b7          	lui	a3,0x4b
   4941a:	0004b537          	lui	a0,0x4b
   4941e:	e2868693          	add	a3,a3,-472 # 4ae28 <__clz_tab+0x374>
   49422:	4601                	li	a2,0
   49424:	14000593          	li	a1,320
   49428:	ea050513          	add	a0,a0,-352 # 4aea0 <__clz_tab+0x3ec>
   4942c:	32a010ef          	jal	4a756 <__assert_func>
   49430:	40b2                	lw	ra,12(sp)
   49432:	c940                	sw	s0,20(a0)
   49434:	4422                	lw	s0,8(sp)
   49436:	4705                	li	a4,1
   49438:	c918                	sw	a4,16(a0)
   4943a:	0141                	add	sp,sp,16
   4943c:	8082                	ret

0004943e <__multiply>:
   4943e:	4998                	lw	a4,16(a1)
   49440:	4a1c                	lw	a5,16(a2)
   49442:	1101                	add	sp,sp,-32
   49444:	cc22                	sw	s0,24(sp)
   49446:	c84a                	sw	s2,16(sp)
   49448:	ce06                	sw	ra,28(sp)
   4944a:	ca26                	sw	s1,20(sp)
   4944c:	c64e                	sw	s3,12(sp)
   4944e:	c452                	sw	s4,8(sp)
   49450:	892e                	mv	s2,a1
   49452:	8432                	mv	s0,a2
   49454:	00f74463          	blt	a4,a5,4945c <__multiply+0x1e>
   49458:	842e                	mv	s0,a1
   4945a:	8932                	mv	s2,a2
   4945c:	01042a03          	lw	s4,16(s0)
   49460:	01092983          	lw	s3,16(s2)
   49464:	441c                	lw	a5,8(s0)
   49466:	404c                	lw	a1,4(s0)
   49468:	013a04b3          	add	s1,s4,s3
   4946c:	0097d363          	bge	a5,s1,49472 <__multiply+0x34>
   49470:	0585                	add	a1,a1,1
   49472:	c61ff0ef          	jal	490d2 <_Balloc>
   49476:	ed11                	bnez	a0,49492 <__multiply+0x54>
   49478:	0004b6b7          	lui	a3,0x4b
   4947c:	0004b537          	lui	a0,0x4b
   49480:	e2868693          	add	a3,a3,-472 # 4ae28 <__clz_tab+0x374>
   49484:	4601                	li	a2,0
   49486:	15d00593          	li	a1,349
   4948a:	ea050513          	add	a0,a0,-352 # 4aea0 <__clz_tab+0x3ec>
   4948e:	2c8010ef          	jal	4a756 <__assert_func>
   49492:	01450693          	add	a3,a0,20
   49496:	87b6                	mv	a5,a3
   49498:	20d4c833          	sh2add	a6,s1,a3
   4949c:	0507e963          	bltu	a5,a6,494ee <__multiply+0xb0>
   494a0:	01440313          	add	t1,s0,20
   494a4:	01490593          	add	a1,s2,20
   494a8:	01540793          	add	a5,s0,21
   494ac:	4e11                	li	t3,4
   494ae:	206a4633          	sh2add	a2,s4,t1
   494b2:	20b9c8b3          	sh2add	a7,s3,a1
   494b6:	00f66963          	bltu	a2,a5,494c8 <__multiply+0x8a>
   494ba:	40860433          	sub	s0,a2,s0
   494be:	142d                	add	s0,s0,-21
   494c0:	9879                	and	s0,s0,-2
   494c2:	9875                	and	s0,s0,-3
   494c4:	00440e13          	add	t3,s0,4
   494c8:	6ec1                	lui	t4,0x10
   494ca:	1efd                	add	t4,t4,-1 # ffff <__fw_size__+0x4d27>
   494cc:	0315e563          	bltu	a1,a7,494f6 <__multiply+0xb8>
   494d0:	00905663          	blez	s1,494dc <__multiply+0x9e>
   494d4:	ffc82783          	lw	a5,-4(a6)
   494d8:	1871                	add	a6,a6,-4
   494da:	cfe1                	beqz	a5,495b2 <__multiply+0x174>
   494dc:	40f2                	lw	ra,28(sp)
   494de:	4462                	lw	s0,24(sp)
   494e0:	c904                	sw	s1,16(a0)
   494e2:	4942                	lw	s2,16(sp)
   494e4:	44d2                	lw	s1,20(sp)
   494e6:	49b2                	lw	s3,12(sp)
   494e8:	4a22                	lw	s4,8(sp)
   494ea:	6105                	add	sp,sp,32
   494ec:	8082                	ret
   494ee:	0007a023          	sw	zero,0(a5)
   494f2:	0791                	add	a5,a5,4
   494f4:	b765                	j	4949c <__multiply+0x5e>
   494f6:	0005af03          	lw	t5,0(a1)
   494fa:	01df7f33          	and	t5,t5,t4
   494fe:	040f0963          	beqz	t5,49550 <__multiply+0x112>
   49502:	82b6                	mv	t0,a3
   49504:	8f9a                	mv	t6,t1
   49506:	4401                	li	s0,0
   49508:	000fa783          	lw	a5,0(t6)
   4950c:	0002a383          	lw	t2,0(t0)
   49510:	0f91                	add	t6,t6,4
   49512:	01d7f733          	and	a4,a5,t4
   49516:	03e70733          	mul	a4,a4,t5
   4951a:	83c1                	srl	a5,a5,0x10
   4951c:	01d3f933          	and	s2,t2,t4
   49520:	0103d393          	srl	t2,t2,0x10
   49524:	0291                	add	t0,t0,4
   49526:	03e787b3          	mul	a5,a5,t5
   4952a:	974a                	add	a4,a4,s2
   4952c:	9722                	add	a4,a4,s0
   4952e:	979e                	add	a5,a5,t2
   49530:	01075393          	srl	t2,a4,0x10
   49534:	979e                	add	a5,a5,t2
   49536:	0107d413          	srl	s0,a5,0x10
   4953a:	01d77733          	and	a4,a4,t4
   4953e:	07c2                	sll	a5,a5,0x10
   49540:	8fd9                	or	a5,a5,a4
   49542:	fef2ae23          	sw	a5,-4(t0)
   49546:	fccfe1e3          	bltu	t6,a2,49508 <__multiply+0xca>
   4954a:	01c687b3          	add	a5,a3,t3
   4954e:	c380                	sw	s0,0(a5)
   49550:	0025d383          	lhu	t2,2(a1)
   49554:	04038c63          	beqz	t2,495ac <__multiply+0x16e>
   49558:	429c                	lw	a5,0(a3)
   4955a:	8f1a                	mv	t5,t1
   4955c:	8fb6                	mv	t6,a3
   4955e:	4281                	li	t0,0
   49560:	000f2703          	lw	a4,0(t5)
   49564:	002fd403          	lhu	s0,2(t6)
   49568:	01d7f7b3          	and	a5,a5,t4
   4956c:	01d77733          	and	a4,a4,t4
   49570:	02770733          	mul	a4,a4,t2
   49574:	0f11                	add	t5,t5,4
   49576:	0f91                	add	t6,t6,4
   49578:	9722                	add	a4,a4,s0
   4957a:	9716                	add	a4,a4,t0
   4957c:	01071293          	sll	t0,a4,0x10
   49580:	00f2e7b3          	or	a5,t0,a5
   49584:	feffae23          	sw	a5,-4(t6)
   49588:	ffef5783          	lhu	a5,-2(t5)
   4958c:	000fa283          	lw	t0,0(t6)
   49590:	8341                	srl	a4,a4,0x10
   49592:	027787b3          	mul	a5,a5,t2
   49596:	01d2f2b3          	and	t0,t0,t4
   4959a:	9796                	add	a5,a5,t0
   4959c:	97ba                	add	a5,a5,a4
   4959e:	0107d293          	srl	t0,a5,0x10
   495a2:	facf6fe3          	bltu	t5,a2,49560 <__multiply+0x122>
   495a6:	01c68733          	add	a4,a3,t3
   495aa:	c31c                	sw	a5,0(a4)
   495ac:	0591                	add	a1,a1,4
   495ae:	0691                	add	a3,a3,4
   495b0:	bf31                	j	494cc <__multiply+0x8e>
   495b2:	14fd                	add	s1,s1,-1
   495b4:	bf31                	j	494d0 <__multiply+0x92>

000495b6 <__pow5mult>:
   495b6:	1101                	add	sp,sp,-32
   495b8:	ca26                	sw	s1,20(sp)
   495ba:	c84a                	sw	s2,16(sp)
   495bc:	c64e                	sw	s3,12(sp)
   495be:	ce06                	sw	ra,28(sp)
   495c0:	cc22                	sw	s0,24(sp)
   495c2:	c452                	sw	s4,8(sp)
   495c4:	00367793          	and	a5,a2,3
   495c8:	89aa                	mv	s3,a0
   495ca:	84b2                	mv	s1,a2
   495cc:	892e                	mv	s2,a1
   495ce:	cf89                	beqz	a5,495e8 <__pow5mult+0x32>
   495d0:	0004b737          	lui	a4,0x4b
   495d4:	2e070713          	add	a4,a4,736 # 4b2e0 <p05.0>
   495d8:	20e7c7b3          	sh2add	a5,a5,a4
   495dc:	ffc7a603          	lw	a2,-4(a5)
   495e0:	4681                	li	a3,0
   495e2:	bfbff0ef          	jal	491dc <__multadd>
   495e6:	892a                	mv	s2,a0
   495e8:	8489                	sra	s1,s1,0x2
   495ea:	c8d1                	beqz	s1,4967e <__pow5mult+0xc8>
   495ec:	0249a783          	lw	a5,36(s3)
   495f0:	ef85                	bnez	a5,49628 <__pow5mult+0x72>
   495f2:	4541                	li	a0,16
   495f4:	a81ff0ef          	jal	49074 <malloc>
   495f8:	02a9a223          	sw	a0,36(s3)
   495fc:	ed11                	bnez	a0,49618 <__pow5mult+0x62>
   495fe:	0004b6b7          	lui	a3,0x4b
   49602:	0004b537          	lui	a0,0x4b
   49606:	dc468693          	add	a3,a3,-572 # 4adc4 <__clz_tab+0x310>
   4960a:	4601                	li	a2,0
   4960c:	1ae00593          	li	a1,430
   49610:	ea050513          	add	a0,a0,-352 # 4aea0 <__clz_tab+0x3ec>
   49614:	142010ef          	jal	4a756 <__assert_func>
   49618:	00052223          	sw	zero,4(a0)
   4961c:	00052423          	sw	zero,8(a0)
   49620:	00052023          	sw	zero,0(a0)
   49624:	00052623          	sw	zero,12(a0)
   49628:	0249aa03          	lw	s4,36(s3)
   4962c:	008a2403          	lw	s0,8(s4)
   49630:	e819                	bnez	s0,49646 <__pow5mult+0x90>
   49632:	27100593          	li	a1,625
   49636:	854e                	mv	a0,s3
   49638:	dcfff0ef          	jal	49406 <__i2b>
   4963c:	00aa2423          	sw	a0,8(s4)
   49640:	842a                	mv	s0,a0
   49642:	00052023          	sw	zero,0(a0)
   49646:	0014f793          	and	a5,s1,1
   4964a:	cf81                	beqz	a5,49662 <__pow5mult+0xac>
   4964c:	85ca                	mv	a1,s2
   4964e:	8622                	mv	a2,s0
   49650:	854e                	mv	a0,s3
   49652:	dedff0ef          	jal	4943e <__multiply>
   49656:	8a2a                	mv	s4,a0
   49658:	85ca                	mv	a1,s2
   4965a:	854e                	mv	a0,s3
   4965c:	b21ff0ef          	jal	4917c <_Bfree>
   49660:	8952                	mv	s2,s4
   49662:	8485                	sra	s1,s1,0x1
   49664:	cc89                	beqz	s1,4967e <__pow5mult+0xc8>
   49666:	4008                	lw	a0,0(s0)
   49668:	e909                	bnez	a0,4967a <__pow5mult+0xc4>
   4966a:	8622                	mv	a2,s0
   4966c:	85a2                	mv	a1,s0
   4966e:	854e                	mv	a0,s3
   49670:	dcfff0ef          	jal	4943e <__multiply>
   49674:	c008                	sw	a0,0(s0)
   49676:	00052023          	sw	zero,0(a0)
   4967a:	842a                	mv	s0,a0
   4967c:	b7e9                	j	49646 <__pow5mult+0x90>
   4967e:	40f2                	lw	ra,28(sp)
   49680:	4462                	lw	s0,24(sp)
   49682:	44d2                	lw	s1,20(sp)
   49684:	49b2                	lw	s3,12(sp)
   49686:	4a22                	lw	s4,8(sp)
   49688:	854a                	mv	a0,s2
   4968a:	4942                	lw	s2,16(sp)
   4968c:	6105                	add	sp,sp,32
   4968e:	8082                	ret

00049690 <__lshift>:
   49690:	1101                	add	sp,sp,-32
   49692:	c84a                	sw	s2,16(sp)
   49694:	892e                	mv	s2,a1
   49696:	c05a                	sw	s6,0(sp)
   49698:	01092b03          	lw	s6,16(s2)
   4969c:	cc22                	sw	s0,24(sp)
   4969e:	41cc                	lw	a1,4(a1)
   496a0:	40565413          	sra	s0,a2,0x5
   496a4:	00892783          	lw	a5,8(s2)
   496a8:	9b22                	add	s6,s6,s0
   496aa:	ca26                	sw	s1,20(sp)
   496ac:	c64e                	sw	s3,12(sp)
   496ae:	c256                	sw	s5,4(sp)
   496b0:	ce06                	sw	ra,28(sp)
   496b2:	c452                	sw	s4,8(sp)
   496b4:	84aa                	mv	s1,a0
   496b6:	89b2                	mv	s3,a2
   496b8:	001b0a93          	add	s5,s6,1
   496bc:	0357c463          	blt	a5,s5,496e4 <__lshift+0x54>
   496c0:	8526                	mv	a0,s1
   496c2:	a11ff0ef          	jal	490d2 <_Balloc>
   496c6:	8a2a                	mv	s4,a0
   496c8:	e10d                	bnez	a0,496ea <__lshift+0x5a>
   496ca:	0004b6b7          	lui	a3,0x4b
   496ce:	0004b537          	lui	a0,0x4b
   496d2:	e2868693          	add	a3,a3,-472 # 4ae28 <__clz_tab+0x374>
   496d6:	4601                	li	a2,0
   496d8:	1d900593          	li	a1,473
   496dc:	ea050513          	add	a0,a0,-352 # 4aea0 <__clz_tab+0x3ec>
   496e0:	076010ef          	jal	4a756 <__assert_func>
   496e4:	0585                	add	a1,a1,1
   496e6:	0786                	sll	a5,a5,0x1
   496e8:	bfd1                	j	496bc <__lshift+0x2c>
   496ea:	01450693          	add	a3,a0,20
   496ee:	8736                	mv	a4,a3
   496f0:	4781                	li	a5,0
   496f2:	0887c463          	blt	a5,s0,4977a <__lshift+0xea>
   496f6:	01092703          	lw	a4,16(s2)
   496fa:	01490793          	add	a5,s2,20
   496fe:	01f9f613          	and	a2,s3,31
   49702:	0a046433          	max	s0,s0,zero
   49706:	20f74733          	sh2add	a4,a4,a5
   4970a:	20d44433          	sh2add	s0,s0,a3
   4970e:	ca3d                	beqz	a2,49784 <__lshift+0xf4>
   49710:	02000813          	li	a6,32
   49714:	40c80833          	sub	a6,a6,a2
   49718:	8522                	mv	a0,s0
   4971a:	4681                	li	a3,0
   4971c:	438c                	lw	a1,0(a5)
   4971e:	00c595b3          	sll	a1,a1,a2
   49722:	8ecd                	or	a3,a3,a1
   49724:	c114                	sw	a3,0(a0)
   49726:	4394                	lw	a3,0(a5)
   49728:	0791                	add	a5,a5,4
   4972a:	0511                	add	a0,a0,4
   4972c:	0106d6b3          	srl	a3,a3,a6
   49730:	fee7e6e3          	bltu	a5,a4,4971c <__lshift+0x8c>
   49734:	01590793          	add	a5,s2,21
   49738:	4611                	li	a2,4
   4973a:	00f76963          	bltu	a4,a5,4974c <__lshift+0xbc>
   4973e:	41270733          	sub	a4,a4,s2
   49742:	172d                	add	a4,a4,-21
   49744:	9b79                	and	a4,a4,-2
   49746:	9b75                	and	a4,a4,-3
   49748:	00470613          	add	a2,a4,4
   4974c:	9432                	add	s0,s0,a2
   4974e:	c014                	sw	a3,0(s0)
   49750:	c299                	beqz	a3,49756 <__lshift+0xc6>
   49752:	002b0a93          	add	s5,s6,2
   49756:	1afd                	add	s5,s5,-1
   49758:	015a2823          	sw	s5,16(s4)
   4975c:	8526                	mv	a0,s1
   4975e:	85ca                	mv	a1,s2
   49760:	a1dff0ef          	jal	4917c <_Bfree>
   49764:	40f2                	lw	ra,28(sp)
   49766:	4462                	lw	s0,24(sp)
   49768:	44d2                	lw	s1,20(sp)
   4976a:	4942                	lw	s2,16(sp)
   4976c:	49b2                	lw	s3,12(sp)
   4976e:	4a92                	lw	s5,4(sp)
   49770:	4b02                	lw	s6,0(sp)
   49772:	8552                	mv	a0,s4
   49774:	4a22                	lw	s4,8(sp)
   49776:	6105                	add	sp,sp,32
   49778:	8082                	ret
   4977a:	00072023          	sw	zero,0(a4)
   4977e:	0785                	add	a5,a5,1
   49780:	0711                	add	a4,a4,4
   49782:	bf85                	j	496f2 <__lshift+0x62>
   49784:	4394                	lw	a3,0(a5)
   49786:	0791                	add	a5,a5,4
   49788:	c014                	sw	a3,0(s0)
   4978a:	0411                	add	s0,s0,4
   4978c:	fee7ece3          	bltu	a5,a4,49784 <__lshift+0xf4>
   49790:	b7d9                	j	49756 <__lshift+0xc6>

00049792 <__mcmp>:
   49792:	4914                	lw	a3,16(a0)
   49794:	499c                	lw	a5,16(a1)
   49796:	872a                	mv	a4,a0
   49798:	40f68533          	sub	a0,a3,a5
   4979c:	02f69563          	bne	a3,a5,497c6 <__mcmp+0x34>
   497a0:	0751                	add	a4,a4,20
   497a2:	05d1                	add	a1,a1,20
   497a4:	20e7c6b3          	sh2add	a3,a5,a4
   497a8:	20b7c7b3          	sh2add	a5,a5,a1
   497ac:	16f1                	add	a3,a3,-4
   497ae:	17f1                	add	a5,a5,-4
   497b0:	428c                	lw	a1,0(a3)
   497b2:	4390                	lw	a2,0(a5)
   497b4:	00c58763          	beq	a1,a2,497c2 <__mcmp+0x30>
   497b8:	4505                	li	a0,1
   497ba:	00c5f663          	bgeu	a1,a2,497c6 <__mcmp+0x34>
   497be:	557d                	li	a0,-1
   497c0:	8082                	ret
   497c2:	fed765e3          	bltu	a4,a3,497ac <__mcmp+0x1a>
   497c6:	8082                	ret

000497c8 <__mdiff>:
   497c8:	1101                	add	sp,sp,-32
   497ca:	ca26                	sw	s1,20(sp)
   497cc:	84ae                	mv	s1,a1
   497ce:	c84a                	sw	s2,16(sp)
   497d0:	85b2                	mv	a1,a2
   497d2:	892a                	mv	s2,a0
   497d4:	8526                	mv	a0,s1
   497d6:	cc22                	sw	s0,24(sp)
   497d8:	ce06                	sw	ra,28(sp)
   497da:	c64e                	sw	s3,12(sp)
   497dc:	8432                	mv	s0,a2
   497de:	fb5ff0ef          	jal	49792 <__mcmp>
   497e2:	ed15                	bnez	a0,4981e <__mdiff+0x56>
   497e4:	4581                	li	a1,0
   497e6:	854a                	mv	a0,s2
   497e8:	8ebff0ef          	jal	490d2 <_Balloc>
   497ec:	ed11                	bnez	a0,49808 <__mdiff+0x40>
   497ee:	0004b6b7          	lui	a3,0x4b
   497f2:	e2868693          	add	a3,a3,-472 # 4ae28 <__clz_tab+0x374>
   497f6:	4601                	li	a2,0
   497f8:	23200593          	li	a1,562
   497fc:	0004b537          	lui	a0,0x4b
   49800:	ea050513          	add	a0,a0,-352 # 4aea0 <__clz_tab+0x3ec>
   49804:	753000ef          	jal	4a756 <__assert_func>
   49808:	4785                	li	a5,1
   4980a:	c91c                	sw	a5,16(a0)
   4980c:	00052a23          	sw	zero,20(a0)
   49810:	40f2                	lw	ra,28(sp)
   49812:	4462                	lw	s0,24(sp)
   49814:	44d2                	lw	s1,20(sp)
   49816:	4942                	lw	s2,16(sp)
   49818:	49b2                	lw	s3,12(sp)
   4981a:	6105                	add	sp,sp,32
   4981c:	8082                	ret
   4981e:	4981                	li	s3,0
   49820:	00055663          	bgez	a0,4982c <__mdiff+0x64>
   49824:	87a6                	mv	a5,s1
   49826:	4985                	li	s3,1
   49828:	84a2                	mv	s1,s0
   4982a:	843e                	mv	s0,a5
   4982c:	40cc                	lw	a1,4(s1)
   4982e:	854a                	mv	a0,s2
   49830:	8a3ff0ef          	jal	490d2 <_Balloc>
   49834:	e909                	bnez	a0,49846 <__mdiff+0x7e>
   49836:	0004b6b7          	lui	a3,0x4b
   4983a:	e2868693          	add	a3,a3,-472 # 4ae28 <__clz_tab+0x374>
   4983e:	4601                	li	a2,0
   49840:	24000593          	li	a1,576
   49844:	bf65                	j	497fc <__mdiff+0x34>
   49846:	0104a803          	lw	a6,16(s1)
   4984a:	481c                	lw	a5,16(s0)
   4984c:	6ec1                	lui	t4,0x10
   4984e:	01448893          	add	a7,s1,20
   49852:	01440713          	add	a4,s0,20
   49856:	01352623          	sw	s3,12(a0)
   4985a:	01450593          	add	a1,a0,20
   4985e:	4e51                	li	t3,20
   49860:	4301                	li	t1,0
   49862:	1efd                	add	t4,t4,-1 # ffff <__fw_size__+0x4d27>
   49864:	21184633          	sh2add	a2,a6,a7
   49868:	20e7c7b3          	sh2add	a5,a5,a4
   4986c:	01c406b3          	add	a3,s0,t3
   49870:	01c48733          	add	a4,s1,t3
   49874:	0006af03          	lw	t5,0(a3)
   49878:	4318                	lw	a4,0(a4)
   4987a:	01df7fb3          	and	t6,t5,t4
   4987e:	01d776b3          	and	a3,a4,t4
   49882:	41f686b3          	sub	a3,a3,t6
   49886:	969a                	add	a3,a3,t1
   49888:	010f5f13          	srl	t5,t5,0x10
   4988c:	8341                	srl	a4,a4,0x10
   4988e:	4106d313          	sra	t1,a3,0x10
   49892:	41e70733          	sub	a4,a4,t5
   49896:	971a                	add	a4,a4,t1
   49898:	41075313          	sra	t1,a4,0x10
   4989c:	01d6f6b3          	and	a3,a3,t4
   498a0:	0742                	sll	a4,a4,0x10
   498a2:	01c50f33          	add	t5,a0,t3
   498a6:	8ed9                	or	a3,a3,a4
   498a8:	0e11                	add	t3,t3,4
   498aa:	00df2023          	sw	a3,0(t5)
   498ae:	008e0733          	add	a4,t3,s0
   498b2:	faf76de3          	bltu	a4,a5,4986c <__mdiff+0xa4>
   498b6:	01540693          	add	a3,s0,21
   498ba:	4711                	li	a4,4
   498bc:	00d7e863          	bltu	a5,a3,498cc <__mdiff+0x104>
   498c0:	8f81                	sub	a5,a5,s0
   498c2:	17ad                	add	a5,a5,-21
   498c4:	9bf9                	and	a5,a5,-2
   498c6:	9bf5                	and	a5,a5,-3
   498c8:	00478713          	add	a4,a5,4
   498cc:	00e586b3          	add	a3,a1,a4
   498d0:	98ba                	add	a7,a7,a4
   498d2:	6e41                	lui	t3,0x10
   498d4:	8eb6                	mv	t4,a3
   498d6:	85c6                	mv	a1,a7
   498d8:	1e7d                	add	t3,t3,-1 # ffff <__fw_size__+0x4d27>
   498da:	02c5e563          	bltu	a1,a2,49904 <__mdiff+0x13c>
   498de:	ffd88793          	add	a5,a7,-3
   498e2:	4701                	li	a4,0
   498e4:	00f66863          	bltu	a2,a5,498f4 <__mdiff+0x12c>
   498e8:	060d                	add	a2,a2,3
   498ea:	41160633          	sub	a2,a2,a7
   498ee:	ffe67713          	and	a4,a2,-2
   498f2:	9b75                	and	a4,a4,-3
   498f4:	00e687b3          	add	a5,a3,a4
   498f8:	17f1                	add	a5,a5,-4
   498fa:	4398                	lw	a4,0(a5)
   498fc:	cb0d                	beqz	a4,4992e <__mdiff+0x166>
   498fe:	01052823          	sw	a6,16(a0)
   49902:	b739                	j	49810 <__mdiff+0x48>
   49904:	4198                	lw	a4,0(a1)
   49906:	8f1a                	mv	t5,t1
   49908:	0591                	add	a1,a1,4
   4990a:	01c777b3          	and	a5,a4,t3
   4990e:	979a                	add	a5,a5,t1
   49910:	87c1                	sra	a5,a5,0x10
   49912:	01075313          	srl	t1,a4,0x10
   49916:	979a                	add	a5,a5,t1
   49918:	977a                	add	a4,a4,t5
   4991a:	4107d313          	sra	t1,a5,0x10
   4991e:	01c77733          	and	a4,a4,t3
   49922:	07c2                	sll	a5,a5,0x10
   49924:	8f5d                	or	a4,a4,a5
   49926:	00eea023          	sw	a4,0(t4)
   4992a:	0e91                	add	t4,t4,4
   4992c:	b77d                	j	498da <__mdiff+0x112>
   4992e:	187d                	add	a6,a6,-1
   49930:	b7e1                	j	498f8 <__mdiff+0x130>

00049932 <__ulp>:
   49932:	7ff007b7          	lui	a5,0x7ff00
   49936:	8dfd                	and	a1,a1,a5
   49938:	fcc007b7          	lui	a5,0xfcc00
   4993c:	95be                	add	a1,a1,a5
   4993e:	00b04d63          	bgtz	a1,49958 <__ulp+0x26>
   49942:	40b005b3          	neg	a1,a1
   49946:	4145d793          	sra	a5,a1,0x14
   4994a:	474d                	li	a4,19
   4994c:	00f74863          	blt	a4,a5,4995c <__ulp+0x2a>
   49950:	000805b7          	lui	a1,0x80
   49954:	40f5d5b3          	sra	a1,a1,a5
   49958:	4781                	li	a5,0
   4995a:	a821                	j	49972 <__ulp+0x40>
   4995c:	fec78713          	add	a4,a5,-20 # fcbfffec <__share_mem_end__+0xfb8fffec>
   49960:	46f9                	li	a3,30
   49962:	4785                	li	a5,1
   49964:	00e6c663          	blt	a3,a4,49970 <__ulp+0x3e>
   49968:	800007b7          	lui	a5,0x80000
   4996c:	00e7d7b3          	srl	a5,a5,a4
   49970:	4581                	li	a1,0
   49972:	853e                	mv	a0,a5
   49974:	8082                	ret

00049976 <__b2d>:
   49976:	1101                	add	sp,sp,-32
   49978:	ca26                	sw	s1,20(sp)
   4997a:	4904                	lw	s1,16(a0)
   4997c:	c64e                	sw	s3,12(sp)
   4997e:	01450993          	add	s3,a0,20
   49982:	cc22                	sw	s0,24(sp)
   49984:	2134c4b3          	sh2add	s1,s1,s3
   49988:	ffc4a403          	lw	s0,-4(s1)
   4998c:	c84a                	sw	s2,16(sp)
   4998e:	c452                	sw	s4,8(sp)
   49990:	8522                	mv	a0,s0
   49992:	8a2e                	mv	s4,a1
   49994:	ce06                	sw	ra,28(sp)
   49996:	9c3ff0ef          	jal	49358 <__hi0bits>
   4999a:	02000793          	li	a5,32
   4999e:	8f89                	sub	a5,a5,a0
   499a0:	00fa2023          	sw	a5,0(s4)
   499a4:	47a9                	li	a5,10
   499a6:	ffc48913          	add	s2,s1,-4
   499aa:	02a7ce63          	blt	a5,a0,499e6 <__b2d+0x70>
   499ae:	46ad                	li	a3,11
   499b0:	8e89                	sub	a3,a3,a0
   499b2:	3ff007b7          	lui	a5,0x3ff00
   499b6:	00d45733          	srl	a4,s0,a3
   499ba:	8f5d                	or	a4,a4,a5
   499bc:	4781                	li	a5,0
   499be:	0129f463          	bgeu	s3,s2,499c6 <__b2d+0x50>
   499c2:	ff84a783          	lw	a5,-8(s1)
   499c6:	0555                	add	a0,a0,21
   499c8:	00a41433          	sll	s0,s0,a0
   499cc:	00d7d7b3          	srl	a5,a5,a3
   499d0:	8fc1                	or	a5,a5,s0
   499d2:	40f2                	lw	ra,28(sp)
   499d4:	4462                	lw	s0,24(sp)
   499d6:	44d2                	lw	s1,20(sp)
   499d8:	4942                	lw	s2,16(sp)
   499da:	49b2                	lw	s3,12(sp)
   499dc:	4a22                	lw	s4,8(sp)
   499de:	853e                	mv	a0,a5
   499e0:	85ba                	mv	a1,a4
   499e2:	6105                	add	sp,sp,32
   499e4:	8082                	ret
   499e6:	4781                	li	a5,0
   499e8:	0129f663          	bgeu	s3,s2,499f4 <__b2d+0x7e>
   499ec:	ff84a783          	lw	a5,-8(s1)
   499f0:	ff848913          	add	s2,s1,-8
   499f4:	1555                	add	a0,a0,-11
   499f6:	c51d                	beqz	a0,49a24 <__b2d+0xae>
   499f8:	02000613          	li	a2,32
   499fc:	8e09                	sub	a2,a2,a0
   499fe:	00c7d733          	srl	a4,a5,a2
   49a02:	00a41433          	sll	s0,s0,a0
   49a06:	8c59                	or	s0,s0,a4
   49a08:	3ff00737          	lui	a4,0x3ff00
   49a0c:	8f41                	or	a4,a4,s0
   49a0e:	4681                	li	a3,0
   49a10:	0129f463          	bgeu	s3,s2,49a18 <__b2d+0xa2>
   49a14:	ffc92683          	lw	a3,-4(s2)
   49a18:	00a797b3          	sll	a5,a5,a0
   49a1c:	00c6d6b3          	srl	a3,a3,a2
   49a20:	8fd5                	or	a5,a5,a3
   49a22:	bf45                	j	499d2 <__b2d+0x5c>
   49a24:	3ff00737          	lui	a4,0x3ff00
   49a28:	8f41                	or	a4,a4,s0
   49a2a:	b765                	j	499d2 <__b2d+0x5c>

00049a2c <__d2b>:
   49a2c:	7179                	add	sp,sp,-48
   49a2e:	d422                	sw	s0,40(sp)
   49a30:	842e                	mv	s0,a1
   49a32:	4585                	li	a1,1
   49a34:	d226                	sw	s1,36(sp)
   49a36:	d04a                	sw	s2,32(sp)
   49a38:	ce4e                	sw	s3,28(sp)
   49a3a:	d606                	sw	ra,44(sp)
   49a3c:	cc52                	sw	s4,24(sp)
   49a3e:	84b2                	mv	s1,a2
   49a40:	89b6                	mv	s3,a3
   49a42:	893a                	mv	s2,a4
   49a44:	e8eff0ef          	jal	490d2 <_Balloc>
   49a48:	ed11                	bnez	a0,49a64 <__d2b+0x38>
   49a4a:	0004b6b7          	lui	a3,0x4b
   49a4e:	0004b537          	lui	a0,0x4b
   49a52:	e2868693          	add	a3,a3,-472 # 4ae28 <__clz_tab+0x374>
   49a56:	4601                	li	a2,0
   49a58:	30a00593          	li	a1,778
   49a5c:	ea050513          	add	a0,a0,-352 # 4aea0 <__clz_tab+0x3ec>
   49a60:	4f7000ef          	jal	4a756 <__assert_func>
   49a64:	00c49793          	sll	a5,s1,0xc
   49a68:	80d1                	srl	s1,s1,0x14
   49a6a:	7ff4f493          	and	s1,s1,2047
   49a6e:	8a2a                	mv	s4,a0
   49a70:	83b1                	srl	a5,a5,0xc
   49a72:	c099                	beqz	s1,49a78 <__d2b+0x4c>
   49a74:	29479793          	bset	a5,a5,0x14
   49a78:	c63e                	sw	a5,12(sp)
   49a7a:	c035                	beqz	s0,49ade <__d2b+0xb2>
   49a7c:	0028                	add	a0,sp,8
   49a7e:	c422                	sw	s0,8(sp)
   49a80:	91fff0ef          	jal	4939e <__lo0bits>
   49a84:	4732                	lw	a4,12(sp)
   49a86:	46a2                	lw	a3,8(sp)
   49a88:	c921                	beqz	a0,49ad8 <__d2b+0xac>
   49a8a:	02000793          	li	a5,32
   49a8e:	8f89                	sub	a5,a5,a0
   49a90:	00f717b3          	sll	a5,a4,a5
   49a94:	8fd5                	or	a5,a5,a3
   49a96:	00a75733          	srl	a4,a4,a0
   49a9a:	00fa2a23          	sw	a5,20(s4)
   49a9e:	c63a                	sw	a4,12(sp)
   49aa0:	4432                	lw	s0,12(sp)
   49aa2:	008a2c23          	sw	s0,24(s4)
   49aa6:	00803433          	snez	s0,s0
   49aaa:	0405                	add	s0,s0,1
   49aac:	008a2823          	sw	s0,16(s4)
   49ab0:	c0a9                	beqz	s1,49af2 <__d2b+0xc6>
   49ab2:	bcd48493          	add	s1,s1,-1075
   49ab6:	94aa                	add	s1,s1,a0
   49ab8:	0099a023          	sw	s1,0(s3)
   49abc:	03500413          	li	s0,53
   49ac0:	8c09                	sub	s0,s0,a0
   49ac2:	00892023          	sw	s0,0(s2)
   49ac6:	50b2                	lw	ra,44(sp)
   49ac8:	5422                	lw	s0,40(sp)
   49aca:	5492                	lw	s1,36(sp)
   49acc:	5902                	lw	s2,32(sp)
   49ace:	49f2                	lw	s3,28(sp)
   49ad0:	8552                	mv	a0,s4
   49ad2:	4a62                	lw	s4,24(sp)
   49ad4:	6145                	add	sp,sp,48
   49ad6:	8082                	ret
   49ad8:	00da2a23          	sw	a3,20(s4)
   49adc:	b7d1                	j	49aa0 <__d2b+0x74>
   49ade:	0068                	add	a0,sp,12
   49ae0:	8bfff0ef          	jal	4939e <__lo0bits>
   49ae4:	47b2                	lw	a5,12(sp)
   49ae6:	02050513          	add	a0,a0,32
   49aea:	4405                	li	s0,1
   49aec:	00fa2a23          	sw	a5,20(s4)
   49af0:	bf75                	j	49aac <__d2b+0x80>
   49af2:	bce50793          	add	a5,a0,-1074
   49af6:	00f9a023          	sw	a5,0(s3)
   49afa:	214447b3          	sh2add	a5,s0,s4
   49afe:	4b88                	lw	a0,16(a5)
   49b00:	0416                	sll	s0,s0,0x5
   49b02:	857ff0ef          	jal	49358 <__hi0bits>
   49b06:	bf6d                	j	49ac0 <__d2b+0x94>

00049b08 <__ratio>:
   49b08:	7179                	add	sp,sp,-48
   49b0a:	d226                	sw	s1,36(sp)
   49b0c:	84ae                	mv	s1,a1
   49b0e:	002c                	add	a1,sp,8
   49b10:	d606                	sw	ra,44(sp)
   49b12:	d422                	sw	s0,40(sp)
   49b14:	d04a                	sw	s2,32(sp)
   49b16:	ce4e                	sw	s3,28(sp)
   49b18:	cc52                	sw	s4,24(sp)
   49b1a:	89aa                	mv	s3,a0
   49b1c:	e5bff0ef          	jal	49976 <__b2d>
   49b20:	892a                	mv	s2,a0
   49b22:	842e                	mv	s0,a1
   49b24:	8a2e                	mv	s4,a1
   49b26:	8526                	mv	a0,s1
   49b28:	006c                	add	a1,sp,12
   49b2a:	e4dff0ef          	jal	49976 <__b2d>
   49b2e:	4894                	lw	a3,16(s1)
   49b30:	0109a783          	lw	a5,16(s3)
   49b34:	872e                	mv	a4,a1
   49b36:	862e                	mv	a2,a1
   49b38:	8f95                	sub	a5,a5,a3
   49b3a:	45b2                	lw	a1,12(sp)
   49b3c:	46a2                	lw	a3,8(sp)
   49b3e:	0796                	sll	a5,a5,0x5
   49b40:	8e8d                	sub	a3,a3,a1
   49b42:	97b6                	add	a5,a5,a3
   49b44:	02f05463          	blez	a5,49b6c <__ratio+0x64>
   49b48:	07d2                	sll	a5,a5,0x14
   49b4a:	00878a33          	add	s4,a5,s0
   49b4e:	87b2                	mv	a5,a2
   49b50:	85d2                	mv	a1,s4
   49b52:	862a                	mv	a2,a0
   49b54:	86be                	mv	a3,a5
   49b56:	854a                	mv	a0,s2
   49b58:	85cf80ef          	jal	41bb4 <__divdf3>
   49b5c:	50b2                	lw	ra,44(sp)
   49b5e:	5422                	lw	s0,40(sp)
   49b60:	5492                	lw	s1,36(sp)
   49b62:	5902                	lw	s2,32(sp)
   49b64:	49f2                	lw	s3,28(sp)
   49b66:	4a62                	lw	s4,24(sp)
   49b68:	6145                	add	sp,sp,48
   49b6a:	8082                	ret
   49b6c:	fff006b7          	lui	a3,0xfff00
   49b70:	02d787b3          	mul	a5,a5,a3
   49b74:	00e78633          	add	a2,a5,a4
   49b78:	bfd9                	j	49b4e <__ratio+0x46>

00049b7a <__copybits>:
   49b7a:	4a1c                	lw	a5,16(a2)
   49b7c:	15fd                	add	a1,a1,-1 # 7ffff <__fast_load_addr__+0x3497f>
   49b7e:	8595                	sra	a1,a1,0x5
   49b80:	0585                	add	a1,a1,1
   49b82:	01460713          	add	a4,a2,20
   49b86:	86aa                	mv	a3,a0
   49b88:	20a5c5b3          	sh2add	a1,a1,a0
   49b8c:	20e7c7b3          	sh2add	a5,a5,a4
   49b90:	02f76063          	bltu	a4,a5,49bb0 <__copybits+0x36>
   49b94:	01160713          	add	a4,a2,17
   49b98:	4681                	li	a3,0
   49b9a:	00e7e763          	bltu	a5,a4,49ba8 <__copybits+0x2e>
   49b9e:	8f91                	sub	a5,a5,a2
   49ba0:	17bd                	add	a5,a5,-17 # 3fefffef <__share_mem_end__+0x3ebfffef>
   49ba2:	ffe7f693          	and	a3,a5,-2
   49ba6:	9af5                	and	a3,a3,-3
   49ba8:	9536                	add	a0,a0,a3
   49baa:	00b56a63          	bltu	a0,a1,49bbe <__copybits+0x44>
   49bae:	8082                	ret
   49bb0:	00072803          	lw	a6,0(a4) # 3ff00000 <__share_mem_end__+0x3ec00000>
   49bb4:	0711                	add	a4,a4,4
   49bb6:	0106a023          	sw	a6,0(a3) # fff00000 <__share_mem_end__+0xfec00000>
   49bba:	0691                	add	a3,a3,4
   49bbc:	bfd1                	j	49b90 <__copybits+0x16>
   49bbe:	00052023          	sw	zero,0(a0)
   49bc2:	0511                	add	a0,a0,4
   49bc4:	b7dd                	j	49baa <__copybits+0x30>

00049bc6 <__any_on>:
   49bc6:	4914                	lw	a3,16(a0)
   49bc8:	4055d793          	sra	a5,a1,0x5
   49bcc:	01450713          	add	a4,a0,20
   49bd0:	02f6c663          	blt	a3,a5,49bfc <__any_on+0x36>
   49bd4:	00d7de63          	bge	a5,a3,49bf0 <__any_on+0x2a>
   49bd8:	89fd                	and	a1,a1,31
   49bda:	c999                	beqz	a1,49bf0 <__any_on+0x2a>
   49bdc:	20e7c6b3          	sh2add	a3,a5,a4
   49be0:	4290                	lw	a2,0(a3)
   49be2:	4505                	li	a0,1
   49be4:	00b656b3          	srl	a3,a2,a1
   49be8:	00b696b3          	sll	a3,a3,a1
   49bec:	00d61e63          	bne	a2,a3,49c08 <__any_on+0x42>
   49bf0:	20e7c7b3          	sh2add	a5,a5,a4
   49bf4:	00f76663          	bltu	a4,a5,49c00 <__any_on+0x3a>
   49bf8:	4501                	li	a0,0
   49bfa:	8082                	ret
   49bfc:	87b6                	mv	a5,a3
   49bfe:	bfcd                	j	49bf0 <__any_on+0x2a>
   49c00:	17f1                	add	a5,a5,-4
   49c02:	4394                	lw	a3,0(a5)
   49c04:	dae5                	beqz	a3,49bf4 <__any_on+0x2e>
   49c06:	4505                	li	a0,1
   49c08:	8082                	ret

00049c0a <_calloc_r>:
   49c0a:	02c5b733          	mulhu	a4,a1,a2
   49c0e:	1101                	add	sp,sp,-32
   49c10:	ce06                	sw	ra,28(sp)
   49c12:	cc22                	sw	s0,24(sp)
   49c14:	02c58633          	mul	a2,a1,a2
   49c18:	cb09                	beqz	a4,49c2a <_calloc_r+0x20>
   49c1a:	4731                	li	a4,12
   49c1c:	c118                	sw	a4,0(a0)
   49c1e:	4401                	li	s0,0
   49c20:	40f2                	lw	ra,28(sp)
   49c22:	8522                	mv	a0,s0
   49c24:	4462                	lw	s0,24(sp)
   49c26:	6105                	add	sp,sp,32
   49c28:	8082                	ret
   49c2a:	85b2                	mv	a1,a2
   49c2c:	c632                	sw	a2,12(sp)
   49c2e:	284d                	jal	49ce0 <_malloc_r>
   49c30:	842a                	mv	s0,a0
   49c32:	d57d                	beqz	a0,49c20 <_calloc_r+0x16>
   49c34:	4632                	lw	a2,12(sp)
   49c36:	4581                	li	a1,0
   49c38:	a6cf90ef          	jal	42ea4 <memset>
   49c3c:	b7d5                	j	49c20 <_calloc_r+0x16>

00049c3e <_free_r>:
   49c3e:	c1c5                	beqz	a1,49cde <_free_r+0xa0>
   49c40:	ffc5a783          	lw	a5,-4(a1)
   49c44:	1101                	add	sp,sp,-32
   49c46:	cc22                	sw	s0,24(sp)
   49c48:	ce06                	sw	ra,28(sp)
   49c4a:	ffc58413          	add	s0,a1,-4
   49c4e:	0007d363          	bgez	a5,49c54 <_free_r+0x16>
   49c52:	943e                	add	s0,s0,a5
   49c54:	c62a                	sw	a0,12(sp)
   49c56:	411000ef          	jal	4a866 <__malloc_lock>
   49c5a:	4e81a783          	lw	a5,1256(gp) # 12d0ce8 <__malloc_free_list>
   49c5e:	4532                	lw	a0,12(sp)
   49c60:	eb91                	bnez	a5,49c74 <_free_r+0x36>
   49c62:	00042223          	sw	zero,4(s0)
   49c66:	4e81a423          	sw	s0,1256(gp) # 12d0ce8 <__malloc_free_list>
   49c6a:	4462                	lw	s0,24(sp)
   49c6c:	40f2                	lw	ra,28(sp)
   49c6e:	6105                	add	sp,sp,32
   49c70:	3f90006f          	j	4a868 <__malloc_unlock>
   49c74:	00f47d63          	bgeu	s0,a5,49c8e <_free_r+0x50>
   49c78:	4010                	lw	a2,0(s0)
   49c7a:	00c406b3          	add	a3,s0,a2
   49c7e:	00d79663          	bne	a5,a3,49c8a <_free_r+0x4c>
   49c82:	4394                	lw	a3,0(a5)
   49c84:	43dc                	lw	a5,4(a5)
   49c86:	96b2                	add	a3,a3,a2
   49c88:	c014                	sw	a3,0(s0)
   49c8a:	c05c                	sw	a5,4(s0)
   49c8c:	bfe9                	j	49c66 <_free_r+0x28>
   49c8e:	873e                	mv	a4,a5
   49c90:	43dc                	lw	a5,4(a5)
   49c92:	c399                	beqz	a5,49c98 <_free_r+0x5a>
   49c94:	fef47de3          	bgeu	s0,a5,49c8e <_free_r+0x50>
   49c98:	4314                	lw	a3,0(a4)
   49c9a:	00d70633          	add	a2,a4,a3
   49c9e:	00861f63          	bne	a2,s0,49cbc <_free_r+0x7e>
   49ca2:	4010                	lw	a2,0(s0)
   49ca4:	96b2                	add	a3,a3,a2
   49ca6:	c314                	sw	a3,0(a4)
   49ca8:	00d70633          	add	a2,a4,a3
   49cac:	fac79fe3          	bne	a5,a2,49c6a <_free_r+0x2c>
   49cb0:	4390                	lw	a2,0(a5)
   49cb2:	43dc                	lw	a5,4(a5)
   49cb4:	96b2                	add	a3,a3,a2
   49cb6:	c314                	sw	a3,0(a4)
   49cb8:	c35c                	sw	a5,4(a4)
   49cba:	bf45                	j	49c6a <_free_r+0x2c>
   49cbc:	00c47563          	bgeu	s0,a2,49cc6 <_free_r+0x88>
   49cc0:	47b1                	li	a5,12
   49cc2:	c11c                	sw	a5,0(a0)
   49cc4:	b75d                	j	49c6a <_free_r+0x2c>
   49cc6:	4010                	lw	a2,0(s0)
   49cc8:	00c406b3          	add	a3,s0,a2
   49ccc:	00d79663          	bne	a5,a3,49cd8 <_free_r+0x9a>
   49cd0:	4394                	lw	a3,0(a5)
   49cd2:	43dc                	lw	a5,4(a5)
   49cd4:	96b2                	add	a3,a3,a2
   49cd6:	c014                	sw	a3,0(s0)
   49cd8:	c05c                	sw	a5,4(s0)
   49cda:	c340                	sw	s0,4(a4)
   49cdc:	b779                	j	49c6a <_free_r+0x2c>
   49cde:	8082                	ret

00049ce0 <_malloc_r>:
   49ce0:	1101                	add	sp,sp,-32
   49ce2:	ca26                	sw	s1,20(sp)
   49ce4:	00358493          	add	s1,a1,3
   49ce8:	98f9                	and	s1,s1,-2
   49cea:	98f5                	and	s1,s1,-3
   49cec:	c84a                	sw	s2,16(sp)
   49cee:	04a1                	add	s1,s1,8
   49cf0:	47b1                	li	a5,12
   49cf2:	ce06                	sw	ra,28(sp)
   49cf4:	cc22                	sw	s0,24(sp)
   49cf6:	c64e                	sw	s3,12(sp)
   49cf8:	892a                	mv	s2,a0
   49cfa:	0af4f4b3          	maxu	s1,s1,a5
   49cfe:	0004c463          	bltz	s1,49d06 <_malloc_r+0x26>
   49d02:	00b4fd63          	bgeu	s1,a1,49d1c <_malloc_r+0x3c>
   49d06:	47b1                	li	a5,12
   49d08:	00f92023          	sw	a5,0(s2)
   49d0c:	4501                	li	a0,0
   49d0e:	40f2                	lw	ra,28(sp)
   49d10:	4462                	lw	s0,24(sp)
   49d12:	44d2                	lw	s1,20(sp)
   49d14:	4942                	lw	s2,16(sp)
   49d16:	49b2                	lw	s3,12(sp)
   49d18:	6105                	add	sp,sp,32
   49d1a:	8082                	ret
   49d1c:	34b000ef          	jal	4a866 <__malloc_lock>
   49d20:	4e81a703          	lw	a4,1256(gp) # 12d0ce8 <__malloc_free_list>
   49d24:	843a                	mv	s0,a4
   49d26:	e415                	bnez	s0,49d52 <_malloc_r+0x72>
   49d28:	4e41a783          	lw	a5,1252(gp) # 12d0ce4 <__malloc_sbrk_start>
   49d2c:	e791                	bnez	a5,49d38 <_malloc_r+0x58>
   49d2e:	4581                	li	a1,0
   49d30:	854a                	mv	a0,s2
   49d32:	2dcd                	jal	4a424 <_sbrk_r>
   49d34:	4ea1a223          	sw	a0,1252(gp) # 12d0ce4 <__malloc_sbrk_start>
   49d38:	85a6                	mv	a1,s1
   49d3a:	854a                	mv	a0,s2
   49d3c:	25e5                	jal	4a424 <_sbrk_r>
   49d3e:	59fd                	li	s3,-1
   49d40:	05351e63          	bne	a0,s3,49d9c <_malloc_r+0xbc>
   49d44:	47b1                	li	a5,12
   49d46:	00f92023          	sw	a5,0(s2)
   49d4a:	854a                	mv	a0,s2
   49d4c:	31d000ef          	jal	4a868 <__malloc_unlock>
   49d50:	bf75                	j	49d0c <_malloc_r+0x2c>
   49d52:	401c                	lw	a5,0(s0)
   49d54:	8f85                	sub	a5,a5,s1
   49d56:	0407c063          	bltz	a5,49d96 <_malloc_r+0xb6>
   49d5a:	462d                	li	a2,11
   49d5c:	00f67663          	bgeu	a2,a5,49d68 <_malloc_r+0x88>
   49d60:	c01c                	sw	a5,0(s0)
   49d62:	943e                	add	s0,s0,a5
   49d64:	c004                	sw	s1,0(s0)
   49d66:	a031                	j	49d72 <_malloc_r+0x92>
   49d68:	405c                	lw	a5,4(s0)
   49d6a:	02871463          	bne	a4,s0,49d92 <_malloc_r+0xb2>
   49d6e:	4ef1a423          	sw	a5,1256(gp) # 12d0ce8 <__malloc_free_list>
   49d72:	854a                	mv	a0,s2
   49d74:	2f5000ef          	jal	4a868 <__malloc_unlock>
   49d78:	00b40513          	add	a0,s0,11
   49d7c:	00440793          	add	a5,s0,4
   49d80:	9961                	and	a0,a0,-8
   49d82:	40f50733          	sub	a4,a0,a5
   49d86:	f8f504e3          	beq	a0,a5,49d0e <_malloc_r+0x2e>
   49d8a:	943a                	add	s0,s0,a4
   49d8c:	8f89                	sub	a5,a5,a0
   49d8e:	c01c                	sw	a5,0(s0)
   49d90:	bfbd                	j	49d0e <_malloc_r+0x2e>
   49d92:	c35c                	sw	a5,4(a4)
   49d94:	bff9                	j	49d72 <_malloc_r+0x92>
   49d96:	8722                	mv	a4,s0
   49d98:	4040                	lw	s0,4(s0)
   49d9a:	b771                	j	49d26 <_malloc_r+0x46>
   49d9c:	00350413          	add	s0,a0,3
   49da0:	9879                	and	s0,s0,-2
   49da2:	9875                	and	s0,s0,-3
   49da4:	fc8500e3          	beq	a0,s0,49d64 <_malloc_r+0x84>
   49da8:	40a405b3          	sub	a1,s0,a0
   49dac:	854a                	mv	a0,s2
   49dae:	2d9d                	jal	4a424 <_sbrk_r>
   49db0:	fb351ae3          	bne	a0,s3,49d64 <_malloc_r+0x84>
   49db4:	bf41                	j	49d44 <_malloc_r+0x64>

00049db6 <__ssputs_r>:
   49db6:	1101                	add	sp,sp,-32
   49db8:	c84a                	sw	s2,16(sp)
   49dba:	0085a903          	lw	s2,8(a1)
   49dbe:	cc22                	sw	s0,24(sp)
   49dc0:	c64e                	sw	s3,12(sp)
   49dc2:	c452                	sw	s4,8(sp)
   49dc4:	c256                	sw	s5,4(sp)
   49dc6:	ce06                	sw	ra,28(sp)
   49dc8:	ca26                	sw	s1,20(sp)
   49dca:	c05a                	sw	s6,0(sp)
   49dcc:	0005aa03          	lw	s4,0(a1)
   49dd0:	842e                	mv	s0,a1
   49dd2:	8ab2                	mv	s5,a2
   49dd4:	89b6                	mv	s3,a3
   49dd6:	0726e863          	bltu	a3,s2,49e46 <__ssputs_r+0x90>
   49dda:	00c59783          	lh	a5,12(a1)
   49dde:	4807f713          	and	a4,a5,1152
   49de2:	c325                	beqz	a4,49e42 <__ssputs_r+0x8c>
   49de4:	4844                	lw	s1,20(s0)
   49de6:	4709                	li	a4,2
   49de8:	498c                	lw	a1,16(a1)
   49dea:	2094a4b3          	sh1add	s1,s1,s1
   49dee:	02e4c4b3          	div	s1,s1,a4
   49df2:	40ba0a33          	sub	s4,s4,a1
   49df6:	00168713          	add	a4,a3,1
   49dfa:	9752                	add	a4,a4,s4
   49dfc:	4007f793          	and	a5,a5,1024
   49e00:	8b2a                	mv	s6,a0
   49e02:	0ae4f4b3          	maxu	s1,s1,a4
   49e06:	cba5                	beqz	a5,49e76 <__ssputs_r+0xc0>
   49e08:	85a6                	mv	a1,s1
   49e0a:	ed7ff0ef          	jal	49ce0 <_malloc_r>
   49e0e:	892a                	mv	s2,a0
   49e10:	cd25                	beqz	a0,49e88 <__ssputs_r+0xd2>
   49e12:	480c                	lw	a1,16(s0)
   49e14:	8652                	mv	a2,s4
   49e16:	878f90ef          	jal	42e8e <memcpy>
   49e1a:	00c45783          	lhu	a5,12(s0)
   49e1e:	f7f7f793          	and	a5,a5,-129
   49e22:	bff7f793          	and	a5,a5,-1025
   49e26:	0807e793          	or	a5,a5,128
   49e2a:	00f41623          	sh	a5,12(s0)
   49e2e:	01242823          	sw	s2,16(s0)
   49e32:	c844                	sw	s1,20(s0)
   49e34:	9952                	add	s2,s2,s4
   49e36:	414484b3          	sub	s1,s1,s4
   49e3a:	01242023          	sw	s2,0(s0)
   49e3e:	c404                	sw	s1,8(s0)
   49e40:	894e                	mv	s2,s3
   49e42:	0129f363          	bgeu	s3,s2,49e48 <__ssputs_r+0x92>
   49e46:	894e                	mv	s2,s3
   49e48:	4008                	lw	a0,0(s0)
   49e4a:	864a                	mv	a2,s2
   49e4c:	85d6                	mv	a1,s5
   49e4e:	866f90ef          	jal	42eb4 <memmove>
   49e52:	441c                	lw	a5,8(s0)
   49e54:	4501                	li	a0,0
   49e56:	412787b3          	sub	a5,a5,s2
   49e5a:	c41c                	sw	a5,8(s0)
   49e5c:	401c                	lw	a5,0(s0)
   49e5e:	97ca                	add	a5,a5,s2
   49e60:	c01c                	sw	a5,0(s0)
   49e62:	40f2                	lw	ra,28(sp)
   49e64:	4462                	lw	s0,24(sp)
   49e66:	44d2                	lw	s1,20(sp)
   49e68:	4942                	lw	s2,16(sp)
   49e6a:	49b2                	lw	s3,12(sp)
   49e6c:	4a22                	lw	s4,8(sp)
   49e6e:	4a92                	lw	s5,4(sp)
   49e70:	4b02                	lw	s6,0(sp)
   49e72:	6105                	add	sp,sp,32
   49e74:	8082                	ret
   49e76:	8626                	mv	a2,s1
   49e78:	1f3000ef          	jal	4a86a <_realloc_r>
   49e7c:	892a                	mv	s2,a0
   49e7e:	f945                	bnez	a0,49e2e <__ssputs_r+0x78>
   49e80:	480c                	lw	a1,16(s0)
   49e82:	855a                	mv	a0,s6
   49e84:	dbbff0ef          	jal	49c3e <_free_r>
   49e88:	47b1                	li	a5,12
   49e8a:	00fb2023          	sw	a5,0(s6)
   49e8e:	00c45783          	lhu	a5,12(s0)
   49e92:	557d                	li	a0,-1
   49e94:	0407e793          	or	a5,a5,64
   49e98:	00f41623          	sh	a5,12(s0)
   49e9c:	b7d9                	j	49e62 <__ssputs_r+0xac>

00049e9e <_svfiprintf_r>:
   49e9e:	00c5d783          	lhu	a5,12(a1)
   49ea2:	7171                	add	sp,sp,-176
   49ea4:	d522                	sw	s0,168(sp)
   49ea6:	d326                	sw	s1,164(sp)
   49ea8:	d14a                	sw	s2,160(sp)
   49eaa:	cd52                	sw	s4,152(sp)
   49eac:	d706                	sw	ra,172(sp)
   49eae:	cf4e                	sw	s3,156(sp)
   49eb0:	cb56                	sw	s5,148(sp)
   49eb2:	c95a                	sw	s6,144(sp)
   49eb4:	c75e                	sw	s7,140(sp)
   49eb6:	c562                	sw	s8,136(sp)
   49eb8:	c366                	sw	s9,132(sp)
   49eba:	c16a                	sw	s10,128(sp)
   49ebc:	deee                	sw	s11,124(sp)
   49ebe:	0807f793          	and	a5,a5,128
   49ec2:	8a2a                	mv	s4,a0
   49ec4:	892e                	mv	s2,a1
   49ec6:	84b2                	mv	s1,a2
   49ec8:	8436                	mv	s0,a3
   49eca:	c3b9                	beqz	a5,49f10 <_svfiprintf_r+0x72>
   49ecc:	499c                	lw	a5,16(a1)
   49ece:	e3a9                	bnez	a5,49f10 <_svfiprintf_r+0x72>
   49ed0:	04000593          	li	a1,64
   49ed4:	e0dff0ef          	jal	49ce0 <_malloc_r>
   49ed8:	00a92023          	sw	a0,0(s2)
   49edc:	00a92823          	sw	a0,16(s2)
   49ee0:	e505                	bnez	a0,49f08 <_svfiprintf_r+0x6a>
   49ee2:	47b1                	li	a5,12
   49ee4:	00fa2023          	sw	a5,0(s4)
   49ee8:	557d                	li	a0,-1
   49eea:	50ba                	lw	ra,172(sp)
   49eec:	542a                	lw	s0,168(sp)
   49eee:	549a                	lw	s1,164(sp)
   49ef0:	590a                	lw	s2,160(sp)
   49ef2:	49fa                	lw	s3,156(sp)
   49ef4:	4a6a                	lw	s4,152(sp)
   49ef6:	4ada                	lw	s5,148(sp)
   49ef8:	4b4a                	lw	s6,144(sp)
   49efa:	4bba                	lw	s7,140(sp)
   49efc:	4c2a                	lw	s8,136(sp)
   49efe:	4c9a                	lw	s9,132(sp)
   49f00:	4d0a                	lw	s10,128(sp)
   49f02:	5df6                	lw	s11,124(sp)
   49f04:	614d                	add	sp,sp,176
   49f06:	8082                	ret
   49f08:	04000793          	li	a5,64
   49f0c:	00f92a23          	sw	a5,20(s2)
   49f10:	02000793          	li	a5,32
   49f14:	02f104a3          	sb	a5,41(sp)
   49f18:	00046ab7          	lui	s5,0x46
   49f1c:	03000793          	li	a5,48
   49f20:	d202                	sw	zero,36(sp)
   49f22:	02f10523          	sb	a5,42(sp)
   49f26:	c622                	sw	s0,12(sp)
   49f28:	02500c93          	li	s9,37
   49f2c:	0004bb37          	lui	s6,0x4b
   49f30:	0004bbb7          	lui	s7,0x4b
   49f34:	0004bd37          	lui	s10,0x4b
   49f38:	0004ac37          	lui	s8,0x4a
   49f3c:	a0ea8a93          	add	s5,s5,-1522 # 45a0e <_printf_float>
   49f40:	8426                	mv	s0,s1
   49f42:	00044783          	lbu	a5,0(s0)
   49f46:	c399                	beqz	a5,49f4c <_svfiprintf_r+0xae>
   49f48:	09979f63          	bne	a5,s9,49fe6 <_svfiprintf_r+0x148>
   49f4c:	40940db3          	sub	s11,s0,s1
   49f50:	00940e63          	beq	s0,s1,49f6c <_svfiprintf_r+0xce>
   49f54:	86ee                	mv	a3,s11
   49f56:	8626                	mv	a2,s1
   49f58:	85ca                	mv	a1,s2
   49f5a:	8552                	mv	a0,s4
   49f5c:	e5bff0ef          	jal	49db6 <__ssputs_r>
   49f60:	57fd                	li	a5,-1
   49f62:	18f50963          	beq	a0,a5,4a0f4 <_svfiprintf_r+0x256>
   49f66:	5792                	lw	a5,36(sp)
   49f68:	97ee                	add	a5,a5,s11
   49f6a:	d23e                	sw	a5,36(sp)
   49f6c:	00044783          	lbu	a5,0(s0)
   49f70:	18078263          	beqz	a5,4a0f4 <_svfiprintf_r+0x256>
   49f74:	57fd                	li	a5,-1
   49f76:	00140493          	add	s1,s0,1
   49f7a:	c802                	sw	zero,16(sp)
   49f7c:	ce02                	sw	zero,28(sp)
   49f7e:	ca3e                	sw	a5,20(sp)
   49f80:	cc02                	sw	zero,24(sp)
   49f82:	040109a3          	sb	zero,83(sp)
   49f86:	d482                	sw	zero,104(sp)
   49f88:	0004c583          	lbu	a1,0(s1)
   49f8c:	4615                	li	a2,5
   49f8e:	eecb0513          	add	a0,s6,-276 # 4aeec <__clz_tab+0x438>
   49f92:	926ff0ef          	jal	490b8 <memchr>
   49f96:	47c2                	lw	a5,16(sp)
   49f98:	00148413          	add	s0,s1,1
   49f9c:	e539                	bnez	a0,49fea <_svfiprintf_r+0x14c>
   49f9e:	0107f713          	and	a4,a5,16
   49fa2:	c709                	beqz	a4,49fac <_svfiprintf_r+0x10e>
   49fa4:	02000713          	li	a4,32
   49fa8:	04e109a3          	sb	a4,83(sp)
   49fac:	0087f713          	and	a4,a5,8
   49fb0:	c709                	beqz	a4,49fba <_svfiprintf_r+0x11c>
   49fb2:	02b00713          	li	a4,43
   49fb6:	04e109a3          	sb	a4,83(sp)
   49fba:	0004c683          	lbu	a3,0(s1)
   49fbe:	02a00713          	li	a4,42
   49fc2:	02e68c63          	beq	a3,a4,49ffa <_svfiprintf_r+0x15c>
   49fc6:	47f2                	lw	a5,28(sp)
   49fc8:	8426                	mv	s0,s1
   49fca:	4681                	li	a3,0
   49fcc:	4625                	li	a2,9
   49fce:	4529                	li	a0,10
   49fd0:	00044703          	lbu	a4,0(s0)
   49fd4:	00140593          	add	a1,s0,1
   49fd8:	fd070713          	add	a4,a4,-48
   49fdc:	06e67563          	bgeu	a2,a4,4a046 <_svfiprintf_r+0x1a8>
   49fe0:	c68d                	beqz	a3,4a00a <_svfiprintf_r+0x16c>
   49fe2:	ce3e                	sw	a5,28(sp)
   49fe4:	a01d                	j	4a00a <_svfiprintf_r+0x16c>
   49fe6:	0405                	add	s0,s0,1
   49fe8:	bfa9                	j	49f42 <_svfiprintf_r+0xa4>
   49fea:	eecb0713          	add	a4,s6,-276
   49fee:	8d19                	sub	a0,a0,a4
   49ff0:	28a797b3          	bset	a5,a5,a0
   49ff4:	84a2                	mv	s1,s0
   49ff6:	c83e                	sw	a5,16(sp)
   49ff8:	bf41                	j	49f88 <_svfiprintf_r+0xea>
   49ffa:	4732                	lw	a4,12(sp)
   49ffc:	00470693          	add	a3,a4,4
   4a000:	4318                	lw	a4,0(a4)
   4a002:	c636                	sw	a3,12(sp)
   4a004:	02074a63          	bltz	a4,4a038 <_svfiprintf_r+0x19a>
   4a008:	ce3a                	sw	a4,28(sp)
   4a00a:	00044703          	lbu	a4,0(s0)
   4a00e:	02e00793          	li	a5,46
   4a012:	04f71f63          	bne	a4,a5,4a070 <_svfiprintf_r+0x1d2>
   4a016:	00144703          	lbu	a4,1(s0)
   4a01a:	02a00793          	li	a5,42
   4a01e:	02f71a63          	bne	a4,a5,4a052 <_svfiprintf_r+0x1b4>
   4a022:	47b2                	lw	a5,12(sp)
   4a024:	0409                	add	s0,s0,2
   4a026:	00478713          	add	a4,a5,4
   4a02a:	439c                	lw	a5,0(a5)
   4a02c:	c63a                	sw	a4,12(sp)
   4a02e:	577d                	li	a4,-1
   4a030:	0ae7e7b3          	max	a5,a5,a4
   4a034:	ca3e                	sw	a5,20(sp)
   4a036:	a82d                	j	4a070 <_svfiprintf_r+0x1d2>
   4a038:	40e00733          	neg	a4,a4
   4a03c:	0027e793          	or	a5,a5,2
   4a040:	ce3a                	sw	a4,28(sp)
   4a042:	c83e                	sw	a5,16(sp)
   4a044:	b7d9                	j	4a00a <_svfiprintf_r+0x16c>
   4a046:	02a787b3          	mul	a5,a5,a0
   4a04a:	842e                	mv	s0,a1
   4a04c:	4685                	li	a3,1
   4a04e:	97ba                	add	a5,a5,a4
   4a050:	b741                	j	49fd0 <_svfiprintf_r+0x132>
   4a052:	0405                	add	s0,s0,1
   4a054:	ca02                	sw	zero,20(sp)
   4a056:	4681                	li	a3,0
   4a058:	4781                	li	a5,0
   4a05a:	4625                	li	a2,9
   4a05c:	4529                	li	a0,10
   4a05e:	00044703          	lbu	a4,0(s0)
   4a062:	00140593          	add	a1,s0,1
   4a066:	fd070713          	add	a4,a4,-48
   4a06a:	04e67f63          	bgeu	a2,a4,4a0c8 <_svfiprintf_r+0x22a>
   4a06e:	f2f9                	bnez	a3,4a034 <_svfiprintf_r+0x196>
   4a070:	00044583          	lbu	a1,0(s0)
   4a074:	460d                	li	a2,3
   4a076:	ef4b8513          	add	a0,s7,-268 # 4aef4 <__clz_tab+0x440>
   4a07a:	83eff0ef          	jal	490b8 <memchr>
   4a07e:	cd01                	beqz	a0,4a096 <_svfiprintf_r+0x1f8>
   4a080:	ef4b8793          	add	a5,s7,-268
   4a084:	8d1d                	sub	a0,a0,a5
   4a086:	47c2                	lw	a5,16(sp)
   4a088:	04000713          	li	a4,64
   4a08c:	00a71733          	sll	a4,a4,a0
   4a090:	8fd9                	or	a5,a5,a4
   4a092:	0405                	add	s0,s0,1
   4a094:	c83e                	sw	a5,16(sp)
   4a096:	00044583          	lbu	a1,0(s0)
   4a09a:	4619                	li	a2,6
   4a09c:	ef8d0513          	add	a0,s10,-264 # 4aef8 <__clz_tab+0x444>
   4a0a0:	00140493          	add	s1,s0,1
   4a0a4:	02b10423          	sb	a1,40(sp)
   4a0a8:	810ff0ef          	jal	490b8 <memchr>
   4a0ac:	cd21                	beqz	a0,4a104 <_svfiprintf_r+0x266>
   4a0ae:	020a9763          	bnez	s5,4a0dc <_svfiprintf_r+0x23e>
   4a0b2:	4742                	lw	a4,16(sp)
   4a0b4:	47b2                	lw	a5,12(sp)
   4a0b6:	10077713          	and	a4,a4,256
   4a0ba:	cf09                	beqz	a4,4a0d4 <_svfiprintf_r+0x236>
   4a0bc:	0791                	add	a5,a5,4
   4a0be:	c63e                	sw	a5,12(sp)
   4a0c0:	5792                	lw	a5,36(sp)
   4a0c2:	97ce                	add	a5,a5,s3
   4a0c4:	d23e                	sw	a5,36(sp)
   4a0c6:	bdad                	j	49f40 <_svfiprintf_r+0xa2>
   4a0c8:	02a787b3          	mul	a5,a5,a0
   4a0cc:	842e                	mv	s0,a1
   4a0ce:	4685                	li	a3,1
   4a0d0:	97ba                	add	a5,a5,a4
   4a0d2:	b771                	j	4a05e <_svfiprintf_r+0x1c0>
   4a0d4:	079d                	add	a5,a5,7
   4a0d6:	9be1                	and	a5,a5,-8
   4a0d8:	07a1                	add	a5,a5,8
   4a0da:	b7d5                	j	4a0be <_svfiprintf_r+0x220>
   4a0dc:	0078                	add	a4,sp,12
   4a0de:	db6c0693          	add	a3,s8,-586 # 49db6 <__ssputs_r>
   4a0e2:	864a                	mv	a2,s2
   4a0e4:	080c                	add	a1,sp,16
   4a0e6:	8552                	mv	a0,s4
   4a0e8:	927fb0ef          	jal	45a0e <_printf_float>
   4a0ec:	57fd                	li	a5,-1
   4a0ee:	89aa                	mv	s3,a0
   4a0f0:	fcf518e3          	bne	a0,a5,4a0c0 <_svfiprintf_r+0x222>
   4a0f4:	00c95783          	lhu	a5,12(s2)
   4a0f8:	0407f793          	and	a5,a5,64
   4a0fc:	de0796e3          	bnez	a5,49ee8 <_svfiprintf_r+0x4a>
   4a100:	5512                	lw	a0,36(sp)
   4a102:	b3e5                	j	49eea <_svfiprintf_r+0x4c>
   4a104:	0078                	add	a4,sp,12
   4a106:	db6c0693          	add	a3,s8,-586
   4a10a:	864a                	mv	a2,s2
   4a10c:	080c                	add	a1,sp,16
   4a10e:	8552                	mv	a0,s4
   4a110:	eb3fb0ef          	jal	45fc2 <_printf_i>
   4a114:	bfe1                	j	4a0ec <_svfiprintf_r+0x24e>

0004a116 <__sfputc_r>:
   4a116:	461c                	lw	a5,8(a2)
   4a118:	17fd                	add	a5,a5,-1
   4a11a:	c61c                	sw	a5,8(a2)
   4a11c:	0007d963          	bgez	a5,4a12e <__sfputc_r+0x18>
   4a120:	4e18                	lw	a4,24(a2)
   4a122:	00e7c563          	blt	a5,a4,4a12c <__sfputc_r+0x16>
   4a126:	47a9                	li	a5,10
   4a128:	00f59363          	bne	a1,a5,4a12e <__sfputc_r+0x18>
   4a12c:	a909                	j	4a53e <__swbuf_r>
   4a12e:	421c                	lw	a5,0(a2)
   4a130:	852e                	mv	a0,a1
   4a132:	00178713          	add	a4,a5,1
   4a136:	c218                	sw	a4,0(a2)
   4a138:	00b78023          	sb	a1,0(a5)
   4a13c:	8082                	ret

0004a13e <__sfputs_r>:
   4a13e:	1101                	add	sp,sp,-32
   4a140:	cc22                	sw	s0,24(sp)
   4a142:	ca26                	sw	s1,20(sp)
   4a144:	c84a                	sw	s2,16(sp)
   4a146:	c64e                	sw	s3,12(sp)
   4a148:	c452                	sw	s4,8(sp)
   4a14a:	ce06                	sw	ra,28(sp)
   4a14c:	892a                	mv	s2,a0
   4a14e:	89ae                	mv	s3,a1
   4a150:	8432                	mv	s0,a2
   4a152:	00d604b3          	add	s1,a2,a3
   4a156:	5a7d                	li	s4,-1
   4a158:	00941463          	bne	s0,s1,4a160 <__sfputs_r+0x22>
   4a15c:	4501                	li	a0,0
   4a15e:	a811                	j	4a172 <__sfputs_r+0x34>
   4a160:	00044583          	lbu	a1,0(s0)
   4a164:	864e                	mv	a2,s3
   4a166:	854a                	mv	a0,s2
   4a168:	fafff0ef          	jal	4a116 <__sfputc_r>
   4a16c:	0405                	add	s0,s0,1
   4a16e:	ff4515e3          	bne	a0,s4,4a158 <__sfputs_r+0x1a>
   4a172:	40f2                	lw	ra,28(sp)
   4a174:	4462                	lw	s0,24(sp)
   4a176:	44d2                	lw	s1,20(sp)
   4a178:	4942                	lw	s2,16(sp)
   4a17a:	49b2                	lw	s3,12(sp)
   4a17c:	4a22                	lw	s4,8(sp)
   4a17e:	6105                	add	sp,sp,32
   4a180:	8082                	ret

0004a182 <_vfiprintf_r>:
   4a182:	7171                	add	sp,sp,-176
   4a184:	d522                	sw	s0,168(sp)
   4a186:	d326                	sw	s1,164(sp)
   4a188:	d14a                	sw	s2,160(sp)
   4a18a:	cf4e                	sw	s3,156(sp)
   4a18c:	d706                	sw	ra,172(sp)
   4a18e:	cd52                	sw	s4,152(sp)
   4a190:	cb56                	sw	s5,148(sp)
   4a192:	c95a                	sw	s6,144(sp)
   4a194:	c75e                	sw	s7,140(sp)
   4a196:	c562                	sw	s8,136(sp)
   4a198:	c366                	sw	s9,132(sp)
   4a19a:	c16a                	sw	s10,128(sp)
   4a19c:	deee                	sw	s11,124(sp)
   4a19e:	89aa                	mv	s3,a0
   4a1a0:	84ae                	mv	s1,a1
   4a1a2:	8932                	mv	s2,a2
   4a1a4:	8436                	mv	s0,a3
   4a1a6:	c509                	beqz	a0,4a1b0 <_vfiprintf_r+0x2e>
   4a1a8:	4d1c                	lw	a5,24(a0)
   4a1aa:	e399                	bnez	a5,4a1b0 <_vfiprintf_r+0x2e>
   4a1ac:	ca6fe0ef          	jal	48652 <__sinit>
   4a1b0:	0004b7b7          	lui	a5,0x4b
   4a1b4:	2b478793          	add	a5,a5,692 # 4b2b4 <__sf_fake_stdin>
   4a1b8:	0ef49763          	bne	s1,a5,4a2a6 <_vfiprintf_r+0x124>
   4a1bc:	0049a483          	lw	s1,4(s3)
   4a1c0:	00c4d783          	lhu	a5,12(s1)
   4a1c4:	8ba1                	and	a5,a5,8
   4a1c6:	10078263          	beqz	a5,4a2ca <_vfiprintf_r+0x148>
   4a1ca:	489c                	lw	a5,16(s1)
   4a1cc:	0e078f63          	beqz	a5,4a2ca <_vfiprintf_r+0x148>
   4a1d0:	02000793          	li	a5,32
   4a1d4:	02f104a3          	sb	a5,41(sp)
   4a1d8:	00046ab7          	lui	s5,0x46
   4a1dc:	03000793          	li	a5,48
   4a1e0:	d202                	sw	zero,36(sp)
   4a1e2:	02f10523          	sb	a5,42(sp)
   4a1e6:	c622                	sw	s0,12(sp)
   4a1e8:	02500c93          	li	s9,37
   4a1ec:	0004bb37          	lui	s6,0x4b
   4a1f0:	0004bbb7          	lui	s7,0x4b
   4a1f4:	0004bd37          	lui	s10,0x4b
   4a1f8:	0004ac37          	lui	s8,0x4a
   4a1fc:	a0ea8a93          	add	s5,s5,-1522 # 45a0e <_printf_float>
   4a200:	844a                	mv	s0,s2
   4a202:	00044783          	lbu	a5,0(s0)
   4a206:	c399                	beqz	a5,4a20c <_vfiprintf_r+0x8a>
   4a208:	0f979663          	bne	a5,s9,4a2f4 <_vfiprintf_r+0x172>
   4a20c:	41240db3          	sub	s11,s0,s2
   4a210:	01240e63          	beq	s0,s2,4a22c <_vfiprintf_r+0xaa>
   4a214:	86ee                	mv	a3,s11
   4a216:	864a                	mv	a2,s2
   4a218:	85a6                	mv	a1,s1
   4a21a:	854e                	mv	a0,s3
   4a21c:	f23ff0ef          	jal	4a13e <__sfputs_r>
   4a220:	57fd                	li	a5,-1
   4a222:	1ef50063          	beq	a0,a5,4a402 <_vfiprintf_r+0x280>
   4a226:	5792                	lw	a5,36(sp)
   4a228:	97ee                	add	a5,a5,s11
   4a22a:	d23e                	sw	a5,36(sp)
   4a22c:	00044783          	lbu	a5,0(s0)
   4a230:	1c078963          	beqz	a5,4a402 <_vfiprintf_r+0x280>
   4a234:	57fd                	li	a5,-1
   4a236:	00140913          	add	s2,s0,1
   4a23a:	c802                	sw	zero,16(sp)
   4a23c:	ce02                	sw	zero,28(sp)
   4a23e:	ca3e                	sw	a5,20(sp)
   4a240:	cc02                	sw	zero,24(sp)
   4a242:	040109a3          	sb	zero,83(sp)
   4a246:	d482                	sw	zero,104(sp)
   4a248:	00094583          	lbu	a1,0(s2)
   4a24c:	4615                	li	a2,5
   4a24e:	eecb0513          	add	a0,s6,-276 # 4aeec <__clz_tab+0x438>
   4a252:	e67fe0ef          	jal	490b8 <memchr>
   4a256:	47c2                	lw	a5,16(sp)
   4a258:	00190413          	add	s0,s2,1
   4a25c:	ed51                	bnez	a0,4a2f8 <_vfiprintf_r+0x176>
   4a25e:	0107f713          	and	a4,a5,16
   4a262:	c709                	beqz	a4,4a26c <_vfiprintf_r+0xea>
   4a264:	02000713          	li	a4,32
   4a268:	04e109a3          	sb	a4,83(sp)
   4a26c:	0087f713          	and	a4,a5,8
   4a270:	c709                	beqz	a4,4a27a <_vfiprintf_r+0xf8>
   4a272:	02b00713          	li	a4,43
   4a276:	04e109a3          	sb	a4,83(sp)
   4a27a:	00094683          	lbu	a3,0(s2)
   4a27e:	02a00713          	li	a4,42
   4a282:	08e68363          	beq	a3,a4,4a308 <_vfiprintf_r+0x186>
   4a286:	47f2                	lw	a5,28(sp)
   4a288:	844a                	mv	s0,s2
   4a28a:	4681                	li	a3,0
   4a28c:	4625                	li	a2,9
   4a28e:	4529                	li	a0,10
   4a290:	00044703          	lbu	a4,0(s0)
   4a294:	00140593          	add	a1,s0,1
   4a298:	fd070713          	add	a4,a4,-48
   4a29c:	0ae67c63          	bgeu	a2,a4,4a354 <_vfiprintf_r+0x1d2>
   4a2a0:	cea5                	beqz	a3,4a318 <_vfiprintf_r+0x196>
   4a2a2:	ce3e                	sw	a5,28(sp)
   4a2a4:	a895                	j	4a318 <_vfiprintf_r+0x196>
   4a2a6:	0004b7b7          	lui	a5,0x4b
   4a2aa:	29478793          	add	a5,a5,660 # 4b294 <__sf_fake_stdout>
   4a2ae:	00f49563          	bne	s1,a5,4a2b8 <_vfiprintf_r+0x136>
   4a2b2:	0089a483          	lw	s1,8(s3)
   4a2b6:	b729                	j	4a1c0 <_vfiprintf_r+0x3e>
   4a2b8:	0004b7b7          	lui	a5,0x4b
   4a2bc:	27478793          	add	a5,a5,628 # 4b274 <__sf_fake_stderr>
   4a2c0:	f0f490e3          	bne	s1,a5,4a1c0 <_vfiprintf_r+0x3e>
   4a2c4:	00c9a483          	lw	s1,12(s3)
   4a2c8:	bde5                	j	4a1c0 <_vfiprintf_r+0x3e>
   4a2ca:	85a6                	mv	a1,s1
   4a2cc:	854e                	mv	a0,s3
   4a2ce:	2659                	jal	4a654 <__swsetup_r>
   4a2d0:	f00500e3          	beqz	a0,4a1d0 <_vfiprintf_r+0x4e>
   4a2d4:	557d                	li	a0,-1
   4a2d6:	50ba                	lw	ra,172(sp)
   4a2d8:	542a                	lw	s0,168(sp)
   4a2da:	549a                	lw	s1,164(sp)
   4a2dc:	590a                	lw	s2,160(sp)
   4a2de:	49fa                	lw	s3,156(sp)
   4a2e0:	4a6a                	lw	s4,152(sp)
   4a2e2:	4ada                	lw	s5,148(sp)
   4a2e4:	4b4a                	lw	s6,144(sp)
   4a2e6:	4bba                	lw	s7,140(sp)
   4a2e8:	4c2a                	lw	s8,136(sp)
   4a2ea:	4c9a                	lw	s9,132(sp)
   4a2ec:	4d0a                	lw	s10,128(sp)
   4a2ee:	5df6                	lw	s11,124(sp)
   4a2f0:	614d                	add	sp,sp,176
   4a2f2:	8082                	ret
   4a2f4:	0405                	add	s0,s0,1
   4a2f6:	b731                	j	4a202 <_vfiprintf_r+0x80>
   4a2f8:	eecb0713          	add	a4,s6,-276
   4a2fc:	8d19                	sub	a0,a0,a4
   4a2fe:	28a797b3          	bset	a5,a5,a0
   4a302:	8922                	mv	s2,s0
   4a304:	c83e                	sw	a5,16(sp)
   4a306:	b789                	j	4a248 <_vfiprintf_r+0xc6>
   4a308:	4732                	lw	a4,12(sp)
   4a30a:	00470693          	add	a3,a4,4
   4a30e:	4318                	lw	a4,0(a4)
   4a310:	c636                	sw	a3,12(sp)
   4a312:	02074a63          	bltz	a4,4a346 <_vfiprintf_r+0x1c4>
   4a316:	ce3a                	sw	a4,28(sp)
   4a318:	00044703          	lbu	a4,0(s0)
   4a31c:	02e00793          	li	a5,46
   4a320:	04f71f63          	bne	a4,a5,4a37e <_vfiprintf_r+0x1fc>
   4a324:	00144703          	lbu	a4,1(s0)
   4a328:	02a00793          	li	a5,42
   4a32c:	02f71a63          	bne	a4,a5,4a360 <_vfiprintf_r+0x1de>
   4a330:	47b2                	lw	a5,12(sp)
   4a332:	0409                	add	s0,s0,2
   4a334:	00478713          	add	a4,a5,4
   4a338:	439c                	lw	a5,0(a5)
   4a33a:	c63a                	sw	a4,12(sp)
   4a33c:	577d                	li	a4,-1
   4a33e:	0ae7e7b3          	max	a5,a5,a4
   4a342:	ca3e                	sw	a5,20(sp)
   4a344:	a82d                	j	4a37e <_vfiprintf_r+0x1fc>
   4a346:	40e00733          	neg	a4,a4
   4a34a:	0027e793          	or	a5,a5,2
   4a34e:	ce3a                	sw	a4,28(sp)
   4a350:	c83e                	sw	a5,16(sp)
   4a352:	b7d9                	j	4a318 <_vfiprintf_r+0x196>
   4a354:	02a787b3          	mul	a5,a5,a0
   4a358:	842e                	mv	s0,a1
   4a35a:	4685                	li	a3,1
   4a35c:	97ba                	add	a5,a5,a4
   4a35e:	bf0d                	j	4a290 <_vfiprintf_r+0x10e>
   4a360:	0405                	add	s0,s0,1
   4a362:	ca02                	sw	zero,20(sp)
   4a364:	4681                	li	a3,0
   4a366:	4781                	li	a5,0
   4a368:	4625                	li	a2,9
   4a36a:	4529                	li	a0,10
   4a36c:	00044703          	lbu	a4,0(s0)
   4a370:	00140593          	add	a1,s0,1
   4a374:	fd070713          	add	a4,a4,-48
   4a378:	04e67f63          	bgeu	a2,a4,4a3d6 <_vfiprintf_r+0x254>
   4a37c:	f2f9                	bnez	a3,4a342 <_vfiprintf_r+0x1c0>
   4a37e:	00044583          	lbu	a1,0(s0)
   4a382:	460d                	li	a2,3
   4a384:	ef4b8513          	add	a0,s7,-268 # 4aef4 <__clz_tab+0x440>
   4a388:	d31fe0ef          	jal	490b8 <memchr>
   4a38c:	cd01                	beqz	a0,4a3a4 <_vfiprintf_r+0x222>
   4a38e:	ef4b8793          	add	a5,s7,-268
   4a392:	8d1d                	sub	a0,a0,a5
   4a394:	47c2                	lw	a5,16(sp)
   4a396:	04000713          	li	a4,64
   4a39a:	00a71733          	sll	a4,a4,a0
   4a39e:	8fd9                	or	a5,a5,a4
   4a3a0:	0405                	add	s0,s0,1
   4a3a2:	c83e                	sw	a5,16(sp)
   4a3a4:	00044583          	lbu	a1,0(s0)
   4a3a8:	4619                	li	a2,6
   4a3aa:	ef8d0513          	add	a0,s10,-264 # 4aef8 <__clz_tab+0x444>
   4a3ae:	00140913          	add	s2,s0,1
   4a3b2:	02b10423          	sb	a1,40(sp)
   4a3b6:	d03fe0ef          	jal	490b8 <memchr>
   4a3ba:	cd21                	beqz	a0,4a412 <_vfiprintf_r+0x290>
   4a3bc:	020a9763          	bnez	s5,4a3ea <_vfiprintf_r+0x268>
   4a3c0:	4742                	lw	a4,16(sp)
   4a3c2:	47b2                	lw	a5,12(sp)
   4a3c4:	10077713          	and	a4,a4,256
   4a3c8:	cf09                	beqz	a4,4a3e2 <_vfiprintf_r+0x260>
   4a3ca:	0791                	add	a5,a5,4
   4a3cc:	c63e                	sw	a5,12(sp)
   4a3ce:	5792                	lw	a5,36(sp)
   4a3d0:	97d2                	add	a5,a5,s4
   4a3d2:	d23e                	sw	a5,36(sp)
   4a3d4:	b535                	j	4a200 <_vfiprintf_r+0x7e>
   4a3d6:	02a787b3          	mul	a5,a5,a0
   4a3da:	842e                	mv	s0,a1
   4a3dc:	4685                	li	a3,1
   4a3de:	97ba                	add	a5,a5,a4
   4a3e0:	b771                	j	4a36c <_vfiprintf_r+0x1ea>
   4a3e2:	079d                	add	a5,a5,7
   4a3e4:	9be1                	and	a5,a5,-8
   4a3e6:	07a1                	add	a5,a5,8
   4a3e8:	b7d5                	j	4a3cc <_vfiprintf_r+0x24a>
   4a3ea:	0078                	add	a4,sp,12
   4a3ec:	13ec0693          	add	a3,s8,318 # 4a13e <__sfputs_r>
   4a3f0:	8626                	mv	a2,s1
   4a3f2:	080c                	add	a1,sp,16
   4a3f4:	854e                	mv	a0,s3
   4a3f6:	e18fb0ef          	jal	45a0e <_printf_float>
   4a3fa:	57fd                	li	a5,-1
   4a3fc:	8a2a                	mv	s4,a0
   4a3fe:	fcf518e3          	bne	a0,a5,4a3ce <_vfiprintf_r+0x24c>
   4a402:	00c4d783          	lhu	a5,12(s1)
   4a406:	0407f793          	and	a5,a5,64
   4a40a:	ec0795e3          	bnez	a5,4a2d4 <_vfiprintf_r+0x152>
   4a40e:	5512                	lw	a0,36(sp)
   4a410:	b5d9                	j	4a2d6 <_vfiprintf_r+0x154>
   4a412:	0078                	add	a4,sp,12
   4a414:	13ec0693          	add	a3,s8,318
   4a418:	8626                	mv	a2,s1
   4a41a:	080c                	add	a1,sp,16
   4a41c:	854e                	mv	a0,s3
   4a41e:	ba5fb0ef          	jal	45fc2 <_printf_i>
   4a422:	bfe1                	j	4a3fa <_vfiprintf_r+0x278>

0004a424 <_sbrk_r>:
   4a424:	1141                	add	sp,sp,-16
   4a426:	c422                	sw	s0,8(sp)
   4a428:	c226                	sw	s1,4(sp)
   4a42a:	842a                	mv	s0,a0
   4a42c:	852e                	mv	a0,a1
   4a42e:	c606                	sw	ra,12(sp)
   4a430:	4e01a623          	sw	zero,1260(gp) # 12d0cec <errno>
   4a434:	ce4fa0ef          	jal	44918 <_sbrk>
   4a438:	57fd                	li	a5,-1
   4a43a:	00f51663          	bne	a0,a5,4a446 <_sbrk_r+0x22>
   4a43e:	4ec1a783          	lw	a5,1260(gp) # 12d0cec <errno>
   4a442:	c391                	beqz	a5,4a446 <_sbrk_r+0x22>
   4a444:	c01c                	sw	a5,0(s0)
   4a446:	40b2                	lw	ra,12(sp)
   4a448:	4422                	lw	s0,8(sp)
   4a44a:	4492                	lw	s1,4(sp)
   4a44c:	0141                	add	sp,sp,16
   4a44e:	8082                	ret

0004a450 <nan>:
   4a450:	0004b7b7          	lui	a5,0x4b
   4a454:	4707a503          	lw	a0,1136(a5) # 4b470 <_global_impure_ptr+0x88>
   4a458:	4747a583          	lw	a1,1140(a5)
   4a45c:	8082                	ret

0004a45e <__sread>:
   4a45e:	1141                	add	sp,sp,-16
   4a460:	c422                	sw	s0,8(sp)
   4a462:	842e                	mv	s0,a1
   4a464:	00e59583          	lh	a1,14(a1)
   4a468:	c606                	sw	ra,12(sp)
   4a46a:	29a5                	jal	4a8e2 <_read_r>
   4a46c:	00054963          	bltz	a0,4a47e <__sread+0x20>
   4a470:	487c                	lw	a5,84(s0)
   4a472:	97aa                	add	a5,a5,a0
   4a474:	c87c                	sw	a5,84(s0)
   4a476:	40b2                	lw	ra,12(sp)
   4a478:	4422                	lw	s0,8(sp)
   4a47a:	0141                	add	sp,sp,16
   4a47c:	8082                	ret
   4a47e:	00c45783          	lhu	a5,12(s0)
   4a482:	48c79793          	bclr	a5,a5,0xc
   4a486:	00f41623          	sh	a5,12(s0)
   4a48a:	b7f5                	j	4a476 <__sread+0x18>

0004a48c <__swrite>:
   4a48c:	00c5d783          	lhu	a5,12(a1)
   4a490:	1101                	add	sp,sp,-32
   4a492:	cc22                	sw	s0,24(sp)
   4a494:	ca26                	sw	s1,20(sp)
   4a496:	c84a                	sw	s2,16(sp)
   4a498:	c64e                	sw	s3,12(sp)
   4a49a:	ce06                	sw	ra,28(sp)
   4a49c:	1007f793          	and	a5,a5,256
   4a4a0:	84aa                	mv	s1,a0
   4a4a2:	842e                	mv	s0,a1
   4a4a4:	8932                	mv	s2,a2
   4a4a6:	89b6                	mv	s3,a3
   4a4a8:	c791                	beqz	a5,4a4b4 <__swrite+0x28>
   4a4aa:	00e59583          	lh	a1,14(a1)
   4a4ae:	4689                	li	a3,2
   4a4b0:	4601                	li	a2,0
   4a4b2:	2659                	jal	4a838 <_lseek_r>
   4a4b4:	00c45783          	lhu	a5,12(s0)
   4a4b8:	00e41583          	lh	a1,14(s0)
   4a4bc:	40f2                	lw	ra,28(sp)
   4a4be:	48c79793          	bclr	a5,a5,0xc
   4a4c2:	00f41623          	sh	a5,12(s0)
   4a4c6:	4462                	lw	s0,24(sp)
   4a4c8:	86ce                	mv	a3,s3
   4a4ca:	864a                	mv	a2,s2
   4a4cc:	49b2                	lw	s3,12(sp)
   4a4ce:	4942                	lw	s2,16(sp)
   4a4d0:	8526                	mv	a0,s1
   4a4d2:	44d2                	lw	s1,20(sp)
   4a4d4:	6105                	add	sp,sp,32
   4a4d6:	a2b9                	j	4a624 <_write_r>

0004a4d8 <__sseek>:
   4a4d8:	1141                	add	sp,sp,-16
   4a4da:	c422                	sw	s0,8(sp)
   4a4dc:	842e                	mv	s0,a1
   4a4de:	00e59583          	lh	a1,14(a1)
   4a4e2:	c606                	sw	ra,12(sp)
   4a4e4:	2e91                	jal	4a838 <_lseek_r>
   4a4e6:	577d                	li	a4,-1
   4a4e8:	00c45783          	lhu	a5,12(s0)
   4a4ec:	00e51a63          	bne	a0,a4,4a500 <__sseek+0x28>
   4a4f0:	48c79793          	bclr	a5,a5,0xc
   4a4f4:	00f41623          	sh	a5,12(s0)
   4a4f8:	40b2                	lw	ra,12(sp)
   4a4fa:	4422                	lw	s0,8(sp)
   4a4fc:	0141                	add	sp,sp,16
   4a4fe:	8082                	ret
   4a500:	28c79793          	bset	a5,a5,0xc
   4a504:	c868                	sw	a0,84(s0)
   4a506:	00f41623          	sh	a5,12(s0)
   4a50a:	b7fd                	j	4a4f8 <__sseek+0x20>

0004a50c <__sclose>:
   4a50c:	00e59583          	lh	a1,14(a1)
   4a510:	a441                	j	4a790 <_close_r>

0004a512 <strncmp>:
   4a512:	c605                	beqz	a2,4a53a <strncmp+0x28>
   4a514:	167d                	add	a2,a2,-1
   4a516:	4701                	li	a4,0
   4a518:	00e507b3          	add	a5,a0,a4
   4a51c:	00e586b3          	add	a3,a1,a4
   4a520:	0007c783          	lbu	a5,0(a5)
   4a524:	0006c683          	lbu	a3,0(a3)
   4a528:	00d79663          	bne	a5,a3,4a534 <strncmp+0x22>
   4a52c:	00c70463          	beq	a4,a2,4a534 <strncmp+0x22>
   4a530:	0705                	add	a4,a4,1
   4a532:	f3fd                	bnez	a5,4a518 <strncmp+0x6>
   4a534:	40d78533          	sub	a0,a5,a3
   4a538:	8082                	ret
   4a53a:	4501                	li	a0,0
   4a53c:	8082                	ret

0004a53e <__swbuf_r>:
   4a53e:	1101                	add	sp,sp,-32
   4a540:	cc22                	sw	s0,24(sp)
   4a542:	ca26                	sw	s1,20(sp)
   4a544:	c84a                	sw	s2,16(sp)
   4a546:	ce06                	sw	ra,28(sp)
   4a548:	c64e                	sw	s3,12(sp)
   4a54a:	84aa                	mv	s1,a0
   4a54c:	892e                	mv	s2,a1
   4a54e:	8432                	mv	s0,a2
   4a550:	c509                	beqz	a0,4a55a <__swbuf_r+0x1c>
   4a552:	4d1c                	lw	a5,24(a0)
   4a554:	e399                	bnez	a5,4a55a <__swbuf_r+0x1c>
   4a556:	8fcfe0ef          	jal	48652 <__sinit>
   4a55a:	0004b7b7          	lui	a5,0x4b
   4a55e:	2b478793          	add	a5,a5,692 # 4b2b4 <__sf_fake_stdin>
   4a562:	02f41863          	bne	s0,a5,4a592 <__swbuf_r+0x54>
   4a566:	40c0                	lw	s0,4(s1)
   4a568:	4c1c                	lw	a5,24(s0)
   4a56a:	c41c                	sw	a5,8(s0)
   4a56c:	00c45783          	lhu	a5,12(s0)
   4a570:	8ba1                	and	a5,a5,8
   4a572:	c399                	beqz	a5,4a578 <__swbuf_r+0x3a>
   4a574:	481c                	lw	a5,16(s0)
   4a576:	ef95                	bnez	a5,4a5b2 <__swbuf_r+0x74>
   4a578:	85a2                	mv	a1,s0
   4a57a:	8526                	mv	a0,s1
   4a57c:	28e1                	jal	4a654 <__swsetup_r>
   4a57e:	c915                	beqz	a0,4a5b2 <__swbuf_r+0x74>
   4a580:	597d                	li	s2,-1
   4a582:	40f2                	lw	ra,28(sp)
   4a584:	4462                	lw	s0,24(sp)
   4a586:	44d2                	lw	s1,20(sp)
   4a588:	49b2                	lw	s3,12(sp)
   4a58a:	854a                	mv	a0,s2
   4a58c:	4942                	lw	s2,16(sp)
   4a58e:	6105                	add	sp,sp,32
   4a590:	8082                	ret
   4a592:	0004b7b7          	lui	a5,0x4b
   4a596:	29478793          	add	a5,a5,660 # 4b294 <__sf_fake_stdout>
   4a59a:	00f41463          	bne	s0,a5,4a5a2 <__swbuf_r+0x64>
   4a59e:	4480                	lw	s0,8(s1)
   4a5a0:	b7e1                	j	4a568 <__swbuf_r+0x2a>
   4a5a2:	0004b7b7          	lui	a5,0x4b
   4a5a6:	27478793          	add	a5,a5,628 # 4b274 <__sf_fake_stderr>
   4a5aa:	faf41fe3          	bne	s0,a5,4a568 <__swbuf_r+0x2a>
   4a5ae:	44c0                	lw	s0,12(s1)
   4a5b0:	bf65                	j	4a568 <__swbuf_r+0x2a>
   4a5b2:	481c                	lw	a5,16(s0)
   4a5b4:	4008                	lw	a0,0(s0)
   4a5b6:	0ff97993          	zext.b	s3,s2
   4a5ba:	0ff97913          	zext.b	s2,s2
   4a5be:	8d1d                	sub	a0,a0,a5
   4a5c0:	485c                	lw	a5,20(s0)
   4a5c2:	00f54763          	blt	a0,a5,4a5d0 <__swbuf_r+0x92>
   4a5c6:	85a2                	mv	a1,s0
   4a5c8:	8526                	mv	a0,s1
   4a5ca:	f67fd0ef          	jal	48530 <_fflush_r>
   4a5ce:	f94d                	bnez	a0,4a580 <__swbuf_r+0x42>
   4a5d0:	441c                	lw	a5,8(s0)
   4a5d2:	0505                	add	a0,a0,1
   4a5d4:	17fd                	add	a5,a5,-1
   4a5d6:	c41c                	sw	a5,8(s0)
   4a5d8:	401c                	lw	a5,0(s0)
   4a5da:	00178713          	add	a4,a5,1
   4a5de:	c018                	sw	a4,0(s0)
   4a5e0:	01378023          	sb	s3,0(a5)
   4a5e4:	485c                	lw	a5,20(s0)
   4a5e6:	00a78963          	beq	a5,a0,4a5f8 <__swbuf_r+0xba>
   4a5ea:	00c45783          	lhu	a5,12(s0)
   4a5ee:	8b85                	and	a5,a5,1
   4a5f0:	dbc9                	beqz	a5,4a582 <__swbuf_r+0x44>
   4a5f2:	47a9                	li	a5,10
   4a5f4:	f8f917e3          	bne	s2,a5,4a582 <__swbuf_r+0x44>
   4a5f8:	85a2                	mv	a1,s0
   4a5fa:	8526                	mv	a0,s1
   4a5fc:	f35fd0ef          	jal	48530 <_fflush_r>
   4a600:	d149                	beqz	a0,4a582 <__swbuf_r+0x44>
   4a602:	bfbd                	j	4a580 <__swbuf_r+0x42>

0004a604 <__ascii_wctomb>:
   4a604:	cd91                	beqz	a1,4a620 <__ascii_wctomb+0x1c>
   4a606:	0ff00793          	li	a5,255
   4a60a:	00c7f763          	bgeu	a5,a2,4a618 <__ascii_wctomb+0x14>
   4a60e:	08a00793          	li	a5,138
   4a612:	c11c                	sw	a5,0(a0)
   4a614:	557d                	li	a0,-1
   4a616:	8082                	ret
   4a618:	00c58023          	sb	a2,0(a1)
   4a61c:	4505                	li	a0,1
   4a61e:	8082                	ret
   4a620:	4501                	li	a0,0
   4a622:	8082                	ret

0004a624 <_write_r>:
   4a624:	1141                	add	sp,sp,-16
   4a626:	c422                	sw	s0,8(sp)
   4a628:	c226                	sw	s1,4(sp)
   4a62a:	842a                	mv	s0,a0
   4a62c:	852e                	mv	a0,a1
   4a62e:	85b2                	mv	a1,a2
   4a630:	8636                	mv	a2,a3
   4a632:	c606                	sw	ra,12(sp)
   4a634:	4e01a623          	sw	zero,1260(gp) # 12d0cec <errno>
   4a638:	ba0fa0ef          	jal	449d8 <_write>
   4a63c:	57fd                	li	a5,-1
   4a63e:	00f51663          	bne	a0,a5,4a64a <_write_r+0x26>
   4a642:	4ec1a783          	lw	a5,1260(gp) # 12d0cec <errno>
   4a646:	c391                	beqz	a5,4a64a <_write_r+0x26>
   4a648:	c01c                	sw	a5,0(s0)
   4a64a:	40b2                	lw	ra,12(sp)
   4a64c:	4422                	lw	s0,8(sp)
   4a64e:	4492                	lw	s1,4(sp)
   4a650:	0141                	add	sp,sp,16
   4a652:	8082                	ret

0004a654 <__swsetup_r>:
   4a654:	1141                	add	sp,sp,-16
   4a656:	c226                	sw	s1,4(sp)
   4a658:	9d01a483          	lw	s1,-1584(gp) # 12d01d0 <_impure_ptr>
   4a65c:	c422                	sw	s0,8(sp)
   4a65e:	c04a                	sw	s2,0(sp)
   4a660:	c606                	sw	ra,12(sp)
   4a662:	892a                	mv	s2,a0
   4a664:	842e                	mv	s0,a1
   4a666:	c491                	beqz	s1,4a672 <__swsetup_r+0x1e>
   4a668:	4c9c                	lw	a5,24(s1)
   4a66a:	e781                	bnez	a5,4a672 <__swsetup_r+0x1e>
   4a66c:	8526                	mv	a0,s1
   4a66e:	fe5fd0ef          	jal	48652 <__sinit>
   4a672:	0004b7b7          	lui	a5,0x4b
   4a676:	2b478793          	add	a5,a5,692 # 4b2b4 <__sf_fake_stdin>
   4a67a:	02f41463          	bne	s0,a5,4a6a2 <__swsetup_r+0x4e>
   4a67e:	40c0                	lw	s0,4(s1)
   4a680:	00c41783          	lh	a5,12(s0)
   4a684:	0087f713          	and	a4,a5,8
   4a688:	eb3d                	bnez	a4,4a6fe <__swsetup_r+0xaa>
   4a68a:	0107f713          	and	a4,a5,16
   4a68e:	eb15                	bnez	a4,4a6c2 <__swsetup_r+0x6e>
   4a690:	4725                	li	a4,9
   4a692:	00e92023          	sw	a4,0(s2)
   4a696:	0407e793          	or	a5,a5,64
   4a69a:	00f41623          	sh	a5,12(s0)
   4a69e:	557d                	li	a0,-1
   4a6a0:	a871                	j	4a73c <__swsetup_r+0xe8>
   4a6a2:	0004b7b7          	lui	a5,0x4b
   4a6a6:	29478793          	add	a5,a5,660 # 4b294 <__sf_fake_stdout>
   4a6aa:	00f41463          	bne	s0,a5,4a6b2 <__swsetup_r+0x5e>
   4a6ae:	4480                	lw	s0,8(s1)
   4a6b0:	bfc1                	j	4a680 <__swsetup_r+0x2c>
   4a6b2:	0004b7b7          	lui	a5,0x4b
   4a6b6:	27478793          	add	a5,a5,628 # 4b274 <__sf_fake_stderr>
   4a6ba:	fcf413e3          	bne	s0,a5,4a680 <__swsetup_r+0x2c>
   4a6be:	44c0                	lw	s0,12(s1)
   4a6c0:	b7c1                	j	4a680 <__swsetup_r+0x2c>
   4a6c2:	8b91                	and	a5,a5,4
   4a6c4:	c79d                	beqz	a5,4a6f2 <__swsetup_r+0x9e>
   4a6c6:	584c                	lw	a1,52(s0)
   4a6c8:	c991                	beqz	a1,4a6dc <__swsetup_r+0x88>
   4a6ca:	04440793          	add	a5,s0,68
   4a6ce:	00f58563          	beq	a1,a5,4a6d8 <__swsetup_r+0x84>
   4a6d2:	854a                	mv	a0,s2
   4a6d4:	d6aff0ef          	jal	49c3e <_free_r>
   4a6d8:	02042a23          	sw	zero,52(s0)
   4a6dc:	00c45783          	lhu	a5,12(s0)
   4a6e0:	00042223          	sw	zero,4(s0)
   4a6e4:	9bed                	and	a5,a5,-5
   4a6e6:	fdf7f793          	and	a5,a5,-33
   4a6ea:	00f41623          	sh	a5,12(s0)
   4a6ee:	481c                	lw	a5,16(s0)
   4a6f0:	c01c                	sw	a5,0(s0)
   4a6f2:	00c45783          	lhu	a5,12(s0)
   4a6f6:	0087e793          	or	a5,a5,8
   4a6fa:	00f41623          	sh	a5,12(s0)
   4a6fe:	481c                	lw	a5,16(s0)
   4a700:	ef89                	bnez	a5,4a71a <__swsetup_r+0xc6>
   4a702:	00c45783          	lhu	a5,12(s0)
   4a706:	20000713          	li	a4,512
   4a70a:	2807f793          	and	a5,a5,640
   4a70e:	00e78663          	beq	a5,a4,4a71a <__swsetup_r+0xc6>
   4a712:	85a2                	mv	a1,s0
   4a714:	854a                	mv	a0,s2
   4a716:	8b3fe0ef          	jal	48fc8 <__smakebuf_r>
   4a71a:	00c41783          	lh	a5,12(s0)
   4a71e:	0017f713          	and	a4,a5,1
   4a722:	c31d                	beqz	a4,4a748 <__swsetup_r+0xf4>
   4a724:	4858                	lw	a4,20(s0)
   4a726:	00042423          	sw	zero,8(s0)
   4a72a:	40e00733          	neg	a4,a4
   4a72e:	cc18                	sw	a4,24(s0)
   4a730:	4818                	lw	a4,16(s0)
   4a732:	4501                	li	a0,0
   4a734:	e701                	bnez	a4,4a73c <__swsetup_r+0xe8>
   4a736:	0807f713          	and	a4,a5,128
   4a73a:	ff31                	bnez	a4,4a696 <__swsetup_r+0x42>
   4a73c:	40b2                	lw	ra,12(sp)
   4a73e:	4422                	lw	s0,8(sp)
   4a740:	4492                	lw	s1,4(sp)
   4a742:	4902                	lw	s2,0(sp)
   4a744:	0141                	add	sp,sp,16
   4a746:	8082                	ret
   4a748:	0027f713          	and	a4,a5,2
   4a74c:	4681                	li	a3,0
   4a74e:	e311                	bnez	a4,4a752 <__swsetup_r+0xfe>
   4a750:	4854                	lw	a3,20(s0)
   4a752:	c414                	sw	a3,8(s0)
   4a754:	bff1                	j	4a730 <__swsetup_r+0xdc>

0004a756 <__assert_func>:
   4a756:	9d01a783          	lw	a5,-1584(gp) # 12d01d0 <_impure_ptr>
   4a75a:	1141                	add	sp,sp,-16
   4a75c:	8832                	mv	a6,a2
   4a75e:	c606                	sw	ra,12(sp)
   4a760:	88aa                	mv	a7,a0
   4a762:	872e                	mv	a4,a1
   4a764:	47c8                	lw	a0,12(a5)
   4a766:	8636                	mv	a2,a3
   4a768:	00080d63          	beqz	a6,4a782 <__assert_func+0x2c>
   4a76c:	0004b7b7          	lui	a5,0x4b
   4a770:	f0078793          	add	a5,a5,-256 # 4af00 <__clz_tab+0x44c>
   4a774:	0004b5b7          	lui	a1,0x4b
   4a778:	86c6                	mv	a3,a7
   4a77a:	f1058593          	add	a1,a1,-240 # 4af10 <__clz_tab+0x45c>
   4a77e:	2835                	jal	4a7ba <fiprintf>
   4a780:	2a49                	jal	4a912 <abort>
   4a782:	0004b837          	lui	a6,0x4b
   4a786:	c8880793          	add	a5,a6,-888 # 4ac88 <__clz_tab+0x1d4>
   4a78a:	c8880813          	add	a6,a6,-888
   4a78e:	b7dd                	j	4a774 <__assert_func+0x1e>

0004a790 <_close_r>:
   4a790:	1141                	add	sp,sp,-16
   4a792:	c422                	sw	s0,8(sp)
   4a794:	c226                	sw	s1,4(sp)
   4a796:	842a                	mv	s0,a0
   4a798:	852e                	mv	a0,a1
   4a79a:	c606                	sw	ra,12(sp)
   4a79c:	4e01a623          	sw	zero,1260(gp) # 12d0cec <errno>
   4a7a0:	2425                	jal	4a9c8 <_close>
   4a7a2:	57fd                	li	a5,-1
   4a7a4:	00f51663          	bne	a0,a5,4a7b0 <_close_r+0x20>
   4a7a8:	4ec1a783          	lw	a5,1260(gp) # 12d0cec <errno>
   4a7ac:	c391                	beqz	a5,4a7b0 <_close_r+0x20>
   4a7ae:	c01c                	sw	a5,0(s0)
   4a7b0:	40b2                	lw	ra,12(sp)
   4a7b2:	4422                	lw	s0,8(sp)
   4a7b4:	4492                	lw	s1,4(sp)
   4a7b6:	0141                	add	sp,sp,16
   4a7b8:	8082                	ret

0004a7ba <fiprintf>:
   4a7ba:	7139                	add	sp,sp,-64
   4a7bc:	da3e                	sw	a5,52(sp)
   4a7be:	d432                	sw	a2,40(sp)
   4a7c0:	862e                	mv	a2,a1
   4a7c2:	85aa                	mv	a1,a0
   4a7c4:	9d01a503          	lw	a0,-1584(gp) # 12d01d0 <_impure_ptr>
   4a7c8:	d636                	sw	a3,44(sp)
   4a7ca:	1034                	add	a3,sp,40
   4a7cc:	ce06                	sw	ra,28(sp)
   4a7ce:	d83a                	sw	a4,48(sp)
   4a7d0:	dc42                	sw	a6,56(sp)
   4a7d2:	de46                	sw	a7,60(sp)
   4a7d4:	c636                	sw	a3,12(sp)
   4a7d6:	9adff0ef          	jal	4a182 <_vfiprintf_r>
   4a7da:	40f2                	lw	ra,28(sp)
   4a7dc:	6121                	add	sp,sp,64
   4a7de:	8082                	ret

0004a7e0 <_fstat_r>:
   4a7e0:	1141                	add	sp,sp,-16
   4a7e2:	c422                	sw	s0,8(sp)
   4a7e4:	c226                	sw	s1,4(sp)
   4a7e6:	842a                	mv	s0,a0
   4a7e8:	852e                	mv	a0,a1
   4a7ea:	85b2                	mv	a1,a2
   4a7ec:	c606                	sw	ra,12(sp)
   4a7ee:	4e01a623          	sw	zero,1260(gp) # 12d0cec <errno>
   4a7f2:	a78fa0ef          	jal	44a6a <_fstat>
   4a7f6:	57fd                	li	a5,-1
   4a7f8:	00f51663          	bne	a0,a5,4a804 <_fstat_r+0x24>
   4a7fc:	4ec1a783          	lw	a5,1260(gp) # 12d0cec <errno>
   4a800:	c391                	beqz	a5,4a804 <_fstat_r+0x24>
   4a802:	c01c                	sw	a5,0(s0)
   4a804:	40b2                	lw	ra,12(sp)
   4a806:	4422                	lw	s0,8(sp)
   4a808:	4492                	lw	s1,4(sp)
   4a80a:	0141                	add	sp,sp,16
   4a80c:	8082                	ret

0004a80e <_isatty_r>:
   4a80e:	1141                	add	sp,sp,-16
   4a810:	c422                	sw	s0,8(sp)
   4a812:	c226                	sw	s1,4(sp)
   4a814:	842a                	mv	s0,a0
   4a816:	852e                	mv	a0,a1
   4a818:	c606                	sw	ra,12(sp)
   4a81a:	4e01a623          	sw	zero,1260(gp) # 12d0cec <errno>
   4a81e:	2aed                	jal	4aa18 <_isatty>
   4a820:	57fd                	li	a5,-1
   4a822:	00f51663          	bne	a0,a5,4a82e <_isatty_r+0x20>
   4a826:	4ec1a783          	lw	a5,1260(gp) # 12d0cec <errno>
   4a82a:	c391                	beqz	a5,4a82e <_isatty_r+0x20>
   4a82c:	c01c                	sw	a5,0(s0)
   4a82e:	40b2                	lw	ra,12(sp)
   4a830:	4422                	lw	s0,8(sp)
   4a832:	4492                	lw	s1,4(sp)
   4a834:	0141                	add	sp,sp,16
   4a836:	8082                	ret

0004a838 <_lseek_r>:
   4a838:	1141                	add	sp,sp,-16
   4a83a:	c422                	sw	s0,8(sp)
   4a83c:	c226                	sw	s1,4(sp)
   4a83e:	842a                	mv	s0,a0
   4a840:	852e                	mv	a0,a1
   4a842:	85b2                	mv	a1,a2
   4a844:	8636                	mv	a2,a3
   4a846:	c606                	sw	ra,12(sp)
   4a848:	4e01a623          	sw	zero,1260(gp) # 12d0cec <errno>
   4a84c:	2401                	jal	4aa4c <_lseek>
   4a84e:	57fd                	li	a5,-1
   4a850:	00f51663          	bne	a0,a5,4a85c <_lseek_r+0x24>
   4a854:	4ec1a783          	lw	a5,1260(gp) # 12d0cec <errno>
   4a858:	c391                	beqz	a5,4a85c <_lseek_r+0x24>
   4a85a:	c01c                	sw	a5,0(s0)
   4a85c:	40b2                	lw	ra,12(sp)
   4a85e:	4422                	lw	s0,8(sp)
   4a860:	4492                	lw	s1,4(sp)
   4a862:	0141                	add	sp,sp,16
   4a864:	8082                	ret

0004a866 <__malloc_lock>:
   4a866:	8082                	ret

0004a868 <__malloc_unlock>:
   4a868:	8082                	ret

0004a86a <_realloc_r>:
   4a86a:	1101                	add	sp,sp,-32
   4a86c:	ca26                	sw	s1,20(sp)
   4a86e:	ce06                	sw	ra,28(sp)
   4a870:	cc22                	sw	s0,24(sp)
   4a872:	c84a                	sw	s2,16(sp)
   4a874:	c64e                	sw	s3,12(sp)
   4a876:	c452                	sw	s4,8(sp)
   4a878:	84b2                	mv	s1,a2
   4a87a:	e999                	bnez	a1,4a890 <_realloc_r+0x26>
   4a87c:	4462                	lw	s0,24(sp)
   4a87e:	40f2                	lw	ra,28(sp)
   4a880:	44d2                	lw	s1,20(sp)
   4a882:	4942                	lw	s2,16(sp)
   4a884:	49b2                	lw	s3,12(sp)
   4a886:	4a22                	lw	s4,8(sp)
   4a888:	85b2                	mv	a1,a2
   4a88a:	6105                	add	sp,sp,32
   4a88c:	c54ff06f          	j	49ce0 <_malloc_r>
   4a890:	ee09                	bnez	a2,4a8aa <_realloc_r+0x40>
   4a892:	bacff0ef          	jal	49c3e <_free_r>
   4a896:	4401                	li	s0,0
   4a898:	40f2                	lw	ra,28(sp)
   4a89a:	8522                	mv	a0,s0
   4a89c:	4462                	lw	s0,24(sp)
   4a89e:	44d2                	lw	s1,20(sp)
   4a8a0:	4942                	lw	s2,16(sp)
   4a8a2:	49b2                	lw	s3,12(sp)
   4a8a4:	4a22                	lw	s4,8(sp)
   4a8a6:	6105                	add	sp,sp,32
   4a8a8:	8082                	ret
   4a8aa:	89aa                	mv	s3,a0
   4a8ac:	842e                	mv	s0,a1
   4a8ae:	2885                	jal	4a91e <_malloc_usable_size_r>
   4a8b0:	892a                	mv	s2,a0
   4a8b2:	00956663          	bltu	a0,s1,4a8be <_realloc_r+0x54>
   4a8b6:	00155793          	srl	a5,a0,0x1
   4a8ba:	fc97efe3          	bltu	a5,s1,4a898 <_realloc_r+0x2e>
   4a8be:	85a6                	mv	a1,s1
   4a8c0:	854e                	mv	a0,s3
   4a8c2:	c1eff0ef          	jal	49ce0 <_malloc_r>
   4a8c6:	8a2a                	mv	s4,a0
   4a8c8:	e119                	bnez	a0,4a8ce <_realloc_r+0x64>
   4a8ca:	8452                	mv	s0,s4
   4a8cc:	b7f1                	j	4a898 <_realloc_r+0x2e>
   4a8ce:	85a2                	mv	a1,s0
   4a8d0:	0b24d633          	minu	a2,s1,s2
   4a8d4:	dbaf80ef          	jal	42e8e <memcpy>
   4a8d8:	85a2                	mv	a1,s0
   4a8da:	854e                	mv	a0,s3
   4a8dc:	b62ff0ef          	jal	49c3e <_free_r>
   4a8e0:	b7ed                	j	4a8ca <_realloc_r+0x60>

0004a8e2 <_read_r>:
   4a8e2:	1141                	add	sp,sp,-16
   4a8e4:	c422                	sw	s0,8(sp)
   4a8e6:	c226                	sw	s1,4(sp)
   4a8e8:	842a                	mv	s0,a0
   4a8ea:	852e                	mv	a0,a1
   4a8ec:	85b2                	mv	a1,a2
   4a8ee:	8636                	mv	a2,a3
   4a8f0:	c606                	sw	ra,12(sp)
   4a8f2:	4e01a623          	sw	zero,1260(gp) # 12d0cec <errno>
   4a8f6:	954fa0ef          	jal	44a4a <_read>
   4a8fa:	57fd                	li	a5,-1
   4a8fc:	00f51663          	bne	a0,a5,4a908 <_read_r+0x26>
   4a900:	4ec1a783          	lw	a5,1260(gp) # 12d0cec <errno>
   4a904:	c391                	beqz	a5,4a908 <_read_r+0x26>
   4a906:	c01c                	sw	a5,0(s0)
   4a908:	40b2                	lw	ra,12(sp)
   4a90a:	4422                	lw	s0,8(sp)
   4a90c:	4492                	lw	s1,4(sp)
   4a90e:	0141                	add	sp,sp,16
   4a910:	8082                	ret

0004a912 <abort>:
   4a912:	1141                	add	sp,sp,-16
   4a914:	4519                	li	a0,6
   4a916:	c606                	sw	ra,12(sp)
   4a918:	28a5                	jal	4a990 <raise>
   4a91a:	4505                	li	a0,1
   4a91c:	28d9                	jal	4a9f2 <_exit>

0004a91e <_malloc_usable_size_r>:
   4a91e:	ffc5a783          	lw	a5,-4(a1)
   4a922:	ffc78513          	add	a0,a5,-4
   4a926:	0007d563          	bgez	a5,4a930 <_malloc_usable_size_r+0x12>
   4a92a:	95aa                	add	a1,a1,a0
   4a92c:	419c                	lw	a5,0(a1)
   4a92e:	953e                	add	a0,a0,a5
   4a930:	8082                	ret

0004a932 <_raise_r>:
   4a932:	1101                	add	sp,sp,-32
   4a934:	cc22                	sw	s0,24(sp)
   4a936:	ce06                	sw	ra,28(sp)
   4a938:	47fd                	li	a5,31
   4a93a:	842a                	mv	s0,a0
   4a93c:	00b7f963          	bgeu	a5,a1,4a94e <_raise_r+0x1c>
   4a940:	47d9                	li	a5,22
   4a942:	c11c                	sw	a5,0(a0)
   4a944:	557d                	li	a0,-1
   4a946:	40f2                	lw	ra,28(sp)
   4a948:	4462                	lw	s0,24(sp)
   4a94a:	6105                	add	sp,sp,32
   4a94c:	8082                	ret
   4a94e:	417c                	lw	a5,68(a0)
   4a950:	862e                	mv	a2,a1
   4a952:	c789                	beqz	a5,4a95c <_raise_r+0x2a>
   4a954:	20f5c7b3          	sh2add	a5,a1,a5
   4a958:	4398                	lw	a4,0(a5)
   4a95a:	eb19                	bnez	a4,4a970 <_raise_r+0x3e>
   4a95c:	8522                	mv	a0,s0
   4a95e:	c632                	sw	a2,12(sp)
   4a960:	209d                	jal	4a9c6 <_getpid_r>
   4a962:	85aa                	mv	a1,a0
   4a964:	8522                	mv	a0,s0
   4a966:	4462                	lw	s0,24(sp)
   4a968:	4632                	lw	a2,12(sp)
   4a96a:	40f2                	lw	ra,28(sp)
   4a96c:	6105                	add	sp,sp,32
   4a96e:	a035                	j	4a99a <_kill_r>
   4a970:	4685                	li	a3,1
   4a972:	00d70d63          	beq	a4,a3,4a98c <_raise_r+0x5a>
   4a976:	56fd                	li	a3,-1
   4a978:	00d71663          	bne	a4,a3,4a984 <_raise_r+0x52>
   4a97c:	47d9                	li	a5,22
   4a97e:	c11c                	sw	a5,0(a0)
   4a980:	4505                	li	a0,1
   4a982:	b7d1                	j	4a946 <_raise_r+0x14>
   4a984:	0007a023          	sw	zero,0(a5)
   4a988:	852e                	mv	a0,a1
   4a98a:	9702                	jalr	a4
   4a98c:	4501                	li	a0,0
   4a98e:	bf65                	j	4a946 <_raise_r+0x14>

0004a990 <raise>:
   4a990:	85aa                	mv	a1,a0
   4a992:	9d01a503          	lw	a0,-1584(gp) # 12d01d0 <_impure_ptr>
   4a996:	f9dff06f          	j	4a932 <_raise_r>

0004a99a <_kill_r>:
   4a99a:	1141                	add	sp,sp,-16
   4a99c:	c422                	sw	s0,8(sp)
   4a99e:	c226                	sw	s1,4(sp)
   4a9a0:	842a                	mv	s0,a0
   4a9a2:	852e                	mv	a0,a1
   4a9a4:	85b2                	mv	a1,a2
   4a9a6:	c606                	sw	ra,12(sp)
   4a9a8:	4e01a623          	sw	zero,1260(gp) # 12d0cec <errno>
   4a9ac:	2071                	jal	4aa38 <_kill>
   4a9ae:	57fd                	li	a5,-1
   4a9b0:	00f51663          	bne	a0,a5,4a9bc <_kill_r+0x22>
   4a9b4:	4ec1a783          	lw	a5,1260(gp) # 12d0cec <errno>
   4a9b8:	c391                	beqz	a5,4a9bc <_kill_r+0x22>
   4a9ba:	c01c                	sw	a5,0(s0)
   4a9bc:	40b2                	lw	ra,12(sp)
   4a9be:	4422                	lw	s0,8(sp)
   4a9c0:	4492                	lw	s1,4(sp)
   4a9c2:	0141                	add	sp,sp,16
   4a9c4:	8082                	ret

0004a9c6 <_getpid_r>:
   4a9c6:	a0b9                	j	4aa14 <_getpid>

0004a9c8 <_close>:
   4a9c8:	1141                	add	sp,sp,-16
   4a9ca:	c606                	sw	ra,12(sp)
   4a9cc:	c422                	sw	s0,8(sp)
   4a9ce:	03900893          	li	a7,57
   4a9d2:	00000073          	ecall
   4a9d6:	842a                	mv	s0,a0
   4a9d8:	00055863          	bgez	a0,4a9e8 <_close+0x20>
   4a9dc:	40800433          	neg	s0,s0
   4a9e0:	e9ffa0ef          	jal	4587e <__errno>
   4a9e4:	c100                	sw	s0,0(a0)
   4a9e6:	547d                	li	s0,-1
   4a9e8:	40b2                	lw	ra,12(sp)
   4a9ea:	8522                	mv	a0,s0
   4a9ec:	4422                	lw	s0,8(sp)
   4a9ee:	0141                	add	sp,sp,16
   4a9f0:	8082                	ret

0004a9f2 <_exit>:
   4a9f2:	05d00893          	li	a7,93
   4a9f6:	00000073          	ecall
   4a9fa:	00055c63          	bgez	a0,4aa12 <_exit+0x20>
   4a9fe:	1141                	add	sp,sp,-16
   4aa00:	c422                	sw	s0,8(sp)
   4aa02:	842a                	mv	s0,a0
   4aa04:	c606                	sw	ra,12(sp)
   4aa06:	40800433          	neg	s0,s0
   4aa0a:	e75fa0ef          	jal	4587e <__errno>
   4aa0e:	c100                	sw	s0,0(a0)
   4aa10:	a001                	j	4aa10 <_exit+0x1e>
   4aa12:	a001                	j	4aa12 <_exit+0x20>

0004aa14 <_getpid>:
   4aa14:	4505                	li	a0,1
   4aa16:	8082                	ret

0004aa18 <_isatty>:
   4aa18:	7159                	add	sp,sp,-112
   4aa1a:	002c                	add	a1,sp,8
   4aa1c:	d686                	sw	ra,108(sp)
   4aa1e:	84cfa0ef          	jal	44a6a <_fstat>
   4aa22:	57fd                	li	a5,-1
   4aa24:	00f50863          	beq	a0,a5,4aa34 <_isatty+0x1c>
   4aa28:	4532                	lw	a0,12(sp)
   4aa2a:	48d55513          	bext	a0,a0,0xd
   4aa2e:	50b6                	lw	ra,108(sp)
   4aa30:	6165                	add	sp,sp,112
   4aa32:	8082                	ret
   4aa34:	4501                	li	a0,0
   4aa36:	bfe5                	j	4aa2e <_isatty+0x16>

0004aa38 <_kill>:
   4aa38:	1141                	add	sp,sp,-16
   4aa3a:	c606                	sw	ra,12(sp)
   4aa3c:	e43fa0ef          	jal	4587e <__errno>
   4aa40:	40b2                	lw	ra,12(sp)
   4aa42:	47d9                	li	a5,22
   4aa44:	c11c                	sw	a5,0(a0)
   4aa46:	557d                	li	a0,-1
   4aa48:	0141                	add	sp,sp,16
   4aa4a:	8082                	ret

0004aa4c <_lseek>:
   4aa4c:	1141                	add	sp,sp,-16
   4aa4e:	c606                	sw	ra,12(sp)
   4aa50:	c422                	sw	s0,8(sp)
   4aa52:	03e00893          	li	a7,62
   4aa56:	00000073          	ecall
   4aa5a:	842a                	mv	s0,a0
   4aa5c:	00055863          	bgez	a0,4aa6c <_lseek+0x20>
   4aa60:	40800433          	neg	s0,s0
   4aa64:	e1bfa0ef          	jal	4587e <__errno>
   4aa68:	c100                	sw	s0,0(a0)
   4aa6a:	547d                	li	s0,-1
   4aa6c:	40b2                	lw	ra,12(sp)
   4aa6e:	8522                	mv	a0,s0
   4aa70:	4422                	lw	s0,8(sp)
   4aa72:	0141                	add	sp,sp,16
   4aa74:	8082                	ret
   4aa76:	0000                	unimp
   4aa78:	1ffa                	sll	t6,t6,0x3e
   4aa7a:	0004                	.insn	2, 0x0004
   4aa7c:	20aa                	.insn	2, 0x20aa
   4aa7e:	0004                	.insn	2, 0x0004
   4aa80:	2004                	.insn	2, 0x2004
   4aa82:	0004                	.insn	2, 0x0004
   4aa84:	20aa                	.insn	2, 0x20aa
   4aa86:	0004                	.insn	2, 0x0004
   4aa88:	2008                	.insn	2, 0x2008
   4aa8a:	0004                	.insn	2, 0x0004
   4aa8c:	20aa                	.insn	2, 0x20aa
   4aa8e:	0004                	.insn	2, 0x0004
   4aa90:	2004                	.insn	2, 0x2004
   4aa92:	0004                	.insn	2, 0x0004
   4aa94:	1ffa                	sll	t6,t6,0x3e
   4aa96:	0004                	.insn	2, 0x0004
   4aa98:	1ffa                	sll	t6,t6,0x3e
   4aa9a:	0004                	.insn	2, 0x0004
   4aa9c:	2008                	.insn	2, 0x2008
   4aa9e:	0004                	.insn	2, 0x0004
   4aaa0:	2004                	.insn	2, 0x2004
   4aaa2:	0004                	.insn	2, 0x0004
   4aaa4:	1fe0                	add	s0,sp,1020
   4aaa6:	0004                	.insn	2, 0x0004
   4aaa8:	1fe0                	add	s0,sp,1020
   4aaaa:	0004                	.insn	2, 0x0004
   4aaac:	1fe0                	add	s0,sp,1020
   4aaae:	0004                	.insn	2, 0x0004
   4aab0:	2008                	.insn	2, 0x2008
   4aab2:	0004                	.insn	2, 0x0004

0004aab4 <__clz_tab>:
   4aab4:	0100 0202 0303 0303 0404 0404 0404 0404     ................
   4aac4:	0505 0505 0505 0505 0505 0505 0505 0505     ................
   4aad4:	0606 0606 0606 0606 0606 0606 0606 0606     ................
   4aae4:	0606 0606 0606 0606 0606 0606 0606 0606     ................
   4aaf4:	0707 0707 0707 0707 0707 0707 0707 0707     ................
   4ab04:	0707 0707 0707 0707 0707 0707 0707 0707     ................
   4ab14:	0707 0707 0707 0707 0707 0707 0707 0707     ................
   4ab24:	0707 0707 0707 0707 0707 0707 0707 0707     ................
   4ab34:	0808 0808 0808 0808 0808 0808 0808 0808     ................
   4ab44:	0808 0808 0808 0808 0808 0808 0808 0808     ................
   4ab54:	0808 0808 0808 0808 0808 0808 0808 0808     ................
   4ab64:	0808 0808 0808 0808 0808 0808 0808 0808     ................
   4ab74:	0808 0808 0808 0808 0808 0808 0808 0808     ................
   4ab84:	0808 0808 0808 0808 0808 0808 0808 0808     ................
   4ab94:	0808 0808 0808 0808 0808 0808 0808 0808     ................
   4aba4:	0808 0808 0808 0808 0808 0808 0808 0808     ................
   4abb4:	6f63 6572 0031 0000 7068 366d 3865 6479     core1...hpm6e8yd
   4abc4:	6d65 006f 6548 6c6c 206f 6f77 6c72 2064     emo.Hello world 
   4abd4:	7266 6d6f 2520 2073 6f63 6572 2031 5428     from %s core1 (T
   4abe4:	7268 6165 5864 2129 000a 0000 2323 2323     hreadX)!....####
   4abf4:	2323 2323 2323 2323 2323 2323 2323 2323     ################
   4ac04:	2323 2323 2323 0d23 450a 6378 7065 6974     #######..Excepti
   4ac14:	6e6f 6f20 6363 7275 0d21 000a 636d 7561     on occur!...mcau
   4ac24:	6573 203a 7830 6c25 2078 0a0d 656d 6370     se: 0x%lx ..mepc
   4ac34:	203a 7830 6c25 2078 0a0d 746d 6176 3a6c     : 0x%lx ..mtval:
   4ac44:	3020 2578 786c 0d20 000a 0000 7543 7272      0x%lx .....Curr
   4ac54:	6e65 2074 6854 6572 6461 4e20 6d61 3a65     ent Thread Name:
   4ac64:	2020 7325 0a20 0000 7543 7272 6e65 2074       %s ...Current 
   4ac74:	6854 6572 6461 5320 6174 6b63 203a 7830     Thread Stack: 0x
   4ac84:	7825 0a20 0000 0000 7543 7272 6e65 2074     %x .....Current 
   4ac94:	6854 6572 6461 5320 6174 6b63 4c20 6d69     Thread Stack Lim
   4aca4:	7469 203a 7830 7825 0a20 0000 2d2d 2d2d     it: 0x%x ...----
   4acb4:	2d2d 2d2d 2d2d 2d2d 2d2d 2d2d 2d2d 2d2d     ----------------
   4acc4:	2d2d 2d2d 2d2d 2d2d 2d2d 2d2d 2d2d 2d2d     ----------------
   4acd4:	2d2d 2d2d 2d2d 2d2d 2d2d 2d2d 2d2d 2d2d     ----------------
   4ace4:	2d2d 0a0d 6568 2078 7564 706d 6f20 2066     --..hex dump of 
   4acf4:	7543 7272 6e65 2074 6854 6572 6461 5420     Current Thread T
   4ad04:	4243 000a 3025 6433 303a 2578 3830 2078     CB..%03d:0x%08x 
   4ad14:	0020 0000 0a0d 0000 7254 7061 6d20 7961      .......Trap may
   4ad24:	6820 7061 6570 206e 6e69 4920 5253 202e      happen in ISR. 
   4ad34:	5349 2052 656e 7473 6465 2520 2064 6974     ISR nested %d ti
   4ad44:	656d 0d73 000a 0000 7953 7473 6d65 5420     mes.....System T
   4ad54:	6d69 7265 5420 7268 6165 0064 4e49 0046     imer Thread.INF.
   4ad64:	6e69 0066 414e 004e 616e 006e 0030 0000     inf.NAN.nan.0...
   4ad74:	3130 3332 3534 3736 3938 4241 4443 4645     0123456789ABCDEF
   4ad84:	0000 0000 3130 3332 3534 3736 3938 6261     ....0123456789ab
   4ad94:	6463 6665 0000 0000 2565 646c 0000 0000     cdef....e%ld....
   4ada4:	666e 0000 6e69 7469 0079 0000 6e61 0000     nf..inity...an..
   4adb4:	6e49 6966 696e 7974 0000 0000 614e 004e     Infinity....NaN.
   4adc4:	4552 4e45 2054 616d 6c6c 636f 7320 6375     REENT malloc suc
   4add4:	6563 6465 6465 0000 682f 6d6f 2f65 7562     ceeded../home/bu
   4ade4:	6c69 6564 2f72 6572 6f70 2f73 6972 6373     ilder/repos/risc
   4adf4:	2d76 6e67 2d75 6f74 6c6f 6863 6961 2f6e     v-gnu-toolchain/
   4ae04:	656e 6c77 6269 6e2f 7765 696c 2f62 696c     newlib/newlib/li
   4ae14:	6362 732f 6474 696c 2f62 7464 616f 632e     bc/stdlib/dtoa.c
   4ae24:	0000 0000 6142 6c6c 636f 7320 6375 6563     ....Balloc succe
   4ae34:	6465 6465 0000 0000 682f 6d6f 2f65 7562     eded..../home/bu
   4ae44:	6c69 6564 2f72 6572 6f70 2f73 6972 6373     ilder/repos/risc
   4ae54:	2d76 6e67 2d75 6f74 6c6f 6863 6961 2f6e     v-gnu-toolchain/
   4ae64:	656e 6c77 6269 6e2f 7765 696c 2f62 696c     newlib/newlib/li
   4ae74:	6362 732f 6474 696c 2f62 6467 6f74 2d61     bc/stdlib/gdtoa-
   4ae84:	6567 6874 7865 632e 0000 0000 002e 0000     gethex.c........
   4ae94:	0043 0000 4f50 4953 0058 0000 682f 6d6f     C...POSIX.../hom
   4aea4:	2f65 7562 6c69 6564 2f72 6572 6f70 2f73     e/builder/repos/
   4aeb4:	6972 6373 2d76 6e67 2d75 6f74 6c6f 6863     riscv-gnu-toolch
   4aec4:	6961 2f6e 656e 6c77 6269 6e2f 7765 696c     ain/newlib/newli
   4aed4:	2f62 696c 6362 732f 6474 696c 2f62 706d     b/libc/stdlib/mp
   4aee4:	6572 2e63 0063 0000 2d23 2b30 0020 0000     rec.c...#-0+ ...
   4aef4:	6c68 004c 6665 4567 4746 0000 202c 7566     hlL.efgEFG.., fu
   4af04:	636e 6974 6e6f 203a 0000 0000 7361 6573     nction: ....asse
   4af14:	7472 6f69 206e 2522 2273 6620 6961 656c     rtion "%s" faile
   4af24:	3a64 6620 6c69 2065 2522 2273 202c 696c     d: file "%s", li
   4af34:	656e 2520 2564 2573 0a73 0000 3e5c 0004     ne %d%s%s...\>..
   4af44:	3e66 0004 3e72 0004 3e7e 0004 3e8a 0004     f>..r>..~>...>..
   4af54:	3e96 0004 3ea2 0004 3eae 0004 3f98 0004     .>...>...>...?..
   4af64:	3fac 0004 401c 0004 3ee4 0004 3efe 0004     .?...@...>...>..
   4af74:	3f88 0004 3f48 0004 3f58 0004 3f68 0004     .?..H?..X?..h?..
   4af84:	3f24 0004 3f2e 0004 3f78 0004 400c 0004     $?...?..x?...@..
   4af94:	404e 0004                                   N@..

0004af98 <s_wdgs>:
   4af98:	0000 f00b 4000 f00b 8000 f00b c000 f00b     .....@..........
   4afa8:	4234 0004 4362 0004 435c 0004 4342 0004     4B..bC..\C..BC..
   4afb8:	4230 0004 4474 0004 447a 0004 4480 0004     0B..tD..zD...D..
   4afc8:	4486 0004 448c 0004 4492 0004 4498 0004     .D...D...D...D..
   4afd8:	449e 0004 44a4 0004 44aa 0004 44b0 0004     .D...D...D...D..
   4afe8:	44b6 0004 44bc 0004 44c2 0004 446e 0004     .D...D...D..nD..
   4aff8:	4468 0004 464e 0004 4642 0004 463c 0004     hD..NF..BF..<F..
   4b008:	461e 0004 4618 0004 4612 0004 460c 0004     .F...F...F...F..
   4b018:	45ee 0004 45e8 0004 45e2 0004 45dc 0004     .E...E...E...E..
   4b028:	45be 0004 45b8 0004 45b2 0004 4578 0004     .E...E...E..xE..
   4b038:	4648 0004 6028 0004 603e 0004 6000 0004     HF..(`..>`...`..
   4b048:	6000 0004 6000 0004 6000 0004 603e 0004     .`...`...`..>`..
   4b058:	6000 0004 6000 0004 6000 0004 6000 0004     .`...`...`...`..
   4b068:	6184 0004 607c 0004 6128 0004 6000 0004     .a..|`..(a...`..
   4b078:	6000 0004 61b4 0004 6000 0004 607c 0004     .`...a...`..|`..
   4b088:	6000 0004 6000 0004 6130 0004 6402 0004     .`...`..0a...d..
   4b098:	62ba 0004 62ba 0004 62ba 0004 6464 0004     .b...b...b..dd..
   4b0a8:	6438 0004 62ba 0004 62ba 0004 640c 0004     8d...b...b...d..
   4b0b8:	62ba 0004 62ba 0004 62ba 0004 62ba 0004     .b...b...b...b..
   4b0c8:	63c8 0004 63b6 0004 62ba 0004 63b6 0004     .c...c...b...c..
   4b0d8:	644c 0004 62ba 0004 6358 0004 6398 0004     Ld...b..Xc...c..
   4b0e8:	6398 0004 6398 0004 6398 0004 6398 0004     .c...c...c...c..
   4b0f8:	6398 0004 6398 0004 6398 0004 6398 0004     .c...c...c...c..
   4b108:	6a6a 0004 6a58 0004 6a7c 0004 6a82 0004     jj..Xj..|j...j..
   4b118:	6a6a 0004                                   jj..

0004b11c <fpinan.0>:
   4b11c:	0034 0000 fbce ffff 03cb 0000 0001 0000     4...............
   4b12c:	0000 0000                                   ....

0004b130 <fpi.1>:
   4b130:	0035 0000 fbce ffff 03cb 0000 0001 0000     5...............
	...

0004b148 <tinytens>:
   4b148:	89bc 97d8 d2b2 3c9c a733 d5a8 f623 3949     .......<3...#.I9
   4b158:	a73d 44f4 0ffd 32a5 979d cf8c ba08 255b     =..D...2......[%
   4b168:	6f43 64ac 0628 1168                         Co.d(.h.

0004b170 <_ctype_>:
   4b170:	2000 2020 2020 2020 2020 2828 2828 2028     .         ((((( 
   4b180:	2020 2020 2020 2020 2020 2020 2020 2020                     
   4b190:	8820 1010 1010 1010 1010 1010 1010 1010      ...............
   4b1a0:	0410 0404 0404 0404 0404 1004 1010 1010     ................
   4b1b0:	1010 4141 4141 4141 0101 0101 0101 0101     ..AAAAAA........
   4b1c0:	0101 0101 0101 0101 0101 0101 1010 1010     ................
   4b1d0:	1010 4242 4242 4242 0202 0202 0202 0202     ..BBBBBB........
   4b1e0:	0202 0202 0202 0202 0202 0202 1010 1010     ................
   4b1f0:	0020 0000 0000 0000 0000 0000 0000 0000      ...............
	...

0004b274 <__sf_fake_stderr>:
	...

0004b294 <__sf_fake_stdout>:
	...

0004b2b4 <__sf_fake_stdin>:
	...

0004b2d4 <_C_numeric_locale>:
   4b2d4:	ae90 0004 ac88 0004 01d4 012d               ..........-.

0004b2e0 <p05.0>:
   4b2e0:	0005 0000 0019 0000 007d 0000 0000 0000     ........}.......

0004b2f0 <__mprec_bigtens>:
   4b2f0:	8000 37e0 c379 4341 6e17 b505 b8b5 4693     ...7y.AC.n.....F
   4b300:	f9f5 e93f 4f03 4d38 1d32 f930 7748 5a82     ..?..O8M2.0.Hw.Z
   4b310:	bf3c 7f73 4fdd 7515                         <.s..O.u

0004b318 <__mprec_tens>:
   4b318:	0000 0000 0000 3ff0 0000 0000 0000 4024     .......?......$@
   4b328:	0000 0000 0000 4059 0000 0000 4000 408f     ......Y@.....@.@
   4b338:	0000 0000 8800 40c3 0000 0000 6a00 40f8     .......@.....j.@
   4b348:	0000 0000 8480 412e 0000 0000 12d0 4163     .......A......cA
   4b358:	0000 0000 d784 4197 0000 0000 cd65 41cd     .......A....e..A
   4b368:	0000 2000 a05f 4202 0000 e800 4876 4237     ... _..B....vH7B
   4b378:	0000 a200 1a94 426d 0000 e540 309c 42a2     ......mB..@..0.B
   4b388:	0000 1e90 bcc4 42d6 0000 2634 6bf5 430c     .......B..4&.k.C
   4b398:	8000 37e0 c379 4341 a000 85d8 3457 4376     ...7y.AC....W4vC
   4b3a8:	c800 674e c16d 43ab 3d00 6091 58e4 43e1     ..Ngm..C.=.`.X.C
   4b3b8:	8c40 78b5 af1d 4415 ef50 d6e2 1ae4 444b     @..x...DP.....KD
   4b3c8:	d592 064d f0cf 4480 4af6 c7e1 2d02 44b5     ..M....D.J...-.D
   4b3d8:	9db4 79d9 7843 44ea                         ...yCx.D

0004b3e0 <s_adc_clk_mux_node>:
   4b3e0:	0031 0000 0004 0000                         1.......

0004b3e8 <_global_impure_ptr>:
   4b3e8:	0000 012d 0000 0000 ffff ffff ffff 7fef     ..-.............
   4b3f8:	0000 0000 0000 3fe0 0000 0000 0000 3ff0     .......?.......?
   4b408:	0000 0000 0000 4000 0000 ffc0 ffff 41df     .......@.......A
   4b418:	3595 94a0 ffff 3fdf e535 35af 0000 3fe0     .5.....?5..5...?
   4b428:	3595 94a0 ffff 3fcf 0000 0000 0000 3950     .5.....?......P9
   4b438:	0000 0000 0000 3ff8 4361 636f 87a7 3fd2     .......?aCoc...?
   4b448:	c8b3 8b60 8a28 3fc6 79fb 509f 4413 3fd3     ..`.(..?.y.P.D.?
   4b458:	0000 0000 0000 4024 0000 0000 0000 401c     ......$@.......@
   4b468:	0000 0000 0000 4014 0000 0000 0000 7ff8     .......@........
   4b478:	0000 7fc0 0000 0000                         ........
