function distanceMatrix = DistanceMatrix(data)
% [m,n] = [611,5]
[m,n] = size(data);
distanceMatrix = zeros(m,m);
for i = 1:m 
    for j = 1:m
        distanceMatrix(i,j) = sqrt((data(i,2) - data(j,2))^2 + (data(i,3) - data(j,3))^2 + (data(i,4) - data(j,4))^2);
    end
end

