%DISTRIBUIÇÃO BINOMIAL
% px(k) = Pr(X = k) = nCk * p^k * (1-p)^(n-k) =
% = n! / (k! * (n-k)!) * p^k * (1-p)^(n-k)

%Avião de 2 motores: despenha-se quando ambos os motores falharem:
%(>50% têm que falhar)
n = 2; %numero motores
k = 2; %numero motores que falham
p = logspace(-3, log10(1/2),100);
nCk = factorial(n)/(factorial(k)*factorial(n-k));

p2motores = nCk .* p.^k .* (1-p).^(n-k);

%Avião 4 motores -> despenha se 3 ou 4 motores falharem

n = 4;
p4motores = 0;

k = 3;
nCk = factorial(n)/(factorial(k) * factorial(n-k));
p4motores = p4motores + nCk .* p.^k .* (1-p).^(n-k);

k = 4;
nCk = factorial(n)/(factorial(k) * factorial(n-k));
p4motores = p4motores + nCk .* p.^k .* (1-p).^(n-k);

figure(1);

x = logspace(-3, log10(1/2),100);
plot(x,p4motores);
hold on; % -> mantém os plots existentes para que os novos não apaguem os anteriores.
plot(x,p2motores);

legend("4 motores", "2 motores")
xlabel('p');
ylabel('pX');
title("Variacao de pX em funcao de p");

hold off;
%   Ate os dois graficos se intercetarem (analisando o grafico, a mais ou menos p =  0.33) e 
% mais seguro viajar no aviao com 4 motores. 
%   A partir dai porém, e prerefirvel viajar no aviao com 2 motores

