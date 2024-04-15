//-------------------------

// ReLU Activation Function

//-------------------------

module ReLU (input logic [31:0] activation_input,
            output logic [31:0] activation_output);
				 
assign activation_output = (activation_input[31] == 0) ? activation_input : 32'b0;

endmodule

//----------------------------

// Sigmoid Activation Function

//----------------------------


module SigmoidLUTs (input logic [31:0] activation_input,
						 output logic [31:0] activation_output);
						 
// VARIABLE DECLARATION
						 
logic flag1,  flag2,  flag3,  flag4,  flag5,  flag6,  flag7,  flag8,  flag9,  flag10;
logic flag11, flag12, flag13, flag14, flag15, flag16, flag17, flag18, flag19, flag20;
logic flag21, flag22, flag23, flag24, flag25, flag26, flag27, flag28, flag29, flag30;
logic flag31, flag32, flag33, flag34, flag35, flag36, flag37, flag38, flag39, flag40;
logic flag41, flag42, flag43, flag44, flag45, flag46, flag47, flag48, flag49, flag50;
logic flag51, flag52, flag53, flag54, flag55, flag56, flag57, flag58, flag59, flag60;
logic flag61, flag62, flag63, flag64, flag65, flag66, flag67, flag68, flag69, flag70;
logic flag71, flag72, flag73, flag74, flag75, flag76, flag77, flag78, flag79, flag80;
logic flag81, flag82, flag83, flag84, flag85, flag86, flag87, flag88, flag89, flag90;
logic flag91, flag92, flag93, flag94, flag95, flag96, flag97, flag98, flag99, flag100;						 
						 					 
logic [31:0] threshold1,  threshold2,  threshold3,  threshold4,  threshold5,  threshold6,  threshold7,  threshold8,  threshold9,  threshold10;
logic [31:0] threshold11, threshold12, threshold13, threshold14, threshold15, threshold16, threshold17, threshold18, threshold19, threshold20;
logic [31:0] threshold21, threshold22, threshold23, threshold24, threshold25, threshold26, threshold27, threshold28, threshold29, threshold30;
logic [31:0] threshold31, threshold32, threshold33, threshold34, threshold35, threshold36, threshold37, threshold38, threshold39, threshold40;
logic [31:0] threshold41, threshold42, threshold43, threshold44, threshold45, threshold46, threshold47, threshold48, threshold49, threshold50;
logic [31:0] threshold51, threshold52, threshold53, threshold54, threshold55, threshold56, threshold57, threshold58, threshold59, threshold60;
logic [31:0] threshold61, threshold62, threshold63, threshold64, threshold65, threshold66, threshold67, threshold68, threshold69, threshold70;
logic [31:0] threshold71, threshold72, threshold73, threshold74, threshold75, threshold76, threshold77, threshold78, threshold79, threshold80;
logic [31:0] threshold81, threshold82, threshold83, threshold84, threshold85, threshold86, threshold87, threshold88, threshold89, threshold90;
logic [31:0] threshold91, threshold92, threshold93, threshold94, threshold95, threshold96, threshold97, threshold98, threshold99, threshold100;

logic [31:0] sig_val1,  sig_val2,  sig_val3,  sig_val4,  sig_val5,  sig_val6,  sig_val7,  sig_val8,  sig_val9,  sig_val10;
logic [31:0] sig_val11, sig_val12, sig_val13, sig_val14, sig_val15, sig_val16, sig_val17, sig_val18, sig_val19, sig_val20;
logic [31:0] sig_val21, sig_val22, sig_val23, sig_val24, sig_val25, sig_val26, sig_val27, sig_val28, sig_val29, sig_val30;
logic [31:0] sig_val31, sig_val32, sig_val33, sig_val34, sig_val35, sig_val36, sig_val37, sig_val38, sig_val39, sig_val40;
logic [31:0] sig_val41, sig_val42, sig_val43, sig_val44, sig_val45, sig_val46, sig_val47, sig_val48, sig_val49, sig_val50;
logic [31:0] sig_val51, sig_val52, sig_val53, sig_val54, sig_val55, sig_val56, sig_val57, sig_val58, sig_val59, sig_val60;
logic [31:0] sig_val61, sig_val62, sig_val63, sig_val64, sig_val65, sig_val66, sig_val67, sig_val68, sig_val69, sig_val70;
logic [31:0] sig_val71, sig_val72, sig_val73, sig_val74, sig_val75, sig_val76, sig_val77, sig_val78, sig_val79, sig_val80;
logic [31:0] sig_val81, sig_val82, sig_val83, sig_val84, sig_val85, sig_val86, sig_val87, sig_val88, sig_val89, sig_val90;
logic [31:0] sig_val91, sig_val92, sig_val93, sig_val94, sig_val95, sig_val96, sig_val97, sig_val98, sig_val99;

// THRESHOLD VALUES


