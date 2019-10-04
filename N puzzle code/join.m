function [pl] =  join(pl,p,f,g,h,n)
[tmp,tmp1] = size(pl);
for i = 1:n
    pl(tmp+1,(i-1)*n+1:n*i) = p(i,:);
end

n2 = n*n;

pl(tmp+1,n2+1) = f;
pl(tmp+1,n2+2) = g;
pl(tmp+1,n2+3) = h;

%{
pl(tmp+1,1:3) = p(1,:);
pl(tmp+1,4:6) = p(2,:);
pl(tmp+1,7:9) = p(3,:);
pl(tmp+1,10) = f;
pl(tmp+1,11) = g;
pl(tmp+1,12) = h;
%}

 