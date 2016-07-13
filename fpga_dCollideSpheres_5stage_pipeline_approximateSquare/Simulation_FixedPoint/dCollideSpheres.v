module dCollideSpheres( x1, y1, z1, r1, x2, y2, z2, r2, cx, cy, cz, 
								normalx, normaly, normalz, depth, g1, g2, ret, clk, rst, done, test, test2, test3, test4, dataFetch);
	input[31:0] x1, y1, z1, r1, x2, y2, z2, r2;
	input clk, rst;
	input[31:0] g1, g2;
	output reg[31:0] cx, cy, cz, normalx, normaly, normalz, depth;
	output reg	ret,		//if ret = 0 then data given to dCollideSpheres do not collide
					done, dataFetch;		//done- done flag, ret- arbitrary return value used in C++ code
					
	output reg[31:0] test;
	output reg[31:0] test2;
	output reg[31:0] test3;
	output reg[31:0] test4;	
	reg[31:0] reg_test;
	reg[31:0] reg_test2;
	reg[31:0] reg_test3;
	reg[31:0] REG_test4;
	
	
	
	reg flag = 1'b0;
	
	reg flag_done_false_collision = 1'b0;
	
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
	
	reg CLK, CLK0, CLK1, CLK2, CLK3, CLK4, idle_clk;
	
	reg CLK0_DONE, CLK1_DONE, CLK2_DONE, CLK3_DONE, CLK4_DONE; 
	
	reg clk0,clk1;
	
	wire CLK_FINAL;
	
//intermediate registers for pipeline
//stage 0
//=================================
//inputs
reg [31:0] x1_reg;
reg [31:0] y1_reg;
reg [31:0] z1_reg;
reg [31:0] x2_reg;
reg [31:0] y2_reg;
reg [31:0] z2_reg;
reg [31:0] r1_reg;
reg [31:0] r2_reg;
//next stage inputs
reg [31:0] d_temp;
reg [31:0] radius_sum_temp;
reg [31:0] rsum_temp;
//=================================

//stage 1
//=================================
//shift registers
reg [31:0] x1_temp1;
reg [31:0] y1_temp1;
reg [31:0] z1_temp1;
reg [31:0] x2_temp1;
reg [31:0] y2_temp1;
reg [31:0] z2_temp1;
//next stage inputs
reg [31:0] d_recip_temp;
reg [31:0] diff_res_temp;
reg [31:0] dep_temp;
reg [31:0] drsum_temp;
reg [31:0] xsum_temp;
reg [31:0] ysum_temp;
reg [31:0] zsum_temp;
//=================================

//stage 2
//=================================
//shift registers
reg [31:0] x1_temp2;
reg [31:0] y1_temp2;
reg [31:0] z1_temp2;

//next stage inputs
reg [31:0] nx_temp;
reg [31:0] ny_temp;
reg [31:0] nz_temp;
reg [31:0] k_temp;

//=================================

//stage 3
//=================================
//shift registers
reg [31:0] x1_temp3;
reg [31:0] y1_temp3;
reg [31:0] z1_temp3;

//next stage inputs
reg [31:0] nxk_temp;
reg [31:0] nyk_temp;
reg [31:0] nzk_temp;

//=================================

//stage 4
//=================================
//shift registers
reg [31:0] x1_temp4;
reg [31:0] y1_temp4;
reg [31:0] z1_temp4;

//next stage inputs
reg [31:0] posx_temp;
reg [31:0] posy_temp;
reg [31:0] posz_temp;
//=================================

