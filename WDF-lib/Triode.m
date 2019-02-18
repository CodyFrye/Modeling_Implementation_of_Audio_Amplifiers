function [ b, Vpk ] = Triode(a, R, Vgk, Vpk)
            % 12AX7 model with New-Raphson solver
            % using Wave Digital Filters
            % From WAVE DIGITAL SIMULATION OF A VACUUM-TUBE AMPLIFIER by Matti Karjalainen and Jyri Pakarinen
            
            maxIter = 5;   % maximun number of iterations
            dx = 1e-6;      % delta x
            err =  1e-6;    % error
            epsilon = 1e-9; % a value close to 0 to stop the iteration if the equation is converging
            iter = 1;        % reset iter to 1
            % Newton-Raphson algorithm
            x = Vpk;
            while (abs(err) / abs(x) > epsilon )
                diffX = x + dx;
                f = x + R * Ip(Vgk,x) - a; % (7)
                df = diffX + R * Ip(Vgk, diffX) - a;
                newVpk = x - (dx*f)/(df - f);
                x = newVpk;
                iter = iter + 1;
                if (iter > maxIter)         % if iter is larger than the maximum nr of iterations
                    break;                  % break out from the while loop
                end
            end
            Vpk = x;
            b = Vpk - R * Ip(Vgk,Vpk); % (8)
            
end
function [ Ip ] = Ip(Vgk, Vpk)
    mu = 100;
    kx = 1.4;
    kg1 = 1060;
    kp = 600;
    kvb = 300;
    % E1 = Vpk/kp * log10(1 + exp(kp * (1/u + Vgk/ sqrt(kvb + Vpk^2))))
    E1 = (Vpk/kp) * log10(1 + exp(kp * ((1/mu) + Vgk/sqrt(kvb + Vpk^2)))); % (2)
    Ip = ((E1^kx)/kg1) * (1 + sign(E1)); % (3)

end