assign threshold1= 32'b11100000000000000000000000000000;
assign threshold2= 32'b11100000101001010111101001111001;
assign threshold3= 32'b11100001010010101111010011110001;
assign threshold4= 32'b11100001111100000110111101101010;
assign threshold5= 32'b11100010100101100000010000011001;
assign threshold6= 32'b11100011001110110111111010010001;
assign threshold7= 32'b11100011111000001111100100001010;
assign threshold8= 32'b11100100100001100111001110000010;
assign threshold9= 32'b11100101001010111110110111111011;
assign threshold10= 32'b11100101110100010110100001110011;

assign threshold11= 32'b11100110011101101111110100100010;
assign threshold12= 32'b11100111000111000111011110011011;
assign threshold13= 32'b11100111110000011111001000010011;
assign threshold14= 32'b11101000011001110110110010001100;
assign threshold15= 32'b11101001000011001110011100000100;
assign threshold16= 32'b11101001101100100110000101111101;
assign threshold17= 32'b11101010010101111111011000101100;
assign threshold18= 32'b11101010111111010111000010100100;
assign threshold19= 32'b11101011101000101110101100011101;
assign threshold20= 32'b11101100010010000110010110010101;

assign threshold21= 32'b11101100111011011110000000001110;
assign threshold22= 32'b11101101100100110101101010000110;
assign threshold23= 32'b11101110001110001110111100110101;
assign threshold24= 32'b11101110110111100110100110101110;
assign threshold25= 32'b11101111100000111110010000100110;
assign threshold26= 32'b11110000001010010101111010011111;
assign threshold27= 32'b11110000110011101101100100010111;
assign threshold28= 32'b11110001011101000101001110001111;
assign threshold29= 32'b11110010000110011110100000111111;
assign threshold30= 32'b11110010101111110110001010110111;

assign threshold31= 32'b11110011011001001101110100110000;
assign threshold32= 32'b11110100000010100101011110101000;
assign threshold33= 32'b11110100101011111101001000100000;
assign threshold34= 32'b11110101010101010100110010011001;
assign threshold35= 32'b11110101111110101100011100010001;
assign threshold36= 32'b11110110101000000101101111000001;
assign threshold37= 32'b11110111010001011101011000111001;
assign threshold38= 32'b11110111111010110101000010110001;
assign threshold39= 32'b11111000100100001100101100101010;
assign threshold40= 32'b11111001001101100100010110100010;

assign threshold41= 32'b11111001110110111100000000011011;
assign threshold42= 32'b11111010100000010101010011001010;
assign threshold43= 32'b11111011001001101100111101000010;
assign threshold44= 32'b11111011110011000100100110111011;
assign threshold45= 32'b11111100011100011100010000110011;
assign threshold46= 32'b11111101000101110011111010101100;
assign threshold47= 32'b11111101101111001011100100100100;
assign threshold48= 32'b11111110011000100100110111010011;
assign threshold49= 32'b11111111000001111100100001001100;
assign threshold50= 32'b11111111101011010100001011000100;

assign threshold51= 32'b00000000010100101011110100111100;
assign threshold52= 32'b00000000111110000011011110110100;
assign threshold53= 32'b00000001100111011011001000101101;
assign threshold54= 32'b00000010010000110100011011011100;
assign threshold55= 32'b00000010111010001100000101010100;
assign threshold56= 32'b00000011100011100011101111001101;
assign threshold57= 32'b00000100001100111011011001000101;
assign threshold58= 32'b00000100110110010011000010111110;
assign threshold59= 32'b00000101011111101010101100110110;
assign threshold60= 32'b00000110001001000011111111100101;

assign threshold61= 32'b00000110110010011011101001011110;
assign threshold62= 32'b00000111011011110011010011010110;
assign threshold63= 32'b00001000000101001010111101001111;
assign threshold64= 32'b00001000101110100010100111000111;
assign threshold65= 32'b00001001010111111010010000111111;
assign threshold66= 32'b00001010000001010011100011101111;
assign threshold67= 32'b00001010101010101011001101100111;
assign threshold68= 32'b00001011010100000010110111100000;
assign threshold69= 32'b00001011111101011010100001011000;

assign threshold70= 32'b00001100100110110010001011010000;
assign threshold71= 32'b00001101010000001001110101001001;
assign threshold72= 32'b00001101111001100001011111000001;
assign threshold73= 32'b00001110100010111010110001110001;
assign threshold74= 32'b00001111001100010010011011101001;
assign threshold75= 32'b00001111110101101010000101100001;
assign threshold76= 32'b00010000011111000001101111011010;
assign threshold77= 32'b00010001001000011001011001010010;
assign threshold78= 32'b00010001110001110001000011001011;
assign threshold79= 32'b00010010011011001010010101111010;

