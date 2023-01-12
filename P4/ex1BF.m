
n = 8000;
m = 1000;
m2 = 10000;
k = 3;
fid = fopen('PL04_ficheiros_complementares\wordlist-preao-20201103.txt','r');
dicionario = textscan(fid,'%s');
dicionario = dicionario{1,1};
BF = inicializar(n);

for i=1:m 
    BF = adicionarElemento(BF,dicionario{i},k);
end

falsosNeg = 0;
for i=1:m
    if ~membro(BF,dicionario{i},k)
        falsosNeg = falsosNeg + 1;
    end
end
fprintf('Falsos negativos: %d\n',falsosNeg);

falsosPos = 0;
for i=m+1:m+m2
    if membro(BF,dicionario{i},k)
        falsosPos = falsosPos + 1;
    end
end
percFP = 100*falsosPos/m2;
fprintf('Falsos positivos: %.2f\n',percFP);
% Teoricamente
fprintf('Falsos positivos teorica: %.2f\n',100*(1-(1-1/n)^(k*m))^k)

%% exc5 
% valor ótimo de k: minimizar prob de falsos positivos
BFs = cell(1,7);
for i = 1:7
    BFs{i} = inicializar(n);
end

for j = 1:7
    k = j+3;
    for i = 1:m
        BFs{j} = adicionarElemento(BFs{j},dicionario{i},k);
    end
end

falsosPos = zeros(1,7);
for j = 1:7
    k = j+3;
    for i = m+1:m+m2
        contem = membro(BFs{j},dicionario{i},k);
        if contem
            falsosPos(j) = falsosPos(j) + 1;
        end
    end
    % Percentagens
    falsosPos(j) = 100 * falsosPos(j) / m2;
end

k_values = 4:10;
plot(k_values,falsosPos);
% k ótimo é 6

%% FUNCTIONS
function BF = inicializar(n)
    BF = zeros(1,n);
end

function BF = adicionarElemento(BF,elemento,k)
    for i=1:k
        elemento = [elemento num2str(i)];
        h = mod(string2hash(elemento),length(BF))+1;
        BF(h) = 1;
    end
end

function ismember = membro(BF,elemento,k)
    ismember = true;
    for i = 1:k
        elemento = [elemento num2str(i)];
        h = mod(string2hash(elemento),length(BF))+1;
        if BF(h) == 0
            ismember = false;
            break;
        end
    end
end