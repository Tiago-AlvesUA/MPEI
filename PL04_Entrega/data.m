%% Load films.txt
dic = readcell('films.txt','Delimiter','\t');

%% Load udata
udata = load('u.data');
% obter as duas primeiras colunas 
u= udata(1:end,1:2);
% obter segunda e a terceira coluna
avaliacoes = udata(2:end, 2:3); 

clear udata;

%% Lista de utilizadores
users = unique(u(:,1)); % IDs dos utilizadores
Nu = length(users); % Numero de utilizadores

%% Lista de filmes para cada utilizador
films_by_user_set= cell(Nu,1);
for n = 1:Nu 
    films = find(u(:,1) == users(n));
    films_by_user_set{n} = [films_by_user_set{n} u(films,2)];
end

%% 
% Matriz de assinaturas com os vectores MinHash correspondente ao conjunto de filmes 
% avaliados por cada utilizador

num_hash_functs = 100;
MinHashSig_user_films = inf(length(users), num_hash_functs);
for i = 1:length(users)
    % conjunto de filmes avaliados pelo utilizador i
    set = films_by_user_set{i};
 
    for j = 1:length(set)
        key = set(j);
        hash = zeros(1, num_hash_functs);
        for k = 1:num_hash_functs
            key = [key num2str(k)];
            hash(k) = DJB31MA(key, 127);
        end
        MinHashSig_user_films(i, :) = min([MinHashSig_user_films(i, :); hash]);
    end
end

%% 
% Matriz de assinaturas com os vectores MinHash correspondente ao conjunto de géneros 
% cinematográficos de cada filme

num_hash_functs = 100;
MinHashSig_films_genre = inf(length(dic), num_hash_functs);
for i = 1:length(dic)
    % conjunto de géneros cinematográficos do filme i
    set = {length(dic(i,:))};
    for j = 2:length(dic(i,:))
        set{j-1} = lower(dic{i,j});
    end

    for j = 1:length(set)
        if ~isa(set{j},"missing")
            key = char(set{j});
            hash = zeros(1, num_hash_functs);
            for k = 1:num_hash_functs
                key = [key num2str(k)];
                hash(k) = DJB31MA(key, 127);
            end
            MinHashSig_films_genre(i, :) = min([MinHashSig_films_genre(i, :); hash]);
        end
    end
end

%%
% Matriz de assinaturas com os vectores MinHash associados aos títulos dos filmes

shingle_size = 3;
num_hash_functs = 150;
MinHashSig_films_title = inf(length(dic), num_hash_functs);

for i = 1:length(dic)
    set = lower(dic{i,1});
    shingles = {length(set)};
    % Criação de shingle para cada filme
    for j = 1:length(set) - shingle_size + 1
        shingles{j} = set(j:j+shingle_size-1);
    end

    for j = 1:length(shingles)
        key = char(shingles{j});
        hash = zeros(1, num_hash_functs);
        for k = 1:num_hash_functs
            key = [key num2str(k)];
            hash(k) = DJB31MA(key, 127);
        end
        MinHashSig_films_title(i, :) = min([MinHashSig_films_title(i, :); hash]);
    end

end

%%
% Counting Bloom Filter
n = 200000;
m = length(dic);
k = 6;

% calcular
BF = inicializar(n);

% for i = 1:length(avaliacoes(:,2))
%     fprintf('%d     %d\n', avaliacoes(i,1),avaliacoes(i,2))
% end

for i = 1:length(avaliacoes(:,2))   % percorrer todas as avaliações
    if avaliacoes(i,2) >= 3
        BF = adicionarElemento(BF,avaliacoes(i,1),k);
    end
end

save 'data' 'dic' 'users' 'Nu' 'films_by_user_set' 'MinHashSig_user_films' 'MinHashSig_films_title' 'MinHashSig_films_genre' 'BF'

% Funções Bloom Filter %
function BF = inicializar(n)
    BF = zeros(1,n);
end

function BF = adicionarElemento(BF,elemento,k)
    n = length(BF);
    for i=1:k
        elemento = [elemento num2str(i)];
        h = DJB31MA(elemento,127);
        h = mod(h,n) + 1;
        BF(h) = BF(h) + 1;
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
        else 
            BF(h) = BF(h) - 1;
        end
    end
end