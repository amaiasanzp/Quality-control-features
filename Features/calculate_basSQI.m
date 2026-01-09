function basSQI = calculate_basSQI(x,fs)
% CALCULATE_BASSQI Computes a baseline signal quality index (basSQI)
%
% INPUTS:
%   x  : Input signal
%   fs : Sampling frequency (Hz)
%
% OUTPUT:
%   basSQI : Baseline signal quality index, based on spectral power

x_or = x;
x = x'.*hamming(length(x));
NFFT=4096;

[X,F]=freqz(x,1,NFFT,fs);
X=abs(X);
Pxx=X.^2;
fc1=1;fc2=fs/2;
basSQI=1-sum(Pxx(F<fc1))/sum(Pxx(F<fc2));
