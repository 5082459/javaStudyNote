function data = readDataAndPlot(dataName,range)
data = xlsread(dataName,range);

B = xlsread('����1�����ݼ�1-�ո�.xlsx','A615:D615');
A = xlsread('����1�����ݼ�1-�ո�.xlsx','A3:D3');
x = [A;B];
[N,M] = size(data);
for i = 1:N
    if data(i,5) == 1
%         1��ʾ��ֱ���У����
        scatter3(data(i,1),data(i,2),data(i,3),'.r');
    else
%         0��ʾˮƽ���У����
        scatter3(data(i,1),data(i,2),data(i,3),'.b');
    end
    hold on 
end
hold on
plot3(x(:,1),x(:,2),x(:,3),'k');
title('У��������ͼ');
xlabel('x');
ylabel('y');
zlabel('z');
legend('ˮƽ���У����','ֱ���У����')
