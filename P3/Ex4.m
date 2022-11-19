%a)
%        A      B    C     D
T = [  0.16   0.36  0.24  0.24
        0      0     0     1
        0      0     0     1
       0.36   0.24  0.24  0.16];


%b)
x = [1 0 0 0]'; %Pega só na 1ª linha pq começa no estado A
iteracoes = [5 10 100 200];
y = zeros(1,4);
for i = 1:length(iteracoes)
    y = T^iteracoes(i) * x; %Devolve ao fim de n interações a prob de estar no estado A, B, C e D
    fprintf('Para %d iteracoes a prob de estar em A é %.8f, em B é %.8f, em C é %.8f e em D é %.8f\n',iteracoes(i),y)
end

%c) EPA SEI LA ISTO
M = [T - eye(4); ones(1,4)]; % eye() -> matriz identidade
x = [zeros(4,1); 1];
c = M\x;




