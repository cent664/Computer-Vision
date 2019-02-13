%Agnibh Dasgupta - A02292865 Assignment 6

clear;

%-----Problem 1.1-----

im = imread('ball.bmp');
im = rgb2hsv(im);
im_h = im(:,:,1);
imbin = imbinarize(im_h,0.1); %thresholding to find orange

SE = strel('sphere',3);

figure; %Intermediate Steps

subplot(1,3,1);
imshow(im_h);
title('Hue channel');

imbin = 1-imbin;

subplot(1,3,2);
imshow(imbin);
title('Binarized Orange Ball');

%Making it pretty

imbin = imerode(imbin,SE);
imbin = imclose(imbin,SE);
imbin = imdilate(imbin,SE);
imbin = imdilate(imbin,SE);
imbin = imdilate(imbin,SE);
imbin = imdilate(imbin,SE);

subplot(1,3,3);
imshow(imbin);
title('After Morphological operations');

pause;

center = regionprops(imbin,'centroid'); %Centroid
x = center.Centroid;
r = x(1);
c = x(2);

figure;

im = hsv2rgb(im);
imshow(im);
title('Centroid');
hold on;

plot(r,c,'kx'); %marking it

pause;

%-----Finish Solving Problem 1.1-----

%-----Problem 1.2-----

im = imread('ball.bmp');
im = rgb2hsv(im);
im_v = im(:,:,3);
imbin = imbinarize(im_v,0.4);

figure; %Intermediate Steps

subplot(2,2,1);
imshow(im_v);
title('Value channel');

imbin = 1-imbin;

subplot(2,2,2);
imshow(imbin);
title('Binarized Shadow');

%Making it pretty

imbin = imerode(imbin,SE);
imbin = imclose(imbin,SE);
imbin = imdilate(imbin,SE);
imbin = imdilate(imbin,SE);

subplot(2,2,3);
imshow(imbin);
title('After Morphological operations');

clearborderIm = imclearborder(imbin);

subplot(2,2,4);
imshow(clearborderIm);
title('After clearing the border');

pause;

clearborderIm = logical(clearborderIm);

im_s = im(:,:,2);
im_s(clearborderIm)=1;
im(:,:,2)=im_s;

im_h(clearborderIm)=1;
im(:,:,1)=im_h;

im = hsv2rgb(im);

figure;

imshow(im);
title('Final result - Red Shadow');

pause;

%-----Finish Solving Problem 1.2-----

%-----Problem 2.1 and 2.2-----

im = imread('ball.bmp');

ele1 = imread('Elephant1.jpg');
ele2 = imread('Elephant2.jpg');
horse1 = imread('Horse1.jpg');
horse2 = imread('Horse2.jpg');

% finding HSV histograms of the pictures

[hist1] = CalNormalizedHSVHist(ele1, 4, 4, 4);
[hist2] = CalNormalizedHSVHist(ele2, 4, 4, 4);
[hist3] = CalNormalizedHSVHist(horse1, 4, 4, 4);
[hist4] = CalNormalizedHSVHist(horse2, 4, 4, 4);

figure;

subplot(2,2,1);
bar(hist1);
title('Elephant1');

subplot(2,2,2);
bar(hist2);
title('Elephant2');

subplot(2,2,3);
bar(hist3);
title('Horse1');

subplot(2,2,4);
bar(hist4);
title('Horse2');

pause;

[r1,c1] = size(ele1);
[r2,c2] = size(ele2);
[r3,c3] = size(horse1);
[r4,c4] = size(horse2);

%ele1 vs all

score1 = 0;
score2 = 0;
score3 = 0;
score4 = 0;

