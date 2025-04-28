function [s]=get_trainingData

samples = 180;
inputSize = 180;
data_array = get_processData;
inputArray = zeros(samples, inputSize + 1); %input to the NN for training

%assign the correct labels to the samples
for i = 1:45
   inputArray(i) = 1;
end
for i = 46:90
   inputArray(i) = 2;
end
for i = 91:135
   inputArray(i) = 3;
end
for i = 136:180
   inputArray(i) = 4;
end

%concatonate the 180 mfcc after the label for each sample
for i = 1:180
    nextSample = get_mfccSample(i, data_array);
    
    for j = 1:180
       inputArray(i + 180 * j)  = nextSample(j);  
    end
end

s = inputArray;