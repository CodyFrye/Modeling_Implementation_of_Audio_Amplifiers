%% HighFreqAudioSampleData.m
% author:      Cody Frye
% description: Take the audio samples fed through
%              the amplifier and separate each sample
%              into it's own variable. Save workspace

%% initialize workspace
clear
clc

distorted=audioread('SeniorProj/SeniorDesignRecs.L.wav');
Clean=audioread('SeniorProj/SeniorDesignRecs.R.wav');

Dist_High=distorted((8.814*10^6):length(distorted));
Clean_High=distorted((8.814*10^6):length(Clean));

%% seperate into individual frequency bins

F4_Dist = Dist_High(1:(3.468*10^5));
F4_Clean = Clean_High(1:(3.468*10^5));

Gb4_Dist = Dist_High((3.468*10^5):(7.981*10^5));
Gb4_Clean = Clean_High((3.468*10^5):(7.981*10^5));

G4_Dist = Dist_High((7.981*10^5):(1.204*10^6));
G4_Clean = Clean_High((7.981*10^5):(1.204*10^6));

Ab4_Dist = Dist_High((1.204*10^6):(1.554*10^6));
Ab4_Clean = Clean_High((1.204*10^6):(1.554*10^6));

A4_Dist = Dist_High((1.554*10^6):(1.864*10^6));
A4_Clean = Clean_High((1.554*10^6):(1.864*10^6));

Bb4_Dist = Dist_High((1.864*10^6):(2.289*10^6));
Bb4_Clean = Clean_High((1.864*10^6):(2.289*10^6));

B4_Dist = Dist_High((2.289*10^6):(2.717*10^6));
B4_Clean = Clean_High((2.289*10^6):(2.717*10^6));

C5_Dist = Dist_High((2.717*10^6):(3.084*10^6));
C5_Clean = Clean_High((2.717*10^6):(3.084*10^6));

Db5_Dist = Dist_High((3.084*10^6):(3.527*10^6));
Db5_Clean = Clean_High((3.084*10^6):(3.527*10^6));

D5_Dist = Dist_High((3.527*10^6):(3.825*10^6));
D5_Clean = Clean_High((3.527*10^6):(3.825*10^6));

Eb5_Dist = Dist_High((3.825*10^6):(4.199*10^6));
Eb5_Clean = Clean_High((3.825*10^6):(4.199*10^6));

E5_Dist = Dist_High((4.199*10^6):(5.102*10^6));
E5_Clean = Clean_High((4.199*10^6):(5.102*10^6)); % something funny in here

F5_Dist = Dist_High((5.102*10^6):(5.544*10^6));
F5_Clean = Clean_High((5.102*10^6):(5.544*10^6));

Gb5_Dist = Dist_High((5.544*10^6):(5.985*10^6));
Gb5_Clean = Clean_High((5.544*10^6):(5.985*10^6));

G5_Dist = Dist_High((5.985*10^6):(6.32*10^6));
G5_Clean = Clean_High((5.985*10^6):(6.32*10^6));

Ab5_Dist = Dist_High((6.32*10^6):(6.669*10^6));
Ab5_Clean = Clean_High((6.32*10^6):(6.669*10^6));

A5_Dist = Dist_High((6.669*10^6):(7.013*10^6));
A5_Clean = Clean_High((6.669*10^6):(7.013*10^6));

Bb5_Dist = Dist_High((7.013*10^6):(7.337*10^6));
Bb5_Clean = Clean_High((7.013*10^6):(7.337*10^6));

B5_Dist = Dist_High((7.337*10^6):(7.74*10^6));
B5_Clean = Clean_High((7.337*10^6):(7.74*10^6));

C6_Dist = Dist_High((7.74*10^6):(8.134*10^6));
C6_Clean = Clean_High((7.74*10^6):(8.134*10^6));

Db6_Dist = Dist_High((8.134*10^6):(8.524*10^6));
Db6_Clean = Clean_High((8.134*10^6):(8.524*10^6));

D6_Dist = Dist_High((8.524*10^6):(8.892*10^6));
D6_Clean = Clean_High((8.524*10^6):(8.892*10^6));

%plot(distorted);
%sound(E5_Dist, 44100);

%% Delete unwanted variables 
clear distorted Clean
clear Dist_High Clear_High

%% save to .mat file
save('CrateBlueVoodooAudioSamples.mat');
clear 