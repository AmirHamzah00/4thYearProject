module SigmoidLUTs (input logic clk, reset,
						  input logic [31:0] activation_input,
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

// SIGMOID VALUES

assign sig_val1 = 32'h399d4952;
assign sig_val2 = 32'h39d1b717;
assign sig_val3 = 32'h3a03126f;
assign sig_val4 = 32'h3a03126f;
assign sig_val5 = 32'h3a1d4952;
assign sig_val6 = 32'h3a51b717;
assign sig_val7 = 32'h3a6bedfa;
assign sig_val8 = 32'h3a83126f;

assign sig_val9 = 32'h3a9d4952;
assign sig_val10 = 32'h3ab78034;
assign sig_val11 = 32'h3aded289;
assign sig_val12 = 32'h3b03126f;
assign sig_val13 = 32'h3b16bb99;
assign sig_val14 = 32'h3b30f27c;
assign sig_val15 = 32'h3b51b717;
assign sig_val16 = 32'h3b79096c;

assign sig_val17 = 32'h3b902de0;
assign sig_val18 = 32'h3baa64c3;
assign sig_val19 = 32'h3bc7e282;
assign sig_val20 = 32'h3bebedfa;
assign sig_val21 = 32'h3c09a027;
assign sig_val22 = 32'h3c22339c;
assign sig_val23 = 32'h3c3e0ded;
assign sig_val24 = 32'h3c5ed289;

assign sig_val25 = 32'h3c83126f;
assign sig_val26 = 32'h3c9930be;
assign sig_val27 = 32'h3cb367a1;
assign sig_val28 = 32'h3cd288ce;
assign sig_val29 = 32'h3cf5c28f;
assign sig_val30 = 32'h3d0fc505;
assign sig_val31 = 32'h3d27ef9e;
assign sig_val32 = 32'h3d4432ca;

assign sig_val33 = 32'h3d648e8a;
assign sig_val34 = 32'h3d851eb8;
assign sig_val35 = 32'h3d9a9fbe;
assign sig_val36 = 32'h3db367a1;
assign sig_val37 = 32'h3dcfaace;
assign sig_val38 = 32'h3defd220;
assign sig_val39 = 32'h3e0a233a;
assign sig_val40 = 32'h3e1e9e1b;

assign sig_val41 = 32'h3e3573eb;
assign sig_val42 = 32'h3e4ed917;
assign sig_val43 = 32'h3e6acd9f;
assign sig_val44 = 32'h3e84a8c1;
assign sig_val45 = 32'h3e952546;
assign sig_val46 = 32'h3ea6cf42;
assign sig_val47 = 32'h3eb97247;
assign sig_val48 = 32'h3eccf41f;

assign sig_val49 = 32'h3ee1205c;
assign sig_val50 = 32'h3ef5a858;
assign sig_val51 = 32'h3f052bd4;
assign sig_val52 = 32'h3f0f6fd2;
assign sig_val53 = 32'h3f1985f0;
assign sig_val54 = 32'h3f2346dc;
assign sig_val55 = 32'h3f2c985f;
assign sig_val56 = 32'h3f356d5d;

assign sig_val57 = 32'h3f3dab9f;
assign sig_val58 = 32'h3f454c98;
assign sig_val59 = 32'h3f4c49ba;
assign sig_val60 = 32'h3f52a305;
assign sig_val61 = 32'h3f585879;
assign sig_val62 = 32'h3f5d7732;
assign sig_val63 = 32'h3f6205bc;
assign sig_val64 = 32'h3f660aa6;

assign sig_val65 = 32'h3f69930c;
assign sig_val66 = 32'h3f6cac08;
assign sig_val67 = 32'h3f6f5c29;
assign sig_val68 = 32'h3f71b717;
assign sig_val69 = 32'h3f73bcd3;
assign sig_val70 = 32'h3f758106;
assign sig_val71 = 32'h3f7703b0;
assign sig_val72 = 32'h3f7851ec;

assign sig_val73 = 32'h3f796bba;
assign sig_val74 = 32'h3f7a64c3;
assign sig_val75 = 32'h3f7b367a;
assign sig_val76 = 32'h3f7be76d;
assign sig_val77 = 32'h3f7c84b6;
assign sig_val78 = 32'h3f7d07c8;
assign sig_val79 = 32'h3f7d7732;
assign sig_val80 = 32'h3f7dd97f;

assign sig_val81 = 32'h3f7e2824;
assign sig_val82 = 32'h3f7e703b;
assign sig_val83 = 32'h3f7eab36;
assign sig_val84 = 32'h3f7edfa4;
assign sig_val85 = 32'h3f7f06f7;
assign sig_val86 = 32'h3f7f2e49;
assign sig_val87 = 32'h3f7f4f0e;
assign sig_val88 = 32'h3f7f6944;

assign sig_val89 = 32'h3f7f7cee;
assign sig_val90 = 32'h3f7f9097;
assign sig_val91 = 32'h3f7fa440;
assign sig_val92 = 32'h3f7fb15b;
assign sig_val93 = 32'h3f7fbe77;
assign sig_val94 = 32'h3f7fc505;
assign sig_val95 = 32'h3f7fcb92;
assign sig_val96 = 32'h3f7fd8ae;

assign sig_val97 = 32'h3f7fdf3b;
assign sig_val98 = 32'h3f7fdf3b;
assign sig_val99 = 32'h3f7fe5c9;

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
		activation_output <= 32'h3f800000;
	end
end

endmodule
