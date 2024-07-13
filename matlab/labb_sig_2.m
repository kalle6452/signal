clear
% Förberedelser
fs=10000; % sampling rate (Hz)
Ts=1/fs; % sampling interval
N=128; % number of samples
f0=1200; % frequency of sinusoid (Hz)
t=(0:N-1)'*Ts; % discrete time samples
x=sin(2*pi*f0*t); % sampling a sinusoid
X=fft(x);
N1=1024;
X1=fft(x,N1);
% DFT with window functions
w_1=boxcar(N); % Rectangular window
w_2=hanning(N); % Hanning window
w_3=hamming(N); % Hamming window
w_4=blackman(N); % Blackman window
w_5=kaiser(N,15); % Kaiser window
Xw=fft(x.*w_1,N1);
%Xw=fft(w_4,N1); % DFT of window function alone
% plot the half DFT spectrum
figure(5)
plot((0:N1/2)*fs/N1,20*log10(abs(Xw(1:N1/2+1))),'-')
axis([0 fs/2 -200 50])
xlabel('Frekvens f (Hz)')