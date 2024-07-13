clear % clear all parameters
% Fourier series parameters
T=1; % period
Tp=0.2; % pulse width
t=linspace(0,2*T,1000); % time domain (as row vector)
N=10^2; % number of Fourier coefficients (2N+1)
k=(-N:N)'; % discrete Fourier indices (as column vector)
omegak=2*pi*k/T; % discrete frequencies (as column vector)
Xr=(1/T)*Tp*exp(-1i*omegak*Tp/2).*sin(omegak*Tp/2)./(omegak*Tp/2);
% Första integralen
Yr = Xr./(1i*omegak);
% Andra integralen
%Xr=((1/T)*Tp*exp(-1i*omegak*Tp/2).*sin(omegak*Tp/2)./(omegak*Tp/2))./((1i*2*pi*k)./T).^2;

% Första derivatan
%Xr=((1i*2*pi*k)./T).*((1/T)*Tp*exp(-1i*omegak*Tp/2).*sin(omegak*Tp/2)./(omegak*Tp/2));

% Andra derivatan
%Xr=(((1i*2*pi*k)./T).^2).*((1/T)*Tp*exp(-1i*omegak*Tp/2).*sin(omegak*Tp/2)./(omegak*Tp/2));

zeroindex=find(omegak==0); % Find index where omegak=0
Yr(zeroindex)=(1/T)*Tp;
F=exp(1i*omegak*t); % Fourier matrix
yr=real(Yr.'*F);
% Plot the result with correct time axis
figure(1)
plot(t,yr)
% Plot the Fourier coefficients (absolute value in dB)