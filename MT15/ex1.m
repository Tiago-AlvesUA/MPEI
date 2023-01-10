% EX1
%a)
% Soma total da tabela de probs conjuntas tem de dar 1
b = 0;
PXY = [0.01 0.07 0.02
       0.04 b    0.08
       0.04 0.15 0.09
       0.01 0.20 0.01];
b = 1 - sum(sum(PXY));
fprintf('1a) Beta = %.4f\n\n',b);

%b)  Probs marginais (soma cada linha para o X, cada coluna para o Y)
% matriz anterior já com beta
% sum(A) -> colunas
% sum(A,2) -> linhas
PXY = [0.01 0.07 0.02
       0.04 b    0.08
       0.04 0.15 0.09
       0.01 0.20 0.01];

PX = sum(PXY,2);
PY = sum(PXY);

fprintf('1b) p_x\n');
disp(PX);
fprintf('1b) p_y\n');
disp(PY);

%c) Calcular média e variancia
% E[X] = Soma xi*px(xi)
% var(X) = E[X^2] - E^2[X]

X = [1 2 3 4];
Y = [0 2 3];

E_X = 0;
E_Y = 0;
E_X2 = 0;
E_Y2 = 0;
for i=1:length(PX)
    E_X = E_X + (X(i)*PX(i));
    E_X2 = E_X2 + (X(i)^2 * PX(i));
end
for i=1:length(PY)
    E_Y = E_Y + (Y(i)*PY(i));
    E_Y2 = E_Y2 + (Y(i)^2 * PY(i));
end
varX = E_X2 - E_X^2;
varY = E_Y2 - E_Y^2;
fprintf('1c) Media X: %.4f\n',E_X);
fprintf('1c) Media Y: %.4f\n',E_Y);
fprintf('1c) Var X: %.4f\n',varX);
fprintf('1c) Var Y: %.4f\n\n',varY);

%d) Variaveis X e Y independentes?
% Independentes se para todo x,y: p(x,y) = pX(x)*pY(y)
% 
% Also, outra forma para verificar:
% Cov(X,Y) = E[X,Y] - E[X]E[Y]
% Se Cov(X,Y) = 0 <=> E[X,Y] = E[X]E[Y]
% Logo quando Cov(X,Y) = 0 são independentes
% Covariância é estudada na alínea e)...

independentes = true;
for i = 1:length(X)
    for j = 1:length(Y)
        if PXY(i,j) ~= (PX(i)*PY(j))
            independentes = false;
            break;
        end
    end
end
if independentes
    disp('1d) Independentes')
    fprintf('\n')
else
    disp('1d) Nao independentes')
    fprintf('\n')
end

%e) Correlação, covariância e coeficiente de correlação entre X,Y
% Correlacao(X,Y) = E[X,Y]
% Cov(X,Y) = E[X,Y] - E[X]E[Y]

EXY = 0;
for i = 1:length(X)
    for j = 1:length(Y)
        EXY = EXY + (X(i)*Y(j)*PXY(i,j));
    end
end
covXY = EXY - E_X*E_Y;
fprintf('1e) Correlacao(X,Y): %.4f\n',EXY);
fprintf('1e) Cov(X,Y): %.4f\n',covXY);

% desvio padrao = raiz quadrada da variancia
% coef_corre(ro) = Cov(X,Y) / desvio_pad(X)*desvio_pad(Y)
ro = covXY/(sqrt(varX)*sqrt(varY));
fprintf('1e) Coeficiente correlacao: %.4f\n\n',ro);

%f)
% E[Y^2 sqrt(X+1)]
E_f = 0;
for i = 1:length(X)
    for j = 1:length(Y)
        E_f = E_f + Y(j)^2*sqrt(X(i)+1)*PXY(i,j);
    end
end
fprintf('1f) %.4f\n\n',E_f);





