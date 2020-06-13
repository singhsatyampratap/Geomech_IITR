function main_plot(log)
    list=["lithology","GR","Borehole shape","Density","DT","Velocity","Stress","Resistivity","Well Section",log.other];
    [indx,tf] = listdlg('ListString',list,"Name","Select the plots you want to display");
    l=length(indx);
    %set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
    
    set(gcf,'Position',[10 10 l*300 2000])
    
    for i=1:l 
        subplot(1,l,i)
        %set(gca, 'Yticklabel', [])
    switch list(indx(i))
        case 'GR'
            plot_GR(log)
            title("GR(API)");
            
        case  'Borehole shape'
            borehole_shape(log);
            title("Borehole(inches)");
        case "lithology"
            plot_litho(log);
            title("Lithology");
            
        case "Well Section"
            plot_well_section(log);
            title("Well Section");
        case "DT"
            plot_dt(log);
            title("DT(s/m)");
        case "Resistivity"
            plot_Resistivity(log)
            title("Resistivity(ohmm)");
        case "Density"
            plot_Density(log)
            title("Density(kg/cm^3)");
        case "Velocity"
            plot_Velocity(log)
            title("Velocity(m/s)")
            
        case "Stress"
            plot_stress(log)
            title("Stress")
        %for i=1:length(log.other)
        case log.other
               st=strcat("Select the scale for plot",list(indx(i)));            
               an=questdlg(st,"Select","log","normal","normal");
               if strcmpi(an,"log")
                   set(gca, 'XScale', 'log')
               end
               str=strcat("log.",list(indx(i)));
               plot(eval(str),-log.Depth);
               grid on;
               title(list(indx(i)));
            
        %end
        
            
            
            
    end
    end
    sgt=sgtitle("GEOMECH IITR",'Color','red');
    sgt.FontSize = 20;
    
    
    
    
    
end