// question is -----
// Use multi-dimensional array to implement a memory, initialize and print its content. Pack the array, access least 3 bytes, complement them and again store at the same locations



module exp();
  bit  arr[4][4][3];
  bit [0:4][0:4][0:3] arrp;
  initial begin
    foreach(arr[i]) begin
      for(int j=0;j<4;j++) begin
        for(int k=0;k<3;k++) begin
          arr[i][j][k]=i^j^k;
        end
      end
     
    end
    $display("array is %p",arr);
    arrp={>>{arr}};
    $display("arrayp is %h",arrp);
    arrp[3]=~arrp[3];
    $display("arrayp is %h",arrp);
  end
endmodule
