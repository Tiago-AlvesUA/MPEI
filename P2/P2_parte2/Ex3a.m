N = 1e6;
lancamentos = 4;

xi = 0:4;
px = 0:4;
a = randi(0:1, lancamentos, N);

coroas = sum(a);

soma0 = 0;
soma1 = 0;
soma2 = 0;
soma3 = 0;
soma4 = 0;
for i = 1 : N
    if (coroas(i) == 0)
        soma0 = soma0 + 1;
    end
    if (coroas(i) == 1)
        soma1 = soma1 + 1;
    end
    if (coroas(i) == 2)
        soma2 = soma2 + 1;
    end
    if (coroas(i) == 3)
        soma3 = soma3 + 1;
    end
    if (coroas(i) == 4)
        soma4 = soma4 + 1;
    end
end
%(a)
px(1) = soma0 / N;
px(2) = soma1 / N;
px(3) = soma2 / N;
px(4) = soma3 / N;
px(5) = soma4 / N;

px;   %Funcao massa da probabilidade

stem(xi,px),xlabel('xi'),ylabel('px')

%(b)
% VALOR ESPERADO -> E[X]
valor_esperado = xi * px'; % ' ISTO É A MATRIZ TRANSPOSTA
% Esta é precisa para poder cumprir as regras da multiplicação de matrizes
% Uma fica em linhas e outra em colunas
fprintf("Valor esperado: %2.4f\n", valor_esperado);
% VARIANCIA
variancia = xi.^2 * px' - valor_esperado.^2;
fprintf("Variancia: %2.4f\n", variancia);
% DESVIO PADRÃO
desvio_padrao = sqrt(variancia);
fprintf("Desvio padrão: %2.4f\n",desvio_padrao);


%(d)
px_teorico(1) = (exp(-2) * 2^0) / factorial(0); % 0 coroas
px_teorico(2) = (exp(-2) * 2^1) / factorial(1); % 1 coroa...
px_teorico(3) = (exp(-2) * 2^2) / factorial(2);
px_teorico(4) = (exp(-2) * 2^3) / factorial(3);
px_teorico(5) = (exp(-2) * 2^4) / factorial(4);

disp(px_teorico)

%(e)
%E[X] = (0+1+2+3+4)/5 = 2
%Variância = 1/5(0^2+1^2+2^2+3^2+4^2) - 2^2 = 1

%(f)
i = px_teorico(3) + px_teorico(4) + px_teorico(5);
fprintf("Pelo menos 2 coroas: %2.4f\n",i);
ii = px_teorico(1) + px_teorico(2);
fprintf("Até uma coroa: %2.4f\n",ii);
iii = px_teorico(2)+px_teorico(3)+px_teorico(4);
fprintf("Entre 1 e 3 coroas: %2.4f\n",iii);






