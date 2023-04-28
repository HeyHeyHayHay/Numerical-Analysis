%this variable just tests your function, gaussfun
testgauss = gaussfun(47);

%call the function, trapfun, here, per the instructions; call the output int1

int1 = trapfun(10000,70,100,@gaussfun);

%use int1 to find the number of students expected to pass; round
%this no. to 2 sig. digits, and set to variable, passnum, here

passnum = round(int1);





%call the function, simpfun, here, per the instructions; set output to int2

int2 = simpfun(100,70,100,@gaussfun);



%complete the function, trapfun, below
function int = trapfun(m,a,b,func)

    % step size
    h = (b-a)./m;
    %x points and y values
    x = linspace(a,b,m+1);
    y = func(x);
    % calculate integral
    int = (h/2)*( y(1) + y(m+1) + sum(y(2:m)) );

end



%complete the function, simpfun, below
function int = simpfun(m,a,b,func)

    % step size
    h = (b-a)./m;
    %x points and y values
    x = linspace(a,b,m+1);
    y = func(x);
    % calculate integral
    int = (h/3)*( y(1) + y(m+1) + y(2) + y(m) + sum(y(3:m-1)) );

end



%complete the function, gaussfun, below
function y = gaussfun(x)
    
      y = (10./(sqrt(2).*pi)).*exp(-((x-60).^2)./200);

end