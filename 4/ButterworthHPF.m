function [filteredIm,H] = ButterworthHPF(im,order,cutoff)

[r,c] = size(im);
H = ones(r,c);

imfreq = fftshift(fft2(im));

for i=1:r
    for j=1:c
        Dsquare = sqrt(((i-floor(1+r/2))*(i-floor(1+r/2)))+((j-floor(1+c/2))*(j-floor(1+c/2))));
        Deno = Dsquare/(cutoff);
        ButterworthLPF = 1/(1+(Deno^(2*order)));
        H(i,j) = 1-ButterworthLPF;
    end
end

filteredIm=imfreq.*H;
filteredIm=uint8(real(ifft2(ifftshift(filteredIm))));

end