assign threshold80= 32'b00010011000100100001111111110010;
assign threshold81= 32'b00010011101101111001101001101011;
assign threshold82= 32'b00010100010111010001010011100011;
assign threshold83= 32'b00010101000000101000111101011100;
assign threshold84= 32'b00010101101010000000100111010100;
assign threshold85= 32'b00010110010011011001111010000011;
assign threshold86= 32'b00010110111100110001100011111100;
assign threshold87= 32'b00010111100110001001001101110100;
assign threshold88= 32'b00011000001111100000110111101101;
assign threshold89= 32'b00011000111000111000100001100101;

assign threshold90= 32'b00011001100010010000001011011110;
assign threshold91= 32'b00011010001011101001011110001101;
assign threshold92= 32'b00011010110101000001001000000101;
assign threshold93= 32'b00011011011110011000110001111110;
assign threshold94= 32'b00011100000111110000011011110110;
assign threshold95= 32'b00011100110001001000000101101111;
assign threshold96= 32'b00011101011010011111101111100111;
assign threshold97= 32'b00011110000011111001000010010110;
assign threshold98= 32'b00011110101101010000101100001111;
assign threshold99= 32'b00011111010110101000010110000111;
assign threshold100= 32'b00100000000000000000000000000000;

// SIGMOID VALUES

assign sig_val1= 32'b00000000000000000100111010100100;
assign sig_val2= 32'b00000000000000000110100011011011;
assign sig_val3= 32'b00000000000000001000001100010010;
assign sig_val4= 32'b00000000000000001000001100010010;
assign sig_val5= 32'b00000000000000001001110101001001;
assign sig_val6= 32'b00000000000000001101000110110111;
assign sig_val7= 32'b00000000000000001110101111101101;
assign sig_val8= 32'b00000000000000010000011000100100;
assign sig_val9= 32'b00000000000000010011101010010010;
assign sig_val10= 32'b00000000000000010110111100000000;

assign sig_val11= 32'b00000000000000011011110110100101;
assign sig_val12= 32'b00000000000000100000110001001001;
assign sig_val13= 32'b00000000000000100101101011101110;
assign sig_val14= 32'b00000000000000101100001111001001;
assign sig_val15= 32'b00000000000000110100011011011100;
assign sig_val16= 32'b00000000000000111110010000100101;
assign sig_val17= 32'b00000000000001001000000101101111;
assign sig_val18= 32'b00000000000001010101001100100110;
assign sig_val19= 32'b00000000000001100011111100010100;

assign sig_val20= 32'b00000000000001110101111101101111;
assign sig_val21= 32'b00000000000010001001101000000010;
assign sig_val22= 32'b00000000000010100010001100111001;
assign sig_val23= 32'b00000000000010111110000011011110;
assign sig_val24= 32'b00000000000011011110110100101000;
assign sig_val25= 32'b00000000000100000110001001001101;
assign sig_val26= 32'b00000000000100110010011000010111;
assign sig_val27= 32'b00000000000101100110110011110100;
assign sig_val28= 32'b00000000000110100101000100011001;
assign sig_val29= 32'b00000000000111101011100001010001;

assign sig_val30= 32'b00000000001000111111000101000001;
assign sig_val31= 32'b00000000001010011111101111100111;
assign sig_val32= 32'b00000000001100010000110010110010;
assign sig_val33= 32'b00000000001110010010001110100010;
assign sig_val34= 32'b00000000010000101000111101011100;
assign sig_val35= 32'b00000000010011010100111111011111;
assign sig_val36= 32'b00000000010110011011001111010000;
assign sig_val37= 32'b00000000011001111101010101100110;
assign sig_val38= 32'b00000000011101111110100100001111;
assign sig_val39= 32'b00000000100010100010001100111001;

assign sig_val40= 32'b00000000100111101001111000011011;
assign sig_val41= 32'b00000000101101010111001111101010;
assign sig_val42= 32'b00000000110011101101100100010110;
assign sig_val43= 32'b00000000111010101100110110011110;
assign sig_val44= 32'b00000001000010010101000110000010;
assign sig_val45= 32'b00000001001010100100101010001100;
assign sig_val46= 32'b00000001010011011001111010000011;
assign sig_val47= 32'b00000001011100101110010010001110;
assign sig_val48= 32'b00000001100110011110100000111110;
assign sig_val49= 32'b00000001110000100100000010110111;

assign sig_val50= 32'b00000001111010110101000010110000;
assign sig_val51= 32'b00000010000101001010111101001111;
assign sig_val52= 32'b00000010001111011011111101001000;
assign sig_val53= 32'b00000010011001100001011111000001;
assign sig_val54= 32'b00000010100011010001101101110001;
assign sig_val55= 32'b00000010101100100110000101111100;
assign sig_val56= 32'b00000010110101011011010101110011;
assign sig_val57= 32'b00000010111101101010111001111101;
assign sig_val58= 32'b00000011000101010011001001100001;
assign sig_val59= 32'b00000011001100010010011011101001;

