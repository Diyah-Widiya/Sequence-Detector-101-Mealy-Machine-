module mealy_101(
    input clk,
    input reset,
    input din,
    output reg dout
);

  // State encoding
  reg [1:0] state;

  parameter S0 = 2'b00,
            S1 = 2'b01,
            S2 = 2'b10;

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      state <= S0;
      dout <= 1'b0;
    end
    else begin
      case (state)

        // STATE S0
        S0: begin
		  
          if (din) begin
            state <= S1;
            dout <= 1'b0;
          end else begin
            state <= S0;
            dout <= 1'b0;
          end
        end

        // STATE S1
        S1: begin
          if (!din) begin
            state <= S2;
            dout <= 1'b0;
          end else begin
            state <= S1;
            dout <= 1'b0;
          end
        end

        // STATE S2
        S2: begin
          if (din) begin
            state <= S1;
            dout <= 1'b1;    // Output Mealy
          end else begin
            state <= S0;
            dout <= 1'b0;
          end
        end

      endcase
    end
  end

endmodule
