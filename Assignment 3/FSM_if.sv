interface FSM_if(input clk);
    
    modport DUT (
        input clk
    );
    
    modport TEST (
        input clk
    );
    
    modport MONITOR (
        input clk
    );
    
endinterface
