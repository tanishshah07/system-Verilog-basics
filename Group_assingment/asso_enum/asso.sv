module asso();
  /*integer arr[4];
  initial begin
    for (int i=0;i<3;i++) begin
      arr[i]=$urandom_range(1,10);
    end
    $display("array is %p",arr);
  end */
  typedef enum longint{tanish , prabhas ,kartik , devda ,abhay}names;
  names n1;
  int ass_arr[names];
 
  //string str[5]='{"tanish","prabhas","artik","devda","abhay"};
  initial begin
    for(int i=0;i<5;i++) begin
      //ass_arr[str[i]]=$urandom_range(10,19);
      ass_arr[n1]=$urandom_range(10,19);
      $display(n1);
      n1=n1.next();
      //$display("strig is %s",str[i]);
    end
    $display("array is %p ",ass_arr);
    $display("the number of elemets %d",ass_arr.num());
  end
endmodule
