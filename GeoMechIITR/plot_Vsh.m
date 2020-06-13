function plot_Vsh(log)
    
      
     log=GR_Vsh(log);
    
    
     list=[];
        c={};
        if isfield(log,"Vsh") 
            list=[list,"Vsh"];
            c=[c,'r'];
        end
        if isfield(log,"Vsh_Larionov_old") 
            list=[list,"Vsh_Larionov_old"];
            c=[c,'y'];
        end
        if isfield(log,"Vsh_Clavier") 
            list=[list,"Vsh_Clavier"];
            c=[c,'b'];
        end
        if isfield(log,"Vsh_Steiber") 
            list=[list,"Vsh_Steiber"];
            c=[c,'m'];
        end
        if isfield(log,"Vsh_Larionov_tertiary") 
            list=[list,"Vsh_Larionov_tertiary"];
            c=[c,'y'];
        end
        [indx,tf] = listdlg('ListString',list,"Name", ...
            "Select models for plotting");
       
       
       
          %ax2 = axes('Position',ax1_pos,'Color','none');  
          set(gca, 'Yticklabel', [])
          for i=1:length(indx)
           str=strcat("log."+list(indx(i)));
           
           line(eval(str),-log.Depth,"Color",c{i},"DisplayName",list(i));
           legend 
           xlim([0 1])
           hold on;
          end
    grid on;
    
    
end