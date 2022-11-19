% PROBABILIDADE CONDICIONAL
% P(A|B) = P(AB) / P(B)
%     
%     P(AB) = 2/9 = 0,222
%     P(B) = 5/9 = 0,555
%     P(A|B) ~ 0,4   

palavras = 3;
N = 1e5;
seq = 2;

a = randi(palavras,seq,N);
successes = 0;
suc2 = 0;
for i = 1 : N
    if((a(1,i) == 1 && a(2,i) == 2) || (a(1,i) == 2 && a(2,i) == 1))
        successes = successes + 1;
    end
    if(a(1,i) == 2 || a(2,i) == 2)
        suc2 = suc2 + 1;
    end
end
p_ab = successes/N;
p_b = suc2/N;
disp(p_ab/p_b);

