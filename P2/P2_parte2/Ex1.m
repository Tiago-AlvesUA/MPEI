xi = 1:6;
p = ones(1,6)/6;

%Funcao massa de probabilidade
stem(xi,p), xlabel('x'), ylabel('px(x)');

%Funcao de distribuicao acumulada
p = cumsum(p);
stairs(xi,p), xlabel('x'), ylabel('FX(x)');