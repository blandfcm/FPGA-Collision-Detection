module dCollideSpheres( x1, y1, z1, r1, x2, y2, z2, r2, cx, cy, cz, 
								normalx, normaly, normalz, depth, g1, g2, ret, clk, rst, done, test, test2, test3, test4);
	input[31:0] x1, y1, z1, r1, x2, y2, z2, r2;
	input clk, rst;
	input[31:0] g1, g2;
	output reg[31:0] cx, cy, cz, normalx, normaly, normalz, depth;
	output reg	ret,		//if ret = 0 then data given to dCollideSpheres do not collide
					done;		//done- done flag, ret- arbitrary return value used in C++ code
					
	output reg[31:0] test;
	output reg[31:0] test2;
	output reg[31:0] test3;
	output reg[31:0] test4;	
	reg[31:0] reg_test;
	reg[31:0] reg_test2;
	reg[31:0] reg_test3;
	reg[31:0] REG_test4;
	
	
	
	reg flag = 1'b0;
	
	reg input_a_stb = 1'b0;
/**
	dVector3 p1:		x1, y1, z1
	dReal r1:			r1
	dVector3 p2:		x2, y2, z2
	dReal r2:			r2
	dContactGeom *c:	
		dVector3 pos		cx, cy, cz
		dVector3 normal	normalX, normalY, normalZ
		dReal depth			depth
		dGeomID g1, g2		g1, g2
*/	
	
	
								

	reg ret_val, done_flag;
	
	reg pt_distFlag = 1'b0;
	
	reg CLK, CLK0, CLK1, CLK2, CLK3, CLK4, CLK5, CLK6, CLK_Diff, idle_clk;

