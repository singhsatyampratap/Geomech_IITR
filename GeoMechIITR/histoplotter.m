function histoplotter(log)
    
    
    options=1;
    list=["GR","Density","DTCO","DTSM","VP","VS",log.other];
    [indx,tf] = listdlg('ListString',list,"Name","Select the plot you want to display","SelectionMode","single");
    l=length(indx);
    %set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
    
    set(gcf,'Position',[10 10 800 2000])
    
     
        
        %set(gca, 'Yticklabel', [])
    switch list(indx)
        case 'GR'
            subplot(1,2,1)
            plot_GR(log)
            title("GR(API)");
            prompt = {'bin'};
            dlgtitle = 'Enter the # of Bins';
            dims = [1 35];
            definput = {'50'};
            answer = inputdlg(prompt,dlgtitle,dims,definput);
            bin=str2num(answer{1});
            
             promptMessage = sprintf('Click two points,\nor Cancel to Save Section?'); 
             titleBarCaption = "Select";
             button = questdlg(promptMessage, titleBarCaption, 'Continue', 'Cancel', 'Continue');
            
            
            
            y=select_well_section(options);
            [~,indx1,indx2]=closest_point(-log.Depth,y);
            
            data=log.GR(indx1:indx2);
            pos2 = [0.6 0.35 0.35 0.35];
            subplot('Position',pos2)
           
            histogram(data,bin);
            

      
        case "DT"
            subplot(1,2,1)
            plot_dt(log);
            title("DT(s/m");
            prompt = {'bin'};
            dlgtitle = 'Enter the # of Bins';
            dims = [1 35];
            definput = {'50'};
            answer = inputdlg(prompt,dlgtitle,dims,definput);
            bin=str2num(answer{1});
            
             promptMessage = sprintf('Click two points to Save Section?'); 
             titleBarCaption = "Select";
             button = questdlg(promptMessage, titleBarCaption, 'Continue', 'Cancel', 'Continue');
            
            
            
            y=select_well_section(options);
            [~,indx1,indx2]=closest_point(-log.Depth,y);
            
            data=log.dtco(indx1:indx2);
            pos2 = [0.6 0.35 0.35 0.35];
            subplot('Position',pos2)
           
            histogram(data,bin);
            
            

        case "Density"
            subplot(1,2,1)
            plot_Density(log)
            title("Density(kg/cm^3)");
            prompt = {'bin'};
            dlgtitle = 'Enter the # of Bins';
            dims = [1 35];
            definput = {'50'};
            answer = inputdlg(prompt,dlgtitle,dims,definput);
            bin=str2num(answer{1});
            
             promptMessage = sprintf('Click two points to Save Selection?'); 
             titleBarCaption = "Select";
             button = questdlg(promptMessage, titleBarCaption, 'Continue', 'Cancel', 'Continue');
            
            
            
            y=select_well_section(options);
            [~,indx1,indx2]=closest_point(-log.Depth,y);
            
            data=log.Density(indx1:indx2);
            pos2 = [0.6 0.35 0.35 0.35];
            subplot('Position',pos2)
           
            histogram(data,bin);
            
            
            
        case "VP"
            subplot(1,2,1)
            plot_Velocity(log)
            title("Velocity(m/s)")
                       
            prompt = {'bin'};
            dlgtitle = 'Enter the # of Bins';
            dims = [1 35];
            definput = {'50'};
            answer = inputdlg(prompt,dlgtitle,dims,definput);
            bin=str2num(answer{1});
            
             promptMessage = sprintf('Click two points to Save Selection?'); 
             titleBarCaption = "Select";
             button = questdlg(promptMessage, titleBarCaption, 'Continue', 'Cancel', 'Continue');
            
            
            
            y=select_well_section(options);
            [~,indx1,indx2]=closest_point(-log.Depth,y);
            
            data=log.VP(indx1:indx2);
            pos2 = [0.6 0.35 0.35 0.35];
            subplot('Position',pos2)
           
            histogram(data,bin);
            
            case "VS"
            subplot(1,2,1)
            plot_Velocity(log)
            title("Velocity(m/s)")
                        
            prompt = {'bin'};
            dlgtitle = 'Enter the # of Bins';
            dims = [1 35];
            definput = {'50'};
            answer = inputdlg(prompt,dlgtitle,dims,definput);
            bin=str2num(answer{1});
            
             promptMessage = sprintf('Click two points to Save Selection?'); 
             titleBarCaption = "Select";
             button = questdlg(promptMessage, titleBarCaption, 'Continue', 'Cancel', 'Continue');
            
            
            
            y=select_well_section(options);
            [~,indx1,indx2]=closest_point(-log.Depth,y);
            
            data=log.VS(indx1:indx2);
            pos2 = [0.6 0.35 0.35 0.35];
            subplot('Position',pos2)
           
            histogram(data,bin);
            
            
            
            
            
            
            
            
            
        %for i=1:length(log.other)
        case log.other
               subplot(1,2,1) 
               st=strcat("Select the scale for plot",list(indx));            
               an=questdlg(st,"Select","log","normal","normal");
               if strcmpi(an,"log")
                   set(gca, 'XScale', 'log')
               end
               str=strcat("log.",list(indx));
               plot(eval(str),-log.Depth);
               grid on;
               title(list(indx));
               
               
            prompt = {'bin'};
            dlgtitle = 'Enter the # of Bins';
            dims = [1 35];
            definput = {'50'};
            answer = inputdlg(prompt,dlgtitle,dims,definput);
            bin=str2num(answer{1});
            
             promptMessage = sprintf('Click two points to Save Selection?'); 
             titleBarCaption = "Select";
             button = questdlg(promptMessage, titleBarCaption, 'Continue', 'Cancel', 'Continue');
            
            
            
            y=select_well_section(options);
            [~,indx1,indx2]=closest_point(-log.Depth,y);
            
            eval(strcat("data=log.",list(indx),"(indx1:indx2);"));
            pos2 = [0.6 0.35 0.35 0.35];
            subplot('Position',pos2)
           
            histogram(data,bin);
            
               
               
               
            
        %end
        
            
            
            
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    m=string(mean(data));
    sd=string(std(data));
    xlabel(list(indx));
    ylabel("Frequency")
    depthstring=strcat(num2str(log.Depth(indx1)),"m to ",num2str(log.Depth(indx2)),'m');
    
    tit1=strcat("Distribution of ",list(indx)," from " + depthstring);
    tit2 = strcat('\mu:=',num2str(m),"+/- \sigma=",num2str(sd));
    title({tit1,tit2});
    %dim = [.6 .4 .3 .3];
    
    %annotation('textbox',dim,'String',str,'FitBoxToText','on');
    ax = gca;
    ax.TitleFontSizeMultiplier = 1;
    
    
end