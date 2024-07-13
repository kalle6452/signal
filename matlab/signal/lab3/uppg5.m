% Butterworth lowpass IIR filter
fs = 8192;
%Wn=2*2000/fs;
Wn=2*[2000 3000]/fs;
N=50;
[B,A]=ellip(N,3,70,Wn);
%[B,A]=butter(N,Wn);
f=(0:1/N:1/2)*fs;
H=freqz(B,A,2*pi*f/fs);
figure(5),clf
plot(f,20*log10(abs(H)))
grid on
axis([0 fs/2 -100 10])
xlabel('Normalized frequency')
ylabel('log10(abs(H))')
title('Frequency response magnitude')
