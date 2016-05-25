module dCollideSpheres( x1, y1, z1, r1, x2, y2, z2, r2, cx, cy, cz, 
								normalx, normaly, normalz, depth, g1, g2, ret, clk, rst, done, test);
	input[31:0] x1, y1, z1, r1, x2, y2, z2, r2;
	input clk, rst;
	input[31:0] g1, g2;
	output reg[31:0] cx, cy, cz, normalx, normaly, normalz, depth;
	output reg	ret,		//if ret = 0 then data given to dCollideSpheres do not collide
					done;		//done- done flag, ret- arbitrary return value used in C++ code
					
	output reg[31:0] test;
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

								
	
	jtag_debug debug (.in_debug(cx));
	jtag_debug debug1(.in_debug(cy));
	jtag_debug debug2(.in_debug(cz));
	jtag_debug debug3(.in_debug(normalx));
	jtag_debug debug4(.in_debug(normaly));
	jtag_debug debug5(.in_debug(CLK_radius_sum));
	jtag_debug debug6(.in_debug(CLK_d));
	jtag_debug debug7(.in_debug(radius_sum));
	jtag_debug debug8(.in_debug(d));	
	//jtag_debug debug7(.in_debug(cz));
	//jtag_debug debug8(.in_debug(depth));	
								

	reg ret_val, done_flag;
	
	reg pt_distFlag = 1'b0;
	
	//d = dCalcPointsDistance3(p1, p2)
	
	reg CLK, CLK0, CLK1, CLK2, CLK3, CLK4, CLK5, CLK6;
	
	/*
	wire CLK_d;
	assign CLK_d = 1'b1;
	wire[31:0] d;
	assign d = g1;
	*/
	
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
		.RST(CLK),
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
		.rst(CLK),
		.output_z(radius_sum),
		.output_z_stb(CLK_radius_sum),
		.input_a_ack(input_a_ack_wire0),
		.input_b_ack(input_b_ack_wire0)
	);

	
	
//if(d > (r1 + r2))
	//assign CLK0 = (d > radius_sum) && CLK_radius_sum;
	
//if(d <= 0)
	//assign CLK1 = ((d <= 1'd0) && (d <= radius_sum) );
	//jumps to always@(CLK_FINAL)
	//no more calculations
	
//else
	//assign CLK2 = ~((d > 1'd0) && (d <= radius_sum) );
	
