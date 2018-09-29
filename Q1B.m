function [lowerBound, upperBound] = Q1B(a,b)
% Bisection Method for a function

lowerBound=a;
upperBound=b;

%sprintf("Value of lowerbound %f",a)
%sprintf("Value of upperbound %f",b)

if (hardCodedFunction(lowerBound) * hardCodedFunction(upperBound) >0)
    error("The initial guesses are incorrect: lower*upper<0 is the satisfying condition.");
end

end

function y=hardCodedFunction(x)
% The hardcoded function happened to be y=-cosx-x.^3

y = (-cos(x)-x.^3);

end

