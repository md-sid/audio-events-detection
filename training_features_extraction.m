% Extracts and saves the trainig features as a .mat file named as
% "trainig_features.mat".

output = cell(1,numel(training_files));
T = cell(1,numel(training_files));
for i = 1 : numel(training_files)
    filename = strcat(training_files(i).folder, '/', ...
        training_files(i).name);
    [y, Fs] = audioread(filename);
    [output{i}, T{i}] = get_features(y, Fs, W, NFFT);
    fprintf('Extracted Features of Training Data %d out of %d\n', ...
        i, numel(training_files));
end

save('trainig_features.mat', 'output', 'T', '-v7.3');