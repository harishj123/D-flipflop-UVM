//class declaration
class dff_seq extends uvm_sequence #(dff_seq_item);
  //factory registration
  `uvm_object_utils(dff_seq)

  dff_seq_item seq_item;
  
  //constructor
  function new(string name = "dff_seq");
    super.new(name);
    `uvm_info("dff_seq","constructor",UVM_NONE)
  endfunction
  
  //task body
  task body();
    repeat(20) begin
      seq_item = dff_seq_item::type_id::create("seq_item");
      start_item(seq_item);
      seq_item.din = $urandom_range(1, 0);
      finish_item(seq_item);
    end
  endtask
endclass