for i=1:64
    score1 = score1 + min(hist1(i)*r1*c1,hist1(i)*r1*c1)/min(r1*c1,r1*c1);
    score2 = score2 + min(hist1(i)*r1*c1,hist2(i)*r2*c2)/min(r1*c1,r2*c2);
    score3 = score3 + min(hist1(i)*r1*c1,hist3(i)*r3*c3)/min(r1*c1,r3*c3);
    score4 = score4 + min(hist1(i)*r1*c1,hist4(i)*r4*c4)/min(r1*c1,r4*c4);
end

rank = [score1,score2,score3,score4];
rank = sort(rank);

figure;

subplot(2,2,1);
imshow(ele1);
title(['Rank 1, Score = ',num2str(rank(4))]);

subplot(2,2,2);
imshow(horse2);
title(['Rank 2, Score = ',num2str(rank(3))]);

subplot(2,2,3);
imshow(horse1);
title(['Rank 3, Score = ',num2str(rank(2))]);

subplot(2,2,4);
imshow(ele2);
title(['Rank 4, Score = ',num2str(rank(1))]);

pause;

%ele2 vs all

score1 = 0;
score2 = 0;
score3 = 0;
score4 = 0;

for i=1:64
    score1 = score1 + min(hist2(i)*r2*c2,hist1(i)*r1*c1)/min(r2*c2,r1*c1);
    score2 = score2 + min(hist2(i)*r2*c2,hist2(i)*r2*c2)/min(r2*c2,r2*c2);
    score3 = score3 + min(hist2(i)*r2*c2,hist3(i)*r3*c3)/min(r2*c2,r3*c3);
    score4 = score4 + min(hist2(i)*r2*c2,hist4(i)*r4*c4)/min(r2*c2,r4*c4);
end

rank = [score1,score2,score3,score4];
rank = sort(rank);

figure;

subplot(2,2,1);
imshow(ele2);
title(['Rank 1, Score = ',num2str(rank(4))]);

subplot(2,2,2);
imshow(horse2);
title(['Rank 2, Score = ',num2str(rank(3))]);

subplot(2,2,3);
imshow(ele1);
title(['Rank 3, Score = ',num2str(rank(2))]);

subplot(2,2,4);
imshow(horse1);
title(['Rank 4, Score = ',num2str(rank(1))]);

pause;

%horse1 vs all

score1 = 0;
score2 = 0;
score3 = 0;
score4 = 0;

for i=1:64
    score1 = score1 + min(hist3(i)*r3*c3,hist1(i)*r1*c1)/min(r3*c3,r1*c1);
    score2 = score2 + min(hist3(i)*r3*c3,hist2(i)*r2*c2)/min(r3*c3,r2*c2);
    score3 = score3 + min(hist3(i)*r3*c3,hist3(i)*r3*c3)/min(r3*c3,r3*c3);
    score4 = score4 + min(hist3(i)*r3*c3,hist4(i)*r4*c4)/min(r3*c3,r4*c4);
end

rank = [score1,score2,score3,score4];
rank = sort(rank);

figure;

subplot(2,2,1);
imshow(horse1);
title(['Rank 1, Score = ',num2str(rank(4))]);

subplot(2,2,2);
imshow(horse2);
title(['Rank 2, Score = ',num2str(rank(3))]);

subplot(2,2,3);
imshow(ele1);
title(['Rank 3, Score = ',num2str(rank(2))]);

subplot(2,2,4);
imshow(ele2);
title(['Rank 4, Score = ',num2str(rank(1))]);

pause;

%horse2 vs all

score1 = 0;
score2 = 0;
score3 = 0;
score4 = 0;

for i=1:64
    score1 = score1 + min(hist4(i)*r4*c4,hist1(i)*r1*c1)/min(r4*c4,r1*c1);
    score2 = score2 + min(hist4(i)*r4*c4,hist2(i)*r2*c2)/min(r4*c4,r2*c2);
    score3 = score3 + min(hist4(i)*r4*c4,hist3(i)*r3*c3)/min(r4*c4,r3*c3);
    score4 = score4 + min(hist4(i)*r4*c4,hist4(i)*r4*c4)/min(r4*c4,r4*c4);
