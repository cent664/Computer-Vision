function outputIm = clean(A);

[r c]=size(A);

outputIm=A;

for i=1:r
    av = sum(A(i,:))/c;
    for j=1:c
        if A(i,j)<=(min(A(i,:)+50)) %looking for low intensity values
        else
            outputIm(i,j)=A(i,j)+av;
        end
    end
end  
figure;

subplot(1,3,1)
imshow(A);
title('Original Image');

subplot(1,3,2)
imshow(outputIm);
title('After subtracting average');

outputIm=imbinarize(outputIm);

subplot(1,3,3)
imshow(outputIm);
title('After thresholding');

pause;

end