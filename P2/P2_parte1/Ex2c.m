m = 1000; % alvos
N = 1e5; % nº experiências
nValues = 1:10;
prob = zeros(1,10);

for n = 1 : length(nValues)
    experience = randi(m,10*n,N); % Colunas têm numero do alvo em que o dardo acerta
    successes = 0;
    for ncol = 1 : N  %Por cada experiência
        if (length(unique(experience(:,ncol))) ~= 10*n)
            successes = successes + 1;
        end
    end
    prob(n) = successes/N;
end

figure
subplot(1,2,1)
plot(nValues*10, prob)
xlabel('n')
ylabel('P(n)')
title('Probabilities for m = 1000')
drawnow


m = 100000;
N = 1e5;
nValues = 1:10;
prob = zeros(1,10);
i = 1;

for n = 1 : length(nValues)
    experience = randi(m,10*n,N); % Colunas têm numero do alvo em que o dardo acerta
    successes = 0;

    for j = 1 : N  %Por cada experiência
        if (length(unique(experience(:,j))) ~= 10*n)
            successes = successes + 1;
        end
    end
    prob(n) = successes/N;
end
subplot(1,2,2)
plot(nValues*10, prob)
xlabel('n')
ylabel('P(n)')
title('Probabilities for m = 100000')