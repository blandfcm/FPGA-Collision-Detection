`timescale 1ns / 1ps

module toplevel;

reg CLK = 1'b0;
reg [31:0] input_a_reg;
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
);

integer i;

initial
begin
CLK = 0;
input_a_reg = 32'b01000000010011001100110011001101;
input_b_reg = 32'b00111111110011001100110011001101;
end

always  
    #1  CLK =  ! CLK; 
initial 
	#32  $finish; 

endmodule