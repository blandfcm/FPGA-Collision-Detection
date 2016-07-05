module dCalcVectorDot3_14(
	input clk, rst,
	input[31:0] a0, a1, a2, b0, b1, b2,
	output[31:0] result,
	output done_flag
);

wire[31:0] mult0;
wire done_mult0;
multiplier multa0_b0(
	.input_a(a0),
	.input_b(b0),
	.input_a_stb(1'b1),
	.input_b_stb(1'b1),
	.output_z_ack(1'b1),
	.clk(clk),
	.rst(rst),
	.output_z(mult0),
	.output_z_stb(done_mult0),
	.input_a_ack(1'b1),
	.input_b_ack(1'b1)
);

wire[31:0] mult1;
wire done_mult1;
multiplier multa1_b1(
	.input_a(a1),
	.input_b(b1),
	.input_a_stb(1'b1),
	.input_b_stb(1'b1),
	.output_z_ack(1'b1),
	.clk(clk),
	.rst(rst),
	.output_z(mult1),
	.output_z_stb(done_mult1),
	.input_a_ack(1'b1),
	.input_b_ack(1'b1)
);

wire[31:0] mult2;
wire done_mult2;
multiplier multa2_b2(
	.input_a(a2),
	.input_b(b2),
	.input_a_stb(1'b1),
	.input_b_stb(1'b1),
	.output_z_ack(1'b1),
	.clk(clk),
	.rst(rst),
	.output_z(mult2),
	.output_z_stb(done_mult2),
	.input_a_ack(1'b1),
	.input_b_ack(1'b1)
);

endmodule