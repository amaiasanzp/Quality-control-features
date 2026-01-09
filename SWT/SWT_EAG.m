function [a,d,filtros]=SWT_EAG(s,n,wav)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Compute stationary wavelet coefficients using quadrature mirror filter
% banks.
% Input arguments:
%   s: signal to be decomposed
%   n: levels of decomposition
%   wav: name of the mother wavelet intended to use in the decomposition.
%        Examples are as follows (for details see documentation for 'wfilters')
%           'Haar': Haar wavelet
%           'DbX': Daubichies-X wavelet where X is an integer
%           'CoifX': Coiflets-X wavelet where X is an integerSymlets
%           'SymX': Symlets-X wavelet where X is an integer
% Output arguments:
%   a: approximation coefficients
%   d: detail coefficients
%   filtros: filters used to decompose the signal into approx.
%   and detail coefficients

% Created by Erik Alonso González 27/12/2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x=s;
sLen=length(x);
d = zeros(n,sLen);
a = zeros(n,sLen);

% Filters
[lo,hi,lor,hir] = wfilters(wav);

for k = 1:n

    % Decomposition.
    d(k,:) = wkeep1(wconv1(x,hi),sLen,length(lo)/2);
    a(k,:) = wkeep1(wconv1(x,lo),sLen,length(lo)/2);
        
    filtros(k).hi=hi;
    filtros(k).lo=lo;
    filtros(k).hir=hir;
    filtros(k).lor=lor;
    
    % upsample filters.
    lo = dyadup(lo,1,1);
    hi = dyadup(hi,1,1);
    lor = dyadup(lor,1,1);
    hir = dyadup(hir,1,1);
    
    % New value of x.
    x = a(k,:);

end