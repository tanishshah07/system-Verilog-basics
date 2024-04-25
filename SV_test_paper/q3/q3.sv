module q3();

class shape#(type T=int);
 T area;
 T perimeter;
endclass

class rectangle extends shape#(int);
 int len,wid;
function void r_area;
  super.area=len*wid;
  $display("area is %d",super.area);
endfunction

function void r_peri;
 super.perimeter=2*(len+wid);
  $display("perimeter is %d",super.perimeter);
endfunction

function void set(int len,wid);
	this.len=len;
	this.wid=wid;
endfunction

endclass

class circle extends shape#(real);
 T radius;
 const real pie=3.14;
function void c_area;
  super.area=pie*(radius**2);
  $display("area is %f",super.area);
endfunction

function void c_peri;
 super.perimeter=2*pie*radius;
  $display("perimeter is %f",super.perimeter);
endfunction

function void set(T radius);
	this.radius=radius;
endfunction

endclass

rectangle r1;
circle c1;

initial begin
 r1=new();
 c1=new();

 r1.set(3,4);
 c1.set(4);
 r1.r_area();
 r1.r_peri();
 c1.c_area();
 c1.c_peri();


end





endmodule
