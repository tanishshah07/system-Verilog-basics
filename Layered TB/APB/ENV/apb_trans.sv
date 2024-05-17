////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : TANISH_SHAH
//File_Name    : apb_trans.sv
//File_Path    : 
//Class_Name   : apb_trans               
//Project_Name : APB SLAVE
//Description  :
//
/////////////////////////////////////////////////
`ifndef TRANS_SV
`define TRANS_SV

class apb_trans;
rand funct fnx_e; //functional enum
rand bit [AW-1:0] paddr;  
rand bit [DW-1:0] pwdata;
bit [DW-1:0] prdata;
//bit pwrite=fnx_e; //$cast ??
bit pwrite;
bit pslverr;
constraint invalid_addr{
 paddr inside {[0:20]};
}
constraint reset_not_randomize{
  fnx_e!=2;
}
function void post_randomize();
 $cast(pwrite,fnx_e);
endfunction
task dis(input string str="trancistion");
$display("#########################################");
 $display("inside class %s",str);
 $display("TIME__________________________NAME__________________DATA");
 $display($time,"\tFunction\t\t%s",fnx_e.name);
 $display($time,"\tpaddr\t\t%b",paddr);
 $display($time,"\tpwrite\t\t%b",pwrite);
 $display($time,"\tpslverr\t\t%b",pslverr);
 $display($time,"\tpwdata\t\t%b",pwdata);
 $display($time,"\tprdata\t\t%b",prdata);
$display("#########################################");
endtask


endclass
`endif
