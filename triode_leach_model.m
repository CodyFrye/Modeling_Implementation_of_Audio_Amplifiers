%Mitchell Gould

%This script was made to simulate the behavior of the non linear current through the 
%triode stage of the tube amplifier with 12AX7 tubes for purposes of modeling and testing


clc
clear
% retrieve data to analyze
load('1khz_data (1).mat')
% r=audioread('1k_Data_2.R.wav');
% w=audioread('1k_Data_2.L.wav');

% grab a snippet of clean signal
% Sig_Clean=r(637:800,1);
% start = Sig_Clean(1);
% stop = Sig_Clean(164);
% plot(Sig_Clean)

%input Vgk value of -3 for Ip as fcn of Vpk
Vgk_1 = Ip_fcn_Vpk_leach(-3);
%input Vgk value of -2
Vgk_2 = Ip_fcn_Vpk_leach(-2);
%input Vgk value of -1
Vgk_3 = Ip_fcn_Vpk_leach(-1);
%input Vgk value of 0
Vgk_4 = Ip_fcn_Vpk_leach(-0);
%input Vgk value of 1
Vgk_5 = Ip_fcn_Vpk_leach(1);
%input Vgk value of 2
Vgk_6 = Ip_fcn_Vpk_leach(2);


%input Vpk value of 0 for Ip as a function of Vgk
Vpk_1 = Ip_fcn_Vgk_leach(0);
%input Vpk value of 50 for Ip as a function of Vgk
Vpk_2 = Ip_fcn_Vgk_leach(50);
%input Vpk value of 100 for Ip as a function of Vgk
Vpk_3 = Ip_fcn_Vgk_leach(100);
%input Vpk value of 150 for Ip as a function of Vgk
Vpk_4 = Ip_fcn_Vgk_leach(150);
%input Vpk value of 200 for Ip as a function of Vgk
Vpk_5 = Ip_fcn_Vgk_leach(200);
%input Vpk value of 250 for Ip as a function of Vgk
Vpk_6 = Ip_fcn_Vgk_leach(250);
%input Vpk value of 300 for Ip as a function of Vgk
Vpk_7 = Ip_fcn_Vgk_leach(300);
%input Vpk value of 350 for Ip as a function of Vgk
Vpk_8 = Ip_fcn_Vgk_leach(350);

%%
%plot Ip as a function of Vpk for the Leach's model
figure(1)
title('Current (Ip) as a function of Vpk')
hold on
plot (Vgk_1)
plot (Vgk_2)
plot (Vgk_3)
plot (Vgk_4)
plot (Vgk_5)
plot (Vgk_6)

%plot Ip as a function of Vgk for the Leach's model
figure(2)
title('Current (Ip) as a function of Vgk')
hold on
plot (Vpk_1)
plot (Vpk_2)
plot (Vpk_3)
plot (Vpk_4)
plot (Vpk_5)
plot (Vpk_6)
plot (Vpk_7)
plot (Vpk_8)






