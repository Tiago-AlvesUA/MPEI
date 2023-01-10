T = [0.84 0.1 0   0.5
     0.1  0.7 0   0.1 
     0.05 0.1 0.8 0.1
     0.01 0.1 0.2 0.3];

%a)
total = 1+2+10+5;

x0 = [1 2 10 5]'./total;

%b)
xMax = x0;
eps = 1e-8;
xn = x0;
iter=1;

while 1
    xOld = xn;
    xn = T^iter*x0;

    % substitui valores Max quando são mais pequenos que a iteracao
    % seguinte
    xMax(xMax<xn) = xn(xn>xMax);
    % quando a diferença em rel à iteracao anterior for menor que 1e-8
    % (estado estacionário)
    if(max(abs(xn-xOld)) < eps)
      break;
    end
        
    iter = iter + 1;
end

toneladasMax = xMax.*total;

%c) Dinamarca com menos de 2 milhoes
xn = x0;
iter = 1;

while 1
    xn = T^iter*x0;

    if (xn(4)*total<2)
        break;
    end
    iter = iter + 1;
end

year = 2014;
day = iter;
[yy mm dd] = datevec(datenum(year,1,day));





