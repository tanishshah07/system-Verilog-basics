`ifndef MON_SV
`define MON_SV
 class mem_moni;
 mem_transx trans;

 virtual mem_intf vif;
int x;
 mailbox #(mem_transx) mon2rfm;
 mailbox #(mem_transx) mon2scr;

 function new(mailbox #(mem_transx) mon2rfm,mon2scr,virtual mem_intf vif);
	this.mon2rfm=mon2rfm;
	this.mon2scr=mon2scr;
	this.vif=vif;

endfunction

 task run_phase();
   //$display("inside the run phase of the monitor");
  forever @(posedge vif.clk) begin
   //@)(vif.wr_enb); 
   #1; 
   trans=new();
   $cast(trans.fnx_e,{vif.rd_enb,vif.wr_enb});
    //$display("inside the forever block");
   //#12;
   //
   //
   case(trans.fnx_e.name)
	   "write": begin
	    trans.wr_addr=vif.wr_addr;
	    trans.wr_data=vif.wr_data;   
	   end

	   "read" : begin
	    trans.rd_addr=vif.rd_addr;
	    trans.rd_data=vif.rd_data;
	   end
	   "simul": begin
	     trans.wr_addr=vif.wr_addr;
	     trans.wr_data=vif.wr_data; 
	     trans.rd_addr=vif.rd_addr;
	     trans.rd_data=vif.rd_data;
	   end

	   default : begin
            trans.rd_addr=0;
	    trans.rd_data=0;

	     	//$cast(trans.fnx_e,0);
	   end
   endcase
    mon2rfm.put(trans);
    mon2scr.put(trans);


  


/*
   if(vif.wr_enb==1 && vif.rd_enb==0) begin
	 //$display("inside the if staatement");
        trans.wr_addr=vif.wr_addr;
	trans.wr_data=vif.wr_data;
	//trans.fnx=funct'(1);
        $cast(trans.fnx,1);
        mon2rfm.put(trans);
        mon2scr.put(trans);
        //$display("all line of if executes");
	//$display("inside monitor");
	//trans.dis();
	//break;
    end
    if(vif.wr_enb==0 && vif.rd_enb==1) begin
	 $cast(trans.fnx,2);
	trans.rd_addr=vif.rd_addr;
	trans.rd_data=vif.rd_data;
        mon2rfm.put(trans);
        mon2scr.put(trans);

	//break;
    end
if(vif.wr_enb==0 && vif.rd_enb==0) begin
       	$cast(trans.fnx,0);
        mon2rfm.put(trans);
        mon2scr.put(trans);

	//break;
 end
*/


end
$display("outside loop");
endtask

endclass



`endif
