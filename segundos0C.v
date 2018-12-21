module segundos0C(clock, KEY0, KEY1, clockOUT, SW17, a, b, c, d, e, f, g);

input KEY0, KEY1, clock, SW17;
output reg clockOUT, a, b, c, d, e, f, g;
reg estado, stop, jafoi;
reg [31:0]count;
reg [3:0]segundo;
//KEY 1 PAUSA
//KEY 0 RESETA
initial count = 0;
initial clockOUT = 0;
initial stop = 0;
initial jafoi = 1;
always @(posedge clock) begin	
	if(KEY0 == 0 && SW17 == 0)
		estado = 0;
	else if(KEY0 == 1 && SW17 == 0)
		estado = 1;	
		
	if(KEY1 == 1 && jafoi == 1 && SW17 == 0)begin
		stop = ~stop;
		jafoi = 0;
	end	else
		if(KEY1 == 0 && SW17 == 0)
			jafoi = 1;
		else if(SW17 == 1)
				jafoi = 1;
end

always @(posedge clock ) begin
	case(estado)
		0 : begin
				if(stop)begin
					count = count + 1;
					if(count >= 500000)begin
						segundo = segundo + 1; 
						count = 0;
						end
					if(segundo == 10)begin
						clockOUT = 1;
						segundo = 0;
						end
					else
						clockOUT = 0;
				end
			end			
		1 : begin
				segundo = 0;
			end
				
	endcase
	
	case(segundo)
		0 : begin a <= 0 ; b <= 0 ; c <= 0 ; d <= 0 ; e <= 0 ; f <= 0 ; g <= 1 ;end
		1 : begin a <= 1 ; b <= 0 ; c <= 0 ; d <= 1 ; e <= 1 ; f <= 1 ; g <= 1 ;end
		2 : begin a <= 0 ; b <= 0 ; c <= 1 ; d <= 0 ; e <= 0 ; f <= 1 ; g <= 0 ;end
		3 : begin a <= 0 ; b <= 0 ; c <= 0 ; d <= 0 ; e <= 1 ; f <= 1 ; g <= 0 ;end
		4 : begin a <= 1 ; b <= 0 ; c <= 0 ; d <= 1 ; e <= 1 ; f <= 0 ; g <= 0 ;end
		5 : begin a <= 0 ; b <= 1 ; c <= 0 ; d <= 0 ; e <= 1 ; f <= 0 ; g <= 0 ;end
		6 : begin a <= 0 ; b <= 1 ; c <= 0 ; d <= 0 ; e <= 0 ; f <= 0 ; g <= 0 ;end
		7 : begin a <= 0 ; b <= 0 ; c <= 0 ; d <= 1 ; e <= 1 ; f <= 1 ; g <= 1 ;end
		8 : begin a <= 0 ; b <= 0 ; c <= 0 ; d <= 0 ; e <= 0 ; f <= 0 ; g <= 0 ;end
		9 :	begin a <= 0 ; b <= 0 ; c <= 0 ; d <= 0 ; e <= 1 ; f <= 0 ; g <= 0 ;end
	endcase
	
end
endmodule