function SE = calculate_spectral_entropy(oxy)
% SPECTRAL_ENTROPY Computes the spectral entropy of a signal
%
% INPUT:
%   oxy : Input signal
%
% OUTPUT:
%   SE : Spectral entropy computed from the normalized power spectral density

oxy_fft = fft(oxy);

PSD = (abs(oxy_fft).^2) / length(oxy);
P = PSD / sum(PSD);
SE = -sum(P .* log2(P));

end