assign sig_val60= 32'b00000011010010101000110000010101;
assign sig_val61= 32'b00000011011000010110000111100100;
assign sig_val62= 32'b00000011011101011101110011000110;
assign sig_val63= 32'b00000011100010000001011011110000;
assign sig_val64= 32'b00000011100110000010101010011001;
assign sig_val65= 32'b00000011101001100100110000101111;
assign sig_val66= 32'b00000011101100101011000000100000;
assign sig_val67= 32'b00000011101111010111000010100011;
assign sig_val68= 32'b00000011110001101101110001011101;
assign sig_val69= 32'b00000011110011101111001101001101;

assign sig_val70= 32'b00000011110101100000010000011000;
assign sig_val71= 32'b00000011110111000000111010111110;
assign sig_val72= 32'b00000011111000010100011110101110;
assign sig_val73= 32'b00000011111001011010111011100110;
assign sig_val74= 32'b00000011111010011001001100001011;
assign sig_val75= 32'b00000011111011001101100111101000;
assign sig_val76= 32'b00000011111011111001110110110010;
assign sig_val77= 32'b00000011111100100001001011010111;
assign sig_val78= 32'b00000011111101000001111100100001;
assign sig_val79= 32'b00000011111101011101110011000110;

assign sig_val80= 32'b00000011111101110110010111111101;
assign sig_val81= 32'b00000011111110001010000010010000;
assign sig_val82= 32'b00000011111110011100000011101011;
assign sig_val83= 32'b00000011111110101010110011011001;
assign sig_val84= 32'b00000011111110110111111010010000;
assign sig_val85= 32'b00000011111111000001101111011010;
assign sig_val86= 32'b00000011111111001011100100100011;
assign sig_val87= 32'b00000011111111010011110000110110;
assign sig_val88= 32'b00000011111111011010010100010001;
assign sig_val89= 32'b00000011111111011111001110110110;

assign sig_val90= 32'b00000011111111100100001001011010;
assign sig_val91= 32'b00000011111111101001000011111111;
assign sig_val92= 32'b00000011111111101100010101101101;
assign sig_val93= 32'b00000011111111101111100111011011;
assign sig_val94= 32'b00000011111111110001010000010010;
assign sig_val95= 32'b00000011111111110010111001001000;
assign sig_val96= 32'b00000011111111110110001010110110;
assign sig_val97= 32'b00000011111111110111110011101101;
assign sig_val98= 32'b00000011111111110111110011101101;
assign sig_val99= 32'b00000011111111111001011100100100;

// LUTs are implemented here

// Comparison Units



// Units 1 - 10

comparefixedpoint c1(
                 .a      (activation_input),
                 .b      (threshold1),
                 .q      (flag1)
                 );
comparefixedpoint c2(
                 .a      (activation_input),
                 .b      (threshold2),
                 .q      (flag2)
                 );
comparefixedpoint c3(
                 .a      (activation_input),
                 .b      (threshold3),
                 .q      (flag3)
                 );
comparefixedpoint c4(
                 .a      (activation_input),
                 .b      (threshold4),
                 .q      (flag4)
                 );
comparefixedpoint c5(
                 .a      (activation_input),
                 .b      (threshold5),
                 .q      (flag5)
                 );
comparefixedpoint c6(
                 .a      (activation_input),
                 .b      (threshold6),
                 .q      (flag6)
                 );
comparefixedpoint c7(
                 .a      (activation_input),
                 .b      (threshold7),
                 .q      (flag7)
                 );
comparefixedpoint c8(
                 .a      (activation_input),
                 .b      (threshold8),
                 .q      (flag8)
                 );
comparefixedpoint c9(
                 .a      (activation_input),
                 .b      (threshold9),
                 .q      (flag9)
                 );
comparefixedpoint c10(
                 .a      (activation_input),
                 .b      (threshold10),
                 .q      (flag10)
                 );
comparefixedpoint c11(
                 .a      (activation_input),
                 .b      (threshold11),
                 .q      (flag11)
                 );
comparefixedpoint c12(
                 .a      (activation_input),
                 .b      (threshold12),
                 .q      (flag12)
                 );
comparefixedpoint c13(
                 .a      (activation_input),
                 .b      (threshold13),
                 .q      (flag13)
                 );
comparefixedpoint c14(
                 .a      (activation_input),
                 .b      (threshold14),
                 .q      (flag14)
                 );
comparefixedpoint c15(
                 .a      (activation_input),
                 .b      (threshold15),
                 .q      (flag15)
                 );
comparefixedpoint c16(
                 .a      (activation_input),
                 .b      (threshold16),
                 .q      (flag16)
                 );
comparefixedpoint c17(
                 .a      (activation_input),
                 .b      (threshold17),
                 .q      (flag17)
                 );
comparefixedpoint c18(
                 .a      (activation_input),
                 .b      (threshold18),
                 .q      (flag18)
                 );
comparefixedpoint c19(
                 .a      (activation_input),
                 .b      (threshold19),
                 .q      (flag19)
                 );
