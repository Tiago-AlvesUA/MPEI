function [users,Set] = createSet(file, numUsers)
    udata=load(file); % Carrega o ficheiro dos dados dos filmes
    % Fica apenas com as duas primeiras colunas
    u= udata(1:end,1:2); clear udata;
    
    % Lista de utilizadores
    users = unique(u(:,1)); % Extrai os IDs dos utilizadores
    Nt= length(users); % Numero total de utilizadores
    
    if nargin < 2
        numUsers = Nt;
    end

    % Selecionar aleatoriamente numUsers (100)
    permutation = randperm(Nt);
    users = users(permutation(1:numUsers));

    % Constroi a lista de filmes para cada utilizador
    Set= cell(numUsers,1); % Usa celulas
    for n = 1:numUsers % Para cada utilizador
        % Obtem os filmes de cada um
        ind = find(u(:,1) == users(n));
        % E guarda num set.
        Set{n} = [Set{n} u(ind,2)];
    end
end

