clear
fs=8192; % Sampling rate
% Lowpass FIR filter design
M=40; % Length of FIR filter
Wn=2*2000/fs; % Normalized frequency in Matlab
%Wn=2*[20003000]/fs; % Ny frekvens, från bandpass till lågpass
% Various Window functions
%h=fir1(M,Wn,blackman(M+1));
%h=fir1(M,Wn,boxcar(M+1));
%h=fir1(M,Wn,hanning(M+1));
%h=fir1(M,Wn,hamming(M+1));
h=fir1(M,Wn,kaiser(M+1,5.0));
% Calculate frequency response of digital FIR filter
N=512;
H=fft(h,N); % FFT with zero padding
f=(0:1/N:1/2)*fs;
figure(21),clf
hold on
plot(f,20*log10(abs(H(1:N/2+1))))
plot(f,unwrap(angle(H(1:N/2+1))))
grid on
xlabel('Normalized frequency')
ylabel('unwrap(angle(H))')
title('Phase of H in radians')
hold off