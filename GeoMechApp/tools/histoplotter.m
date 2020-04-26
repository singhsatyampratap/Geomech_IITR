function histoplotter(data,bin,xlab,plot_title)
    %This function plot the histogram of the data with specific formatting
    
    %input parameter
    %data:data vector
    %bin: no of the bins of histogram(int)
    %xlab:xaxis label(string)
    %plot_title:Depth at which the discrete data distribution is to be shown as " Distribution of xlab at Depth(plot_title)"
       
    
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
