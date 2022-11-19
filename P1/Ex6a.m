p = 0.3; % prob defeito
n = 5; % nºpeças
k = 3; % nºpeças defeituosas
N = 1e5;
analy=Analitico(p,n,k);
sem=Simulacao(p,n,k,N);
fprintf("Simulacao: %0.4f\n",sem);
fprintf("Analitico: %0.4f\n",analy);