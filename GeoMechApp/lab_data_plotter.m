function lab_data_plotter(x,y,xlab,ylab,plot_title)
    
    plot(x,y,"k^",'LineWidth',1)
    title(plot_title)
    xlabel(xlab)
    ylabel(ylab)
    grid on
    
end
