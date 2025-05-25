//class declaration
class dff_agent extends uvm_agent;
  //factory registration
  `uvm_component_utils(dff_agent)
   //handle
  dff_driver driver;
  dff_monitor monitor;
  dff_sequencer sequencer;

  //constructor
  function new(string name = "dff_agent", uvm_component parent);
    super.new(name, parent);
    `uvm_info("dff_agent","constructor",UVM_NONE)
  endfunction

  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (get_is_active() == UVM_ACTIVE) begin
      driver = dff_driver::type_id::create("driver", this);
      sequencer = dff_sequencer::type_id::create("sequencer", this);
    end
    monitor = dff_monitor::type_id::create("monitor", this);
  endfunction

  //connect phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    if (get_is_active()) begin
      driver.seq_item_port.connect(sequencer.seq_item_export);
    end
  endfunction
endclass
