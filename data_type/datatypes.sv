module data();
 int n;
typedef struct {
 int n;
 string str;
 bit [7:0] bi;
 byte b2;
} packet;

packet p1,p2;
 initial begin
  packet p3;
  p1.n=13;
  p1.str="hello";
  p1.bi=8'b1010_1110;
  p1.b2=8'hfe;
  p3=p1;
  p2 ='{2, "namaste",12,4'hf};
  $display("the elements of the p1 packet are %p",p1);
  $display("the elements of the p2 packet are %p",p2);
  $display("the elements of the p3 packet are %p",p3);
  $finish;

 end

endmodule
