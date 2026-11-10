`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: AETER Technologies
// Engineer: Jeovani Vera Villarreal
// 
// Design Name: AETER Base Accumulator Core
// Module Name: aeter_base_accumulator
// Target Devices: AMD Xilinx Artix-7 / Kintex-7
// Description: Módulo base parametrizable de acumulación síncrona con control 
//              de habilitación y reinicio activo en alto.
//////////////////////////////////////////////////////////////////////////////////

module aeter_base_accumulator #(
    parameter DATA_WIDTH = 32
)(
    input  wire                    clk,
    input  wire                    rst,       // Reset sincrónico activo en alto
    input  wire                    en,        // Habilitación de conteo/acumulación
    input  wire [DATA_WIDTH-1:0]   data_in,   // Dato de entrada
    output reg  [DATA_WIDTH-1:0]   data_out   // Dato acumulado de salida
);

    always @(posedge clk) begin
        if (rst) begin
            data_out <= {DATA_WIDTH{1'b0}};
        end else if (en) begin
            data_out <= data_out + data_in;
        end
    end

endmodule
