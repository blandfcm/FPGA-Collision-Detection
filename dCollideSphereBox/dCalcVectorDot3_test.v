module dCalcVectorDot3_test
(
	input CLK,
	input [31:0] a1,
	input [31:0] a2,
	input [31:0] a3,
	input [31:0] b1,
	input [31:0] b2,
	input [31:0] b3,
	input RST,
	output reg [31:0] res,
	output reg out_rdy
);

wire CLK2;
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

wire [31:0] resultadd3;
reg resetadd3 = 1'b1;
wire out_rdy_adder;

assign CLK2 = (output_z_stb_wire & output_z_stb_wire1 & output_z_stb_wire2) ? 1:0;

multiplier mult1
(
	.input_a(a1),
	.input_b(b1),
	.input_a_stb(1'b1),
	.input_b_stb(1'b1),
	.output_z_ack(output_z_ack_wire),
	.clk(CLK),
	.rst(RST),
	.output_z(output_z_wire),
	.output_z_stb(output_z_stb_wire),
	.input_a_ack(input_a_ack_wire),
	.input_b_ack(input_b_ack_wire)
);

multiplier mult2
(
	.input_a(a2),
	.input_b(b2),
	.input_a_stb(1'b1),
	.input_b_stb(1'b1),
	.output_z_ack(output_z_ack_wire1),
	.clk(CLK),
	.rst(RST),
	.output_z(output_z_wire1),
	.output_z_stb(output_z_stb_wire1),
	.input_a_ack(input_a_ack_wire1),
	.input_b_ack(input_b_ack_wire1)
);

multiplier mult3
(
	.input_a(a3),
	.input_b(b3),
	.input_a_stb(1'b1),
	.input_b_stb(1'b1),
	.output_z_ack(output_z_ack_wire2),
	.clk(CLK),
	.rst(RST),
	.output_z(output_z_wire2),
	.output_z_stb(output_z_stb_wire2),
	.input_a_ack(input_a_ack_wire2),
	.input_b_ack(input_b_ack_wire2)
);

add3 adder
(
	.CLK(CLK),
	.a1(output_z_wire),
	.a2(output_z_wire1),
	.a3(output_z_wire2),
	.reset(resetadd3),
	.result(resultadd3),
	.out_rdy(out_rdy_adder)
);


always @(posedge CLK2 or posedge out_rdy_adder or posedge RST)
begin
	if(CLK2)
	begin
		resetadd3 = 1'b0;
	end
	if(out_rdy_adder)
	begin
		out_rdy = 1'b1;
		res = resultadd3;
	end
	if(RST)
	begin
		resetadd3 = 1'b1;
		out_rdy = 1'b0;
	end
end

/*always @(posedge CLK2)
begin
	resetadd3 = 1'b0;
end

always @(posedge out_rdy_adder)
begin
	resetsqrt = 1'b0;
end

always @(posedge out_rdy_sqrt)
begin
	res = rootcalc;
end*/


endmodule

