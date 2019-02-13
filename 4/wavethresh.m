function [newcH, newcV, newcD] = wavethresh(cH, cV, cD)

[r,c] = size(cH); % Size of each subband
temp = [cH,cV,cD];
sigma = sqrt(median(abs(temp(:)))/0.6745); %3
M = (2*r*2*c)*3/4; % Number of elements in all 3 subbands
t = sigma*sqrt(2*log(M)); %4

% Thresholding

cH(cH>=t)=cH(cH>=t)-t;
cH(cH<=-t)=cH(cH<=-t)+t;
cH(abs(cH)<t)=0;

cV(cV>=t)=cV(cV>=t)-t;
cV(cV<=-t)=cV(cV<=-t)+t;
cV(abs(cV)<t)=0;

cD(cD>=t)=cD(cD>=t)-t;
cD(cD<=-t)=cD(cD<=-t)+t;
cD(abs(cD)<t)=0;

newcH = cH;
newcV = cV;
newcD = cD;

end