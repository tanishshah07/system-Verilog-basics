////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : TANISH_SHAH
//File_Name    : apb_def.sv
//File_Path    : 
//Class_Name   : apb_def               
//Project_Name : APB SLAVE
//Description  :
//
/////////////////////////////////////////////////
`ifndef DEF_SV
`define DEF_SV
typedef enum {read,write,IDLE} funct;
parameter DEP=32,
	  AW = 5,
	  DW = 32;
parameter SKW_T =1; 
`endif


