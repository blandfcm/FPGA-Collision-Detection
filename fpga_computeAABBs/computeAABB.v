module computeAABB(
	input CLK, rst,
	output done_sphere,
	output done_box,
	output done_capsule
);

//hardcoded input values for sphere
wire[31:0] sphere0x = 32'b10111111001011101100100000111111;		//-.682743
wire[31:0] sphere0y = 32'b10111101000110000111011100100101;		//-.037223
wire[31:0] sphere0z = 32'b00111111110000000000000000000000;		//1.5
wire[31:0] sphere0r = 32'b00111111000000000000000000000000;		//0.5

wire[31:0] sphere0a0, sphere0a1, sphere0a2, sphere0a3, sphere0a4, sphere0a5;
sphere_computeAABB sphere0(
	.clk(CLK),
	.rst(rst),
	.x(sphere0x),
	.y(sphere0y),
	.z(sphere0z),
	.radius(sphere0r),
	.aabb0(sphere0a0),
	.aabb1(sphere0a1),
	.aabb2(sphere0a2),
	.aabb3(sphere0a3),
	.aabb4(sphere0a4),
	.aabb5(sphere0a5),
	.done(done_sphere)
);


//hardcoded input values for box
wire[31:0] box0x = 32'b11000001100000011101100011010010; 		//-16.23087
wire[31:0] box0y = 32'b00111111101001110100011010110010; 		//1.306845
wire[31:0] box0z = 32'b01000001000101001110100110110011;			//9.307055
wire[31:0] box0side0 = 32'b01000000100000000000000000000000;	//4.0
wire[31:0] box0side1 = 32'b01000000000000000000000000000000;	//2.0
wire[31:0] box0side2 = 32'b00111111100000000000000000000000;	//1.0
wire[31:0] box0r0 = 32'b10111111001101110110010000000110; 		//-0.71637
wire[31:0] box0r1 = 32'b10111110110101100100011110011001; 		//-0.418515
wire[31:0] box0r2 = 32'b00111111000011101110101001100100; 		//0.558264
wire[31:0] box0r4 = 32'b10111110011000110011011100100010; 		//-0.22189
wire[31:0] box0r5 = 32'b10111111000111110011011011011111; 		//-0.621931
wire[31:0] box0r6 = 32'b10111111010000000100000000000111; 		//-0.750977
wire[31:0] box0r8 = 32'b00111111001010010101011111011110; 		//0.661497
wire[31:0] box0r9 = 32'b10111111001010010110111100010001; 		//-0.661851
wire[31:0] box0r10 = 32'b00111110101101001001000100001000; 		//0.352669

wire[31:0] box0a0, box0a1, box0a2, box0a3, box0a4, box0a5;
box_computeAABB box0(
	.clk(CLK),
	.rst(rst),
	.x(box0x), 
	.y(box0y), 
	.z(box0z),
	.side0(box0side0), 
	.side1(box0side1), 
	.side2(box0side2),
	.r0(box0r0), 
	.r1(box0r1), 
	.r2(box0r2), 
	.r4(box0r4), 
	.r5(box0r5), 
	.r6(box0r6), 
	.r8(box0r8), 
	.r9(box0r9), 
	.r10(box0r10),
	.aabb0(box0a0), 
	.aabb1(box0a1), 
	.aabb2(box0a2), 
	.aabb3(box0a3), 
	.aabb4(box0a4), 
	.aabb5(box0a5),
	.done(done_box)
);


//hardcoded input values for capsule
wire[31:0] capsule0x = 32'b11000001100000011101100011010010; 		//-16.23087
wire[31:0] capsule0y = 32'b00111111101001110100011010110010; 		//1.306845
wire[31:0] capsule0z = 32'b01000001000101001110100110110011;		//9.307055
wire[31:0] capsule0lz = 32'b01000000010000000000000000000000;		//3
wire[31:0] capsule0radius = 32'b00111111000000000000000000000000;	//0.5
wire[31:0] capsule0r2 = 32'b00111111000011101110101001100100; 		//0.558264
wire[31:0] capsule0r6 = 32'b10111111010000000100000000000111; 		//-0.750977
wire[31:0] capsule0r10 = 32'b00111110101101001001000100001000; 	//0.352669

wire[31:0] capsule0a0, capsule0a1, capsule0a2, capsule0a3, capsule0a4, capsule0a5;
capsule_computeAABB capsule0(
	.clk(CLK),
	.rst(rst),
	.x(capsule0x), 
	.y(capsule0y), 
	.z(capsule0z),
	.lz(capsule0lz),
	.radius(capsule0radius),
	.r2(capsule0r2), 
	.r6(capsule0r6), 
	.r10(capsule0r10),
	.aabb0(capsule0a0), 
	.aabb1(capsule0a1), 
	.aabb2(capsule0a2), 
	.aabb3(capsule0a3), 
	.aabb4(capsule0a4), 
	.aabb5(capsule0a5),
	.done(done_capsule)
);


endmodule