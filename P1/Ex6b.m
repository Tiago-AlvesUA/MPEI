N= 1e5;
p = 0.3;
k = 2;
n = 5;
lancamentos = rand(n,N) < p;
sucessos= sum(lancamentos)<=k;
probSimulacao= sum(sucessos)/N;
analy= nchoosek(n,0)*p^0*(1-p)^(n-0); % 0 defeituosas
for i = 1:2
    analy = analy + nchoosek(n,i)*p^i*(1-p)^(n-i); % 1 e 2 defeituosas
end