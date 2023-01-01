function SimilarUsers = getSimilarities(users,J,threshold)
    % Array para guardar pares similares (user1, user2, distaˆncia)
    Nu = length(users);
    SimilarUsers= zeros(1,3);
    k= 1;
    for n1= 1:Nu
        for n2= n1+1:Nu
            if J(n1,n2) < threshold
                %Guardar se distânca J fica abaixo do limiar
                SimilarUsers(k,:)= [users(n1) users(n2) J(n1,n2)];
                k= k+1;
            end
        end
    end
end

