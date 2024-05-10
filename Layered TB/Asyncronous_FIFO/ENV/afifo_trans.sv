////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : TANISH_SHAH
//File_Name    : afifo_trans.sv
//File_Path    : 
//Class_Name   : afifo_trans               
//Project_Name : Asyncronous_FIFO
//Description  :
//
/////////////////////////////////////////////////
`ifndef TRANS_SV
`define TRANS_SV

class afifo_trans;
rand funct fnx_e; //functional enum
rand bit [DW-1:0] data_in;  
bit [DW-1:0] data_out;
//flags
bit full,empty,hf,ame,amf,of,uf;

task dis(input string str);
$display("#########################################");
 $display("inside class %s",str);
 $display("TIME________NAME_______DATA");
 $display($time,"Function\t\t%s",fnx_e.name);
 $display($time,"Data_in\t\t%b",data_in);
 $display($time,"Data_out\t\t%b",data_out);
 $display($time,"Full\t\t%b",full);
 $display($time,"empty\t\t%b",empty);
 $display($time,"almost empty\t\t%b",ame);
 $display($time,"almost full\t\t%b",amf);
 $display($time,"overflow\t\t%b",of);
 $display($time,"underflowflow\t\t%b",uf);
$display("#########################################");
endtask
endclass
`endif
