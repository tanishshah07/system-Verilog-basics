module exp();
    typedef struct{
   string name;
   string address;
   string email;
    } form;
  
  form ass[string];
  string index[10];
  string str;
  
  initial begin
    for (int i=0;i<10;i++) begin
      str=$sformatf("key%0d", i);
      index[i]=str;
      $display("the index is %s",str);
    end
    ass[index[0]].name="tanish";
    ass[index[0]].address="603";
    ass[index[0]].email="tanishshah@scaledge.io";
    $display("the struct is %p",ass);
    $display("the index array is %p",index);
    data_entry("key1","harsh","devda","hashscaledge.io");
     $display("the struct is %p",ass);
  end
  function void data_entry (input string key,name,addr,email);
      ass[key].name=name;
      ass[key].address=addr;
      ass[key].email=email;
  endfunction
 
endmodule
