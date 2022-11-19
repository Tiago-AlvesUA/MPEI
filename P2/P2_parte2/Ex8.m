m = 0.02;
%prob máx erro 1
pX = zeros(1,2);

for k = 0 : 1
    i = k+1;
    pX(i) = (m^k/factorial(k))*exp(-m);
end

p1Max = sum(pX);