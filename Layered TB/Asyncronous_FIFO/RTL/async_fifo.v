module async_fifo(wclk,rclk,rstn,w_en,r_en,data_in,data_out,full,uf,of,empty,hf,ame,amf);
parameter DEP=16, //depth of fifo
	  DW=4;   //width of fifo
input wire           wclk,rclk,rstn,w_en,r_en;
input wire  [DW-1:0] data_in;
output reg  [DW-1:0] data_out;
output reg           full,empty,ame,amf;
output wire          hf,uf,of;

reg [DW:0] w_ptr,r_ptr,gw_ptr,gr_ptr,g_sycw,g_sycr; //internal variable pointer and syncronizer
reg [DW-1:0] fifo [0:DEP-1]; //fifo declaration
reg [4:0] i;
reg signed [2:0] j;
reg hfw,hfr; //internal half flag
always@(posedge wclk,negedge rstn) begin  //write logicc
 if(!rstn) begin
  {w_ptr,r_ptr,data_out,full,empty}=8'b0000_0000;
  for(i=0;i<DEP;i=i+1) begin
   fifo[i]<=4'd0;
  end
 end
 else begin
  if(w_en && !full) begin
    fifo[w_ptr[DW-1:0]]<=data_in;
    w_ptr<=w_ptr+1'b1;  
  end
 end
end

always@(posedge rclk,negedge rstn) begin //read logic
 if(!rstn) begin
  {w_ptr,r_ptr,data_out,full,empty}=8'b0000_0000;
  for(i=0;i<DEP;i=i+1) begin
   fifo[i]<=4'd0;
  end
 end
 else begin
	 if (r_en && !empty) begin
	  data_out<=fifo[r_ptr[DW-1:0]];
	  r_ptr<=r_ptr+1'b1;
	 end
 end
end

always@(posedge wclk) begin:wr_handler  //write syncronizer
  reg [DW:0] temp,g_ptr,g1;
  gw_ptr<=b2g(w_ptr);
  //gr_ptr<=b2g(r_ptr);
  temp<=gr_ptr;
  //g_ptr<=temp;
  g_sycr<=g2b(temp);
  /*
  if(g1[DW-1]!=w_ptr[DW-1] && g1[DW-2:0]==w_ptr[DW-2:0]) begin
   full<=1'b1;
  end
  else full<=1'b0;
  if(w_ptr[DW-2:0]-g1[DW-2:0]==(DEP/2)-1) hfw<=1'b1;
  else hfw<=1'b0;
  */
end

always@(posedge rclk) begin:r_handler //read syncronizer
	reg [DW:0] temp,g_ptr,g1;
	gr_ptr<=b2g(r_ptr);
	//gw_ptr<=b2g(w_ptr);
	temp<=gw_ptr;
	//g_ptr<=temp;
        g_sycw<=g2b(temp);
	/*if (g1==r_ptr) begin
	 empty<=1'b1;
	end
	else empty<=1'b0;
        if(r_ptr[DW-2:0]-g1[DW-2:0]==(DEP/2)-1) hfr<=1'b1;
        else hfr<=1'b0; */

end

always@(r_ptr,g_sycw) begin  //empty logic
	if(r_ptr==g_sycw) begin
	 empty=1'b1;
	end
        else empty=1'b0;
 if(r_ptr[DW-1:0]-g_sycw[DW-1:0]==(DEP/2)-1) hfw=1'b1;
  else hfw=1'b0;
 if(r_ptr[DW-1:0]-g_sycw[DW-1:0]==13 && !empty) ame=1'b1;
  else ame=1'b0;

end

always@(w_ptr,g_sycr) begin  //full logic
 if(g_sycr[DW]!=w_ptr[DW] && g_sycr[DW-1:0]==w_ptr[DW-1:0]) begin
   full=1'b1;
  end
  else full=1'b0;
  if(w_ptr[DW-1:0]-g_sycr[DW-1:0]==(DEP/2)-1) hfr=1'b1;
   else hfr=1'b0;
  if(w_ptr[DW-1:0]-g_sycr[DW-1:0]==13 && !full) amf=1'b1;
  else amf=1'b0;
end


function [DW:0] g2b(input [DW:0] b);
	begin
	  g2b[DW]=b[DW];
	 //b2g[2]=b[2]^b2g[3];
	 //b2g[1]=b[1]^b2g[2];
	 //b2g[0]=b[0]^b2g[1];
	  
	  for (j=DW-1;j>=0;j=j-1) begin
	   g2b[j]=b[j]^g2b[j+1];
	  end
	end
endfunction

function [DW:0] b2g (input [DW:0] g);
	begin
	 b2g[DW]=g[DW];
          //g2b[2]=g[2]^g[3];
	  //g2b[1]=g[1]^g[2];
	  //g2b[0]=g[0]^g[1];
	 for(j=DW-1;j>=0;j=j-1) begin
	  b2g[j]=g[j]^g[j+1];
	 end
	end
endfunction
assign hf=(hfw|hfr)?     1'b1:1'b0;
assign of=(w_en&&full)?  1'b1:1'b0;
assign uf=(r_en&&empty)? 1'b1:1'b0;
endmodule
