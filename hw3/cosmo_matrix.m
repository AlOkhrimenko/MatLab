function cosmo = cosmo_matrix(P, S)
    n = size(P, 1);
    cosmo = zeros(n);
    for ii = 1:n
        for jj = 1:n
            if ii == jj
                cosmo(ii, jj) = 2 * sqrt(pi * S(jj));
            else
                cosmo(ii, jj) = S(jj) / dist(P(ii, :), P(jj, :));
            end
        end
    end
end

function d = dist(a, b)
    d = norm(a - b);
end
