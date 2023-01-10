%%
[users,Set] = createSet('u.data');  

distances = jaccardDistance4(users,Set,50);

threshold = 0.8;
similarPairs = getSimilarities(users,distances,threshold);

N = length(similarPairs);
for k= 1:N
  fprintf("Distance: %f -> user 1: %d ; user 2: %d\n",similarPairs(k,3),similarPairs(k,1),similarPairs(k,2));
end


%%
function J = jaccardDistance4(users,Set,numHashes)
    Nu = length(users);
    J=zeros(Nu); % array para guardar distancias
    h= waitbar(0,'Calculating');
    
    signatures = cell(Nu,1);
    for n = 1:Nu
       signatures{n} = minHash(Set{n}, numHashes); 
    end

    for n1 = 1:Nu
        waitbar(n1/Nu,h);
        for n2 = n1+1:Nu
            % Estimar dist Jaccard usando minHash signatures

            count = 0;
            for i = 1:numHashes
                if signatures{n1}(i) == signatures{n2}(i)
                    % Se hash values iguais, incrementa
                    count = count + 1;
                end
            end
            %dist Jacc
            J(n1,n2) = count / numHashes;
        end
    end
    delete (h)
end

function sig = minHash(set, numHashes)
    % set is a set of movies
    % numHashes is the number of hash functions to use
    % sig is the minHash signature for the set
    
    % Number of movies in the set
    numMovies = length(set);
    
    % Initialize minHash signature
    sig = Inf(1, numHashes);
    
    % Iterate over the movies in the set
    for m = 1:numMovies
        % Map movie to integer using hash function
        movieHash = myHashFunction(set(m), numHashes);
        
        % Update minHash signature
        sig = min(sig, movieHash);
    end
end

function movieHash = myHashFunction(movie, numHashes)
    movieHash = mod(int32(movie*123456789), numHashes) + 1;
end
