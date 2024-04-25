module fact();
 class exp;
   rand int fac;
   int factorial;
   function void dis();
     $display("factorial is %d and factorial of %d",factorial,fac);
   endfunction

   constraint con1{
	   fac%2==0;
      fac inside {[1:15]}; 
   }
   function automatic int facto(int fac);
       if(fac==0) return 1;
       else begin
         fac=fac*facto(fac-1);
       end
       return fac;
   endfunction

   function void post_randomize();
     factorial=facto(fac);
   endfunction
 
 endclass

 exp e1;
 initial begin
   e1=new();
   //repeat(5) begin
   e1.randomize();
   e1.dis();
   //end
 end

endmodule
