% Generates the training data along with their respective labels that will
% be used for the classifier learning. The data will be saved as a .mat
% file named "training_data_and_label.mat".

% load('trainig_features.mat');
% load('training_information.mat');

%% Get the labels
num_file = numel(train_data);
labels = cell(1, num_file);

for i = 1 : num_file
    time = T{i};
    data_prop = train_data{i};
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

%% Combine Data and Labels
train_data_label = [];
for i = 1 : num_file
    tmp = [output{i}, labels{i}];
    train_data_label = [train_data_label; tmp];
end

%% Remove some background noises (50% bacground, 50% events)
idx_background = find(train_data_label(:,end) == 1);
num_events = numel(find(train_data_label(:,end) == 2)) + ...
    numel(find(train_data_label(:,end) == 3)) + ...
    numel(find(train_data_label(:,end) == 4));
rand_idx = randperm(numel(idx_background));
remove_idx = rand_idx(num_events + 1 : end);
new_data = train_data_label;
new_data(idx_background(remove_idx),:) = [];

save('training_data_and_label.mat', 'new_data', '-v7.3');
fprintf('Training Data along with Labels are saved successfully.\n');