format long
% Modelling for Norris data from NIST website
figure1=figure;

load Norris.dat

% import data into two vectors
yNorris=Norris(:,1);
xNorris=Norris(:,2);

% Generating the matrix A for AB=y
aNorris=[ones(size(xNorris)) xNorris];

disp("Beta values for Norris");
bNorris=aNorris\yNorris %coefficient calculator. Generates 2 coefficients because we are using a linear model y(t)=B1*t+B2

maxPoints = linspace(1,1000); % generates 1000 points
lobfNorris = bNorris(1)+bNorris(2)*maxPoints; % gets the line of best fit based on the coefficients calculated above 

subplot(2,2,1)
plot(xNorris,yNorris,'r.',maxPoints,lobfNorris,'-','markersize',10);
title('y vs x with fitted line (Norris)');
xlabel('x');
ylabel('y');
axis([0 1050 0 1050])

% Residual for Norris
residualNorris=yNorris-(bNorris(1)+bNorris(2)*xNorris);

%hold on
subplot(2,2,2)
y2=0;
xLine=linspace(0,1050);

plot(xLine,y2*zeros(size(xLine)),"k--",xNorris,residualNorris,'.','markersize',10)

axis([-10 1050 -3 3])
xlabel('x');
ylabel('r');
title('residual vs x (Norris)');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Modelling for Pontius dataset from the NIST website
load Pontius.dat

yPontius=Pontius(:,1);
xPontius=Pontius(:,2);

aPontius=[ones(size(xPontius)) xPontius xPontius.^2];

disp("Beta values for Pontius");
bPontius=aPontius\yPontius %coefficient calculator
maxPointsCurve=linspace(1.5e5,30e5);

cobfPontius = bPontius(1)+bPontius(2)*maxPointsCurve+bPontius(3)*maxPointsCurve.^2; % gets the curve of best fit based on the coefficients calculated above 

% Plots the curve 
subplot(2,2,3)
plot(xPontius,yPontius,'g.',maxPointsCurve,cobfPontius,'-','markersize',10);
axis([0 3.21e6 0 2.5])
xlabel('x');
ylabel('y');
title('y vs x with fitted curve (Pontius)');

% Residual for Pontius
residualPontius=yPontius-(bPontius(1)+bPontius(2)*xPontius+bPontius(3)*xPontius.^2);

subplot(2,2,4);
xLine2=linspace(1.5e5,30e5);
y22=0;

% Plots the residual error for Pontius dataset.
plot(xLine2,y22*zeros(size(xLine2)),"r--",xPontius,residualPontius,'.','markersize',10);
line([0 3.2e6],[0 0],'color','k');
axis([0 3.2e6 -5e-4 5e-4]);
xlabel('x');
ylabel('y');
title("residual vs x (Pontius)");

set(gcf, 'Position', get(0, 'Screensize'));
saveas(figure1,'graphForQ59.jpg');