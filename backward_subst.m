%% Backward substitution used in cubic_spline_interpolation.m
function x = backward_subst(U,b)
n = size(U,2);
x=zeros(n,1);
for j = n:-1:1
    x(j) = b(j)/U(j,j);
    b(1:j-1) = b(1:j-1) - U(1:j-1,j) * (x(j));
end