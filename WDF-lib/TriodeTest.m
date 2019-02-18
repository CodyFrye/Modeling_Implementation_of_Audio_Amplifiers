clear
clc

% sampling Freq.
Fs=96000;
steps=2^14;
input=zeros(1,steps);
input(1)=1;

%% set up on port parameters
% Components
Ro=Resistor(1000000);
Co=Capacitor(10*10^-9,Fs);
ERp=ResistiveVoltageSource(100000); % 250 volt
Ck=Capacitor(10*10^-6,Fs);
Rk=Resistor(10000);
Ri=Resistor(1000000);
Ci=Capacitor(100*10^-9,Fs);
Vin=VoltageSource(); % input

%% set up serial parallel adaptors
% output Serial(1) adaptor ports
Rs13=Ro.Rp;
Rs12=Co.Rp;
Rs11=Rs13+Rs12;

% output Parallel(1) adaptor ports
Rpl13=ERp.Rp;
Rpl12=Rs11;
Rpl11=1 / ((1/Rpl12) +(1/Rpl13));

% Kathode Parallel(2) adaptor ports
Rpl23=Rk.Rp;
Rpl22=Ck.Rp;
Rpl21=1 / ((1/Rpl22) +(1/Rpl23));

% Kathode Serial(2) adaptor ports
Rs23=Rpl21;
Rs22=Rpl11;
Rs21=Rs23+Rs22;

% input Serial(3) adaptor ports
Rs33=Ri.Rp;
Rs32=Ci.Rp;
Rs31=Rs33+Rs32;

%% initialize wave path states
apl11=0;
apl12=0;
apl13=0;
apl21=0;
apl22=0;
apl23=0;
as11=0;
as12=0;
as13=0;
as21=0;
as22=0;
as23=0;
as31=0;
as32=0;
as33=0;
bpl11=0;
bpl12=0;
bpl13=0;
bpl21=0;
bpl22=0;
bpl23=0;
bs11=0;
bs12=0;
bs13=0;
bs21=0;
bs22=0;
bs23=0;
bs31=0;
bs32=0;
bs33=0;

%% Main loop
Vk_z=0;
Vpk=0;
for k = 1:steps
    %(1) get inputs
    as13=Ro.get_reflected_wave(bs13);
    as12=Co.get_reflected_wave(bs12);
    
    apl13=ERp.get_reflected_wave(bpl13,250);
    
    apl23=Rk.get_reflected_wave(bpl23);
    apl22=Ck.get_reflected_wave(bpl22);
    
    as31=Vin.get_reflected_wave(bs31,input(k));
    
    as32=Ri.get_reflected_wave(bs32);
    as33=Ci.get_reflected_wave(bs33);
    
    %(2) Wave up
    as1=[as11 as12 as13];
    Rs1=[Rs11 Rs12 Rs13];
    bs1=SeriesAdaptor(as1, Rs1);
    bs11=bs1(1);
    bs12=bs1(2);
    bs13=bs1(3);
    
    apl12=bs11;
    apl1=[apl11 apl12 apl13];
    Rpl1=[Rpl11 Rpl12 Rpl13];
    bpl1=ParallelAdaptor(apl1, Rpl1);
    bpl11=bpl1(1);
    bpl12=bpl1(2);
    bpl13=bpl1(3);
    
    apl2=[apl21 apl22 apl23];
    Rpl2=[Rpl21 Rpl22 Rpl23];
    bpl2=ParallelAdaptor(apl2, Rpl2);
    bpl21=bpl2(1);
    bpl22=bpl2(2);
    bpl23=bpl2(3);
    
    as22=-bpl11; % to accomidate for the polarity inverter block
    as2=[as21 as22 as23];
    Rs2=[Rs21 Rs22 Rs23];
    bs2=SeriesAdaptor(as2, Rs2);
    bs21=bs2(1);
    bs22=bs2(2);
    bs23=bs2(3);
    
    as3=[as31 as32 as33];
    Rs3=[Rs31 Rs32 Rs33];
    bs3=SeriesAdaptor(as3, Rs3);
    bs31=bs3(1);
    bs32=bs3(2);
    bs33=bs3(3);
    
    %(3) Root(tube)
    Vg=Ri.wave_to_voltage();
    Vk=Rk.wave_to_voltage();
    Vgk = Vk_z-Vg;
    [as21, Vpk] = Triode(bs21, Rs21, -Vgk, Vpk);
    
    %(4) wave down
    as2=[as21 as22 as23];
    Rs2=[Rs21 Rs22 Rs23];
    bs2=SeriesAdaptor(as2, Rs2);
    bs21=bs2(1);
    bs22=bs2(2);
    bs23=bs2(3);
    
    apl21=bs23;
    apl2=[apl21 apl22 apl23];
    Rpl2=[Rpl21 Rpl22 Rpl23];
    bpl2=ParallelAdaptor(apl2, Rpl2);
    bpl21=bpl2(1);
    bpl22=bpl2(2);
    bpl23=bpl2(3);
    
    apl11=bpl12;
    apl1=[apl11 apl12 apl13];
    Rpl1=[Rpl11 Rpl12 Rpl13];
    bpl1=ParallelAdaptor(apl1, Rpl1);
    bpl11=bpl1(1);
    bpl12=bpl1(2);
    bpl13=bpl1(3);
    
    as11=bpl12;
    as1=[as11 as12 as13];
    Rs1=[Rs11 Rs12 Rs13];
    bs1=SeriesAdaptor(as1, Rs1);
    bs11=bs1(1);
    bs12=bs1(2);
    bs13=bs1(3);
    
    %(5) gather outputs and set states
    output(k) = Ro.wave_to_voltage();
    Vk_z=Vk;
    
    Co.set_incident_wave(bs12);
    Ck.set_incident_wave(bpl22);
    Ci.set_incident_wave(bs33);
    
end

[h,w]=freqz(output,1,2048*2);
f=(w/(2*pi))*Fs;
H=20*log10(abs(h));
semilogx(f,H);
xlim([1,10000])