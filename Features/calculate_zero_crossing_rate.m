function zcr = calculate_zero_crossing_rate(oxy)
% ZERO_CROSSING_RATE Computes the zero-crossing rate of a signal
%
% INPUT:
%   oxy : Input signal
%
% OUTPUT:
%   zcr : Proportion of samples where the signal changes sign
zcr = 0;
for i = 2:length(oxy)
    if (oxy(i) * oxy(i-1)) < 0
        zcr = zcr + 1;
    end
end

zcr = zcr / (length(oxy) - 1);

end