function [xNext,iterator] = Q1C(initialGuess)
% Newton's Method for a function

ig=initialGuess;

format long;

% error checking to see if the initial conditions are satisfied
if (ig==0)
    error("The initial guesses are incorrect: initial guess cannot be 0.");
end

iterator=1;
xPrev=ig;
xNext=xPrev-(hardCodedFunction(xPrev)/hardCodedFunctionDerivative(xPrev));
sprintf("Iteration %f\txPrev = %f\txNext = %f\n",iterator,xPrev,xNext)

while (abs(xPrev-xNext)>eps*abs(xNext))
    xPrev=xNext;
    xNext=xPrev-(hardCodedFunction(xPrev)/hardCodedFunctionDerivative(xPrev));
    
    iterator=iterator+1;
    sprintf("Iteration %f\txPrev = %f\txNext = %f\n",iterator,xPrev,xNext)
end

end

function y=hardCodedFunction(x)
% The hardcoded function happened to be y=-cosx-x.^3

y = (-cos(x)-x.^3);

end

function y=hardCodedFunctionDerivative(val)
% The derivative of the function is y=sin(x)-3x.^2

y=(sin(val))-(3*val.^2)

end
