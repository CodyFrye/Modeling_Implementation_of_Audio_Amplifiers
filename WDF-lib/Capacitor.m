classdef Capacitor < WDFOnePort
    %UNTITLED4 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Rp
    end
    
    methods
        function obj = Capacitor(c,Fs)
            %UNTITLED4 Construct an instance of this class
            %   Detailed explanation goes here
            obj.Rp = 1/(2*Fs*c);
        end
        
        function rf = get_reflected_wave(obj,a)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            obj.b = obj.a;
            obj.a = a;
            rf = obj.b;
        end
        
        function set_incident_wave(obj,a)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            obj.a = a;
        end
    end
end

