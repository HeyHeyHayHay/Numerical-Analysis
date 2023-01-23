function [sum] = polyval(x,c)

[~,col]=size(c);
%assigns lngth and hight to row and col"

%initializing
xpowr = 1;

sum = c(1);

for i = 2:col
    xpowr = xpowr*x;
    
    sum = sum + c(i)*xpowr;

end



