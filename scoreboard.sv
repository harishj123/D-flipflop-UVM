//class declaration
class dff_scoreboard extends uvm_scoreboard;
  //factory registration
  `uvm_component_utils(dff_scoreboard)

  uvm_analysis_imp #(dff_seq_item, dff_scoreboard) item_collected_export;

  //constructor
  function new(string name = "dff_scoreboard", uvm_component parent);
    super.new(name, parent);
    `uvm_info("score board class","constructor",UVM_NONE)
  endfunction
  
  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    item_collected_export = new("item_collected_export", this);
  endfunction

  //write function
  function void write(dff_seq_item res);
    if(res.rst==0 && res.dout==0) begin
      $error("Test Passed result = time:%0t din:%0b dout:%0b rst:%0b ",$time, res.din, res.dout,res.rst );
        end
    else begin
      if(res.dout == res.din) begin
      $display("Test Passed result = time:%0t din:%0b dout:%0b rst=%0b",$time, res.din, res.dout,res.rst );
    end
      end
  endfunction
endclass
