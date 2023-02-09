format long e

% define coefficients for the version of f(x) where b < 0
a = 2;
b = -10^7;
c = 3;

%call the function quadroots
%call the outputs, x1n and x2n, in that order.

[x1n,x2n] = quadroots(a,b,c);

%compute backward errors for the root approximations from quadroots

backx1n = abs(((a*x1n)+b)*x1n+c)

backx2n = abs(((a*x2n)+b)*x2n+c)

%compute root approximations directly from the quadratic formula
%call the larger one x1ne, and the smaller x2ne

x1ne = (-b + sqrt((b*b)-(4*a*c)))/(2*a);
x2ne = (-b - sqrt((b*b)-(4*a*c)))/(2*a);

%compute the backward errors for the root estimates from the quadratic formula

backx1ne = abs(((2*x1ne)+10^7)*x1ne+3);

backx2ne = abs(((2*x2ne)+10^7)*x2ne+3);

% define coefficients for the version of f(x) where b > 0
a = 2;
b = 10^7;
c = 3;

%call the function quadroots
%call the outputs, x1p and x2p, in that order.

[x1p,x2p] = quadroots(a,b,c);

%compute backward errors for these root approximations from quadroots

backx1p = abs(((a*x1p)+b)*x1p+c)

backx2p = abs(((a*x1p)+b)*x1p+c)

%compute root approximations directly from the quadratic formula
%call the larger one x1pe, and the smaller x2pe

x1pe = (-b + sqrt((b*b)-(4*a*c)))/(2*a);
x2pe = (-b - sqrt((b*b)-(4*a*c)))/(2*a);

%compute the backward errors for the root esimates from the quadratic formula

backx1pe = abs(((a*x1pe)+b)*x1pe+c);

backx2pe = abs(((a*x2pe)+b)*x2pe+c);

%below, write the function, quadroots, called by the script above
% input: coefficients of ax^2+bx+c 
% output: roots x1, x2 


function [x1,x2] = quadroots(a,b,c)

d = sqrt((b*b)-(4*a*c));

    if b >= 0 
        
        x1 = -(2*c)/(b+d);
        
        x2 = -(b+d)/(2*a);
        
    else
        
        x1 = (-b+d)/(2*a);
        
        x2 = (2*c)/(-b+d);
        
    end
end






