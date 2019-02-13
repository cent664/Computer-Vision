function [maxValue, minValue, meanValue, medianValue] = FindInfo(oriIm)

oriIm = sort(oriIm(:));
loriIm = length(oriIm);

minValue = oriIm(1);

maxValue = oriIm(loriIm);

meanValue = sum(oriIm)/loriIm;

if mod(oriIm,2)== 1
    medianValue = oriIm((loriIm/2)+1);
else
    medianValue = (oriIm(loriIm/2) + oriIm((loriIm/2)+1))/2;
end
end

