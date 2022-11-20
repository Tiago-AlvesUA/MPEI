% 2 aula Q e S
% Esteve presente anterior: vai nesta 70%
% Não esteve: 80%

%% a  
%    P  NP
T = [0.7 0.8
     0.3 0.2];

x = [1 0]';

x2 = T^2*x;
fprintf('1a) resposta = %f\n', x2(1));

%% b
x = [0 1]';
x2 = T^2*x;
fprintf('1b) resposta = %f\n', x2(1));

%% c
% 15 semanas -> 30 aulas
% Já temos probabilidade primeira aula portanto só faltam 29
x = [1 0]';
x2 = T^29*x;
fprintf('1c) resposta = %f\n', x2(1));

%% d
pfalta = zeros(30,1);
x = [0.85 0.15]';
pfalta(1) = 0.15;
for i=2:30
    x = T*x;
    pfalta(i) = x(2);
end
plot(pfalta)