p = 0.5;
N = 1e5;
k = 1;
n = 2;
filhos = rand(n,N) > p;
sucessos= sum(filhos)>=k;
probrapaz= sum(sucessos)/N;