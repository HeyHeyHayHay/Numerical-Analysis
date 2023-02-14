%change Bisection to False Position

format long e

%chosen error tolerance (TOL)
TOL = .000001;

%choose max number of iterations
MAXIT = 50;

%provide initial bracket; for checking initial bracket beloww%%%%%%%%%%%%%%%
a0 = 1
b0 = 2

%transfer to a and b for the algorithm below
a = a0;
b = b0;

%keep track of number of iterations
count = 0;

%record iterates - a col vector of MAXIT length
cits = zeros(MAXIT,1);

%evaluate abs value of func just as a check below%%%%%%%%%%%%%%%
absfa = abs(ffalpos(a));
absfb = abs(ffalpos(b));

%transfer to fa and fb for the algorithm
fa = ffalpos(a);
fb = ffalpos(b);

%stop if not appropriate interval
if sign(fa)*sign(fb) >= 0

    return

end

%stop loop when error less than TOL or MAXIT reached%%%%%%%%%%%%%%%
while abs(b-a)/2 >= TOL & count < MAXIT

    %get midpoint(root estimate)%%%%%%%%%%%%%%%
    c = b - (fb*(b-a))/(fb-fa);

    %eval. func at midpoint
    fc = ffalpos(c);

    %stop if f(c)=0
    if fc == 0
        break
    end

    %update count
    count = count + 1;

    %add to list of iterates
    cits(count) = c;

    %if sign change between a and c make c the new right endpt
    if sign(fa)*sign(fc)<0

        b = c;
        fb = fc;

    %if sign chg betw c and b make c the new left endpt
    else

        a = c;
        fa = fc;

    end

end

%get final midpoint(root estimate)%%%%%%%%%%%%%%%
    c = (a+b)/2;

%add to vector of iterates
    cits(count) = c;

%update count
    count = count + 1;

%display error estimate%%%%%%%%%%%%%%%
error = abs(b-a)

%display vector of iterates
cits

%display number of iterates
count

%Place function below
%Write your function as a polynomial in powers of (x-2)
%Make sure the coefficient of the highest power of (x-2) is 1


function [y] = ffalpos(x)

y = 9*(x-2)^2 + (x-2)^4 - 9 ;

end
