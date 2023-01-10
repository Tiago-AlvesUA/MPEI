% O objectivo e descobrir utilizadores que avaliaram conjuntos similares de filmes
%% 1
% Codigo base para detecao de pares similares

udata=load('u.data'); % Carrega o ficheiro dos dados dos filmes
% Fica apenas com as duas primeiras colunas
u= udata(1:end,1:2); clear udata;

% Lista de utilizadores
users = unique(u(:,1)); % Extrai os IDs dos utilizadores, sem repetições
Nu= length(users); % Numero total de utilizadores

% Constroi a lista de filmes para cada utilizador
Set= cell(Nu,1); % Usa celulas
for n = 1:Nu % Para cada utilizador
    % Obtem os filmes de cada um
    ind = find(u(:,1) == users(n));
    % E guarda num set.
    Set{n} = [Set{n} u(ind,2)];
end

%% Calcula a distancia de Jaccard entre todos os pares pela definicao.
J=zeros(Nu); % array para guardar distancias
h= waitbar(0,'Calculating');
for n1 = 1:Nu
    waitbar(n1/Nu,h);
    for n2 = n1+1:Nu
        i = intersect(Set{n1},Set{n2});
        u = union(Set{n1},Set{n2});
        J(n1,n2) = 1 - (length(i) / length(u));
    end
end
delete (h)

save('JaccardDistances.mat','J');

%%
% Com base na distancia, determina pares com
% distancia inferior a um limiar pre-definido
threshold =0.4; % limiar de decisao
% Array para guardar pares similares (user1, user2, distaˆncia)
SimilarUsers= zeros(1,3);
k= 1;
for n1= 1:Nu
    for n2= n1+1:Nu
        if J(n1,n2) < threshold
            %Guardar se distânca J fica abaixo do limiar
            SimilarUsers(k,:)= [users(n1) users(n2) J(n1,n2)];
            k= k+1;
            fprintf('Distance: %f -> user 1: %d ; user 2: %d\n',J(n1,n2),users(n1),users(n2));
        end
    end
end
fprintf('Numero pares com dist inferior ao limite: %d\n',k-1);

