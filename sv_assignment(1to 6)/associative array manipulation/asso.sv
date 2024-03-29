module exp();
  int assoa [int];
  int index=0;
  initial begin
    repeat(10) assoa[$urandom_range(3,99)]=$urandom_range(2,50);
    $display("the number of elements were %d",assoa.num());
    //using foreach loop
    foreach(assoa[i]) begin
      $display("the array is assoa[%h]=%d",i,assoa[i]);
    end
    // using buit in methods
    assoa.first(index);
    $display("the array using buitl in assoa[%h]=%0d",index,assoa[index]);
    repeat(9) begin
      assoa.next(index);
    $display("the array using buitl in assoa[%h]=%0d",index,assoa[index]);
    end
    //delete
    assoa.delete(index);
    assoa.prev(index);
    assoa.prev(index);
    assoa.delete(index);
    $display("the array is %p",assoa);
    $display("the number of elements were %d",assoa.num());
    
    //reading no-existiong index
    $display("the non existing index array %d",assoa[index]);
  end
endmodule
