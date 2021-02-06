% Converts the .xml testing information to matlab struct so that MATLAB
% can access the information. It will save a .mat file named as
% "testing_information.mat".
% 
% output(1).class will be the type of the first event (2 = glass, 3 = gunshot, 4 = scream)
% output(1).startsecond will be the starting time of the first event
% output(1).endsecond will be the ending time of the first event

test_data = cell(1, numel(testing_xml));

for i = 1 : numel(testing_xml)
    filename = strcat(testing_xml(i).folder, '/' ,testing_xml(i).name);
    test_data{i} = xml2mat(filename);
end

save('testing_information.mat', 'test_data');
