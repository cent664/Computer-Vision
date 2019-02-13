function bprime = Extract(H,Beta)

[r,c] = size(H);
bprime = zeros(1,r*c);
k=1;

for i=1:r
    for j=1:c
        if(mod(H(i,j),Beta) > Beta/2)
            bprime(k)=1;
        end 
        k = k+1;
    end
end

end