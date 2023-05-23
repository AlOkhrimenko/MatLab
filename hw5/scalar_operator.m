function D = scalar_operator(nx, hx, ny, hy, nn, lambda)


nn = sparse(1:length(nn), 1:length(nn), nn);
L = Laplasian_2D(nx,hx, ny, hy);
D = L + (2*pi/lambda)^2*(nn.^2);
end

function L = Laplasian_2D(n_x, h_x, n_y, h_y)
    L = sparse(n_x * n_y, n_x * n_y);
    for ii = 1:n_x
        for jj = 1:n_y
            L(n_y*(jj-1)+ii, n_y*(jj-1)+ii) = -2*(1/h_x^2 + 1/h_y^2);
            if ii > 1
                L(n_y*(jj-1)+ii, n_y*(jj-1)+ii-1) = 1/h_x^2;
            end
            if ii < n_x
                L(n_y*(jj-1)+ii, n_y*(jj-1)+ii+1) = 1/h_x^2;
            end
            if jj > 1
                L(n_y*(jj-1)+ii, n_y*(jj-2)+ii) = 1/h_y^2;
            end
            if jj < n_y
                L(n_y*(jj-1)+ii, n_y*jj+ii) = 1/h_y^2;
            end
        end
    end
end

