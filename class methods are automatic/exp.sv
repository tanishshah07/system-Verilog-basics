class exp;
int a;
  task  test(int a);
    this.a=a;
    $display($time,"the a is %d",this.a);
    $display($time,"the a of function is %d",a);
    #10;
    a=a+5;
    $display($time,"the a is %d",this.a);
    $display($time,"the a of task is %d",a);
  endtask
endclass

module mod();
exp ex1,ex2;
  initial begin
    ex1=new();
    fork 
      ex1.test(5);
      ex1.test(7);
      ex1.test(6);
    join
    $finish;
  end
endmodule
