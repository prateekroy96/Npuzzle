function [val] = search(a,b,n)
tmp = b(1,:);
tmp1 = length(tmp );
%val = find((a(:,1) == tmp(1,1)) & (a(:,2) == tmp(1,2)) & (a(:,3) == tmp(1,3)) ...
%    & (a(:,4) == tmp(1,4)) & (a(:,5) == tmp(1,5)) & (a(:,6) == tmp(1,6)) ...
%    & (a(:,7) == tmp(1,7)) & (a(:,8) == tmp(1,8)) & (a(:,9) == tmp(1,9)));
p = a(:,1) == tmp(1,1);
n2 = n*n;
for i = 1:n2
    p = p & (a(:,i) == tmp(1,i));
end
val = find(p);
    
    
    
