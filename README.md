# Constant-Maturity-Yield-Cubic-Spline-Interpolation
This project is for FRE6411 Fixed Income Securities course. This repository includes a report on how UK and US constructs their constant maturity yield curve, R code that extracts yield curve data and MATLAB code that does a cubic spline interpolation on the data.

The R code is modified from the code given by Professor Jerzy Pawlowski for the R in Finance course. 
The MATLAB code is constructed entirely by me. The process involves taking a LU decomposition without pivoting on a tridiagonal symmetric positive definite matrix, forward substition of the lower triangular matrix and backward substition of the upper triangular matrix. The process calculates the second derivatives first, then proceeds to solve coefficients a,b,c,d through simple substitution. 
