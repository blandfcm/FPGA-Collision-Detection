module rst_Ctrl (
	rst,
	cs,
	clk,
	done_collide,
	rstOut
);

input rst;
input cs;
input clk;
input done_collide;
output reg rstOut;

reg [5:0] counter = 6'd0;
reg [5:0] counter2 = 6'd0;
reg flagRst = 1'b0;
reg flagRst2 = 1'b0;

always @(posedge clk or posedge done_collide or posedge cs or posedge flagRst2 or negedge rst)
begin
	if(rst == 1'b0)
	begin
		counter <= 0;
		flagRst = 1'b0;
	end else
	begin
		if(cs == 1'b1)
		begin
			if (flagRst == 1'b0)
			begin
			counter <= counter + 6'd1;
				if(counter == 0)
				begin
					rstOut <= 1'b1;
				end else if(counter == 1)
				begin
					rstOut <= 1'b0;
				end else if(counter == 2)
				begin
					rstOut <= 1'b1;
					flagRst <= 1'b1;
				end		
			end
		end
		if (cs == 1'b1)
		begin
			if(done_collide == 1'b1)
			begin
				if(counter2 == 1)
				begin
					rstOut <= 1'b0;
					flagRst2 <= 1'b1;
				end  	
				counter2 <= counter2 + 6'd1;				
			end
		end
		if(flagRst2 == 1'b1)
		begin
			rstOut <= 1'b1;
			flagRst2 <= 1'b0;
		end
	end
end

endmodule
