function log= load_Resisitivity(log)
    
    if isfield(log,'unit')==0
         log=get_file_gui();
    end
    
    list={};
    l=length(log.unit);
    for i=1:l 
        list=[list,log.unit(i,1)];
    end
    
    [indx,tf] = listdlg('ListString',list,"Name","Select Borehole Resistivity Data");
    resname={};
    
    for i=1:length(indx)
      a=strcat("log.",list(indx(i)));
      eval(strcat(a,'=log.data(:,indx(i))'));
      resname=[resname,a];  
        
        
        
    end
    
    log.resname=resname;
    
    
    
end

