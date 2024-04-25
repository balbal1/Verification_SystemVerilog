module ALU_4_bit_tb;
    
    reg clk, reset;
    reg [1:0] Opcode;
    reg signed [3:0] A, B;
    wire signed [4:0] C;

    int error_count, correct_count;
    localparam Add	= 2'b00;
    localparam Sub = 2'b01;
    localparam Not_A = 2'b10;
    localparam ReductionOR_B = 2'b11;
    
    ALU_4_bit ALU_4_bit(.*);

    initial begin
        clk = 0;
        forever
            #1 clk = ~clk;
    end

    initial begin
        
        check_reset;

        A = 5; B = -7; Opcode = Add; check_result(-2);

        A = -2; B = -6; Opcode = Sub; check_result(4);
        
        A = 4'b1010; Opcode = Not_A; check_result(4'b0101);
        
        B = 4'b0010; Opcode = ReductionOR_B; check_result(1);

        $display("End: error count: %0d, correct count %0d", error_count, correct_count);
        $stop();

    end

    task check_reset;
        reset = 1;
        @(negedge clk);
        if (C !== 5'b00000) begin
            error_count++;
            $display("%0t: Reset Error", $time);
        end else
            correct_count++;
        reset = 0;
    endtask

    task check_result(input [4:0] expected_C);
        @(negedge clk);
        if (C !== expected_C) begin
            error_count++;
            $display("%0t: Error in C: incorrect output %0d, expected %0d", $time, C, expected_C);
        end else
            correct_count++;
    endtask

endmodule