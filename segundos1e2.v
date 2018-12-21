module segundos1e2(clock1, clock, KEY3, SW17, clockOUT, a, b, c, d, e, f, g);

input KEY3, clock1, clock, SW17;
output reg clockOUT, a, b, c, d, e, f, g;
reg estado;
reg [31:0]count;
reg [3:0]segundo;

initial count = 0;
initial clockOUT = 0;

always @(posedge clock) begin	
	if(KEY3 == 0 && SW17==0)
		estado = 0;
	else if(KEY3 == 1 && SW17==0)
		estado = 1;	
end


	
always @(posedge clock) begin

	case(clock1)
		1 :	count = count + 1;
	endcase
	
	case(estado)
		0 : begin				
				if(count == 1)begin
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