S = 0:0.20:399;
S = sort([-sqrt(S), sqrt(S)]); % The sort() function, in the case of a one-dimensional array, sorts the elements of the array in ascending order
x = fresnelc(S);
y = fresnels(S);
figure; 
hold on; 
grid on; 
plot(x, y)