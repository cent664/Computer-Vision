function [blurredIm]= BlurImage(oriIm)

l = length(oriIm);
oriIm = double(oriIm);

for i=1:2:l
    for j=1:2:l
        av = (oriIm(i,j,:)+oriIm(i,j+1,:)+oriIm(i+1,j,:)+oriIm(i+1,j+1,:))/4;
        oriIm(i,j,:) = av;
        oriIm(i,j+1,:) = av;
        oriIm(i+1,j,:) = av;
        oriIm(i+1,j+1,:) = av;
    end
end
oriIm = uint8(oriIm);
blurredIm = oriIm;
end