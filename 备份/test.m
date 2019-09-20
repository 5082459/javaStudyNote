% ax+by+cz+d=0
% y=linspace(-4,4,40);
x = -100:0.25:100;
y = x;
[X,Y] = meshgrid(x,y);
Z=1 - X - Y;
mesh(Z,X,Y) 
surf(Z,X,Y)