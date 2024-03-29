//Write a snippet to perform the following:
//Randomize the content of array.
//Add all the odd numbers of array without using any method.
//Add all the even numbers of array using methods.
//Find how many numbers are less than 10 in array with and without method.


module exp();
  int arr[20];
  int arr_even_q[$],num_m_q[$];
  int sum_e,sum_o,num;
  initial begin
    foreach(arr[i]) begin
      arr[i]=$urandom_range(1,100);
    end
    $display("the array is %p",arr);
    //sum of odd and even number of an array
    foreach(arr[i]) begin
      if(arr[i]%2!=0) sum_o=sum_o+arr[i];
      else continue;
    end
    
    arr_even_q=arr.find(x) with (x%2==0);
    sum_e=arr_even_q.sum();
    $display("the array even terms are %p",arr_even_q);
    $display("the sum of EVEN terms is %d",sum_e);
    $display("the sum of ODD terms is %d",sum_o);
    
    // number less than 10 with and without method
    foreach(arr[i]) begin
      if(arr[i]<10) num++;
      else continue;
    end
    num_m_q=arr.find(x) with (x<10);
    $display("the number of term less than 10 with method %d",num_m_q.size());
    $display("the number of term less than 10 without method %d",num);
  end
endmodule
