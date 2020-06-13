function log=load_other(log)
     if isfield(log,'unit')==0
    log=get_file_gui();
    end
    
        
     prompt = "Enter the name for log";
    dlgtitle = "Log Name" ;
    
        %definput = {'others'};
    answer = inputdlg(prompt,dlgtitle); 
    list={};
    l=length(log.unit);
    for i=1:l 
        list=[list,log.unit(i,1)];
    end
    %importing Depth data    
        [indx,tf] = listdlg('ListString',list,"Name","Select Borehole Density Data");
        str=strcat("log.",answer{1},"=log.data(:,indx)");
        eval(str);

    
    f=msgbox(strcat(answer{1}, " data successful calculated and can be accessed as log.",answer{1}),"Success");
    
    log.other=[log.other,{answer{1}}];
    
end