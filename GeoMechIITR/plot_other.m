function plot_other(log)
    list=log.other;
    [indx,tf] = listdlg('ListString',list,"Name","Select the log to plot ",'SelectionMode','single');
    
    
    an=questdlg("Select the scale","Select","log","normal","normal");
    
    if strcmpi(an,"log")
        set(gca, 'XScale', 'log')
        
    end
    
    str=strcat("log.",list{indx});
    plot(eval(str),-log.Depth);
    grid on;
    title(list(indx));
    
end