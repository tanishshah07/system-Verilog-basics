`ifndef GEN_SV
`define GEN_SV
class mem_gen;
mem_transx trans;
mailbox #(mem_transx) gen2drv;
function new(mailbox #(mem_transx) gen2drv);
 this.gen2drv=gen2drv;
endfunction


 task run_phase();
// $display("perfect skeleton till top side of generatiro");
  repeat(3) begin
   trans=new();
   //if(!trans.randomize()) $error("randomization is failed");
   trans.randomize() with {trans.fnx_e==3;};
           //wait(trans.flag==0);
	   gen2drv.put(trans);
	   @(item);
	   //trans.flag=1;
//	   $display("inside gen");
  //#1;
  //$display("perfect skeleton till generator %b",trans.wr_data);
   //trans.dis("generator");
  end
 endtask

endclass
`endif
