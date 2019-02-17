classdef Resistor < WDFOnePort
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
      Rp
    end
    
    methods
        function obj = Resistor(R)
            obj.Rp = R;
        end
        
        function rw = get_reflected_wave(obj,a)
            obj.a=a;
            obj.b=0;
            rw=obj.b;
        end
    end
end

