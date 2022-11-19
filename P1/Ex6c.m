res=zeros(5);
for k=0:5
   %res(k)=Simulacao(0.3,5,k,1e5); 
   res(k+1) = sum(sum(rand(5,1e5) < 0.3) == k)/1e5;
end
histogram(res,6);

