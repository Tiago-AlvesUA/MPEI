% 1
n = 8000;
m = 1000;
k = 3;

fid = fopen('PL04_ficheiros_complementares\wordlist-preao-20201103.txt','r');
dicionario = textscan(fid,'%s'); %900k palavras
fclose(fid);
dicionario = dicionario{1,1}; %separar palavras
BF = inicializar(n);

for i = 1:m
    % adc primeiras 1000 palavras do dic ao BF
    BF = adicionarElemento(BF,dicionario{i},k);
end

% 2
falsosNeg = 0;
for i = 1:m
    % verificar se as 1000 palavras estao no BF
    % (se não há falsos negativos)
    contem = verificar(BF,dicionario{i},k);
    if ~contem
        falsosNeg = falsosNeg + 1;
    end
end
fprintf('Num de falsos negativos = %d\n',falsosNeg);

% 3
% verificar() no BF anterior com palavras diferentes
% das que foram inseridas para ver o numero de
% falsos positivos
m2 = 10000;

falsosPos = 0;
for i = m+1:m+m2
    contem = verificar(BF,dicionario{i},k);
    if contem
        falsosPos = falsosPos + 1;
    end
end
fprintf('Perc. falsos positivos = %.2f\n',100*falsosPos/m2);
% 4 usando prob falsos positivos
fprintf('Perc. falsos positivos teorica = %.2f\n',100*(1-exp(-k*m/n))^k);

%% 5
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

m2 = 10000;
falsosPos = zeros(1,7);
for j = 1:7
    k = j+3;
    for i = m+1:m+m2
        contem = verificar(BFs{j},dicionario{i},k);
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
%% functions
function BF = inicializar(n)
    BF = zeros(1,n);
end

function BF = adicionarElemento(BF,elemento,k)
    n = length(BF);
    for i=1:k
        elemento = [elemento num2str(i)];
        h = DJB31MA(elemento,127);
        h = mod(h,n) + 1;
        BF(h) = 1;
    end
end

function contem = verificar(BF, elemento, k)
    contem = true;
    n = length(BF);
    for i=1:k
        %until ( (i==k) | (B [h] == 0) )
        elemento = [elemento num2str(i)];
        h = DJB31MA(elemento,127);
        h = mod(h,n) + 1;
        if BF(h) == 0
            contem = false;
            break;
        end
    end
end