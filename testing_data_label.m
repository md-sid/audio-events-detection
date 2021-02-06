% Generates the testing data along with their respective labels that will
% be used for the prediction. The data will be saved as a .mat
% file named "testing_data_and_label.mat".

% load('testing_features.mat');
% load('testing_information.mat');

%% get labels
num_file = numel(test_data);
labels = cell(1, num_file);

for i = 1 : num_file
    time = T{i};
    data_prop = test_data{i};
    num_events = numel(data_prop);
    tmp_label = zeros(length(time), 1);
    for j = 1 : num_events
        time_start = data_prop(j).startsecond;
        time_stop = data_prop(j).endsecond;
        check = time >= time_start & time <= time_stop;
        tmp_label(check) = data_prop(j).class;
    end
    tmp = tmp_label == 0;
    tmp_label(tmp) = 1;
    labels{i} = tmp_label;
end

%% combine data and labels
test_data_label = [];
for i = 1 : num_file
    tmp = [output{i}, labels{i}];
    test_data_label = [test_data_label; tmp];
end

save('testing_data_and_label.mat', 'test_data_label', '-v7.3');
fprintf('Testing Data along with Labels are saved successfully.\n');