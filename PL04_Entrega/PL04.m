udata = load('u.data');

u= udata(1:end,1:2); clear udata;

% Lista de utilizadores
users = unique(u(:,1)); % Extrai os IDs dos utilizadores
Nu = length(users); % Numero de utilizadores

% Constroi a lista de filmes para cada utilizador
Set= cell(Nu,1); % Usa celulas
for n = 1:Nu % Para cada utilizador
    % Obtem os filmes de cada um
    ind = find(u(:,1) == users(n));
    % E guarda num set.
    Set{n} = [Set{n} u(ind,2)];
end

dic = readcell('films.txt','Delimiter','\t');


user_id = input('user id: ');

getSim(user_id,Set,Nu)
movies = getMovies(user_id,Set);

while true
    option = input('choose an option: ');
    switch option

    case 1
        movies = getMovies(user_id,Set);
        for i = 1:length(movies)
            fprintf('%d - %s\n',movies(i),dic{movies(i),1});
        end
    case 2

    case 3

    case 4

    case 5
        break

    otherwise
        disp('Invalid option');
    end
end

function movies = getMovies(id,Set)
    movies = {};
    % with id get movies from set
    for i = 1:length(Set)
        if Set{i}(1) == id
            movies = Set{i}(2:end);
        end
    end
end

function simUsers = getSim(id,Set,Nu)
%     vector = zeros(1,1e5); % iniciar vetor a zeros
%     hashCocodes = zeros(1,Nu); % cada palavra tem os seus hash codes
    
    for i = 1:length(Nu) %percorrer users
        for j = 1:length(Set{i}) % percorrer filmes
              disp(Set{i});
%             hashCodes(j) = mod(DJB31MA(keys{j}),127) + 1;
%             vector(hashCodes(j)) = vector(hashCodes(j)) + 1; % atualizar posicoes
            % da tabela com os hashcodes obtidos
        end
    end
end
