`ifndef INF_SV
`define INF_SV
interface mem_intf(input bit clk,rst);
logic wr_enb,rd_enb;
//logic [`ADDR_WID-1:0] rd_addr,wr_addr;
//logic [`DATA_WID-1:0] rd_data,wr_data;
logic [3:0] rd_addr,wr_addr;
logic [7:0] rd_data,wr_data;

//logic rst=0; //for skeleton zero



clocking drv_cb@(posedge clk);
  default input #0 output #1;
  input rst;
  output wr_enb,rd_enb;
  output rd_addr,wr_addr;
  output wr_data; 
endclocking

clocking mon_cb@(posedge clk);
  default input #1 output #1;
  input wr_enb,rd_enb,rst;
  input rd_addr,wr_addr;
  input wr_data,rd_data; 
endclocking

//modport drv(clocking drv_cb);
endinterface
`endif