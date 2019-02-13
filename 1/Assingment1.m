%Agnibh Dasgupta - A02292865 Assignment 1

%-----Problem 1-----

A=imread('peppers.bmp');

figure;
imshow(A);
title('RGB Original Image');

pause;

%-----Finish Solving Problem 1-----

%-----Problem 2-----

B=rgb2gray(A);

TB=B';

lb=length(B);
HB=B;
HB(1:lb/2,:)=B((lb/2)+1:lb,:);
HB((lb/2)+1:lb,:)=B(1:lb/2,:);

FB=fliplr(B);

figure;
subplot(2,2,1);
imshow(B);
title('B');

subplot(2,2,2);
imshow(TB);
title('TB');

subplot(2,2,3);
imshow(HB);
title('HB');

subplot(2,2,4);
imshow(FB);
title('FB');

pause;

%-----Finish Solving Problem 2-----

%-----Problem 3-----

maxB = max(B(:));
minB = min(B(:));
meanB = mean(B(:));
medianB = median(B(:));

[maxValue, minValue, meanValue, medianValue] = FindInfo(B);

fprintf('maxB = %d \n',maxB);
fprintf('maxValue = %d \n',maxValue);

if maxB == maxValue
    disp('They have the same values');
end

fprintf('minB = %d \n',minB);
fprintf('minValue = %d \n',minValue);

if minB == minValue
    disp('They have the same values');
end

fprintf('meanB = %d \n',meanB);
fprintf('meanValue = %d \n',meanValue);

if meanB == meanValue
    disp('They have the same values');
end

fprintf('medianB = %d \n',medianB);
fprintf('medianValue = %d \n',medianValue);

if medianB == medianValue
    disp('They have the same values');
end

%-----Finish Solving Problem 3-----

%-----Problem 4-----

C=B;
C=double(C);
maxB=double(maxB);
C = C./maxB;

figure;
imshow(C);
title('Normalized Grayscale Image');

pause;

D=C;
D(:,(lb/4)+1:lb/2)= D(:,(lb/4)+1:lb/2).^1.25;
D(:,3*(lb/4)+1:lb)= D(:,3*(lb/4)+1:lb).^0.75;
figure;
imshow(D);
title('Processed Grayscale Image');

imwrite(D,'Agnibh_D.jpg');

pause;

%-----Finish Solving Problem 4-----

%-----Problem 5-----

thold=0.3;

%First method

bw1=C;
bw1(bw1>thold)=1;
bw1(bw1<=thold)=0;

%Second method

bw2=C;
kone=find(bw2>0.3);
bw2(kone)=1;
kzero=find(bw2<=0.3);
bw2(kzero)=0;

%Matlab method

bw3=double(imbinarize(C,0.3));

if bw1==bw2 & bw2==bw3
    disp('Both of my methods worked');
end

figure;

subplot(1,3,1);
imshow(bw1);
title('My first method');

subplot(1,3,2);
imshow(bw2);
title('My second method');

subplot(1,3,3);
imshow(bw3);
title('Matlab method');

pause;

%-----Finish Solving Problem 5-----

%-----Problem 6-----

blurredIm = BlurImage(A);
BA = blurredIm;
blurredIm = BlurImage(B);
BB = blurredIm;

figure;
subplot(2,2,1);
imshow(A);
title('A');

subplot(2,2,2);
imshow(B);
title('B');

subplot(2,2,3);
imshow(BA);
title('BA');

subplot(2,2,4);
imshow(BB);
title('BB');

pause;

%-----Finish Solving Problem 6-----

%-----Problem 7-----

close('all');
clear;


%-----Finish Solving Problem 7-----