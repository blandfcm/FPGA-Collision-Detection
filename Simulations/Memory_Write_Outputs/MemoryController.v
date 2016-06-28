
module memoryController( 
		//clk,
		rst,
		fetch_data_ready,
		end_of_memory,
		address,
		output_enable		
);

//input clk;
input rst;
input fetch_data_ready;
output reg end_of_memory;
output reg [31:0] address = 0;
output reg output_enable = 1'b0;

reg [31:0] threshold = 32'd35;

reg flagzero = 1'b0;

always@(/*posedge clk or*/ posedge fetch_data_ready or negedge rst)
begin
	if(rst == 1'b0)
	begin
		address <= 32'd0;
		end_of_memory <= 1'b0;
	end
	else
	begin
		if(fetch_data_ready)
		begin
			output_enable <= 1'b1;
			if(address < threshold)
			begin
				if(flagzero == 0)
				begin
					flagzero <= 1;
				end
				else
				begin
					address <= address + 1'b1;
				end
			end
			else
			begin
				end_of_memory <= 1'b1;
			end
		end
	end
end

endmodule


