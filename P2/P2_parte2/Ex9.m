m = 14;
desv = 2;
N = 1e5;

classificacoes = desv.*randn(1,N) + m;

% a)
sucessos = (classificacoes>12 & classificacoes<16);
p12a16 = sum(sucessos)/N;

% b)
sucessos = (classificacoes>10 & classificacoes<18);
p10a18 = sum(sucessos)/N;

% c)
sucessos = (classificacoes>=10);
p10 = sum(sucessos)/N;

% d)

%Como usar normcdf() ??
