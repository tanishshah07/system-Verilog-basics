//randomize a dynamic array in such a way that value on odd location comes
//enen and divisible by 8 and value on even location come odd and divisible
//by 7


module drr_r();

 class exp;
  rand int darr[];

constraint con1{ //size constraint
                 darr.size()>20;
	         darr.size()<30;
               }
constraint con2{
	         foreach (darr[i]){
	          darr[i] inside {[1:100]}; //to anaylze the correct output
                 }
                 foreach(darr[i]) {
		  if(i%2!=0) {
		    darr[i]%8==0;
                  }
		  else {
		   darr[i]%7==0;
	           darr[i]%2==1;
                  }
	        }
               }

  function void dis();
    foreach(darr[i]) begin
      $display("darr[%0d]==%0d",i,darr[i]);
    end
  endfunction
 endclass

 exp e1;
 initial begin
   e1=new();
   repeat(10) begin
    e1.randomize();
    e1.dis();
   
   end

 end


endmodule
