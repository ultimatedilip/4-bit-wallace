`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.02.2021 15:51:08
// Design Name: 
// Module Name: wallace
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


module wallace(
  input [3:0]a,
  input [3:0]b,
  output [7:0]prod
    ); 
  reg [3:0]PP1,PP2,PP3,PP4;
  wire HAC1,HAC2,HAC3,HAC4;
  wire HAS1,HAS2,HAS3,HAS4;
  wire FAC1,FAC2,FAC3,FAC4,FAC5,FAC6,FAC7,FAC8;
  wire FAS1,FAS2,FAS3,FAS4,FAS5,FAS6,FAS7,FAS8;
   always@(*) begin
     PP1={a[3]&&b[0],a[2]&&b[0],a[1]&&b[0],a[0]&&b[0]};
     PP2={a[3]&&b[1],a[2]&&b[1],a[1]&&b[1],a[0]&&b[1]};
     PP3={a[3]&&b[2],a[2]&&b[2],a[1]&&b[2],a[0]&&b[2]};
     PP4={a[3]&&b[3],a[2]&&b[3],a[1]&&b[3],a[0]&&b[3]};
   end  

////stage 1///////   
  HA h1 (PP1[2],PP2[1],HAS1,HAC1);
  FA f1 (PP1[3],PP2[2],PP3[1],FAS1,FAC1);
  FA f2 (PP2[3],PP3[2],PP4[1],FAS2,FAC2);
////stage 2/////
  HA h2 (FAS1,PP4[0],HAS2,HAC2);
  HA h3 (FAS2,FAC1,HAS3,HAC3);
  FA f3 (PP3[3],PP4[2],FAC2,FAS3,FAC3);
/////stage 3///////
  HA h4 (PP1[1],PP2[0],HAS4,HAC4);
  FA f4 (HAS1,PP3[0],HAC4,FAS4,FAC4);
  FA f5 (HAS2,HAC1,FAC4,FAS5,FAC5);
  FA f6 (HAS3,HAC2,FAC5,FAS6,FAC6);
  FA f7 (FAS3,HAC3,FAC6,FAS7,FAC7);
  FA f8 (PP4[3],FAC3,FAC7,FAS8,FAC8);
  
  assign prod= {FAC8,FAS8,FAS7,FAS6,FAS5,FAS4,HAS4,PP1[0]};
endmodule
/////////HALF ADDER DECLARATION///////
module HA(a,b,sum,carry);
    input a,b;
    output sum,carry;

    assign sum= a^b;
    assign carry= a&&b;
endmodule
////////FULL ADDER DECLARATION////////
module FA(a,b,cin,sum, carry);
    input a,b,cin;
    output sum,carry;

    assign sum= a^b^cin;
    assign carry= (a&&b)||(cin&&(a^b));
endmodule