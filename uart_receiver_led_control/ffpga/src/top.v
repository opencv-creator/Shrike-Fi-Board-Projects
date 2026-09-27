(* top *) module top #(
       parameter CLK = 50_000_000,
       parameter BAUD_RATE = 115200
    )( 
	  (* iopad_external_pin *) input      rx,
	  (* iopad_external_pin *) input      rst,
	  (* iopad_external_pin, clkbuf_inhibit *)input      clk, 
	  (* iopad_external_pin *) output reg led,
	  (* iopad_external_pin *) output reg rst_led,
 	  (* iopad_external_pin *) output     clk_en,
	  (* iopad_external_pin *) output     led_en,
	  (* iopad_external_pin *) output   rst_led_en);

  
 /* uart module instantiation */

  assign clk_en = 1'b1;
  assign led_en = 1'b1;
  assign rst_led_en = 1'b1;
  wire [7:0] data;
  wire data_valid;
  uart_rx # ( .CLK(CLK),
  			 .BAUD_RATE(BAUD_RATE) )
  U_uart_rx

    ( 
    .i_Clock(clk),
    .i_RX_Serial(rx),
    .o_RX_DV(data_valid),
    .o_RX_Byte (data)
    );

// ----- logic to control the led based on uart ------ //
/* I wright comment's like this not gpt genrated */

  always @(posedge clk) begin 
   if (rst) begin
      // This is now guaranteed to win because the rest of the logic is in the 'else' block
      led     <= 1'b1; 
  
    end 
    else begin
      // Only process the UART data when a fresh byte actually arrives
      if (data_valid) begin
        if (data == 8'hAB) begin
          led     <= 1'b1;
       
        end
        else if (data == 8'hFF) begin
          led     <= 1'b0;
     
        end
      end
      // NOTE: You don't need "else led <= led;" anymore. 
      // FPGAs naturally remember registers if no new assignment happens.
    end
  end

endmodule
