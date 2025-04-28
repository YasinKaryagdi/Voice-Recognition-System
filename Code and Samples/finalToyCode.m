load ('firstNet.mat')
%this is loading the neural network that was saved by
%generatedNeuralNetwork.m
Fs = 8000;

newInput = audiorecorder(Fs,16, 1);

fprintf("recording in 1 ");
pause(1);
fprintf("recording now ");
%to indicate when the user should talk
recordblocking (newInput, 2);
fprintf("recording done ");
newInput = getaudiodata (newInput);

y = zeros(1, 180);

for j = 1:16000
    if newInput(j) > 0.0031
        newInput = newInput(j:1:16000);
        break
    end
end

mfcc = melcepst(newInput,Fs);
    
z = 1;
for j = 1:15
    for k = 0:11
        y(z) = mfcc(k * size(mfcc,1) + j);
        z = z + 1;
    end
end

newInputArray = y';
newOutput = firstNet(newInputArray); 

maxVal = max(newOutput);
inputData = find(newOutput == maxVal);
if (inputData == 1) 
    rec = audioread("cow.wav");
    sound(rec);
elseif (inputData == 2)
    rec = audioread("dog.wav");
    sound(rec);
elseif (inputData == 3)
    rec = audioread("cat.wav");
    sound(rec);
elseif (inputData == 4)
    rec = audioread("sheep.wav");
    sound(rec);
else 
    fprintf('unrecognized');
end


