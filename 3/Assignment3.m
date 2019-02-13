%Agnibh Dasgupta - A02292865 Assignment 3

%-----Problem 1.1-----

A = imread('Circuit.jpg');

mask3v3 = ones(3);
mask3v3 = mask3v3/(sum(sum(mask3v3)));
mask5v5 = ones(5);
mask5v5 = mask5v5/(sum(sum(mask5v5)));

[filteredIm]= AverageFiltering(A, mask3v3);
filteredIm = uint8(filteredIm);

figure;

subplot(1,3,1);
imshow(A);
title('Original Image');

subplot(1,3,2);
imshow(filteredIm);
title('Averaging Mask 3v3');

[filteredIm]= AverageFiltering(A, mask5v5);
filteredIm = uint8(filteredIm);

subplot(1,3,3);
imshow(filteredIm);
title('Averaging Mask 5v5');

pause;

%-----Finish Solving Problem 1.1-----

%-----Problem 1.2-----

mask3v3 = [1 2 1 ; 2 4 2 ; 1 2 1];
mask5v5 = ones(5);

[filteredIm] = MedianFiltering(A, mask3v3);
filteredIm = uint8(filteredIm);

figure;

subplot(1,3,1);
imshow(A);
title('Original Image');

subplot(1,3,2);
imshow(filteredIm);
title('Median Mask 3v3');

[filteredIm] = MedianFiltering(A, mask5v5);
filteredIm = uint8(filteredIm);

subplot(1,3,3);
imshow(filteredIm);
title('Median Mask 5v5');

pause;

%-----Finish Solving Problem 1.2-----

%-----Problem 1.3-----

A = imread('Moon.jpg');
laplace3v3 = [1 1 1 ; 1 -8 1 ; 1 1 1];

A=double(A);

filteredIm = conv2(A,laplace3v3);
[r c]=size(filteredIm);
filteredIm = filteredIm(2:r-1,2:c-1);

[scaledIm, transFunc] = Scaling(filteredIm, [0,255]); %Using scaling function

enhancedIm = A - filteredIm;

figure;

A=uint8(A);

subplot(2,2,1);
imshow(A);
title('Original Image');

filteredIm=uint8(filteredIm);

subplot(2,2,2);
imshow(filteredIm);
title('Filtered Image');

scaledIm=uint8(scaledIm);

subplot(2,2,3);
imshow(scaledIm);
title('Scaled filtered Image');

enhancedIm=uint8(enhancedIm);

subplot(2,2,4);
imshow(enhancedIm);
title('Enhanced Image');

pause;

%-----Finish Solving Problem 1.3-----

%-----Problem 2.1-----

A=imread('Rice.jpg');

[filteredImH filteredImV]= sobel(A);

filteredImH=abs(filteredImH);
filteredImV=abs(filteredImV);

filteredImH=255*imbinarize(filteredImH,145);
filteredImV=255*imbinarize(filteredImV,145);

filteredIm = filteredImH + filteredImV;
filteredImH=uint8(filteredImH);

disp('Used trial and error to find the threshold, looked for values so that the edges at visible but to exclude other details');

%-----Finish Solving Problem 2.1-----

%-----Problem 2.2-----

edgeHist= CallEdgeHist(A, 18);

figure;

subplot(1,3,1);
imshow(A);
title('Original Image');

subplot(1,3,2);
imshow(filteredIm);
title('Image with edges');

subplot(1,3,3);
bar(edgeHist);
title('Edge Histogram');

pause;

%-----Finish Solving Problem 2.2-----

%-----Problem 3-----

A=imread('Text.gif');

outputIm = clean(A);

A=imread('Text1.gif');

outputIm = clean(A);

A=imread('Text2.jpg');
A=rgb2gray(A);

outputIm = clean(A);

%-----Finish Solving Problem 3-----

clear;
close('all');