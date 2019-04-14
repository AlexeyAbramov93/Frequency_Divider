module Main (

    input         	inClk,
    input   	   	reset,
    input   [2:0]   	divider,
    output        	outClk
);

Frequency_divider frequency_divider (
	.inClk(inClk),
	.reset(reset),
	.divider(divider),
	.outClk(outClk)
);
endmodule
