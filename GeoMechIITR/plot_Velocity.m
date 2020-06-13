function plot_Velocity(log)
    
    if isfield(log,'VP')
        
        plot(log.VP,-log.Depth,'-k')
    else
        log=load_dtco(log);
        plot(log.VP,-log.Depth,'-k')
        
    end
    
    hold on;
    if isfield(log,'dtsm')
        
        plot(log.VS,-log.Depth,'-y')
    else
          log=load_dtsm(log);
        plot(log.VS,-log.Depth,'-k')
    end    
    
    legend "VP" "VS"
    hold off;
    