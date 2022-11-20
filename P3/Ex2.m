%% a
%    A   B     C
T = [1/3 1/4   0
     1/3 11/20 1/2
     1/3 1/5   1/2];

% Matriz T é estocástica se os valores em cada COLUNA somados dão sempre
% resultado 1
disp(sum(T));

%% b
%Grupo A tem 60 alunos, grupo B tem 15 e C tem 15
x = [2/3 1/6 1/6]';

%% c
x2 = T^29*x;
elem = x2.*90;
elem = floor(elem);
fprintf('O grupo A tem %d elem\n Grupo B tem %d\n Grupo C tem %d\n\n',elem);

%% d
x = [1/3 1/3 1/3]';
x2 = T^29*x; 
elem = x2.*90;
elem = floor(elem);
fprintf('O grupo A tem %d elem\n Grupo B tem %d\n Grupo C tem %d\n',elem);