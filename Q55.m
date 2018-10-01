x=[9;2;6];
u=x;
s=norm(x,2);
u(1)=u(1)+s;
p=1/(s*u(1));

Householder=eye(3,3)-p*u*u'

Householder*[20;2;6]


t=(p*u'*x)/2;
v=x-(t*u)
Householder*v