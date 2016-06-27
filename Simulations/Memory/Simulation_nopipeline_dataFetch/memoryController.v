module memoryController( 
		fetch_data_ready,
		end_of_memory,
		rst
);

input rst;
input fetch_data_ready;
output reg end_of_memory;

reg [31:0] address = 32'd0;
reg [31:0] threshold = 32'd185;

always@(posedge fetch_data_ready or negedge rst)
begin
	if(rst == 1'b0)
	begin
		address <= 32'd0;
		end_of_memory <= 1'b0;
	end
	else
	begin
		if(address < threshold)
		begin
			address <= address + 1'b1;
		end
		else
		begin
			end_of_memory <= 1'b1;
		end
	end
end

endmodule


