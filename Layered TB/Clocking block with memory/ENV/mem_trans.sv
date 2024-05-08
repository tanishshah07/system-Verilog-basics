////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : TANISH_SHAH
//File_Name    : mem_trans.sv
//File_Path    : 
//Class_Name   : mem_trans               
//Project_Name : Dual_Port_Ram
//Description  :
//
/////////////////////////////////////////////////
`ifndef TRANS_SV
`define TRANS_SV

class mem_transx;
rand funct fnx_e;
//static bit flag;
 //bit wr_en,rd_en;
rand bit [`ADDR_WID-1:0] rd_addr,wr_addr;
rand bit [`DATA_WID-1:0] wr_data;
bit [`DATA_WID-1:0] rd_data;

constraint con1{
  if(fnx_e==3) {
    rd_addr!=wr_addr;
  }
  fnx_e!=4;
}

task dis(input string str);
 $display("#########################################################################");
 $display("DISPLAY CALLED In %s",str);
 $display("NAME______________DATA________________TIME");
 $display("Function          %4s		%0t",fnx_e.name,$time);
 $display("READ Adds         %4b		%0t",rd_addr,$time);
 $display("WRITE Adds        %4b		%0t",wr_addr,$time);
 $display("READ  DATA        %4b		%0t",rd_data,$time);
 $display("WRITE  DATA       %4b		%0t",wr_data,$time);
 $display("#########################################################################");

endtask

endclass

`endif
