x = [-10:0.1:10];
y = [-10:0.1:10];
[xx, yy] = meshgrid(x,y);
I = besselj(1,(0.5.*sqrt(xx.^2+yy.^2))).^2./(xx.^2+yy.^2); % Honestly, I did not understand, according to the condition of the problem, what should be the argument of the Bessel function
figure; 
hold on;
grid on;
mesh(xx, yy, I)