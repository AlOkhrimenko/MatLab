X = [-pi/2:pi/999:pi/2]; % The extreme points are included in our vector. Then there are 998 points that need to be placed inside the segment. That is, a large segment will be divided by these points into 999 small segments of length pi/999
Y = ((sin(X.*0.1)./X) .* (sin(20.*X)./sin(X) )  ).^2;
figure; 
hold on;
grid on;
plot(X, Y)