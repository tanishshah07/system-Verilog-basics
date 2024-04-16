//randomize a variable (32 bits) in such a way that the number of 1's remains
//12 


module no_of_one();

 class one;
  rand bit [31:0] nu;
  //static int count;
  //rand int b;
  constraint con1{ 
	           //(^nu)==0;
		   ones(nu)==12;
	           //$countones(nu)==2;
                 }


  function int ones(int n);
	  int count;
   foreach(n[i]) begin
     if(n[i]) count++;
   end
     return count;
  endfunction  
 
  function void dis();
    $display("nu is %b",nu);
    //$display("b is %d",b);
  endfunction

 endclass

one o1;
initial begin
 o1=new();
 repeat(10) begin
  o1.dis();
 if(o1.randomize()!=1) $error("randomize is failed");
end
end
endmodule
