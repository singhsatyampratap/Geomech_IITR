function plot_dt(log)
    
    if isfield(log,'dtco')
        
        plot(log.dtco,-log.Depth,'-k')
    else
        log=load_dtco(log);
        plot(log.dtco,-log.Depth,'-k')
        
    end
    
    hold on;
    if isfield(log,'dtsm')
        
        plot(log.dtsm,-log.Depth,'-y')
    else
          %log=load_dtsm(log);
        %plot(log.dtsm,-log.Depth,'-k')
    end    
    
    legend "dtco" "dtsm"
    
   
    set(gca, 'XScale', 'log','XDir',"reverse");
    %xlim([0.0001,0.001])
    
    %xlabel("Sonic(s/m)") ;
    %ylabel("Depth(m)");
    grid on;
    %set(gcf,'Position',[10 10 500 1500])
    
end