function[filteredIm] = AverageFiltering(im, mask)
[r c] = size(mask);
z=0;
temp=0;

if(r~=c)
    disp('The mask is not a square!');
    z=z+1;
end

if(mod(r,2)==0 | mod(c,2)==0)
    disp('The mask dimension must be odd!');
    z=z+1;
end

for i=1:r
    for j=1:c
        if(mask(i,j)<=0)
            temp=temp+1;
        end
    end
end
if (temp~=0)
    disp('The elements of the mask must be positive!');
    z=z+1;
end

if (sum(sum(mask))~=1)
    disp('The sum of the elements of the mask muse be equal to 1!');
    z=z+1;
end

if(mask'~=mask | flip(mask)~=mask)
    disp('The elements of the mask must be symmetric around the center');
    z=z+1;
end

if(z==0) %if mask is valid
    maskord = length(mask);
    padlen = (maskord-1)/2; %finding size of padding
    [r c] = size(im);

    padded = zeros((r+(2*padlen)),(c+(2*padlen)));
    [r c] = size(padded);

    padded((1+padlen):(r-padlen),(1+padlen):(c-padlen)) = im;
    
    temppadded = padded;
    
    for i=(1+padlen):(r-padlen)
        for j=(1+padlen):(c-padlen)
            temppadded(i,j)=sum(sum(padded(i-padlen:i+padlen,j-padlen:j+padlen).*mask));
        end
    end
    
    filteredIm = temppadded((1+padlen):(r-padlen),(1+padlen):(c-padlen));%geting rid of padding
end

end