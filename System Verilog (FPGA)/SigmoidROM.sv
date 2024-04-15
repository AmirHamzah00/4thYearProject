module SigmoidLUTs (input logic clk, reset,
						  input logic [31:0] activation_input,
						 output logic [31:0] activation_output);
						 
// VARIABLE DECLARATION

logic [6:0] address;
						 
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


// THRESHOLD VALUES

assign threshold1 = 32'hc1000000;
assign threshold2 = 32'hc0fad42c;
assign threshold3 = 32'hc0f5a858;
assign threshold4 = 32'hc0f07c85;
assign threshold5 = 32'hc0eb4fdf;
assign threshold6 = 32'hc0e6240b;
assign threshold7 = 32'hc0e0f838;
assign threshold8 = 32'hc0dbcc64;
assign threshold9 = 32'hc0d6a090;
assign threshold10 = 32'hc0d174bc;

assign threshold11 = 32'hc0cc4817;
assign threshold12 = 32'hc0c71c43;
assign threshold13 = 32'hc0c1f06f;
assign threshold14 = 32'hc0bcc49c;
assign threshold15 = 32'hc0b798c8;
assign threshold16 = 32'hc0b26cf4;
assign threshold17 = 32'hc0ad404f;
assign threshold18 = 32'hc0a8147b;
assign threshold19 = 32'hc0a2e8a7;
assign threshold20 = 32'hc09dbcd3;

assign threshold21 = 32'hc0989100;
assign threshold22 = 32'hc093652c;
assign threshold23 = 32'hc08e3886;
assign threshold24 = 32'hc0890cb3;
assign threshold25 = 32'hc083e0df;
assign threshold26 = 32'hc07d6a16;
assign threshold27 = 32'hc073126f;
assign threshold28 = 32'hc068bac7;
assign threshold29 = 32'hc05e617c;
assign threshold30 = 32'hc05409d5;

assign threshold31 = 32'hc049b22d;
assign threshold32 = 32'hc03f5a86;
assign threshold33 = 32'hc03502de;
assign threshold34 = 32'hc02aab36;
assign threshold35 = 32'hc020538f;
assign threshold36 = 32'hc015fa44;
assign threshold37 = 32'hc00ba29c;
assign threshold38 = 32'hc0014af5;
assign threshold39 = 32'hbfede69b;
assign threshold40 = 32'hbfd9374c;

assign threshold41 = 32'hbfc487fd;
assign threshold42 = 32'hbfafd567;
assign threshold43 = 32'hbf9b2618;
assign threshold44 = 32'hbf8676c9;
assign threshold45 = 32'hbf638ef3;
assign threshold46 = 32'hbf3a3055;
assign threshold47 = 32'hbf10d1b7;
assign threshold48 = 32'hbeced917;
assign threshold49 = 32'hbe7837b5;
assign threshold50 = 32'hbda57a78;

assign threshold51 = 32'h3da57a78;
assign threshold52 = 32'h3e7837b5;
assign threshold53 = 32'h3eced917;
assign threshold54 = 32'h3f10d1b7;
assign threshold55 = 32'h3f3a3055;
assign threshold56 = 32'h3f638ef3;
assign threshold57 = 32'h3f8676c9;
assign threshold58 = 32'h3f9b2618;
assign threshold59 = 32'h3fafd567;
assign threshold60 = 32'h3fc487fd;

assign threshold61 = 32'h3fd9374c;
assign threshold62 = 32'h3fede69b;
assign threshold63 = 32'h40014af5;
assign threshold64 = 32'h400ba29c;
assign threshold65 = 32'h4015fa44;
assign threshold66 = 32'h4020538f;
assign threshold67 = 32'h402aab36;
assign threshold68 = 32'h403502de;
assign threshold69 = 32'h403f5a86;
assign threshold70 = 32'h4049b22d;

assign threshold71 = 32'h405409d5;
assign threshold72 = 32'h405e617c;
assign threshold73 = 32'h4068bac7;
assign threshold74 = 32'h4073126f;
assign threshold75 = 32'h407d6a16;
assign threshold76 = 32'h4083e0df;
assign threshold77 = 32'h40890cb3;
assign threshold78 = 32'h408e3886;
assign threshold79 = 32'h4093652c;
assign threshold80 = 32'h40989100;

