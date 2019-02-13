function [blurredIm,H] = Noisy(im,k)

[r,c] = size(im);
H = ones(r,c);

imfreq = fftshift(fft2(im));

for i=1:r
    for j=1:c
        D = sqrt(((i-floor(1+r/2))*(i-floor(1+r/2)))+((j-floor(1+c/2))*(j-floor(1+c/2))));
        Dpow = D^(5/3);
        H(i,j) = exp(-1*k*Dpow);
    end
end

blurredIm=imfreq.*H;
blurredIm=uint8(real(ifft2(ifftshift(blurredIm))));

end