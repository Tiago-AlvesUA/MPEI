%a) 
T = [0.7 0.2 0.1
     0.2 0.3 0.5
     0.3 0.3 0.4]';
%Invertemos para sum *das colunas* dar 1

%b)
% p(sol) * p(sol->sol) * p(sol->sol)

fprintf("b)")
res_b = 1*T(1,1)*T(1,1); 
disp(res_b)

%c)
x = [0.7 0.2 0]'; %(só queremos coluna começa em sol)
 %dá-nos as probabilidades tendo em conta que começamos em sol
w = T*x;
z = w/(0.7 + 0.2); %no segundo dia so pode estar sol ou nuvens
disp(z)
y = T*w;

% P(não chove 3|não chove 2) = P(n chove 2|n chove3) * P(n chove 2) / P(n
% chove 3)
fprintf("c)")
res_c = 1 * (w(1)+w(2)) * (y(1)+y(2));
disp(res_c)

% probsDia2 = T*x;
% probNaoChoveDia2 = probsDia2(1) + probsDia2(2);
% probsDia3 = T^2*x2;
% disp(probsDia3)

%d)
x = [1 0 0]';
fprintf('Qnd primeiro dia é sol no fim de Janeiro houve:\n');
somaSol = x(1);
somaNuvens = x(2);
somaChuva = x(3);
for i = 2:31
    x = T*x;
    somaSol = somaSol + x(1);
    somaNuvens = somaNuvens + x(2);
    somaChuva = somaChuva + x(3);
end
fprintf('%.2f dias de Sol\n %.2f dias de Nuvens\n %.2f dias de Chuva\n', somaSol,somaNuvens, somaChuva);
%f)
fprintf('A pessoa vai ter dores durante %.1f dias\n\n',somaSol * 0.1 + somaNuvens*0.3 + somaChuva*0.5);

%e)
x = [0 0 1]';
fprintf('Qnd primeiro dia é chuva no fim de Janeiro houve:\n');
somaSol = x(1);
somaNuvens = x(2);
somaChuva = x(3);
for i = 2:31
    x = T*x;
    somaSol = somaSol + x(1);
    somaNuvens = somaNuvens + x(2);
    somaChuva = somaChuva + x(3);
end
fprintf('%.2f dias de Sol\n %.2f dias de Nuvens\n %.2f dias de Chuva\n', somaSol,somaNuvens, somaChuva);
%f)
fprintf('A pessoa vai ter dores durante %.1f dias\n\n',somaSol * 0.1 + somaNuvens*0.3 + somaChuva*0.5);















