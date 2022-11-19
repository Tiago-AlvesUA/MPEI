p = 0.5;
N = 1e5;
n = 5;
filhos = rand(n,N) > p;
umoumais = filhos(1,:)==1; %1ª coluna dos filhos
doisoumais = sum(filhos(2:5,:))>=1; %2-5ª coluna dos filhos
%Abaixo: PROBABILIDADE CONDICIONAL -> P(AB)/P(B)
prob = sum(doisoumais & umoumais)/sum(umoumais);
disp(prob);