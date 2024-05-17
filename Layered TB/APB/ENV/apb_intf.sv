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
 logic [AW-1:0] paddr;
 logic [DW-1:0] pwdata,prdata;
 logic pwrite;
 logic psel;
 logic penable;
 logic pready;
 logic pslverr;

clocking drv_cb@(posedge pclk);
  default input #SKW_T output #SKW_T;
  output psel,penable,pwrite;
  output pwdata,paddr;
  input pready,prstn;

endclocking

clocking mon_cb@(posedge pclk);
  default input #SKW_T output #SKW_T;
  input psel,penable,pwrite,pready,prstn,pslverr;
  input pwdata,paddr,prdata;
endclocking

modport DRV(clocking drv_cb);
modport MON(clocking mon_cb);
endinterface
`endif
