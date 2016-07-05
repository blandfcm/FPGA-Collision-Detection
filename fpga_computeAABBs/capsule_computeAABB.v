module capsule_computeAABB(
	input clk, rst,
	input[31:0] x, y, z,
	input[31:0] lz, radius,
	input[31:0] r2, r6, r10,
	output[31:0] aabb0, aabb1, aabb2, aabb3, aabb4, aabb5,
	output done
);

//R[2] * lz
wire[31:0] r2_lz;
wire done_r2_lz;
wire output_z_ack_r2_lz;
wire input_a_ack_r2_lz;
wire input_b_ack_r2_lz;
multiplier mult_r2_lz(
	.input_a(r2),
	.input_b(lz),
	.input_a_stb(1'b1),
	.input_b_stb(1'b1),
	.output_z_ack(output_z_ack_r2_lz),
	.clk(clk),
	.rst(rst),
	.output_z(r2_lz),
	.output_z_stb(done_r2_lz),
	.input_a_ack(input_a_ack_r2_lz),
	.input_b_ack(input_b_ack_r2_lz)
);

//R[6] * lz
wire[31:0] r6_lz;
wire done_r6_lz;
wire output_z_ack_r6_lz;
wire input_a_ack_r6_lz;
wire input_b_ack_r6_lz;
multiplier mult_r6_lz(
	.input_a(r6),
	.input_b(lz),
	.input_a_stb(1'b1),
	.input_b_stb(1'b1),
	.output_z_ack(output_z_ack_r6_lz),
	.clk(clk),
	.rst(rst),
	.output_z(r6_lz),
	.output_z_stb(done_r6_lz),
	.input_a_ack(input_a_ack_r6_lz),
	.input_b_ack(input_b_ack_r6_lz)
);

//R[10] * lz
wire[31:0] r10_lz;
wire done_r10_lz;
wire output_z_ack_r10_lz;
wire input_a_ack_r10_lz;
wire input_b_ack_r10_lz;
multiplier mult_r10_lz(
	.input_a(r10),
	.input_b(lz),
	.input_a_stb(1'b1),
	.input_b_stb(1'b1),
	.output_z_ack(output_z_ack_r10_lz),
	.clk(clk),
	.rst(rst),
	.output_z(r10_lz),
	.output_z_stb(done_r10_lz),
	.input_a_ack(input_a_ack_r10_lz),
	.input_b_ack(input_b_ack_r10_lz)
);

	//abs(R[2] * lz)
	wire[31:0] r2_lz_abs;
	assign r2_lz_abs = (r2_lz[31] == 1'b1) ? {~r2_lz[31], r2_lz[30:0]}:r2_lz;
	
	//abs(R[6] * lz)
	wire[31:0] r6_lz_abs;
	assign r6_lz_abs = (r6_lz[31] == 1'b1) ? {~r6_lz[31], r6_lz[30:0]}:r6_lz;
	
	//abs(R[10] * lz)
	wire[31:0] r10_lz_abs;
	assign r10_lz_abs = (r10_lz[31] == 1'b1) ? {~r10_lz[31], r10_lz[30:0]}:r10_lz;
	
	wire[31:0] temp0;
	wire done_temp0;
	wire mult_z_temp0;
	wire a_ack_temp0;
	wire b_ack_temp0;
	divider divide_r2_lz_2(
		.input_a(r2_lz_abs), 
		.input_b(32'b01000000000000000000000000000000),
		.input_a_stb(done_r2_lz),
		.input_b_stb(1'b1),
		.output_z_ack(mult_z_temp0),
		.clk(clk),
		.rst(done_r2_lz),
		.output_z(temp0),
		.output_z_stb(done_temp0),
		.input_a_ack(a_ack_temp0),
		.input_b_ack(b_ack_temp0)
	);
	
	wire[31:0] temp1;
	wire done_temp1;
	wire mult_z_temp1;
	wire a_ack_temp1;
	wire b_ack_temp1;
	divider divide_r6_lz_2(
		.input_a(r6_lz_abs), 
		.input_b(32'b01000000000000000000000000000000),
		.input_a_stb(done_r6_lz),
		.input_b_stb(1'b1),
		.output_z_ack(mult_z_temp1),
		.clk(clk),
		.rst(done_r6_lz),
		.output_z(temp1),
		.output_z_stb(done_temp1),
		.input_a_ack(a_ack_temp1),
		.input_b_ack(b_ack_temp1)
	);
	
	wire[31:0] temp2;
	wire done_temp2;
	wire mult_z_temp2;
	wire a_ack_temp2;
	wire b_ack_temp2;
	divider divide_r10_lz_2(
		.input_a(r10_lz_abs), 
		.input_b(32'b01000000000000000000000000000000),
		.input_a_stb(done_r10_lz),
		.input_b_stb(1'b1),
		.output_z_ack(mult_z_temp2),
		.clk(clk),
		.rst(done_r10_lz),
		.output_z(temp2),
		.output_z_stb(done_temp2),
		.input_a_ack(a_ack_temp2),
		.input_b_ack(b_ack_temp2)
	);
	
		wire[31:0] xrange;
		wire done_xrange;
		wire add_z_xrange;
		wire a_ack_xrange;
		wire b_ack_xrange;
		adder add_temp0_radius(
			.input_a(temp0), 
			.input_b(radius), 
			.input_a_stb(done_temp0),
			.input_b_stb(1'b1),
			.output_z_ack(add_z_xrange),
			.clk(clk),
			.rst(done_temp0),
			.output_z(xrange),
			.output_z_stb(done_xrange),
			.input_a_ack(a_ack_xrange),
			.input_b_ack(b_ack_xrange)
		);
		
		wire[31:0] yrange;
		wire done_yrange;
		wire add_z_yrange;
		wire a_ack_yrange;
		wire b_ack_yrange;
		adder add_temp1_radius(
			.input_a(temp1), 
			.input_b(radius), 
			.input_a_stb(done_temp1),
			.input_b_stb(1'b1),
			.output_z_ack(add_z_yrange),
			.clk(clk),
			.rst(done_temp1),
			.output_z(yrange),
			.output_z_stb(done_yrange),
			.input_a_ack(a_ack_yrange),
			.input_b_ack(b_ack_yrange)
		);
		
		wire[31:0] zrange;
		wire done_zrange;
		wire add_z_zrange;
		wire a_ack_zrange;
		wire b_ack_zrange;
		adder add_temp2_radius(
			.input_a(temp2), 
			.input_b(radius), 
			.input_a_stb(done_temp2),
			.input_b_stb(1'b1),
			.output_z_ack(add_z_zrange),
			.clk(clk),
			.rst(done_temp2),
			.output_z(zrange),
			.output_z_stb(done_zrange),
			.input_a_ack(a_ack_zrange),
			.input_b_ack(b_ack_zrange)
		);
			
			wire[31:0] xrange_neg;
			assign xrange_neg = {~xrange[31], xrange[30:0]};
			
			wire[31:0] yrange_neg;
			assign yrange_neg = {~yrange[31], yrange[30:0]};
			
			wire[31:0] zrange_neg;
			assign zrange_neg = {~zrange[31], zrange[30:0]};
			
			//aabb[0] = pos[0] - xrange
			wire done_a0;
			wire add_z_a0;
			wire a_ack_a0;
			wire b_ack_a0;
			adder add_x_xrange_neg(
				.input_a(x), 
				.input_b(xrange_neg), 
				.input_a_stb(done_xrange),
				.input_b_stb(1'b1),
				.output_z_ack(add_z_a0),
				.clk(clk),
				.rst(done_xrange),
				.output_z(aabb0),
				.output_z_stb(done_a0),
				.input_a_ack(a_ack_a0),
				.input_b_ack(b_ack_a0)
			);

			//aabb[1] = pos[0] + xrange
			wire done_a1;
			wire add_z_a1;
			wire a_ack_a1;
			wire b_ack_a1;
			adder add_x_xrange(
				.input_a(x), 
				.input_b(xrange), 
				.input_a_stb(done_xrange),
				.input_b_stb(1'b1),
				.output_z_ack(add_z_a1),
				.clk(clk),
				.rst(done_xrange),
				.output_z(aabb1),
				.output_z_stb(done_a1),
				.input_a_ack(a_ack_a1),
				.input_b_ack(b_ack_a1)
			);
			
			//aabb[2] = pos[1] - yrange
			wire done_a2;
			wire add_z_a2;
			wire a_ack_a2;
			wire b_ack_a2;
			adder add_y_yrange_neg(
				.input_a(y), 
				.input_b(yrange_neg), 
				.input_a_stb(done_yrange),
				.input_b_stb(1'b1),
				.output_z_ack(add_z_a2),
				.clk(clk),
				.rst(done_yrange),
				.output_z(aabb2),
				.output_z_stb(done_a2),
				.input_a_ack(a_ack_a2),
				.input_b_ack(b_ack_a2)
			);
			
			//aabb[3] = pos[1] + yrange
			wire done_a3;
			wire add_z_a3;
			wire a_ack_a3;
			wire b_ack_a3;
			adder add_y_yrange(
				.input_a(y), 
				.input_b(yrange), 
				.input_a_stb(done_yrange),
				.input_b_stb(1'b1),
				.output_z_ack(add_z_a3),
				.clk(clk),
				.rst(done_yrange),
				.output_z(aabb3),
				.output_z_stb(done_a3),
				.input_a_ack(a_ack_a3),
				.input_b_ack(b_ack_a3)
			);
			
			//aabb[4] = pos[2] - zrange
			wire done_a4;
			wire add_z_a4;
			wire a_ack_a4;
			wire b_ack_a4;
			adder add_z_zrange_neg(
				.input_a(z), 
				.input_b(zrange_neg), 
				.input_a_stb(done_zrange),
				.input_b_stb(1'b1),
				.output_z_ack(add_z_a4),
				.clk(clk),
				.rst(done_zrange),
				.output_z(aabb4),
				.output_z_stb(done_a4),
				.input_a_ack(a_ack_a4),
				.input_b_ack(b_ack_a4)
			);
			
			//aabb[5] = pos[2] + zrange
			wire done_a5;
			wire add_z_a5;
			wire a_ack_a5;
			wire b_ack_a5;
			adder add_z_zrange5(
				.input_a(z), 
				.input_b(zrange), 
				.input_a_stb(done_zrange),
				.input_b_stb(1'b1),
				.output_z_ack(add_z_a5),
				.clk(clk),
				.rst(done_zrange),
				.output_z(aabb5),
				.output_z_stb(done_a5),
				.input_a_ack(a_ack_a5),
				.input_b_ack(b_ack_a5)
			);
			
			assign done = done_a0 && done_a1 && done_a2 && done_a3 && done_a4 && done_a5;
	
endmodule