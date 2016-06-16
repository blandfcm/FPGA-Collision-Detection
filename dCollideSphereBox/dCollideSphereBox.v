module dCollideSphereBox(
	input clk, rst,
	input[31:0] x1, y1, z1, //radius,
	input[31:0] x2, y2, z2,
	//input[31:0] g1, g2,
	//input[2:0] side0, side1, side2,		//orig [31:0], side0=4, side1=2, side2=0
	inout[31:0] r0, r1, r2, r4, r5, r6, r8, 
	input[31:0] r9, r10,	//r3, r7, r11, r12, r13, r14, r15,
	/*output[31:0] cx, cy, cz,
	output[31:0] normalx, normaly, normalz,
	output[31:0] depth,*/
	output ret, done
);
/*
cx = r0
cy = r1
cz = r2
normalx = r4
normaly = r5
normalz = r6
depth = r8

*/

//hardcoded side0, side1, side2 b/c of in/out pad restrictions
wire[31:0] side0, side1, side2;
assign side0 = 32'b01000000100000000000000000000000;	//4.0
assign side1 = 32'b01000000000000000000000000000000;	//2.0
assign side2 = 32'b00111111100000000000000000000000;	//1.0

	reg DONE0, DONE1, DONE2, DONE3, DONE4, DONE5, DONE6, DONE7, DONE8, DONE9, DONE10, DONE11, DONE12, DONE13;
	
	reg done_p;

	//x2_neg
	wire[31:0] x2_neg;
	assign x2_neg = {~x2[31], x2[30:0]};
	
	//y2_neg
	wire[31:0] y2_neg;
	assign y2_neg = {~y2[31], y2[30:0]};
	
	//z2_neg
	wire[31:0] z2_neg;
	assign z2_neg = {~z2[31], z2[30:0]};
	
	//p[0] = x1 - x2
	wire[31:0] p0;
	wire done_p0;
	wire add_z_ack0;
	wire a_ack0;
	wire b_ack0;
	adder add_x1_x2(
		.input_a(x1), 
		.input_b(x2_neg), 
		.input_a_stb(1'b1),
		.input_b_stb(1'b1),
		.output_z_ack(add_z_ack0),
		.clk(clk),
		.rst(DONE0),
		.output_z(p0),
		.output_z_stb(done_p0),
		.input_a_ack(a_ack0),
		.input_b_ack(b_ack0)
	);
	
	//p[1] = y1 - y2
	wire[31:0] p1;
	wire done_p1;
	wire add_z_ack1;
	wire a_ack1;
	wire b_ack1;
	adder add_y1_y2(
		.input_a(y1), 
		.input_b(y2_neg), 
		.input_a_stb(1'b1),
		.input_b_stb(1'b1),
		.output_z_ack(add_z_ack1),
		.clk(clk),
		.rst(DONE0),
		.output_z(p1),
		.output_z_stb(done_p1),
		.input_a_ack(a_ack1),
		.input_b_ack(b_ack1)
	);
	
	//p[2] = z1 - z2
	wire[31:0] p2;
	wire done_p2;
	wire add_z_ack2;
	wire a_ack2;
	wire b_ack2;
	adder add_z1_z2(
		.input_a(z1), 
		.input_b(z2_neg), 
		.input_a_stb(1'b1),
		.input_b_stb(1'b1),
		.output_z_ack(add_z_ack2),
		.clk(clk),
		.rst(DONE0),
		.output_z(p2),
		.output_z_stb(done_p2),
		.input_a_ack(a_ack2),
		.input_b_ack(b_ack2)
	);
	
	//l[0] = side[0] / 2
	wire[31:0] l0;
	wire done_l0;
	wire mult_z_ack0;
	wire a_ack_mult0;
	wire b_ack_mult0;
	divider divide_side0_two(
		.input_a(side0), 
		.input_b(32'b01000000000000000000000000000000),
		.input_a_stb(1'b1),
		.input_b_stb(1'b1),
		.output_z_ack(mult_z_ack0),
		.clk(clk),
		.rst(DONE0),
		.output_z(l0),
		.output_z_stb(done_l0),
		.input_a_ack(a_ack_mult0),
		.input_b_ack(b_ack_mult0)
	);
	
	//l[1] = side[1] / 2
	wire[31:0] l1;
	wire done_l1;
	wire mult_z_ack1;
	wire a_ack_mult1;
	wire b_ack_mult1;
	divider divide_side1_half(
		.input_a(side1), 
		.input_b(32'b01000000000000000000000000000000),
		.input_a_stb(1'b1),
		.input_b_stb(1'b1),
		.output_z_ack(mult_z_ack1),
		.clk(clk),
		.rst(DONE0),
		.output_z(l1),
		.output_z_stb(done_l1),
		.input_a_ack(a_ack_mult1),
		.input_b_ack(b_ack_mult1) 
	);
	
	//l[2] = side[2] / 2
	wire[31:0] l2;
	wire done_l2;
	wire mult_z_ack2;
	wire a_ack_mult2;
	wire b_ack_mult2;
	divider divide_side2_half(
		.input_a(side2), 
		.input_b(32'b01000000000000000000000000000000),
		.input_a_stb(1'b1),
		.input_b_stb(1'b1),
		.output_z_ack(mult_z_ack2),
		.clk(clk),
		.rst(DONE0),
		.output_z(l2),
		.output_z_stb(done_l2),
		.input_a_ack(a_ack_mult2),
		.input_b_ack(b_ack_mult2)
	);
	
		//l0_neg
		wire[31:0] l0_neg;
		//assign l0_neg = (done_l0) ? {~l0[31], l0[30:0]}:32'b0;
		assign l0_neg = {~l0[31], l0[30:0]};
		//l1_neg
		wire[31:0] l1_neg;
		//assign l1_neg = (done_l1) ? {~l1[31], l1[30:0]}:32'b0;
		assign l1_neg = {~l1[31], l1[30:0]};
		//l2_neg
		wire[31:0] l2_neg;
		//assign l2_neg = (done_l2) ? {~l2[31], l2[30:0]}:32'b0;
		assign l2_neg = {~l2[31], l2[30:0]};
	
	//t[0] = dCalcVectorDot3_14(p, R);
	wire[31:0] t0_test;
	wire done_t0_test;
	dCalcVectorDot3_test calc_t0_test(
		.CLK(clk), 
		.a1(p0), 
		.a2(p1), 
		.a3(p2), 
		.b1(r0), 	//R[0]
		.b2(r4), 	//R[4]
		.b3(r8),		//R[8]
		.RST(DONE1),
		.res(t0_test),
		.out_rdy(done_t0)
	);
	
	//t[1] = dCalcVectorDot3_14(p, R+1);
	wire[31:0] t1_test;
	wire done_t1_test;
	dCalcVectorDot3_test calc_t1_test(
		.CLK(clk), 
		.a1(p0), 
		.a2(p1), 
		.a3(p2), 
		.b1(r1), 	//R+1[0]
		.b2(r5), 	//R+1[4]
		.b3(r9),		//R+1[8]
		.RST(DONE1),
		.res(t1_test),
		.out_rdy(done_t1)
	);

	//t[2] = dCalcVectorDot3_14(p, R+2);
	wire[31:0] t2_test;
	wire done_t2_test;
	dCalcVectorDot3_test calc_t2_test(
		.CLK(clk), 
		.a1(p0), 
		.a2(p1), 
		.a3(p2), 
		.b1(r2), 	//R+2[0]
		.b2(r6), 	//R+2[4]
		.b3(r10),		//R+2[8]
		.RST(DONE1),
		.res(t2_test),
		.out_rdy(done_t2)
	);
	
//////CALC_BORDER_TEMPS////////////////////////////////////////////////
	//temp00
	wire[31:0] t0_test_neg;
	assign t0_test_neg = {~t0_test[31], t0_test[30:0]};
	//10_neg - t0_test
	wire temp00;
	wire done_temp00;
	wire add_z_ack00;
	wire a_ack00;
	wire b_ack00;
	lessThan b00(
		.input_a(l0_neg), 
		.input_b(t0_test_neg), 
		.input_a_stb(1'b1),
		.input_b_stb(1'b1),
		.output_z_ack(add_z_ack00),
		.clk(clk),
		.rst(DONE2),
		.output_z(temp00),
		.output_z_stb(done_temp00),
		.input_a_ack(a_ack00),
		.input_b_ack(b_ack00)
	);
	
	//temp01
	//t0_test - l0
	wire temp01;
	wire done_temp01;
	wire add_z_ack01;
	wire a_ack01;
	wire b_ack01;
	lessThan b01(
		.input_a(t0_test), 
		.input_b(l0_neg), 
		.input_a_stb(1'b1),
		.input_b_stb(1'b1),
		.output_z_ack(add_z_ack01),
		.clk(clk),
		.rst(DONE2),
		.output_z(temp01),
		.output_z_stb(done_temp01),
		.input_a_ack(a_ack01),
		.input_b_ack(b_ack01)
	);
	
	//temp10
	wire[31:0] t1_test_neg;
	assign t1_test_neg = {~t1_test[31], t1_test[30:0]};
	//11_neg - t1_test
	wire temp10;
	wire done_temp10;
	wire add_z_ack10;
	wire a_ack10;
	wire b_ack10;
	lessThan b10(
		.input_a(l1_neg), 
		.input_b(t1_test_neg),
		.input_a_stb(1'b1),
		.input_b_stb(1'b1),
		.output_z_ack(add_z_ack10),
		.clk(clk),
		.rst(DONE2),
		.output_z(temp10),
		.output_z_stb(done_temp10),
		.input_a_ack(a_ack10),
		.input_b_ack(b_ack10)
	);
	
	//temp11
	//t1_test - l1
	wire temp11;
	wire done_temp11;
	wire add_z_ack11;
	wire a_ack11;
	wire b_ack11;
	lessThan b11(
		.input_a(t1_test), 
		.input_b(l1_neg), 
		.input_a_stb(1'b1),
		.input_b_stb(1'b1),
		.output_z_ack(add_z_ack11),
		.clk(clk),
		.rst(DONE2),
		.output_z(temp11),
		.output_z_stb(done_temp11),
		.input_a_ack(a_ack11),
		.input_b_ack(b_ack11)
	);
	
	//temp20
	wire[31:0] t2_test_neg;
	assign t2_test_neg = {~t2_test[31], t2_test[30:0]};
	//12_neg - t2_test
	wire temp20;
	wire done_temp20;
	wire add_z_ack20;
	wire a_ack20;
	wire b_ack20;
	lessThan b20(
		.input_a(l2_neg), 
		.input_b(t2_test_neg), 
		.input_a_stb(1'b1),
		.input_b_stb(1'b1),
		.output_z_ack(add_z_ack20),
		.clk(clk),
		.rst(DONE2),
		.output_z(temp20),
		.output_z_stb(done_temp20),
		.input_a_ack(a_ack20),
		.input_b_ack(b_ack20)
	);
	
	//temp21
	//t2_test - l2
	wire temp21;
	wire done_temp21;
	wire add_z_ack21;
	wire a_ack21;
	wire b_ack21;
	lessThan b21(
		.input_a(t2_test), 
		.input_b(l2_neg), 
		.input_a_stb(1'b1),
		.input_b_stb(1'b1),
		.output_z_ack(add_z_ack21),
		.clk(clk),
		.rst(DONE2),
		.output_z(temp21),
		.output_z_stb(done_temp21),
		.input_a_ack(a_ack21),
		.input_b_ack(b_ack21)
	);
	
////IF_ONBORDER////////////////////////////////////////////////////
	wire[31:0] t0, t1, t2;
	//if(t[0] < -l[0]) {onborder = 1}
	//assign temp00 = l0_neg - t0_test;
	assign onborder00 = (DONE3) ? 1'b0:
							(temp00 == 1'b0) ? 1'b1:1'b0;
	//if(t[0] > l[0]) {onborder = 1}
	//assign temp01 = t0_test - l0;
	assign onborder01 = (DONE3) ? 1'b0:
							(temp01 == 1'b0) ? 1'b1:1'b0;
	//if(t[0] < -l[0]) {t[0] = -l[0]}
	//if(t[0] > l[0]) {t[0] = l[0]}
	//else t0 = -3E-13 (therefore State is still in IF_ONBORDER)
	assign t0 = (~DONE3 && onborder00) ? l0_neg: 
					(~DONE3 && onborder01) ? l0:
					(~DONE3) ? t0_test:32'b10101010101010101010101010101010;
	
	//if(t[1] < -l[1]) {onborder = 1}
	//assign temp10 = l1_neg - t1_test;
	assign onborder10 = (DONE3) ? 1'b0:
							(temp10 == 1'b0) ? 1'b1:1'b0;
	//if(t[1] > l[1]) {onborder = 1}
	//assign temp11 = t1_test - l1;
	assign onborder11 = (DONE3) ? 1'b0:
							(temp11 == 1'b0) ? 1'b1:1'b0;
	//if(t[1] < -l[1]) {t[1] = -l[1]}
	//if(t[1] > l[1]) {t[1] = l[1]}
	//else t1 = -3E-13 (therefore State is still in IF_ONBORDER)
	assign t1 = (~DONE3 && onborder10) ? l1_neg: 
					(~DONE3 && onborder11) ? l1:
					(~DONE3) ? t1_test:32'b10101010101010101010101010101010;

	//if(t[2] < -l[2]) {onborder = 1}
	//assign temp20 = l2_neg - t2_test;
	assign onborder20 = (DONE3) ? 1'b0:
							(temp20 == 1'b0) ? 1'b1:1'b0;
	//if(t[2] > l[2]) {onborder = 1}
	//assign temp21 = t2_test - l2;
	assign onborder21 = (DONE3) ? 1'b0:
							(temp21 == 1'b0) ? 1'b1:1'b0;
	//if(t[2] < -l[2]) {t[2] = -l[2]}
	//if(t[2] > l[2]) {t[2] = l[2]}
	//else t2 = -3E-13 (therefore State is still in IF_ONBORDER)
	assign t2 = (~DONE3 && onborder20) ? l2_neg: 
					(~DONE3 && onborder21) ? l2:
					(~DONE3) ? t2_test:32'b10101010101010101010101010101010;
	
	assign onborder = onborder00 || onborder01 || onborder10 || onborder11 ||onborder20 || onborder21;
	

//CALC_Q/////////////////////////////////////////////////////////////
	//dMultiply0_331(q,o2->final_posr->R,t);
	//q[0] = dCalcVectorDot3(R, t)
	wire[31:0] q0;
	wire done_q0;
	dCalcVectorDot3_test calc_q0(
		.CLK(clk), 
		.a1(r0),		//R[0] 
		.a2(r1), 	//R[1]
		.a3(r2), 	//R[2]
		.b1(t0),
		.b2(t1),
		.b3(t2),
		.RST(DONE4),
		.res(q0),
		.out_rdy(done_q0)
	);
	
	//q[1] = dCalcVectorDot3(R+4, t)
	wire[31:0] q1;
	wire done_q1;
	dCalcVectorDot3_test calc_q1(
		.CLK(clk), 
		.a1(r4),		//R+4[0] 
		.a2(r5), 	//R+4[1]
		.a3(r6), 	//R+4[2]
		.b1(t0),
		.b2(t1),
		.b3(t2),
		.RST(DONE4),
		.res(q1),
		.out_rdy(done_q1)
	);
	
	//q[2] = dCalcVectorDot3(R+8, t)
	wire[31:0] q2;
	wire done_q2;
	dCalcVectorDot3_test calc_q2(
		.CLK(clk), 
		.a1(r8),		//R+8[0] 
		.a2(r9), 	//R+8[1]
		.a3(r10), 	//R+8[2]
		.b1(t0),
		.b2(t1),
		.b3(t2),
		.RST(DONE4),
		.res(q2),
		.out_rdy(done_q2)
	);
	
//CALC_R////////////////////////////////////////////////
	//r[0] = p[0] - q[0]
	wire[31:0] q0_neg;
	assign q0_neg = {~q0[31],q0[30:0]};
	wire[31:0] r_0;
	wire done_r0;
	wire add_z_ack_r0;
	wire a_ack_r0;
	wire b_ack_r0;
	adder add_p0_q0_neg(
		.input_a(p0), 
		.input_b(q0_neg), 
		.input_a_stb(1'b1),
		.input_b_stb(1'b1),
		.output_z_ack(add_z_ack_r0),
		.clk(clk),
		.rst(DONE5),
		.output_z(r_0),
		.output_z_stb(done_r0),
		.input_a_ack(a_ack_r0),
		.input_b_ack(b_ack_r0)
	);

	//r[1] = p[1] - q[1]
	wire[31:0] q1_neg;
	assign q1_neg = {~q1[31],q1[30:0]};
	wire[31:0] r_1;
	wire done_r1;
	wire add_z_ack_r1;
	wire a_ack_r1;
	wire b_ack_r1;
	adder add_p1_q1_neg(
		.input_a(p1), 
		.input_b(q1_neg), 
		.input_a_stb(1'b1),
		.input_b_stb(1'b1),
		.output_z_ack(add_z_ack_r1),
		.clk(clk),
		.rst(DONE5),
		.output_z(r_1),
		.output_z_stb(done_r1),
		.input_a_ack(a_ack_r1),
		.input_b_ack(b_ack_r1)
	);
	
	//r[2] = p[2] - q[2]
	wire[31:0] q2_neg;
	assign q2_neg = {~q2[31],q2[30:0]};
	wire[31:0] r_2;
	wire done_r2;
	wire add_z_ack_r2;
	wire a_ack_r2;
	wire b_ack_r2;
	adder add_p2_q2_neg(
		.input_a(p2), 
		.input_b(q2_neg), 
		.input_a_stb(1'b1),
		.input_b_stb(1'b1),
		.output_z_ack(add_z_ack_r2),
		.clk(clk),
		.rst(DONE5),
		.output_z(r_2),
		.output_z_stb(done_r2),
		.input_a_ack(a_ack_r2),
		.input_b_ack(b_ack_r2)
	);
	
//CALC_DEPTH0/////////////////////////////////////////////////
	//dCalcVectorDot3(r,r)
	wire[31:0] rCalc;
	wire done_rCalc;
	dCalcVectorDot3_test calc_r_r(
		.CLK(clk), 
		.a1(r_0),	 
		.a2(r_1), 
		.a3(r_2),
		.b1(r_0),
		.b2(r_1),
		.b3(r_2),
		.RST(DONE6),
		.res(rCalc),
		.out_rdy(done_rCalc)
	);

//CALC_DEPTH1/////////////////////////////////////////////////
	//dSqrt(r_calc)
	wire[31:0] rCalc_sqrt;
	wire done_rCalc_sqrt;
	wire iddle;
	sqrt sqrt0(
	.CLK(clk),
	.RST(DONE7),
	.n(rCalc),
	.pos(iddle),
	.root(rCalc_sqrt),
	.out_rdy(done_rCalc_sqrt)
);
	
//CALC_DEPTH2/////////////////////////////////////////////////
	//radius - rCalc_sqrt
	//had to hardcode sphere's radius cuz ran out of i/o "pads"
	wire[31:0] radius = 32'b00111111000000000000000000000000;	//0.5
	wire[31:0] rCalc_sqrt_neg;
	assign rCalc_sqrt_neg = {~rCalc_sqrt[31], rCalc_sqrt[30:0]};
	wire[31:0] dep;
	wire done_dep;
	wire add_z_ack_dep;
	wire a_ack_dep;
	wire b_ack_dep;
	adder add_radius_rCalc_sqrt_neg(
		.input_a(radius), 
		.input_b(rCalc_sqrt_neg), 
		.input_a_stb(1'b1),
		.input_b_stb(1'b1),
		.output_z_ack(add_z_ack_dep),
		.clk(clk),
		.rst(DONE8),
		.output_z(dep),
		.output_z_stb(done_dep),
		.input_a_ack(a_ack_dep),
		.input_b_ack(b_ack_dep)
	);
	
//IF_DEPTH///////////////////////////////////////////////////////////
	//if(depth < 0)
	assign depLess0 = (dep[31] == 1'b1 || dep == 32'b00000000000000000000000000000000) ? 1'b1:1'b0;

//IF_DEPTH_FALSE/////////////////////////////////////////////////////
	//pos[0] = q[0] + o2->final_posr->pos[0]
	wire[31:0] pos0;
	wire done_pos0;
	wire add_z_ack_pos0;
	wire a_ack_pos0;
	wire b_ack_pos0;
	adder add_q0_x2(
		.input_a(q0), 
		.input_b(x2), 
		.input_a_stb(1'b1),
		.input_b_stb(1'b1),
		.output_z_ack(add_z_ack_pos0),
		.clk(clk),
		.rst(DONE10),
		.output_z(pos0),
		.output_z_stb(done_pos0),
		.input_a_ack(a_ack_pos0),
		.input_b_ack(b_ack_pos0)
	);
	
	//pos[1] = q[1] + o2->final_posr->pos[1]
	wire[31:0] pos1;
	wire done_pos1;
	wire add_z_ack_pos1;
	wire a_ack_pos1;
	wire b_ack_pos1;
	adder add_q1_y2(
		.input_a(q1), 
		.input_b(y2), 
		.input_a_stb(1'b1),
		.input_b_stb(1'b1),
		.output_z_ack(add_z_ack_pos1),
		.clk(clk),
		.rst(DONE10),
		.output_z(pos1),
		.output_z_stb(done_pos1),
		.input_a_ack(a_ack_pos1),
		.input_b_ack(b_ack_pos1)
	);
	
	//pos[2] = q[2] + o2->final_posr->pos[2]
	wire[31:0] pos2;
	wire done_pos2;
	wire add_z_ack_pos2;
	wire a_ack_pos2;
	wire b_ack_pos2;
	adder add_q2_z2(
		.input_a(q2), 
		.input_b(z2), 
		.input_a_stb(1'b1),
		.input_b_stb(1'b1),
		.output_z_ack(add_z_ack_pos2),
		.clk(clk),
		.rst(DONE10),
		.output_z(pos2),
		.output_z_stb(done_pos2),
		.input_a_ack(a_ack_pos2),
		.input_b_ack(b_ack_pos2)
	);
	
//NOT_ONBORDER///////////////////////////////////////////
	//if(!onborder)
	//find distance b/n l[i] and t[i]
	//dist[i] = l[i] - abs(t[i])	
		//abs(t[i])
		wire[31:0] abs_t0;
		//make t[i] negative so can calculate l[i] - t[i]
		assign abs_t0 = (t0[31] == 1'b1) ? t0:{~t0[31],t0[30:0]};		//possibly add (&& t[i] != 0) to avoid adder mistake for -0
		wire[31:0] abs_t1;
		assign abs_t1 = (t1[31] == 1'b1) ? t1:{~t1[31],t1[30:0]};
		wire[31:0] abs_t2;
		assign abs_t2 = (t2[31] == 1'b1) ? t2:{~t2[31],t2[30:0]};
		
		//l[0] - abs_t[0]
		wire[31:0] dist0;
		wire done_dist0;
		wire add_z_ack_dist0;
		wire a_ack_dist0;
		wire b_ack_dist0;
		adder add_l0_abs_t0(
			.input_a(l0), 
			.input_b(abs_t0), 
			.input_a_stb(1'b1),
			.input_b_stb(1'b1),
			.output_z_ack(add_z_ack_dist0),
			.clk(clk),
			.rst(DONE11),
			.output_z(dist0),
			.output_z_stb(done_dist0),
			.input_a_ack(a_ack_dist0),
			.input_b_ack(b_ack_dist0)
		);
	
		//l[1] - abs_t[1]
		wire[31:0] dist1;
		wire done_dist1;
		wire add_z_ack_dist1;
		wire a_ack_dist1;
		wire b_ack_dist1;
		adder add_l1_abs_t1(
			.input_a(l1), 
			.input_b(abs_t1), 
			.input_a_stb(1'b1),
			.input_b_stb(1'b1),
			.output_z_ack(add_z_ack_dist1),
			.clk(clk),
			.rst(DONE11),
			.output_z(dist1),
			.output_z_stb(done_dist1),
			.input_a_ack(a_ack_dist1),
			.input_b_ack(b_ack_dist1)
		);
		
		//l[2] - abs_t[2]
		wire[31:0] dist2;
		wire done_dist2;
		wire add_z_ack_dist2;
		wire a_ack_dist2;
		wire b_ack_dist2;
		adder add_l2_abs_t2(
			.input_a(l2), 
			.input_b(abs_t2), 
			.input_a_stb(1'b1),
			.input_b_stb(1'b1),
			.output_z_ack(add_z_ack_dist2),
			.clk(clk),
			.rst(DONE11),
			.output_z(dist2),
			.output_z_stb(done_dist2),
			.input_a_ack(a_ack_dist2),
			.input_b_ack(b_ack_dist2)
		);
	
//NOT_ONBORDER_MIN_DIST/////////////////////////////////////////////
	//this chunk finds the smallest distance calculated above
	//these are used in the freakish case that a pair are equal
	wire equals01, equals02, equals12;
	assign equals01 = dist0 == dist1;
	assign equals02 = dist0 == dist2;
	assign equals12 = dist1 == dist2;
	//not implementing this until I feel like it or it becomes necessary
	
	
	
	wire[31:0] dist1_neg;
	assign dist1_neg = (dist1 == 32'd0) ? dist1:{~dist1[31],dist1[30:0]};
	//dist0 < dist1
	wire lessThan01;
	wire done_lessThan01;
	wire add_z_ack_lessThan01;
	wire a_ack_lessThan01;
	wire b_ack_lessThan01;
	lessThan lessThanDist01(
		.input_a(dist0), 
		.input_b(dist1_neg), 
		.input_a_stb(1'b1),
		.input_b_stb(1'b1),
		.output_z_ack(add_z_ack_lessThan01),
		.clk(clk),
		.rst(DONE12),
		.output_z(lessThan01),
		.output_z_stb(done_lessThan01),
		.input_a_ack(a_ack_lessThan01),
		.input_b_ack(b_ack_lessThan01)
	);
	
	wire[31:0] dist2_neg;
	assign dist2_neg = (dist2 == 32'd0) ? dist2:{~dist2[31],dist2[30:0]};
	//dist0 < dist2
	wire lessThan02;
	wire done_lessThan02;
	wire add_z_ack_lessThan02;
	wire a_ack_lessThan02;
	wire b_ack_lessThan02;
	lessThan lessThanDist02(
		.input_a(dist0), 
		.input_b(dist2_neg), 
		.input_a_stb(1'b1),
		.input_b_stb(1'b1),
		.output_z_ack(add_z_ack_lessThan02),
		.clk(clk),
		.rst(DONE12),
		.output_z(lessThan02),
		.output_z_stb(done_lessThan02),
		.input_a_ack(a_ack_lessThan02),
		.input_b_ack(b_ack_lessThan02)
	);
	
	//dist1 < dist2
	wire lessThan12;
	wire done_lessThan12;
	wire add_z_ack_lessThan12;
	wire a_ack_lessThan12;
	wire b_ack_lessThan12;
	lessThan lessThanDist12(
		.input_a(dist1), 
		.input_b(dist2_neg), 
		.input_a_stb(1'b1),
		.input_b_stb(1'b1),
		.output_z_ack(add_z_ack_lessThan12),
		.clk(clk),
		.rst(DONE12),
		.output_z(lessThan12),
		.output_z_stb(done_lessThan12),
		.input_a_ack(a_ack_lessThan12),
		.input_b_ack(b_ack_lessThan12)
	);
	
	//determines min distance (0 = dist0, 1 = dist1, 2 = dist2, 3 = undecided)
	//lessThanDistAB = 0, then A > B 
	wire[1:0] minDistI;
	assign minDistI = (~(done_lessThan01 && done_lessThan02 && done_lessThan12) && DONE13) ? 2'd3 :		//undecided
							(lessThan01 == 1'b1 && lessThan02 == 1'b1) ? 2'd0 :										//dist0
							(lessThan01 == 1'b0 && lessThan12 == 1'b1) ? 2'd1 :										//dist1
							(lessThan02 == 1'b0 && lessThan12 == 1'b0) ? 2'd2 :										//dist2
							(lessThan01 == 1'b1 && lessThan12 == 1'b1) ? 2'd0 :										//dist0 = dist2 < dist1 (special case)
							2'd3;																										//default (undecided)
	
	
//CALC_TMP////////////////////////////////////////////////////////////////
	//tmp[0] = 0; tmp[1] = 0; tmp[2] = 0;
	//tmp[mini] = (t[mini] > 0) ? 1.0 : -1.0;
	wire[31:0] tmp0, tmp1, tmp2;
						//t[mini]				> 0
	assign tmp0 = 	(minDistI == 2'd3) ? 32'b10101010101010101010101010101010:															//minDistI undecided
						(minDistI == 2'd0 && ~(dist0 == 32'd0 || dist0[31] == 1'b1)) ? 32'b00111111100000000000000000000000:	//1.0
					  (minDistI == 2'd0) ? 32'b10111111100000000000000000000000: 32'd0;													//-1.0
																									// ^ tmp[mini] = minDistI != tmp0
	assign tmp1 = 	(minDistI == 2'd3) ? 32'b10101010101010101010101010101010:															//minDistI undecided
						(minDistI == 2'd1 && ~(dist1 == 32'd0 || dist1[31] == 1'b1)) ? 32'b00111111100000000000000000000000:	//1.0
					  (minDistI == 2'd1) ? 32'b10111111100000000000000000000000: 32'd0;													//-1.0
																									// ^ tmp[mini] = minDistI != tmp1
	assign tmp2 = 	(minDistI == 2'd3) ? 32'b10101010101010101010101010101010:															//minDistI undecided
						(minDistI == 2'd2 && ~(dist2 == 32'd0 || dist2[31] == 1'b1)) ? 32'b00111111100000000000000000000000:	//1.0
					  (minDistI == 2'd2) ? 32'b10111111100000000000000000000000: 32'd0;													//-1.0
																									// ^ tmp[mini] = minDistI != tmp2
	
//CALC_TMP_DMULTIPLY/////////////////////////////////////////////////////////////
	//dMultiply0_331 (contact->normal, o2->final_posr->R, tmp);
	//dMultiply0_331 (normal, R, tmp);
	
	//dMultiply0_331(q,o2->final_posr->R,t);
	//nx = dCalcVectorDot3(R, tmp)
	wire[31:0] nx;
	wire done_nx;
	dCalcVectorDot3_test calc_nx(
		.CLK(clk), 
		.a1(r0),		//R[0] 
		.a2(r1), 	//R[1]
		.a3(r2), 	//R[2]
		.b1(tmp0),
		.b2(tmp1),
		.b3(tmp2),
		.RST(DONE13),
		.res(nx),
		.out_rdy(done_nx)
	);
	
	//ny = dCalcVectorDot3(R+4, tmp)
	wire[31:0] ny;
	wire done_ny;
	dCalcVectorDot3_test calc_ny(
		.CLK(clk), 
		.a1(r4),		//R+4[0] 
		.a2(r5), 	//R+4[1]
		.a3(r6), 	//R+4[2]
		.b1(tmp0),
		.b2(tmp1),
		.b3(tmp2),
		.RST(DONE13),
		.res(ny),
		.out_rdy(done_ny)
	);
	
	//nz = dCalcVectorDot3(R+8, tmp)
	wire[31:0] nz;
	wire done_nz;
	dCalcVectorDot3_test calc_nz(
		.CLK(clk), 
		.a1(r8),		//R+8[0] 
		.a2(r9), 	//R+8[1]
		.a3(r10), 	//R+8[2]
		.b1(tmp0),
		.b2(tmp1),
		.b3(tmp2),
		.RST(DONE13),
		.res(nz),
		.out_rdy(done_nz)
	);
	
	
	//contact->depth = min_distance + sphere->radius
	//depth = minDist + radius
	//assigning minDist
	wire[31:0] minDist;
	assign minDist =	(minDistI == 2'd0) ? dist0:
							(minDistI == 2'd1) ? dist1:
							(minDistI == 2'd2) ? dist2:
							32'b10101010101010101010101010101010;	//undecided
	
	//depth = minDist + radius
	wire[31:0] dep_nb;	//depth calculated in if(!onborder) = NOT_ONBORDER
	wire done_dep_nb;
	wire add_z_ack_dep_nb;
	wire a_ack_dep_nb;
	wire b_ack_dep_nb;
	adder add_minDist_radius(
		.input_a(minDist), 
		.input_b(radius), 
		.input_a_stb(1'b1),
		.input_b_stb(1'b1),
		.output_z_ack(add_z_ack_dep_nb),
		.clk(clk),
		.rst(DONE13),
		.output_z(dep_nb),
		.output_z_stb(done_dep_nb),
		.input_a_ack(a_ack_dep_nb),
		.input_b_ack(b_ack_dep_nb)
	);
	
	
	
	
	reg[4:0] S;
	reg CLK_FINAL;
	
	parameter	START = 5'd0,
					CALC0 = 5'd1,
					CALC1 = 5'd2,
					CALC_BORDER_TEMPS = 5'd3,
					CALC_T = 5'd4,
					IF_ONBORDER = 5'd5,
					NOT_ONBORDER = 5'd6,
					CALC_Q = 5'd7,
					CALC_R = 5'd8, 
					CALC_DEPTH0 = 5'd9,
					CALC_DEPTH1 = 5'd10,
					CALC_DEPTH2 = 5'd11,
					IF_DEPTH = 5'd12,
					IF_DEPTH_TRUE = 5'd13,
					IF_DEPTH_FALSE = 5'd14,
					NOT_ONBORDER_MIN_DIST = 5'd15,
					CALC_TMP = 5'd16,
					CALC_TMP_DMULTIPLY = 5'd17,
					DONE = 5'd31;	
					
	always@(posedge clk)
	begin
		case(S)
			CALC0:
			begin
				DONE0 = 1'b0;
				DONE1 = 1'b1;
				DONE2 = 1'b1;
				DONE3 = 1'b1;
				DONE4 = 1'b1;
				DONE5 = 1'b1;
				DONE6 = 1'b1;
				DONE7 = 1'b1;
				DONE8 = 1'b1;
				DONE9 = 1'b1;
				DONE10 = 1'b1;
				DONE11 = 1'b1;
				DONE12 = 1'b1;
				DONE13 = 1'b1;

				if(done_l0 && done_l1 && done_l2 && done_p0 && done_p1 && done_p2)
				begin
					S = CALC1;
				end
				else
					S = CALC0;
			end
			CALC1:
			begin
				DONE0 = 1'b1;
				DONE1 = 1'b0;
				DONE2 = 1'b1;
				DONE3 = 1'b1;
				DONE4 = 1'b1;
				DONE5 = 1'b1;
				DONE6 = 1'b1;
				DONE7 = 1'b1;
				DONE8 = 1'b1;
				DONE9 = 1'b1;
				DONE10 = 1'b1;
				DONE11 = 1'b1;
				DONE12 = 1'b1;
				DONE13 = 1'b1;

				if(done_t0 && done_t1 && done_t2 )
				begin
					S = CALC_BORDER_TEMPS;
				end
				else
					S = CALC1;
			end
			CALC_BORDER_TEMPS:
			begin
				DONE0 = 1'b1;
				DONE1 = 1'b1;
				DONE2 = 1'b0;
				DONE3 = 1'b1;
				DONE4 = 1'b1;
				DONE5 = 1'b1;
				DONE6 = 1'b1;
				DONE7 = 1'b1;
				DONE8 = 1'b1;
				DONE9 = 1'b1;
				DONE10 = 1'b1;
				DONE11 = 1'b1;
				DONE12 = 1'b1;
				DONE13 = 1'b1;
				
				if(done_temp00 && done_temp01 && done_temp10 && done_temp11 && done_temp20 && done_temp21)
					S = CALC_T;
				else
					S = CALC_BORDER_TEMPS;
			end
			CALC_T:
			begin
				DONE0 = 1'b1;
				DONE1 = 1'b1;
				DONE2 = 1'b1;
				DONE3 = 1'b0;		//keep DONE3 = 0 for rest of states
				DONE4 = 1'b1;
				DONE5 = 1'b1;
				DONE6 = 1'b1;
				DONE7 = 1'b1;
				DONE8 = 1'b1;
				DONE9 = 1'b1;
				DONE10 = 1'b1;
				DONE11 = 1'b1;
				DONE12 = 1'b1;
				DONE13 = 1'b1;
				
				//make sure t[0], t[1], t[2] have finished being calculated in the if-statement cluster fuck
				if(~(t0 == 32'b10101010101010101010101010101010) && 
					~(t1 == 32'b10101010101010101010101010101010) && 
					~(t2 == 32'b10101010101010101010101010101010))
				begin
					S = IF_ONBORDER;
				end
				else
					S = CALC_T;
			end
			IF_ONBORDER:
			begin
				DONE0 = 1'b1;
				DONE1 = 1'b1;
				DONE2 = 1'b1;
				DONE3 = 1'b0;		//keep DONE3 = 0 for rest of states
				DONE4 = 1'b1;
				DONE5 = 1'b1;
				DONE6 = 1'b1;
				DONE7 = 1'b1;
				DONE8 = 1'b1;
				DONE9 = 1'b1;
				DONE10 = 1'b1;
				DONE11 = 1'b1;
				DONE12 = 1'b1;
				DONE13 = 1'b1;
				
				if(onborder == 1'b0)
					S = NOT_ONBORDER;
				else
					S = CALC_Q;
			end
			NOT_ONBORDER:
			begin
				DONE0 = 1'b1;
				DONE1 = 1'b1;
				DONE2 = 1'b1;
				DONE3 = 1'b0;		//keep DONE3 = 0 for rest of states
				DONE4 = 1'b1;
				DONE5 = 1'b1;
				DONE6 = 1'b1;
				DONE7 = 1'b1;
				DONE8 = 1'b1;
				DONE9 = 1'b1;
				DONE10 = 1'b1;
				DONE11 = 1'b0;
				DONE12 = 1'b1;
				DONE13 = 1'b1;
				
				if(done_dist0 && done_dist1 && done_dist2)
					S = NOT_ONBORDER_MIN_DIST;
				else
					S = NOT_ONBORDER;
			end
			NOT_ONBORDER_MIN_DIST:
			begin
				DONE0 = 1'b1;
				DONE1 = 1'b1;
				DONE2 = 1'b1;
				DONE3 = 1'b0;		//keep DONE3 = 0 for rest of states
				DONE4 = 1'b1;
				DONE5 = 1'b1;
				DONE6 = 1'b1;
				DONE7 = 1'b1;
				DONE8 = 1'b1;
				DONE9 = 1'b1;
				DONE10 = 1'b1;
				DONE11 = 1'b1;
				DONE12 = 1'b0;
				DONE13 = 1'b1;
				
				if (minDistI == 2'd3)
					S = NOT_ONBORDER_MIN_DIST;
				else if(minDistI == 2'd0 || minDistI == 2'd1 || minDistI == 2'd2)
					S = CALC_TMP;
			end
			CALC_TMP:
			begin
				//make sure tmp0, tmp1, tmp2 are done being calculated / can be calculated
				if(~(tmp0 == 32'b10101010101010101010101010101010) && 
					~(tmp1 == 32'b10101010101010101010101010101010) && 
					~(tmp2 == 32'b10101010101010101010101010101010))
				begin
					S = CALC_TMP_DMULTIPLY;
				end
				else
					S = CALC_TMP;
			end
			CALC_TMP_DMULTIPLY:
			begin
				DONE0 = 1'b1;
				DONE1 = 1'b1;
				DONE2 = 1'b1;
				DONE3 = 1'b0;		//keep DONE3 = 0 for rest of states
				DONE4 = 1'b1;
				DONE5 = 1'b1;
				DONE6 = 1'b1;
				DONE7 = 1'b1;
				DONE8 = 1'b1;
				DONE9 = 1'b1;
				DONE10 = 1'b1;
				DONE11 = 1'b1;
				DONE12 = 1'b1;
				DONE13 = 1'b0;
				
				if(done_nx && done_ny && done_nz && done_dep_nb)
				begin
					/*
						posx = x1
						posy = y1
						posz = z1
						normalx = nx
						normaly = ny
						normalz = nz
						depth = dep_nb
					*/
					S = DONE;
					CLK_FINAL = 1'b1;
				end
				else
					S = CALC_TMP_DMULTIPLY;
			end
			CALC_Q:
			begin
				DONE0 = 1'b1;
				DONE1 = 1'b1;
				DONE2 = 1'b1;
				DONE3 = 1'b0;		//keep DONE3 = 0 for rest of states
				DONE4 = 1'b0;
				DONE5 = 1'b1;
				DONE6 = 1'b1;
				DONE7 = 1'b1;
				DONE8 = 1'b1;
				DONE9 = 1'b1;
				DONE10 = 1'b1;
				DONE11 = 1'b1;
				DONE12 = 1'b1;
				DONE13 = 1'b1;
				
				if(done_q0 && done_q1 && done_q2)
					S = CALC_R;
				else
					S = CALC_Q;
			end
			CALC_R:
			begin
				DONE0 = 1'b1;
				DONE1 = 1'b1;
				DONE2 = 1'b1;
				DONE3 = 1'b0;		//keep DONE3 = 0 for rest of states
				DONE4 = 1'b1;
				DONE5 = 1'b0;
				DONE6 = 1'b1;
				DONE7 = 1'b1;
				DONE8 = 1'b1;
				DONE9 = 1'b1;
				DONE10 = 1'b1;
				DONE11 = 1'b1;
				DONE12 = 1'b1;
				DONE13 = 1'b1;
				
				if(done_r0 && done_r1 && done_r2)
					S = CALC_DEPTH0;
				else
					S = CALC_R;
			end
			CALC_DEPTH0:
			begin
				DONE0 = 1'b1;
				DONE1 = 1'b1;
				DONE2 = 1'b1;
				DONE3 = 1'b0;		//keep DONE3 = 0 for rest of states
				DONE4 = 1'b1;
				DONE5 = 1'b1;
				DONE6 = 1'b0;
				DONE7 = 1'b1;
				DONE8 = 1'b1;
				DONE9 = 1'b1;
				DONE10 = 1'b1;
				DONE11 = 1'b1;
				DONE12 = 1'b1;
				DONE13 = 1'b1;
				
				if(done_rCalc)
					S = CALC_DEPTH1;
				else
					S = CALC_DEPTH0;
			end
			CALC_DEPTH1:
			begin
				DONE0 = 1'b1;
				DONE1 = 1'b1;
				DONE2 = 1'b1;
				DONE3 = 1'b0;		//keep DONE3 = 0 for rest of states
				DONE4 = 1'b1;
				DONE5 = 1'b1;
				DONE6 = 1'b1;
				DONE7 = 1'b0;
				DONE8 = 1'b1;
				DONE9 = 1'b1;
				DONE10 = 1'b1;
				DONE11 = 1'b1;
				DONE12 = 1'b1;
				DONE13 = 1'b1;
				
				if(done_rCalc_sqrt)
					S = CALC_DEPTH2;
				else
					S = CALC_DEPTH1;
			end
			CALC_DEPTH2:
			begin
				DONE0 = 1'b1;
				DONE1 = 1'b1;
				DONE2 = 1'b1;
				DONE3 = 1'b0;		//keep DONE3 = 0 for rest of states
				DONE4 = 1'b1;
				DONE5 = 1'b1;
				DONE6 = 1'b1;
				DONE7 = 1'b1;
				DONE8 = 1'b0;
				DONE9 = 1'b1;
				DONE10 = 1'b1;
				DONE11 = 1'b1;
				DONE12 = 1'b1;
				DONE13 = 1'b1;
				
				if(done_dep)
					S = IF_DEPTH;
				else
					S = CALC_DEPTH2;
			end
			IF_DEPTH:
			begin
				DONE0 = 1'b1;
				DONE1 = 1'b1;
				DONE2 = 1'b1;
				DONE3 = 1'b0;		//keep DONE3 = 0 for rest of states
				DONE4 = 1'b1;
				DONE5 = 1'b1;
				DONE6 = 1'b1;
				DONE7 = 1'b1;
				DONE8 = 1'b1;
				DONE9 = 1'b1;
				DONE10 = 1'b1;
				DONE11 = 1'b1;
				DONE12 = 1'b1;
				DONE13 = 1'b1;
				
				if(depLess0 == 1'b1)
					S = IF_DEPTH_TRUE;
				else if (depLess0 == 1'b0)
					S = IF_DEPTH_FALSE;
				else
					S = IF_DEPTH;
			end
			IF_DEPTH_TRUE:
			begin	
				//return 0
				CLK_FINAL = 1'b1;
			end
			IF_DEPTH_FALSE:
			begin
				DONE0 = 1'b1;
				DONE1 = 1'b1;
				DONE2 = 1'b1;
				DONE3 = 1'b0;		//keep DONE3 = 0 for rest of states
				DONE4 = 1'b1;
				DONE5 = 1'b1;
				DONE6 = 1'b1;
				DONE7 = 1'b1;
				DONE8 = 1'b1;
				DONE9 = 1'b1;
				DONE10 = 1'b0;
				DONE11 = 1'b1;
				DONE12 = 1'b1;
				DONE13 = 1'b1;
				
				if(done_pos0 && done_pos1 && done_pos2)
				begin
					/*
						posx = pos0
						posy = pos1
						posz = pos2
						normalx = r0
						normaly = r1
						normalz = r2
						depth = dep
					*/
					CLK_FINAL = 1'b1;
					S = DONE;
				end
				else
					S = IF_DEPTH_FALSE;
			end
			DONE:
			begin
				/*
				cx = r0
				cy = r1
				cz = r2
				normalx = r4
				normaly = r5
				normalz = r6
				depth = r8
				
				*/
			end
			default:
			begin
				S = CALC0;
				CLK_FINAL = 1'b0;
			end
		endcase
	end
	
endmodule