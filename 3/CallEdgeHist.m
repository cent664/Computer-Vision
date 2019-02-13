function edgeHist = CallEdgeHist(A, bin)

[filteredImH filteredImV]= sobel(A);
[r c]=size(A);

filteredIm=zeros(r,c);

for i=1:r
    for j=1:c
        if(filteredImH(i,j)>=0&&filteredImV(i,j)>=0)
            filteredIm(i,j) = atan(filteredImH(i,j)/filteredImV(i,j));
        else if(filteredImH(i,j)<0&&filteredImV(i,j)>=0)
                filteredIm(i,j) = atan(filteredImH(i,j)/filteredImV(i,j))+pi;
            else if(filteredImH(i,j)<0&&filteredImV(i,j)<0)
                filteredIm(i,j) = atan(filteredImH(i,j)/filteredImV(i,j))+pi;
                else if(filteredImH(i,j)>=0&&filteredImV(i,j)<0)
                    filteredIm(i,j) = atan(filteredImH(i,j)/filteredImV(i,j))+(2*pi);
                    end
                end
            end
        end
    end
end

filteredIm = (filteredIm*180)/pi;

edgeHist = zeros(bin,1);

for i=1:r
    for j=1:c
        if isnan(filteredIm(i,j))
        else
            edgeHist(floor((filteredIm(i,j)*(bin-1))/360)+1)=edgeHist(floor((filteredIm(i,j)*(bin-1))/360)+1)+1;
        end
    end
end

edgeHist=edgeHist(1:bin);

end