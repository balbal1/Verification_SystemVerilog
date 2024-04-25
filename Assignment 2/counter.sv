module counter(counter_if.DUT _if);
    
    always @(posedge _if.clk or posedge _if.rst) begin
        if (_if.rst)
            _if.count_out <= 0;
        else if (!_if.load_n)
            _if.count_out <= _if.data_load;
        else if (_if.ce)
            if (_if.up_down)
                _if.count_out <= _if.count_out + 1;
            else 
                _if.count_out <= _if.count_out - 1;
    end

    assign _if.max_count = (_if.count_out == {_if.WIDTH{1'b1}})? 1:0;
    assign _if.zero = (_if.count_out == 0)? 1:0;

endmodule
