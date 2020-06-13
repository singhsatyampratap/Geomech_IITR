function log=load_dtco(log)
    if isfield(log,'unit')==0
    log=get_file_gui();
    end
    
    list={};
    l=length(log.unit);
    for i=1:l 
        list=[list,log.unit(i,1)];
    end
    %importing Depth data    
        [indx,tf] = listdlg('ListString',list,"Name","Select Borehole DT Data");
        log.dtco=log.data(:,indx);
        
        disp("dt Data can now be accessed as log.dtco and Vp data as log.VP");
        if strcmpi(log.unit{l+indx},'us/ft')
        log.dtco=log.dtco/304800;
        log.unit{l+indx}='s/m';
        end
        log.VP=1./log.dtco;
end