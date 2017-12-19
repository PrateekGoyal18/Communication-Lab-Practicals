function [t,x] = prz(bits, bitrate)
% PRZ Encode bit string using polar RZ code.

T = length(bits)/bitrate; % full time of bit sequence
n = 200;
N = n*length(bits);
dt = T/N;
t = 0:dt:T;
x = zeros(1,length(t)); % output signal

for i = 0:length(bits)-1
  if bits(i+1) == 1                   % checking condition for next bit if it is one or not
    x(i*n+1:(i+0.5)*n) = 1;           % if 1 then for current bit duration there will be 100 parts till half duration in current bit duration all equal to 1 
                                      % and from next half i.e.101th part of current bit duration to 200th part i.e. upto next bit duration all will be 0
    x((i+0.5)*n+1:(i+1)*n) = 0;
  else
    x(i*n+1:(i+0.5)*n) = -1;          % if 0 then for current bit duration there will be 100 parts till half duration in current bit duration all equal to -1 
                                      % and from next half i.e.101th part of current bit duration to 200th part i.e. upto next bit duration all will be 0
    x((i+0.5)*n+1:(i+1)*n) = 0;
  end
end
