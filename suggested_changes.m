% The default values used by the author are here. Change the values so that
% it works for you too.

%% Information to extract features
% The default parameters to extract the features. Change if you want. 
% (NOT RECOMMENDED!)
W = 2048;
NFFT = 1024;

%% Information to get the training features and information
% Change the training folder directory to the folder where you have the
% trainig audio files. In the MIVIA Audio Events Dataset there are data of
% different SNR value labeled from 1 to 6. Here the data labeled with
% "audio_filename_5.wav" is shown as an example. Change "*_5.wav" to
% "*_(YOUR_DESIRED_TYPE_NUMBER).wav".
training_files = dir('../training/sounds/*_5.wav');

% Locate the folder where the training xml files are saved.
training_xml = dir('../training/*.xml*');

%% Information to get the testing features and information
% Change the testing folder directory to the folder where you have the
% testing audio files. Similar to the steps you followed for training!
testing_files = dir('../testing/sounds/*_5.wav*');

% Locate the folder where the testing xml files are saved.
testing_xml = dir('../testing/*.xml*');

%% Trained models
% Name the trained models with a common starting like "trained_NAME.mat".
% If you use a different format, then change the value of trained_models
% below.
trained_models = dir('trained_*');

