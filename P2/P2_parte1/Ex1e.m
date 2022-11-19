p = 0.5;
N = 1e5;
n = 5;
filhos = rand(n,N) > p;
umoumais = filhos(1,:)==1;
doisrapaz = sum(filhos(2:5,:))==1;
% 2 acontecimentos
%Abaixo: PROBABILIDADE CONDICIONAL -> P(AB)/P(B)
prob = sum(doisrapaz & umoumais)/sum(umoumais);
disp(prob);

%prob = sum(doisrapaz & umoumais)/sum(umoumais);