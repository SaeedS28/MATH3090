% z = ax.^2+bxy+cy.^2+dx+ey+f

x = [1.02 .95 .87 .77 .67 .56 .44 .30 .16 .01]';
y = [0.39 .32 .27 .22 .18 .15 .13 .12 .13 .15]';

aPlanet=[x.^2 x.*y y.^2 x y]; % quadratic form
fCol=ones(numel(x),1);
b=aPlanet\fCol;

z = b(1)*x.^2 + b(2)*x.*y + b(3)*y.^2 + b(4)*x + b(5)*y - fCol % coefficient generator

% Plot planets placement
plot(x,y,'b.','markersize',15)

[X,Y] = meshgrid(linspace(-1.5,1.5,50));
Z=b(1)*X.^2 + b(2)*X.*Y + b(3)*Y.^2 + b(4)*X + b(5)*Y - 1

hold on;
contour(X,Y,Z,[0 0]);

% deviation in the x and y
xNew=x+0.005*(2*rand(n,1)-1); % generates random number in the range of pm 0.05 
