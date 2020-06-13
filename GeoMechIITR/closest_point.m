
function [y,index1,index2]=closest_point(Depth,Sel_Depth)
    
    % Find the point closest to the first clicked point.
distances = sqrt((Depth - Sel_Depth(1,1)) .^ 2);
[~, index1] = min(distances);
distances = sqrt((Depth - Sel_Depth(1,2)) .^ 2);
[~, index2] = min(distances);

 y=[Depth(index1),Depth(index2)] ;
end