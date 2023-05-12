%% a
a = [1 2 3 4 5 6 7 8 9 10];
% first way
avg1 = mean(a);
deviation1 = std(a);
% second way
e = zeros(size(a)) + 1;
avg2 = (a * e')/10
deviation2 = sqrt((((a - avg2).^2 )*e')/9) % divide by n-1, not by n
% instead of a vector e, you can use the sum() function