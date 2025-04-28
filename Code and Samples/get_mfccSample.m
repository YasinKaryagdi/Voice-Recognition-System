function [s]=get_mfccSample(x, proccesedDataArray)

temp = zeros(1, 180);

for i = 1:180 %we take the 180 elements of the xth column
    temp(i) = proccesedDataArray(i + (x - 1) * 180); 
end

s = temp