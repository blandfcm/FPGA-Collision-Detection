`timescale 1ns / 1ps

module toplevel;

reg CLK = 1'b0;

reg[31:0] a1_reg;
reg[31:0] a2_reg;
reg[31:0] a3_reg;
reg[31:0] b1_reg;
reg[31:0] b2_reg;
reg[31:0] b3_reg;
wire [31:0] res_wire;


reg [31:0] x1_reg;
reg [31:0] y1_reg;
reg [31:0] z1_reg;
reg [31:0] r1_reg;
reg [31:0] x2_reg;
reg [31:0] y2_reg;
reg [31:0] z2_reg;
reg [31:0] r2_reg, g1c, g2c;
wire [31:0] outs [8:0];
wire [31:0] check;
wire done_w;
reg key0;
wire ret_val, done_flag;
reg rst_data;
reg [31:0] counter2 = 32'd0;


wire [31:0] out_value_w;
reg rst_wire;
reg[31:0] counter;
reg reset = 1'b0;
reg flag = 1'b0;
reg [1:0] flag_reg;

reg fetch;
wire final_done; 

reg wait_flag = 1'b0;

//=======================================================
//  Structural coding
//=======================================================		

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
	.clk(CLK), 
	.rst(key0), 
	.done(done_w),
	.test(check)
);

memoryController MC_Hammer( 
	.fetch_data_ready(fetch),
	.end_of_memory(final_done),
	.rst(key0)
);

integer i;

initial
begin

CLK <= 0;
key0 <= 1'b1;
counter <= 0;

fetch <= 1'b1;

x1_reg  <= 32'b10111110111111000100011101011110;
y1_reg  <= 32'b00000000000000000000000000000000;
z1_reg  <= 32'b00111111110000000000000000000000;
r1_reg  <= 32'b00111111000000000000000000000000;
x2_reg  <= 32'b00111110111111000100011101011110;
y2_reg  <= 32'b00000000000000000000000000000000;
z2_reg  <= 32'b00111111110000000000000000000000;
r2_reg  <= 32'b00111111000000000000000000000000;

rst_data <= 1'b1;

end

always@(posedge CLK)
begin
	if(final_done == 1'b0)
	begin
		if(done_w == 1'b1)
		begin //fetch data
			fetch <= 1'b0;
			x1_reg  <= 32'b00111111011101111111101100110111;
			y1_reg  <= 32'b00000000000000000000000000000000;
			z1_reg  <= 32'b01000000100000000000000000000000;
			r1_reg  <= 32'b00111111000000000000000000000000;
			x2_reg  <= 32'b00000000000000000000000000000000;
			y2_reg  <= 32'b00000000000000000000000000000000;
			z2_reg  <= 32'b01000000100111101111111101101101;
			r2_reg  <= 32'b00111111000000000000000000000000;
			
			if(counter > 32'd40 && counter < 32'd42) 
			begin
				key0 <= 1'b0;
				wait_flag <= 1'b1;
			end
			
			counter <= counter + 1'b1;
		end
		
		if(fetch == 1'b0)
		begin
			fetch <= 1'b1;
		end
		
		if(wait_flag == 1'b1)
		begin
			if(counter > 32'd50)
			begin
				key0 <= 1'b1;
			end
			counter <= counter + 1'b1;
		end
	end
end

always
begin
    #1  CLK =  ! CLK; 
end
	
initial
	#200  key0 =  ! key0; 
	
initial
	#400  key0 =  ! key0; 	
initial 
	#2500  $stop; 

endmodule