clear
clc

steps=2^14;

input=zeros(1,steps);
input(1)=1;

Fs=96000;
V1 = ResistiveVoltageSource(1);     % 1 Ohm resistive volt. source
C1 = Capacitor(3.5e-5,Fs);          % 0.35 uF capacitor.
R1 = Resistor(10);                  % 10 Ohm resistor.

Rp1=C1.Rp;
Rp2=R1.Rp;
Rp3=V1.Rp;

b1=0;
b2=0;
b3=0;

% Simulation loop.
for i = 1:steps
    % 1. Gather inputs.
    a1 = C1.get_reflected_wave(b1);
    a2 = R1.get_reflected_wave(0);
    a3 = V1.get_reflected_wave(0, input(i));  % Read input signal off voltage source.
    
    % 2. Wave up.
    a  = [a1, a2, a3];
    Rp = [Rp1, Rp2, Rp3];
    
    % 3. Root element / 4. Wave down.
    b = SeriesAdaptor(a, Rp);
    b1=b(1);
    b2=b(2);
    b3=b(3);
    
    % 5. Gather outputs.
    output(i) = C1.wave_to_voltage();  % Output is voltage over C1.
    C1.set_incident_wave(b1);          % Store new input inside Capacitor.
end

[h,w]=freqz(output,1,2048*2);
f=(w/(2*pi))*Fs;
H=20*log10(abs(h));
semilogx(f,H);
xlim([1,10000])