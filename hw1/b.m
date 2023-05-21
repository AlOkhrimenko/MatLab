A = rand(110);
d1 = sum(diag(A))

ii = 110:109:(110^2 - 1);
d2 = sum(A(ii)) % instead of the sum() function, you can implement it, as in the task above

jj = 1:111:110^2;
B = A;
B(ii) = A(jj); 
B(jj) = A(ii); 
B;

%kk = 1:10:110;
%ll = 1:10:110;
% C(kk,ll) = det(A(kk:kk+9, ll:ll+9)); This code didn't work, the indices weren't iterated inside the det() function, so the result was a matrix with elements equal to the very first one
for kk = 1:10:110
    for ll = 1:10:110
        C(kk,ll) = det(A(kk:kk+9, ll:ll+9));
    end
end
D = C(1:10:109, 1:10:109);
det(D) 
det(A)
det(A) == det(D)
% I thought for a long time how to fix this so as not to use loops, but nothing came to mind