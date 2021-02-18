`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.02.2021 16:15:50
// Design Name: 
// Module Name: test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module test();
reg clk;
reg [3:0]a,b;
wire [7:0]prod;
wallace w1 (a,b,prod);
initial begin
clk=0;
a=4'b0000;
b=4'b0000;
end
always  #1 clk=!clk;
integer i,j;
always@(posedge clk)
begin
for(i=1;i<=15;i=i+1)begin
    #20 a=i;
    for(j=1;j<=i;j=j+1)begin
     #20  b=j; 
      end
    end
$display("%b,%b,%b,%b",w1.PP1,w1.PP2,w1.PP3,w1.PP4);
end
endmodule

