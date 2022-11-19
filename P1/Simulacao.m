function r = Simulacao(p,n,k,N)
    lancamentos = rand(n,N) < p; %Serve em casos em que pretendemos obter a parte de menor percentagem
    sucessos = sum(lancamentos)==k;
    r = sum(sucessos)/N;
end

