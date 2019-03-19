function [ Vpk, b ] = newton_raphson_solver( Vpk, Vgk, a, R )
% 12AX7 model with New-Raphson solver using Wave Digital Filters
% adapted from WAVE DIGITAL SIMULATION OF A VACUUM-TUBE AMPLIFIER by Matti Karjalainen and Jyri Pakarinen
% Mitchell Gould 

x = Vpk;
dx = 1e-6;
error =  1e-6;    % error
epsilon = 1e-9;


for i = 1 : 5
    
delta_x = x + dx;
g = x + R*plate_current(Vgk,Vpk)- a;
dg = delta_x + (R*plate_current(Vgk, Vpk)) - a;
Vpk_updated = x - (dx*g)/(dg - g);
x = Vpk_updated;

   
    if(abs(error) / abs(x) > epsilon)
       break; 
    end

end

Vpk = x;
b = Vpk - (R * plate_current(Vgk,Vpk));

            
end

            
           