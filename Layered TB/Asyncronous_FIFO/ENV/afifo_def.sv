////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : TANISH_SHAH
//File_Name    : afifo_def.sv
//File_Path    : 
//Class_Name   : afifo_def               
//Project_Name : Asyncronous_FIFO
//Description  :
//
/////////////////////////////////////////////////
`ifndef DEF_SV
`define DEF_SV
typedef enum {IDLE,write,read} funct;
parameter DEP=16, //depth of fifo
	  DW=4;   //width of fifo
  
`endif

