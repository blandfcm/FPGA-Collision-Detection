module dCalcPointsDistance3
(
	input CLK,
	input [31:0] a1,
	input [31:0] a2,
	input [31:0] a3,
	input [31:0] b1,
	input [31:0] b2,
	input [31:0] b3,
	output reg [31:0] res
);

wire CLK2;

wire [31:0] b1_neg;
wire [31:0] b2_neg;
wire [31:0] b3_neg;

wire [31:0] output_z_wire;
wire output_z_ack_wire;
wire output_z_stb_wire;
wire input_a_ack_wire;
wire input_b_ack_wire;

wire [31:0] output_z_wire1;
wire output_z_ack_wire1;
wire output_z_stb_wire1;
wire input_a_ack_wire1;
wire input_b_ack_wire1;

wire [31:0] output_z_wire2;
wire output_z_ack_wire2;
wire output_z_stb_wire2;
wire input_a_ack_wire2;
wire input_b_ack_wire2;

assign b1_neg = {~b1[31],b1[30:0]};
assign b2_neg = {~b2[31],b2[30:0]};
assign b3_neg = {~b2[31],b2[30:0]};

assign CLK2 = (output_z_stb_wire & output_z_stb_wire1 & output_z_stb_wire2) ? 1:0;

adder add1
(
	.input_a(a1),
	.input_b(b1_neg),
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

adder add2
(
	.input_a(a2),
	.input_b(b2_neg),
	.input_a_stb(1'b1),
	.input_b_stb(1'b1),
	.output_z_ack(output_z_ack_wire1),
	.clk(CLK),
	.rst(1'b0),
	.output_z(output_z_wire1),
	.output_z_stb(output_z_stb_wire1),
	.input_a_ack(input_a_ack_wire1),
	.input_b_ack(input_b_ack_wire1)
);

adder add3
(
	.input_a(a1),
	.input_b(b1_neg),
	.input_a_stb(1'b1),
	.input_b_stb(1'b1),
	.output_z_ack(output_z_ack_wire2),
	.clk(CLK),
	.rst(1'b0),
	.output_z(output_z_wire2),
	.output_z_stb(output_z_stb_wire2),
	.input_a_ack(input_a_ack_wire2),
	.input_b_ack(input_b_ack_wire2)
);
 



always @(posedge CLK2)
begin
	
	res = output_z_wire + output_z_wire1 + output_z_wire2;

end


endmodule

