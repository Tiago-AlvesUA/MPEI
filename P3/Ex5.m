%% a
T = [0.7 0.2 0.3
     0.2 0.3 0.3
     0.1 0.5 0.4];

%% b
prob = 1*T(1,1)*T(1,1);
fprintf("b) %f\n\n",prob);

%% c
x1 = [1 0 0]'; %Começa com sol
y2 = T*x1; %Probs dia 2 sendo que esteve sol no 1

x2 = [0.7 0.2 0]'; %Segundo dia sem chover tendo em conta que começou em sol
x2 = x2/sum(x2); %Para que soma das probs dê 1
y3 = T*x2; %Probs dia 3 sendo que não choveu no 2

prob = 1*(y2(1)+y(2))*(y3(1)+y3(2));
fprintf("c) %f\n\n",prob);

%% d
x = [1 0 0]';
countSol = x(1);
countNuvens = x(2);
countChuva = x(3);
for i = 2:31
    x = T*x;
    countSol = countSol + x(1);
    countNuvens = countNuvens + x(2);
    countChuva = countChuva + x(3);
end
fprintf('d) %.2f dias de Sol\n %.2f dias de Nuvens\n %.2f dias de Chuva\n',countSol,countNuvens,countChuva);
fprintf('f) Vai ter dores %.1f dias\n\n',0.1*countSol + 0.3*countNuvens + 0.5*countChuva);

%% e
x = [0 0 1]';
countSol = x(1);
countNuvens = x(2);
countChuva = x(3);
for i = 2:31
    x = T*x;
    countSol = countSol + x(1);
    countNuvens = countNuvens + x(2);
    countChuva = countChuva + x(3);
end
fprintf('e) %.2f dias Sol\n %.2f Nuvens\n %.2f Chuva\n',countSol,countNuvens,countChuva);
fprintf('f) Vai ter dores %.1f dias\n\n',0.1*countSol + 0.3*countNuvens + 0.5*countChuva);

%% f -> ACIMA na d) e e)