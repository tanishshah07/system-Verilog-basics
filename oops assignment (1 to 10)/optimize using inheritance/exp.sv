class general;
int a;
function void xyz();
 $display("you are in general");
endfunction
endclass

class A extends general;
int b;
general g1;
//function new();
 //g1=new();
//endfunction
endclass

class B extends general;
 byte c;
 general g2;
 task write();
  c=$urandom_range(0,255);
 endtask
 //function new();
  //g1=new();
 //endfunction
endclass

class C extends general;
general g3;
function read();
 $display("the value of a is %d",g3,a);
endfunction
 //function new();
  //g1=new();
 //endfunction
endclass

module exp();
 A a1;
 B b1;
 C c1;
 initial begin
  a1=new();
  b1=new();
  c1=new();
  a1.xyz();
  b1.xyz();
  c1.xyz(); 
 end








endmodule
