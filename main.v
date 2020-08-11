module clk_generator(input clk,input [10:0] freq,output reg sound);
reg[29:0] count;
initial count<=0;
always @(posedge(clk)) begin
	if(count>=(10000.00/freq)) begin

	       	sound=0;
		count<=0;
	end
	else if(count>=(10000.00/(2*freq))) begin
		sound<=1;
		count<=count+1;
	end
	else begin
		count<=count+1;
		sound<=0;
	end
   end
	
endmodule
module synthesiser(input clk,input [10:0] keys,input rec,output sound,output reg[128:0] record,output signed [10:0] freq_o) ;
reg [6:0] cnt;
assign freq_o=freq;
reg signed [10:0]  freq;
initial begin 
freq=1;
cnt=0;
record=0;
end
clk_generator gen(clk,freq,sound);
always @( sound) begin
	if(rec) begin 
	if(cnt==(128)) cnt<=0;
	else begin record[cnt]<=sound;
	cnt<=cnt+1;
	end
	end		
	if(keys==0) begin freq=1; end
	else if (keys==11'b00000000001) begin
		freq=246.94;
	end
	else if (keys==11'b00000000010) begin
		freq=233.08;
	end
	else if (keys==11'b00000000100) begin
		freq=220;
	end	
	else if (keys==11'b00000001000) begin
		freq=207.65;
	end	
	else if (keys==11'b00000010000) begin
		freq=196;
	end
	
	else if (keys==11'b00000100000) begin
		freq=185;
	end
					
	else if (keys==11'b00001000000) begin
		freq=174.61;
	end

	else if (keys==11'b00010000000) begin
		freq=164.81;
	end

	else if (keys==11'b00100000000) begin
		freq=155.56;
	end

	else if(keys==11'b01000000000) begin
		freq=146.83;
	end
        
       else if (keys==11'b10000000000) begin
		freq=138.59;
	end
end




endmodule
