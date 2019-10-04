%{
p = [1 2 3; 8 5 0; 4 7 6];
q = [1 2 3; 4 5 6; 7 8 0];

%%a=sum(sum(~(p ==q)));
h3 = sum((p == q ));
sum([1 2;3 4]);
find([1 0 2 0 0 4]);
~[1 0 2 0 0 4];
sum([1; 2; 3]);
a = 5;
h3 = 0;

for i = 1:3
    for j = 1:3
        if sum(p(i,j) == q(i,:))
            for k = j+1:3
                if sum(p(i,k) == q(i,:))
                    [m1,n1] = find(p(i,j) == q(i,:));
                    [m2,n2] = find(p(i,k) == q(i,:));
                    if (j - k)*(n1 - n2) < 0
                        h3 = h3 + 2;
                    end
                end
            end
        end
    end
end
for i = 1:3
    for j = 1:3
        if sum(p(j,i) == q(:,i))
            for k = j+1:3
                if sum(p(k,i) == q(:,i))
                    [m1,n1] = find(p(j,i) == q(:,i));
                    [m2,n2] = find(p(k,i) == q(:,i));
                    if (j - k)*(m1 - m2) < 0
                        h3 = h3 + 2;
                    end
                end
            end
        end
    end
end
p = [8 6 3; 2 1 4; 5 0 7];
q = [1 2 3; 4 5 6; 7 8 0];
h4 = 0;
for i = 1:3
    for j = 1:3
        if ~sum(p(i,j) == q(i,:))
            h4 = h4+1;
        end
    end
end

for i = 1:3
    for j = 1:3
        if ~sum(p(i,j) == q(:,j))
            h4 = h4+1;
        end
    end
end



p = [8 6 3; 2 1 4; 5 0 7];
q = [1 2 3; 4 5 6; 7 8 0];
k = 0;
a = 0;
while k < 15
    k = k+1;
    [tmp1,tmp2] = find(a == p);
    tmp3 = q(tmp1,tmp2);
    [tmp4,tmp5] = find(tmp3 == p);
    r = p;
    r(tmp1,tmp2) = tmp3;
    r(tmp4,tmp5) = a;
    disp(r);
    if r == p
        break;
    end
    p = r;
end

%}
a = [1 3 3 4];
b = [1 2 1 2];
c = 2;
d = 3;

e = (b == c)
%e = find(a == d)
f = (a == d)
e&f
find(e&f)
min(
%}
%%
p = [1 2 3; 8 5 0; 4 7 6];
q = [1 2 3; 4 5 6; 7 8 0];

a = sum(sum(~(p ==q)));
b = [];
[c,d] = size(b)
