interface counter_if(input clk);
    
    parameter WIDTH = 4;
    logic rst, load_n, ce, up_down, max_count, zero;
    logic [WIDTH-1:0] count_out, data_load;

    modport DUT (
        input clk, rst, load_n, ce, up_down, data_load,
        output max_count, zero, count_out
    );
    
    modport TEST (
        input clk, max_count, zero, count_out,
        output rst, load_n, ce, up_down, data_load
    );
    
    modport MONITOR (
        input clk, rst, load_n, ce, up_down, data_load, max_count, zero, count_out
    );
    
endinterface
