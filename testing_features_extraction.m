% Extracts and saves the testing features as a .mat file named as
% "testing_features.mat".

output = cell(1,numel(testing_files));
T = cell(1,numel(testing_files));
for i = 1 : numel(testing_files)
    filename = strcat(testing_files(i).folder, '/', testing_files(i).name);
    [y, Fs] = audioread(filename);
    [output{i}, T{i}] = get_features(y, Fs);
    fprintf('Extracted Features of Testing Data %d out of %d\n', ...
        i, numel(testing_files));
end

save('testing_features.mat', 'output', 'T', '-v7.3');