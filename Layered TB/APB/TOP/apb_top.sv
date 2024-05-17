////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : TANISH_SHAH
//File_Name    : apb_top.sv
//File_Path    : 
//Module_Name   : apb_top              
//Project_Name : APB SLAVE
//Description  :
//
/////////////////////////////////////////////////
`ifndef TOP_SV
`define TOP_SV
`include "apb_def.sv"
`include "apb_intf.sv"

module apb_top();

import pkg::*;

bit pclk;
bit prstn;


apb_intf intf(pclk,prstn);
apb_test test;

 APB_slave dut(.pslverr(intf.pslverr),
               .pready(intf.pready),
	       .prdata(intf.prdata),
               .psel(intf.psel),
               .penable(intf.penable),
               .pwrite(intf.pwrite),
               .presetn(prstn),
               .pclk(pclk),
               .paddr(intf.paddr),
               .pwdata(intf.pwdata));

initial begin
//#20;
fork
reset();
run_test();
join
end

initial begin
 forever begin
  #5 pclk=~pclk;
 end
end

//initial begin
// prstn=0;
// #10;
// prstn=1; //for testing purpose FIX_MEE
//end

initial begin
 forever begin
  @(reset_on);
  reset();
 end

end

task reset();
 #SKW_T;
 prstn=0;
 #20;
 prstn=1;
endtask

task run_test();
 test=new();
 test.build();
 test.connect(intf);
 test.run_phase();
 #10;
 $finish;
endtask
endmodule
`endif
