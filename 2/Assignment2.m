%Agnibh Dasgupta - A02292865 Assignment 2

%-----Problem 1-----

A = imread('Food.jpg');
[scaledIm, transFunc] = Scaling(A, [0,255]);

A = double(A);
A_vector = sort(unique(A(:)));

len = length(A_vector);

oldmin = A_vector(1)/255;
oldmax = A_vector(len)/255;
A = uint8(A);

figure;

plot(A_vector,transFunc);
xlabel('Input Image Intensity');
ylabel('Output Image Intensity');

pause;

%-----Finish Solving Problem 1-----

%-----Problem 2-----

scaledIm = uint8(scaledIm);
matScaledFood = imadjust(A,[oldmin oldmax],[0 1]);

figure;

subplot(1,2,1);
imshow(scaledIm);
title('Scaled Image - My method');

subplot(1,2,2);
imshow(matScaledFood);
title('Scaled Image - Matlabs method');

pause;

%-----Finish Solving Problem 2-----

%-----Problem 3-----

[freq] = CalHist(scaledIm, 1, 0);

figure;

subplot(2,2,1);
bar(freq);
xlabel('Intensity');
ylabel('Frequency');
title('Histogram - My method');

[freq] = CalHist(scaledIm, 0, 1);

subplot(2,2,2);
bar(freq);
xlabel('Intensity');
ylabel('Frequency');
title('Normalized Histogram - My method');

[freq] = CalHist(matScaledFood, 0, 1);

subplot(2,2,3);
bar(freq);
xlabel('Intensity');
ylabel('Frequency');
title('Normalized Histogram - Matlabs method');

[freq] = CalHist(matScaledFood, 1, 0);

subplot(2,2,4);
bar(freq);
xlabel('Intensity');
ylabel('Frequency');
title('Histogram - Matlabs method');

pause;

%-----Finish Solving Problem 3-----

%-----Problem 4-----

disp('Time taken by my Equalization function:');

tic
[enhancedIm, transFunc]= HistEqualization(A);
equalizedFood = uint8(enhancedIm);
toc

fprintf('\n');

%-----Finish Solving Problem 4-----

%-----Problem 5-----

disp('Time taken by Matlabs Equalization function:');

tic
[matEq, matTrans] = histeq(A);
toc

figure;

subplot(1,2,1);
imshow(equalizedFood);
title('Equalized Image - My method');

subplot(1,2,2);
imshow(matEq);
title('Equalized Image - Matlabs method')

pause;

figure;

subplot(1,2,1);
plot(transFunc);
xlabel('Intensity');
ylabel('Frequency');
title('Transform function - My method');

subplot(1,2,2);
plot(matTrans);
xlabel('Intensity');
ylabel('Frequency');
title('Transform function - Matlabs method');

pause;

fprintf('\n');
disp('Q. Comparison of the running times to accomplish the tasks in Problems 4 and 5.');
fprintf('\n');
disp('A. The matlab function takes less time than my function.');
fprintf('\n');
disp('Q. Comparison of the histogram equalization transform functions obtained in Problems 4 and 5.');
fprintf('\n');
disp('A. The matlab values in the transformation function is normalized, my transFunc is not.');
fprintf('\n');
disp('Q. Your findings (e.g., tricks you learned, lessons you learned, etc.) after reading the implementation detail of the chosen function for Problem 5.');
fprintf('\n');
disp('A. The matlab function histeq uses grayscale transformation(T) to reduce the original image. This helps reduce processing time. The minimization is subject to certain restrictions.');

clear;
close('all');

%-----Finish Solving Problem 5-----