clear
% Generate a sampled sinusoid with frequency f0
fs=10000; % sampling rate (Hz)
Ts=1/fs; % sampling interval
N=64; % number of samples
f0=1250; % frequency of sinusoid (Hz)
t=(0:N-1)'*Ts; % discrete time samples
x=sin(2*pi*f0*t); % sampling a sinusoid

% DFT with and without spectral leakage (f0=1200 and f0=1250)
X=fft(x);
% plot the whole DFT spectrum
figure(2)
plot((0:N-1)*fs/N,20*log10(abs(X)),'o')
hold on
plot((0:N-1)*fs/N,20*log10(abs(X)),'--')
hold off
axis([0 fs -50 50])
xlabel('Frekvens f (Hz)')
ylabel('abs(X) (dB)')
title('Amplitudspektrum, hela')
% plot the half DFT spectrum
figure(3)
plot((0:N/2)*fs/N,20*log10(abs(X(1:N/2+1))),'o')
hold on
plot((0:N/2)*fs/N,20*log10(abs(X(1:N/2+1))),'--')
hold off
axis([0 fs/2 -50 50])
xlabel('Frekvens f (Hz)')
ylabel('abs(X) (dB)')
title('Amplitudspektrum, halva')