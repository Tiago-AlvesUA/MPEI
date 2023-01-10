
user_id = input('user id: ');
while true
    option = input('choose an option: ');
    switch option

    case 1
        movies = getMovies(user_id,Set);
        for i=1:length(movies)
            fprintf
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



