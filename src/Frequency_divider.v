module Frequency_divider (

    input			inClk,			// входная частота
    input			reset,			// асинхронный сброс
    input	[2:0]	divider,			// выбор коэф. деления частоты
    output reg		outClk			// деленная выходная чатота
);

reg	[7:0]	counter;

always @(posedge inClk, posedge reset)
	if(reset)
		counter[7:0] <= 7'b00000000;
	else
		counter[7:0] <= counter[7:0] + 1'b1;

always @(divider,counter)
	case (divider[2:0])
        3'h0    :   outClk = counter[0];		// Делится на 2
        3'h1    :   outClk = counter[1];		// Делится на 4
        3'h2    :   outClk = counter[2];		// Делится на 8
        3'h3    :   outClk = counter[3];		// Делится на 16
        3'h4    :   outClk = counter[4];		// Делится на 32
        3'h5    :   outClk = counter[5];		// Делится на 64
        3'h6    :   outClk = counter[6];		// Делится на 128
        3'h7    :   outClk = counter[7];		// Делится на 256
        default :   outClk = 0;
	endcase

endmodule
