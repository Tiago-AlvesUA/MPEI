N = 1e5;
num_faces = 6; 
lancamentos = 2;
p_par = 0.5;

rolls = randi(num_faces,lancamentos,N);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%P(A) - Soma 9

soma9 = 0;
soma = sum(rolls);
for i = 1 : N
    if soma(i) == 9
        soma9 = soma9 + 1;
    end
end
p_a = soma9/N;
disp(p_a);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%P(B) - Segundo ser par

pares = rand(lancamentos,N) > p_par;
valor_par = sum(pares(2,:)); % Soma das probabilidades de segundo valor ser par
p_b = valor_par/N;
disp(p_b);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%P(C) - Pelo menos um dos valores é igual a 5

cinco = 0;
for i = 1 : N
    if(rolls(1,i) == 5 || rolls(2,i) == 5)
        cinco = cinco + 1;
    end
end
p_c = cinco/N;
disp(p_c);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%P(D) - Nenhum dos valores é igual a 1

nao_tem_um = 0;
for i = 1 : N
    if(rolls(1,i) ~= 1 && rolls(2,i) ~= 1)
        nao_tem_um = nao_tem_um + 1;
    end
end
p_d = nao_tem_um/N;
disp(p_d);


