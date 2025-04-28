function [s]=get_processData()

samples = 180;
mfccPerFrame = 12;
frames = 15;
processed = zeros(mfccPerFrame * frames, samples);

name = ["Al", "An", "Y"];
animal = ["cow", "dog", "cat", "sheep"];

y = zeros(mfccPerFrame * frames, 1);

for i = 1:4
    for j = 1:3
        for k = 1:15
            filename = animal(i) + name(j) + k + ".wav";
            
            x = get_sampleData(filename);
            
            %uncomment in the case you want to use a filter
            %fpass = [80, 400]; %accounting for higher voice freq of children
            %n = bandpass(x,fpass,8000); %making use of a passband to filter on human voice freq

            %for m = 1:16000
            %    x(m) = n(m);
            %end
            
            %cut the audio sample by detecting when a human speaks
            for d = 1:16000
            %if we detect a high enough value we assume a human is speaking
            if x(d) > 0.0031
                x = x(d:1:16000);
                break
            end
            end

            mfcc = melcepst(x,8000); %get the first 12 mfcc of each frame
            
            %store the first 12 mfcc of the first 15 frames in y
            z = 1;
            for b = 1:15
                for c = 0:11
                    y(z) = mfcc(c * size(mfcc,1) + b);
                    z = z + 1;
                end
            end
            
            %the elements of y in the correct location of the processed
            %array
            for e = 1:180
                processed(e + ((i - 1)*45 +(j-1)*15 +(k-1))*180) = y(e);
            end
        end
    end
end

s = processed
