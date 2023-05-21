F = zeros(1,25);
vv = 0:1:24;
phi = (1+sqrt(5))/2;
F(vv+1) = round((phi.^vv - (phi).^(-vv))/(2*phi - 1)); % the round() function returns values rounded to the nearest integer
F(2) = 1;
F
% They asked not to use cycles, so I tried to implement it through vectorization