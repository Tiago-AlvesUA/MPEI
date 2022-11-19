X = linspace(1,20,20);
for n=1:20
   Y(n) = Ex4(0.5,n,2,1e5);
end
stem(X,Y);