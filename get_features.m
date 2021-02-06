function [output, T] = get_features(y, Fs)
%GET_FEATURES Extracts the features for Audio Events Classification.
%   GET_FEATURES(y, Fs) returns a output of size M x N matrix, where M is
%   the number of time segments, and N is the number of features extracted.
% 
    window_size = 2048;
    window = hamming(window_size);
    noverlap = window_size/2;
    nfft = gpuArray(1024);
    [S,~,T,P] = spectrogram(y,window,noverlap,nfft,Fs,'yaxis');
    P = (10*log10(P))';
    [coeffs,delta] = mfcc(S,Fs,"LogEnergy","Ignore");
    output = [P, coeffs, delta];
end