module exp;
  class con;
    //randc bit [2:0] abc;
    rand bit [0:5] abc[7];

      constraint con1{
	              foreach(abc[i]) {
		        if(i==0) abc[i]==0;
			else if(i==6) abc[i]==6'h3f;
			else abc[i]==2**(i-1);
		      } 
	             }

    function void dis();
	    foreach(abc[i]) begin
                    $display("abc==%b",abc[i]);
	    end
    endfunction
  endclass

  con c1;
  initial begin
    c1=new();
    repeat(10) begin
      c1.randomize();
      c1.dis();
    end
  end

endmodule
