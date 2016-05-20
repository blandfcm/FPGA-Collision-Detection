module decode_7seg(num, digit);
	input[3:0] num;
	output[6:0] digit;
	reg[6:0] digit;
	always @(*)
	begin
		case (num)
		  4'b0000 : digit = ~7'b0111111;
		  4'b0001 : digit = ~7'b0000110;
		  4'b0010 : digit = ~7'b1011011;
		  4'b0011 : digit = ~7'b1001111;
		  4'b0100 : digit = ~7'b1100110;
		  4'b0101 : digit = ~7'b1101101;
		  4'b0110 : digit = ~7'b1111101;
		  4'b0111 : digit = ~7'b0000111;
		  4'b1000 : digit = ~7'b1111111;
		  4'b1001 : digit = ~7'b1100111;
		  4'b1110 : digit = ~7'b1111001;
		  4'b1111 : digit = 7'b1100000; // Value set to display r for an error message
		  default : digit = 7'b1111111;
		endcase
	end
	
endmodule
