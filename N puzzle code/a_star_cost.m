function [h1,h2] =  a_star_cost(p,q,n)
% % % % Cost estimation....
% Misplaced Tiles 
h1 = sum(sum(~(p == q)));
% Manhattan Distance
h2 = 0;
for i = 1 : n
    for j = 1 : n
        tmp1 = p(i,j);
        [tmp2 , tmp3] = find(q == tmp1);
        h2 = h2 + abs(tmp2 - i) + abs(tmp3 - j);
    end
end

h3 = 0;  % Linear conflict
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

% Out of row or column
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

