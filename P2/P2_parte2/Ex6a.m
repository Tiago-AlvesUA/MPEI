%DISTRIBUIÇÃO BINOMIAL
% px(k) = Pr(X = k) = nCk * p^k * (1-p)^(n-k) =
% = n! / (k! * (n-k)!) * p^k * (1-p)^(n-k)

% p(defeituoso) = 1/1000  

%Amostra de 8000 -> n
%B : "# de chips defeituosas que aparecem numa amostra com 8000 chips"

% Podemos considerar que B apresenta as caracteristicas de uma Distribuicao
% binomial visto que se trata da repeticao da experiencia de Bernoulli onde
% sucesso ocorre quando aparece um chip defeituoso e insucesso quando
% aparece um chip que nao tem defeitos.

n = 8000; % # de amostras
p = 1/1000;
k = 7; % # de chips com defeito

%nCk = factorial(n)/(factorial(k)*factorial(n-k));
nCk = prod(n:-1:n-k+1)/prod(1:k); %?????É igual à de cima mas porque é que não dá com fatorial?
p7defeit = nCk * p^k * (1-p)^(n-k);

disp("Usando a binomial:");
fprintf("P(7 defeituosos em 8000) = %f\n",p7defeit);


