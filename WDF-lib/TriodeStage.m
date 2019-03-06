clear
clc


%% sampling Freq.
Fs=96000;
%steps=2^14;

%% Sine Gen
f=1000;
gain=1;
ts=1/96000;
N=100000;
t=1:N;
input = gain.*sin(2*pi*f/Fs.*t);
steps=length(input);

%% Voltages
%Vg=zeros(1,steps);
%Vg(1)=1;
Vg=20;
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
ap13=0;
ap12=0;
ap11=0;
ap23=0;
ap22=0;
ap21=0;
as13=0;
as12=0;
as11=0;
as23=0;
as22=0;
as21=0;

bp13=0;
bp12=0;
bp11=0;
bp23=0;
bp22=0;
bp21=0;
bs13=0;
bs12=0;
bs11=0;
bs23=0;
bs22=0;
bs21=0;

%process loop
for k=1:steps
   % 1. Gather inputs
   as13=Ro.get_reflected_wave(bs13);
   as12=Co.get_reflected_wave(bs12);
   ap13=ERp.get_reflected_wave(bp13,input(1,k));
   ap23=Rk.get_reflected_wave(bp23);
   ap22=Ck.get_reflected_wave(bp22);
   
   % 2. Wave up
   bs1=SeriesAdaptor([as11 as12 as13],[RS11 RS12 RS13]);
   ap12=bs1(1,1);
   
   bp1=ParallelAdaptor([ap11 ap12 ap13],[RP11 RP12 RP13]);
   as22=bp1(1,1);
   
   bp2=ParallelAdaptor([ap21 ap22 ap23],[RP11 RP12 RP13]);
   as23=bp2(1,1);
   
   bs2=SeriesAdaptor([as21 as22 as23],[RS21 RS22 RS23]);
   Ta=bs2(1,1);
   
   % 3. Root (Triode Valve)
   Vgk=Vg-Vk;
   [as21, Vpk] = Triode(Ta, RS21, Vgk, Vpk);
   debugVar(k)=as21;
   %% Problem Here in 4 and/or 5
   %-------------------------------------------------------%
   % 4. Wave down
    bs2=SeriesAdaptor([as21 as22 as23],[RS21 RS22 RS23]);
   ap21=bs2(3);
   ap11=bs2(2);
   
   bp2=ParallelAdaptor([ap21 ap22 ap23],[RP21 RP22 RP23]);
   bp23=bp2(3);
   bp22=bp2(2);
   
   bp1=ParallelAdaptor([ap11 ap12 ap13],[RP11 RP12 RP13]);
   bp13=bp1(3);
   as11=bp1(2);
   
   bs1=SeriesAdaptor([as11 as12 as13],[RS21 RS22 RS23]);
   bs12=bs1(2);
   bs13=bs1(3);
   
   % 5. Gather outputs
   Vk = Rk.wave_to_voltage();
   output(k) = Ro.wave_to_voltage();
   
   Ck.set_incident_wave(bp22);
   Co.set_incident_wave(bs12);
   %-------------------------------------------------------%
end

%% plot
%plot(debugVar)
plot(output);
hold on
%plot(input);
hold off
% [h,w]=freqz(output,1,2048*2);
% f=(w/(2*pi))*Fs;
% H=20*log10(abs(h));
% semilogx(f,H);
% xlim([1,10000])