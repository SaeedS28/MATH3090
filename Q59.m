% Modelling for Norris
load Norris.dat

yNorris=Norris(:,1);
xNorris=Norris(:,2);

aPontius=[ones(size(xNorris)) xNorris];

bPontius=aPontius\yNorris; %coefficient calculator

maxPoints = linspace(1,1000); % generates 1000 points
cobfPontius = bPontius(1)+bPontius(2)*maxPoints; % gets the line of best fit based on the coefficients calculated above 

subplot(2,2,1)
plot(xNorris,yNorris,'r.',maxPoints,cobfPontius,'-','markersize',10);
title('y vs x with fitted line (Norris)');
xlabel('x');
ylabel('y');
axis([0 1050 0 1050])

% Residual for Norris
residualNorris=yNorris-(bPontius(1)+bPontius(2)*xNorris);

hold on
subplot(2,2,2)
y2=0;
xLine=linspace(0,1050);

plot(xLine,y2*zeros(size(xLine)),"k--",xNorris,residualNorris,'.','markersize',10)

axis([-10 1050 -3 3])
xlabel('x')
ylabel('r')
title('residual vs x (Norris)');

% Modelling for Pontius
load Pontius.dat

yPontius=Pontius(:,1);
xPontius=Pontius(:,2);

aPontius=[ones(size(xPontius)) xPontius xPontius.^2];

bPontius=aPontius\yPontius; %coefficient calculator
maxPointsCurve=linspace(1.5e5,30e5);
cobfPontius = bPontius(1)+bPontius(2)*maxPointsCurve+bPontius(3)*maxPointsCurve.^2; % gets the curve of best fit based on the coefficients calculated above 

subplot(2,2,3)
plot(xPontius,yPontius,'g.',maxPointsCurve,cobfPontius,'-','markersize',10);
axis([0 3.21e6 0 2.5])
xlabel('x');
ylabel('y');
title('y vs x with fitted curve (Pontius)');

% Residual for Norris