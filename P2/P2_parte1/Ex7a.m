N = 1e5;
pA = 0.01;
pB = 0.05;
pC = 0.001;

erroA = rand(20,N) < pA;
erroB = rand(30,N) < pB;
erroC = rand(50,N) < pC;

total = [erroA; erroB; erroC];

countA = 0;
countB = 0;
countC = 0;
erros = 0;

for j = 1 : N
    prog = randi(100);
    if total(prog,j) == true 
        % Para contar os erros
        erros = erros + 1;
        if prog > 50
            countC = countC + 1;
        elseif prog > 20
            countB = countB + 1;
        else
            countA = countA + 1;
        end
    end
end

probA = countA / erros;
probB = countB / erros;
probC = countC / erros;

disp(probA)
disp(probB)
disp(probC)



