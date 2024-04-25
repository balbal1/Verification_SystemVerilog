module FSM_top ();
    
    bit clk;
    always #1 clk = ~clk;
    
    FSM_if _if(clk);
    
    FSM DUT(_if);
    FSM_tb TEST(_if);
    FSM_monitor MONITOR(_if);
    
    bind DUT FSM_sva SVA(_if);
    
endmodule
