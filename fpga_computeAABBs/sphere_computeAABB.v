module sphere_computeAABB(
	input clk, rst,
	input[31:0] x, y, z, radius,
	output[31:0] aabb0, aabb1, aabb2, aabb3, aabb4, aabb5,
	output done
);

wire[31:0] radius_neg;
assign radius_neg = {~radius[31], radius[30:0]};

wire[31:0] a0;
wire done_a0;
wire output_z_ack_a0;
wire input_a_ack_a0;
wire input_b_ack_a0;
adder add0(
	.input_a(x), 
	.input_b(radius_neg), 
	.input_a_stb(1'b1),
	.input_b_stb(1'b1),
	.output_z_ack(output_z_ack_a0),
	.clk(clk),
	.rst(rst),
	.output_z(aabb0),
	.output_z_stb(done_a0),
	.input_a_ack(input_a_ack_a0),
	.input_b_ack(input_b_ack_a0)
);

wire[31:0] a1;
wire done_a1;
wire output_z_ack_a1;
wire input_a_ack_a1;
wire input_b_ack_a1;
adder add1(
	.input_a(x), 
	.input_b(radius), 
	.input_a_stb(1'b1),
	.input_b_stb(1'b1),
	.output_z_ack(output_z_ack_a1),
	.clk(clk),
	.rst(rst),
	.output_z(aabb1),
	.output_z_stb(done_a1),
	.input_a_ack(input_a_ack_a1),
	.input_b_ack(input_b_ack_a1)
);

wire[31:0] a2;
wire done_a2;
wire output_z_ack_a2;
wire input_a_ack_a2;
wire input_b_ack_a2;
adder add2(
	.input_a(y), 
	.input_b(radius_neg), 
	.input_a_stb(1'b1),
	.input_b_stb(1'b1),
	.output_z_ack(output_z_ack_a2),
	.clk(clk),
	.rst(rst),
	.output_z(aabb2),
	.output_z_stb(done_a2),
	.input_a_ack(input_a_ack_a2),
	.input_b_ack(input_b_ack_a2)
);

wire[31:0] a3;
wire done_a3;
wire output_z_ack_a3;
wire input_a_ack_a3;
wire input_b_ack_a3;
adder add3(
	.input_a(y), 
	.input_b(radius), 
	.input_a_stb(1'b1),
	.input_b_stb(1'b1),
	.output_z_ack(output_z_ack_a3),
	.clk(clk),
	.rst(rst),
	.output_z(aabb3),
	.output_z_stb(done_a3),
	.input_a_ack(input_a_ack_a3),
	.input_b_ack(input_b_ack_a3)
);

wire[31:0] a4;
wire done_a4;
wire output_z_ack_a4;
wire input_a_ack_a4;
wire input_b_ack_a4;
adder add4(
	.input_a(z), 
	.input_b(radius_neg), 
	.input_a_stb(1'b1),
	.input_b_stb(1'b1),
	.output_z_ack(output_z_ack_a4),
	.clk(clk),
	.rst(rst),
	.output_z(aabb4),
	.output_z_stb(done_a4),
	.input_a_ack(input_a_ack_a4),
	.input_b_ack(input_b_ack_a4)
);

wire[31:0] a5;
wire done_a5;
wire output_z_ack_a5;
wire input_a_ack_a5;
wire input_b_ack_a5;
adder add5(
	.input_a(z), 
	.input_b(radius), 
	.input_a_stb(1'b1),
	.input_b_stb(1'b1),
	.output_z_ack(output_z_ack_a5),
	.clk(clk),
	.rst(rst),
	.output_z(aabb5),
	.output_z_stb(done_a5),
	.input_a_ack(input_a_ack_a5),
	.input_b_ack(input_b_ack_a5)
);

assign done = done_a0 && done_a1 && done_a2 && done_a3 && done_a4 && done_a5;


endmodule