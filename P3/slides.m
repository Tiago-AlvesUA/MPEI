% Page Rank
% slide 27
p = [1/4 1/4 1/4 1/4]';

H = [0 1/2 1 0
     1/3 0 0 1/2
     1/3 0 0 1/2
     1/3 1/2 0 0];

% r^(k+1) = H*r^k
for i = 1:2  % 2 iterações
    p = H*p;
end
disp(p)

% slide 46
% **Solução para spider traps**
% Random Teleports (beta = 0.8)

H = [1/2 1/2 0
     1/2 0   0
     0   1/2 1];
PagQualquer = 1/3*ones(3);
res = 0.8*H + 0.2*PagQualquer;
disp(res);