comparefixedpoint c20(
                 .a      (activation_input),
                 .b      (threshold20),
                 .q      (flag20)
                 );
comparefixedpoint c21(
                 .a      (activation_input),
                 .b      (threshold21),
                 .q      (flag21)
                 );
comparefixedpoint c22(
                 .a      (activation_input),
                 .b      (threshold22),
                 .q      (flag22)
                 );
comparefixedpoint c23(
                 .a      (activation_input),
                 .b      (threshold23),
                 .q      (flag23)
                 );
comparefixedpoint c24(
                 .a      (activation_input),
                 .b      (threshold24),
                 .q      (flag24)
                 );
comparefixedpoint c25(
                 .a      (activation_input),
                 .b      (threshold25),
                 .q      (flag25)
                 );
comparefixedpoint c26(
                 .a      (activation_input),
                 .b      (threshold26),
                 .q      (flag26)
                 );
comparefixedpoint c27(
                 .a      (activation_input),
                 .b      (threshold27),
                 .q      (flag27)
                 );
comparefixedpoint c28(
                 .a      (activation_input),
                 .b      (threshold28),
                 .q      (flag28)
                 );
comparefixedpoint c29(
                 .a      (activation_input),
                 .b      (threshold29),
                 .q      (flag29)
                 );
comparefixedpoint c30(
                 .a      (activation_input),
                 .b      (threshold30),
                 .q      (flag30)
                 );
comparefixedpoint c31(
                 .a      (activation_input),
                 .b      (threshold31),
                 .q      (flag31)
                 );
comparefixedpoint c32(
                 .a      (activation_input),
                 .b      (threshold32),
                 .q      (flag32)
                 );
comparefixedpoint c33(
                 .a      (activation_input),
                 .b      (threshold33),
                 .q      (flag33)
                 );
comparefixedpoint c34(
                 .a      (activation_input),
                 .b      (threshold34),
                 .q      (flag34)
                 );
comparefixedpoint c35(
                 .a      (activation_input),
                 .b      (threshold35),
                 .q      (flag35)
                 );
comparefixedpoint c36(
                 .a      (activation_input),
                 .b      (threshold36),
                 .q      (flag36)
                 );
comparefixedpoint c37(
                 .a      (activation_input),
                 .b      (threshold37),
                 .q      (flag37)
                 );
comparefixedpoint c38(
                 .a      (activation_input),
                 .b      (threshold38),
                 .q      (flag38)
                 );
comparefixedpoint c39(
                 .a      (activation_input),
                 .b      (threshold39),
                 .q      (flag39)
                 );
comparefixedpoint c40(
                 .a      (activation_input),
                 .b      (threshold40),
                 .q      (flag40)
                 );
comparefixedpoint c41(
                 .a      (activation_input),
                 .b      (threshold41),
                 .q      (flag41)
                 );
comparefixedpoint c42(
                 .a      (activation_input),
                 .b      (threshold42),
                 .q      (flag42)
                 );
comparefixedpoint c43(
                 .a      (activation_input),
                 .b      (threshold43),
                 .q      (flag43)
                 );
comparefixedpoint c44(
                 .a      (activation_input),
                 .b      (threshold44),
                 .q      (flag44)
                 );
comparefixedpoint c45(
                 .a      (activation_input),
                 .b      (threshold45),
                 .q      (flag45)
                 );
comparefixedpoint c46(
                 .a      (activation_input),
                 .b      (threshold46),
                 .q      (flag46)
                 );
comparefixedpoint c47(
                 .a      (activation_input),
                 .b      (threshold47),
                 .q      (flag47)
                 );
comparefixedpoint c48(
                 .a      (activation_input),
                 .b      (threshold48),
                 .q      (flag48)
                 );
comparefixedpoint c49(
                 .a      (activation_input),
                 .b      (threshold49),
                 .q      (flag49)
                 );
comparefixedpoint c50(
                 .a      (activation_input),
                 .b      (threshold50),
                 .q      (flag50)
                 );
comparefixedpoint c51(
                 .a      (activation_input),
                 .b      (threshold51),
                 .q      (flag51)
                 );
comparefixedpoint c52(
                 .a      (activation_input),
                 .b      (threshold52),
                 .q      (flag52)
                 );
comparefixedpoint c53(
                 .a      (activation_input),
                 .b      (threshold53),
                 .q      (flag53)
                 );
comparefixedpoint c54(
                 .a      (activation_input),
                 .b      (threshold54),
                 .q      (flag54)
                 );
comparefixedpoint c55(
                 .a      (activation_input),
                 .b      (threshold55),
                 .q      (flag55)
                 );
comparefixedpoint c56(
                 .a      (activation_input),
                 .b      (threshold56),
                 .q      (flag56)
                 );
comparefixedpoint c57(
                 .a      (activation_input),
                 .b      (threshold57),
                 .q      (flag57)
                 );
comparefixedpoint c58(
                 .a      (activation_input),
                 .b      (threshold58),
                 .q      (flag58)
                 );
