function [t,x] = urz(bits, bitrate)
% URZ Encode bit string using unipolar RZ code.


T = length(bits)/bitrate; % full time of bit sequence
n = 200;
N = n*length(bits);
dt = T/N;
t = 0:dt:T;
x = zeros(1,length(t)); % output signal
l=length(bits)

for i = 0:length(bits)-1
  if bits(i+1) == 1             % checking condition for next bit if it is one or not
    x(i*n+1:(i+0.5)*n) = 1;     % if 1 then for current bit duration there will be 100 parts i.e. upto half duration of current bit all equal to 1
                                %  from next half duration i.e. from101th part of current bit duration  to 200th part upto next bit duration all will be 0
    x((i+0.5)*n+1:(i+1)*n) = 0;
  else
    x(i*n+1:(i+1)*n) = 0;        % if 0 then for current bit to next bit there will be 200 parts all equal to 0 
  end
end
