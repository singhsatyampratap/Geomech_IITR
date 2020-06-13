function log=load_BS(log)
    if isfield(log,'unit')==0
    log=get_file_gui();
    end
    
    list={};
    l=length(log.unit);
    for i=1:l 
        list=[list,log.unit(i,1)];
    end
    [indx,tf] = listdlg('ListString',list,"Name","Select Borehole Shape Data");
    log.BS=log.data(:,indx);
    disp("Bore Shape Data can now be accessed as log.BS");

end