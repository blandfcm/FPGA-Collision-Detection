module sqrt
(
	input CLK,
	input RST,
	input [31:0] n,
	//output reg [31:0] root,
	output reg [31:0] res,
	output reg pos
);
	
reg [31:0] x;
reg [31:0] y = 32'b00111111100000000000000000000000;
reg [31:0] e = 32'b00110101100001100011011110111101;
reg [31:0] two = 32'b01000000000000000000000000000000;
wire CLK2;

//add1
wire [31:0] y_neg;
wire [31:0] e_neg;

//add_greater_1
wire [31:0] output_z_wire;
wire output_z_ack_wire;
wire output_z_stb_wire;
wire input_a_ack_wire;
wire input_b_ack_wire;

//add_x_minus_y
wire [31:0] output_z_wire1;
wire output_z_ack_wire1;
wire output_z_stb_wire1;
wire input_a_ack_wire1;
wire input_b_ack_wire1;
reg  x_minus_y_rst = 1'b1;

//add_greater_e
wire [31:0] output_z_wire2;
wire output_z_ack_wire2;
wire output_z_stb_wire2;
wire input_a_ack_wire2;
wire input_b_ack_wire2;
reg  greater_e_rst1 = 1'b1;

//add_x_plus_y1
wire [31:0] output_z_wire3;
wire output_z_ack_wire3;
wire output_z_stb_wire3;
wire input_a_ack_wire3;
wire input_b_ack_wire3;
reg  x_plus_y_rst1 = 1'b1;

//divide_by_two1
wire [31:0] output_z_wire4;
wire output_z_ack_wire4;
wire output_z_stb_wire4;
wire input_a_ack_wire4;
wire input_b_ack_wire4;
reg  by_two_rst1 = 1'b1;

//divide_n_by_x1
wire [31:0] output_z_wire5;
wire output_z_ack_wire5;
wire output_z_stb_wire5;
wire input_a_ack_wire5;
wire input_b_ack_wire5;
reg n_by_x_rst = 1'b1;

//=================================
//=================================

//add_y_minus_x
wire [31:0] output_z_wire6;
wire output_z_ack_wire6;
wire output_z_stb_wire6;
wire input_a_ack_wire6;
wire input_b_ack_wire6;
reg  y_minus_x_rst = 1'b1;

//add_greater_e
wire [31:0] output_z_wire7;
wire output_z_ack_wire7;
wire output_z_stb_wire7;
wire input_a_ack_wire7;
wire input_b_ack_wire7;
reg  greater_e_rst2 = 1'b1;

//add_x_plus_y1
wire [31:0] output_z_wire8;
wire output_z_ack_wire8;
wire output_z_stb_wire8;
wire input_a_ack_wire8;
wire input_b_ack_wire8;
reg  x_plus_y_rst2 = 1'b1;

//divide_by_two1
wire [31:0] output_z_wire9;
wire output_z_ack_wire9;
wire output_z_stb_wire9;
wire input_a_ack_wire9;
wire input_b_ack_wire9;
reg  by_two_rst2 = 1'b1;

//divide_n_by_x1
wire [31:0] output_z_wire10;
wire output_z_ack_wire10;
wire output_z_stb_wire10;
wire input_a_ack_wire10;
wire input_b_ack_wire10;
reg n_by_y_rst = 1'b1;

assign e_neg = {~e[31], e[30:0]};
assign x_neg = {~x[31], x[30:0]};
assign y_neg = {~y[31], y[30:0]};
assign CLK2 = (output_z_stb_wire) ? 1:0;

always@(posedge CLK2)
begin
  x[0] = n[0];
  x[1] = n[1];
  x[2] = n[2];
  x[3] = n[3];
  x[4] = n[4];
  x[5] = n[5];
  x[6] = n[6];
  x[7] = n[7];
  x[8] = n[8];
  x[9] = n[9];
  x[10] = n[10];
  x[11] = n[11];
  x[12] = n[12];
  x[13] = n[13];
  x[14] = n[14];
  x[15] = n[15];
  x[16] = n[16];
  x[17] = n[17];
  x[18] = n[18];
  x[19] = n[19];
  x[20] = n[20];
  x[21] = n[21];
  x[22] = n[22];
  x[23] = n[23];
  x[24] = n[24];
  x[25] = n[25];
  x[26] = n[26];
  x[27] = n[27];
  x[28] = n[28];
  x[29] = n[29];
  x[30] = n[30];
  x[31] = n[31];
