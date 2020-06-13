function plot_PPres(Resistivity,depth,n)
    
    %set(gcf, 'Name', strcat('Select   ', string(n), '  points on Curve Corresponding to Normal Compaction Trend'), 'NumberTitle', 'Off');
    title(strcat('Select   ', string(n), '  points on Curve Corresponding to Normal Compaction Trend'));
    subplot(1,2,1)
    plot(Resistivity,depth,'-k')
    hold on;
    set(gca, 'XScale', 'log');
    %xlim([0.0001,0.001])
    
    xlabel("Resistvity(ohmm)") ;
    ylabel("Depth(m)");
    grid on;
    
    
    
    
        
     x0=10;
     y0=10;
    width=700;
    height=1200;
    set(gcf,'units','points','position',[x0,y0,width,height])
    
    
end