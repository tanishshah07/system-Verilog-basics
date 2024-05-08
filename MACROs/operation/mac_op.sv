module exp();
  `define alu(IN_ARG,IN_ARG1,OUT_ARG,OP_ARG) OUT_ARG=IN_ARG1 OP_ARG IN_ARG
    int y;
  initial begin
    `alu(3,4,y,+);
    $display(y);
    `alu(9,4,y,-);
    $display(y);
    `alu(6,9,y,*);
    $display(y);
    `alu(2,4,y,/);
    $display(y);
  end
endmodule
