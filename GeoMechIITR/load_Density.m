function log=load_Density(log)
    if isfield(log,'unit')==0
    log=get_file_gui();
    end
    
    list={};
    l=length(log.unit);
    for i=1:l 
        list=[list,log.unit(i,1)];
    end
    %importing Depth data    
        [indx,tf] = listdlg('ListString',list,"Name","Select Borehole Density Data");
        log.Density=log.data(:,indx);
        disp("Density Data can now be accessed as log.Density");
        if strcmpi(log.unit{l+indx},'g/cm3')
            log.Density=1000*log.Density;
            log.unit{l+indx}='kg/m3';
        end
end