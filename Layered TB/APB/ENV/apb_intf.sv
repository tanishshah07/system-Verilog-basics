////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : TANISH_SHAH
//File_Name    : apb_intf.sv
//File_Path    : 
//InterfaceName: apb_intf              
//Project_Name : APB SLAVE
//Description  :
//
/////////////////////////////////////////////////


`ifndef INF_SV
`define INF_SV
 
interface apb_intf(input pclk,prstn);
 logic [4:0] paddr;
 logic [31:0] pwdata,prdata;
 logic pwrite;
 logic psel;
 logic penable;
 logic pready;
 logic pslverr;

clocking drv_cb@(posedge pclk);
  default input #1 output #1;
  output psel,penable,pwrite;
  output pwdata,paddr;
  input pready,prstn;

endclocking

clocking mon_cb@(posedge pclk);
  default input #1 output #1;
  input psel,penable,pwrite,pready;
  input pwdata,paddr;
endclocking

//modport DRV(clocking drv_cb);
//modport MON(clocking mon_cb);
endinterface
`endif
