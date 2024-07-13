clear % clear all parameters
% Fourier series parameters
T=1; % period
Tp=0.2; % pulse width
t=linspace(0,2*T,1000); % time domain (as row vector)
N=10000; % number of Fourier coefficients (2N+1)
k=(-N:N)'; % discrete Fourier indices (as column vector)
omegak=2*pi*k/T; % discrete frequencies (as column vector)
% Rectangular wave
% Fourier coefficients (as column vector)
% Rektangel
%Xr=(1/T)*Tp*exp(-1i*omegak*Tp/2).*sin(omegak*Tp/2)./(omegak*Tp/2);
% Triangel
%Xr=-(1/T*Tp).*4.*(exp(-1i*omegak*Tp/2).*cos(omegak*Tp/2)-1)./(omegak).^2;
Xr = (-4/(T*Tp)).*exp(-1i*omegak*Tp/2).*(cos(omegak*Tp/2)-1)./(omegak.^2);
zeroindex=find(omegak==0); % Find index where omegak=0
% Rektangel
Xr(zeroindex)=(1/2*T)*Tp; % Place correct value at omegak=0
% TriRectangular functionangel
%Xr(zeroindex)=-4/(T*Tp); % Place correct value at omegak=0

%Xs(zeroindex)=0; % Place 0 at omegak=0
F=exp(1i*omegak*t); % Fourier matrix
xr=real(Xr.'*F); % Generate Fourier series in time domain
% Plot the result with correct time axis
figure(1)
plot(t,xr)
% Plot the Fourier coefficients (absolute value in dB)
%figure(2)
%plot(omegak,20*log10(abs(Xr)),'o')
%axis([omegak(1) omegak(end) -100 0])
% Fourier transform of rectangular pulse
%omega=linspace(omegak(1),omegak(end),1000); % Frequency at a dense grid
% Rektangel
%XrF=(1/T)*Tp*exp(-1i*omega*Tp/2).*sin(omega*Tp/2)./(omega*Tp/2);
% Triangel
%XrF=((-4/T*Tp)*(exp(-1i*omegak*Tp/2).*cos(omegak*Tp/2)-1))./(omegak).^2;
%zeroindex2=find(omega==0); % Find index where omega=0
%Rektangel
%XrF(zeroindex2)=(1/T)*Tp; % Place correct value at omega=0
% Triangel
%XrF(zeroindex2)=(-4*Tp)./T;
% Plot the Fourier transform together with the Fourier coefficients
%figure(2)
%hold on
%plot(omega,20*log10(abs(XrF)),'--')
%hold off