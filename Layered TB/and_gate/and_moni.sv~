class and_moni;
	// virtual interface
 virtual and_intf vif;
 // transation class handle
 and_transx trans;

 //mailbox for the monitor to predictor 
 mailbox #(and_transx) mon_pre;
 //mailbox for the monitor to scoreboard
 mailbox #(and_transx) mon_scor;


function new(mailbox #(and_transx)mon_pre,mon_scor,virtual and_intf vif);
 //conneting the mailbox interfaces
 this.mon_pre=mon_pre;  
 this.vif=vif;
 this.mon_scor=mon_scor;
endfunction

 task run_phase();
	 //#1;
 //$display("from monitor %b",vif.a);
  //$display("from monitor %b",vif.b);
  //$display("from monitor %b",vif.y);
  forever begin
	  trans=new();  //taking the object of class
         @(vif.a);    //waiting for the interface to change as we have sample the input at every change of interface signals
	 trans.a=vif.a;
	 trans.b=vif.b;
	 trans.y=vif.y;
       mon_pre.put(trans); //putting in the predictor logic
       mon_scor.put(trans); // putting it in the scoreborad
    end
  //$display("from monitor %b",trans.a);
  //$display("from monitor %b",trans.b);
  //$display("from monitor %b",trans.y);

 endtask
endclass
