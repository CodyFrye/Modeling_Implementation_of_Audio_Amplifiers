function b = ParallelAdaptor(A,R)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
    G=zeros(1,length(R));
    for k = 1:length(R)
        G(k) = 1/R(k);
    end

    Gtot = 0;
    for k = 1:length(G)
        Gtot = Gtot + G(k);
    end
    
    Gamma=zeros(1,length(G));
    for k = 1:length(G)
        Gamma(k)=2*G(k) / Gtot;
    end
    
    aDotGamma=dot(A,Gamma);
    
    b = zeros(1,length(A));
    for k=1:length(A)
        b(k)= aDotGamma - A(k);
    end
end
