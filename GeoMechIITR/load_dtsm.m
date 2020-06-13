function log=load_dtsm(log)
    if isfield(log,'unit')==0
    log=get_file_gui();
    end
    
    list={};
    l=length(log.unit);
    for i=1:l 
        list=[list,log.unit(i,1)];
    end
    
            [indx,tf] = listdlg('ListString',list,"Name","Select Borehole Shear Velocity Data");
            log.dtsm=log.data(:,indx);
            if strcmpi(log.unit{l+indx},'us/ft')
                converted_log.dtsm=log.dtsm/304800;
                converted_log.unit{l+indx}='s/m';
            end
    
            log.VS=1./log.dtsm;
            disp("dtsm Data can now be accessed as log.dtsm and Vs data as log.VS");

end