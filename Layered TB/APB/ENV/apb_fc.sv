////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : TANISH_SHAH
//File_Name    : apb_fc.sv
//File_Path    : 
//Class_Name   : apb_fc              
//Project_Name : APB SLAVE
//Description  :
//
/////////////////////////////////////////////////
`ifndef FC_SV
`define FC_SV


class apb_fc;
apb_trans trans;
mailbox #(apb_trans) mon2fc;

virtual task connect(mailbox #(apb_trans) mon2fc);
 this.mon2fc=mon2fc;
endtask

virtual task run_phase();
 forever begin
  mon2fc.get(trans);
  trans.dis("in FC");
 end
endtask
endclass

`endif
