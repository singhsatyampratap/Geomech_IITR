function log=load_Depth(log)
    if isfield(log,'unit')==0
    log=get_file_gui();
    end
    
    list={};
    l=length(log.unit);
    for i=1:l 
        list=[list,log.unit(i,1)];
    end
    %importing Depth data    
    [indx,tf] = listdlg('ListString',list,"Name","Select Borehole Depth Data");
    log.Depth=log.data(:,indx);
    disp("Depth Data can now be accessed as log.Depth");
    if strcmpi(log.unit{l+indx},'ft')
        log.Depth=0.3048*log.Depth;
        log.unit{l+indx}='m';
    end
    
end