//jtag_debug jtag8(.in_debug(debug_reg1));
//jtag_debug jtag9(.in_debug(debug_reg2));
//jtag_debug jtag8(.in_debug(debug_reg1));
//jtag_debug jtag9(.in_debug(debug_reg2));
//jtag_debug jtag10(.in_debug(debug_reg3));
//jtag_debug jtag11(.in_debug(debug_reg4));



	
	wire[31:0] d;
	wire CLK_d;
	dCalcPointsDistance3 dCalcPointsDist0(
		.CLK(clk),
		.a1(x1),
		.a2(y1),
		.a3(z1),
		.b1(x2),
		.b2(y2),
		.b3(z2),
		.RST(rst),
		.res(d),
		.out_rdy(CLK_d)
	);
	
	//(r1 + r2)
	wire[31:0] radius_sum;
	wire output_z_ack_wire0;
	wire CLK_radius_sum;
	wire input_a_ack_wire0;
	wire input_b_ack_wire0;
	adder add0(
		.input_a(r1), 
		.input_b(r2), 
		.input_a_stb(1'b1),
		.input_b_stb(1'b1),
		.output_z_ack(output_z_ack_wire0),
		.clk(clk),
		.rst(rst),
		.output_z(radius_sum),
		.output_z_stb(CLK_radius_sum),
		.input_a_ack(input_a_ack_wire0),
		.input_b_ack(input_b_ack_wire0)
	);
	
	//d1 = dRecip(d)
	wire CLK_dRecip;
	wire[31:0] d_recip;
	wire[31:0] input_a_dRecip;
	assign input_a_dRecip = 32'b00111111100000000000000000000000;
	wire dRecip_ack;
	wire dRecip_input_a_ack;
	wire dRecip_input_b_ack;
	divider2 divide_1_d(
		.input_a(32'b00111111100000000000000000000000), 
		.input_b(d),
		//.input_b(32'b00111111101001110111110011101110),
		.input_a_stb(input_a_stb),
		.input_b_stb(1'b1),
		.output_z_ack(dRecip_ack),
		.clk(clk),
		.rst(CLK1),
		.output_z(d_recip),
		.output_z_stb(CLK_dRecip),
		.input_a_ack(dRecip_input_a_ack),
		.input_b_ack(dRecip_input_b_ack)
	);
	
	//x2_neg
	wire[31:0] radius_sum_neg;
	assign radius_sum_neg = {~radius_sum[31], radius_sum[30:0]};	
	
	wire[31:0] diff_res;
	wire diff_z_ack_wire;
	wire CLK_diff_rdy;
	wire diff_a_ack_wire;
	wire diff_b_ack_wire;
	adder addDiff(
		.input_a(d), 
		.input_b(radius_sum_neg), 
		.input_a_stb(1'b1),
		.input_b_stb(1'b1),
		.output_z_ack(diff_z_ack_wire),
		.clk(clk),
		.rst(CLK_Diff),
		.output_z(diff_res),
		.output_z_stb(CLK_diff_rdy),
		.input_a_ack(diff_a_ack_wire),
		.input_b_ack(diff_b_ack_wire)
	);	
	
	
	//x2_neg
	wire[31:0] x2_neg;
	assign x2_neg = {~x2[31], x2[30:0]};
	
	//y2_neg
	wire[31:0] y2_neg;
	assign y2_neg = {~y2[31], y2[30:0]};
	
	//z2_neg
	wire[31:0] z2_neg;
	assign z2_neg = {~z2[31], z2[30:0]};
	
	//r1_neg
	wire[31:0] r1_neg;
	assign r1_neg = {~r1[31], r1[30:0]};
	
	//d_neg
	wire[31:0] d_neg;
	assign d_neg = {~d[31], d[30:0]};	
	
		//x1 + x2_neg
		wire CLK_xsum;
		wire[31:0] xsum;
		wire xsum_ack;
		wire xsum_input_a_ack;
		wire xsum_input_b_ack;
		adder add_x1_x2neg(
			.input_a(x1), 
			.input_b(x2_neg),
			.input_a_stb(1'b1),
			.input_b_stb(1'b1),
			.output_z_ack(xsum_ack),
			.clk(clk),
			.rst(CLK1),
			.output_z(xsum),
			.output_z_stb(CLK_xsum),
			.input_a_ack(xsum_input_a_ack),
			.input_b_ack(xsum_input_b_ack)
		);
		
		//y1 + y2_neg
		wire CLK_ysum;
		wire[31:0] ysum;
		wire ysum_ack;
		wire ysum_input_a_ack;
		wire ysum_input_b_ack;
		adder add_y1_y2neg(
			.input_a(y1), 
			.input_b(y2_neg),
			.input_a_stb(1'b1),
			.input_b_stb(1'b1),
			.output_z_ack(ysum_ack),
			.clk(clk),
			.rst(CLK1),
			.output_z(ysum),
			.output_z_stb(CLK_ysum),
			.input_a_ack(ysum_input_a_ack),
			.input_b_ack(ysum_input_b_ack)
		);
		
		//z1 + z2_neg
		wire CLK_zsum;
		wire[31:0] zsum;
		wire zsum_ack;
		wire zsum_input_a_ack;
		wire zsum_input_b_ack;
		adder add_z1_z2neg(
			.input_a(z1), 
			.input_b(z2_neg),
			.input_a_stb(1'b1),
			.input_b_stb(1'b1),
			.output_z_ack(zsum_ack),
			.clk(clk),
			.rst(CLK1),
			.output_z(zsum),
			.output_z_stb(CLK_zsum),
			.input_a_ack(zsum_input_a_ack),
			.input_b_ack(zsum_input_b_ack)
		);	
			//(r2 + r1_neg)
		wire CLK_rsum;
		wire[31:0] rsum;
		wire rsum_ack;
		wire rsum_input_a_ack;
		wire rsum_input_b_ack;
		adder add_r2_r1neg(
			.input_a(r2), 
			.input_b(r1_neg),
			.input_a_stb(1'b1),
			.input_b_stb(1'b1),
			.output_z_ack(rsum_ack),
			.clk(clk),
			.rst(CLK1),
			.output_z(rsum),
			.output_z_stb(CLK_rsum),
			.input_a_ack(rsum_input_a_ack),
			.input_b_ack(rsum_input_b_ack)
		);	
		
		//radius_sum + d_neg
		wire CLK_dep;
		wire[31:0] dep;
		wire dep_ack;
		wire dep_input_a_ack;
		wire dep_input_b_ack;
		adder add_radius_sum_dneg(
			.input_a(radius_sum), 
			.input_b(d_neg),
			.input_a_stb(1'b1),
			.input_b_stb(1'b1),
			.output_z_ack(dep_ack),
			.clk(clk),
			.rst(CLK1),
			.output_z(dep),
			.output_z_stb(CLK_dep),
			.input_a_ack(dep_input_a_ack),
			.input_b_ack(dep_input_b_ack)
		);
		
					//xsum * d_recip
			wire CLK_nx;
			wire[31:0] nx;
			wire nx_ack;
			wire nx_input_a_ack;
			wire nx_input_b_ack;
			multiplier multiply_xsum_dRecip(
				.input_a(xsum), 
				.input_b(d_recip),
				.input_a_stb(1'b1),
				.input_b_stb(1'b1),
				.output_z_ack(nx_ack),
				.clk(clk),
				.rst(CLK2),
				.output_z(nx),
				.output_z_stb(CLK_nx),
				.input_a_ack(nx_input_a_ack),
				.input_b_ack(nx_input_b_ack)
			);
			
			//ysum * d_recip
			wire CLK_ny;
			wire[31:0] ny;
			wire ny_ack;
			wire ny_input_a_ack;
			wire ny_input_b_ack;
			multiplier multiply_ysum_dRecip(
				.input_a(ysum), 
				.input_b(d_recip),
				.input_a_stb(1'b1),
				.input_b_stb(1'b1),
				.output_z_ack(ny_ack),
				.clk(clk),
				.rst(CLK2),
				.output_z(ny),
				.output_z_stb(CLK_ny),
				.input_a_ack(ny_input_a_ack),
				.input_b_ack(ny_input_b_ack)
			);
			
			//zsum * d_recip
			wire CLK_nz;
			wire[31:0] nz;
			wire nz_ack;
			wire nz_input_a_ack;
			wire nz_input_b_ack;
			multiplier multiply_zsum_dRecip(
				.input_a(zsum), 
				.input_b(d_recip),
				.input_a_stb(1'b1),
				.input_b_stb(1'b1),
				.output_z_ack(nz_ack),
				.clk(clk),
				.rst(CLK2),
				.output_z(nz),
				.output_z_stb(CLK_nz),
				.input_a_ack(nz_input_a_ack),
				.input_b_ack(nz_input_b_ack)
			);
			
			//radius_sum + d_neg = (r2 - r1 - d)
			wire CLK_drsum;
			wire[31:0] drsum;
			wire drsum_ack;
			wire drsum_input_a_ack;
			wire drsum_input_b_ack;
			adder add_rsum_dneg(
				.input_a(rsum), 
				.input_b(d_neg),
				.input_a_stb(1'b1),
				.input_b_stb(1'b1),
				.output_z_ack(drsum_ack),
				.clk(clk),
				.rst(CLK2),
				.output_z(drsum),
				.output_z_stb(CLK_drsum),
				.input_a_ack(drsum_input_a_ack),
				.input_b_ack(drsum_input_b_ack)
			);
						
	
				//(drsum) / 2
				wire CLK_k;
				wire[31:0] k;
				wire k_ack;
				wire k_input_a_ack;
				wire k_input_b_ack;
				divider divide_drsum_2(
					.input_a(drsum), 
					.input_b(32'b01000000000000000000000000000000),
					.input_a_stb(1'b1),
					.input_b_stb(1'b1),
					.output_z_ack(k_ack),
					.clk(clk),
					.rst(CLK3),
					.output_z(k),
					.output_z_stb(CLK_k),
					.input_a_ack(k_input_a_ack),
					.input_b_ack(k_input_b_ack)
				);
				
					//nx * k
					wire CLK_nxk;
					wire[31:0] nxk;
					wire nxk_ack;
					wire nxk_input_a_ack;
					wire nxk_input_b_ack;
					multiplier multiply_nx_k(
						.input_a(nx), 
						.input_b(k),
						.input_a_stb(1'b1),
						.input_b_stb(1'b1),
						.output_z_ack(nxk_ack),
						.clk(clk),
						.rst(CLK4),
						.output_z(nxk),
						.output_z_stb(CLK_nxk),
						.input_a_ack(nxk_input_a_ack),
						.input_b_ack(nxk_input_b_ack)
					);
					
					//ny * k
					wire CLK_nyk;
					wire[31:0] nyk;
					wire nyk_ack;
					wire nyk_input_a_ack;
					wire nyk_input_b_ack;
					multiplier multiply_ny_k(
						.input_a(ny), 
						.input_b(k),
						.input_a_stb(1'b1),
						.input_b_stb(1'b1),
						.output_z_ack(nyk_ack),
						.clk(clk),
						.rst(CLK4),
						.output_z(nyk),
						.output_z_stb(CLK_nyk),
						.input_a_ack(nyk_input_a_ack),
						.input_b_ack(nyk_input_b_ack)
					);
					
					//nz * k
					wire CLK_nzk;
					wire[31:0] nzk;
					wire nzk_ack;
					wire nzk_input_a_ack;
					wire nzk_input_b_ack;
					multiplier multiply_nz_k(
						.input_a(nz), 
						.input_b(k),
						.input_a_stb(1'b1),
						.input_b_stb(1'b1),
						.output_z_ack(nzk_ack),
						.clk(clk),
						.rst(CLK4),
						.output_z(nzk),
						.output_z_stb(CLK_nzk),
						.input_a_ack(nzk_input_a_ack),
						.input_b_ack(nzk_input_b_ack)
					);				
					
	
	always @(posedge CLK_d or posedge CLK_diff_rdy or posedge CLK_radius_sum or posedge CLK_dRecip or posedge CLK_xsum or posedge CLK_ysum or posedge CLK_zsum or posedge CLK_rsum or posedge CLK_dep or posedge CLK_nx or posedge CLK_ny or posedge CLK_nz or posedge CLK_drsum or posedge CLK_nxk or posedge CLK_nyk or posedge CLK_nzk or negedge rst)
	begin
		if(rst == 1'b0)
		begin
			input_a_stb <= 1'b0;
			CLK1 <= 1'b0;
			CLK2 <= 1'b0;
			CLK3 <= 1'b0;
			CLK4 <= 1'b0;
			CLK_Diff <= 1'b0;
			//test  <= 32'd0;
			//test2 <= 32'd0;
			//test3 <= 32'd0;
			//test4 <= 32'd0;
		end
		else
		begin
			if(CLK_d)
			begin
				input_a_stb <= 1'b1;
				CLK_Diff <= 1'b1;
			end
			
			if(CLK_diff_rdy)
			begin
				if(diff_res[31] == 1'b0)
				begin
					cx <= 32'd0;
					cy <= 32'd0;
					cz <= 32'd0;
					normalx <= 32'd0;
					normaly <= 32'd0;
					normalz <= 32'd0;
					depth <= 32'd0;
					ret <= 1'b0;
					done <= 1'b1;
				end
				else
				begin
					if(d == 32'b00000000000000000000000000000000 || d[31] == 1'b1)
					begin
						idle_clk <= 1'b1;
					end
					else
					begin
						CLK1 <= 1'b1;
					end
				end
				
			end
			
			if(CLK_dRecip)
			begin
				CLK2 <= 1'b1;
				test <= d_recip;
			end
			
			if(CLK_nx)
			begin
				if(CLK_ny)
				begin
					if(CLK_nz)
					begin
						if(CLK_drsum)
						begin
							CLK3 <= 1'b1;
						end
						
					end	
				end
			end
			if(CLK_nxk)
			begin
				if(CLK_nyk)
				begin
					if(CLK_nzk)
					begin
						CLK4 <= 1'b1;
					end	
				end
			end
		end		
	end

	

endmodule
