`timescale 1ns / 1ps

module sqrtLevel;

reg CLK = 1'b0;
reg RST = 1'b0;
reg[31:0] n_reg;
//reg [31:0] root_reg;
wire [31:0] res_wire;

sqrt squareRoot
(
    .CLK(CLK),
	.RST(RST),
    .n(n_reg),
	//.root(root_reg),
    .res(res_wire)
);

integer i;

initial
begin
	CLK = 0;
	n_reg = 32'b00111111010000000000000000000000; //0.75
	//n_reg = 32'b01000000100000000000000000000000; //4.0
	//n_reg = 32'd2;
end

always  
    #1  CLK =  ! CLK; 
initial 
	#10000  $stop; //2800 for sqrt(4)

endmodule