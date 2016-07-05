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
reg [31:0] debug = 32'b0;
reg reset = 1'b1;
reg flag = 1'b0;
wire [31:0] countrdy;
wire rdyData;
// jtag signals
reg flagDatain = 1'b0;
reg flagDataout = 1'b0;

reg [31:0] inaddress = 32'b0;
reg [31:0] outaddress = 32'b0;

reg [31:0] datain_mem_w;
wire [31:0] dataout1_mem_w;
wire [31:0] dataout2_mem_w;
wire [31:0] dataout3_mem_w;
wire [31:0] dataout4_mem_w;
wire [31:0] dataout5_mem_w;
wire [31:0] dataout6_mem_w;
wire [31:0] dataout7_mem_w;
wire [31:0] dataout8_mem_w;

reg cs_w;
reg we_w;
wire oe_w;
wire fm_w;
wire end_of_memory_w;
wire [31:0] outaddress_w;

reg flagDatain2 = 1'b0;
reg flagDataout2 = 1'b0;

reg [31:0] inaddress2 = 32'b0;
reg [31:0] outaddress2 = 32'b0;

reg [31:0] datain_cx;
reg [31:0] datain_cy;
reg [31:0] datain_cz;
reg [31:0] datain_nx;
reg [31:0] datain_ny;
reg [31:0] datain_nz;
reg [31:0] datain_depth;

wire [31:0] datain_cx_w;
wire [31:0] datain_cy_w;
wire [31:0] datain_cz_w;
wire [31:0] datain_nx_w;
wire [31:0] datain_ny_w;
wire [31:0] datain_nz_w;
wire [31:0] datain_depth_w;
wire [31:0] dataout_mem_w2;

reg cs_w2;
reg we_w2;
wire oe_w2;
wire fm_w2;
wire end_of_memory_w2;
wire [31:0] outaddress_w2;

reg [7:0] addressreg;

reg [31:0] mem_input [0:31];
reg [31:0] mem_output [0:31];

reg [7:0] read_counter = 1'b0;
reg read_counter_flag = 1'b0;

wire rstOut_w;

reg rstMemCtrl = 1'b1;

reg flagMemCtrlRst = 1'b1;
reg read = 1'b0;

integer i;

initial
begin
	read_counter = 1'b0;
	read_counter_flag = 1'b0;

	read = 1'b0;
	CLK = 0;
	key0 = 1'b1;

	cs_w = 1'b1;
	we_w = 1'b0;
	flagDatain = 0;
	flagDataout = 0;
	inaddress = 0;
	outaddress = 0;
	
	cs_w2 = 1'b1;
	we_w2 = 1'b0;
	flagDatain2 = 0;
	flagDataout2 = 0;
	inaddress2 = 0;
	outaddress2 = 0;
	

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
	.cx(datain_cx_w), 
	.cy(datain_cy_w), 
	.cz(datain_cz_w), 
	.normalx(datain_nx_w), 
	.normaly(datain_ny_w), 
	.normalz(datain_nz_w), 
	.depth(datain_depth_w), 
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
	.clk(CLK)                , 	// Clock Input
	.addressin(inaddress)    ,  // Address Input
	.addressout(outaddress_w),  // Address Output
	.datain(datain_mem_w)    ,  // Data bi-directional
	.dataout0(dataout1_mem_w),
	.dataout1(dataout2_mem_w),
	.dataout2(dataout3_mem_w),
	.dataout3(dataout4_mem_w),
	.dataout4(dataout5_mem_w),
	.dataout5(dataout6_mem_w),
	.dataout6(dataout7_mem_w),
	.dataout7(dataout8_mem_w),
	.cs(cs_w)          	     ,  // Chip Select
	.we(we_w)          		 ,  // Write Enable/Read Enable
	.oe(oe_w)          		 ,  // Output Enable
	.fm(fm_w)          			// Output Enable
); 

ram_sp_sr_sw_7_outputs memory_7(
	.clk(CLK)                 ,	// Clock Input
	.addressin(inaddress2)    , // Address Input
	.addressout(outaddress_w2), // Address Input
	.datain0(datain_cx)     , // Data bi-directional
	.datain1(datain_cy)     , // Data bi-directional
	.datain2(datain_cz)     , // Data bi-directional
	.datain3(datain_nx)     , // Data bi-directional
	.datain4(datain_ny)     , // Data bi-directional
	.datain5(datain_nz)     , // Data bi-directional
	.datain6(datain_depth)  , // Data bi-directional
	.dataout(dataout_mem_w2)    , // Data bi-directional
	.cs(cs_w2)          	  , // Chip Select
	.we(we_w2)          	  , // Write Enable/Read Enable
	.oe(oe_w2)          	  , // Output Enable
	.fm(fm_w2)          	    // Full memory
); 

memoryController memcontrol( 
		//.clk(CLK),
		.rst(),
		.fetch_data_ready(done_w),
		.end_of_memory(end_of_memory_w),
		.address(outaddress_w),
		.output_enable(oe_w)		
);

memoryController memcontrol2( 
		//.clk(CLK),
		.rst(),
		.fetch_data_ready(read_counter_flag),
		.end_of_memory(end_of_memory_w2),
		.address(outaddress_w2),
		.output_enable(oe_w2)		
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
	
	if(flagDatain2 == 1'b1)
	begin
		if(we_w2 == 1'b0)
		begin
			if(read_counter_flag == 1'b0)
			begin
				read_counter <= 8'd0;
				read_counter_flag <= 1'b1;
			end
			else
			begin
				read_counter <= read_counter + 1'b1;
				if(read_counter >= 8'b10000000)
				begin
					read_counter_flag <= 1'b0;
				end
			end
		end
	end
end

always@(posedge done_w)
begin
	datain_cx    <= datain_cx_w;  
	datain_cy    <= datain_cy_w;  
	datain_cz    <= datain_cz_w;  
	datain_nx    <= datain_nx_w;  
	datain_ny    <= datain_ny_w;  
	datain_nz    <= datain_nz_w;  
	datain_depth <= datain_depth_w;

	if(done_w == 1'b1)
	begin
			if(inaddress2 < 35)
			begin
			if(flagDatain2 == 0)
			begin
				inaddress2 <= 32'd0;
				we_w2 <= 1;
				flagDatain2 <= 1;
			end else
			begin
				inaddress2 <= inaddress2 + 7;
			end
		end else
		begin
			we_w2 <= 0;
		end
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
	#25000  $stop; 


endmodule
