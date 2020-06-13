function plot_stress(log)
    
    if isfield(log,"Sv") 
    plot(log.Sv,-log.Depth,"DisplayName","Overburden");
    hold on;
    end
    
    
    if isfield(log,"FP") 
    plot(log.FP,-log.Depth,"DisplayName","Frature Pressure")
    hold on;
    end
    
    
    if isfield(log,"PP") 
    plot(log.PP,-log.Depth,"DisplayName","Pore Pressure")
    hold on;
    end
    
    if isfield(log,"SHmax") 
    plot(log.SHmax,-log.Depth,"DisplayName","Maximum Horizontal Stress")
    hold on;
    end
    
    if isfield(log,"Shmin") 
    plot(log.Shmin,-log.Depth,"DisplayName","Minimum Horizontal Stress")
    hold on;
    end
    
    
    
    legend 
    grid on;
    set(gcf,'Position',[10 10 1000 1000])
    
    hold off;
end