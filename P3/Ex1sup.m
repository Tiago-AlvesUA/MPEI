% a state transition matrix example
% Usando matriz canónica para facilitar contas
%    1   2   4   3 5
H = [0.8 0   0.3 0 0
     0.2 0.6 0.2 0 0
     0   0.1 0.4 0 0
     0   0.3 0   1 0
     0   0   0.1 0 1];

N = 1e4;
endS3 = 0;
endS5 = 0;
numPassosInitState1 = 0;
for i = 1:N
    a = crawl(H, 1, [4 5]);
    if a(length(a)) == 4
        endS3 = endS3 + 1; 
    else
        endS5 = endS5 + 1;
    end    
    numPassosInitState1 = numPassosInitState1 + length(a);
end

numPassosInitState2 = 0;
for i = 1:N
    a = crawl(H, 2, [4 5]);
    if a(length(a)) == 4
        endS3 = endS3 + 1; 
    else
        endS5 = endS5 + 1;
    end    
    numPassosInitState2 = numPassosInitState2 + length(a);
end

numPassosInitState4 = 0;
for i = 1:N
    a = crawl(H, 3, [4 5]);
    if a(length(a)) == 4
        endS3 = endS3 + 1; 
    else
        endS5 = endS5 + 1;
    end  
    numPassosInitState4 = numPassosInitState4 + length(a);
end
fprintf('Nº médio passos para absorção partindo estado 1 é: %.4f\n',numPassosInitState1/N);
fprintf('Nº médio passos para absorção partindo estado 2 é: %.4f\n',numPassosInitState2/N);
fprintf('Nº médio passos para absorção partindo estado 4 é: %.4f\n',numPassosInitState4/N);
fprintf('Prob(estado3) = %f, Prob(estado 5) = %f\n',endS3/(N*3),endS5/(N*3));

%b)
N = 1e5;
a = cell(N,1);
for i = 1:N
    a(i) = {crawl(H, 1, [4 5])};
    % disp(length(a{i})); -> a{i} PARA ACEDER AO CONTEÚDO DOS ARRAYS
end

min = intmax;
max = intmin;
for i = 1:N
    if length(a{i}) > max
        max = length(a{i});
    end
    if length(a{i}) < min
        min = length(a{i});
    end
end
fprintf('Comp mín = %f, Comp máx = %f\n',min-1,max-1);

% how to use crawl()
% state = crawl(H, 1, [4 5]);
% Note:
% if the Markov chain has more than 1 absorbing state the third argument
% must be a vector with the absorbing states
% for example in a chain with 5 states and considering that
% states 4 and 5 are absorbing states:
% state = crawl(H5, 1, [4 5])
%
% Random walk on the Markov chain
% Inputs:
% H - state transition matrix
% first - initial state
% last - terminal or absorving state
function [state] = crawl(H, first, last)
    % the sequence of states will be saved in the vector "state"
    % initially, the vector contains only the initial state:
    state = [first];
    % keep moving from state to state until state "last" is reached:
    while (1)
        state(end+1) = nextState(H, state(end));
        if ismember(state(end), last) % verifies if state(end) is absorbing
            break;
        end
    end
end

% Returning the next state
% Inputs:
% H - state transition matrix
% currentState - current state
function state = nextState(H, currentState)
    % find the probabilities of reaching all states starting at the current one:
    probVector = H(:,currentState)'; % probVector is a row vector
    n = length(probVector); %n is the number of states
    % generate the next state randomly according to probabilities probVector:
    state = discrete_rnd(1:n, probVector);
end

% Generate randomly the next state.
% Inputs:
% states = vector with state values
% probVector = probability vector
function state = discrete_rnd(states, probVector)
    U=rand();
    i = 1 + sum(U > cumsum(probVector));
    state= states(i);
end

% BASICAMENTE, a função crawl simula o caminho de uma cadeia de Markov até
% chegar ao estado absorvente
