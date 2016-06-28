`timescale 1ns / 1ps

module toplevel;

reg CLK = 1'b0;



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
reg key0;
wire ret_val, done_flag;
wire rst_data;
reg rst_wire;
reg [31:0] inaddress = 32'b0;
reg [31:0] outaddress = 32'b0;
reg [31:0] debug = 32'b0;
reg reset = 1'b1;
reg flag = 1'b0;
reg flagDatain = 1'b0;
reg flagDataout = 1'b0;
wire [31:0] countrdy;
wire rdyData;
// jtag signals
reg [31:0] datain_mem_w;
wire [31:0] dataout1_mem_w;
wire [31:0] dataout2_mem_w;
wire [31:0] dataout3_mem_w;
wire [31:0] dataout4_mem_w;
wire [31:0] dataout5_mem_w;
wire [31:0] dataout6_mem_w;
wire [31:0] dataout7_mem_w;
wire [31:0] dataout8_mem_w;

reg [7:0] addressreg;

reg [31:0] mem_input [0:31];

reg cs_w;
reg we_w;

wire oe_w;
wire fm_w;
wire rstOut_w;
wire end_of_memory_w;

reg rstMemCtrl = 1'b1;

reg flagMemCtrlRst = 1'b1;

wire [31:0] outaddress_w;

integer i;

initial
begin
	cs_w <= 1'b1;
	we_w <= 1'b0;
	CLK = 0;
	key0 = 1'b1;
	flagDatain = 0;
	flagDataout = 0;
	inaddress <= 0;
	outaddress <= 0;
	mem_input[0] = 32'hbefc475e;
	mem_input[1] = 32'h00000000;
	mem_input[2] = 32'h3fc00000;
	mem_input[3] = 32'h3f000000;
	mem_input[4] = 32'h3efc475e;
	mem_input[5] = 32'h00000000;
	mem_input[6] = 32'h3fc00000;
	mem_input[7] = 32'h3f000000;
	mem_input[8] = 32'h3f77fb37;
	mem_input[9] = 32'h00000000;
	mem_input[10] = 32'h40800000;
	mem_input[11] = 32'h3f000000;
	mem_input[12] = 32'h00000000;
	mem_input[13] = 32'h00000000;
	mem_input[14] = 32'h40420143;
	mem_input[15] = 32'h3f000000;
	mem_input[16] = 32'hbefc475e;
	mem_input[17] = 32'h00000000;
	mem_input[18] = 32'h3fc00000;
	mem_input[19] = 32'h3f000000;
	mem_input[20] = 32'h3efc475e;
	mem_input[21] = 32'h00000000;
	mem_input[22] = 32'h3fc00000;
	mem_input[23] = 32'h3f000000;
	mem_input[24] = 32'h3f77fb37;
	mem_input[25] = 32'h00000000;
	mem_input[26] = 32'h40800000;
	mem_input[27] = 32'h3f000000;
	mem_input[28] = 32'h00000000;
	mem_input[29] = 32'h00000000;
	mem_input[30] = 32'h40420143;
	mem_input[31] = 32'h3f000000;
end

//=======================================================
//  Structural coding
//=======================================================

rst_Ctrl rstCTRL(
	.cs(fm_w),
	.clk(CLK),
	.done_collide(done_w),
	.rstOut(rstOut_w),
	.rst(1'b1)
);

dCollideSpheres test0(
	.x1(dataout1_mem_w), 
	.y1(dataout2_mem_w), 
	.z1(dataout3_mem_w), 
	.r1(dataout4_mem_w), 
	.x2(dataout5_mem_w), 
	.y2(dataout6_mem_w), 
	.z2(dataout7_mem_w), 
	.r2(dataout8_mem_w), 	
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
	.clk(CLK), 
	.rst(rstOut_w), 
	.done(done_w),
	.test(check1),
	.test2(check2),
	.test3(check3),
	.test4(check4)
);

//assign datain_mem_w = (flagzero) ? inaddress:0;
ram_sp_sr_sw memory(
	.clk(CLK)         , // Clock Input
	.addressin(inaddress)     , // Address Input
	.addressout(outaddress_w)     , // Address Output
	.datain(datain_mem_w)        , // Data bi-directional
	.dataout0(dataout1_mem_w),
	.dataout1(dataout2_mem_w),
	.dataout2(dataout3_mem_w),
	.dataout3(dataout4_mem_w),
	.dataout4(dataout5_mem_w),
	.dataout5(dataout6_mem_w),
	.dataout6(dataout7_mem_w),
	.dataout7(dataout8_mem_w),
	.cs(cs_w)          , // Chip Select
	.we(we_w)          , // Write Enable/Read Enable
	.oe(oe_w)          , // Output Enable
	.fm(fm_w)           // Output Enable
); 

memoryController memcontrol( 
		//.clk(CLK),
		.rst(),
		.fetch_data_ready(done_w),
		.end_of_memory(end_of_memory_w),
		.address(outaddress_w),
		.output_enable(oe_w)		
);

always @(posedge CLK)
begin
	if(inaddress < 32)
		begin
		if(flagDatain == 0)
		begin
			datain_mem_w <= mem_input[inaddress];
			flagDatain <= 1;
			we_w <= 1;
		end else
		begin
			inaddress <= inaddress + 1;
			flagDatain <= 0;
			we_w <= 0;
		end
	end else
	begin
		we_w <= 0;
	end

end	


/*always @(posedge CLK)
begin
	if(inaddress < 16)
		begin
		if(flagDatain == 0)
		begin
			datain_mem_w <= mem_input[inaddress];
			flagDatain <= 1;
			we_w <= 1;
		end else
		begin
			inaddress <= inaddress + 1;
			flagDatain <= 0;
			we_w <= 0;
		end
	end else
	begin
		we_w <= 0;
		oe_w <= 1;
		if(flagDataout == 0)
		begin
			flagDataout <= 1;
		end else
		begin
			outaddress <= outaddress + 1;
			flagDatain <= 0;
		end
	end

end	*/

always
begin
    #1  CLK =  ! CLK; 
	
end
	
initial
	#600  key0 =  ! key0; 
	
initial
	#1200  key0 =  ! key0; 	
initial 
	#18000  $stop; 


endmodule
