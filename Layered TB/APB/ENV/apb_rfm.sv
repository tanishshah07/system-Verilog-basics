////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : TANISH_SHAH
//File_Name    : apb_rfm.sv
//File_Path    : 
//Class_Name   : apb_rfm              
//Project_Name : APB SLAVE
//Description  :
//
/////////////////////////////////////////////////
`ifndef RFM_SV
`define RFM_SV

class apb_rfm;
 apb_trans trans;
 mailbox #(apb_trans) mon2rfm;
 mailbox #(apb_trans) rfm2scr;

//refrence memory
bit [DW-1:0] mem_r [0:DEP-22];
 function void connect(mailbox #(apb_trans) mon2rfm,mailbox #(apb_trans) rfm2scr);
    this.mon2rfm=mon2rfm;
    this.rfm2scr=rfm2scr;
    trans=new();
 endfunction

 task run_phase();
  
  forever begin
     mon2rfm.get(trans);
     rfm();
     rfm2scr.put(trans);
     trans.dis("inside RFM");
  end
 endtask

 task rfm();
  if(trans.fnx_e==2) begin
     mem_r[trans.paddr]=trans.pwdata;
  end
  else if(trans.fnx_e==1) begin
     trans.prdata=mem_r[trans.paddr];
  end
 endtask
  
endclass
`endif
