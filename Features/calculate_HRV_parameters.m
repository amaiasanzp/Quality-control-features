function [r, SD1, SD2, SD12, S, SDRR] = calculate_HRV_parameters(A,lags)
% HRV_PARAMETERS Computes time-domain HRV (Heart Rate Variability) metrics
%
% INPUTS:
%   A    : Input signal
%   lags : Number of lags for autocorrelation analysis
%
% OUTPUTS:
%   r    : Autocorrelation coefficient for each lag
%   SD1   : Poincar plot short-term variability
%   SD2   : Poincar plot long-term variability
%   SD12  : Ratio SD1 / SD2
%   S     : Area of the Poincar plot ellipse
%   SDRR  : Standard deviation of RR intervals (combined measure)

n    = length (A);
r    = NaN(lags,1);
SD1  = NaN(lags,1);
SD2  = NaN(lags,1);
SD12 = NaN(lags,1);
S    = NaN(lags,1);
SDRR = NaN(lags,1);

for i=1:lags
    X = A(1:n-i);
    Y = A(i+1:n);

    cc         = corrcoef(X,Y);
    r(i,1)     = cc(1,2);
    SD1(i,1)   = std((X - Y)./sqrt(2));
    SD2(i,1)   = std((X + Y)./sqrt(2));
    SD12(i,1)  = SD1(i,1)/SD2(i,1);
    S(i,1)     = pi*SD1(i,1)*SD2(i,1);
    SDRR(i,1)  = sqrt(SD1(i,1)^2+SD2(i,1)^2)/sqrt(2);
end