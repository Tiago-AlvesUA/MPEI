p1 = 0.002;
p2 = 0.005;
pa = 0.01;
n = 8;
N = 1e5;

def1 = rand(n,N) > p1;
def2 = rand(n,N) > p2;
defa = rand(n,N) > pa;

resultados = sum(def1);
sucessos = resultados==8;
prob1 = sum(sucessos)/N;

resultados = sum(def2);
sucessos = resultados==8;
prob2 = sum(sucessos)/N;

resultadosA = sum(defa);
sucessos = resultadosA==8;
proba = sum(sucessos)/N;

probT = prob1 * prob2 * proba;
display(probT);

% (b) 
%  100 - 1 (sem defeito)
%   8  - 0.08
% 
% 1 - 0.08 = 0.92


