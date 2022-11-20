%% a
T = rand(20);
S = sum(T);
T = T./S; % Dividir cada elemento da coluna pela soma total da coluna para 
% obter uma probabilidade em que todas estas somadas darão 1;
disp(sum(T));

%% b
iteracoes = [2 5 10 100];
x = zeros(20,1);
x(1) = 1; %Começando estado 1
y = zeros(1,4);
for i = 1:length(iteracoes)
    z = T^iteracoes(i)*x;
    y(i) = z(20);
end

fprintf('Apos 2 iteracoes a prob de estar no estado 20 é %.5f \n', y(1));
fprintf('Apos 5 iteracoes a prob de estar no estado 20 é %.5f \n', y(2));
fprintf('Apos 10 iteracoes a prob de estar no estado 20 é %.5f \n', y(3));
fprintf('Apos 100 iteracoes a prob de estar no estado 20 é %.5f \n', y(4));