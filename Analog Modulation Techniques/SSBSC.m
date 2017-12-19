%MATLAB Code of Single Sided Band Modulation and Demodulation 

n = 1024;
fs = 2048;
ts = 1/fs;
%t = 0:ts:1;
t = (0:n-1)/fs;
fc = 600;   %Carrier Frequency !! Limit fc<800 to avoid freqdomain aliasing
fm1 = 200;
Em1 = 1;

m = Em1*cos(2*pi*fm1*t);  %Message
mh = Em1*cos((2*pi*fm1*t)-pi/2);   %Hilbert Transform of the message signal

sbu = m.*2.*cos(2*pi*fc*t)-mh.*2.*sin(2*pi*fc*t);   %Expression for USB SSB 
sbl = m.*2.*cos(2*pi*fc*t)+mh.*2.*sin(2*pi*fc*t);   %Expression for LSB SSB

SBU = 2/n*abs(fft(sbu));  %Fourier Transform of USB SSB
SBL = 2/n*abs(fft(sbl));  %Fourier Transform of LSB SSB

freq = fs*(0:n/2)/n;

close all;
figure(2);
subplot(2,2,1);
plot(10*t(1:200),sbu(1:200),'r');  % Time Domain Plot of USB SSB
title('Time Domain Representation of USB');
xlabel('Time');
ylabel('Modulated Signal');
subplot(2,2,2);
plot(10*t(1:200),sbl(1:200));  % Time Domain Plot of LSB SSB
title('Time Domain Representation of LSB');
xlabel('Time');
ylabel('Modulated Signal');
subplot(2,2,3);
plot(freq,SBU(1:n/2+1),'r');
title('Frequency Domain Representation of USB');
xlabel('Frequency(Hz)');
ylabel('Spectral Magnitude');
legend('USB');
subplot(2,2,4);
plot(freq,SBL(1:n/2+1));  %Frequency Domain Plot
title('Frequency Domain Representation of LSB');
xlabel('Frequency(Hz)');
ylabel('Spectral Magnitude');
legend('LSB');

figure(4)
plot(freq,SBU(1:n/2+1),freq,SBL(1:n/2+1));
title('Frequency Domain Representation');
xlabel('Frequency(Hz)');
ylabel('Spectral Magnitude');
legend('USB','LSB');


%Demodulation
md = sbu.*cos(2*pi*fc*t);
[b,a] = butter(2,0.1);
mf = filter(b,a,md);

figure(3)
plot(t,mf);
title('Demodulated Signal');
xlabel('Time');
ylabel('Demodulated Signal');

figure(1)
plot(t,m);
title('Time Domain representation of original signal');
xlabel('Time');
ylabel('Original signal');