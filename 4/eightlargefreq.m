function [maxeightfreq] = eightlargefreq(freqboy)

maxfourmag = zeros(1,4);
maxeightfreq = zeros(1,8);

temp=1;

magfreqboy = abs(freqboy);
vecmagfreqboy = sort(unique(magfreqboy(:)));
l = length(vecmagfreqboy);
maxfourmag(1) = vecmagfreqboy(l-1);
maxfourmag(2) = vecmagfreqboy(l-2);
maxfourmag(3) = vecmagfreqboy(l-3);
maxfourmag(4) = vecmagfreqboy(l-4);

[r, c] = size(freqboy);

for x=1:r
    for y=1:c
        for z=1:4
          if(magfreqboy(x,y) == maxfourmag(z))
              maxeightfreq(temp) = freqboy(x,y);
              temp = temp+1;
%         if((magfreqboy(a,b) == maxfourmag(1))&&(imag(freqboy(a,b))>0))
%             maxeightfreq(1) = freqboy(a,b);
%         end
%         if((magfreqboy(a,b) == maxfourmag(2))&&(imag(freqboy(a,b))>0))
%             maxeightfreq(2) = freqboy(a,b);
%         end
%         if((magfreqboy(a,b) == maxfourmag(3))&&(imag(freqboy(a,b))>0))
%             maxeightfreq(3) = freqboy(a,b);
%         end
%         if((magfreqboy(a,b) == maxfourmag(4))&&(imag(freqboy(a,b))>0))
%             maxeightfreq(4) = freqboy(a,b);
        end
    end
end

end