module digit0to9(clock, a, b, c, d, e, f, g, clockOut, ativador);
input clock;
input ativador;
output reg clockOut, a, b, c, d, e, f, g;
reg [31:0] count;
reg [3:0] estado;

always @(posedge clock) begin
	count = count + 1;
	if(count < 1)
		estado = 0;
	else
		if(count < 2)
			estado = 1;
	else
		if(count < 3)
			estado = 2;
	else
		if(count < 4)
			estado = 3;
	else
		if(count < 5)
			estado = 4;
	else
		if(count < 6)
			estado = 5;
	else
		if(count < 7)
			estado = 6;
	else
		if(count < 8)
			estado = 7;
	else
		if(count < 9)
			estado = 8;
	else
		if(count < 10)begin
			estado = 9;	
			clockOut = 0;
	end
	else begin
			estado = 0;
			clockOut = 1;
	end
end
always @(estado) begin
	case(estado)
	0 : begin a <= 0 ; b <= 0 ; c <= 0 ; d <= 0 ; e <= 0 ; f <= 0 ; g <= 1 ;end
	1 : begin a <= 0 ; b <= 0 ; c <= 1 ; d <= 1 ; e <= 1 ; f <= 1 ; g <= 1 ;end
	2 : begin a <= 0 ; b <= 1 ; c <= 0 ; d <= 0 ; e <= 1 ; f <= 0 ; g <= 0 ;end
	3 : begin a <= 0 ; b <= 0 ; c <= 0 ; d <= 1 ; e <= 1 ; f <= 0 ; g <= 0 ;end
	4 : begin a <= 0 ; b <= 0 ; c <= 1 ; d <= 1 ; e <= 0 ; f <= 1 ; g <= 0 ;end
	5 : begin a <= 1 ; b <= 0 ; c <= 0 ; d <= 1 ; e <= 0 ; f <= 0 ; g <= 0 ;end
	6 : begin a <= 1 ; b <= 0 ; c <= 0 ; d <= 0 ; e <= 0 ; f <= 0 ; g <= 0 ;end
	7 : begin a <= 0 ; b <= 0 ; c <= 1 ; d <= 1 ; e <= 1 ; f <= 0 ; g <= 1 ;end
	8 : begin a <= 0 ; b <= 0 ; c <= 0 ; d <= 0 ; e <= 0 ; f <= 0 ; g <= 0 ;end
	9 :	begin a <= 0 ; b <= 0 ; c <= 0 ; d <= 1 ; e <= 0 ; f <= 0 ; g <= 0 ;end
	endcase
end
endmodule