function plot_dtco(dtco,depth,n)
    
    %set(gcf, 'Name', strcat('Select   ', string(n), '  points on Curve Corresponding to Normal Compaction Trend'), 'NumberTitle', 'Off');
    title(strcat('Select   ', string(n), '  points on Curve Corresponding to Normal Compaction Trend'));
    subplot(1,2,1)
    plot(dtco,depth,'-k')
    hold on;
    set(gca, 'XScale', 'log','XDir',"reverse");
    xlim([0.0001,0.001])
    
    xlabel("Sonic(s/m)") ;
    ylabel("Depth(m)");
    grid on;
    
    
    
    
        
     x0=10;
     y0=10;
    width=700;
    height=1200;
    set(gcf,'units','points','position',[x0,y0,width,height])
    
    
end