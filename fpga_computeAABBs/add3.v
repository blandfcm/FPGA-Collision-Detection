module add3
(
	input CLK,
	input [31:0] a1,
	input [31:0] a2,
	input [31:0] a3,
	input reset,
	output reg [31:0] result,
	output reg out_rdy
);

wire CLK2;
reg resetadd1 = 1'b0;
reg resetadd2 = 1'b0;
reg [31:0] res_add1;

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



adder add1
(
	.input_a(a1),
	.input_b(a2),
	.input_a_stb(1'b1),
	.input_b_stb(1'b1),
	.output_z_ack(output_z_ack_wire),
	.clk(CLK),
	.rst(reset),
	.output_z(output_z_wire),
	.output_z_stb(output_z_stb_wire),
	.input_a_ack(input_a_ack_wire),
	.input_b_ack(input_b_ack_wire)
);

adder add2
(
	.input_a(output_z_wire),
	.input_b(a3),
	.input_a_stb(1'b1),
	.input_b_stb(1'b1),
	.output_z_ack(output_z_ack_wire1),
	.clk(CLK),
	.rst(resetadd2),
	.output_z(output_z_wire1),
	.output_z_stb(output_z_stb_wire1),
	.input_a_ack(input_a_ack_wire1),
	.input_b_ack(input_b_ack_wire1)
);

always @(posedge output_z_stb_wire or posedge output_z_stb_wire1 or negedge reset)
begin
	if(reset == 1'b0)
	begin
		resetadd2 <= 1'b0;
		out_rdy <= 1'b0;
	end
	else
	begin
		if(output_z_stb_wire)
		begin
			resetadd2 <= 1'b1;
		end
		if(output_z_stb_wire1)
		begin
			result <= output_z_wire1;
			out_rdy <= 1'b1;
		end
	end

end


endmodule

