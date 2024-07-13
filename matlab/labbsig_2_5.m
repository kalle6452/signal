fs = 10^4;
Ts = 1/fs;
N=512; % number of samples
f0=1200; % frequency of sinusoid (Hz)
f1=1500; % frequency of sinusoid (Hz)
t=(0:N-1)'*Ts; % discrete time samples
x=sin(2*pi*f0*t)+10^(-100/20)*sin(2*pi*f1*t); % sampling two sinusoids
% zero-padding
N1 = 8192;
% DFT with window functions
w_1=boxcar(N); % Rectangular window
w_2=hanning(N); % Hanning window
w_3=hamming(N); % Hamming window
w_4=blackman(N); % Blackman window
w_5=kaiser(N,15); % Kaiser window
Xw=fft(x.*w_1,N1);
Xw_2=fft(x.*w_2,N1);
Xw_3=fft(x.*w_3,N1);
Xw_4=fft(x.*w_4,N1);
Xw_5=fft(x.*w_5,N1);
% plot the half DFT spectrum
figure(5)
plot((0:N1/2)*fs/N1,20*log10(abs(Xw_3(1:N1/2+1))),'-')
axis([0 fs/2 -200 50])
xlabel('Frekvens f (Hz)')
ylabel('abs(X) (dB)')
title('Amplitudspektrum')
hold on 
%plot((0:N1/2)*fs/N1,20*log10(abs(Xw_2(1:N1/2+1))),'-')
%plot((0:N1/2)*fs/N1,20*log10(abs(Xw_3(1:N1/2+1))),'-')
%plot((0:N1/2)*fs/N1,20*log10(abs(Xw_4(1:N1/2+1))),'-')
%plot((0:N1/2)*fs/N1,20*log10(abs(Xw_5(1:N1/2+1))),'-')
hold off
%figure(6)
%plot((0:N1/2)*fs/N1,20*log10(abs(Xw_2(1:N1/2+1))),'-')
%axis([0 fs/2 -200 50])
%xlabel('Frekvens f (Hz)')