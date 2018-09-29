function [lowerBound, upperBound] = Q1B(a,b)
% Bisection Method for y=-cosx-x.^3

lowerBound=a;
upperBound=b;

%sprintf("Value of lowerbound %f",a)
%sprintf("Value of upperbound %f",b)



end

function y=hardCodedFunction(x)

y = (-cos(x)-x.^3);

end

