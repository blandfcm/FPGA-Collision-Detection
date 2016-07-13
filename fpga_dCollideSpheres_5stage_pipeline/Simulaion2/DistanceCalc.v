module dCalcPointsDistance3
(
	input CLK,
	input [31:0] a1,
	input [31:0] a2,
	input [31:0] a3,
	input [31:0] b1,
	input [31:0] b2,
	input [31:0] b3,
	input RST,
	output [31:0] res,
	output reg out_rdy
	
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

wire out_rdy_calclen;

reg resetlen = 1'b1;

assign b1_neg = {~b1[31],b1[30:0]};
assign b2_neg = {~b2[31],b2[30:0]};
assign b3_neg = {~b3[31],b3[30:0]};

assign CLK2 = (output_z_stb_wire & output_z_stb_wire1 & output_z_stb_wire2) ? 1:0;

//jtag_debug jtag8(.in_debug(debugtest1));
//
//jtag_debug debug6(.in_debug(output_z_wire1));
//
//jtag_debug debug9(.in_debug(output_z_wire2));



adder add1
(
	.input_a(a1),
	.input_b(b1_neg),
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

adder add2
(
	.input_a(a2),
	.input_b(b2_neg),
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

adder add3
(
	.input_a(a3),
	.input_b(b3_neg),
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

dCalcVectorLength3 calcLen
(
	.CLK(CLK),
	.a1(output_z_wire),
	.a2(output_z_wire1),
	.a3(output_z_wire2),
	.b1(output_z_wire),
	.b2(output_z_wire1),
	.b3(output_z_wire2),
	.RST(resetlen),
	.res(res),
	.out_rdy(out_rdy_calclen)
);

reg [31:0] debugtest1;
reg debugtest2;

always @(posedge CLK2 or negedge RST or posedge out_rdy_calclen)
begin
	if(RST == 1'b0)
	begin
		resetlen <= 1'b0;
		out_rdy <= 1'b0;
	end
	else
	begin
		if(CLK2)
		begin
			resetlen <= 1'b1;	
		end
		
		if(out_rdy_calclen)
		begin
			out_rdy <= 1'b1;
			debugtest1 <= res;
		end
	end
end


endmodule

