% a
%    a   b   c   d   e   f
H = [0   1/2 1/2 0   1/4 0
     1   0   0   0   1/4 0
     0   0   0   1   1/4 0
     0   0   1/2 0   1/4 1
     0   0   0   0   0   0
     0   1/2 0   0   0   0];

beta = 0.85;
A = beta*H + (1-beta)*(1/6*ones(6));

r = [1/6 1/6 1/6 1/6 1/6 1/6]';
for i = 1:9
    r = A*r;
end
fprintf('Página a: %f\nb: %f\nc: %f\nd: %f\ne: %f\nf: %f\n\n',r(1),r(2),r(3),r(4),r(5),r(6))

% b
r0 = [1/6 1/6 1/6 1/6 1/6 1/6]';
eps = 1e-2;
r = r0;
iter = 1;
while 1
    rOld = r;
    r = A^iter*r0;
    if (max(abs(r-rOld)) < eps)
        break;
    end
    iter = iter + 1;
end
fprintf('Iterações necessárias: %d\n',iter)
fprintf('Página a: %f\nb: %f\nc: %f\nd: %f\ne: %f\nf: %f\n',r(1),r(2),r(3),r(4),r(5),r(6))

