function[filteredImH filteredImV] = sobel(im)

mask=[-1 -0 1; -2 0 2; -1 0 1]; %Horizontal mask

[r c] = size(im);

padded = zeros(r+2,c+2); %padded image
[r c] = size(padded);
padded(2:r-1,2:c-1) = im;

temppadded = padded;
    
for i=2:(r-1)
    for j=2:(c-1)
        temppadded(i,j)=sum(sum(padded(i-1:i+1,j-1:j+1).*mask)); %convolution
    end
 end
    
filteredImH = temppadded(2:r-1,2:c-1);

mask=mask'; %Vertical mask

[r c] = size(im);

padded = zeros(r+2,c+2); %padded image
[r c] = size(padded);
padded(2:r-1,2:c-1) = im;

temppadded = padded;
    
for i=2:(r-1)
    for j=2:(c-1)
        temppadded(i,j)=sum(sum(padded(i-1:i+1,j-1:j+1).*mask)); %convolution
    end
 end
    
filteredImV = temppadded(2:r-1,2:c-1);

end