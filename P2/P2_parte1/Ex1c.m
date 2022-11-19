p = 0.5;
N = 1e5;
n = 2;
filhos = rand(n,N) > p;
umfilho = sum(filhos)>=1;
doisfilhos = sum(filhos)==2;
% 2 acontecimentos
prob = sum(umfilho & doisfilhos)/sum(umfilho);
disp(prob);