// =====================================ON CLK0======================================================	
	
	wire[31:0] d;
	wire CLK_d;
	dCalcPointsDistance3 dCalcPointsDist0(
		.CLK(clk),
		.a1(x1_reg),
		.a2(y1_reg),
		.a3(z1_reg),
		.b1(x2_reg),
		.b2(y2_reg),
		.b3(z2_reg),
		.RST(CLK0),
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
		.input_a(r1_reg), 
		.input_b(r2_reg), 
		.input_a_stb(1'b1),
		.input_b_stb(1'b1),
		.output_z_ack(output_z_ack_wire0),
		.clk(clk),
		.rst(CLK0),
		.output_z(radius_sum),
		.output_z_stb(CLK_radius_sum),
		.input_a_ack(input_a_ack_wire0),
		.input_b_ack(input_b_ack_wire0)
	);
		
	//r1_neg
	wire[31:0] r1_neg;
	assign r1_neg = {~r1_reg[31], r1_reg[30:0]};
	

	

			//(r2 + r1_neg)
		wire CLK_rsum;
		wire[31:0] rsum;
		wire rsum_ack;
		wire rsum_input_a_ack;
		wire rsum_input_b_ack;
		adder add_r2_r1neg(
			.input_a(r2_reg), 
			.input_b(r1_neg),
			.input_a_stb(1'b1),
			.input_b_stb(1'b1),
			.output_z_ack(rsum_ack),
			.clk(clk),
			.rst(CLK0),
			.output_z(rsum),
			.output_z_stb(CLK_rsum),
			.input_a_ack(rsum_input_a_ack),
			.input_b_ack(rsum_input_b_ack)
		);	
	
// =====================================ON CLK0======================================================	

// =====================================ON CLK1=====================================================			

	//x2_neg
	wire[31:0] x2_neg;
	assign x2_neg = {~x2_temp1[31], x2_temp1[30:0]};
	
	//y2_neg
	wire[31:0] y2_neg;
	assign y2_neg = {~y2_temp1[31], y2_temp1[30:0]};
	
	//z2_neg
	wire[31:0] z2_neg;
	assign z2_neg = {~z2_temp1[31], z2_temp1[30:0]};

	//x1 + x2_neg
	wire CLK_xsum;
	wire[31:0] xsum;
	wire xsum_ack;
	wire xsum_input_a_ack;
	wire xsum_input_b_ack;
	adder add_x1_x2neg(
		.input_a(x1_temp1), 
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
		.input_a(y1_temp1), 
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
		.input_a(z1_temp1), 
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
		.input_b(d_temp),
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
	assign radius_sum_neg = {~radius_sum_temp[31], radius_sum_temp[30:0]};	
	
	//check if d > radius_sum
	wire[31:0] diff_res;
	wire diff_z_ack_wire;
	wire CLK_diff_rdy;
	wire diff_a_ack_wire;
	wire diff_b_ack_wire;
	adder addDiff(
		.input_a(d_temp), 
		.input_b(radius_sum_neg), 
		.input_a_stb(1'b1),
		.input_b_stb(1'b1),
		.output_z_ack(diff_z_ack_wire),
		.clk(clk),
		.rst(CLK1),
		.output_z(diff_res),
		.output_z_stb(CLK_diff_rdy),
		.input_a_ack(diff_a_ack_wire),
		.input_b_ack(diff_b_ack_wire)
	);	
	
	
	//d_neg
	wire[31:0] d_neg;
	assign d_neg = {~d_temp[31], d_temp[30:0]};	
		
	//radius_sum + d_neg
	wire CLK_dep;
	wire[31:0] dep;
	wire dep_ack;
	wire dep_input_a_ack;
	wire dep_input_b_ack;
	adder add_radius_sum_dneg(
		.input_a(radius_sum_temp), 
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
		
		
		
	//radius_sum + d_neg = (r2 - r1 - d)
	wire CLK_drsum;
	wire[31:0] drsum;
	wire drsum_ack;
	wire drsum_input_a_ack;
	wire drsum_input_b_ack;
	adder add_rsum_dneg(
		.input_a(rsum_temp), 
		.input_b(d_neg),
		.input_a_stb(1'b1),
		.input_b_stb(1'b1),
		.output_z_ack(drsum_ack),
		.clk(clk),
		.rst(CLK1),
		.output_z(drsum),
		.output_z_stb(CLK_drsum),
		.input_a_ack(drsum_input_a_ack),
		.input_b_ack(drsum_input_b_ack)
	);	
		
// =====================================ON CLK1=====================================================	

// =====================================ON CLK2=====================================================	
		
			//xsum * d_recip
			wire CLK_nx;
			wire[31:0] nx;
			wire nx_ack;
			wire nx_input_a_ack;
			wire nx_input_b_ack;
			multiplier multiply_xsum_dRecip(
				.input_a(xsum_temp), 
				.input_b(d_recip_temp),
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
				.input_a(ysum_temp), 
				.input_b(d_recip_temp),
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
				.input_a(zsum_temp), 
				.input_b(d_recip_temp),
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
			
				//(drsum) / 2
				wire CLK_k;
				wire[31:0] k;
				wire k_ack;
				wire k_input_a_ack;
				wire k_input_b_ack;
				divider divide_drsum_2(
					.input_a(drsum_temp), 
					.input_b(32'b01000000000000000000000000000000),
					.input_a_stb(1'b1),
					.input_b_stb(1'b1),
					.output_z_ack(k_ack),
					.clk(clk),
					.rst(CLK2),
					.output_z(k),
					.output_z_stb(CLK_k),
					.input_a_ack(k_input_a_ack),
					.input_b_ack(k_input_b_ack)
				);			
			

// =====================================ON CLK2=====================================================						
	
// =====================================ON CLK3=====================================================
				
					//nx * k
					wire CLK_nxk;
					wire[31:0] nxk;
					wire nxk_ack;
					wire nxk_input_a_ack;
					wire nxk_input_b_ack;
					multiplier multiply_nx_k(
						.input_a(nx_temp), 
						.input_b(k_temp),
						.input_a_stb(1'b1),
						.input_b_stb(1'b1),
						.output_z_ack(nxk_ack),
						.clk(clk),
						.rst(CLK3),
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
						.input_a(ny_temp), 
						.input_b(k_temp),
						.input_a_stb(1'b1),
						.input_b_stb(1'b1),
						.output_z_ack(nyk_ack),
						.clk(clk),
						.rst(CLK3),
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
						.input_a(nz_temp), 
						.input_b(k_temp),
						.input_a_stb(1'b1),
						.input_b_stb(1'b1),
						.output_z_ack(nzk_ack),
						.clk(clk),
						.rst(CLK3),
						.output_z(nzk),
						.output_z_stb(CLK_nzk),
						.input_a_ack(nzk_input_a_ack),
						.input_b_ack(nzk_input_b_ack)
					);	
// =====================================ON CLK3=====================================================					

// =====================================ON CLK4=====================================================
			
						//x1 + nxk
						wire CLK_posx;
						wire[31:0] posx;
						wire posx_ack;
						wire posx_input_a_ack;
						wire posx_input_b_ack;
						adder add_x1_nxk(
							.input_a(x1_temp4), 			 //was z1
							.input_b(nxk_temp),              //was nzk
							.input_a_stb(1'b1),
							.input_b_stb(1'b1),
							.output_z_ack(posx_ack),
							.clk(clk),
							.rst(CLK4),
							.output_z(posx),
							.output_z_stb(CLK_posx),
							.input_a_ack(posx_input_a_ack),
							.input_b_ack(posx_input_b_ack)
						);
						
						//y1 + nyk
						wire CLK_posy;
						wire[31:0] posy;
						wire posy_ack;
						wire posy_input_a_ack;
						wire posy_input_b_ack;
						adder add_y1_nyk(
							.input_a(y1_temp4), 		 //was y1
							.input_b(nyk_temp),          //was nyk
							.input_a_stb(1'b1),
							.input_b_stb(1'b1),
							.output_z_ack(posy_ack),
							.clk(clk),
							.rst(CLK4),
							.output_z(posy),
							.output_z_stb(CLK_posy),
							.input_a_ack(posy_input_a_ack),
							.input_b_ack(posy_input_b_ack)
						);
						
						//z1 + nzk
						wire CLK_posz;
						wire[31:0] posz;
						wire posz_ack;
						wire posz_input_a_ack;
						wire posz_input_b_ack;
						adder add_z1_nzk(
							.input_a(z1_temp4), 	//was z1
							.input_b(nzk_temp),		//was nzk
							.input_a_stb(1'b1),
							.input_b_stb(1'b1),
							.output_z_ack(posz_ack),
							.clk(clk),
							.rst(CLK4),
							.output_z(posz),
							.output_z_stb(CLK_posz),
							.input_a_ack(posz_input_a_ack),
							.input_b_ack(posz_input_b_ack)
						);		
						
assign CLK_FINAL = ~clk0 && ~clk1 && CLK_posx && CLK_posy && CLK_posz;						
// =====================================ON CLK4=====================================================						
/*always @(posedge flag_done_false_collision)
begin
		done <= 1'b0;
		flag_done_false_collision <= 1'b0;
end*/					
	
	always @(posedge clk /*or posedge flag_done_false_collision or negedge flag*/ or posedge CLK_d or posedge CLK_diff_rdy or posedge CLK_k or posedge CLK_radius_sum or posedge CLK_dRecip or posedge CLK_xsum or posedge CLK_ysum or posedge CLK_zsum or posedge CLK_rsum or posedge CLK_dep or posedge CLK_nx or posedge CLK_ny or posedge CLK_nz or posedge CLK_drsum or posedge CLK_nxk or posedge CLK_nyk or posedge CLK_nzk or posedge CLK_posx or posedge CLK_posy or posedge CLK_posz or negedge rst)
	begin
	
		/*if(flag_done_false_collision)
		begin
			done <= 1'b0;
			flag_done_false_collision <= 1'b0;
		end*/
	
		if(rst == 1'b0)
		begin
			
			
			input_a_stb <= 1'b0;
			CLK0 <= 1'b0;
			CLK1 <= 1'b0;
			CLK2 <= 1'b0;
			CLK3 <= 1'b0;
			CLK4 <= 1'b0;
			
			CLK0_DONE <= 1'b1;
			CLK1_DONE <= 1'b1;
			CLK2_DONE <= 1'b1;
			CLK3_DONE <= 1'b1;
			CLK4_DONE <= 1'b1;
			
			clk0 <= 1'b0;
			clk1 <= 1'b0;
			flag <= 1'b0;
			cx <= 32'd0;
					
			cy <= 32'd0;
				
			cz <= 32'd0;
					
			normalx <= 32'd0;
			normaly <= 32'd0;
			normalz <= 32'd0;
			depth <= 32'd0;
			ret <= 1'b0;
			done <= 1'b0;	
			
		end
		else
		begin
			if(flag == 1'b0)
			begin
				x1_reg <= x1;
				y1_reg <= y1;
				z1_reg <= z1;
				x2_reg <= x2;
				y2_reg <= y2;
				z2_reg <= z2;
				r1_reg <= r1;
				r2_reg <= r2;
				CLK0 <= 1'b1;
				flag <= 1'b1;
				dataFetch <= 1'b0;
				CLK0_DONE <= 1'b0;
			end
			if(CLK_d)
			begin
				if(CLK_rsum)
				begin
					if(CLK_radius_sum)
					begin
						CLK0_DONE <= 1'b1;
						if(CLK1_DONE == 1'b1)
						begin
							x1_temp1 <= x1;
							y1_temp1 <= y1;
							z1_temp1 <= z1;
							x2_temp1 <= x2;
							y2_temp1 <= y2;
							z2_temp1 <= z2;
							d_temp <= d;
							radius_sum_temp <= radius_sum;
							rsum_temp <= rsum;
							input_a_stb <= 1'b1;
							CLK1_DONE <= 1'b0;
							CLK0 <= 1'b0;
							flag <= 1'b0;
							CLK1 <= 1'b1;
							flag_done_false_collision <= 1'b1;
							dataFetch <= 1'b1;
						end
					end
				end
			end
			
			if(CLK_diff_rdy)
			begin
				if(CLK_dRecip)
				begin
					if(CLK_dep)
					begin
						if(CLK_drsum)
						begin
							if(CLK_xsum)
							begin
								if(CLK_ysum)
								begin
									if(CLK_zsum)
									begin
									CLK1_DONE <= 1'b1;
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
											clk0 <= 1'b1;
											CLK1 <= 1'b0;
										end
										else
										begin
											clk0 <= 1'b0;
											if(d == 32'b00000000000000000000000000000000 || d[31] == 1'b1)
											begin
												clk1 <= 1'b1;
												idle_clk <= 1'b1;
											end
											else
											begin
												if(CLK2_DONE == 1'b1)
												begin
													x1_temp2 <= x1_temp1;
													y1_temp2 <= y1_temp1;
													z1_temp2 <= z1_temp1;
												
													clk1 <= 1'b0;
													CLK2 <= 1'b1;
													CLK1 <= 1'b0;
													d_recip_temp <= d_recip;
													diff_res_temp <= diff_res;
													dep_temp <= dep;
													drsum_temp <= drsum;
													xsum_temp <= xsum;
													ysum_temp <= ysum;
													zsum_temp <= zsum;
													CLK2_DONE <= 1'b0;
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
			
			if(flag_done_false_collision == 1'b1)
			begin
				done <= 1'b0;
				flag_done_false_collision <= 1'b0;
			end
			
			if(CLK_nx)
			begin
				if(CLK_ny)
				begin
					if(CLK_nz)
					begin
						if(CLK_k)
						begin
						CLK2_DONE <= 1'b1;
							if(CLK3_DONE == 1'b1)
							begin
								x1_temp3 <= x1_temp2;
								y1_temp3 <= y1_temp2;
								z1_temp3 <= z1_temp2;
								nx_temp <= nx;
								ny_temp <= ny;
								nz_temp <= nz;
								k_temp <= k;
								CLK2 <= 1'b0;
								CLK3 <= 1'b1;
								CLK3_DONE <= 1'b0;
							end
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
						CLK3_DONE <= 1'b1;
						if(CLK4_DONE == 1'b1)
						begin
							x1_temp4 <= x1_temp3;
							y1_temp4 <= y1_temp3;
							z1_temp4 <= z1_temp3;
							nxk_temp <= nxk;
						    nyk_temp <= nyk;
						    nzk_temp <= nzk;
							CLK3 <= 1'b0;
							CLK4 <= 1'b1;
							CLK4_DONE <= 1'b0;
							done <= 1'b0;
						end
					end	
				end
			end			
			
			if(CLK_posx)
			begin
				if(CLK_posy)
				begin
					if(CLK_posz)
					begin
						posx_temp <= posx;
						posy_temp <= posy;
						posz_temp <= posz;
						
						cx <= (clk0) ? 32'd0:
								(clk1) ? x1:posx;
						cy <= (clk0) ? 32'd0:
								(clk1) ? y1:posy;
						cz <= (clk0) ? 32'd0:
								(clk1) ? z1:posz;
						normalx <= (clk0) ? 32'd0:
								(clk1) ? 32'd1:nx;
						normaly <= (clk0) ? 32'd0:
								(clk1) ? 32'd0:ny;
						normalz <= (clk0) ? 32'd0:
								(clk1) ? 32'd0:nz;
						depth <= (clk0) ? 32'd0:
								(clk1) ? radius_sum:dep;
						ret <= (clk0) ? 1'b0:1'b1;
						done <= 1'b1;	
						
						CLK4 <= 1'b0;
						CLK4_DONE <= 1'b1;
					end	
				end
			end		
		end	
	end

	

endmodule
