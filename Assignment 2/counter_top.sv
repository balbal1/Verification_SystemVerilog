module counter_top ();
    
    bit clk;
    always #1 clk = ~clk;
    
    counter_if _if(clk);
    
    counter DUT(_if);
    counter_tb TEST(_if);
    counter_monitor MONITOR(_if);
    
    bind DUT counter_sva SVA(_if);
    
endmodule
