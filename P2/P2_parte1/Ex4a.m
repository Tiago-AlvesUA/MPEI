m = 365; % dias do ano
N = 1e5; % nº experiências
p = 0.5;

%n por determinar

for pessoas = 2 : 366 % com 366 pessoas garante-se 2 pessoas com msm data nasc.
    a = randi(365,pessoas,N);
    successes = 0;
    for i = 1:N
        if(length(unique(a(:, i))) < pessoas)
            successes = successes + 1;
        end
    end
    prob = successes/N;
    if (prob > p)
        disp(pessoas);
        break
    end
end