comparefixedpoint c59(
                 .a      (activation_input),
                 .b      (threshold59),
                 .q      (flag59)
                 );
comparefixedpoint c60(
                 .a      (activation_input),
                 .b      (threshold60),
                 .q      (flag60)
                 );
comparefixedpoint c61(
                 .a      (activation_input),
                 .b      (threshold61),
                 .q      (flag61)
                 );
comparefixedpoint c62(
                 .a      (activation_input),
                 .b      (threshold62),
                 .q      (flag62)
                 );
comparefixedpoint c63(
                 .a      (activation_input),
                 .b      (threshold63),
                 .q      (flag63)
                 );
comparefixedpoint c64(
                 .a      (activation_input),
                 .b      (threshold64),
                 .q      (flag64)
                 );
comparefixedpoint c65(
                 .a      (activation_input),
                 .b      (threshold65),
                 .q      (flag65)
                 );
comparefixedpoint c66(
                 .a      (activation_input),
                 .b      (threshold66),
                 .q      (flag66)
                 );
comparefixedpoint c67(
                 .a      (activation_input),
                 .b      (threshold67),
                 .q      (flag67)
                 );
comparefixedpoint c68(
                 .a      (activation_input),
                 .b      (threshold68),
                 .q      (flag68)
                 );
comparefixedpoint c69(
                 .a      (activation_input),
                 .b      (threshold69),
                 .q      (flag69)
                 );
comparefixedpoint c70(
                 .a      (activation_input),
                 .b      (threshold70),
                 .q      (flag70)
                 );
comparefixedpoint c71(
                 .a      (activation_input),
                 .b      (threshold71),
                 .q      (flag71)
                 );
comparefixedpoint c72(
                 .a      (activation_input),
                 .b      (threshold72),
                 .q      (flag72)
                 );
comparefixedpoint c73(
                 .a      (activation_input),
                 .b      (threshold73),
                 .q      (flag73)
                 );
comparefixedpoint c74(
                 .a      (activation_input),
                 .b      (threshold74),
                 .q      (flag74)
                 );
comparefixedpoint c75(
                 .a      (activation_input),
                 .b      (threshold75),
                 .q      (flag75)
                 );
comparefixedpoint c76(
                 .a      (activation_input),
                 .b      (threshold76),
                 .q      (flag76)
                 );
comparefixedpoint c77(
                 .a      (activation_input),
                 .b      (threshold77),
                 .q      (flag77)
                 );
comparefixedpoint c78(
                 .a      (activation_input),
                 .b      (threshold78),
                 .q      (flag78)
                 );
comparefixedpoint c79(
                 .a      (activation_input),
                 .b      (threshold79),
                 .q      (flag79)
                 );
comparefixedpoint c80(
                 .a      (activation_input),
                 .b      (threshold80),
                 .q      (flag80)
                 );
comparefixedpoint c81(
                 .a      (activation_input),
                 .b      (threshold81),
                 .q      (flag81)
                 );
comparefixedpoint c82(
                 .a      (activation_input),
                 .b      (threshold82),
                 .q      (flag82)
                 );
comparefixedpoint c83(
                 .a      (activation_input),
                 .b      (threshold83),
                 .q      (flag83)
                 );
comparefixedpoint c84(
                 .a      (activation_input),
                 .b      (threshold84),
                 .q      (flag84)
                 );
comparefixedpoint c85(
                 .a      (activation_input),
                 .b      (threshold85),
                 .q      (flag85)
                 );
comparefixedpoint c86(
                 .a      (activation_input),
                 .b      (threshold86),
                 .q      (flag86)
                 );
comparefixedpoint c87(
                 .a      (activation_input),
                 .b      (threshold87),
                 .q      (flag87)
                 );
comparefixedpoint c88(
                 .a      (activation_input),
                 .b      (threshold88),
                 .q      (flag88)
                 );
comparefixedpoint c89(
                 .a      (activation_input),
                 .b      (threshold89),
                 .q      (flag89)
                 );
comparefixedpoint c90(
                 .a      (activation_input),
                 .b      (threshold90),
                 .q      (flag90)
                 );
comparefixedpoint c91(
                 .a      (activation_input),
                 .b      (threshold91),
                 .q      (flag91)
                 );
comparefixedpoint c92(
                 .a      (activation_input),
                 .b      (threshold92),
                 .q      (flag92)
                 );
comparefixedpoint c93(
                 .a      (activation_input),
                 .b      (threshold93),
                 .q      (flag93)
                 );
comparefixedpoint c94(
                 .a      (activation_input),
                 .b      (threshold94),
                 .q      (flag94)
                 );
comparefixedpoint c95(
                 .a      (activation_input),
                 .b      (threshold95),
                 .q      (flag95)
                 );
comparefixedpoint c96(
                 .a      (activation_input),
                 .b      (threshold96),
                 .q      (flag96)
                 );
