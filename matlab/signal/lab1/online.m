
clear % clear all parameters
% Fourier series parameters
T=1; % period
Tp=0.2; % pulse width
t=linspace(0,2*T,1000); % time domain (as row vector)
N=1000; % number of Fourier coefficients (2N+1)
k=(-N:N)'; % discrete Fourier indices (as column vector)
%k(abs(k)==0)=[];
omegak=2*pi*k/T; % discrete frequencies (as column vector)

% Rectangular wave
% Fourier coefficients (as column vector)
Xr=(1/T)*Tp*exp(-1i*omegak*Tp/2).*sin(omegak*Tp/2)./(omegak*Tp/2);
zeroindex=find(omegak==0); % Find index where omegak=0
Xr(zeroindex)=(1/T)*Tp; % Place correct value at omegak=0
%Xs(zeroindex)=0; % Place 0 at omegak=0

% Triangelvåg
Xt = (-4/(T*Tp))*exp(-1i*omegak*Tp/2).*(cos(omegak*Tp/2)-1)./(omegak.^2);
Xt(zeroindex)=(1/T)*Tp; % Place correct value at omegak=0
F=exp(1i*omegak*t); % Fourier matrix
xr=real(Xr.'*F); % Generate Fourier series in time domain
vr=real(Xt.'*F);
% Plot the result with correct time axis

figure(5)
plot(t,vr)