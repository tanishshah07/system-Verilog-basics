////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : TANISH_SHAH
//File_Name    : afifo_gen.sv
//File_Path    : 
//Class_Name   : afifo_gen               
//Project_Name : Asyncronous_FIFO
//Description  :
//
/////////////////////////////////////////////////
`ifndef GEN_SV
`define GEN_SV
 class afifo_gen;
  afifo_trans trans;
 local mailbox #(afifo_trans) gen2drv;
 
 function void connect(mailbox #(afifo_trans) gen2drv);
	 this.gen2drv=gen2drv;
 endfunction
  
 
 endclass
`endif
