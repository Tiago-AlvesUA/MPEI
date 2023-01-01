function J = jaccardDistance(users,Set)
    Nu = length(users);
    J=zeros(Nu); % array para guardar distancias
    h= waitbar(0,'Calculating');
    for n1 = 1:Nu
        waitbar(n1/Nu,h);
        for n2 = n1+1:Nu
            i = intersect(Set{n1},Set{n2});
            u = union(Set{n1},Set{n2});
            J(n1,n2) = 1 - (length(i) / length(u));
        end
    end
    delete (h)
end

