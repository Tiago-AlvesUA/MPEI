p1 = 0.002;
p2 = 0.005;
pa = 0.01;
n = 8;
N = 1e5;

def1 = rand(n,N) < p1;
def2 = rand(n,N) < p2;
defa = rand(n,N) < pa;

resultados = sum(def1);
sucessos = resultados>=1;
prob1 = sum(sucessos)/N;

resultados = sum(def2);
sucessos = resultados>=1;
prob2 = sum(sucessos)/N;

resultadosA = sum(defa);
sucessos = resultadosA>=1;
proba = sum(sucessos)/N;

probT = prob1 + prob2 + proba;
display(probT);

% (b) -> Valor esperado
% Vamos calcular a probabilidade de ocorrer
% 1,2,3,...,8 peças defeituosas devido apenas
% ao processo de montagem.

xi = 0:7;
px = 0:7;
soma = zeros(1,8);

for i = 1 : N
    if(resultadosA(i)==1)
        soma(1) = soma(1) + 1;
    end
    if(resultadosA(i)==2)
        soma(2) = soma(2) + 1;
    end
    if(resultadosA(i)==3)
        soma(3) = soma(3) + 1;
    end
    if(resultadosA(i)==4)
        soma(4) = soma(4) + 1;
    end
    if(resultadosA(i)==5)
        soma(5) = soma(5) + 1;
    end
    if(resultadosA(i)==6)
        soma(6) = soma(6) + 1;
    end
    if(resultadosA(i)==7)
        soma(7) = soma(7) + 1;
    end
    if(resultadosA(i)==8)
        soma(8) = soma(8) + 1;
    end
end

for i = 1 : 8
    px(i) = soma(i)/N;
end
   
num_medio = xi * px';
display(num_medio);
