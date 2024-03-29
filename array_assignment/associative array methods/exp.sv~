//Write a snippet to perform the following:
//Add 50 integer values at random locations (between 1 to 100) of an integer associative
//array.
//Check value at index 2 and 45 exists?
//Print the value at first index along with index.
//Print the value at last index along with index.
//Check the array size.
//Delete 5th, 10th and 15th index if they exist.
//Print array size again.
module exp();

  int asso[int];
  int max_q[$];
  int index;
  initial begin
    repeat(50) begin
    asso[$urandom_range(1,100)]=$urandom_range(2,99); 
  end
    $display("the number of elements are %D",asso.num());
    $display("the array is %p",asso);
    if(asso.exists(2)) $display("the 2 index exits");
    if(asso.exists(45)) $display("the 45 index exits");
    asso.first(index);
    $display("the associative array first asso[%0d]=%0d",index,asso[index]);
    asso.last(index);
    $display("the associative array last asso[%0d]=%0d",index,asso[index]);
    $display("the size of the array is %d",asso.size());
    if (asso.exists(5))  asso.delete(5);
    if (asso.exists(10)) asso.delete(10);
    if (asso.exists(15)) asso.delete(15);
    $display("the size of the array is %d",asso.size());
    //max_q=asso.max();
    //$display("the array max is %p",max_q);
  end
endmodule
