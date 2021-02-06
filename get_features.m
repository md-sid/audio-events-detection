function [output, T] = get_features(y, Fs, W, NFFT)
%GET_FEATURES Extracts the features for Audio Events Classification.
%   GET_FEATURES(y, Fs, W, NFFT) takes input y (the audio signal), Fs
%   (sampling frequency), W (window size), and NFFT (number of FFT points).
% 
%   [OUTPUT, T] = get_features(y, Fs, W, NFFT) returns an output (the
%   features) and time T. The output is a matrix of size M x N where M is
%   the number of of time segments and N is the number of features
%   extracted. T is the time vector. 
% 
    window_size = W;
    window = hamming(window_size);
    noverlap = window_size/2;
    nfft = NFFT;
    [S,~,T,P] = spectrogram(y,window,noverlap,nfft,Fs,'yaxis');
    P = (10*log10(P))';
    [coeffs,delta] = mfcc(S,Fs,"LogEnergy","Ignore");
    output = [P, coeffs, delta];
end