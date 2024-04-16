module same_class_mail();

 class m_box;
  mailbox #(int) mbox=new(5);
  int arr[5];
  int arr_g[5];
  task in_m();
	 foreach(arr[i]) begin
            mbox.put(arr[i]);
         end
 endtask
 
  task out_m();
	  foreach(arr_g[i]) begin
             mbox.get(arr_g[i]);
          end
  endtask
 
 endclass

 m_box m1;
 initial begin
  m1=new();
  foreach(m1.arr[i]) begin
    m1.arr[i]=$urandom_range(1,30);
  end
 fork
    $display("number is %d",m1.mbox.num());
    m1.in_m();
    $display("number is %d",m1.mbox.num());
  m1.out_m();
join

  $display("number is %d",m1.mbox.num());
  foreach(m1.arr_g[i]) begin
     $display("arr_q[%0d]=%d",i,m1.arr_g[i]);
  end

 
 end

endmodule
