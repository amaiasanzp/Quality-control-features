function [FPA,SPA,PAR,acf]=calculate_acf(x,fs)
% ACF Computes autocorrelation-based features from a signal
%
% INPUTS:
%   x  : Input time-domain signal
%   fs : Sampling frequency (Hz)
%
% OUTPUTS:
%   FPA : First peak amplitude of the autocorrelation function
%   SPA : Second peak amplitude of the autocorrelation function
%   PAR : Peak amplitude ratio (FPA / SPA)
%   acf : Autocorrelation function of the input signal


pH = 0.1;pD = 0.24;
[acf,~] = autocorr(x,'NumLags',length(x)-1);
[PKS,LOCS] = findpeaks(acf,fs,"MinPeakHeight",0.1,"MinPeakDistance",pD);
if ~isempty(PKS)
    FPA = PKS(1);
    if length(PKS)>1
        SPA = PKS(2);
        PAR = FPA/SPA;
    else
        SPA = 0;
        PAR = 0;
        FCC = 0;
    end
else
    FPA = 0;
    SPA = 0;
    PAR = 0;
end