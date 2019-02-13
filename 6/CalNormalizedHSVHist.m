function hist = CalNormalizedHSVHist(im, hBinNum, sBinNum, vBinNum)

[r,c,~] = size(im);
im = rgb2hsv(im);
lenhist = hBinNum*sBinNum*vBinNum;
hist = zeros(1,lenhist);

im_h = im(:,:,1);
im_s = im(:,:,2);
im_v = im(:,:,3);

%Matrices to hold the binned values (0,1,2,3)

h = zeros(r,c);
s = zeros(r,c);
v = zeros(r,c);

% Binning

for i=1:r
    for j=1:c
        if im_h(i,j) == 1
            h(i,j) = hBinNum-1;
        else
            h(i,j) = floor(((im_h(i,j)/1)*hBinNum));
        end
        if im_s(i,j) == 1
            s(i,j) = sBinNum-1;
        else
            s(i,j) = floor(((im_s(i,j)/1)*sBinNum));
        end
        if im_v(i,j) == 1
            v(i,j) = vBinNum-1;
        else
            v(i,j) = floor(((im_v(i,j)/1)*vBinNum));
        end
    end
end

h=h(:)';
s=s(:)';
v=v(:)';

binh = zeros(1,hBinNum);
bins = zeros(1,sBinNum);
binv = zeros(1,vBinNum);

for i=1:hBinNum
    binh(i)=i-1;
end

for j=1:sBinNum
    bins(j)=j-1;
end

for k=1:vBinNum
    binv(k)=k-1;
end

count=1;

for i=1:hBinNum
    for j=1:sBinNum
        for k=1:vBinNum
            for l=1:r*c
                %checking for h1s1v1, h1s1v2 etc...
                if (h(l) == binh(i) && s(l)==bins(j) && v(l)==binv(k))
                    hist(1,count) = hist(1,count)+1;
                end
            end
            count=count+1;
        end
    end
end

hist = hist/(r*c); %Normalizing

end