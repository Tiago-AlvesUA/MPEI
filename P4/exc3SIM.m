[users,Set] = createSet('u.data');  

distances = jaccardDistance(users,Set);
threshold = 0.4;
similarPairs = getSimilarities(users,distances,threshold);

%% Print results
N = length(similarPairs);
for k= 1:N
  fprintf("Distance: %f -> user 1: %d ; user 2: %d\n",similarPairs(k,3),similarPairs(k,1),similarPairs(k,2));
end