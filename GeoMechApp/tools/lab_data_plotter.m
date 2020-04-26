function lab_data_plotter(x,y,xlab,ylab,plot_title)
    %this function plot the various discrete lab measure data
    
    %input parameter
    %x: xdata vector
    %y: ydata vector
    %xlab: xaxis label
    %ylab: yaxis label
    %plot_title: title of the plot  
    plot(x,y,"k^",'LineWidth',1)
    title(plot_title)
    xlabel(xlab)
    ylabel(ylab)
    grid on
    
end
