p = 0.5;
N = 1e5;
n = 2;
rapaz = rand(n,N) > p;
umrapaz = rapaz(1,:)==1; %NÃO É PRECISO A SUM PORQUE É SÓ UMA LINHA
doisrapaz = sum(rapaz)==2; %AQUI JÁ É PRECISO PQ É DAS LINHAS 2-5
% 2 acontecimentos
prob = sum(doisrapaz)/sum(umrapaz);
disp(prob);