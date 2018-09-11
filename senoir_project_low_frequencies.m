clear
clc

%% retrieve data 
signal_clean = audioread('SeniorDesignRecs.R.wav');
signal_distorted = audioread('SeniorDesignRecs.L.wav');
n = 1024;


%obtain 329 Hz (E)
dist_329Hz = signal_distorted(44000:180000);
clean_329Hz  = signal_clean(44000:180000);
freq_329Hz = fft(dist_329Hz, n);

%obtain 349 Hz (F)
dist_349Hz = signal_distorted(366000:480000);
clean_349Hz  = signal_clean(366000:480000);
freq_349Hz = fft(dist_349Hz, n);

%obtain 369 Hz (F)
dist_369Hz = signal_distorted(665000:797000);
clean_369Hz  = signal_clean(665000:797000);
freq_369Hz = fft(dist_369Hz, n);

%obtain 392 Hz (F)
dist_392Hz = signal_distorted(925000:1045000);
clean_392Hz  = signal_clean(925000:1045000);
freq_392Hz = fft(dist_392Hz, n);

%obtain 415 Hz (F)
dist_415Hz = signal_distorted(1320000:1450000);
clean_415Hz  = signal_clean(1320000:1450000);
freq_415Hz = fft(dist_415Hz, n);

%obtain 440 Hz (F)
dist_440Hz = signal_distorted(1695000:1852000);
clean_440Hz  = signal_clean(1695000:1852000);
freq_440Hz = fft(dist_440Hz, n);

%obtain 466 Hz (F)
dist_466Hz = signal_distorted(2012000:2160000);
clean_466Hz  = signal_clean(2012000:2160000);
freq_466Hz = fft(dist_466Hz, n);

%obtain 493 Hz (F)
dist_493Hz = signal_distorted(2345000:2510000);
clean_493Hz  = signal_clean(2345000:2510000);
freq_493Hz = fft(dist_493Hz, n);

%obtain 523 Hz (F)
dist_523Hz = signal_distorted(2642000:2810000);
clean_523Hz  = signal_clean(2642000:2810000);
freq_523Hz = fft(dist_523Hz, n);

%obtain 554 Hz (F)
dist_554Hz = signal_distorted(2950000:3075000);
clean_554Hz  = signal_clean(2950000:3075000);
freq_554Hz = fft(dist_554Hz, n);

% obtain 587 Hz (F)
dist_587Hz = signal_distorted(3210000:3395000);
clean_587Hz  = signal_clean(3210000:3395000);
freq_587Hz = fft(dist_587Hz, n);

%obtain 622 Hz (F)
dist_622Hz = signal_distorted(3480000:3610000);
clean_622Hz  = signal_clean(3480000:3610000);
freq_622Hz = fft(dist_622Hz, n);

%obtain 659 Hz (F)
dist_659Hz = signal_distorted(3750000:3890000);
clean_659Hz  = signal_clean(3750000:3890000);
freq_659Hz = fft(dist_659Hz, n);

%obtain 698 Hz (F)
dist_698Hz = signal_distorted(4005000:4340000);
clean_698Hz  = signal_clean(4005000:4340000);
freq_697Hz = fft(dist_698Hz, n);

%obtain 739 Hz (F)
dist_739Hz = signal_distorted(4550000:4760000);
clean_739Hz  = signal_clean(4550000:4760000);
freq_739Hz = fft(dist_739Hz, n);

%obtain 783 Hz (F)
dist_783Hz = signal_distorted(4920000:5075000);
clean_783Hz  = signal_clean(4920000:5075000);
freq_783Hz = fft(dist_783Hz, n);

%obtain 830 Hz (F)
dist_830Hz = signal_distorted(5240000:5375000);
clean_830Hz  = signal_clean(5240000:5375000);
freq_830Hz = fft(dist_830Hz, n);

%obtain 880 Hz (F)
dist_880Hz = signal_distorted(5600000:5750000);
clean_880Hz  = signal_clean(5600000:5750000);
freq_880Hz = fft(dist_880Hz, n);

%obtain 932 Hz (F)
dist_932Hz = signal_distorted(5955000:6090000);
clean_932Hz  = signal_clean(5955000:6090000);
freq_932Hz = fft(dist_932Hz, n);

%obtain 987 Hz (F)
dist_987Hz = signal_distorted(6305000: 6492000);
clean_987Hz  = signal_clean(6305000: 6492000);
freq_987Hz = fft(dist_987Hz, n);

%obtain 1046 Hz (F)
dist_1046Hz = signal_distorted(6675000:6840000);
clean_1046Hz  = signal_clean(6675000:6840000);
freq_1046Hz = fft(dist_1046Hz, n);

%obtain 1108 Hz (F)
dist_1108Hz = signal_distorted(7020000:7210000);
clean_1108Hz  = signal_clean(7020000:7210000);
freq_1108Hz = fft(dist_1108Hz, n);

%obtain 1174 Hz (F)
dist_1174Hz = signal_distorted(7750000:7925000);
clean_1174Hz  = signal_clean(7750000:7925000);
freq_1174Hz = fft(dist_1174Hz, n);

%obtain 1244 Hz (F)
dist_1244Hz = signal_distorted(8080000:8285200);
clean_1244Hz  = signal_clean(8080000:8285200);
freq_1244Hz = fft(dist_1244Hz, n);

%obtain 1318 Hz (F)
dist_1318Hz = signal_distorted(8520000:8710000);
clean_1318Hz  = signal_clean(8520000:8710000);
freq_1318Hz = fft(dist_1318Hz, n);


plot(signal_distorted)