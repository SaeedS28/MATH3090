%Generate the graph
x=linspace(-2,2,1000);  %generates 1000 points between -2,2
y=-cos(x)-x.^3;

plot(x,y,"r");