function[scaledIm, transFunc] = Scaling(inputIm, range)
inputIm = double(inputIm);
inputIm_vector = sort(inputIm(:));
len = length(inputIm_vector);

oldmin = inputIm_vector(1);
oldmax = inputIm_vector(len);
newmin = range(1);
newmax = range(2);

slope = (newmax-newmin)/(oldmax-oldmin);

scaledIm = ((slope*(inputIm-oldmin))+newmin);

transFunc = (sort(unique(scaledIm(:))));
transFunc = uint8(transFunc);
end