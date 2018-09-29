%Generate the graph
x=linspace(-2,2,1000);  %generates 1000 points between -2,2
y=-cos(x)-x.^3;

plot(x,y,"r");

hold on

x2=linspace(-2,2,1000);
y2=0;
plot(x2,y2*ones(size(x2)),"--");

plot(-0.865474,0,"c*"); %Found by putting the value in the fzero function

