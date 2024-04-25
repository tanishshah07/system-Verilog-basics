module q4();

class bnk_acc#(type T=real);
 local T blanc;
 
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

 function void enquiry();
   $display("current balance is %f",blanc);
 endfunction
endclass

bnk_acc acc1,acc2;
initial begin
  acc1=new();
  acc1.deposit(200);
  acc1.withdrawl(100);
  acc2 = new acc1;
  acc2.enquiry();
  acc2.withdrawl(200);
  
end


endmodule
