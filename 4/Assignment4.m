%Agnibh Dasgupta - A02292865 Assignment 4

%-----Problem 1.1-----

im=imread('Sample.jpg');

[filteredIm,H] = GaussianLPF(im,75,25);

figure;

subplot(1,3,1);
imshow(im);
title('Original Image');

subplot(1,3,2);
imshow(H);
title('Gaussian LPF');

subplot(1,3,3);
imshow(filteredIm);
title('Filtered Image');

pause;

%-----Finish Solving Problem 1.1-----

%-----Problem 1.2-----

[filteredIm,H] = ButterworthHPF(im,2,40);

figure;

subplot(1,3,1);
imshow(im);
title('Original Image');

subplot(1,3,2);
imshow(H);
title('Butterworth HPF');

subplot(1,3,3);
imshow(filteredIm);
title('Filtered Image');

pause;

%-----Finish Solving Problem 1.2-----

%-----Problem 2.1-----

im=imread('City.jpg');

[blurredIm,H] = Noisy(im,0.0025);
imwrite(blurredIm,'BlurCity.bmp');

figure;

subplot(1,2,1);
imshow(H);
title('Turbulent Filter');

subplot(1,2,2);
imshow(blurredIm);
title('Turbulent Image');

pause;

%-----Finish Solving Problem 2.1-----

%-----Problem 2.2-----

blurredIm = imread('BlurCity.bmp');

[restoredIm] = Wiener(blurredIm,0.0025,0.0005);

figure;

imshow(restoredIm);
title('Restored Image');

pause;
%-----Finish Solving Problem 2.2-----

%-----Problem 3.1-----

Sample = imread('Sample.jpg');
Capitol = imread('Capitol.jpg');
freqSample = fftshift(fft2(Sample));
freqCapitol = fftshift(fft2(Capitol));

%Magnitude and Phase
magSample = abs(freqSample);
magCapitol = abs(freqCapitol);
phaseSample = angle(freqSample);
phaseCapitol = angle(freqCapitol);

%Scaling
[scaledmagSample, ~] = Scaling(log(magSample),[0,255]);
[scaledphaseSample, ~] = Scaling(phaseSample,[0,255]);
[scaledmagCapitol, ~] = Scaling(log(magCapitol),[0,255]);
[scaledphaseCapitol, ~] = Scaling(phaseCapitol,[0,255]);

figure;

scaledmagSample=uint8(scaledmagSample);
subplot(2,2,1);
imshow(scaledmagSample);
title('Magnitude of Sample');

scaledphaseSample=uint8(scaledphaseSample);
subplot(2,2,2);
imshow(scaledphaseSample);
title('Phase of Sample');

scaledmagCapitol=uint8(scaledmagCapitol);
subplot(2,2,3);
imshow(scaledmagCapitol);
title('Magnitude of Capitol');

scaledphaseCapitol=uint8(scaledphaseCapitol);
subplot(2,2,4);
imshow(scaledphaseCapitol);
title('Phase of Capitol');

pause;

%-----Finish Solving Problem 3.1-----

%-----Problem 3.2-----

freqnewSample = magCapitol.*exp(i*phaseSample);
freqnewCapitol = magSample.*exp(i*phaseCapitol);

newSample = uint8(real(ifft2(ifftshift(freqnewSample))));
newCapitol = uint8(real(ifft2(ifftshift(freqnewCapitol))));

figure;

subplot(1,2,1);
imshow(newSample);
title('New Sample');

subplot(1,2,2);
imshow(newCapitol);
title('New Capitol');

pause;

%-----Finish Solving Problem 3.2-----

%-----Problem 4-----

boy = imread('boy_noisy.gif');
freqboy = fftshift(fft2(boy));

[maxeightfreq] = eightlargefreq(freqboy); %Calling function to find the 8 frequencies corresponding to the 4 large magnitudes

[newfreqboy] = Neighbour(freqboy, maxeightfreq); %Calling function to average the replace the frequencies

newboy = uint8(real(ifft2(ifftshift(newfreqboy))));

figure;

subplot(1,2,1);
imshow(boy);
title('Noisy Boy');

subplot(1,2,2);
imshow(newboy);
title('Quiet Boy');

pause;

%-----Finish Solving Problem 4-----

%-----Problem 5.1-----

im = imread('Lena.jpg');
l = length(im);
n = wmaxlev(l,'db2');
[C,S] = wavedec2(im,n,'db2');
newim = waverec2(C,S,'db2');
newim = uint8(newim);

if (im == newim)
    fprintf('Problem 5.1 - The images are the same.');
else
    fprintf('Problem 5.1 - The images are different.');
end

%-----Finish Solving Problem 5.1-----

%-----Problem 5.2-----

dwtmode('per');
x = floor(n/2);

[cA1,cH1,cV1,cD1] = dwt2(im,'db2');
[cA2,cH2,cV2,cD2] = dwt2(cA1,'db2');
[cA3,cH3,cV3,cD3] = dwt2(cA2,'db2');

%a)

[r,c] = size(cA3);
newcA3 = cA3;

for i=1:2:r
    for j=1:2:c
        av = sum(sum(cA3(i:i+1,j:j+1)))/4;
        newcA3(i:i+1,j:j+1) = av;
    end
end

newcA2 = idwt2(newcA3,cH3,cV3,cD3,'db2');
newcA1 = idwt2(newcA2,cH2,cV2,cD2,'db2');
newIma = idwt2(newcA1,cH1,cV1,cD1,'db2');
newIma = uint8(newIma);

%b)

newcV1 = cV1;
newcV1(:) = 0;

cA2 = idwt2(cA3,cH3,cV3,cD3,'db2');
cA1 = idwt2(cA2,cH2,cV2,cD2,'db2');
newImb = idwt2(cA1,cH1,newcV1,cD1,'db2');
newImb = uint8(newImb);

%c)

newcH2 = cH2;
newcH2(:) = 0;
        
cA2 = idwt2(cA3,cH3,cV3,cD3,'db2');
newcA1 = idwt2(cA2,newcH2,cV2,cD2,'db2');
newImc = idwt2(newcA1,cH1,cV1,cD1,'db2');
newImc = uint8(newImc);

figure;
imshow(newIma);
title('Image A');
pause;

figure;
imshow(newImb);
title('Image B');
pause;

figure;
imshow(newImc);
title('Image C');
pause;

%-----Finish Solving Problem 5.2-----

%-----Problem 6-----

noisyIm = imnoise(im,'gaussian'); %1
[cA1,cH1,cV1,cD1] = dwt2(noisyIm,'db2');
[cA2,cH2,cV2,cD2] = dwt2(cA1,'db2');
[cA3,cH3,cV3,cD3] = dwt2(cA2,'db2'); %2

[newcH1, newcV1, newcD1] = wavethresh(cH1, cV1, cD1);%5
[newcH2, newcV2, newcD2] = wavethresh(cH2, cV2, cD2);%6
[newcH3, newcV3, newcD3] = wavethresh(cH3, cV3, cD3);%7

newcA2 = idwt2(cA3,newcH3,newcV3,newcD3,'db2');
newcA1 = idwt2(newcA2,newcH2,newcV2,newcD2,'db2');
newIm = idwt2(newcA1,newcH1,newcV1,newcD1,'db2');

newIm = uint8(newIm);

figure;

subplot(1,2,1);
imshow(noisyIm);
title('Noisy Lena');

subplot(1,2,2);
imshow(newIm);
title('Quiet Lena');

pause;

%-----Finish Solving Problem 6-----
clear;
close('all');