assign threshold81 = 32'h409dbcd3;
assign threshold82 = 32'h40a2e8a7;
assign threshold83 = 32'h40a8147b;
assign threshold84 = 32'h40ad404f;
assign threshold85 = 32'h40b26cf4;
assign threshold86 = 32'h40b798c8;
assign threshold87 = 32'h40bcc49c;
assign threshold88 = 32'h40c1f06f;
assign threshold89 = 32'h40c71c43;
assign threshold90 = 32'h40cc4817;

assign threshold91 = 32'h40d174bc;
assign threshold92 = 32'h40d6a090;
assign threshold93 = 32'h40dbcc64;
assign threshold94 = 32'h40e0f838;
assign threshold95 = 32'h40e6240b;
assign threshold96 = 32'h40eb4fdf;
assign threshold97 = 32'h40f07c85;
assign threshold98 = 32'h40f5a858;
assign threshold99 = 32'h40fad42c;
assign threshold100 = 32'h41000000;

// SIGMOID VALUES ARE READ FROM ROM
SigmoidROM (
				.address (address),
				.clock   (clk),
				.q       (activation_output)
			   );


// LUTs are implemented here

// Comparison Units

// Units 1 - 10

CompareFPU c1(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold1),      
					.q      (flag1)       
					);
					
CompareFPU c2(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold2),      
					.q      (flag2)       
					);
					
CompareFPU c3(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold3),      
					.q      (flag3)       
					);
					
CompareFPU c4(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold4),      
					.q      (flag4)       
					);
					
CompareFPU c5(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold5),      
					.q      (flag5)       
					);
					
CompareFPU c6(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold6),      
					.q      (flag6)       
					);
					
CompareFPU c7(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold7),      
					.q      (flag7)       
					);
					
CompareFPU c8(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold8),      
					.q      (flag8)       
					);
					
CompareFPU c9(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold9),      
					.q      (flag9)       
					);
					
CompareFPU c10(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold10),      
					.q      (flag10)       
					);

// Units 11 - 20

CompareFPU c11(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold11),      
					.q      (flag11)       
					);
					
CompareFPU c12(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold12),      
					.q      (flag12)       
					);
					
CompareFPU c13(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold13),      
					.q      (flag13)       
					);
					
CompareFPU c14(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold14),      
					.q      (flag14)       
					);
					
CompareFPU c15(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold15),      
					.q      (flag15)       
					);
					
CompareFPU c16(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold16),      
					.q      (flag16)       
					);
					
CompareFPU c17(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold17),      
					.q      (flag17)       
					);
					
CompareFPU c18(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold18),      
					.q      (flag18)       
					);
					
CompareFPU c19(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold19),      
					.q      (flag19)       
					);
					
CompareFPU c20(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold20),      
					.q      (flag20)       
					);

// Units 21 - 30

CompareFPU c21(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold21),      
					.q      (flag21)       
					);
					
CompareFPU c22(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold22),      
					.q      (flag22)       
					);
					
CompareFPU c23(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold23),      
					.q      (flag23)       
					);
					
CompareFPU c24(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold24),      
					.q      (flag24)       
					);
					
CompareFPU c25(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold25),      
					.q      (flag25)       
					);
					
CompareFPU c26(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold26),      
					.q      (flag26)       
					);
					
CompareFPU c27(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold27),      
					.q      (flag27)       
					);
					
CompareFPU c28(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold28),      
					.q      (flag28)       
					);
					
CompareFPU c29(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold29),      
					.q      (flag29)       
					);
					
CompareFPU c30(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold30),      
					.q      (flag30)       
					);

// Units 31 - 40

CompareFPU c31(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold31),      
					.q      (flag31)       
					);
					
CompareFPU c32(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold32),      
					.q      (flag32)       
					);
					
CompareFPU c33(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold33),      
					.q      (flag33)       
					);
					
CompareFPU c34(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold34),      
					.q      (flag34)       
					);
					
CompareFPU c35(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold35),      
					.q      (flag35)       
					);
					
CompareFPU c36(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold36),      
					.q      (flag36)       
					);
					
CompareFPU c37(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold37),      
					.q      (flag37)       
					);
					
CompareFPU c38(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold38),      
					.q      (flag38)       
					);
					
CompareFPU c39(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold39),      
					.q      (flag39)       
					);
					
CompareFPU c40(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold40),      
					.q      (flag40)       
					);

// Units 41 - 50

CompareFPU c41(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold41),      
					.q      (flag41)       
					);
					
CompareFPU c42(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold42),      
					.q      (flag42)       
					);
					
