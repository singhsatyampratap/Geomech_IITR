function logplot(log,log_type)
    
    s="log.";
    l=length(log_type);
    n_log=length(log.unit)
    for i=1:l
        subplot(1,l,i)
        switch log_type(i)
            
            case 'Density'
                 y=strcat(s,"Density");
                 plot(eval(y),-log.Depth,'-r')
                 grid on
                 txt=strcat('Density','(',log.unit{2+n_log},")")
                 title(txt);
                 
                 %xlim([2000,3000])
                 
                 
                 
                 
                 
                 
            case "dtco"
                 y=strcat(s,"dtco");
                 plot(eval(y),-log.Depth,'-k')
                 grid on
                 txt=strcat(log.unit{3},'(',log.unit{3+n_log},")");
                 title(txt);                 
                 
                 
            case "dtsm"
                 y=strcat(s,"dtsm");
                 plot(eval(y),-log.Depth,'-k') 
                 grid on
                 txt=strcat(log.unit{4},'(',log.unit{4+n_log},")")
                 title(txt);                 
                 
            case "GR"
                y=strcat(s,"GR");
                plot(eval(y),-log.Depth,'-g')
                grid on
                txt=strcat('GR','(',log.unit{5+n_log},")");
                title(txt);               
                
            case "Resistivity"
                y=strcat(s,"Resistivity");
                plot(eval(y),-log.Depth,"-b")   
                grid on
                txt=strcat(log.unit{6},'(',log.unit{6+n_log},")")
                title(txt) ;               
                
            case "SP"
                y=strcat(s,"SP");
                plot(eval(y),-log.Depth,'c')
                grid on
                txt=strcat('SP','(',log.unit{7+n_log},")");
                title(txt);                
                
                
            case "VP"
                y=strcat(s,"VP");
                plot(eval(y),-log.Depth,'-k')
                grid on
                txt=strcat(log.unit{8},'(',log.unit{8+n_log},")");
                title(txt) ;
                lim=mean(eval(y));
                xlim([lim-2000,lim+2000])
            
            case "borehole shape"
                borehole_shape(1.5,log.Depth,0.05)
                title("Borehole Shape")
                
                
                
        end
end
