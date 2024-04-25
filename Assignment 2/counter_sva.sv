module counter_sva (counter_if.DUT _if);
    
    load_A: assert property (@(posedge _if.clk) !_if.load_n |=> (_if.count_out == _if.data_load));
    no_change_A: assert property (@(posedge _if.clk) _if.load_n & !_if.ce |=> (_if.count_out == $past(_if.count_out)));
    increment_A: assert property (@(posedge _if.clk) _if.load_n & _if.ce & _if.up_down |=> (_if.count_out == (($past(_if.count_out) + 1) & {_if.WIDTH{1'b1}})));
    decrement_A: assert property (@(posedge _if.clk) _if.load_n & _if.ce & !_if.up_down |=> (_if.count_out == (($past(_if.count_out) - 1) & {_if.WIDTH{1'b1}})));
    max_A: assert property (@(posedge _if.clk) _if.max_count |-> (_if.count_out == {_if.WIDTH{1'b1}}));
    zero_A: assert property (@(posedge _if.clk) _if.zero |-> (_if.count_out == 0));

    load_C: cover property (@(posedge _if.clk) !_if.load_n |=> (_if.count_out == _if.data_load));
    no_change_C: cover property (@(posedge _if.clk) _if.load_n & !_if.ce |=> (_if.count_out == $past(_if.count_out)));
    increment_C: cover property (@(posedge _if.clk) _if.load_n & _if.ce & _if.up_down |=> (_if.count_out == ($past(_if.count_out) + 1) & {_if.WIDTH{1'b1}}));
    decrement_C: cover property (@(posedge _if.clk) _if.load_n & _if.ce & !_if.up_down |=> (_if.count_out == ($past(_if.count_out) - 1) & {_if.WIDTH{1'b1}}));
    max_C: cover property (@(posedge _if.clk) _if.max_count |-> (_if.count_out == {_if.WIDTH{1'b1}}));
    zero_C: cover property (@(posedge _if.clk) _if.zero |-> (_if.count_out == 0));

    always_comb begin
        if (_if.rst)
            reset_A: assert final(_if.count_out == 0);
    end

endmodule
