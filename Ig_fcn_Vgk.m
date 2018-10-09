function [ Ig ] = Ig_fcn_Vgk()
%UNTITLED3 Summary of this function goes here
%  Ig function of Vpk

R_gk = 20000; %20Kohm
V_gamma = 0.6;
Ig = zeros(6,1);



for Vgk = 1 : 6
    if Vgk < V_gamma
        Ig(Vgk) = 0;
    else
        Ig(Vgk) = (Vgk - V_gamma)/R_gk;
    end

end





end

