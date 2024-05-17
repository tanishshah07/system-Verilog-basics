`ifndef RFM_SV
`define RFM_SV

class mem_rfm;
 mem_transx trans;

 mailbox #(mem_transx) mon2rfm;
 mailbox #(mem_transx) rfm2scr;

bit [`DATA_WID-1:0] ram_rf [0:`DEP-1];
 function void connect(mailbox #(mem_transx) mon2rfm,rfm2scr);
 this.mon2rfm=mon2rfm; 
 this.rfm2scr=rfm2scr;
 trans=new();
 endfunction

task run_phase();
forever begin
 // raise_obj("RFM");	
  mon2rfm.get(trans);
 //mailbox returns the value can be used as a checker 
  raise_obj("RFM");	
  //#1;
 // $display("inside ref");
  trans.dis("RFM");
   if(trans.fnx_e==1) begin
     ram_rf[trans.wr_addr]=trans.wr_data;
   end

   if(trans.fnx_e==2) begin
      trans.rd_data=ram_rf[trans.rd_addr];
   end
   if(trans.fnx_e==3) begin
    ram_rf[trans.wr_addr]=trans.wr_data;
    trans.rd_data=ram_rf[trans.rd_addr];
   end
   if(trans.fnx_e==4) begin
	   //$display("inside 4");
	   foreach(ram_rf[i]) begin
	     ram_rf[i]=0;
	   end
   end

  //drop_obj("DRERFM");

  $display("count decremeted");
  rfm2scr.put(trans);
  drop_obj("DRERFM");
  end

 //#1;
  //$display("perfect skeleton till RFM %b",trans.wr_data);
 endtask
endclass

`endif
