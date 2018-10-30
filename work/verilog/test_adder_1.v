/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module test_adder_1 (
    input clk,
    input rst,
    input start,
    output reg [1:0] status
  );
  
  
  
  reg [3:0] M_counter_d, M_counter_q = 1'h0;
  
  
  localparam IDLE_state = 2'd0;
  localparam TEST_state = 2'd1;
  localparam PASS_state = 2'd2;
  localparam FAIL_state = 2'd3;
  
  reg [1:0] M_state_d, M_state_q = IDLE_state;
  
  wire [16-1:0] M_adder16_out;
  reg [16-1:0] M_adder16_a;
  reg [16-1:0] M_adder16_b;
  reg [5-1:0] M_adder16_alufn;
  adder16_10 adder16 (
    .a(M_adder16_a),
    .b(M_adder16_b),
    .alufn(M_adder16_alufn),
    .out(M_adder16_out)
  );
  
  always @* begin
    M_state_d = M_state_q;
    M_counter_d = M_counter_q;
    
    status = 1'h0;
    M_adder16_a = 1'h0;
    M_adder16_b = 1'h0;
    M_adder16_alufn = 5'h10;
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
            M_adder16_alufn = 5'h10;
            M_adder16_a = 16'h0000;
            M_adder16_b = 16'h0000;
            if (M_adder16_out != 16'h0000) begin
              M_state_d = FAIL_state;
            end
          end
          4'h1: begin
            M_adder16_alufn = 5'h10;
            M_adder16_a = 16'h0001;
            M_adder16_b = 16'h0001;
            if (M_adder16_out != 16'h0002) begin
              M_state_d = FAIL_state;
            end
          end
          4'h2: begin
            M_adder16_alufn = 5'h10;
            M_adder16_a = 16'h8000;
            M_adder16_b = 16'h8000;
            if (M_adder16_out != 16'h0000) begin
              M_state_d = FAIL_state;
            end
          end
          4'h3: begin
            M_adder16_alufn = 5'h10;
            M_adder16_a = 16'h0001;
            M_adder16_b = 16'hffff;
            if (M_adder16_out != 16'h0000) begin
              M_state_d = FAIL_state;
            end
          end
          4'h4: begin
            M_adder16_alufn = 5'h10;
            M_adder16_a = 16'hf001;
            M_adder16_b = 16'h0001;
            if (M_adder16_out != 16'hf002) begin
              M_state_d = FAIL_state;
            end
          end
          4'h5: begin
            M_adder16_alufn = 5'h11;
            M_adder16_a = 16'h0000;
            M_adder16_b = 16'h0000;
            if (M_adder16_out != 16'h0000) begin
              M_state_d = FAIL_state;
            end
          end
          4'h6: begin
            M_adder16_alufn = 5'h11;
            M_adder16_a = 16'hffff;
            M_adder16_b = 16'hffff;
            if (M_adder16_out != 16'h0000) begin
              M_state_d = FAIL_state;
            end
          end
          4'h7: begin
            M_adder16_alufn = 5'h11;
            M_adder16_a = 16'h0001;
            M_adder16_b = 16'h0001;
            if (M_adder16_out != 16'h0000) begin
              M_state_d = FAIL_state;
            end
          end
          4'h8: begin
            M_adder16_alufn = 5'h11;
            M_adder16_a = 16'h8000;
            M_adder16_b = 16'h0001;
            if (M_adder16_out != 16'h7fff) begin
              M_state_d = FAIL_state;
            end
          end
          4'h9: begin
            M_adder16_alufn = 5'h11;
            M_adder16_a = 16'h7fff;
            M_adder16_b = 16'h8001;
            if (M_adder16_out != 16'hfffe) begin
              M_state_d = FAIL_state;
            end
          end
          4'ha: begin
            M_adder16_alufn = 5'h11;
            M_adder16_a = 16'hffff;
            M_adder16_b = 16'h0001;
            if (M_adder16_out != 16'hfffe) begin
              M_state_d = FAIL_state;
            end
          end
          4'hb: begin
            M_adder16_alufn = 5'h11;
            M_adder16_a = 16'h0001;
            M_adder16_b = 16'hffff;
            if (M_adder16_out != 8'h02) begin
              M_state_d = FAIL_state;
            end
          end
          4'hc: begin
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
      M_state_q <= 1'h0;
    end else begin
      M_state_q <= M_state_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_counter_q <= 1'h0;
    end else begin
      M_counter_q <= M_counter_d;
    end
  end
  
endmodule
