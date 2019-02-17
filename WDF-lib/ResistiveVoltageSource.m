classdef ResistiveVoltageSource < WDFOnePort
    %UNTITLED6 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Rp
    end
    
    methods
        function obj = ResistiveVoltageSource(R)
            %UNTITLED6 Construct an instance of this class
            %   Detailed explanation goes here
            obj.Rp=R;
        end
        
        function rf = get_reflected_wave(obj,a,Vs)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            obj.a = a;
            obj.b = Vs;
            rf = obj.b;
        end
    end
end

