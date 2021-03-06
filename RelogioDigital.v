module RelogioDigital(clock, SW17, SW16, SW15, SW14, KEY1, KEY2, KEY3, HIGHR);
input clock;
input SW17, SW16, SW15, SW14;
input KEY1, KEY2, KEY3;
output reg HIGHR;
reg [1:0]modo;
reg [3:0]estado;
reg [32:0] hora, minuto, segundo;
// modo 0 = relogio		:	estado 0 = seta horas		
// modo 1 = cronometro	:	estado 1 = seta minutos
//						:	estado 2 = seta segundos


always @(posedge clock) begin
	if(SW17 == 1)
		modo = 1 ;
	else if(SW17 == 0)
		modo = 0 ;			
	
	if(modo == 1 && SW16==0)
		estado = 0;
	else if((modo == 1 && SW15==0))
		estado = 1;
	else if((modo == 1 && SW14==0)) begin
		segundo = 0;
		estado = 2;	
	end	
end

always @ (posedge KEY1) begin
	case(estado)
		0 : hora <= hora+1;
		1 : minuto <= minuto + 1;
	endcase
end

always @ (posedge KEY2) begin
	case(estado)
		0 : hora <= hora - 1;
		1 : minuto <= minuto - 1;
	endcase
end
always @(posedge clock) begin
	case(modo)
		0 : HIGHR <= 0;
		1 : HIGHR <= 1;
	endcase		
end
endmodule