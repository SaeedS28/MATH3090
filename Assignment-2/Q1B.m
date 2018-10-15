function [incrementor, lowerBound, upperBound] = Q1B(a,b)
% Bisection Method to calculate the root of f(x)=-cos(x)-x.^3. Returns the
% number of iterations and the interval (lowerBound and upperBound) where
% the root lies.

format long;

% stores the initial guesses
lowerBound=a;
upperBound=b;

%sprintf("Value of lowerbound %f",a)
%sprintf("Value of upperbound %f",b)

% error checking to see if the initial conditions are satisfied.
% Bisection Method only works when f(a)*f(b) < 0
if (hardCodedFunction(lowerBound) * hardCodedFunction(upperBound)>0)
    error("The initial guesses are incorrect: lower*upper < 0 is the satisfying condition.");
end

midpoint=0;
incrementor=0;
yMid=0;
yLower=0;
yUpper=0;

% the loop only runs until the relative difference between the intervak is
% greater than the magnitude of eps. This ensures that the algorithm
% terminates as expected.
while (abs(lowerBound-upperBound)> eps)
    midpoint=(lowerBound+upperBound)/2;
    incrementor=incrementor + 1;
    yMid=hardCodedFunction(midpoint);
    yUpper=hardCodedFunction(upperBound);
    
    % Changes the interval based on the signs of the values calculated
    % above
    if sign(yMid) == sign(yUpper)
       upperBound = midpoint;
    else
        lowerBound = midpoint;
    end
    fprintf("Iteration %f\tlower = %.16f\tmid = %.16f\tupper = %.16f\trelative difference = %.16f\n",incrementor,lowerBound,midpoint,upperBound, abs(lowerBound-upperBound))% Prints out data for testing purpose
    
end
end


function y=hardCodedFunction(x)
% The hardcoded function happened to be y=-cosx-x.^3. Evaluates the
% functions at the passed x values.

y = (-cos(x)-x.^3);

end

