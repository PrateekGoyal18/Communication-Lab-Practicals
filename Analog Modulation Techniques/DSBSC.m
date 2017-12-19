clc;
clear all;

vm = input('Enter the message signal amplitude = ');
vc = input('Enter the carrier signal amplitude = ');
fm = input('Enter the message frequency = ');
fc = input('Enter the carrier frequency = ');

m = vm/vc;
t = 0:0.001:1;

sm = vm*sin(2*pi*fm*t);
subplot(3,1,1);
plot(t,sm);
xlabel('Time ---->');
ylabel('Amplitude ---->');
title('Message Signal ---->');
grid on;

sc = vc*sin(2*pi*fc*t);
subplot(3,1,2);
plot(t,sc);
xlabel('Time ---->');
ylabel('Amplitude ---->');
title('Carrier Signal ---->');
grid on;

y = vc*m.*sin(2*pi*fm*t).*sin(2*pi*fc*t);
subplot(3,1,3);
plot(t,y);
xlabel('Time ---->');
ylabel('Amplitude ---->');
title('DSBSC Wave ---->');
grid on;