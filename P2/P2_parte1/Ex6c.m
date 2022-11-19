palavras = 3;
N = 1e5;
seq = 2;

a = randi(palavras,seq,N);
successes = 0;
for i = 1 : N
    if(a(1,i) == 1 || a(1,i) == 2 || a(2,i) == 1 || a(2,i) == 2)
        successes = successes + 1;
    end
end
prob = successes/N;
disp(prob);

% P = 8/9 = 0,888