CompareFPU c43(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold43),      
					.q      (flag43)       
					);
					
CompareFPU c44(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold44),      
					.q      (flag44)       
					);
					
CompareFPU c45(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold45),      
					.q      (flag45)       
					);
					
CompareFPU c46(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold46),      
					.q      (flag46)       
					);
					
CompareFPU c47(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold47),      
					.q      (flag47)       
					);
					
CompareFPU c48(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold48),      
					.q      (flag48)       
					);
					
CompareFPU c49(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold49),      
					.q      (flag49)       
					);
					
CompareFPU c50(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold50),      
					.q      (flag50)       
					);

// Units 51 - 60

CompareFPU c51(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold51),      
					.q      (flag51)       
					);
					
CompareFPU c52(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold52),      
					.q      (flag52)       
					);
					
CompareFPU c53(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold53),      
					.q      (flag53)       
					);
					
CompareFPU c54(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold54),      
					.q      (flag54)       
					);
					
CompareFPU c55(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold55),      
					.q      (flag55)       
					);
					
CompareFPU c56(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold56),      
					.q      (flag56)       
					);
					
CompareFPU c57(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold57),      
					.q      (flag57)       
					);
					
CompareFPU c58(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold58),      
					.q      (flag58)       
					);
					
CompareFPU c59(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold59),      
					.q      (flag59)       
					);
					
CompareFPU c60(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold60),      
					.q      (flag60)       
					);

// Units 61 - 70

CompareFPU c61(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold61),      
					.q      (flag61)       
					);
					
CompareFPU c62(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold62),      
					.q      (flag62)       
					);
					
CompareFPU c63(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold63),      
					.q      (flag63)       
					);
					
CompareFPU c64(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold64),      
					.q      (flag64)       
					);
					
CompareFPU c65(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold65),      
					.q      (flag65)       
					);
					
CompareFPU c66(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold66),      
					.q      (flag66)       
					);
					
CompareFPU c67(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold67),      
					.q      (flag67)       
					);
					
CompareFPU c68(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold68),      
					.q      (flag68)       
					);
					
CompareFPU c69(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold69),      
					.q      (flag69)       
					);
					
CompareFPU c70(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold70),      
					.q      (flag70)       
					);

// Units 71 - 80

CompareFPU c71(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold71),      
					.q      (flag71)       
					);
					
CompareFPU c72(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold72),      
					.q      (flag72)       
					);
					
CompareFPU c73(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold73),      
					.q      (flag73)       
					);
					
CompareFPU c74(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold74),      
					.q      (flag74)       
					);
					
CompareFPU c75(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold75),      
					.q      (flag75)       
					);
					
CompareFPU c76(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold76),      
					.q      (flag76)       
					);
					
CompareFPU c77(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold77),      
					.q      (flag77)       
					);
					
CompareFPU c78(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold78),      
					.q      (flag78)       
					);
					
CompareFPU c79(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold79),      
					.q      (flag79)       
					);
					
CompareFPU c80(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold80),      
					.q      (flag80)       
					);

// Units 81 - 90

CompareFPU c81(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold81),      
					.q      (flag81)       
					);
					
CompareFPU c82(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold82),      
					.q      (flag82)       
					);
					
CompareFPU c83(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold83),      
					.q      (flag83)       
					);
					
CompareFPU c84(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold84),      
					.q      (flag84)       
					);
					
CompareFPU c85(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold85),      
					.q      (flag85)       
					);
					
CompareFPU c86(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold86),      
					.q      (flag86)       
					);
					
CompareFPU c87(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold87),      
					.q      (flag87)       
					);
					
CompareFPU c88(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold88),      
					.q      (flag88)       
					);
					
CompareFPU c89(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold89),      
					.q      (flag89)       
					);
					
CompareFPU c90(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold90),      
					.q      (flag90)       
					);

// Units 91 - 100

CompareFPU c91(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold91),      
					.q      (flag91)       
					);
					
CompareFPU c92(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold92),      
					.q      (flag92)       
					);
					
CompareFPU c93(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold93),      
					.q      (flag93)       
					);
					
CompareFPU c94(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold94),      
					.q      (flag94)       
					);
					
CompareFPU c95(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold95),      
					.q      (flag95)       
					);
					
CompareFPU c96(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold96),      
					.q      (flag96)       
					);
					
CompareFPU c97(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold97),      
					.q      (flag97)       
					);
					
