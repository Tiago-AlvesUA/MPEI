load keys_prob;
tamanhos = [5e5, 1e6, 2e6];
%% String2Hash djb2
fprintf('DJB2\n');
for i = 1:length(tamanhos)
    collision = 0;
    vector = zeros(1,tamanhos(i)); % iniciar vetor a zeros
    hashCodes = zeros(1,length(keys_prob)); % cada palavra tem os seus hash codes
    % count time
    tic
    for j = 1:length(keys_prob) % percorrer palavras
        % h(k) = k mod M
        % k -> key
        % M -> tamanho da tabela
        hashCodes(j) = mod(string2hash(keys_prob{j}),length(vector)) + 1;
        if vector(hashCodes(j)) > 0 % Se a posicao do hashcode obtido foi alterada
            %antes, há colisao
            collision = collision + 1;
        end
        vector(hashCodes(j)) = vector(hashCodes(j)) + 1; % atualizar posicoes
        % da tabela com os hashcodes obtidos
    end
    fprintf('>>>Chaining HashTable %d<<<\n', tamanhos(i));
    fprintf('Number of Collisions: %d\n', collision);
    fprintf('Number of atributions: %d\n', max(vector));
    fprintf('Running time: %f seconds\n', toc);
    %histogram(hashCodes,100)   %Resulta num histograma com hashcodes distribuidos
                                %similarmente nos diferentes intervalos. 
                                %Função de dispersão UNIFORME
    h = hashCodes/length(vector);
    fprintf('Momento 2: medio  - %f | teorico - %f\n', mean(h.^2),1/(2+1));
    fprintf('Momento 5: medio  - %f | teorico - %f\n', mean(h.^5),1/(5+1));
    fprintf('Momento 10: medio - %f | teorico - %f\n', mean(h.^10),1/(10+1));
end
fprintf('\n');
%% String2Hash sdbm
fprintf('SDBM\n');
for i = 1:length(tamanhos)
    collision = 0;
    vector = zeros(1,tamanhos(i)); % iniciar vetor a zeros
    hashCodes = zeros(1,length(keys_prob)); % cada palavra tem os seus hash codes
    % count time
    tic
    for j = 1:length(keys_prob) % percorrer palavras
        % h(k) = k mod M
        % k -> key
        % M -> tamanho da tabela
        hashCodes(j) = mod(string2hash(keys_prob{j},'sdbm'),length(vector)) + 1;
        if vector(hashCodes(j)) > 0 % Se a posicao do hashcode obtido foi alterada
            %antes, há colisao
            collision = collision + 1;
        end
        vector(hashCodes(j)) = vector(hashCodes(j)) + 1; % atualizar posicoes
        % da tabela com os hashcodes obtidos
    end
    
    fprintf('>>>Chaining HashTable %d<<<\n', tamanhos(i));
    fprintf('Number of Collisions: %d\n', collision);
    fprintf('Number of atributions: %d\n', max(vector));
    fprintf('Running time: %f seconds\n', toc);
    %histogram(hashCodes,100)
    h = hashCodes/length(vector);
    fprintf('Momento 2: medio  - %f | teorico - %f\n', mean(h.^2),1/(2+1));
    fprintf('Momento 5: medio  - %f | teorico - %f\n', mean(h.^5),1/(5+1));
    fprintf('Momento 10: medio - %f | teorico - %f\n', mean(h.^10),1/(10+1));
end
fprintf('\n');
%% hashstring
fprintf('hashstring\n');
for i = 1:length(tamanhos)
    collision = 0;
    vector = zeros(1,tamanhos(i)); % iniciar vetor a zeros
    hashCodes = zeros(1,length(keys_prob)); % cada palavra tem os seus hash codes
    % count time
    tic
    for j = 1:length(keys_prob) % percorrer palavras
        % h(k) = k mod M
        % k -> key
        % M -> tamanho da tabela
        hashCodes(j) = mod(hashstring(keys_prob{j},length(vector)),length(vector)) + 1;
        if vector(hashCodes(j)) > 0 % Se a posicao do hashcode obtido foi alterada
            %antes, há colisao
            collision = collision + 1;
        end
        vector(hashCodes(j)) = vector(hashCodes(j)) + 1; % atualizar posicoes
        % da tabela com os hashcodes obtidos
    end
    
    fprintf('>>>Chaining HashTable %d<<<\n', tamanhos(i));
    fprintf('Number of Collisions: %d\n', collision);
    fprintf('Number of atributions: %d\n', max(vector));
    fprintf('Running time: %f seconds\n', toc);
    %histogram(hashCodes,100)
    h = hashCodes/length(vector);
    fprintf('Momento 2: medio  - %f | teorico - %f\n', mean(h.^2),1/(2+1));
    fprintf('Momento 5: medio  - %f | teorico - %f\n', mean(h.^5),1/(5+1));
    fprintf('Momento 10: medio - %f | teorico - %f\n', mean(h.^10),1/(10+1));
end
fprintf('\n');
%% DJB31MA
fprintf('DJB31MA\n');
for i = 1:length(tamanhos)
    collision = 0;
    vector = zeros(1,tamanhos(i)); % iniciar vetor a zeros
    hashCodes = zeros(1,length(keys_prob)); % cada palavra tem os seus hash codes
    % count time
    tic
    for j = 1:length(keys_prob) % percorrer palavras
        % h(k) = k mod M
        % k -> key
        % M -> tamanho da tabela
        hashCodes(j) = mod(DJB31MA(keys_prob{j},127),length(vector)) + 1;
        if vector(hashCodes(j)) > 0 % Se a posicao do hashcode obtido foi alterada
            %antes, há colisao
            collision = collision + 1;
        end
        vector(hashCodes(j)) = vector(hashCodes(j)) + 1; % atualizar posicoes
        % da tabela com os hashcodes obtidos
    end
    
    fprintf('>>>Chaining HashTable %d<<<\n', tamanhos(i));
    fprintf('Number of Collisions: %d\n', collision);
    fprintf('Number of atributions: %d\n', max(vector));
    fprintf('Running time: %f seconds\n', toc);
    %histogram(hashCodes,100)
    h = hashCodes/length(vector);
    fprintf('Momento 2: medio  - %f | teorico - %f\n', mean(h.^2),1/(2+1));
    fprintf('Momento 5: medio  - %f | teorico - %f\n', mean(h.^5),1/(5+1));
    fprintf('Momento 10: medio - %f | teorico - %f\n', mean(h.^10),1/(10+1));
end
fprintf('\n');
