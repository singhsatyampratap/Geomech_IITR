function plot_Resisitivity(log)
    
     if isfield(log,'resname')==0
         log=load_Resisitivity(log);
    end
    
    
    list=log.resname;
    [indx,tf] = listdlg('ListString',list,"Name", ...
            "Select models for plotting");
         for i=1:length(indx)
           
           set(gca, 'XScale', 'log')
           semilogx(eval(list(indx(i))),-log.Depth,"DisplayName",list(indx(i)));
           legend 
           %xlim([0 1])
           hold on;
           grid on;
          end

    
    
    
    
    
    
end