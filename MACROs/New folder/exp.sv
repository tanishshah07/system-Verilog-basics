`define dis(ARG) foreach(ARG[i]) begin                \
                     $display(`"ARG[%0d]=%0d`",i,ARG[i]); \
                  end     \

module exp();
 int arr[5]='{2,3,4,42,34};
 initial begin
  `dis(arr)
 end

endmodule
