function data = readDataAndPlot(dataName,range)
data = xlsread(dataName,range);

B = xlsread('附件1：数据集1-终稿.xlsx','A615:D615');
A = xlsread('附件1：数据集1-终稿.xlsx','A3:D3');
x = [A;B];
[N,M] = size(data);
for i = 1:N
    if data(i,5) == 1
%         1表示垂直误差校正点
        scatter3(data(i,1),data(i,2),data(i,3),'.r');
    else
%         0表示水平误差校正点
        scatter3(data(i,1),data(i,2),data(i,3),'.b');
    end
    hold on 
end
hold on
plot3(x(:,1),x(:,2),x(:,3),'k');
title('校正点坐标图');
xlabel('x');
ylabel('y');
zlabel('z');
legend('水平误差校正点','直误差校正点')
