m = 15; % média de msgs por seg
% p de 0?
% Lei de Poisson
% pk = (λ^k/k!)e^−λ

%----------Ex.a----------%
k = 0;
p0msg = (m^k/factorial(k))*exp(-m);
fprintf("P(O computador não recebe mensagens) = %f\n",p0msg);

%----------Ex.b----------%
% Para efeitos de calculo sera mais facil calcular a probabilidade
%do complemento (chegar 10 ou menos mensagens ao computador)

pX = zeros(1,11);

for k = 0 : 10
  i = k+1;
  pX(i) = (m^k/factorial(k))*exp(-m);
end

pX10ouMenos = sum(pX);
pXmaisDe10 = 1-pX10ouMenos;

fprintf("P(O computador recebe mais de 10 mensagens) = %f\n",pXmaisDe10);
