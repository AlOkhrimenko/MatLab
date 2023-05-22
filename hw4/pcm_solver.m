function [W, Ws, sg] = pcm_solver(XYZ, Q, P, N, S, e_in, e_ex)

    RD = r_dist(P, XYZ);
    M = pcm_matrix(P, N, S);
    kof = (e_in - e_ex) / (2 * pi * (e_in + e_ex));

    n = length(S(:, 1));
    m = length(Q(:, 1));
    
    T = zeros(n, m);
    for ii = 1:n
        for jj = 1:m
            T(ii, jj) = dot(P(ii, :) - XYZ(jj, :), N(ii, :)) * (RD(jj, ii) ^ 3);
        end
    end
    b = (kof / e_in) * (R * Q);

    A = eye(n) - kof / e_in * M;
    sg = A \ b;

    Ws = Q' * RD * (sg .* S);

    Wq = Q' * r_dist(XYZ, XYZ) * Q / 2;

    W = Ws + Wq;
end
    
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
