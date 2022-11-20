%a)
%    9   1   3   5   3   9   FIM
T = [0   0   0   0   0   0   0
     0.5 0   0   0   0   0   0
     0.5 0   0   0   0   0   0
     0   1/3 0.6 0.4 0.5 0.3 0
     0   1/3 0   0.1 0.2 0   0
     0   1/3 0.4 0.3 0   0.3 0
     0   0   0   0.2 0.3 0.4 0];

%b)  7 dígitos iniciada por 91 e terminada em 9
%c)  7 dígitos iniciada por 91
N = 1e5;
a = cell(N,1);
for i = 1:N
    a(i) = {crawl(T, 1, 7)}; %Preencher cell array com sequências
end

lengths = cellfun('length' , a);
cont = 0;
cont2 = 0;
for i = 1:N
    b = a{i};
    if lengths(i) == 8 && b(2) == 2 && b(7) == 6  %length 8 porque estado 7 não conta
        %disp(b);  -> Confirmar seq correta
        cont = cont + 1;
    end
    if lengths(i) == 8 && b(2) == 2 
        %disp(b);
        cont2 = cont2 + 1;
    end
end

res = cont/N;
fprintf('A probabilidade de 7 dig iniciada por 91 e terminada em 9 é %f\n',res);
res2 = cont2/N;
fprintf('A probabilidade de 7 dig iniciada por 91 é %f\n',res2);

%CRAWL
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

function state = nextState(H, currentState)
    % find the probabilities of reaching all states starting at the current one:
    probVector = H(:,currentState)'; % probVector is a row vector
    n = length(probVector); %n is the number of states
    % generate the next state randomly according to probabilities probVector:
    state = discrete_rnd(1:n, probVector);
end

function state = discrete_rnd(states, probVector)
    U=rand();
    i = 1 + sum(U > cumsum(probVector));
    state= states(i);
end