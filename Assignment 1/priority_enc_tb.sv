module priority_enc_tb;
    
    reg clk, rst; reg [3:0] D;	
    wire valid; wire [1:0] Y;
    int error_count, correct_count;
    
    priority_enc priority_enc(.*);
    initial begin
        clk = 0;
        forever #1 clk = ~clk;
    end

    initial begin
        
        check_reset;
        D = 4'b0000; check_result(2'b00, 1'b0);
        D = 4'b0001; check_result(2'b11, 1'b1);
        D = 4'b0010; check_result(2'b10, 1'b1);
        D = 4'b0011; check_result(2'b11, 1'b1);
        D = 4'b0100; check_result(2'b01, 1'b1);
        D = 4'b0101; check_result(2'b11, 1'b1);
        D = 4'b0110; check_result(2'b10, 1'b1);
        D = 4'b0111; check_result(2'b11, 1'b1);
        D = 4'b1000; check_result(2'b00, 1'b1);
        D = 4'b1001; check_result(2'b11, 1'b1);
        D = 4'b1010; check_result(2'b10, 1'b1);
        D = 4'b1011; check_result(2'b11, 1'b1);
        D = 4'b1100; check_result(2'b01, 1'b1);
        D = 4'b1101; check_result(2'b11, 1'b1);
        D = 4'b1110; check_result(2'b10, 1'b1);
        D = 4'b1111; check_result(2'b11, 1'b1);

        $display("End: error count: %0d, correct count %0d", error_count, correct_count);
        $stop();

    end

    task check_reset;
        rst = 1;
        @(negedge clk);
        if (Y !== 2'b00) begin
            error_count++;
            $display("%0t: Reset Error", $time);
        end else
            correct_count++;
        rst = 0;
    endtask

    task check_result(input [1:0] expected_Y, input expected_valid);
        @(negedge clk);
        if (Y !== expected_Y) begin
            error_count++;
            $display("%0t: Error in Y: incorrect output %0d, expected %0d", $time, Y, expected_Y);
        end else if (valid !== expected_valid) begin
            error_count++;
            $display("%0t: Error in valid: incorrect output %0d, expected %0d", $time, valid, expected_valid);
        end else
            correct_count++;
    endtask

endmodule

