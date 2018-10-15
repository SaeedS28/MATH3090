% Generate the graph for Question 1A. 
% plots the graph f(x)=-cos(x)-x.^3 and the line f(x)=0 and displays the
% zero.

figure1=figure;

x=linspace(-2,2,1000);  % generates 1000 points between -2,2
y=-cos(x)-x.^3; % 

plot(x,y,"r");

hold on;

x2=linspace(-2,2,1000); % Generates 1000 points between -2 and 2
y2=0;
plot(x2,y2*ones(size(x2)),"--");

plot(-0.865474,0,"b.","markersize",15); %Found by putting the value in the fzero function

saveas(figure1,'graphForQ1A.jpg'); % Outputs the graph in an external .jpg file