function [t,x] = unrz(bits, bitrate)
% UNRZ Encode bit string using unipolar NRZ code.

T = length(bits)/bitrate; % total time duration
n = 200;
N = n*length(bits);       % 200 parts are added for every single bit for proper graph  
dt = T/N;                 % very small time interval for 
t = 0:dt:T;               % dividing time axis in 200 parts
x = zeros(1,length(t));   % output signal

for i = 0:length(bits)-1
  if bits(i+1) == 1       % checking condition for next bit if it is one or not
    x(i*n+1:(i+1)*n) = 1; % if yes then for current bit to next bit there will be 200 parts all equal to 1 
  else
    x(i*n+1:(i+1)*n) = 0; % if yes then for current bit to next bit there will be 200 parts all equal to 0 
  end
end
