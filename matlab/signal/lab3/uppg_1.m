clear
fs=8192; % Sampling rate
% Lowpass FIR filter design
M=40; % Length of FIR filter
Wn=2*2000/fs; % Normalized frequency in Matlab
% Various Window functions
%h=fir1(M,Wn,blackman(M+1));
%h=fir1(M,Wn,boxcar(M+1));
%h=fir1(M,Wn,hanning(M+1));
%h=fir1(M,Wn,hamming(M+1));
h=fir1(M,Wn,kaiser(M+1,5.0));
figure(1),clf
plot((0:M),h,'-o')
xlabel('discrete time n')
ylabel('h(n)')
title('impulse response h(n)')
% Calculate frequency response of digital FIR filter
N=512;
H=fft(h,N); % FFT with zero padding
f=(0:1/N:1/2)*fs;
figure(2),clf
plot(f,20*log10(abs(H(1:N/2+1))))
grid on
axis([0 fs/2 -100 10])
xlabel('Normalized frequency')
ylabel('log10(abs(H))')
title('Frequency response magnitude in dB')
figure(21),clf
plot(f,unwrap(angle(H(1:N/2+1))))
grid on
xlabel('Normalized frequency')
ylabel('unwrap(angle(H))')
title('Phase of H in radians')