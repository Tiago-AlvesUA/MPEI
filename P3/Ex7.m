%a)
%    A  B   C  D  E   F
H = [0  0   0  0  1/3 0 
     1  0   0  0  1/3 0
     0  1/2 0  1  0   0
     0  0   1  0  0   0
     0  1/2 0  0  0   0
     0  0   0  0  1/3 0];

r = [1/6 1/6 1/6 1/6 1/6 1/6]';

for i=1:10
    r = H*r;
end
disp(r)
% páginas com maior page rank são C e D

%b) Spider trap: Grupos de páginas que têm links de saída mas
%   apenas para esse grupo, impedindo a ida para
%   outras páginas

%   Dead-end: Becos sem saída

% No exc a spider trap acontece com as páginas C e D
% e a dead-end é a página F

%c)                   F
H = [0  0   0  0  1/3 1/6 
     1  0   0  0  1/3 1/6
     0  1/2 0  1  0   1/6
     0  0   1  0  0   1/6
     0  1/2 0  0  0   1/6
     0  0   0  0  1/3 1/6];

r = [1/6 1/6 1/6 1/6 1/6 1/6]';

for i=1:10
    r = H*r;
end
disp(r)

%d)
A = 0.8*H + 0.2*(1/6*ones(6));
r = [1/6 1/6 1/6 1/6 1/6 1/6]';
for i=1:10
    r = A*r;
end
disp(r)

%e)
r = [1/6 1/6 1/6 1/6 1/6 1/6]';
for i=1:20
    r = A*r;
end
disp(r)