//calculations reliant solely on CLK2
	
	//d1 = dRecip(d)
	wire CLK_dRecip;
	wire[31:0] d_recip;
	wire[31:0] input_a_dRecip;
	assign input_a_dRecip = 32'b00111111100000000000000000000000;
	wire dRecip_ack;
	wire dRecip_input_a_ack;
	wire dRecip_input_b_ack;
	divider divide_1_d(
		.input_a(input_a_dRecip), 
		.input_b(d),
		.input_a_stb(1'b1),
		.input_b_stb(1'b1),
		.output_z_ack(dRecip_ack),
		.clk(clk),
		.rst(CLK2),
		.output_z(d_recip),
		.output_z_stb(CLK_dRecip),
		.input_a_ack(dRecip_input_a_ack),
		.input_b_ack(dRecip_input_b_ack)
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
			.rst(CLK2),
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
			.rst(CLK2),
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
			.rst(CLK2),
			.output_z(zsum),
			.output_z_stb(CLK_zsum),
			.input_a_ack(zsum_input_a_ack),
			.input_b_ack(zsum_input_b_ack)
		);
		//assign CLK_NEG = ~(CLK_xsum && CLK_ysum && CLK_zsum);
		
		/*
		assign CLK_dRecipX = ~(CLK_xsum && CLK_dRecip);
		assign CLK_dRecipY = ~(CLK_ysum && CLK_dRecip);
		assign CLK_dRecipZ = ~(CLK_zsum && CLK_dRecip);
		*/
		
		
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
				.rst(CLK3),
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
				.rst(CLK3),
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
				.rst(CLK3),
				.output_z(nz),
				.output_z_stb(CLK_nz),
				.input_a_ack(nz_input_a_ack),
				.input_b_ack(nz_input_b_ack)
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
			.rst(CLK2),
			.output_z(rsum),
			.output_z_stb(CLK_rsum),
			.input_a_ack(rsum_input_a_ack),
			.input_b_ack(rsum_input_b_ack)
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
				.rst(CLK3),
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
					.rst(CLK4),
					.output_z(k),
					.output_z_stb(CLK_k),
					.input_a_ack(k_input_a_ack),
					.input_b_ack(k_input_b_ack)
				);
				
				assign CLK_pos = ~(CLK_nx && CLK_ny && CLK_nz && CLK_k);
				
					
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
						.rst(CLK5),
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
						.rst(CLK5),
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
						.rst(CLK5),
						.output_z(nzk),
						.output_z_stb(CLK_nzk),
						.input_a_ack(nzk_input_a_ack),
						.input_b_ack(nzk_input_b_ack)
					);
					
						//x1 + nxk
						wire CLK_posx;
						wire[31:0] posx;
						wire posx_ack;
						wire posx_input_a_ack;
						wire posx_input_b_ack;
						adder add_x1_nxk(
							.input_a(x1), 
							.input_b(nxk),
							.input_a_stb(1'b1),
							.input_b_stb(1'b1),
							.output_z_ack(posx_ack),
							.clk(clk),
							.rst(CLK6),
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
							.input_a(y1), 
							.input_b(nyk),
							.input_a_stb(1'b1),
							.input_b_stb(1'b1),
							.output_z_ack(posy_ack),
							.clk(clk),
							.rst(CLK6),
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
							.input_a(z1), 
							.input_b(nzk),
							.input_a_stb(1'b1),
							.input_b_stb(1'b1),
							.output_z_ack(posz_ack),
							.clk(clk),
							.rst(CLK6),
							.output_z(posz),
							.output_z_stb(CLK_posz),
							.input_a_ack(posz_input_a_ack),
							.input_b_ack(posz_input_b_ack)
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
						.rst(CLK2),
						.output_z(dep),
						.output_z_stb(CLK_dep),
						.input_a_ack(dep_input_a_ack),
						.input_b_ack(dep_input_b_ack)
					);

						assign CLK2_DONE = CLK_nx && CLK_ny && CLK_nz && CLK_posx && CLK_posy && CLK_posz && CLK_dep;
	
	reg CLK_FINAL, clk0, clk1;
	
	reg[3:0] S, NS;
	
	parameter	START = 4'd0,
					CALC0 = 4'd1,
					IF1 = 4'd2,
					IF2 = 4'd3,
					FALSE_COLLIDE = 4'd4,
					PENETRATION = 4'd5,
					NONPENETRATION = 4'd6,
					CALC2 = 4'd7,
					CALC3 = 4'd8,
					CALC4 = 4'd9,
					CALC5 = 4'd10,
					CALC6 = 4'd11,
					FALSE_COLLIDE_DONE = 4'd12,
					PENETRATION_DONE = 4'd13,
					NONPENETRATION_DONE = 4'd14;	
					
	
	always@(posedge clk or negedge rst)
	begin
		S <= NS;
	end
	
	always@(posedge clk)
	begin
		case(S)
			START:
			begin
				CLK <= 1'b0;
				CLK0 <= 1'b1;
				CLK1 <= 1'b1;
				CLK2 <= 1'b1;
				CLK3 <= 1'b1;
				CLK4 <= 1'b1;
				CLK5 <= 1'b1;
				CLK6 <= 1'b1;
				
				NS = CALC0;
			end
			CALC0:
			begin
				CLK = 1'b0;
				CLK0 = 1'b1;
				CLK1 = 1'b1;
				CLK2 = 1'b1;
				CLK3 = 1'b1;
				CLK4 = 1'b1;
				CLK5 = 1'b1;
				CLK6 = 1'b1;
				
				
				if(CLK_d == 1'b1 && CLK_radius_sum == 1'b1)
				begin
					NS = IF1;
				end
				else
					NS = CALC0;
			end
			IF1:
			begin
				CLK = 1'b1;
				CLK0 = 1'b1;
				CLK1 = 1'b1;
				CLK2 = 1'b1;
				CLK3 = 1'b1;
				CLK4 = 1'b1;
				CLK5 = 1'b1;
				CLK6 = 1'b1;
				
				
				if(d > radius_sum)
				begin
					NS = FALSE_COLLIDE; 
				end
				else if(d <= 1'b0)
				begin
					NS = PENETRATION;
				end
				else
				begin
					NS = NONPENETRATION;
				end
			end
			FALSE_COLLIDE:
			begin
				CLK = 1'b1;
				CLK0 = 1'b0;
				CLK1 = 1'b1;
				CLK2 = 1'b1;
				CLK3 = 1'b1;
				CLK4 = 1'b1;
				CLK5 = 1'b1;
				CLK6 = 1'b1;
				
				clk0 = 1'b1;
				clk1 = 1'b0;
				
				NS = FALSE_COLLIDE_DONE;
			end
			PENETRATION:
			begin
				CLK = 1'b1;
				CLK0 = 1'b1;
				CLK1 = 1'b0;
				CLK2 = 1'b1;
				CLK3 = 1'b1;
				CLK4 = 1'b1;
				CLK5 = 1'b1;
				CLK6 = 1'b1;
				
				clk0 = 1'b0;
				clk1 = 1'b1;
				
				NS = PENETRATION_DONE;
			end
			NONPENETRATION:
			begin
				CLK = 1'b1;
				CLK0 = 1'b1;
				CLK1 = 1'b1;
				CLK2 = 1'b0;
				CLK3 = 1'b1;
				CLK4 = 1'b1;
				CLK5 = 1'b1;
				CLK6 = 1'b1;
				
			
				
				NS = CALC2;
			end
			CALC2:
			begin
				CLK = 1'b1;
				CLK0 = 1'b1;
				CLK1 = 1'b1;
				CLK2 = 1'b0;
				CLK3 = 1'b1;
				CLK4 = 1'b1;
				CLK5 = 1'b1;
				CLK6 = 1'b1;
				
				
				if(CLK_dRecip && CLK_xsum && CLK_ysum && CLK_zsum && CLK_rsum && CLK_dep)
				begin
					NS = CALC3;
				end
				else
					NS = CALC2;
			end
			CALC3:
			begin
				CLK = 1'b1;
				CLK0 = 1'b1;
				CLK1 = 1'b1;
				CLK2 = 1'b1;
				CLK3 = 1'b0;
				CLK4 = 1'b1;
				CLK5 = 1'b1;
				CLK6 = 1'b1;
				
				if(CLK_nx && CLK_ny && CLK_nz && CLK_drsum)
				begin
					NS = CALC4;
				end
				else
					NS = CALC3;
			end
			CALC4:
			begin
				CLK = 1'b1;
				CLK0 = 1'b1;
				CLK1 = 1'b1;
				CLK2 = 1'b1;
				CLK3 = 1'b1;
				CLK4 = 1'b0;
				CLK5 = 1'b1;
				CLK6 = 1'b1;
				
				if(CLK_k)
					NS = CALC5;
				else
					NS = CALC4;
			end
			CALC5:
			begin
				CLK = 1'b1;
				CLK0 = 1'b1;
				CLK1 = 1'b1;
				CLK2 = 1'b1;
				CLK3 = 1'b1;
				CLK4 = 1'b1;
				CLK5 = 1'b0;
				CLK6 = 1'b1;
				
				if(CLK_nxk && CLK_nyk && CLK_nzk)
					NS = CALC6;
				else
					NS = CALC5;
			end
			CALC6:
			begin
				CLK = 1'b1;
				CLK0 = 1'b1;
				CLK1 = 1'b1;
				CLK2 = 1'b1;
				CLK3 = 1'b1;
				CLK4 = 1'b1;
				CLK5 = 1'b1;
				CLK6 = 1'b0;
		
			if(CLK_posx && CLK_posy && CLK_posz)
			begin
				clk0 = 1'b0;
				clk1 = 1'b0;
				NS = NONPENETRATION_DONE;
			end
			else
					NS = CALC6;
			end
			FALSE_COLLIDE_DONE:
			begin
				
				CLK_FINAL = 1'b1;

			end
			PENETRATION_DONE:
			begin
				
				CLK_FINAL = 1'b1;

			end
			NONPENETRATION_DONE:
			begin
				
				CLK_FINAL = 1'b1;
			end
			default:
			begin
				NS = START;
				CLK_FINAL = 1'b0;
			end
		endcase
	end
	
	always@(posedge CLK_FINAL)
	begin
			cx = x1;
			cy = y1;
			cz = z1;
			normalx = 32'b00111111100000000000000000000000;
			normaly = 32'b00000000000000000000000000000000;
			normalz = 32'b00000000000000000000000000000000;
			depth = radius_sum;
			ret = 1'b1;
			done = 1'b1;
		/*
		if(clk0)
		begin
			cx = 32'b00000000000000000000000000000000;
			cy = 32'b00000000000000000000000000000000;
			cz = 32'b00000000000000000000000000000000;
			normalx = 32'b00000000000000000000000000000000;
			normaly = 32'b00000000000000000000000000000000;
			normalz = 32'b00000000000000000000000000000000;
			depth = 32'b00000000000000000000000000000000;
			ret = 1'b0;
			done = 1'b1;
		end
		else if(clk1)
		begin
			cx = x1;
			cy = y1;
			cz = z1;
			normalx = 32'b00111111100000000000000000000000;
			normaly = 32'b00000000000000000000000000000000;
			normalz = 32'b00000000000000000000000000000000;
			depth = radius_sum;
			ret = 1'b1;
			done = 1'b1;
		end
		else
		begin
			cx = posx;
			cy = posy;
			cz = posz;
			normalx = nx;
			normaly = ny;
			normalz = nz;
			depth = dep;
			ret = 1'b1;
			done = 1'b1;
		end*/
		/*
		cx = (clk0) ? 32'd0:
				(clk1) ? x1:posx;
		cy = (clk0) ? 32'd0:
				(clk1) ? y1:posy;
		cz = (clk0) ? 32'd0:
				(clk1) ? z1:posz;
		normalx = (clk0) ? 32'd0:
				(clk1) ? 32'd1:nx;
		normaly = (clk0) ? 32'd0:
				(clk1) ? 32'd0:ny;
		normalz = (clk0) ? 32'd0:
				(clk1) ? 32'd0:nz;
		depth = (clk0) ? 32'd0:
				(clk1) ? radius_sum:dep;
		ret = (clk0) ? 1'b0:1'b1;
		done = 1'b1;
			*/
	end
	

endmodule
