load handel
fs = 8192;
%Wn=2*2000/fs;
Wn=2*[2000 3000]/fs;
N=11;
[B,A]=butter(N,Wn);
f=(0:1/N:1/2)*fs;
H=freqz(B,A,2*pi*f/fs);
sound(y,fs)
z=filter(B,A,y);
sound(z,fs)