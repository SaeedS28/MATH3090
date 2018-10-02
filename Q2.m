
% The algorithm for the Steepest Descent Method was implemented by looking
% at the pseudocode given in the 10th edition of the Numerical Analysis textbook
% by Burden and Faires (page 669)

 % Starting point
x=[1 1];
f1='3*x(1).^2-x(2).^2';
f2='3*x(1)*x(2).^2-x(1).^3-1';

% First evaluation
f=[eval(f1) eval(f2)]; % evaluates to [2 1]
gFirst=f*f';
difference=0;
a=0;

% The main part of the algorithm
for counter=1:300
    %disp(counter);
    JacobianMatrix=[6*x(1) -2*x(2); 
                    3*x(2).^2-3*x(1).^2 6*x(1)*x(2)];

    
    % Finding Dg(x)
    Dg=2*JacobianMatrix*f';
    zNaught=norm(Dg);
    
    if zNaught==0
       disp("Found a minimum");
       break;
    end
    
    %find the unit vector
    z=Dg/zNaught;
    
    xCopy=x;
    aThird=1;
    x=x-aThird*z';    
    f=[eval(f1) eval(f2)];
    gThird=f*f';
    
    % Finding the alphas of the quadratic equation 
    while gThird>gFirst
      aThird=aThird/2;
      x=xCopy-aThird*z';
      f=[eval(f1) eval(f2)];
      gThird=f*f';
    end
    
    aSecond=aThird/2;
    x=xCopy-aSecond*z';
    fPrevious=f;
    f=[eval(f1) eval(f2)];
    
    % Newton's Forward Divided Differences method gets the alphas
    gSecond=f*f';
    hFirst=(gSecond-gFirst)/aSecond;
    hSecond=(gThird-gSecond)/(aThird-aSecond);
    hThird=(hSecond-hFirst)/aThird;
    
    aZero=0.5*(aSecond-hFirst/hThird);
    
    x=xCopy-aZero*z';
    f=[eval(f1) eval(f2)];
    
    gZero=f*f';
    s=f;
    
    if gZero<gThird
       a=aZero;
       difference=gZero;
       f=s;
    else
        a=aThird;
        difference=gThird;
        f=fPrevious;
    end
    x=xCopy-a*z';
    fprintf('counter= %d, x = %f  %f, Difference = %f\n',counter, x(1),x(2),difference);
    if abs(difference)<1e-2
        break;
    end
    gFirst=difference;

end