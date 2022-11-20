%% a
%    A   B   C   D   E   F
H = [0   0   0   0   1/3 0
     1   0   0   0   1/3 0
     0   1/2 0   1   0   0
     0   0   1   0   0   0
     0   1/2 0   0   0   0
     0   0   0   0   1/3 0];

r = [1/6 1/6 1/6 1/6 1/6 1/6]';

for i=1:10
    r = H*r;
end
fprintf('a)\n');
disp(r);

%% b
%   Spider trap: Grupos de páginas que têm links de saída mas
% apenas para esse grupo, impedindo a ida para
% outras páginas

%   Dead-end: Becos sem saída

%   No exc a spider trap acontece nas páginas C e D
% e a dead-end é a página F

%% c
%    A   B   C   D   E   F
H = [0   0   0   0   1/3 1/6
     1   0   0   0   1/3 1/6
     0   1/2 0   1   0   1/6
     0   0   1   0   0   1/6
     0   1/2 0   0   0   1/6
     0   0   0   0   1/3 1/6];

r = [1/6 1/6 1/6 1/6 1/6 1/6]';

for i=1:10
    r = H*r;
end
fprintf('c)\n');
disp(r);

%% d
A = 0.8*H + 0.2*(1/6*ones(6));
r = [1/6 1/6 1/6 1/6 1/6 1/6]';
for i = 1:10
    r = A*r;
end
fprintf('d)\n');
disp(r);

%% e
r = [1/6 1/6 1/6 1/6 1/6 1/6]';
for i=1:20
    r = A*r;
end
fprintf('e)\n');
disp(r)
