xi = [5, 50, 100];
p = [0.9, 0.09, 0.01];

%Função massa de probabilidade
stem(xi,p), xlabel('x'), ylabel('px(x)');
axis([0 110 -0.1 1.2]); %Só para se ver melhor

