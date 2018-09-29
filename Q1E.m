function [g1,g2] = Q1E(x1,x2)
% Secant Method for a function

ig1=x1;
ig2=x2;
format long;

% error checking to see if the initial conditions are satisfied
if (hardCodedFunction(ig1)-hardCodedFunction(ig2)==0)
    error("The initial guesses are incorrect: Subtraction of the function at these values cannot be zero.");
end

iterator=1;
xPrevPrev=ig2
xPrev=ig1;
xNext=xPrev-hardCodedFunction(xPrev)*((xPrev-xPrevPrev)/(hardCodedFunction(xPrev)-hardCodedFunction(xPrevPrev)));
sprintf("Iteration %f\txPrevPrev = %f\txPrev = %f\txNext = %f\n",iterator,xPrevPrev,xPrev,xNext)

while (abs(xPrev-xNext)>eps*abs(xNext))
    
    
    iterator=iterator+1;
    sprintf("Iteration %f\txPrevPrev = %f\txPrev = %f\txNext = %f\n",iterator,xPrevPrev,xPrev,xNext)
end
end

function y=hardCodedFunction(x)
% The hardcoded function happened to be y=-cosx-x.^3

y = (-cos(x)-x.^3);

end