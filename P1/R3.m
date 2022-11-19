p = 0.5; % prob acertar
numperg = 5; % n
corretas = 5; % k
N = 1e5;

testes = rand(numperg,N) > p;
sucessos = sum(testes)==corretas;
res = sum(sucessos)/N;
disp(res);