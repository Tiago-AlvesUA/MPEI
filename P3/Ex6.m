%% a 
%    1   2   3   4   5   
T = [0.8 0   0   0.3 0
     0.2 0.6 0   0.2 0
     0   0.3 1   0   0
     0   0.1 0   0.4 0
     0   0   0   0.1 1];

%% b
x = [1 0 0 0 0]'; %Começa estado 1
y = zeros(1,100);
%y(1) = 0;
for i = 2:100
    x = T*x;
    y(i) = x(2); %Prob ao fim de n passos estar estado 2
end
figure(1);
plot(y);
title('Estado 2');

%% c
%   Estados 3 e 5 são absorventes
%   Logo, ao contrário do gráfico do estado 2, a probabilidade de estar
% nestes estados aumenta com o número de passos

x = [1 0 0 0 0]'; %Começa estado 1
y1 = zeros(1,100);
%y(1) = 0;
for i = 2:100
    x = T*x;
    y1(i) = x(3); %Prob ao fim de n passos estar estado 3
end
x = [1 0 0 0 0]'; %Começa estado 1
y2 = zeros(1,100);
for i = 2:100
    x = T*x;
    y2(i) = x(5); %Prob ao fim de n passos estar estado 5
end

figure(2);
subplot(1,2,1);
plot(y1);
title('Estado 3');
subplot(1,2,2)
plot(y2);
title('Estado 5');

%% d
% Matriz canónica, C
%    1   2   4   3   5 
C = [0.8 0   0.3 0   0
     0.2 0.6 0.2 0   0
     0   0.1 0.4 0   0
     0   0.3 0   1   0
     0   0   0.1 0   1];

Q = C(1:3, 1:3);

%% e
% Matriz fundamental, F
% F = (I - Q)^-1
F = (eye(3) - Q)^-1;

%% f
%   O tempo médio até à absorção será a soma do
% número médio de visitas a todos os estados transientes
% até à absorção
%   Ou seja a soma da coluna i de F
t = sum(F);

% OU
% x1 = [1 0 0]'; % (Partindo estado 1)
% t(1) = sum(F*x1);
% x2 = [0 1 0]';
% t(2) = sum(F*x2);
% x3 = [0 0 1]';
% t(3) = sum(F*x3);

fprintf('Nº médio passos para absorção partindo estado 1 é: %.4f\n',t(1));
fprintf('Nº médio passos para absorção partindo estado 2 é: %.4f\n',t(2));
fprintf('Nº médio passos para absorção partindo estado 4 é: %.4f\n',t(3));

%% g
% Probabilidade de absorção, B
R = C(4:5, 1:3);
B = R*F;
fprintf('Prob(estado3) = %f, Prob(estado 5) = %f\n',B(1,1),B(2,1));
