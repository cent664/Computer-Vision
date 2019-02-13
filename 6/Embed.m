function newH = Embed(b,H,Beta)

[r,c] = size(H);
newH = zeros(r,c);
k=1;

for i=1:r
    for j=1:c
        if (b(k)==1 && (mod(H(i,j),Beta) >= (0.25*Beta)))
            newH(i,j) = H(i,j) - mod(H(i,j),Beta) + (0.75*Beta);
        end
        if (b(k)==1 && (mod(H(i,j),Beta) < (0.25*Beta)))
            newH(i,j) = (H(i,j) -(0.25*Beta)) - mod(H(i,j)-(0.25*Beta),Beta) + (0.75*Beta);
        end
        if (b(k)==0 && (mod(H(i,j),Beta) <= (0.75*Beta)))
            newH(i,j) = H(i,j) - mod(H(i,j),Beta) + (0.25*Beta);
        end
        if (b(k)==0 && (mod(H(i,j),Beta) > (0.75*Beta)))
            newH(i,j) = (H(i,j) +(0.5*Beta)) - mod(H(i,j)-(0.5*Beta),Beta) + (0.25*Beta);
        end
        k=k+1;
    end
end

end