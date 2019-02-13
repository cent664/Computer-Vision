function [labelIm, num] = FindComponentLabels(im, SE)

[r,c] = size(im);
oldres = zeros(r,c); % to store the previous dilated result
newres = zeros(r,c); % to store the new dilated result
labelIm = zeros(r,c);
k=0;
num=0; % Initial

for j=1:c
    for i=1:r
        oldres(:) = 0;
        newres(:) = 0;
        % Checking if an object exists at that pixel and if we haven't labelled it already
        if (im(i,j)==1 && labelIm(i,j)<1)
            oldres(i,j) = 1;
            k=0;
            while k==0
                newres = imdilate(oldres,SE); % Dilating
                newres = newres&im; % Intersecting
                if newres == oldres % If dilating changed nothing
                    num = num+1; %found a blob
                    labelIm(newres==1) = num; %labelling it
                    k=1; %breaking out of the loop
                else
                    oldres = newres;
                end
            end
        end
    end
end

end