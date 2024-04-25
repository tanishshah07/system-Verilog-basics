`ifndef TRANS_SV
`define TRANS_SV

class mem_transx;
rand funct fnx_e;
//static bit flag;
 //bit wr_en,rd_en;
rand bit [`ADDR_WID-1:0] rd_addr,wr_addr;
rand bit [`DATA_WID-1:0] wr_data;
bit [`DATA_WID-1:0] rd_data;


task dis();
 $display("#########################################################################");
 $display("NAME______________DATA___________________________________TIME");
 $display("Function          %0s                       %t",fnx_e.name,$time);
 $display("READ Adds         %0b                       %t",rd_addr,$time);
 $display("WRITE Adds        %0b                       %t",wr_addr,$time);
 $display("READ  DATA        %0b                       %t",rd_data,$time);
 $display("WRITE  DATA       %0b                       %t",wr_data,$time);
 $display("#########################################################################");

endtask

endclass

`endif
