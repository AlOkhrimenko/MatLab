function [W, Ws, sg] = cosmo_solver(XYZ, Q, P, S, e_in)

    % matrices of mutual distances between grid vertices
    R = r_dist(P, XYZ);
    SR = r_dist(P, P);
    QR = r_dist(XYZ, XYZ);

    sg = (SR .* S) \ (-1 / e_in * R' * Q);

    Ws = 1/2 * Q' * R * (sg .* S);

    W = Ws + (Q' * QR * Q / 2);

    end

    function d = dist(a, b)
        d = norm(a - b);
    end

    function rd = r_dist(A, B)
        n = size(A, 1);
        m = size(B, 1);
        rd = zeros(m, n);
        for ii = 1:m
            for jj = 1:n
                if ii ~= jj || dist(B(ii, :), A(jj, :)) ~= 0
                    rd(ii, jj) = 1 / (dist(B(ii, :), A(jj, :)));
                end
            end
        end
    end

