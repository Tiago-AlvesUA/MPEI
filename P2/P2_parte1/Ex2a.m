m = 100; % alvos
n = 20; % dardos
N = 1e5; % nº experiências

a = randi(m,n,N); %Matriz em que linhas são dardos,
% o valor é o número do alvo(100 é o max), repetido Nx
successes = 0;
for i = 1:N
    if(length(unique(a(:,i))) == 20)
        successes = successes + 1;
    end
    %acima usa-se unique em relação a cada coluna da exp
    %isto permite que números iguais fiquem um só
    %portanto só se forem todos os 20 dardos
    %diferentes é que conta.(nenhum alvo repetido)
end
disp(successes/N);