end

rank = [score1,score2,score3,score4];
rank = sort(rank);

figure;

subplot(2,2,1);
imshow(horse2);
title(['Rank 1, Score = ',num2str(rank(4))]);

subplot(2,2,2);
imshow(ele2);
title(['Rank 2, Score = ',num2str(rank(3))]);

subplot(2,2,3);
imshow(horse1);
title(['Rank 3, Score = ',num2str(rank(2))]);

subplot(2,2,4);
imshow(ele1);
title(['Rank 4, Score = ',num2str(rank(1))]);

pause;

%-----Finish Solving Problem 2.1 and 2.2-----

%-----Problem 3.1-----

dwtmode('per');
im = imread('Lena.jpg');

[cA1,cH1,cV1,cD1] = dwt2(im,'db9');
[cA2,cH2,cV2,cD2] = dwt2(cA1,'db9');
[cA3,cH3,cV3,cD3] = dwt2(cA2,'db9');

[r,c] = size(cA3);

rng(1); %fixing seed value
b = randi([0, 1], [1, r*c]);

Beta = 30;
new30cA3 = Embed(b,cA3,Beta); %Embedding for beta = 30

newcA2 = idwt2(new30cA3,cH3,cV3,cD3,'db9');
newcA1 = idwt2(newcA2,cH2,cV2,cD2,'db9');
newIm30 = idwt2(newcA1,cH1,cV1,cD1,'db9');
newIm30 = uint8(newIm30);

figure;

subplot(1,3,1);
imshow(im);
title('Original Image');

subplot(1,3,2);
imshow(newIm30);
title('Watermarked Image (Beta = 30)');

diff30 = im-newIm30;
[scaledIm, ~] = Scaling(diff30, [0,255]);

scaledIm = uint8(scaledIm);
subplot(1,3,3);
imshow(scaledIm);
title('Differnce Image (Beta = 30)');

pause;

Beta = 90;
new90cA3 = Embed(b,cA3,Beta); %Embedding for Beta = 90

newcA2 = idwt2(new90cA3,cH3,cV3,cD3,'db9');
newcA1 = idwt2(newcA2,cH2,cV2,cD2,'db9');
newIm90 = idwt2(newcA1,cH1,cV1,cD1,'db9');
newIm90 = uint8(newIm90);

figure;

subplot(1,3,1);
imshow(im);
title('Original Image');

subplot(1,3,2);
imshow(newIm90);
title('Watermarked Image (Beta = 90)');

diff90 = im-newIm90;
[scaledIm, ~] = Scaling(diff90, [0,255]);

scaledIm = uint8(scaledIm);
subplot(1,3,3);
imshow(scaledIm);
title('Differnce Image (Beta = 90)');

pause;

%-----Finish Solving Problem 3.1-----

%-----Problem 3.2-----

[cA1,~,~,~] = dwt2(newIm30,'db9');
[cA2,~,~,~] = dwt2(cA1,'db9');
[cA3,~,~,~] = dwt2(cA2,'db9');

bprime1 = Extract(cA3,30);

[cA1,~,~,~] = dwt2(newIm90,'db9');
[cA2,~,~,~] = dwt2(cA1,'db9');
[cA3,~,~,~] = dwt2(cA2,'db9');

bprime2 = Extract(cA3,90); %Extracting b for 30 and 90

count1 = 0;
count2 = 0;

for i=1:r*c
    if b(i)==bprime1(i)
        count1 = count1+1;
    end
    if b(i)==bprime2(i)
        count2 = count2+1;
    end
end

match1 = count1*100/(r*c);
match2 = count2*100/(r*c);

fprintf('Perc. match for Beta(30) = %d \n',match1);
fprintf('Perc. match for Beta(90) = %d \n',match2);

%-----Finish Solving Problem 3.2-----

clear;
close('all');