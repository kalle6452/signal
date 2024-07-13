% Butterworth lowpass IIR filter
fs=8192;
Wn=2*2000/fs;
N=5;
[B,A]=butter(N,Wn);
H=freqz(B,A,2*pi*f/fs);
figure(5),clf
plot(f,20*log10(abs(H)))
grid on
axis([0 fs/2 -100 10])
xlabel('Normalized frequency')
ylabel('log10(abs(H))')
title('Frequency response magnitude')
figure(51),clf
plot(f,unwrap(angle(H)))
grid on
xlabel('Normalized frequency')
ylabel('unwrap(angle(H))')
title('Phase of H in radians')
% plot poles and zeros, digital filter
poles=roots(A);
zeros=roots(B);
figure(6)
plot(exp(1i*2*pi*(0:0.01:1)))