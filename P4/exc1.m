%% a
N = 1e5;
alpha = ['a':'z' 'A':'Z'];
keys = genKeys(N,6,20,alpha);
save keys.mat

%% b
N = 1e5;
alpha = 'a':'z';
prob = load("PL04_ficheiros_complementares\prob_pt.txt");
keys_prob = genKeys(N,6,20,alpha,prob);
save keys_prob.mat

%%
function keys = genKeys(N,imin,imax,alpha, probs)
    keys = {}; %empty cell array
    Nalpha = length(alpha);
    for i=1:N
       switch nargin
           case 4
               compr = randi([imin,imax]); %compr da palavra
               letters_pos = randi(Nalpha,1,compr); %posicoes random de letras
               key = alpha(letters_pos); %ir buscar letras pelas posicoes
           case 5
               compr = randi([imin,imax]);
               key = '';
               for j=1:compr
                   letter = discrete_rnd(alpha, probs);
                   key = [key letter];
               end
       end
       keys(i) = {key};
    end
end

function state = discrete_rnd(states, probVector)
     U=rand();
     i = 1 + sum(U > cumsum(probVector));
     state= states(i);
end

