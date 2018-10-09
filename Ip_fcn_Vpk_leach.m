function [ Ip ] = Ip_fcn_Vpk_leach( V_gk )
%UNTITLED Summary of this function goes here
%  
%determine values of Ip for the Leach model

%determine Ip for current calculation
%implement the paramaters and equations for the basic tube circuit under
%Leach model
mu = 88.5;
K = 1.73e-6;
Ip = zeros(500,1);


for V_pk = 1 : 500
    if ((mu*V_gk + V_pk)>0)
        Ip(V_pk) = K.*(mu*V_gk + V_pk).^(3/2);
    else
        Ip(V_pk) = 0;
    end

end




end

