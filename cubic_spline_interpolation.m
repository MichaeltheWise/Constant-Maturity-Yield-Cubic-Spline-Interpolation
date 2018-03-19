%% FRE6411 Final Project
% Created by Michael (Po-Hsuan) Lin
% Last update: 03/16/2018

n = 6;
x = [1 2 3 5 10 20 30];
v = [0.25 0.67 1.1 1.65 2.17 2.47 2.75];
z = zeros(1,n-1);
M = zeros(n-1,n-1);
w = zeros(n+1,0);
a = zeros(1,n);
b = zeros(1,n);
c = zeros(1,n);
d = zeros(1,n);
q = zeros(1,n);
r = zeros(1,n);

for i = 2:n
    z(i-1) = 6*(((v(i+1)-v(i))/(x(i+1)-x(i)))-((v(i)-v(i-1))/(x(i)-x(i-1))));
end

for j = 2:n
    M(j-1,j-1) = 2*(x(j+1)-x(j-1));
end

for k = 2:n-1
    M(k-1,k) = x(k+1) - x(k);
end

for l = 3:n
    M(l-1,l-2) = x(l) - x(l-1);
end

% Call function lu solver
[L,U] = lu_no_pivoting(M);
y = forward_subst(L,transpose(z));
p = backward_subst(U,y);

w(1) = 0;
w(n+1) = 0;
for ii = 2:n
    w(ii) = p(ii-1);
end

for iii = 2:n+1
    c(iii-1) = (w(iii-1)*x(iii)-w(iii)*x(iii-1))/(2*(x(iii)-x(iii-1)));
    d(iii-1) = (w(iii) - w(iii-1))/(6*(x(iii)-x(iii-1)));
end

for iv = 2:n+1
    q(iv-1) = v(iv-1) - c(iv-1)*((x(iv-1))^2) - d(iv-1)*((x(iv-1))^3);
    r(iv-1) = v(iv) - c(iv-1)*((x(iv))^2) - d(iv-1)*((x(iv))^3);
end

for vi = 2:n+1
    a(vi-1) = (q(vi-1)*x(vi) - r(vi-1)*x(vi-1))/(x(vi)-x(vi-1));
    b(vi-1) = (r(vi-1)-q(vi-1))/(x(vi)-x(vi-1));
end

t1 = linspace(1,2,100);
f1 = a(1) + b(1)*t1 + c(1)*(t1.^2) + d(1)*(t1.^3);
t2 = linspace(2,3,100);
f2 = a(2) + b(2)*t2 + c(2)*(t2.^2) + d(2)*(t2.^3);
t3 = linspace(3,5,100);
f3 = a(3) + b(3)*t3 + c(3)*(t3.^2) + d(3)*(t3.^3);
t4 = linspace(5,10,100);
f4 = a(4) + b(4)*t4 + c(4)*(t4.^2) + d(4)*(t4.^3);
t5 = linspace(10,20,100);
f5 = a(5) + b(5)*t5 + c(5)*(t5.^2) + d(5)*(t5.^3);
t6 = linspace(20,30,100);
f6 = a(6) + b(6)*t6 + c(6)*(t6.^2) + d(6)*(t6.^3);
hold on
plot(t1,f1)
plot(t2,f2)
plot(t3,f3)
plot(t4,f4)
plot(t5,f5)
plot(t6,f6)
xlabel('Year')
ylabel('Yield')
title('2014 Yield Curve With Cubic Spline Interpolation')
