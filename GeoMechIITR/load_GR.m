function log=load_GR(log)
    if isfield(log,'unit')==0
    log=get_file_gui();
    end
    
    list={};
    l=length(log.unit);
    for i=1:l 
        list=[list,log.unit(i,1)];
    end
   [indx,tf] = listdlg('ListString',list,"Name","Select GR Data");
   log.GR=log.data(:,indx);
   disp("GR Data can now be accessed as log.GR");

end