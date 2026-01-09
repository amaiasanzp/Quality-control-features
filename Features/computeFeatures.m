function X = computeFeatures(s,w,fs)

% INPUT:
%
% - s : signal preprocessed
% - fs: sampling frequency [sample/s]
% - w : original signal  
%
% OUTPUT:
%
% - X: array with feature values
%
% implemented by  Amaia Sanz (amaia.sanzp@ehu.eus) 

% Frequency-domain statistical moments of a signal
X(1)   = var(s);
X(2)   = skewness(s);
X(3)   = kurtosis(s);

% Fuzzy Entropy
[X(4)] = calculate_FuzzyEn(s,2,0.25,1);

%Hjorth
[X(5), X(6), X(7),~,~,~] = calculate_hjorth(s,0);

%FPA
[X(8),~,~,acf] = calculate_acf(s,fs);
X(9)           = skewness(acf);
X(10)          = kurtosis(acf);

%HRV
lags = 10;
[r, SD1, SD2, SD12, ~, ~] = calculate_HRV_parameters(s,lags);
X(11:20)                  = r;
X(21:30)                  = SD1;
X(31:40)                  = SD2;
X(41:50)                  = SD12;

% basSQI
X(51)  = calculate_basSQI(w-mean(w),fs);

% SQI
[sSQI, sSQIm] = calculate_sSQI(s,fs);
X(52)  = sSQI;
X(53)  = sSQIm;

% Sxx
[AMSA,Sxx] = calculate_spectral_measures(s,fs); 
X(54)      = skewness(Sxx);   
X(55)      = kurtosis(Sxx);

% Spectral Entropy
X(56)  = calculate_spectral_entropy(s);

% AMSA
X(57)  = AMSA;

%ZCR
X(58)  = calculate_zero_crossing_rate(s);



end