function [p1, f, g, h] =  Get(p,m,n)
p1=[];
for i = 1:n
    p1(i,1:n) = p(m,(i-1)*n+1:n*i);
end
%{
p1(1,1:3) = p(m,1:3);
p1(2,1:3) = p(m,4:6);
p1(3,1:3) = p(m,7:9);

f = p(m,10);
g = p(m,11);
h = p(m,12);
%}
n2 = n*n;

f = p(m,n2+1);
g = p(m,n2+2);
h = p(m,n2+3);



