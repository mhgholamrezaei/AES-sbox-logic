module sbox(input [7:0] x, output reg[7:0] z);

always @(*) begin
    case( x )

        8'h00: z = 8'h63;
		8'h01: z = 8'h7C;
		8'h02: z = 8'h77;
		8'h03: z = 8'h7B;
		8'h04: z = 8'hF2;
		8'h05: z = 8'h6B;
		8'h06: z = 8'h6F;
		8'h07: z = 8'hC5;
		8'h08: z = 8'h30;
		8'h09: z = 8'h01;
		8'h0A: z = 8'h67;
		8'h0B: z = 8'h2B;
		8'h0C: z = 8'hFE;
		8'h0D: z = 8'hD7;
		8'h0E: z = 8'hAB;
		8'h0F: z = 8'h76;
		8'h10: z = 8'hCA;
		8'h11: z = 8'h82;
		8'h12: z = 8'hC9;
		8'h13: z = 8'h7D;
		8'h14: z = 8'hFA;
		8'h15: z = 8'h59;
		8'h16: z = 8'h47;
		8'h17: z = 8'hF0;
		8'h18: z = 8'hAD;
		8'h19: z = 8'hD4;
		8'h1A: z = 8'hA2;
		8'h1B: z = 8'hAF;
		8'h1C: z = 8'h9C;
		8'h1D: z = 8'hA4;
		8'h1E: z = 8'h72;
		8'h1F: z = 8'hC0;
		8'h20: z = 8'hB7;
		8'h21: z = 8'hFD;
		8'h22: z = 8'h93;
		8'h23: z = 8'h26;
		8'h24: z = 8'h36;
		8'h25: z = 8'h3F;
		8'h26: z = 8'hF7;
		8'h27: z = 8'hCC;
		8'h28: z = 8'h34;
		8'h29: z = 8'hA5;
		8'h2A: z = 8'hE5;
		8'h2B: z = 8'hF1;
		8'h2C: z = 8'h71;
		8'h2D: z = 8'hD8;
		8'h2E: z = 8'h31;
		8'h2F: z = 8'h15;
		8'h30: z = 8'h04;
		8'h31: z = 8'hC7;
		8'h32: z = 8'h23;
		8'h33: z = 8'hC3;
		8'h34: z = 8'h18;
		8'h35: z = 8'h96;
		8'h36: z = 8'h05;
		8'h37: z = 8'h9A;
		8'h38: z = 8'h07;
		8'h39: z = 8'h12;
		8'h3A: z = 8'h80;
		8'h3B: z = 8'hE2;
		8'h3C: z = 8'hEB;
		8'h3D: z = 8'h27;
		8'h3E: z = 8'hB2;
		8'h3F: z = 8'h75;
		8'h40: z = 8'h09;
		8'h41: z = 8'h83;
		8'h42: z = 8'h2C;
		8'h43: z = 8'h1A;
		8'h44: z = 8'h1B;
		8'h45: z = 8'h6E;
		8'h46: z = 8'h5A;
		8'h47: z = 8'hA0;
		8'h48: z = 8'h52;
		8'h49: z = 8'h3B;
		8'h4A: z = 8'hD6;
		8'h4B: z = 8'hB3;
		8'h4C: z = 8'h29;
		8'h4D: z = 8'hE3;
		8'h4E: z = 8'h2F;
		8'h4F: z = 8'h84;
		8'h50: z = 8'h53;
		8'h51: z = 8'hD1;
		8'h52: z = 8'h00;
		8'h53: z = 8'hED;
		8'h54: z = 8'h20;
		8'h55: z = 8'hFC;
		8'h56: z = 8'hB1;
		8'h57: z = 8'h5B;
		8'h58: z = 8'h6A;
		8'h59: z = 8'hCB;
		8'h5A: z = 8'hBE;
		8'h5B: z = 8'h39;
		8'h5C: z = 8'h4A;
		8'h5D: z = 8'h4C;
		8'h5E: z = 8'h58;
		8'h5F: z = 8'hCF;
		8'h60: z = 8'hD0;
		8'h61: z = 8'hEF;
		8'h62: z = 8'hAA;
		8'h63: z = 8'hFB;
		8'h64: z = 8'h43;
		8'h65: z = 8'h4D;
		8'h66: z = 8'h33;
		8'h67: z = 8'h85;
		8'h68: z = 8'h45;
		8'h69: z = 8'hF9;
		8'h6A: z = 8'h02;
		8'h6B: z = 8'h7F;
		8'h6C: z = 8'h50;
		8'h6D: z = 8'h3C;
		8'h6E: z = 8'h9F;
		8'h6F: z = 8'hA8;
		8'h70: z = 8'h51;
		8'h71: z = 8'hA3;
		8'h72: z = 8'h40;
		8'h73: z = 8'h8F;
		8'h74: z = 8'h92;
		8'h75: z = 8'h9D;
		8'h76: z = 8'h38;
		8'h77: z = 8'hF5;
		8'h78: z = 8'hBC;
		8'h79: z = 8'hB6;
		8'h7A: z = 8'hDA;
		8'h7B: z = 8'h21;
		8'h7C: z = 8'h10;
		8'h7D: z = 8'hFF;
		8'h7E: z = 8'hF3;
		8'h7F: z = 8'hD2;
		8'h80: z = 8'hCD;
		8'h81: z = 8'h0C;
		8'h82: z = 8'h13;
		8'h83: z = 8'hEC;
		8'h84: z = 8'h5F;
		8'h85: z = 8'h97;
		8'h86: z = 8'h44;
		8'h87: z = 8'h17;
		8'h88: z = 8'hC4;
		8'h89: z = 8'hA7;
		8'h8A: z = 8'h7E;
		8'h8B: z = 8'h3D;
		8'h8C: z = 8'h64;
		8'h8D: z = 8'h5D;
		8'h8E: z = 8'h19;
		8'h8F: z = 8'h73;
		8'h90: z = 8'h60;
		8'h91: z = 8'h81;
		8'h92: z = 8'h4F;
		8'h93: z = 8'hDC;
		8'h94: z = 8'h22;
		8'h95: z = 8'h2A;
		8'h96: z = 8'h90;
		8'h97: z = 8'h88;
		8'h98: z = 8'h46;
		8'h99: z = 8'hEE;
		8'h9A: z = 8'hB8;
		8'h9B: z = 8'h14;
		8'h9C: z = 8'hDE;
		8'h9D: z = 8'h5E;
		8'h9E: z = 8'h0B;
		8'h9F: z = 8'hDB;
		8'hA0: z = 8'hE0;
		8'hA1: z = 8'h32;
		8'hA2: z = 8'h3A;
		8'hA3: z = 8'h0A;
		8'hA4: z = 8'h49;
		8'hA5: z = 8'h06;
		8'hA6: z = 8'h24;
		8'hA7: z = 8'h5C;
		8'hA8: z = 8'hC2;
		8'hA9: z = 8'hD3;
		8'hAA: z = 8'hAC;
		8'hAB: z = 8'h62;
		8'hAC: z = 8'h91;
		8'hAD: z = 8'h95;
		8'hAE: z = 8'hE4;
		8'hAF: z = 8'h79;
		8'hB0: z = 8'hE7;
		8'hB1: z = 8'hC8;
		8'hB2: z = 8'h37;
		8'hB3: z = 8'h6D;
		8'hB4: z = 8'h8D;
		8'hB5: z = 8'hD5;
		8'hB6: z = 8'h4E;
		8'hB7: z = 8'hA9;
		8'hB8: z = 8'h6C;
		8'hB9: z = 8'h56;
		8'hBA: z = 8'hF4;
		8'hBB: z = 8'hEA;
		8'hBC: z = 8'h65;
		8'hBD: z = 8'h7A;
		8'hBE: z = 8'hAE;
		8'hBF: z = 8'h08;
		8'hC0: z = 8'hBA;
		8'hC1: z = 8'h78;
		8'hC2: z = 8'h25;
		8'hC3: z = 8'h2E;
		8'hC4: z = 8'h1C;
		8'hC5: z = 8'hA6;
		8'hC6: z = 8'hB4;
		8'hC7: z = 8'hC6;
		8'hC8: z = 8'hE8;
		8'hC9: z = 8'hDD;
		8'hCA: z = 8'h74;
		8'hCB: z = 8'h1F;
		8'hCC: z = 8'h4B;
		8'hCD: z = 8'hBD;
		8'hCE: z = 8'h8B;
		8'hCF: z = 8'h8A;
		8'hD0: z = 8'h70;
		8'hD1: z = 8'h3E;
		8'hD2: z = 8'hB5;
		8'hD3: z = 8'h66;
		8'hD4: z = 8'h48;
		8'hD5: z = 8'h03;
		8'hD6: z = 8'hF6;
		8'hD7: z = 8'h0E;
		8'hD8: z = 8'h61;
		8'hD9: z = 8'h35;
		8'hDA: z = 8'h57;
		8'hDB: z = 8'hB9;
		8'hDC: z = 8'h86;
		8'hDD: z = 8'hC1;
		8'hDE: z = 8'h1D;
		8'hDF: z = 8'h9E;
		8'hE0: z = 8'hE1;
		8'hE1: z = 8'hF8;
		8'hE2: z = 8'h98;
		8'hE3: z = 8'h11;
		8'hE4: z = 8'h69;
		8'hE5: z = 8'hD9;
		8'hE6: z = 8'h8E;
		8'hE7: z = 8'h94;
		8'hE8: z = 8'h9B;
		8'hE9: z = 8'h1E;
		8'hEA: z = 8'h87;
		8'hEB: z = 8'hE9;
		8'hEC: z = 8'hCE;
		8'hED: z = 8'h55;
		8'hEE: z = 8'h28;
		8'hEF: z = 8'hDF;
		8'hF0: z = 8'h8C;
		8'hF1: z = 8'hA1;
		8'hF2: z = 8'h89;
		8'hF3: z = 8'h0D;
		8'hF4: z = 8'hBF;
		8'hF5: z = 8'hE6;
		8'hF6: z = 8'h42;
		8'hF7: z = 8'h68;
		8'hF8: z = 8'h41;
		8'hF9: z = 8'h99;
		8'hFA: z = 8'h2D;
		8'hFB: z = 8'h0F;
		8'hFC: z = 8'hB0;
		8'hFD: z = 8'h54;
		8'hFE: z = 8'hBB;
		8'hFF: z = 8'h16;
        default: z = 0;
    endcase
end
endmodule
