function result = IsloopEnd(Ci)
[M,~] = size(Ci);
if M == 0
    result = 0;
else
    for i = 1:M
        [a,~] = size(Ci{i})
        if a ~= 0
            result = 1;
            break;
        end
    end
    result = 0;
end

    
