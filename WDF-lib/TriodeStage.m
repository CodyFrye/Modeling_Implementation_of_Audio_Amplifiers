clear
clc


%% sampling Freq.
Fs=192000;
%steps=2^14;

%% Sine Gen
f=10000;
gain=1;
ts=1/Fs;
N=100000;
t=1:N;
input = gain.*sin(2*pi*f/Fs.*t);
steps=length(input);

%% Voltages
%Vg=zeros(1,steps);
%Vg(1)=1;
%Vg=20;
Vg=10;
Vk=0;
Vpk=0;

%% set up one port parameters
Rk=Resistor(1e3);
Ck=Capacitor(10e-6,Fs);
Ro=Resistor(1e6);
Co=Capacitor(10e-9,Fs);
ERp=ResistiveVoltageSource(100e3);
Vcc=250;

%% port resistances
RS13 = Ro.Rp;
RS12 = Co.Rp;
RS11 = RS13+RS12;
RP13 = ERp.Rp;
RP12 = RS11;
RP11 = 1/((1/RP12)+(1/RP13));

RP23 = Rk.Rp;
RP22 = Ck.Rp;
RP21 = 1/((1/RP22)+(1/RP23));
RS23 = RP21;
RS22 = RP11;
RS21 = RS23+RS22;

%% initialize waves
as1=zeros(1,3);
as2=zeros(1,3);
ap1=zeros(1,3);
ap2=zeros(1,3);

bs1=zeros(1,3);
bs2=zeros(1,3);
bp1=zeros(1,3);
bp2=zeros(1,3);

%process loop
for k=1:steps
   % 1. Gather inputs
   as1(3)=Ro.get_reflected_wave(bs1(3));
   as1(2)=Co.get_reflected_wave(bs1(2));
   ap1(3)=ERp.get_reflected_wave(bp1(3),input(k));
   ap2(3)=Rk.get_reflected_wave(bp2(3));
   ap2(2)=Ck.get_reflected_wave(bp2(2));
   
   % 2. Wave up
   bs1=SeriesAdaptor(as1,[RS11 RS12 RS13]);
   ap1(2)=bs1(1,1);
   
   bp1=ParallelAdaptor(ap1,[RP11 RP12 RP13]);
   as2(2)=bp1(1,1);
   
   bp2=ParallelAdaptor(ap2,[RP11 RP12 RP13]);
   as2(3)=bp2(1,1);
   
   bs2=SeriesAdaptor(as2,[RS21 RS22 RS23]);
   Ta=bs2(1,1);
   
   % 3. Root (Triode Valve)
   Vgk=Vg-Vk;
   [as2(1), Vpk] = Triode(Ta, RS21, Vgk, Vpk);
   debugVar(k)=as2(1);

   % 4. Wave down
   bs2=SeriesAdaptor(as2,[RS21 RS22 RS23]);
   ap2(1)=bs2(3); %
   ap1(1)=bs2(2); %
   
   bp2=ParallelAdaptor(ap2,[RP21 RP22 RP23]);
   %bp2(3)=bp2(3); %
   %bp2(2)=bp2(2); %
   
   bp1=ParallelAdaptor(ap1,[RP11 RP12 RP13]);
   %bp1(3)=bp1(3); %
   as1(1)=bp1(2); %
   
   bs1=SeriesAdaptor(as1,[RS21 RS22 RS23]);
   %bs1(2)=bs1(2); %
   %bs1(3)=bs1(3); %
   
   % 5. Gather outputs
   Vk = Rk.wave_to_voltage();
   output(k) = Ro.wave_to_voltage();
   
   Ck.set_incident_wave(ap2(2)); % Only works if adaptor incident wave
   Co.set_incident_wave(as1(2)); % Only works if adaptor incident wave

end

%y= lowpass(output*10^8,10000,Fs);
%plot(y)
%% plot
%plot(debugVar)
plot(output.*10^6);
xlabel('sample (n)');
ylabel('volts (V)');
title('Triode Valve WDF Transient Output');
% hold on
% %plot(input);
% hold off
% [h,w]=freqz(output,1,2048*2);
% f=(w/(2*pi))*Fs;
% H=20*log10(abs(h));
% semilogx(f,H);
% xlim([1,10000])