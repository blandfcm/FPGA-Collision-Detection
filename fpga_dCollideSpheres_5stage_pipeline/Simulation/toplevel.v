`timescale 1ns / 1ps

module toplevel;

reg CLK = 1'b0;
/*reg [31:0] input_a_reg;
reg [31:0] input_b_reg;
wire [31:0] output_z_wire;
wire output_z_ack_wire;
wire output_z_stb_wire;
wire input_a_ack_wire;
wire input_b_ack_wire;
adder addddd(
	.input_a(input_a_reg),
	.input_b(input_b_reg),
	.input_a_stb(1'b1),
	.input_b_stb(1'b1),
	.output_z_ack(output_z_ack_wire),
	.clk(CLK),
	.rst(1'b0),
	.output_z(output_z_wire),
	.output_z_stb(output_z_stb_wire),
	.input_a_ack(input_a_ack_wire),
	.input_b_ack(input_b_ack_wire)
);*/

reg[31:0] a1_reg;
reg[31:0] a2_reg;
reg[31:0] a3_reg;
reg[31:0] b1_reg;
reg[31:0] b2_reg;
reg[31:0] b3_reg;
wire [31:0] res_wire;


reg [31:0] x1_reg;
reg [31:0] y1_reg;
reg [31:0] z1_reg;
reg [31:0] r1_reg;
reg [31:0] x2_reg;
reg [31:0] y2_reg;
reg [31:0] z2_reg;
reg [31:0] r2_reg, g1c, g2c;
wire [31:0] outs [8:0];
wire [31:0] check;
wire done_w;
reg key0;
wire ret_val, done_flag;
reg rst_data;
reg [31:0] counter2 = 32'd0;


wire [31:0] out_value_w;
reg rst_wire;
reg[31:0] counter;
reg reset = 1'b0;
reg flag = 1'b0;
reg [1:0] flag_reg;




//=======================================================
//  Structural coding
//=======================================================		

dCollideSpheres test0(
	.x1(x1_reg), 
	.y1(y1_reg), 
	.z1(z1_reg), 
	.r1(r1_reg), 
	.x2(x2_reg), 
	.y2(y2_reg), 
	.z2(z2_reg), 
	.r2(r2_reg), 	
	.cx(outs[0]), 
	.cy(outs[1]), 
	.cz(outs[2]), 
	.normalx(outs[3]), 
	.normaly(outs[4]), 
	.normalz(outs[5]), 
	.depth(outs[6]), 
	.g1(32'd1), 
	.g2(32'd1), 
	.ret(outs[7]), 
	.clk(CLK), 
	.rst(key0), 
	.done(done_w),
	.test(check)
);


integer i;

initial
begin

CLK = 0;
key0 = 1'b1;
counter <= 0;
/*input_a_reg = 32'b01000000010011001100110011001101;
input_b_reg = 32'b00111111110011001100110011001101;*/


x1_reg  <= 32'b10111110111111000100011101011110;
y1_reg  <= 32'b00000000000000000000000000000000;
z1_reg  <= 32'b00111111110000000000000000000000;
r1_reg  <= 32'b00111111000000000000000000000000;
x2_reg  <= 32'b00111110111111000100011101011110;
y2_reg  <= 32'b00000000000000000000000000000000;
z2_reg  <= 32'b00111111110000000000000000000000;
r2_reg  <= 32'b00111111000000000000000000000000;







//x1_reg  <= 32'b10111001101001010010011010010110;
//y1_reg  <= 32'b00111111011011001000010100001010;
//z1_reg  <= 32'b01000000011111111111110110111001;
//r1_reg  <= 32'b00111111000000000000000000000000;
//x2_reg  <= 32'b10111111011011010011101001100000;
//y2_reg  <= 32'b10111001100111001100001100011010;
//z2_reg  <= 32'b01000000011111111111110011110000;
//r2_reg  <= 32'b00111111000000000000000000000000;
rst_data <= 1'b1;

end

always @(posedge CLK)
begin
	counter = counter + 1;
end

always
begin
    #1  CLK =  ! CLK; 
	
end
	
initial
	#600  key0 =  ! key0; 
	
initial
	#1200  key0 =  ! key0; 	
initial 
	#18000  $stop; 

endmodule