comparefixedpoint c97(
                 .a      (activation_input),
                 .b      (threshold97),
                 .q      (flag97)
                 );
comparefixedpoint c98(
                 .a      (activation_input),
                 .b      (threshold98),
                 .q      (flag98)
                 );
comparefixedpoint c99(
                 .a      (activation_input),
                 .b      (threshold99),
                 .q      (flag99)
                 );
comparefixedpoint c100(
                 .a      (activation_input),
                 .b      (threshold100),
                 .q      (flag100)
                 );
// SIGMOID VALUE ASSIGNMENT BASED ON COMPARISSON FLAGS

always_comb begin
	// less than -8 returns 0
	if (~flag1)begin
		activation_output <= 32'h00000000;
	end
	// 1 - 10 Sigmoid Approx Value
	else if (~flag2 && flag1)begin
		activation_output <= sig_val1;
	end
	else if (~flag3 && flag2)begin
		activation_output <= sig_val2;
	end
	else if (~flag4 && flag3)begin
		activation_output <= sig_val3;
	end
	else if (~flag5 && flag4)begin
		activation_output <= sig_val4;
	end
	else if (~flag6 && flag5)begin
		activation_output <= sig_val5;
	end
	else if (~flag7 && flag6)begin
		activation_output <= sig_val6;
	end
	else if (~flag8 && flag7)begin
		activation_output <= sig_val7;
	end
	else if (~flag9 && flag8)begin
		activation_output <= sig_val8;
	end
	else if (~flag10 && flag9)begin
		activation_output <= sig_val9;
	end
	else if (~flag11 && flag10)begin
		activation_output <= sig_val10;
	end
	
	// 11 - 20 Sigmoid Approx Value
	else if (~flag12 && flag11)begin
		activation_output <= sig_val11;
	end
	else if (~flag13 && flag12)begin
		activation_output <= sig_val12;
	end
	else if (~flag14 && flag13)begin
		activation_output <= sig_val13;
	end
	else if (~flag15 && flag14)begin
		activation_output <= sig_val14;
	end
	else if (~flag16 && flag15)begin
		activation_output <= sig_val15;
	end
	else if (~flag17 && flag16)begin
		activation_output <= sig_val16;
	end
	else if (~flag18 && flag17)begin
		activation_output <= sig_val17;
	end
	else if (~flag19 && flag18)begin
		activation_output <= sig_val18;
	end
	else if (~flag20 && flag19)begin
		activation_output <= sig_val19;
	end
	else if (~flag21 && flag20)begin
		activation_output <= sig_val20;
	end
	
	// 21 - 30 Sigmoid Approx Value
	else if (~flag22 && flag21)begin
		activation_output <= sig_val21;
	end
	else if (~flag23 && flag22)begin
		activation_output <= sig_val22;
	end
	else if (~flag24 && flag23)begin
		activation_output <= sig_val23;
	end
	else if (~flag25 && flag24)begin
		activation_output <= sig_val24;
	end
	else if (~flag26 && flag25)begin
		activation_output <= sig_val25;
	end
	else if (~flag27 && flag26)begin
		activation_output <= sig_val26;
	end
	else if (~flag28 && flag27)begin
		activation_output <= sig_val27;
	end
	else if (~flag29 && flag28)begin
		activation_output <= sig_val28;
	end
	else if (~flag30 && flag29)begin
		activation_output <= sig_val29;
	end
	else if (~flag31 && flag30)begin
		activation_output <= sig_val30;
	end
	
	// 31 - 40 Sigmoid Approx Value
	else if (~flag32 && flag31)begin
		activation_output <= sig_val31;
	end
	else if (~flag33 && flag32)begin
		activation_output <= sig_val32;
	end
	else if (~flag34 && flag33)begin
		activation_output <= sig_val33;
	end
	else if (~flag35 && flag34)begin
		activation_output <= sig_val34;
	end
	else if (~flag36 && flag35)begin
		activation_output <= sig_val35;
	end
	else if (~flag37 && flag36)begin
		activation_output <= sig_val36;
	end
	else if (~flag38 && flag37)begin
		activation_output <= sig_val37;
	end
	else if (~flag39 && flag38)begin
		activation_output <= sig_val38;
	end
	else if (~flag40 && flag39)begin
		activation_output <= sig_val39;
	end
	else if (~flag41 && flag40)begin
		activation_output <= sig_val40;
	end
		
	// 41 - 50 Sigmoid Approx Value
	else if (~flag42 && flag41)begin
		activation_output <= sig_val41;
	end
	else if (~flag43 && flag42)begin
		activation_output <= sig_val42;
	end
	else if (~flag44 && flag43)begin
		activation_output <= sig_val43;
	end
	else if (~flag45 && flag44)begin
		activation_output <= sig_val44;
	end
	else if (~flag46 && flag45)begin
		activation_output <= sig_val45;
	end
	else if (~flag47 && flag46)begin
		activation_output <= sig_val46;
	end
	else if (~flag48 && flag47)begin
		activation_output <= sig_val47;
	end
	else if (~flag9 && flag8)begin
		activation_output <= sig_val48;
	end
	else if (~flag50 && flag49)begin
		activation_output <= sig_val49;
	end
	else if (~flag51 && flag50)begin
		activation_output <= sig_val50;
	end
	
	// 51 - 60 Sigmoid Approx Value
	else if (~flag52 && flag51)begin
		activation_output <= sig_val51;
	end
	else if (~flag53 && flag52)begin
		activation_output <= sig_val52;
	end
	else if (~flag54 && flag53)begin
		activation_output <= sig_val53;
	end
	else if (~flag55 && flag54)begin
		activation_output <= sig_val54;
	end
	else if (~flag56 && flag55)begin
		activation_output <= sig_val55;
	end
	else if (~flag57 && flag56)begin
		activation_output <= sig_val56;
	end
	else if (~flag58 && flag57)begin
		activation_output <= sig_val57;
	end
	else if (~flag59 && flag58)begin
		activation_output <= sig_val58;
	end
	else if (~flag60 && flag59)begin
		activation_output <= sig_val59;
	end
	else if (~flag61 && flag60)begin
		activation_output <= sig_val60;
	end
		
	// 61 - 70 Sigmoid Approx Value
	else if (~flag62 && flag61)begin
		activation_output <= sig_val61;
	end
	else if (~flag63 && flag62)begin
		activation_output <= sig_val62;
	end
	else if (~flag64 && flag63)begin
		activation_output <= sig_val63;
	end
	else if (~flag65 && flag64)begin
		activation_output <= sig_val64;
	end
	else if (~flag66 && flag65)begin
		activation_output <= sig_val65;
	end
	else if (~flag67 && flag66)begin
		activation_output <= sig_val66;
	end
	else if (~flag68 && flag67)begin
		activation_output <= sig_val67;
	end
	else if (~flag69 && flag68)begin
		activation_output <= sig_val68;
	end
	else if (~flag70 && flag69)begin
		activation_output <= sig_val69;
	end
	else if (~flag71 && flag70)begin
		activation_output <= sig_val70;
	end
		
	// 71 - 80 Sigmoid Approx Value
	else if (~flag72 && flag71)begin
		activation_output <= sig_val71;
	end
	else if (~flag73 && flag72)begin
		activation_output <= sig_val72;
	end
	else if (~flag74 && flag73)begin
		activation_output <= sig_val73;
	end
	else if (~flag75 && flag74)begin
		activation_output <= sig_val74;
	end
	else if (~flag76 && flag75)begin
		activation_output <= sig_val75;
	end
	else if (~flag77 && flag76)begin
		activation_output <= sig_val76;
	end
	else if (~flag78 && flag77)begin
		activation_output <= sig_val77;
	end
	else if (~flag79 && flag78)begin
		activation_output <= sig_val78;
	end
	else if (~flag80 && flag79)begin
		activation_output <= sig_val79;
	end
	else if (~flag81 && flag80)begin
		activation_output <= sig_val80;
	end
		
	// 81 - 90 Sigmoid Approx Value
	else if (~flag82 && flag81)begin
		activation_output <= sig_val81;
	end
	else if (~flag83 && flag82)begin
		activation_output <= sig_val82;
	end
	else if (~flag84 && flag83)begin
		activation_output <= sig_val83;
	end
	else if (~flag85 && flag84)begin
		activation_output <= sig_val84;
	end
	else if (~flag86 && flag85)begin
		activation_output <= sig_val85;
	end
	else if (~flag87 && flag86)begin
		activation_output <= sig_val86;
	end
	else if (~flag88 && flag87)begin
		activation_output <= sig_val87;
	end
	else if (~flag89 && flag88)begin
		activation_output <= sig_val88;
	end
	else if (~flag90 && flag89)begin
		activation_output <= sig_val89;
	end
	else if (~flag91 && flag90)begin
		activation_output <= sig_val90;
	end
	
	// 91 - 99 Sigmoid Approx Value
	else if (~flag92 && flag91)begin
		activation_output <= sig_val91;
	end
	else if (~flag93 && flag92)begin
		activation_output <= sig_val92;
	end
	else if (~flag94 && flag93)begin
		activation_output <= sig_val93;
	end
	else if (~flag95 && flag94)begin
		activation_output <= sig_val94;
	end
	else if (~flag96 && flag95)begin
		activation_output <= sig_val95;
	end
	else if (~flag97 && flag96)begin
		activation_output <= sig_val96;
	end
	else if (~flag98 && flag97)begin
		activation_output <= sig_val97;
	end
	else if (~flag99 && flag98)begin
		activation_output <= sig_val98;
	end
	else if (~flag100 && flag99)begin
		activation_output <= sig_val99;
	end
		
	// greater than 8 returns 1
	else begin
		activation_output <= 32'h04000000;
	end
end

endmodule
