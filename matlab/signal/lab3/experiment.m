%Fpass = 0.37;
%Fstop = 0.43;
Ap = 3;
Ast = 70;
Fpass = 2000;
Fstop = 3000;
d = designfilt("lowpassfir", ...
    PassbandFrequency=Fpass, ...
    StopbandFrequency=Fstop, ...
    PassbandRipple=Ap, ...
    StopbandAttenuation=Ast);
fa = filterAnalyzer(d,FilterNames="Equiripple_Design");