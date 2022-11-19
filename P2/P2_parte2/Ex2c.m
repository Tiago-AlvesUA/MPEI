xi = [5,50,100];
p = [0.9,0.09,0.01];

%Função distribuição acumulada
p = cumsum(p);
stairs(xi,p), xlabel('x'), ylabel('px(x)');
axis([0 110 0.8 1.2]);