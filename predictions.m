% Predicts the test set based on the trained model and outputs a .mat file
% named "test_result.mat".

% load('testing_data_and_label.mat');

testData = test_data_label(1:end, 1:539);
testLabel = test_data_label(1:end,540);

for i = 1 : length(trained_models)
    tic
    filename = trained_models(i).name(1:end-4);
    trainedData = load(filename);
    fprintf('\nInitializing Test with %s \n', filename);
    tmp = fieldnames(trainedData);
    tmp = trainedData.(tmp{1});
    yfit{i} = tmp.predictFcn(testData);
    check{i} = (testLabel == yfit{i});
    accuracy(i) = nnz(check{i})/length(check{i});
    conf_matrix{i} = confusionmat(testLabel,yfit{i});
    
    for j = 1 : 4
        conf_matrix{i}(j,5) = conf_matrix{i}(j,j)/sum(conf_matrix{i}(j,:));
    end
    
    fprintf('The confusion Matrix is : \n');
    disp(conf_matrix{i}(:,1:4));
    fprintf('Individual Accuracy is : \n');
    disp(conf_matrix{i}(:,5));
    fprintf('Test with %s is complete. Accuracy = %.4f \n', ...
        filename, accuracy(i));
    toc
end

save('test_result.mat', 'accuracy', 'conf_matrix', 'files', 'check', '-v7.3');
fprintf('Classification results are saved successfully\n');