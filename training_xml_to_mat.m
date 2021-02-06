% Converts the .xml training information to matlab struct so that MATLAB
% can access the information. It will save a .mat file named as
% "training_information.mat".
% 
% output(1).class will be the type of the first event (2 = glass, 3 = gunshot, 4 = scream)
% output(1).startsecond will be the starting time of the first event
% output(1).endsecond will be the ending time of the first event

train_data = cell(1, numel(training_xml));

for i = 1 : numel(training_xml)
    filename = strcat(training_xml(i).folder, '/',training_xml(i).name);
    train_data{i} = xml2mat(filename);
end

save('training_information.mat', 'train_data');
fprintf('The conversion of training XML files is successful!\n');
