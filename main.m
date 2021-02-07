% This script will help to run the whole process easily. To make it work
% make the suggested changes. After the suggested changes are made, if
% you run this script, you will get the training and testing data along
% with labels that will be used later to check the accuracy and calculate
% the results. The suggested changes can be found and edited at
% "suggested_changes.m" script.

fprintf('Starting the training feature extraction process\n');
run('training_features_extraction.m');
fprintf('Converting the training XML files to MATLAB struct\n');
run('training_xml_to_mat.m');
run('training_data_label.m');
fprintf('Starting the testing feature extraction process\n');
run('testing_features_extraction.m');
fprintf('Converting the testing XML files to MATLAB struct\n');
run('testing_xml_to_mat.m');
run('testing_data_label.m');