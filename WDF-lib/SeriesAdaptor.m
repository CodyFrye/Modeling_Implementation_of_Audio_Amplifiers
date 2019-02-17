function b = SeriesAdaptor(A,R)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
    Rtot = 0;
    for k = 1:length(R)
        Rtot = Rtot + R(k);
    end

    Atot = 0;
    for k = 1:length(A)
        Atot = Atot + A(k);
    end
    
    b = zeros(1,length(R));
    for k = 1:length(R)
        b(k) = A(k) - 2*R(k) / Rtot * Atot;
    end
end

