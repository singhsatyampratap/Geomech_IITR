function log=create_litho_file(log)
     
    
    prompt = "File Name";
   dlgtitle = "Enter File name for saving lithology data";
   dims = [1 70];
   definput = {'lithology.txt'};
   answer = inputdlg(prompt,dlgtitle,dims,definput);
   filename=answer{1};
    options=1;
    
    %set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 2]);
    list=['GR','Density','DT',"Velocity","Resistivity",log.other];
    [indx,tf] = listdlg('ListString',list,"Name","Select the plots you want to display");
    l=length(indx);
    %set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
    set(gcf,'OuterPosition',[10 10 (l+1)*500 2000]);
    
    subplot(1,l+1,1)
    plot_Vsh(log);
    
    
    for i=1:l 
        subplot(1,l+1,i+1)
        set(gca, 'Yticklabel', [])
    switch list(indx(i))
        case 'GR'
            plot_GR(log)
            title("GR(API)");

        case "DT"
            plot_dt(log);
            title("DT(s/m");
        case "Resistivity"
            plot_Resistivity(log)
            title("Reisitivity(ohmm");
        case "Density"
            plot_Density(log)
            title("Density(kg/cm^3)");
        case "Velocity"
            plot_Velocity(log)
            title("Velocity(m/s)")
         
        case log.other
            plot_other(log);
    
            
    end
    end
    
    n_log=l;
    litho={}
    k=[0,1,1,0];
    
    %lithotype=["Carbonate",'Shale','Sandstone'];
    %log.litho.Shale=[0,0];
    %log.litho.Sandstone=[0,0]
    %n_litho_type=length(lithotype);
    
    opts="Yes";
    while strcmpi(opts,"Yes")
        
        answer = inputdlg('Enter the lithology type/formation name','lithology', [1 50],"BH Shale")
        c=uisetcolor;
        button="Continue";
        while (strcmpi(button,"Continue"));
              
             promptMessage = sprintf('Click two points,\nor Cancel to Save Selection?'); 
             titleBarCaption = strcat('Select ',answer{1},' section');
             button = questdlg(promptMessage, titleBarCaption, 'Continue', 'Cancel', 'Continue');
                          
             if strcmpi(button, 'Cancel')
                 break;
             end

             y=select_well_section(options);
              
             
             y=closest_point(-log.Depth,y);
             

             
             
             
             litho=[litho;{y(1,1),y(1,2),answer{1}}];
             subplot(1,l+1,1)
             %hold on
             %plot(y(1,1)*ones(1,150),"-r");
             %hold on
             %plot(y(1,2)*ones(1,150),"-r");
             hold on
             fill(k,[y(1,1),y(1,1),y(1,2),y(1,2)],c,"FaceAlpha",0.5,'DisplayName',answer{1});
            end
        
            opts=questdlg("Do you want to add another lithology","Another Lithology","Yes","No","No");
            
            if strcmpi(opts,"No")
                break;
            end
    end
         writecell(litho,filename);
        
    end
    