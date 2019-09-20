function result = IsInStopMatrix(stopMatrix,location)
[M,N] = size(stopMatrix);
result = 0;
for i = 1 : M
    if stopMatrix(M,:) == location
       result = 1;
       break 
    end
end