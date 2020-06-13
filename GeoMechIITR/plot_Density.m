function plot_Density(log)
    
    
    if isfield(log,'Density')==0
         log=load_Density(log);
    end
    plot(log.Density,-log.Depth);
    grid on;
end