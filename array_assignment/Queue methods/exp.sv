//Write a snippet to perform the following:
//Declare an integer queue.
//Initialize it with five elements (0 to 4).
//Insert an element at beginning without any method.
//Insert an element at beginning using predefined queue method.
//Insert an element at the end using predefined queue method.
//Insert an element at index - 4.
//Get 1st element in queue.
//Get last element in queue.
//Delete an element at index - 4 in queue.
//Get each element from queue and print using predefined queue method.
//Use a method to print queue after each of the above operations.

module exp();
  integer que[$];
  int nu;
  initial begin
    //initialize th eque with 5 elements
    repeat(5) que.push_back($urandom_range(2,77));
    $display("the que is %p",que);
    //insert an element at starting without and method
    que={17,que};
    $display("the upadeted que after adding element is %p",que);
    //insert element using mentod from front
    que.push_front(7);
     $display("the upadeted que after adding element is %p",que);
      //insert element using mentod from back
    que.push_back(33);
     $display("the upadeted que after adding element is %p",que);
    //insert element at index 4
    que.insert(4,29);
    $display("the upadeted que after adding element is %p",que);
    //geting the first element of the que
    $display("the first element of the queue %d",que.pop_front);
     //geting the last element of the que
    $display("the last element of the queue %d",que.pop_back);
    //deleting the index @4
    que.delete(4);
    $display("the upadeted que after deleting element @ 4 is %p",que);
    //printing each element of queue
    nu=que.size();
    $display("the size is %d",nu);
    repeat(que.size()) $display("the elements of que are %d",que.pop_front);
  end
endmodule
