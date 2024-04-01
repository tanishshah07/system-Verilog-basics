class exp;
int a,b;
  
  function void dis();
    $display("the values is a=%d b=%d",a,b);
  endfunction
endclass

module ob_asin();
exp e1,e2,e3;
  initial begin
   e1=new();
   e1.a=3;
   e1.b=6;
   e1.dis();
//    e2=new();
//    e2.a=5;
//    e2.b=9;
//    e2.dis();
    //$display("the address after applying both new is e1=%d e2=%d",e1,e2);
    e2=e1;
    e3=e2;
    e3.a=99;
    $display("the address is  after e1=e2 e1=%d e2=%d",e1,e2);
   //e2=null;
    e1=null;
  
    $display("the address is after e1=null e1=%d e2=%d",e1,e2);
   //e1.dis();
    e2.dis();  
  end
endmodule
