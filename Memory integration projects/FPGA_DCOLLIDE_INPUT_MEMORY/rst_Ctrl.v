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
output reg rstOut = 1'b1;
reg [3:0] state = 4'b0;
reg [3:0] next_state = 4'b0;


reg [5:0] counter = 6'd0;
reg [5:0] counter2 = 6'd0;
reg flagRst = 1'b0;
reg flagRst2 = 1'b0;

//Goes from state to next_state
always @(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
	begin
		state <= 1;
	end else
	begin
		state <= next_state;
	end
end

//Decides next state
always @ (*)
begin
	case(state)
		0:
		begin
			if(cs == 1'b1)
			begin
				next_state = 4'd1;
			end else
			begin
				next_state = 4'd0;
			end
		end
		1:
		begin
			if(cs == 1'b1)
			begin
				next_state = 4'd0;
			end else
			begin
				next_state = 4'd1;
			end
		end
	endcase
end

//Decides what happens during each state
always @(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
	begin
		rstOut <= 1;
	end else
	begin
		case (state)
			0:
			begin
				rstOut <= 0;
			end
			1:
			begin
				rstOut <= 1;
			end
		endcase
	end

end

//This part does stuff.
/*
always @(posedge clk or posedge done_collide or negedge rst or posedge cs)
begin
	if(rst == 1'b0)
	begin
		counter <= 0;
		flagRst = 1'b0;
	end else
	begin
		if(cs == 1'b1)
		begin
			if(flagRst == 1'b0)
			begin
				if(counter == 0)
				begin
					rstOut <= 1'b1;
					counter <= counter + 6'd1;
					state <= 1;
				end else if(counter == 1)
				begin
					rstOut <= 1'b0;
					counter <= counter + 6'd1;
					state <= 2;
				end else if(counter == 2)
				begin
					rstOut <= 1'b1;
					flagRst <= 1'b1;
					state <= 3;
				end		
			end else
			begin
				if(done_collide && flagRst == 1'b1)
				begin
					if(counter2 == 1)
					begin
						rstOut <= 1'b0;
						flagRst2 <= 1'b1;
						state <= 6;
					end  	
					counter2 <= counter2 + 6'd1;
					//state <= 4;
				end	
			end
		end
		//if(clk)
		//begin
		//	if(flagRst2 == 1'b1)
		//	begin
		//		rstOut <= 1'b1;
		//		flagRst2 <= 1'b0;
		//		state <= 5;
		//	end
		//end
		
	end
end
*/
endmodule
