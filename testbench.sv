`include "uvm_macros.svh"
//including uvm macros
import uvm_pkg::*;
//including uvm packages

`include "interface.sv"
`include "seq_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "env.sv"
`include "test.sv"

module dff_tb_top;
  logic clk;

  // interface
  dff_interface vif(clk);

  //Instantiation
  dff dut (
    .clk(vif.clk),
    .rst(vif.rst),
    .din(vif.din),
    .dout(vif.dout)
  );

  //config_db
  initial begin
    uvm_config_db#(virtual dff_interface)::set(null, "uvm_test_top.env.agent.driver", "vif", vif);
    uvm_config_db#(virtual dff_interface)::set(null, "uvm_test_top.env.agent.monitor", "vif", vif);
  end

  
  //clock generation
  initial begin
    clk = 0;
    vif.din = 0;    
    forever #5 clk = ~clk;
  end

  //reset generation
  initial begin
    vif.rst = 0; 
    #10 vif.rst = 1;
    #100 vif.rst = 0;
  end

  //monitor statements
  initial begin
    $monitor($time, " rst = %0b, clk = %0b, din = %0b, dout = %0b", vif.rst, clk, vif.din, vif.dout);
  end

  //run test
  initial begin 
    run_test("dff_test");
  end
  
  //dump waveform 
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,dut);
  end

endmodule
