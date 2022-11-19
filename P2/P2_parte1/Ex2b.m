m = 100; % alvos
n = 20; % dardos
N = 1e5; % nº experiências

a = randi(m,n,N); 
successes = 0;
for i = 1:N
    if(length(unique(a(:,i))) < 20)
        successes = successes + 1;
    end
end
disp(successes/N);