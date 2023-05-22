function pcm = pcm_matrix(P, N, S)
    R = r_dist(P);
    s = length(S);
    pcm = zeros(s, s);
    for ii = 1:s
        for jj = 1:s
            pcm(ii, jj) = dot((P(ii, :) - P(jj, :)), N(ii, :)) * S(jj) * (R(ii, jj) ^ 3);
        end
    end

    for ii = 1:s
        pcm(ii, ii) = 2 * pi - dot(pcm(:, ii), S) / S(ii);
    end

end

function d = dist(a, b)
    d = norm(a - b);
end
function rd = r_dist(A)
    m = size(A, 1);
    rd = zeros(m, m);
        for ii = 1:m-1
            for jj = ii+1:m
                rd(ii, jj) = 1 / dist(A(ii, :), A(jj, :));
                rd(jj, ii) = rd(ii, jj);
            end
        end
end
