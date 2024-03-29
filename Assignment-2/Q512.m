% Planetary motion.
figure1=figure;
x = [1.02 .95 .87 .77 .67 .56 .44 .30 .16 .01]';
y = [0.39 .32 .27 .22 .18 .15 .13 .12 .13 .15]';

aPlanet=[x.^2 x.*y y.^2 x y]; % Generates a 10 x 5 matrix X that is used to find the coefficients of the quadratic form 
fCol=ones(numel(x)); % Need this because both the x and y are being used to construct the matrix.

disp("Coefficients for the original vectors");
coefficients=aPlanet\fCol;

z = coefficients(1)*x.^2 + coefficients(2)*x.*y + coefficients(3)*y.^2 + coefficients(4)*x + coefficients(5)*y - fCol; % coefficient

% Plot original planets placement
plot(x,y,'b.','markersize',15)

% Code given in the question to generate a contour plot
[X,Y] = meshgrid(linspace(-1.5,1.5,100));
Z=coefficients(1)*X.^2 + coefficients(2)*X.*Y + coefficients(3)*Y.^2 + coefficients(4)*X + coefficients(5)*Y - 1;
hold on;
contour(X,Y,Z,[0 0]);

% deviation in the x and y as asked in the question
xNew=x+0.005*(2*rand(numel(x))-1); % generates random number in the range of x pm 0.05 
yNew=y+0.005*(2*rand(numel(y))-1);

aPlanetNew = [xNew.^2 xNew.*yNew yNew.^2 xNew yNew];

disp("Coefficients for the perturbed vectors");
coefficientsNew=aPlanetNew\fCol

% New planet placement
plot(x,y,'ro','markersize',15);
zNew=coefficientsNew(1)*X.^2 + coefficientsNew(2)*X.*Y + coefficientsNew(3)*Y.^2 + coefficientsNew(4)*X + coefficientsNew(5)*Y - 1;
contour(X,Y,zNew,[0 0]);
axis([-1.5 1.5 -0.5 1.5])
hold off;

set(gcf, 'Position', get(0, 'Screensize'));
saveas(figure1,'graphForQ512.jpg');