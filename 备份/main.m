
dataName = '附件1：数据集1-终稿.xlsx';
range = 'B4:E614';
% 读入数据
data = readDataAndPlot(dataName,range);

% 获取AB两点
B = xlsread('附件1：数据集1-终稿.xlsx','B615:D615');
A = xlsread('附件1：数据集1-终稿.xlsx','B3:D3');

A = [A,0];
B = [B,0];
%将A B添加到集合中
data = [A;data];
data = [data;B];

% 计算距离矩阵
distanceMatrix = DistanceMatrix(data);



% 筛选一定点数
pointInCylinder = GetPointInCylinder(data);

% 拓展为7列
pointInCylinder = [pointInCylinder,[0,0,0]];

A = pointInCylinder(1,:);

% 输入：圆筒内的点 insidePoints 向量
% 输出：最短路径cell shortestCell 一个矩阵为一个解

i = 1;
% 第一层
eval('C',num2str(i)) = {A};

% 定义外层cell 用于封装每一层的cell
outerCell = {};
% 定义停止搜索矩阵的 位置集合（矩阵）
stopMatrix = [];

while( IsloopEnd(eval('C',num2str(i))) == 0 ) % 循环是否结束

    % 计算元包大小，即第i层的集合个数 ,eval('C',num2str(i))就是Ci
    [cellSize,~] = size(eval('C',num2str(i)));
    
    % C i + 1 = {} 声明下一层元包
    eval('C',num2str(i + 1),' = {}');

    % 遍历元包
    for j = 1 : cellSize
        % 获得元包内第j个点矩阵,eval('C',num2str(i),'{j}')为Ci(j)
        insideVertix = eval('C',num2str(i),'{j}');
        
        % 判断是否为停止搜索矩阵
        if IsInStopMatrix(stopMatrix,[i,j]) == 1
            continue;
        end

        % 计算第j个矩阵里面点的个数
        [insideVertixSize , ~] = size(insideVertix);

        % 遍历元包内第j个点矩阵
        for k = 1 : insideVertixSize
            %清空变量
            nextMatrixOnePiont = [];
            % 获取第j个矩阵的第k个点
            eachPoint = insideVertix(k,:);
            % 获取每一个元素的领域点集合,注意总点集合要包括B点,stopMatrixFlag == 1
            % 则为B停止矩阵，B保存在最后一个位置,stopMatrixFlag == 2 为空停止矩阵
            [nextMatrixOnePiont,stopMatrixFlag] = GetNextMatrixOnePiont(eachPoint,pointInCylinder);

            % B停止矩阵：保存并输出路线,添加集合位置到stopMatrix
            if stopMatrixFlag == 1
                SavePath(A ,outerCell,nextMatrixOnePiont);
                stopMatrix = [stopMatrix;[i,j]];
            % 空停止矩阵 添加集合位置到stopMatrix
            elseif stopMatrixFlag == 2
                stopMatrix = [stopMatrix;[i,j]];
            end
            
            % 将获取到的集合存入第C i+1 层
            eval('C',num2str(i + 1),' = {;nextMatrixOnePiont}');
            
        end

    end
    i = i + 1;

    % 将每层cell装入outerCell 横向量cell
    outerCell = {outerCell,eval('C',num2str(i))};
    
end
