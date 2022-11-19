function [out] = Ex4(p,n,k,N)
lancamentos = rand(n,N) > p;
sucessos= sum(lancamentos)==k;
out= sum(sucessos)/N;
end

