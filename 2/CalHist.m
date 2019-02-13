function[freq] = CalHist(inputIm, hist, normhist)
[n, m] = size(inputIm);
if(hist)
    
    inputIm = double(inputIm);
    temp = inputIm(:);
    len = length(temp);

    freq = zeros(1,256);

    for i=1:len %Frequency of the intensity values
        freq(temp(i)+1) = freq(temp(i)+1) + 1;
    end
end
if(normhist)
    
    inputIm = double(inputIm);
    temp = inputIm(:);
    len = length(temp);

    freq = zeros(1,256);

    for i=1:len %Frequency of the intensity values
        freq(temp(i)+1) = freq(temp(i)+1) + 1;
    end
    freq = freq/(n*m);
end
end