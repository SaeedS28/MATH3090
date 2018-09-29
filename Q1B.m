function [incrementor, lowerBound, upperBound] = Q1B(a,b)
% Bisection Method for a function

format long;

lowerBound=a;
upperBound=b;

%sprintf("Value of lowerbound %f",a)
%sprintf("Value of upperbound %f",b)

% error checking to see if the initial conditions are satisfied
if (hardCodedFunction(lowerBound) * hardCodedFunction(upperBound) >0)
    error("The initial guesses are incorrect: lower*upper < 0 is the satisfying condition.");
end

midpoint=0;
incrementor=0;
yMid=0;
yLower=0;

while (abs(lowerBound-upperBound)> eps*abs(upperBound))
    midpoint=(lowerBound+upperBound)/2;
    
    yMid=hardCodedFunction(midpoint);
    yLower=hardCodedFunction(lowerBound);
    
    if(yMid>0 & yLower <0) | (yMid<0 & yLower>0)
        upperBound=midpoint;
    else
        lowerBound=midpoint;
    end
    
    incrementor=incrementor +1;
    sprintf("Iteration %f\ta = %f\tm = %f\tb = %f\n",incrementor,lowerBound,midpoint,upperBound)
end
end


function y=hardCodedFunction(x)
% The hardcoded function happened to be y=-cosx-x.^3

y = (-cos(x)-x.^3);

end

