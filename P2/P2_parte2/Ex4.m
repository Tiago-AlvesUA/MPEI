%POR SIMULAÇÃO

N = 1e5;
n = 5;
p = 0.3;
experience = rand(n, N) < p;
PecasDefeit = sum(experience);

prob = histc(PecasDefeit, 0:n) / N; % Soma quantidade de vezes 
% que cada número possível de peças defeituosas aparece
stem(0:n, prob, 'r') %Função massa de probabilidade
axis([-0.5 5.5 0 0.4])
ylabel('Probability')
xlabel('Num of faulty pieces in a 5 pieces sample')
title('Probability distribution of Random Variable X');
grid on

%(b)
probT = 0;
for k = 0 : 2
    probT = probT + factorial(5)/(factorial(5-k)*factorial(k))*0.3^k*(1-0.3)^(5-k);
end
fprintf("Probabilidade no max 2 peças defeit: %.3f\n", probT)


