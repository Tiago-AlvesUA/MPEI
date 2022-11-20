%% a
%    a   b   c   d   e   f
H = [0   1/2 1/2 0   1/4 0
     1   0   0   0   1/4 0
     0   0   0   1   1/4 0
     0   0   1/2 0   1/4 1
     0   0   0   0   0   0
     0   1/2 0   0   0   0];

A = 0.85*H + 0.15*(1/6*ones(6));

r = [1/6 1/6 1/6 1/6 1/6 1/6]';
for i = 1:100
    r = A*r;
end
fprintf('Página a: %f\nb: %f\nc: %f\nd: %f\ne: %f\nf: %f\n',r(1),r(2),r(3),r(4),r(5),r(6))
% Pág menor pagerank -> e; Maior pagerank -> d

%% b