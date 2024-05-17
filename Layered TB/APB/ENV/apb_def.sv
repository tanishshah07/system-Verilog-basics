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
typedef enum {pread,pwrite,prstn} funct;
parameter DEP=32,
	  AW = 5,
	  DW = 32;
parameter TIME_OUT=20;  
parameter SKW_T =1; 
`endif
