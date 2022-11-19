mValues = [200,500,1000,2000,5000,10000,20000,50000,100000];
n = 100;
N = 1e5;
prob = zeros(1,10);

for m = mValues
    experience = randi(m,n,N);
    successes = 0;
    for j = 1 : N
        if (length(unique(experience(:,j))) ~= n)
            successes = successes + 1;
        end
    end
    prob(m) = successes/N;
end

figure
plot(mValues,prob)
xlabel('alvos')
ylabel('P(m)')
drawnow