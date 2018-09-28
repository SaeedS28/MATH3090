function x = bslashtx2(A,b)

[L,U,p] = lutx(A);
y = forward(L,b(p));
x = backsubs(U,y);


function x = forward(L,x)
[n,n] = size(L);

for i = 1:n
   x(i) = x(i)/L(i,i);
   j = i+1:n;
   
   interm=L(j,i)*x(i);
   x(j) = x(j) - interm;
end

function x = backsubs(U,x)
[n,n] = size(U);

for i = n:-1:1
   x(i) = x(i)/U(i,i);
   j = 1:i-1;
   x(j) = x(j) - U(j,i)*x(i);
end
