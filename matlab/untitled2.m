clear
% Förberedelser
fs=10000; % sampling rate (Hz)
Ts=1/fs; % sampling interval
N=64; % number of samples
f0=1200; % frequency of sinusoid (Hz)
t=(0:N-1)'*Ts; % discrete time samples
x=sin(2*pi*f0*t); % sampling a sinusoid
X=fft(x);
% DFT with zero padding
N1=1024;
X1=fft(x,N1);
% plot the half DFT spectrum
figure(4)
plot((0:N1/2)*fs/N1,20*log10(abs(X1(1:N1/2+1))),'--')
hold on
plot((0:N/2)*fs/N,20*log10(abs(X(1:N/2+1))),'o')
axis([0 fs/2 -50 50])
hold off
xlabel('Frekvens f (Hz)')
ylabel('abs(X) (dB)')
title('Amplitudspektrum')

%plot((0:N/2)*fs/N,20*log10(abs(X(1:N/2+1))),'--')
X1