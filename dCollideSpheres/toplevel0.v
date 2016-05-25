`timescale 1ns / 1ps

module toplevel0;

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

reg[31:0] p1x;
reg[31:0] p1y;
reg[31:0] p1z;
reg[31:0] p1r;
reg[31:0] p2x;
reg[31:0] p2y;
reg[31:0] p2z;
reg[31:0] p2r, g1c, g2c;
wire[31:0] cX, cY, cZ, nx, ny, nz, depthC;
wire[31:0] check;
wire ret_val, done_flag;
reg rst_wire;


dCollideSpheres test0(
	.x1(p1x), 
	.y1(p1y), 
	.z1(p1z), 
	.r1(p1r), 
	.x2(p2x), 
	.y2(p2y), 
	.z2(p2z), 
	.r2(p2r), 
	.cx(cX), 
	.cy(cY), 
	.cz(cZ), 
	.normalx(nx), 
	.normaly(ny), 
	.normalz(nz), 
	.depth(depthC), 
	.g1(g1c), 
	.g2(g2c), 
	.ret(ret_val), 
	.clk(CLK), 
	.rst(rst_wire), 
	.done(done_flag),
	.test(check)
);

integer i;

initial
begin
CLK = 0;
rst_wire = 0;
/*input_a_reg = 32'b01000000010011001100110011001101;
input_b_reg = 32'b00111111110011001100110011001101;*/

p1x = 32'b10111110111111000100011101011110;
p1y = 32'b00000000000000000000000000000000;
p1z = 32'b00111111110000000000000000000000;
p1r = 32'b00111111000000000000000000000000;
p2x = 32'b00111110111111000100011101011110;
p2y = 32'b00000000000000000000000000000000;
p2z = 32'b00111111110000000000000000000000;
p2r = 32'b00111111000000000000000000000000;
g1c = 32'b00111111011110101110000101001000;		//d = g1
g2c = 32'd1;

end

always  
    #1  CLK =  ! CLK; 
initial 
	#10000  $stop; 

endmodule