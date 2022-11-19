% 1 - ir à aula
% 2 - nao ir à aula

% presente  não esteve presente
%       |    |
%       V    V
Tij = [0.7 0.8
       0.3 0.2];

sum(Tij);

x0 = [1 0]'; %QUEREMOS A PROBABILIDADE DE ESTEVE PRESENTE

x1 = Tij*x0;  %prob de ir à aula seguinte
x2 = Tij^2*x0;  
%x2 = Tij*x1;
fprintf('1a) reposta = %f\n', x2(1));

%b)
x0 = [0 1]';
x1 = Tij*x0;
x2 = Tij^2*x0;
fprintf('1b) reposta = %f\n', x2(1));

%COMO FAZER MATRIZ EM QUE A SOMA 
%DAS PROB DÁ 1
% n=5;
% v = rand(n,1);
% v = v/sum(v);

%c)
x0 = [1 0]';
x2 = Tij^29*x0;
fprintf('1c) reposta = %f\n', x2(1));

%d)
x0 = [0.85 0.15]';
aulas = 1:30;
pfaltar = zeros(1,30);
pfaltar(1) = 0.15;
for i = 2 : 30 
    x0 = Tij * x0;
    pfaltar(i) = x0(2);
end
 %SO FALTA FAZER O GRAFICO


