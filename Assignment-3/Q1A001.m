%format short
% The differential equation being solved for is 
% y' = 1+y/t , 2 <= t <= 3, y(2) = 1
f = @(t,y) (1+y/t);

% case for when h=0.01

h=0.01;
xVals=2:h:3;
y=zeros(1,numel(xVals));
y(1)=1;

for i=2:length(xVals)
    s1=f(xVals(i-1), y(i-1)); % calculate s1
    s2=f(xVals(i-1)+h/2, y(i-1)+(h/2)*s1); % calculate s2
    s3=f(xVals(i-1)+h/2, y(i-1)+(h/2)*s2); % calculate s3
    s4=f(xVals(i-1)+h, y(i-1)+h*s3); % calculate s4
    y(i)=y(i-1)+(h/6)*(s1+2*s2+2*s3+s4);
end

% calculate the exact solution for the x values
fR = @(t) ((1-2*log(2))/2)*t+(t*log(t));

yReals=zeros(1,numel(xVals));

for i=1:length(xVals)
   yReals(i)=fR(xVals(i));
end

% calculate global error
gError=yReals-y;

for i=1:length(xVals)
    fprintf("x = %d\tyCalc = %d\tyExact = %d\tglobalErro=%d\n",xVals(i),y(i),yReals(i),gError(i))
end

figure1=figure;
plot(xVals, y, '-r*','LineWidth',2)
axis([1.5 3.25 0.5 3.25])
hold on
plot(xVals, yReals, '-.b', 'LineWidth',2)
legend('Approximated Solution', 'Exact Solution','NW')
hold off;
saveas(figure1,'graphForQ1A001.jpg');