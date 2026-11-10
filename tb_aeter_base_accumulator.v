`timescale 1ns / 1ps

module tb_aeter_base_accumulator;

    parameter DATA_WIDTH = 32;

    // Señales de prueba
    reg                    clk;
    reg                    rst;
    reg                    en;
    reg  [DATA_WIDTH-1:0]   data_in;
    wire [DATA_WIDTH-1:0]   data_out;

    // Instanciación del módulo bajo prueba (UUT)
    aeter_base_accumulator #(
        .DATA_WIDTH(DATA_WIDTH)
    ) uut (
        .clk(clk),
        .rst(rst),
        .en(en),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Generador de reloj (Clock generation: 10ns -> 100 MHz)
    always #5 clk = ~clk;

    initial begin
        // Inicializar señales
        clk     = 0;
        rst     = 1;
        en      = 0;
        data_in = 0;

        #20;
        rst = 0; // Liberar reset
        
        #10;
        en      = 1;
        data_in = 32'd10;
        
        #10;
        data_in = 32'd25;
        
        #10;
        en      = 0; // Pausar acumulación
        data_in = 32'd50;
        
        #10;
        en      = 1;
        data_in = 32'd5;

        #20;
        rst = 1; // Reiniciar
        
        #10;
        rst = 0;
        data_in = 32'd100;

        #30;
        $finish;
    end

endmodule
