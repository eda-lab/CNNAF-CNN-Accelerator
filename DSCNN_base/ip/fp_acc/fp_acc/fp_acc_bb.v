module fp_acc (
		input  wire        clk,    //    clk.clk
		input  wire        areset, // areset.reset
		input  wire [31:0] x,      //      x.x
		input  wire        n,      //      n.n
		output wire [31:0] r,      //      r.r
		output wire        xo,     //     xo.xo
		output wire        xu,     //     xu.xu
		output wire        ao,     //     ao.ao
		input  wire [0:0]  en      //     en.en
	);
endmodule

