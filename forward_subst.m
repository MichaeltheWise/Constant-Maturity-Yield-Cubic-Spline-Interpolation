%% Forward substitution used in cubic_spline_interpolation.m
function x = forward_subst(L,b)
n = size(L,2);
x = zeros(n,1);
x(1,1) = b(1,1) / L(1,1);
for j = 2:n
    sum = 0;
    for k = 1:(j-1)
        sum = sum + L(j,k)*(x(k,1));
    end
    x(j,1) = (b(j,1) - sum) / L(j,j);
end