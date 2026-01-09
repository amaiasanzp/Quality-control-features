function main
% MAIN Computes feature vectors from a signal using SWT-based preprocessing
%
% DESCRIPTION:
%   This function loads a signal segment, applies Stationary Wavelet
%   Transform (SWT) denoising, and computes a set of features over a
%   5-second analysis window.
%
% NOTES:
%   - Feature extraction functions are located in the "Features" folder
%   - SWT-related functions are located in the "SWT" folder
%   - Sampling frequency is fixed to 50 Hz
%
% AUTHOR:
%   Amaia Sanz (amaia.sanzp@ehu.eus)

% adding paths corresponding to feature calculation and SWT functions
addpath(genpath('Features'))
addpath(genpath('SWT'))

fs = 50; % sample frecuency [sample/s]

% load signal % 5-sec segment 

% calculation of the SWT
s = SWT(signal);

% Array of features
X = computeFeatures(s,signal,fs);

save 'X' 'X'

