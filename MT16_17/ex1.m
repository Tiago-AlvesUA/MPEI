% 1.
% pacote perdido se chega com 2 ou + erros
% prob de erros é dada pela existencia erros no pacote anterior:
% -> Se pacote anterior nao tem erros, pacote seguinte:
%    P(1 erro|nao erros) = 0.09
%    P(2 ou +|nao erros) = 0.01
%
% -> Se pacote anterior tem erros, pacote seguinte:
%    P(1 erro|erros) = 0.4
%    P(2 ou +|erros) = 0.1
%
% 1º pacote transmitido - 3 erros

% a)
%    0    1   2+
T= [0.9  0.5 0.5
    0.09 0.4 0.4
    0.01 0.1 0.1];

% b)
x0 = [0 0 1]';
probs = T^3*x0;
fprintf('prob estado 0: %f\n',probs(1));
fprintf('prob estado 1: %f\n',probs(2));
fprintf('prob estado 2+: %f\n',probs(3));

% c)
xn = x0;
eps = 1e-3;
iter = 1;
while 1
    xOld = xn;
    xn = T^iter*x0;
    if (max(abs(xn-xOld)) < eps)
        break;
    end
    iter = iter + 1;
end
fprintf('1c)\n');
disp(xn);

%% 2
%    C   D   E   F   G
H = [0   1/2 1/3 1/4 0
     1/2 0   0   1/4 1/2
     1/2 1/2 1/3 1/4 0
     0   0   0   0   1/2
     0   0   1/3 1/4 0  ];

beta = 0.8;
N = 5;
A = beta*H + (1-beta)*(1/N*ones(N));

% b)
%pr inicial, igual prob para todas as paginas
pagerank = (1/N*ones(1,5))';

for i = 1:10
    pagerank = A*pagerank;
end
letras = ['C' 'D' 'E' 'F' 'G'];
for i = 1:N
    fprintf('Pagerank %s é %.4f\n',letras(i),pagerank(i));
end


%% 3
% a)
fprintf('\nExc3:\n');
%    a   b   c   d   ?   .
T = [0.7 0.2 0   0   0   0
     0.2 0   0.3 0   0   0
     0   0.6 0.3 0   0   0
     0.1 0.2 0.3 0.1 0   0 
     0   0   0   0.4 1   0
     0   0   0.1 0.5 0   1];

% b)
x0 = [1 0 0 0 0 0]';
x10 = T^9*x0; 
fprintf('Prob 10º caracter ser c: %.4f\n',x10(3));

x15 = T^14*x0;
fprintf('Prob 15º caracter ser d: %.4f\n\n',x15(4));

% c)
% (Calcular media do numero de passos antes da absorção)

% Matriz que eu fiz já é canónica (estados transientes primeiro)
C = T;
Q = C(1:4,1:4);

%Matriz fundamental
% eye -> matriz identidade
F = (eye(4) - Q)^-1;

compri_medios = sum(F);
fprintf('Comprimento medio partindo de c: %.4f\n\n',compri_medios(3))


