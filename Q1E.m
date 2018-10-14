function [xNext,iterator] = Q1E(x1,x2)
% An implementation of the Secant Method that calculates the root of a
% function.

ig1=x1;
ig2=x2;
format long;

% error checking to see if the initial conditions are satisfied. The
% difference of the function evaluated at the 2 initial points cannot be 0
% because the denominator will be 0
if (hardCodedFunction(ig1)-hardCodedFunction(ig2)==0)
    error("The initial guesses are incorrect: Subtraction of the function at these values cannot be zero.");
end

% Similar to the Newton Method, this method requires one iteration to
% be calculated because we need the value of xNext. Hence, the first
% iteration must be calculated outside the loop
iterator=1;
xPrevPrev=ig2;
xPrev=ig1;
xNext=xPrev-hardCodedFunction(xPrev)*((xPrev-xPrevPrev)/(hardCodedFunction(xPrev)-hardCodedFunction(xPrevPrev)));
sprintf("Iteration %f\txPrevPrev = %f\txPrev = %f\txNext = %f\n",iterator,xPrevPrev,xPrev,xNext)

% Runs until the magnitude of the difference of the two consecutive
% x values is greater than the magnitude value of eps.
while (abs(xNext-xPrev)>eps*abs(xNext))
    iterator=iterator+1;
    xPrevPrev=xPrev;
    xPrev=xNext;
    xNext=xPrev-hardCodedFunction(xPrev)*((xPrev-xPrevPrev)/(hardCodedFunction(xPrev)-hardCodedFunction(xPrevPrev))); % formula for calculating the next x value
    
    fprintf("Iteration %d\txPrevPrev = %.16f\txPrev = %.16f\txNext = %.16f\trelative difference = %.16f\n",iterator,xPrevPrev,xPrev,xNext,abs(xNext-xPrev))
end
end

function y=hardCodedFunction(x)
% The hardcoded function happened to be y=-cosx-x.^3

y = (-cos(x)-x.^3);

end