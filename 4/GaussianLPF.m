function [filteredIm,H] = GaussianLPF(im,cutoffU,cutoffV)

[r,c] = size(im);
H = ones(r,c);

imfreq = fftshift(fft2(im));

for i=1:r
    for j=1:c
        Dsquare1 = ((i-floor(1+r/2))*(i-floor(1+r/2)))/(-2*cutoffU*cutoffU);
        Dsquare2 = ((j-floor(1+c/2))*(j-floor(1+c/2)))/(-2*cutoffV*cutoffV);
        H(i,j) = exp(Dsquare1+Dsquare2);
    end
end

filteredIm=imfreq.*H;
filteredIm=uint8(real(ifft2(ifftshift(filteredIm))));

end