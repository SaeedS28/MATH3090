% Modelling for Norris
load Norris.dat

yNorris=Norris(:,1);
xNorris=Norris(:,2);

aNorris=[ones(size(xNorris)) xNorris];

bNorris=aNorris\yNorris; %coefficient calculator

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

hold on
subplot(2,2,2)
y2=0;
xLine=linspace(0,1050);

plot(xLine,y2*zeros(size(xLine)),"k--",xNorris,residualNorris,'.','markersize',10)

axis([-10 1050 -3 3])
xlabel('x')
ylabel('r')
title('residual vs x (Norris)');

