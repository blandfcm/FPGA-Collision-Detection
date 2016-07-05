module dCalcVectorDot3(
	input clk, rst,
	input[31:0] a0, a1, a2, b0, b1, b2,
	output[31:0] result,
	output done_flag
);

wire[31:0] mult0;
wire done_mult0;
wire z_ack0;
wire a_ack0;
wire b_ack0;
multiplier multa0_b0(
	.input_a(a0),
	.input_b(b0),
	.input_a_stb(1'b1),
	.input_b_stb(1'b1),
	.output_z_ack(z_ack0),
	.clk(clk),
	.rst(rst),
	.output_z(mult0),
	.output_z_stb(done_mult0),
	.input_a_ack(a_ack0),
	.input_b_ack(b_ack0)
);

wire[31:0] mult1;
wire done_mult1;
wire z_ack1;
wire a_ack1;
wire b_ack1;
multiplier multa1_b1(
	.input_a(a1),
	.input_b(b1),
	.input_a_stb(1'b1),
	.input_b_stb(1'b1),
	.output_z_ack(z_ack1),
	.clk(clk),
	.rst(rst),
	.output_z(mult1),
	.output_z_stb(done_mult1),
	.input_a_ack(a_ack1),
	.input_b_ack(b_ack1)
);

wire[31:0] mult2;
wire done_mult2;
wire z_ack2;
wire a_ack2;
wire b_ack2;
multiplier multa2_b2(
	.input_a(a2),
	.input_b(b2),
	.input_a_stb(1'b1),
	.input_b_stb(1'b1),
	.output_z_ack(z_ack2),
	.clk(clk),
	.rst(rst),
	.output_z(mult2),
	.output_z_stb(done_mult2),
	.input_a_ack(a_ack2),
	.input_b_ack(b_ack2)
);

assign done_mult = done_mult0 && done_mult1 && done_mult2;

wire[31:0] sum0;
wire done_sum0;
wire z_ack_sum0;
wire a_ack_add0;
wire b_ack_add0;
adder add0(
	.input_a(mult0), 
	.input_b(mult1),
	.input_a_stb(1'b1),
	.input_b_stb(1'b1),
	.output_z_ack(z_ack_sum0),
	.clk(clk),
	.rst(done_mult),
	.output_z(sum0),
	.output_z_stb(done_sum0),
	.input_a_ack(a_ack_add0),
	.input_b_ack(b_ack_add0)
);

	wire[31:0] sum1;
	wire done_sum1;
	wire z_ack_sum1;
	wire a_ack_add1;
	wire b_ack_add1;
	adder add1(
		.input_a(sum0), 
		.input_b(mult2),
		.input_a_stb(1'b1),
		.input_b_stb(1'b1),
		.output_z_ack(z_ack_sum1),
		.clk(clk),
		.rst(done_sum0),
		.output_z(sum1),
		.output_z_stb(done_sum1),
		.input_a_ack(a_ack_add1),
		.input_b_ack(b_ack_add1)
	);
	
assign result = (done_sum1) ? sum1:32'd0;
assign done_flag = (done_sum1) ? 1'b1:1'b0;

endmodule