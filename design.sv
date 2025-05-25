// Code your design here
module dff(
  input clk,
  input rst,
  input din,
  output reg dout
);
  
  always @(posedge clk or negedge clk)
    begin
      if(!rst) begin
        dout <= 0;
      end
      else begin
        dout <= din;
      end
    end
endmodule
