////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : TANISH_SHAH
//File_Name    : abp_test.sv
//File_Path    : 
//Class_Name   : apb_env              
//Project_Name : APB SLAVE
//Description  :
//
/////////////////////////////////////////////////

class apb_test;
 apb_env env;
apb_gen_sanityw sw;
apb_gen_sanityr sr;
apb_gen_reset_b rb;
 virtual apb_intf vif;
 function void build();
  env=new();
    env.build();
 endfunction


 function void connect(virtual apb_intf vif);
	 if($test$plusargs("SANITYW")) begin
	   sw=new();
	   env.gen=sw;
	 end
	 if($test$plusargs("SANITYR")) begin
	   sr=new();
	   env.gen=sr;
	 end
         if($test$plusargs("RESET_B")) begin
	   rb=new();
	   env.gen=rb;
	 end
	 
	 
	 
	 this.vif=vif;
   env.connect(this.vif); 	 
 endfunction
 task run_phase();
   env.run_phase();
 endtask
endclass	