CompareFPU c98(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold98),      
					.q      (flag98)       
					);
					
CompareFPU c99(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold99),      
					.q      (flag99)       
					);
					
CompareFPU c100(
					.clk    (clk),   
					.areset (reset),
					.a      (activation_input),  
					.b      (threshold100),      
					.q      (flag100)       
					);


// SIGMOID VALUE ASSIGNMENT BASED ON COMPARISSON FLAGS

always_comb begin
	// less than -8 returns 0
	if (~flag1)begin
		address <= 0;
	end
	// 1 - 10 Sigmoid Approx Value
	else if (~flag2 && flag1)begin
		address <=  1;
	end
	else if (~flag3 && flag2)begin
		address <=  2;
	end
	else if (~flag4 && flag3)begin
		address <=  3;
	end
	else if (~flag5 && flag4)begin
		address <=  4;
	end
	else if (~flag6 && flag5)begin
		address <=  5;
	end
	else if (~flag7 && flag6)begin
		address <=  6;
	end
	else if (~flag8 && flag7)begin
		address <=  7;
	end
	else if (~flag9 && flag8)begin
		address <=  8;
	end
	else if (~flag10 && flag9)begin
		address <=  9;
	end
	else if (~flag11 && flag10)begin
		address <=  10;
	end
	
	// 11 - 20 Sigmoid Approx Value
	else if (~flag12 && flag11)begin
		address <=  11;
	end
	else if (~flag13 && flag12)begin
		address <=  12;
	end
	else if (~flag14 && flag13)begin
		address <=  13;
	end
	else if (~flag15 && flag14)begin
		address <=  14;
	end
	else if (~flag16 && flag15)begin
		address <=  15;
	end
	else if (~flag17 && flag16)begin
		address <=  16;
	end
	else if (~flag18 && flag17)begin
		address <=  17;
	end
	else if (~flag19 && flag18)begin
		address <=  18;
	end
	else if (~flag20 && flag19)begin
		address <=  19;
	end
	else if (~flag21 && flag20)begin
		address <=  20;
	end
	
	// 21 - 30 Sigmoid Approx Value
	else if (~flag22 && flag21)begin
		address <=  21;
	end
	else if (~flag23 && flag22)begin
		address <=  22;
	end
	else if (~flag24 && flag23)begin
		address <=  23;
	end
	else if (~flag25 && flag24)begin
		address <=  24;
	end
	else if (~flag26 && flag25)begin
		address <=  25;
	end
	else if (~flag27 && flag26)begin
		address <=  26;
	end
	else if (~flag28 && flag27)begin
		address <=  27;
	end
	else if (~flag29 && flag28)begin
		address <=  28;
	end
	else if (~flag30 && flag29)begin
		address <=  29;
	end
	else if (~flag31 && flag30)begin
		address <=  30;
	end
	
	// 31 - 40 Sigmoid Approx Value
	else if (~flag32 && flag31)begin
		address <=  31;
	end
	else if (~flag33 && flag32)begin
		address <=  32;
	end
	else if (~flag34 && flag33)begin
		address <=  33;
	end
	else if (~flag35 && flag34)begin
		address <=  34;
	end
	else if (~flag36 && flag35)begin
		address <=  35;
	end
	else if (~flag37 && flag36)begin
		address <=  36;
	end
	else if (~flag38 && flag37)begin
		address <=  37;
	end
	else if (~flag39 && flag38)begin
		address <=  38;
	end
	else if (~flag40 && flag39)begin
		address <=  39;
	end
	else if (~flag41 && flag40)begin
		address <=  40;
	end
		
	// 41 - 50 Sigmoid Approx Value
	else if (~flag42 && flag41)begin
		address <=  41;
	end
	else if (~flag43 && flag42)begin
		address <=  42;
	end
	else if (~flag44 && flag43)begin
		address <=  43;
	end
	else if (~flag45 && flag44)begin
		address <=  44;
	end
	else if (~flag46 && flag45)begin
		address <=  45;
	end
	else if (~flag47 && flag46)begin
		address <=  46;
	end
	else if (~flag48 && flag47)begin
		address <=  47;
	end
	else if (~flag9 && flag8)begin
		address <=  48;
	end
	else if (~flag50 && flag49)begin
		address <=  49;
	end
	else if (~flag51 && flag50)begin
		address <=  50;
	end
	
	// 51 - 60 Sigmoid Approx Value
	else if (~flag52 && flag51)begin
		address <=  51;
	end
	else if (~flag53 && flag52)begin
		address <=  52;
	end
	else if (~flag54 && flag53)begin
		address <=  53;
	end
	else if (~flag55 && flag54)begin
		address <=  54;
	end
	else if (~flag56 && flag55)begin
		address <=  55;
	end
	else if (~flag57 && flag56)begin
		address <=  56;
	end
	else if (~flag58 && flag57)begin
		address <=  57;
	end
	else if (~flag59 && flag58)begin
		address <=  58;
	end
	else if (~flag60 && flag59)begin
		address <=  59;
	end
	else if (~flag61 && flag60)begin
		address <=  60;
	end
		
	// 61 - 70 Sigmoid Approx Value
	else if (~flag62 && flag61)begin
		address <=  61;
	end
	else if (~flag63 && flag62)begin
		address <=  62;
	end
	else if (~flag64 && flag63)begin
		address <=  63;
	end
	else if (~flag65 && flag64)begin
		address <=  64;
	end
	else if (~flag66 && flag65)begin
		address <=  65;
	end
	else if (~flag67 && flag66)begin
		address <=  66;
	end
	else if (~flag68 && flag67)begin
		address <=  67;
	end
	else if (~flag69 && flag68)begin
		address <=  68;
	end
	else if (~flag70 && flag69)begin
		address <=  69;
	end
	else if (~flag71 && flag70)begin
		address <=  70;
	end
		
	// 71 - 80 Sigmoid Approx Value
	else if (~flag72 && flag71)begin
		address <=  71;
	end
	else if (~flag73 && flag72)begin
		address <=  72;
	end
	else if (~flag74 && flag73)begin
		address <=  73;
	end
	else if (~flag75 && flag74)begin
		address <=  74;
	end
	else if (~flag76 && flag75)begin
		address <=  75;
	end
	else if (~flag77 && flag76)begin
		address <=  76;
	end
	else if (~flag78 && flag77)begin
		address <=  77;
	end
	else if (~flag79 && flag78)begin
		address <=  78;
	end
	else if (~flag80 && flag79)begin
		address <=  79;
	end
	else if (~flag81 && flag80)begin
		address <=  80;
	end
		
	// 81 - 90 Sigmoid Approx Value
	else if (~flag82 && flag81)begin
		address <=  81;
	end
	else if (~flag83 && flag82)begin
		address <=  82;
	end
	else if (~flag84 && flag83)begin
		address <=  83;
	end
	else if (~flag85 && flag84)begin
		address <=  84;
	end
	else if (~flag86 && flag85)begin
		address <=  85;
	end
	else if (~flag87 && flag86)begin
		address <=  86;
	end
	else if (~flag88 && flag87)begin
		address <=  87;
	end
	else if (~flag89 && flag88)begin
		address <=  88;
	end
	else if (~flag90 && flag89)begin
		address <=  89;
	end
	else if (~flag91 && flag90)begin
		address <=  90;
	end
	
	// 91 - 99 Sigmoid Approx Value
	else if (~flag92 && flag91)begin
		address <=  91;
	end
	else if (~flag93 && flag92)begin
		address <=  92;
	end
	else if (~flag94 && flag93)begin
		address <=  93;
	end
	else if (~flag95 && flag94)begin
		address <=  94;
	end
	else if (~flag96 && flag95)begin
		address <=  95;
	end
	else if (~flag97 && flag96)begin
		address <=  96;
	end
	else if (~flag98 && flag97)begin
		address <=  97;
	end
	else if (~flag99 && flag98)begin
		address <=  98;
	end
	else if (~flag100 && flag99)begin
		address <=  99;
	end
		
	// greater than 8 returns 1
	else begin
		address <= 100;
	end
end



endmodule


`timescale 1ps/1ps

module SigmoidLUTs_tb;

logic clk, reset;
logic [31:0] activation_input, activation_output;

SigmoidLUTs uut(clk, reset, activation_input, activation_output);

initial begin // clock cycle of 2ps
    clk = 0;
    forever #1 clk = ~clk;
end

initial begin // stimulus is applied here
    reset = 1; #2; 
    reset = 0; #2; 
    activation_input = 32'h3e800000;
	 #200; 
    $stop;
end

initial begin // response monitor
    $monitor ("t = %d clk = %b, reset = %b, activation_output = %b", $time, clk, reset, activation_output);
end

endmodule
