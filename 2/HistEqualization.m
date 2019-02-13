function[enhancedIm, transFunc]= HistEqualization(inputIm)
[n, m] = size(inputIm);
sum=0;
inputIm = double(inputIm);
temp = sort(inputIm(:));
len = length(temp);

freq = zeros(1,256);
cfreq = freq;
for i=1:len %Frequency of the intensity values
    freq(temp(i)+1) = freq(temp(i)+1) + 1;
end

for i=1:256 %Cumulative sum of the intensity values
    sum=sum+freq(i);
    cfreq(i)=sum;
end

pfreq = cfreq/(n*m);

transFunc = pfreq*255;

enhancedIm = inputIm;

for i=1:n
    for j=1:m
        enhancedIm(i,j)=transFunc(inputIm(i,j));
    end
end
end