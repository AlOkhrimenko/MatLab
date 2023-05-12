function [DT, boundaryPoints, boundaryPoints_I] = DelTring(points_matrix)
    %delaunayTriangulation
    x = points_matrix(1,:)';
    y = points_matrix(2,:)';
    N = length(x);

    DT = delaunayTriangulation(x,y);
    
    fB = freeBoundary(DT);

    % plot 
    triplot(DT, 'color', 'red');
    hold on;
    plot(x(fB), y(fB), "Color",'blue');
    % finding the closest point to the x-axis
    [~, index_min] = min(abs(y(fB)));
    
    % cirkshift 
    boundaryPoints_I = circshift(fB(:,1), - index_min+1 );
    boundaryPoints = points_matrix(:, boundaryPoints_I);
end