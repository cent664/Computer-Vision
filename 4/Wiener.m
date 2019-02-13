function [restoredIm] = Wiener(blurredIm,k,g)

[r,c] = size(blurredIm);
H = ones(r,c);

blurredImfreq = fftshift(fft2(blurredIm));

for i=1:r
    for j=1:c
        D = sqrt(((i-floor(1+r/2))*(i-floor(1+r/2)))+((j-floor(1+c/2))*(j-floor(1+c/2))));
        Dpow = D^(5/3);
        H(i,j) = exp(-1*k*Dpow);
        t = abs(H(i,j));
        H(i,j) = (t*t/(g+(t*t)))/H(i,j);
    end
end

restoredIm = blurredImfreq.*H;
restoredIm = uint8(real(ifft2(ifftshift(restoredIm))));

end