module debouncing(key, keyS,clock);
input key, clock;
output reg keyS;
reg [31:0] count;
reg estado;

always @(posedge clock)begin
	if(key == 0)//Botao apertado
		estado = 1;
	else if(key == 1)
		estado = 0;
	count = count + 1;
	if(estado == 0)//se o botao ta solto
		count = 0;	
		
	if(count >= 50000)
		keyS <= 1;
	else
		keyS <= 0;
	
end

endmodule
   