function [newfreqboy] = Neighbour(freqboy, maxeightfreq)

newfreqboy = freqboy;
[r, c] = size(freqboy);

for x=1:r
    for y=1:c
        for z=1:8
            if(freqboy(x,y) == maxeightfreq(z))
                newfreqboy(x,y) = (sum(sum(freqboy(x-1:x+1,y-1:y+1)))-freqboy(x,y))/8;
            end
        end
    end
end

end