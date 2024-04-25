module q5();

class inters#(int RATE=5);
 //int rate=5;
 real intrest;
 function void calc(int tim=1, real amt);
	 intrest=amt*RATE*tim;
	 $display("interest is %f",intrest);
 endfunction
endclass



class bnk_acc #(RATE=5,type T=real);
 protected T blanc;
 inters#(RATE) intres_h; 

 function bit deposit(T amount);
  blanc=blanc+amount;
   $display("success");
   enquiry();
  return 1;
 endfunction 

 function bit withdrawl(T amount);
	 if(blanc>=amount) begin
	    $display("success");
            blanc=blanc-amount;
            enquiry();
            return 1;
         end
	 else begin
		 $display("Fail");
		 return 0;
	 end
 endfunction

 function new();
   intres_h=new();
 endfunction

 function void enquiry();
   $display("current balance is %f",blanc);
 endfunction
 
 virtual function void intes_calc(int tim);
     intres_h.calc(tim,blanc);
 endfunction

endclass


class curr_acc extends bnk_acc #(7,real);
 
  function dcopy(curr_acc cr);
    this.blanc=cr.blanc;
    this.intres_h = new cr.intres_h;
  endfunction

 function void intes_calc(int tim);
    intres_h.calc(tim,blanc);
 endfunction


 function new();
  super.new();
 endfunction
endclass	



bnk_acc acc1,acc2,acc4;
bnk_acc #(7, real) acc3;
curr_acc cr1,cr2;

initial begin
  acc1=new();
  acc3=new();
  acc4=new();

  acc1.deposit(200);
  acc1.withdrawl(100);
  acc2 = new acc1;
  acc2.enquiry();
  acc2.withdrawl(200);

  cr1=new();
  cr2=new();
  acc3=cr1;
  cr1.deposit(500);
  cr1.withdrawl(20);
  cr1.intes_calc(2);
  cr2.dcopy(cr1);
  cr2.withdrawl(300);
  cr2.intes_calc(2);
  acc3.intes_calc(2);
end
endmodule
