function [xNext,iterator] = Q1C(initialGuess)
% An implementation of the Newton's Method that computes the root for
% f(x)=-cos(x)-x.^3

ig=initialGuess;

format long;

% error checking to see if the initial conditions are satisfied. The
% derivative cannot equal 0.
if (hardCodedFunctionDerivative(ig)==0)
    error("The initial guesses are incorrect: initial guess cannot be 0.");
end

% First iteration is done outside of the loop because xNext needs to be
% calculated before the exist condition is checked. I would've used the do
% while loop but MATLAB does not support such a construct.
iterator=1;
xPrev=ig;
xNext=xPrev-(hardCodedFunction(xPrev)/hardCodedFunctionDerivative(xPrev));
fprintf("%Iteration %f\txPrev = %f\txNext = %f\n",iterator,xPrev,xNext)

% the loop runs for 6 iterations. It checks to see if the differences
% between the two values is less than the magnitude of eps; the loop stops.
while (abs(xPrev-xNext)>eps*abs(xNext))
    iterator=iterator+1; % Keeps track of the number of iterations
    xPrev=xNext;
    xNext=xPrev-(hardCodedFunction(xPrev)/hardCodedFunctionDerivative(xPrev)); % Formula for the Newton's Method
    fprintf("Iteration %d\txPrev = %.16f\txNext = %.16f\trelative difference = %.16f\n",iterator,xPrev,xNext,abs(xPrev-xNext))
end

end

function y=hardCodedFunction(x)
% Evaluates a predefined function at a given point.
% The hardcoded function happened to be y=-cosx-x.^3

y = (-cos(x)-x.^3);

end

function y=hardCodedFunctionDerivative(val)
% Evaluates the derivative of predefined function at a given point.
% The derivative of the function is y=sin(x)-3x.^2

y=(sin(val))-(3*val.^2)

end
