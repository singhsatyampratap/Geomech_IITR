function plot_GR(log)
    
    if isfield(log,"GR")==0
        log=load_GR(log);
    end
        line(log.GR,-log.Depth,'Color','k',"DisplayName",'GR');
        ax1 = gca; % current axes
        %ax1.XColor = 'k';
        %ax1.YColor = 'k';
        ax1_pos = ax1.Position; % position of first axes
        %set(gcf,'Position',[10 10 500 1500])
        grid on
       opt=questdlg("Do you want to plot Vsh?","Select","Yes","No","Yes");
       if strcmpi(opt,"Yes")
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
       
       
       
          ax2 = axes('Position',ax1_pos,'Color','none');  
          set(gca, 'Yticklabel', [],'Xticklabel',[])
          for i=1:length(indx)
           str=strcat("log."+list(indx(i)));
           
           line(eval(str),-log.Depth,"Color",c{i},"DisplayName",list(i));
           legend 
           xlim([0 1])
           hold on;
          end
          
       end
       %opt=questdlg("Do you want to plot Lithology Also?","Select","Yes","No","Yes");
       %if strcmpi(opt,"Yes")
        %   plot_litho(log);
        %   ax2 = axes('Position',ax1_pos,'Color','none'); 
        %   hold on;
       %end

   
        
    
end