classdef WDFOnePort < handle
    properties
        a
        b
    end
    methods
        function obj = WDFOnePort()
            obj.a = 0;
            obj.b = 0;
        end
        function voltage = wave_to_voltage(obj)
            voltage = (obj.a + obj.b)/2;
        end
    end
end
