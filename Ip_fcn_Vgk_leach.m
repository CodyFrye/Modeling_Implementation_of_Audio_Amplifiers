function [ Ip ] = Ip_fcn_Vgk_leach(V_pk )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%determine Ig for current calculation

R_gk = 20000; %20Kohm
V_gamma = 0.6;
mu = 88.5;
K = 1.73e-6;
Ip = zeros(6,1);



for V_gk = 1 : 6
    if ((mu*V_gk + V_pk)>0)
        Ip(V_gk) = K.*(mu*V_gk + V_pk).^(3/2);
    else
        Ip(V_gk) = 0;
    end

end



% for V_gk = 1 : 5
%     if V_gk < V_gamma
%         Ig = 0;
%     else
%         Ig = (V_gk - V_gamma)/R_gk;
%     end
% 
% end

end

