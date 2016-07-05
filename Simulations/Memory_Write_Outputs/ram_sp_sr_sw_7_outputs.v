//-----------------------------------------------------
// Design Name : ram_sp_sr_sw
// File Name   : ram_sp_sr_sw.v
// Function    : Synchronous read write RAM 
// Coder       : Deepak Kumar Tala
//-----------------------------------------------------
module ram_sp_sr_sw_7_outputs (
clk         , // Clock Input
addressin     , // Address Input
addressout     , // Address Input
datain0     , // Data bi-directional
datain1     , // Data bi-directional
datain2     , // Data bi-directional
datain3     , // Data bi-directional
datain4     , // Data bi-directional
datain5     , // Data bi-directional
datain6     , // Data bi-directional
dataout      , // Data bi-directional
cs          , // Chip Select
we          , // Write Enable/Read Enable
oe          ,  // Output Enable
fm            // Full memory
); 

parameter DATA_WIDTH = 32 ;
parameter ADDR_WIDTH = 6 ;
parameter RAM_DEPTH = 1 << ADDR_WIDTH;

//--------------Input Ports----------------------- 
input                  clk         ;
input [ADDR_WIDTH-1:0] addressin   ;
input [ADDR_WIDTH-1:0] addressout  ;
input                  cs          ;
input                  we          ;
input                  oe          ; 

//--------------Inout Ports----------------------- 
input [DATA_WIDTH-1:0]  datain0       ;
input [DATA_WIDTH-1:0]  datain1       ;
input [DATA_WIDTH-1:0]  datain2       ;
input [DATA_WIDTH-1:0]  datain3       ;
input [DATA_WIDTH-1:0]  datain4       ;
input [DATA_WIDTH-1:0]  datain5       ;
input [DATA_WIDTH-1:0]  datain6       ;
output[DATA_WIDTH-1:0]  dataout       ;
output fm;

//--------------Internal variables---------------- 
reg [DATA_WIDTH-1:0] data_out;
reg [DATA_WIDTH-1:0] mem [0:RAM_DEPTH-1];
reg                  oe_r;

wire [31:0] addressshift;
assign addressshift = addressout;
//--------------Code Starts Here------------------ 

/*
// Tri-State Buffer control 
// output : When we = 0, oe = 1, cs = 1
assign datain0 = (cs && oe && !we) ? data_in0 : 8'bz; 
assign datain1 = (cs && oe && !we) ? data_in1 : 8'bz; 
assign datain2 = (cs && oe && !we) ? data_in2 : 8'bz; 
assign datain3 = (cs && oe && !we) ? data_in3 : 8'bz; 
assign datain4 = (cs && oe && !we) ? data_in4 : 8'bz; 
assign datain5 = (cs && oe && !we) ? data_in5 : 8'bz; 
assign datain6 = (cs && oe && !we) ? data_in6 : 8'bz; 
assign fm = (addressin >= 32'd31) ? 1:0;
*/

assign dataout = (cs && oe && !we) ? data_out : 8'bz;

/*
// Memory Write Block 
// Memory Write Block 
// Write Operation : When we = 1, cs = 1
always @ (posedge clk)
begin : MEM_WRITE
   if ( cs && we) begin
       mem[addressin] = dataout;
   end
end
*/

always @ (posedge clk)
begin : MEM_WRITE
   if ( cs && we) begin
       mem[addressin] 		 = datain0;
	   mem[addressin + 6'd1] = datain1;
	   mem[addressin + 6'd2] = datain2;
	   mem[addressin + 6'd3] = datain3;
	   mem[addressin + 6'd4] = datain4;
	   mem[addressin + 6'd5] = datain5;
	   mem[addressin + 6'd6] = datain6;
   end
end

// Memory Read Block 
// Read Operation : When we = 0, oe = 1, cs = 1
always @ (posedge clk)
begin : MEM_READ
  if (cs && !we && oe) begin
    data_out = mem[addressshift];
    oe_r = 1;
  end else begin
    oe_r = 0;
  end
end

endmodule // End of Module ram_sp_sr_sw