end

//output_z_wire msb == 1 then neg else pos
//can delete later, does same as add_x_minus_y
adder add_greater_1
(
	.input_a(n),
	.input_b(y_neg),
	.input_a_stb(1'b1),
	.input_b_stb(1'b1),
	.output_z_ack(output_z_ack_wire),
	.clk(CLK),
	.rst(1'b0),
	.output_z(output_z_wire),
	.output_z_stb(output_z_stb_wire),
	.input_a_ack(input_a_ack_wire),
	.input_b_ack(input_b_ack_wire)
);

//x - y, output_z_wire1 holds result
adder add_x_minus_y
(
	.input_a(x),
	.input_b(y_neg),
	.input_a_stb(1'b1),
	.input_b_stb(1'b1),
	.output_z_ack(output_z_ack_wire1),
	.clk(CLK),
	.rst(x_minus_y_rst),
	.output_z(output_z_wire1),
	.output_z_stb(output_z_stb_wire1),
	.input_a_ack(input_a_ack_wire1),
	.input_b_ack(input_b_ack_wire1)
);

//output_z_wire1 - e, output_z_wire2 msb is 0 if x-y > e 
adder add_greater_e1
(
	.input_a(output_z_wire1),
	.input_b(e_neg),
	.input_a_stb(1'b1),
	.input_b_stb(1'b1),
	.output_z_ack(output_z_ack_wire2),
	.clk(CLK),
	.rst(greater_e_rst1),
	.output_z(output_z_wire2),
	.output_z_stb(output_z_stb_wire2),
	.input_a_ack(input_a_ack_wire2),
	.input_b_ack(input_b_ack_wire2)
);

adder add_x_plus_y1
(
	.input_a(x),
	.input_b(y),
	.input_a_stb(1'b1),
	.input_b_stb(1'b1),
	.output_z_ack(output_z_ack_wire3),
	.clk(CLK),
	.rst(x_plus_y_rst1),
	.output_z(output_z_wire3),
	.output_z_stb(output_z_stb_wire3),
	.input_a_ack(input_a_ack_wire3),
	.input_b_ack(input_b_ack_wire3)
);

divider divide_by_two1
(
	.input_a(output_z_wire3),
	.input_b(two),
	.input_a_stb(1'b1),
	.input_b_stb(1'b1),
	.output_z_ack(output_z_ack_wire4),
	.clk(CLK),
	.rst(by_two_rst1),
	.output_z(output_z_wire4),
	.output_z_stb(output_z_stb_wire4),
	.input_a_ack(input_a_ack_wire4),
	.input_b_ack(input_b_ack_wire4)
);

divider divide_n_by_x
(
	.input_a(n),
	.input_b(x),
	.input_a_stb(1'b1),
	.input_b_stb(1'b1),
	.output_z_ack(output_z_ack_wire5),
	.clk(CLK),
	.rst(n_by_x_rst),
	.output_z(output_z_wire5),
	.output_z_stb(output_z_stb_wire5),
	.input_a_ack(input_a_ack_wire5),
	.input_b_ack(input_b_ack_wire5)
);
//=======================================
//=======================================
adder add_y_minus_x
(
	.input_a(y),
	.input_b(x_neg),
	.input_a_stb(1'b1),
	.input_b_stb(1'b1),
	.output_z_ack(output_z_ack_wire6),
	.clk(CLK),
	.rst(y_minus_x_rst),
	.output_z(output_z_wire6),
	.output_z_stb(output_z_stb_wire6),
	.input_a_ack(input_a_ack_wire6),
	.input_b_ack(input_b_ack_wire6)
);

adder add_greater_e2
(
	.input_a(output_z_wire6),
	.input_b(e_neg),
	.input_a_stb(1'b1),
	.input_b_stb(1'b1),
	.output_z_ack(output_z_ack_wire7),
	.clk(CLK),
	.rst(greater_e_rst2),
	.output_z(output_z_wire7),
	.output_z_stb(output_z_stb_wire7),
	.input_a_ack(input_a_ack_wire7),
	.input_b_ack(input_b_ack_wire7)
);

adder add_x_plus_y2
(
	.input_a(x),
	.input_b(y),
	.input_a_stb(1'b1),
	.input_b_stb(1'b1),
	.output_z_ack(output_z_ack_wire8),
	.clk(CLK),
	.rst(x_plus_y_rst2),
	.output_z(output_z_wire8),
	.output_z_stb(output_z_stb_wire8),
	.input_a_ack(input_a_ack_wire8),
	.input_b_ack(input_b_ack_wire8)
);

divider divide_by_two2
(
	.input_a(output_z_wire8),
	.input_b(two),
	.input_a_stb(1'b1),
	.input_b_stb(1'b1),
	.output_z_ack(output_z_ack_wire9),
	.clk(CLK),
	.rst(by_two_rst2),
	.output_z(output_z_wire9),
	.output_z_stb(output_z_stb_wire9),
	.input_a_ack(input_a_ack_wire9),
	.input_b_ack(input_b_ack_wire9)
);

divider divide_n_by_y
(
	.input_a(n),
	.input_b(y),
	.input_a_stb(1'b1),
	.input_b_stb(1'b1),
	.output_z_ack(output_z_ack_wire10),
	.clk(CLK),
	.rst(n_by_y_rst2),
	.output_z(output_z_wire10),
	.output_z_stb(output_z_stb_wire10),
	.input_a_ack(input_a_ack_wire10),
	.input_b_ack(input_b_ack_wire10)
);

always @(posedge CLK or negedge RST)
begin	
	if(CLK2 == 1'b1)
	begin
		x_minus_y_rst = 1'b0;
		y_minus_x_rst = 1'b0;
		if(output_z_stb_wire1 == 1'b1)
		begin
			//greater_e_rst1 <= 1'b0;		
			res <= output_z_wire;
			if(res[31] == 1'b0)
			begin //n >= 1
				pos <= 1'b1;
				greater_e_rst1 <= 1'b0;	
				if(output_z_stb_wire2 == 1'b1)
				begin
					//if(x-y) > e
					if(output_z_wire2[31] == 1'b0)
					begin
						x_plus_y_rst1 <= 1'b0;	
						//x+y
						if(output_z_stb_wire3 == 1'b1)
						begin
							by_two_rst1 <= 1'b0;
							//x = (x+y)/2
							if(output_z_stb_wire4 == 1'b1)
							begin
								x <= output_z_wire4;
								n_by_x_rst <= 1'b0;
								y = n/x;
								//y = n/x
								if(output_z_stb_wire5 == 1'b1)
								begin
									y <= output_z_wire5;
									x_minus_y_rst <= 1'b1;
									greater_e_rst1 <= 1'b1;	
									x_plus_y_rst1 <= 1'b1;
									by_two_rst1 <= 1'b1;
									n_by_x_rst <= 1'b1;
								end
							
							end
						end
					end	
				end
			end
			else
			begin //n < 1
				pos <= 1'b0;
				greater_e_rst2 <= 1'b0;	
				if(output_z_stb_wire7 == 1'b1)
				begin
					//if(x-y) > e
					if(output_z_wire7[31] == 1'b0)
					begin
						x_plus_y_rst2 <= 1'b0;	
						//x+y
						if(output_z_stb_wire8 == 1'b1)
						begin
							by_two_rst2 <= 1'b0;
							//y = (x+y)/2
							if(output_z_stb_wire9 == 1'b1)
							begin
								y <= output_z_wire9;
								n_by_y_rst <= 1'b0;
								//x = n/y
								if(output_z_stb_wire10 == 1'b1)
								begin
									x <= output_z_wire10;
									y_minus_x_rst <= 1'b1;
									greater_e_rst2 <= 1'b1;	
									x_plus_y_rst2 <= 1'b1;
									by_two_rst2 <= 1'b1;
									n_by_y_rst <= 1'b1;
								end
							
							end
						end
					end	
				end				
			end
		end
	end
end



endmodule
