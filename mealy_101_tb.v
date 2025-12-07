`timescale 1ns/1ps

module mealy_101_tb;

    reg clk;
    reg reset;
    reg din;
    wire dout;

    // Instansiasi DUT (Device Under Test)
    mealy_101 uut (
        .clk(clk),
        .reset(reset),
        .din(din),
        .dout(dout)
    );

    // Generate clock: periode 10 ns
    always #5 clk = ~clk;

    // Stimulus utama
    initial begin
        // Awal
        clk = 0;
        reset = 1;
        din = 0;

        // Reset selama 20 ns
        #20 reset = 0;

        // -------------------------------------------------
        //     MASUKAN POLA BIT UNTUK MENGUJI DETEKTOR
        // -------------------------------------------------
        // Pola: 1 0 1  (harus output 1 pada bit terakhir)
        send_bit(1);
        send_bit(0);
        send_bit(1);

        // Pola tambahan: 1 1 0 1 0 1
        send_bit(1);
        send_bit(1);
        send_bit(0);
        send_bit(1);
        send_bit(0);
        send_bit(1);

        // Selesai simulasi
        #50 $finish;
    end

    // -------------------------------------------------
    // TASK untuk mengirim bit din
    // -------------------------------------------------
    task send_bit(input b);
    begin
        din = b;
        #10;               // Tunggu 1 periode clock
        $display("Time=%0t | din=%b | dout=%b | state=%b",
                 $time, din, dout, uut.state);
    end
    endtask

endmodule
