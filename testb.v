`timescale 1ms/1us
module testbench();
reg clk,rec;
reg [10:0] keys;
wire sound;
wire[10:0] freq;
wire[128:0] record;

synthesiser synth(clk,keys,rec,sound,record,freq);
initial begin
clk=0;
rec=1;
keys=11'b00000000000;
end
initial 
begin


$dumpfile("synthesiser.vcd");
$dumpvars;
end
always #0.5 clk=~clk;
initial begin
$monitor($time,"Freq: %b",record);
#1000 keys=11'b00000000001;
#5000 rec=0;

#8000 keys=11'b00000000010;
#10000 keys=11'b00000000010;
#11000  keys=11'b00000000100;
#12000 keys=11'b00000001000;
#13000 keys=11'b00000010000;
#14000 keys=11'b00000100000;
#15000 keys=11'b00001000000;
#16000 keys=11'b00010000000;
#17000 keys=11'b00100000000;
#18000 $finish;

end
endmodule
