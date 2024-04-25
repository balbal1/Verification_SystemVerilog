module counter_tb(counter_if.TEST _if);
    
	initial begin
    
        _if.rst = 1;
        _if.load_n = 1;
        _if.ce = 0;
        _if.up_down = 0;
        _if.data_load = 0;
        
        #2

        _if.rst = 0;
        _if.load_n = 0;
        _if.data_load = 5;

        #2

        _if.load_n = 1;
        _if.ce = 1;
        _if.up_down = 1;

        #22

        _if.up_down = 0;

        #36

        $stop;
    end
    
endmodule
