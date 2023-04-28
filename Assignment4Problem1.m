%Sets double precision
format long e;

%Compute a vector of x-values evenly spaced by 0.001 on [-7,7], including endpoints, for our plots
xspace = linspace(-7,7,14001);

%Compute vector of y-values for the exact function at above x-values
yfunc = abs(cos(xspace));



%Sets n, the desired number of nodes, to 10 and 30 in successive loop iterations
n=10;

%Compute the vector of n evenly-spaced nodes' x-values, including endpoints
xnodeE = linspace(-7,7,n);

%Compute the vector of n Chebyshev nodes' x-values 
index = linspace(1,n,n);
chebyshevPoints = cos( (2*index - 1)*pi / (2*n) );
xnodeC = (7*chebyshevPoints);

%Compute the vector of y-values for the above evenly-spaced nodes
ynodeE = abs(cos(xnodeE));

%Compute the vector of y-values for the above Cheb nodes
ynodeC = abs(cos(xnodeC));

%Compute the evenly-spaced node polynomial's coefficients using Newton's difference
%method (call newtdd() with appropriate inputs; newtdd() is givine below)
coeffE = newtdd(xnodeE, ynodeE, n);
length(coeffE);

%Compute Cheb node polynomial's coefficients using Newton's difference
%method (call newtdd() with appropriate inputs)
coeffC = newtdd(xnodeC, ynodeC, n);

%Compute the vector of y-values for the evenly-spaced node poly at the 0.001-spaced x-values,
%including the endpoints (call nest() with appropriate inputs; nest() is given below)
ypolyE = nest(n-1,coeffE,xspace);

%Compute the vector of y-values for the Cheb node poly at the 0.001-spaced x-values
% (call nest() with appropriate inputs)
ypolyC = nest(n-1,coeffC,xspace);

%Compute the absolute error vector at the 0.001-spaced x-values for the evenly-spaced node poly
abserrE = abs( yfunc - ypolyE );

%Compute the absolute error vector at the 0.001-spaced x-values for the Cheb node poly
abserrC = abs( yfunc - ypolyC );

%Displays the plots of the polynomials and abserr vectors - all on the same 0.001-spaced points
%Fill in only the 2 inputs in each plot function below

%plot the polynomial on evenly-spaced nodes
plot(xspace, ypolyE);
str = [' Polynomial on ',num2str(n),' evenly spaced nodes'];
title(str)
figure;

%plot the abserr vector on evenly-spaced nodes
plot(xspace, abserrE);
str = [' Abserr on ',num2str(n),' evenly spaced nodes'];
title(str)
figure;

%plot the polynomial on Cheb nodes
plot(xspace, ypolyC);
str = [' Polynomial on ',num2str(n),' Chebychev nodes'];
title(str)
figure;

%plot the abserr vector on Cheb nodes
plot(xspace, abserrC);
str = [' Abserr on ',num2str(n),' Chebychev nodes'];
title(str)
figure;

%Compute the maximum of the absolute error on the 0.001-spaced vectors for both evenly-spaced and Cheb poly
emaxE = max(abserrE);
emaxC = max(abserrC);

%plot the exact function on the same 0.001-spaced points
plot(xspace, yfunc)
str = [' Exact function'];
title(str)

%Program 0.1 Nested multiplication
%Evaluates polynomial from nested form using Horner's method
%Input: degree d of polynomial,
%       array of d+1 coefficients (constant term first),
%       x-coordinate x at which to evaluate, and
%       array of d base points b, if needed
%Output: value y of polynomial at x
function y=nest(d,c,x,b)
if nargin<4, b=zeros(d,1); end 
y=c(d+1);
for i=d:-1:1
  y = y.*(x-b(i))+c(i);
end
end

%Program 3.1 Newton Divided Difference Interpolation Method
%Computes coefficients of interpolating polynomial
%Input: x and y are vectors containing the x and y coordinates
%       of the n data points
%Output: coefficients c of interpolating polynomial in nested form
%Use with nest.m to evaluate interpolating polynomial
function c=newtdd(x,y,n)
for j=1:n
  v(j,1)=y(j);        % Fill in y column of Newton triangle
end
for i=2:n             % For column i,
  for j=1:n+1-i       % fill in column from top to bottom
    v(j,i)=(v(j+1,i-1)-v(j,i-1))/(x(j+i-1)-x(j));
  end
end
for i=1:n
  c(i)=v(1,i);        % Read along top of triangle
end                   % for output coefficients
end