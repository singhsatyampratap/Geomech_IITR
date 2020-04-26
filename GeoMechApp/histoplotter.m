function histoplotter(data,bin,xlab,plot_title)
    histogram(data,bin)
    m=string(mean(data));
    sd=string(std(data));
    xlabel(xlab)
    ylabel("Frequency")
    tit="Distribution of " +xlab+" at " + plot_title;
    title(tit)
    dim = [.6 .5 .3 .3];
    str = 'Mean: '+m+"+/-"+sd;
    annotation('textbox',dim,'String',str,'FitBoxToText','on');
    
    
    
end