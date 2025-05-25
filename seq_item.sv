//class declaration
class dff_seq_item extends uvm_sequence_item;
  //factory registration
  `uvm_object_utils(dff_seq_item)
  //initializing inputs
  rand bit rst;
  rand bit din;
  bit dout;
  
  //constructor
  function new(string name = "dff_seq_item");
    super.new(name);
    `uvm_info("dff_seq_item","constructor",UVM_NONE)
  endfunction
endclass
