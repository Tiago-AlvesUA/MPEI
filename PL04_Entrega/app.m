load data;
user_id = 0;

while user_id < 1 || user_id > 943
    user_id = input("Insert User ID (1 to 943): ");
    if user_id < 1 || user_id > 943
        fprintf("Invalid User ID\n");
    end
end 

while true
    fprintf("1 - Your movies\n");
    fprintf("2 - Suggestion of movies based on other users\n");
    fprintf("3 - Suggestion of movies based on already evaluated movies\n");
    fprintf("4 - Movies feedback based on popularity\n");
    fprintf("5 - Exit\n");
    option = input('Select choice: ');

    switch option
        case 1
            movies = films_by_user_set(user_id);
            movies = movies{1,1};
            for i = 1:length(movies)
                fprintf('%d - %s\n',movies(i),dic{movies(i),1});
            end
        case 2
            similar_users = getSimilarUsers(user_id, Nu, MinHashSig_user_films);
            movies_user = films_by_user_set(user_id);
            movies_sim_user1 = films_by_user_set(similar_users{1});
            movies_sim_user2 = films_by_user_set(similar_users{2});
            suggestions = getSuggestions(movies_sim_user1, movies_sim_user2, movies_user);
            for i = 1:length(suggestions)
                fprintf('%d - %s\n',suggestions(i),dic{suggestions(i),1});
            end
            fprintf('\n');
        case 3
            movies_user = films_by_user_set(user_id);
            id_mostCommon_movies = getTwoMostCommon(movies_user,MinHashSig_films_genre, dic);
            for i = 1:2 
                fprintf('%s\n',dic{id_mostCommon_movies{i},1});
            end
            fprintf('\n');
        case 4
            str = lower(input('Insert movie name: ', 's'));
            while length(str) < 4
                fprintf("Invalid input! Must have 4 or more characters.\n")
                str = lower(input('Insert movie name: ', 's'));
            end
            sim_names = getSimilarNames(str, dic, MinHashSig_films_title);
            for i = 1:length(sim_names)
                countAvaliacoes = getAvCount(sim_names{i},BF);
                fprintf('%d - %s - %d\n',sim_names{i},dic{sim_names{i},1},countAvaliacoes);
            end
        case 5
            break
    
        otherwise
            fprintf('Invalid option\n');
    end
end

function countAvaSupTres = getAvCount(movie_id,BF)
    k = 6;
    n = length(BF);
    h = zeros(1,k);
    for i=1:k
        movie_id = [movie_id num2str(i)];
        h(i) = DJB31MA(movie_id,127);
        h(i) = mod(h(i),n) + 1;
    end
    count = zeros(1,length(h));
    for j = 1:length(h)
        count(j) = BF(h(j));
    end
    countAvaSupTres = min(count);
end

function similar_users = getSimilarUsers(user_id, Nu, MinHashSig_user_films)
    num_hash_functs = 100; % numero de hash functions usadas em data.m
    J = ones(1, Nu); % vetor de similaridade entre o usuario e os outros
    h = waitbar(0, 'Calculating similarity...');
    for i = 1:Nu
        waitbar(i/Nu, h);
        if i ~= user_id
            J(i) = sum(MinHashSig_user_films(i,:) ~= MinHashSig_user_films(user_id,:))/num_hash_functs; % calcula a distancia de Jaccard entre o utilizador e os outros
        end
    end
    delete(h);
    
    similar_users = {2};
    for i=1:2
        [val, id] = min(J);
        similar_users{i} = id;
        J(id) = [];
    end
end

function suggestions = getSuggestions(movies_sim_user1, movies_sim_user2, movies_user)
    suggestions = union(cell2mat(movies_sim_user1(:)), cell2mat(movies_sim_user2(:)), "rows");
    suggestions = setdiff(suggestions,cell2mat(movies_user(:)), 'rows');
end

function mostCommonThroughGenres = getTwoMostCommon(movies_user, MinHashSig_films_genre, dic)
    user_movies = movies_user{1,1}; 
    length_user_movies = length(user_movies);
    length_totalMovies = length(dic);
    J = ones(length_totalMovies);  
    
    movies_not_seen = [];
    for m2=1:length_totalMovies
        flag_not_seen = true;
        for m1=1:length_user_movies
            if user_movies(m1) == m2
                flag_not_seen = false;
            end
        end
        if flag_not_seen
            movies_not_seen = [movies_not_seen m2];
        end
    end
    length_not_seen = length(movies_not_seen);

    for m1=1:length_user_movies 
        for m2=1:length_not_seen
            J(user_movies(m1),movies_not_seen(m2)) = sum(MinHashSig_films_genre(user_movies(m1),:) ~= MinHashSig_films_genre(movies_not_seen(m2),:))/100; 
        end
    end
    setM = {};
    threshold = 0.8;
    % guardar em set os filmes que tenham dist menor ao m1
    for m1= 1:length_user_movies
        setM{m1} = [];
        for m2= 1:length_not_seen
            % se a distância for menor que o limiar adiciona ao conjunto
            if J(user_movies(m1),movies_not_seen(m2)) < threshold
                setM{m1} = [setM{m1} movies_not_seen(m2)];
            end
        end
    end

    % Contagem para obter os filmes que aparecem em mais conjuntos
    count = zeros(1,length_totalMovies);
    for i = 1:length(setM)
        for j = 1:length(setM{i})   
            % incrementa a cada id de filme do conjunto           
            count(setM{i}(j)) = count(setM{i}(j)) + 1;
        end
    end
    %disp(count)
    mostCommonThroughGenres = {2};
    for i=1:2
        [val, id] = max(count);
        mostCommonThroughGenres{i} = id;
        count(id) = [];
    end
end

function similar_names = getSimilarNames(str, dic, MinHashSig_films_title)
    num_hash_functs = 150; % numero de hash functions usadas em data.m
    shingle_size = 3;

    % shingles da string inserida
    shingles_string = {};
    for i=1:length(str)-shingle_size+1
        shingles_string{i} = str(i:i+shingle_size-1);
    end

    % Minhash da string inserida
    MinHashSig_string = inf(1,num_hash_functs);
    for j=1:length(shingles_string)
        key = char(shingles_string{j});
        hash = zeros(1,num_hash_functs);
        for k=1:num_hash_functs
            key = [key num2str(k)];
            hash(k) = DJB31MA(key, 127);
        end
        MinHashSig_string(1,:) = min([MinHashSig_string(1,:); hash]);
    end

    % calcula a distancia de Jaccard entre a string inserida e os outros filmes
    J = ones(1, size(dic,1));
    h = waitbar(0, 'Calculating similarity...');
    for i=1:size(dic,1)
        waitbar(i/size(dic,1), h);
        J(i) = sum(MinHashSig_films_title(i,:) ~= MinHashSig_string)/num_hash_functs;
    end
    delete(h);
    
    % guarda os 5 filmes mais similares à string inserida
    similar_names = {5};
    for i=1:5
        [val, id] = min(J);
        similar_names{i} = id;
        J(id) = [];
    end
end
