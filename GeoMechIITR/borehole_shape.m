function borehole_shape(log)
    %this function is plotting tool which plots the borehole shape with depth
    Depth_log=log.Depth;
    if isfield(log,"BS")==0
        log=load_BS(log)
 
    end
    Radius_log=log.BS;
    %input parameter
    %Radius_log:1D array of radius variation with depth(in m). %
    % you can also generate a schematic borehole of a particulator radius   
    %Depth_log:1D array of Depth(in m) 
    
    l=length(Depth_log);
    if length(Radius_log)==1
        Radius_log=Radius_log*(ones(l,1));
    end
    
    [X,Y,Z]=cylinder(Radius_log);
    Z=Z*(-l*(Depth_log(2)-Depth_log(1)))-Depth_log(1);
    C=X.^2+Y.^2;

    surf(X,Y,Z,C,'EdgeColor',"none");
    %xlabel("Borehole(Inches)");
    %ylabel("Depth");
    %xlim([-10,10])
    %ylim([-10,10])
    %set(gcf,'Position',[10 10 500 1500])
    view(90,4)
    
end