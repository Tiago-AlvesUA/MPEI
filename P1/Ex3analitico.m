p = 0.5;
k = 6;
n = 15;
prob = zeros(1,6);
for i = 1 : 6
    prob(i) = nchoosek(n,i-1)*p^(i-1)*(1-p)^(n-(i-1));
end
prob6ouMais = 1 - sum(prob);