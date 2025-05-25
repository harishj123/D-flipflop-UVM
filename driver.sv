//class declaration
class dff_driver extends uvm_driver #(dff_seq_item);
  // Factory registration
  `uvm_component_utils(dff_driver)

  virtual dff_interface vif;
  dff_seq_item seq_item;
  
  // Constructor
  function new(string name = "dff_driver", uvm_component parent);
    super.new(name, parent);
    `uvm_info("dff_driver", "constructor", UVM_NONE)
  endfunction

  // Build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db #(virtual dff_interface)::get(this, "", "vif", vif)) begin
      `uvm_fatal("NO_VIF", "Virtual interface not found")
    end
  endfunction

  // Run phase
  task run_phase(uvm_phase phase);
    forever begin
      seq_item_port.get_next_item(seq_item);
      drive();
      seq_item_port.item_done();
    end
  endtask : run_phase

  // Drive task
  task drive();
    @(posedge vif.clk);
    //vif.rst = seq_item.rst; 
    vif.din = seq_item.din;
  endtask
endclass
