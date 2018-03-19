%% LU decomposition without pivoting used in cubic_spline_interpolation.m
function [L,U] = lu_no_pivoting(A)
n = size(A,2);
L = zeros(n,n);
U = zeros(n,n);
for i = 1:(n-1)
    for k = i:n
        U(i,k) = A(i,k);
        L(k,i) = A(k,i)/U(i,i);
    end
    for j = (i+1):n
        for k = (i+1):n
            A(j,k) = A(j,k) - L(j,i)*U(i,k);
        end
    end
end
L(n,n) = 1;
U(n,n) = A(n,n);
    