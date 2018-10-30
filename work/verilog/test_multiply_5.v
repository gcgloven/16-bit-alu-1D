/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module test_multiply_5 (
    input clk,
    input rst,
    input start,
    output reg [1:0] status
  );
  
  
  
  reg [4:0] M_counter_d, M_counter_q = 1'h0;
  
  
  localparam IDLE_state = 2'd0;
  localparam TEST_state = 2'd1;
  localparam PASS_state = 2'd2;
  localparam FAIL_state = 2'd3;
  
  reg [1:0] M_state_d, M_state_q = IDLE_state;
  
  wire [16-1:0] M_mul_out;
  reg [16-1:0] M_mul_a;
  reg [16-1:0] M_mul_b;
  reg [5-1:0] M_mul_alufn;
  multiply16_14 mul (
    .a(M_mul_a),
    .b(M_mul_b),
    .alufn(M_mul_alufn),
    .out(M_mul_out)
  );
  
  always @* begin
    M_state_d = M_state_q;
    M_counter_d = M_counter_q;
    
    status = 1'h0;
    M_mul_a = 1'h0;
    M_mul_b = 1'h0;
    M_mul_alufn = 6'h00;
    if (start == 1'h0) begin
      M_state_d = IDLE_state;
    end
    
    case (M_state_q)
      IDLE_state: begin
        status = 1'h0;
        if (start == 1'h1) begin
          M_state_d = TEST_state;
        end
      end
      TEST_state: begin
        
        case (M_counter_q)
          4'h0: begin
            M_mul_alufn = 5'h1f;
            M_mul_a = 16'h0000;
            M_mul_b = 16'h0000;
            if (M_mul_out != 16'h0000) begin
              M_state_d = FAIL_state;
            end
          end
          4'h1: begin
            M_mul_alufn = 5'h1f;
            M_mul_a = 16'h0001;
            M_mul_b = 16'h0001;
            if (M_mul_out != 16'h0001) begin
              M_state_d = FAIL_state;
            end
          end
          4'h2: begin
            M_mul_alufn = 5'h1f;
            M_mul_a = 16'hffff;
            M_mul_b = 16'hffff;
            if (M_mul_out != 16'h0001) begin
              M_state_d = FAIL_state;
            end
          end
          4'h3: begin
            M_mul_alufn = 5'h1f;
            M_mul_a = 16'h0001;
            M_mul_b = 16'h1234;
            if (M_mul_out != 16'h1234) begin
              M_state_d = FAIL_state;
            end
          end
          4'h4: begin
            M_mul_alufn = 5'h1f;
            M_mul_a = 16'h1234;
            M_mul_b = 16'h4321;
            if (M_mul_out != 16'hf4b4) begin
              M_state_d = FAIL_state;
            end
          end
          4'h5: begin
            M_mul_alufn = 5'h1f;
            M_mul_a = 16'h1234;
            M_mul_b = 16'h0003;
            if (M_mul_out != 16'h369c) begin
              M_state_d = FAIL_state;
            end
          end
          4'h6: begin
            M_mul_alufn = 5'h1f;
            M_mul_a = 16'hfff0;
            M_mul_b = 16'hf001;
            if (M_mul_out != 16'hfff0) begin
              M_state_d = FAIL_state;
            end
          end
          4'h8: begin
            M_mul_alufn = 5'h1f;
            M_mul_a = 16'h0002;
            M_mul_b = 16'hfccc;
            if (M_mul_out != 16'hf998) begin
              M_state_d = FAIL_state;
            end
          end
          4'h9: begin
            M_state_d = PASS_state;
          end
        endcase
      end
      PASS_state: begin
        status = 1'h1;
      end
      FAIL_state: begin
        status = 2'h2;
      end
    endcase
    M_counter_d = M_counter_q + 1'h1;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_counter_q <= 1'h0;
    end else begin
      M_counter_q <= M_counter_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_state_q <= 1'h0;
    end else begin
      M_state_q <= M_state_d;
    end
  end
  
endmodule