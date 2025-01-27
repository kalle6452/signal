Fstop1 = 150;
Fpass1 = 200;
Fpass2 = 300;
Fstop2 = 350;
Astop1 = 70;
Apass  = 3;
Astop2 = 70;
Fs = 8192;
d7 = designfilt("bandpassfir", ...
    StopbandFrequency1=Fstop1, ...
    PassbandFrequency1=Fpass1, ...
    PassbandFrequency2=Fpass2, ...
    StopbandFrequency2=Fstop2, ...
    StopbandAttenuation1=Astop1, ...
    PassbandRipple=Apass, ...
    StopbandAttenuation2=Astop2, ...
    DesignMethod="kaiserwin", ...
    SampleRate=Fs);
filterAnalyzer(d7)
    %DesignMethod="equiripple", ...
filtord(d7)
% kaiserwin