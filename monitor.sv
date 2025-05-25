//class declaration
class dff_monitor extends uvm_monitor;
  //factory registration
  `uvm_component_utils(dff_monitor)

  //virtualize interface
  virtual dff_interface vif;
  uvm_analysis_port #(dff_seq_item) monitor_analysis_port;
  dff_seq_item seq_item;
  
  //constructor
  function new(string name = "dff_monitor", uvm_component parent);
    super.new(name, parent);
    `uvm_info("dff_monitor","constructor",UVM_NONE)
  endfunction:new

  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    monitor_analysis_port = new("monitor_analysis_port", this);
    if (!uvm_config_db #(virtual dff_interface)::get(this, "", "vif", vif)) begin
      `uvm_fatal("NO_VIF", "Virtual interface not found")
    end
  endfunction:build_phase

  //run phase
  task run_phase(uvm_phase phase);
    forever begin
      @(posedge vif.clk);
      seq_item = dff_seq_item::type_id::create("seq_item");
      seq_item.rst = vif.rst;
      seq_item.din = vif.din;
      seq_item.dout = vif.dout;
      monitor_analysis_port.write(seq_item);
    end
  endtask:run_phase
endclass
