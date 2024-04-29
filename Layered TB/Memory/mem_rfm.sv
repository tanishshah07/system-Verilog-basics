`ifndef RFM_SV
`define RFM_SV

class mem_rfm;
 mem_transx trans;

 mailbox #(mem_transx) mon2rfm;
 mailbox #(mem_transx) rfm2scr;

bit [`DATA_WID-1:0] ram_rf [0:`DEP-1];
 function new(mailbox #(mem_transx) mon2rfm,rfm2scr);
 this.mon2rfm=mon2rfm; 
 this.rfm2scr=rfm2scr;
 trans=new();
 endfunction

 task run_phase();
forever begin 
  mon2rfm.get(trans);
  
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

  rfm2scr.put(trans);
  end

 //#1;
  //$display("perfect skeleton till RFM %b",trans.wr_data);
 endtask
endclass

`endif
