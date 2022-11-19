function r = Analitico(p,n,k)
    r= nchoosek(n,k)*p^k*(1-p)^(n-k);
end

