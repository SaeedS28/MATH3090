x=[9;2;6];

format rat
% a)
% Generates the householder matrix based on the algorithm given on Section
% 5.4 of the textbook
u=x;
s=norm(x,2);
u(1)=u(1)+s;
p=1/(s*u(1));
Householder=eye(3,3)-p*u*u'

% b)
t=(p*u'*x)/2; % dividing by 2 because we want to reflect the vector, not twice its length. See page 163.
v=x-(t*u)
Householder*v % Hv=v