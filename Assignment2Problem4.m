format long e

%part (a)
%call fzero for first initial guess

[rootest1, fval1] = fzero( 'exp(x-1)-1' , 5 );

%show output
rootest1

fval1

%compute errors
forerr1 = abs(rootest1-1)

backerr1 = abs(fval1)

%call fzero for second initial guess

[rootest2, fval2] = fzero( 'exp(x-1)-1' , 5+(10^-10) );

%show output
rootest2

fval2

%compute errors
forerr2 = abs(rootest2-1)

backerr2 = abs(fval2)

% part (b)
%call fzero for first initial guess

[rootest3, fval3] = fzero( 'exp(4*x-4)-2*exp(3*x-3)+2*exp(x-1)-1' , 5 );

%show output
rootest3

fval3

%compute errors
forerr3 = abs(rootest3-1)

backerr3 = abs(fval3)

%call fzero for second initial guess

[rootest4, fval4] = fzero( 'exp(4*x-4)-2*exp(3*x-3)+2*exp(x-1)-1' , 5+(10^-10) );

%show output
rootest4

fval4

%compute errors
forerr4 = abs(rootest4-1)

backerr4 = abs(fval4)

