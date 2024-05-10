////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : TANISH_SHAH
//File_Name    : apb_gen.sv
//File_Path    : 
//Class_Name   : apb_gen               
//Project_Name : APB SLAVE
//Description  :
//
/////////////////////////////////////////////////
`ifndef GEN_SV
`define GEN_SV
 class apb_gen;
  apb_trans trans;
  mailbox #(apb_trans) gen2drv;
 
 function void connect(mailbox #(apb_trans) gen2drv);
	 this.gen2drv=gen2drv;
 endfunction
 
task put_wait();
 gen2drv.put(trans);
 @(item_done);
endtask	

 task run_phase();
  repeat(no_of_trans) begin
   trans=new();
   if(!trans.randomize() with {trans.fnx_e==1;}) $fatal("Randomization Fails");
   trans.dis("generator");
   put_wait();
  end
 endtask
 
 endclass
`endif
