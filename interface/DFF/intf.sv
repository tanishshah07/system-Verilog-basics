

interface dff_intf(input bit clk);
 logic d,q,rst;
  
 clocking dff_cb@(posedge clk);
	 default input #1 output #1; 
        output d,rst;	
        input q;
 endclocking

 modport dff_mp(input clk,d,rst,output q);
 modport tb_mp(clocking dff_cb);

endinterface
