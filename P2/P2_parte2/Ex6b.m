% Lei de Poisson
% pk = (λ^k/k!)e^−λ

n = 8000; % # de amostras
p = 1/1000;
k = 7; % # de chips com defeito

m = 8;
gama = n * p; %ou média

p7defeit = (gama.^k/factorial(k))*exp(-gama);