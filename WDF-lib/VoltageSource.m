classdef VoltageSource < WDFOnePort
    %UNTITLED5 Summary of this class goes here
    %   Detailed explanation goes here
    properties
       V
    end
    methods
        function obj = VoltageSource()
            %obj.V=Vs;
        end
        function rf = get_reflected_wave(obj, a, Vs)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            obj.V=Vs;
            obj.a = a;
            obj.b = 2*obj.V - a;
            rf = obj.b;
        end
    end
end

