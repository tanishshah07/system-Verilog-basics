module fun_in_con();
 class exp;
 int arr[5]='{4,5,3,1,10};
 rand int val;
 rand int fin;
 static bit [2:0] i; 
 constraint c1{
                val==get(i);
	        //dis();   //function with return type is not be used in
		//constrained
               }
 
  function int get(int i);
  return arr[i];
 endfunction

function void post_randomize();
 i++;
endfunction

function void dis();
  $display("val =%d",val);
 endfunction

 endclass

 exp e1;

initial begin
 e1=new();
repeat(10) begin
 if(e1.randomize()!=1) $error("randomization fail");
 e1.dis();
end
end
endmodule
