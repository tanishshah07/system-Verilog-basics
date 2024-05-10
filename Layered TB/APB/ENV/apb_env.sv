////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : TANISH_SHAH
//File_Name    : apb_env.sv
//File_Path    : 
//Class_Name   : apb_env              
//Project_Name : APB SLAVE
//Description  :
//
/////////////////////////////////////////////////
`ifndef ENV_SV
`define ENV_SV
 class apb_env;
  //mailboxes
  mailbox #(apb_trans) gen2drv=new();
  mailbox #(apb_trans) mon2rfm=new();
  mailbox #(apb_trans) mon2scr=new();
  mailbox #(apb_trans) rfm2scr=new();

  
  // components
  apb_gen gen;
  apb_drv drv;
  apb_mon mon;
  apb_rfm rfm;
  //apb_scr scr;

  function void build();
    gen=new();
    drv=new();
    mon=new();
    rfm=new();
    //scr=new();
  endfunction

  function void connect(virtual apb_intf vif);
   gen.connect(gen2drv);
   drv.connect(gen2drv,vif);
   mon.connect(mon2rfm,mon2scr,vif);
   rfm.connect(mon2rfm,rfm2scr);
   //scr.connect(mon2scr,rfm2scr);
  endfunction

  task run_phase();
   fork
     gen.run_phase();
     drv.run_phase();
     mon.run_phase();
     rfm.run_phase();
     //scr.run_phase();
   join_any
  endtask
 
 endclass
`endif

