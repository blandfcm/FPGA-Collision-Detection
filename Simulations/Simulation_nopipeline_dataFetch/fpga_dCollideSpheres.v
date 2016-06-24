
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module fpga_dCollideSpheres(

	//////////// CLOCK //////////
	CLOCK_50,
	CLOCK2_50,
	CLOCK3_50,

	//////////// KEY //////////
	KEY,
	SW
);

//=======================================================
//  PARAMETER declarations
//=======================================================


//=======================================================
//  PORT declarations
//=======================================================

//////////// CLOCK //////////
input 		          		CLOCK_50;
input 		          		CLOCK2_50;
input 		          		CLOCK3_50;

//////////// KEY //////////
input 		     [3:0]		KEY;
input 		          		SW;


//=======================================================
//  REG/WIRE declarations
//=======================================================

wire [31:0] rst_reg;
wire [31:0] x1_reg;
wire [31:0] y1_reg;
wire [31:0] z1_reg;
wire [31:0] r1_reg;
wire [31:0] x2_reg;
wire [31:0] y2_reg;
wire [31:0] z2_reg;
wire [31:0] r2_reg, g1c, g2c;
wire [31:0] outs [8:0];
wire [31:0] check1;
wire [31:0] check2;
wire [31:0] check3;
wire [31:0] check4;
wire key0;
wire ret_val, done_flag;
wire rst_data;
reg rst_wire;
reg [31:0] counter = 31'b0;
reg [31:0] debug = 31'b0;
reg reset = 1'b1;
reg flag = 1'b0;

// jtag signals
assign key0 = ~KEY[0];


//=======================================================
//  Structural coding
//=======================================================

jtag_tx jtag0( .out_data(x1_reg) );
					 
jtag_tx jtag1( .out_data(y1_reg) );
					 
jtag_tx jtag2( .out_data(z1_reg) );
					 
jtag_tx jtag3( .out_data(r1_reg) );		
					 
jtag_tx jtag4( .out_data(x2_reg) );
					 
jtag_tx jtag5( .out_data(y2_reg) );
					 
jtag_tx jtag6( .out_data(z2_reg) );			
					 
jtag_tx jtag7( .out_data(r2_reg) );	

jtag_tx jtag8( .out_data(rst_reg) );	


jtag_debug jtag9(.in_debug(outs[0]));
jtag_debug jtag10(.in_debug(outs[1]));
jtag_debug jtag11(.in_debug(outs[2]));
jtag_debug jtag12(.in_debug(outs[3]));
jtag_debug jtag13(.in_debug(outs[4]));
jtag_debug jtag14(.in_debug(outs[5]));
jtag_debug jtag15(.in_debug(outs[6]));
jtag_debug jtag16(.in_debug(outs[7]));
jtag_debug jtag17(.in_debug(outs[8]));
jtag_debug jtag18(.in_debug(debug));


dCollideSpheres test0(
	.x1(x1_reg), 
	.y1(y1_reg), 
	.z1(z1_reg), 
	.r1(r1_reg), 
	.x2(x2_reg), 
	.y2(y2_reg), 
	.z2(z2_reg), 
	.r2(r2_reg), 	
	.cx(outs[0]), 
	.cy(outs[1]), 
	.cz(outs[2]), 
	.normalx(outs[3]), 
	.normaly(outs[4]), 
	.normalz(outs[5]), 
	.depth(outs[6]), 
	.g1(32'd1), 
	.g2(32'd1), 
	.ret(outs[7]), 
	.clk(CLOCK_50), 
	.rst(rst_reg[0]), 
	.done(outs[8]),
	.test(check1),
	.test2(check2),
	.test3(check3),
   .test4(check4)
);

always @(posedge CLOCK_50 or negedge rst_reg[0])
begin
if(rst_reg[0] == 1'b0)
begin
	counter <= 32'd0;
end
else
begin
	if(outs[8] == 1'b1)
	begin
		debug <= counter;	
	end
	else
	begin
		counter <= counter + 1;
	end
end

		
end	




endmodule
