`ifndef SCR_SV
`define SCR_SV

class mem_scr;
	mem_transx trans,trans_exp;
 mailbox #(mem_transx) mon2scr;
 mailbox #(mem_transx) rfm2scr;

function void connect(mailbox #(mem_transx) mon2scr,rfm2scr);
	this.mon2scr=mon2scr;
	this.rfm2scr=rfm2scr;
	trans_exp=new();
endfunction
//-------------------------------------------------------------
  covergroup cvg;
    RD_ADRR : coverpoint trans.rd_addr{
     bins LOW_ADDR = {[1:5]};
     bins MED_ADDR = {[6:10]};
     bins HIGH_ADDR = {[11:15]};
     bins MAX_MIN[] ={15,0};
     option.comment="this is for the read address range and the boundary conditions";
    }

    WR_ADRR : coverpoint trans.wr_addr{
     bins LOW_ADDR = {[1:5]};
     bins MED_ADDR = {[6:10]};
     bins HIGH_ADDR = {[11:15]};
     bins MAX_MIN[] ={15,0};
     option.comment="this is for the write address range and the boundary conditions";
    }
    WR_DATA : coverpoint trans.wr_data{
     bins LOW_DATA = {[1:85]};
     bins MED_DATA = {[86:170]};
     bins HIGH_DATA = {[171:255]};
     option.comment="this is for the write data range";
    }

    RD_DATA : coverpoint trans.rd_data{
     bins LOW_DATA = {[1:85]};
     bins MED_DATA = {[86:170]};
     bins HIGH_DATA = {[171:255]};
     option.comment="this is for the read data range";
    }


    RD_DATA0 : coverpoint trans.rd_data[0]{
     bins TRAN[] = (1=>0,0=>1);
    }
    
    RD_DATA1 : coverpoint trans.rd_data[1]{
      bins TRAN[] = (1=>0,0=>1);
    }
    RD_DATA2 : coverpoint trans.rd_data[2]{
      bins TRAN[] = (1=>0,0=>1);
    }
    RD_DATA3 : coverpoint trans.rd_data[3]{
      bins TRAN[] = (1=>0,0=>1);
    }
    RD_DATA4 : coverpoint trans.rd_data[4]{
      bins TRAN[] = (1=>0,0=>1);
    }
    RD_DATA5 : coverpoint trans.rd_data[5]{
      bins TRAN[] = (1=>0,0=>1);
    }
    RD_DATA6 : coverpoint trans.rd_data[6]{
      bins TRAN[] = (1=>0,0=>1);
    }
    RD_DATA7 : coverpoint trans.rd_data[7]{
      bins TRAN[] = (1=>0,0=>1);
    }
    //macro??
    B2B : coverpoint trans.fnx_e{
      bins B2B = {write->read->write->read};
      //option.at_least(4);//?
    }
    TRANS : coverpoint trans.fnx_e{
      bins TRANS[] = {IDLE->write,IDLE->read,write->simul,read->simul};
    }
    RD_EN : coverpoint trans.fnx_e{
      bins RD = {read};
    }
    WR_EN : coverpoint trans.fnx_e{
      bins WR = {write};
    }
    SIMUL : coverpoint trans.fnx_e{
      bins SIMUL ={simul};
    }
    RESET : coverpoint trans.rd_data iff(trans.fnx_e==res){
      wildcard bins RRD = ('b? =>'b0);
    }
    //enum transition coverpoint
    //reset then output zero
    //reset? bin 
    //simultaneous
    CRW : cross WR_EN,WR_ADRR,WR_DATA;
    CRR : cross RD_EN,RD_ADRR,RD_DATA;
    CRSR : cross SIMUL,RD_ADRR,RD_DATA;
    CRSW : cross SIMUL,WR_ADRR,WR_DATA;
  endgroup
function new();
  cvg=new();
endfunction

//-------------------------------------------------------------
task run_phase();
forever begin
 //raise_obj("SCR");
 mon2scr.get(trans);
  cvg.sample();
 rfm2scr.get(trans_exp);
 raise_obj("SCR");
 //#1;
 //$display("inside scr");
 trans.dis("scoreboard");
 //if(trans.fnx_e!=0) //begin
 fork
   begin
    wait(trans.rd_data==trans_exp.rd_data) $display("scoreboard in read, passed at %t",$time);
   // else $display("scoreboard in read, failed %t",$time);

    //if((trans.wr_data!=trans_exp.wr_data)) $display(" scoreboard read failedat %t ",$time);
    //else if ((trans.wr_data!=trans_exp.wr_data) && trans.fnx_e==2)  $display("scoreboard in write, failed %t",$time);
   end
   begin
     #DRAIN_T;
     $display("time out && failed %t",$time);
   end
 
 join_any
 disable fork; //separete task for the same
 //check reset also memory clear
 
  $display("count decremeted");
  drop_obj("DRESCR");
 //end
end

endtask

endclass

`endif
