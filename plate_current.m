function [ Ip] = plate_current(Vpk, Vgk)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes her
mu = 100;
kx = 1.4;
kg1 = 1060;
kp = 600;
kvb = 300;

E1 = (Vpk/kp) * log10(1 + exp(kp * ((1/mu) + Vgk/sqrt(kvb + Vpk^2))));

 %use smooth approximation for sign function
Ip = ((E1^kx)/kg1)*(1 + ((1 - exp(100*-E1))/(1 + exp(100*-E1))));

end


