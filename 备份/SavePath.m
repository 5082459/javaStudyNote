function SavePath(A,outerCell,nextMatrixOnePiont)

[M,N] = size(nextMatrixOnePiont);
% 路径cell
pathCell = {};
% 一条路径、
path = [];

B = nextMatrixOnePiont(M,:);
nowPiont = B;
path = [path;B]

i = 1;
timeOut = 1000;
while(i < 1000)
    
    priorPiont = outerCell{nowPiont(5)}{nowPiont(6)}(nowPiont(7));
    if priorPiont == A
        path = [A;path];
        break
    end
    path = [priorPiont;path];
    nowPiont = priorPiont;
    
    i = i + 1;
end
