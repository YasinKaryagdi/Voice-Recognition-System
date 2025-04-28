trainingData = get_trainingData;
labels = trainingData(:,1);
targets=dummyvar(labels);
inputs = trainingData (:,2:end);
inputs = inputs';
targets = targets';

%this code is to get the data that has been processed.
%this needs to be run before running the script to generate neural network.
%it sets all the variables correctly before inputting them into the NN