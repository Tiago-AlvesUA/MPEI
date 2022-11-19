T = [0.8 0   0 0.3 0
     0.2 0.6 0 0.2 0
     0   0.3 1 0   0
     0   0.1 0 0.4 0
     0   0   0 0.1 1];

sum(T);

%b)
v = [1 0 0 0 0]'; %Começa estado 1
x = zeros(1,100); %Para guardar probs de estar no estado 2 passado n estados
%x(1) = 0; % É só para confirmar que a primeira é zero obviamente
for i = 2:100
    v = T*v;
    x(i) = v(2);
end
plot(x) %ESTE GRÁFICO VAI DIMINUINDO PORQUE ESTADO 2 NÃO É ABSORVENTE

%c)
%   ESTES GRAFICOS VÃO CRESCER COM N, PORQUE OS ESTADOS 3 E 5 SÃO ABSORVENTES
%E ESTADO 3 VAI TER MAIORES PROBABILIDADES PORQUE É MAIS PROVÁVEL CHEGAR
%AO 3 A PARTIR DO 1 DO QUE AO 5
v = [1 0 0 0 0]';
x = zeros(1,100);
%x(1) = 0; (começa estado 1, logo prob estado 3 é 0)
for i = 2:100
    v = T*v;
    x(i) = v(3);
end
v = [1 0 0 0 0]';
x2 = zeros(1,100);
%x2(1) = 0; (começa estado 1)
for i = 2:100
    v = T*v;
    x2(i) = v(5);
end

figure(2)
subplot(1,2,1)
plot(x)
title('Estado 3')
subplot(1,2,2)
plot(x2)
title('Estado 5')

%d) Matriz canónica, C
%     1   2   4   3   5
C = [0.8  0  0.3  0   0
     0.2 0.6 0.2  0   0
      0  0.1 0.4  0   0
      0  0.3  0   1   0
      0   0  0.1  0   1];

Q = C(1:3, 1:3); %Parte da matriz C sem estados absorventes
%disp(Q);

%e) Matriz Fundamental, F
% F = (I - Q)^-1
F = (eye(3) - Q)^-1;
%disp(F);

%f) Tempo médio até absorção

t = sum(F); %Soma da coluna i de F representa o valor esperado do nº de 
% vezes que a cadeia passa por um qq estado transiente partindo do estado
% inicial i antes da absorção.

%OU t = F'*ones(3,1)

fprintf('Nº médio passos para absorção partindo estado 1 é: %.4f\n',t(1));
fprintf('Nº médio passos para absorção partindo estado 2 é: %.4f\n',t(2));
fprintf('Nº médio passos para absorção partindo estado 4 é: %.4f\n',t(3));

%g) Probabilidade de absorção -> B = R*F
R = C(4:5, 1:3);
B = R*F;
fprintf('Prob(estado3) = %f, Prob(estado 5) = %f',B(1,1),B(2,1));






