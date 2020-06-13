function log=read_well_section(filename,log)
    log.section=readcell(filename);
    log.section=sortrows(log.section,'descend');
    y=log.section;
    len=length(y);
    options='auto';
    
    switch options
        case "auto"
            disp("Warning:Top section will be interpolated")
            for i=1:len-1
                y(i+1,1)=y(i,2);
            end
    
            case "manual"
    for i=1:len-1
        k1=cell2mat(y(i,2));
        k2=cell2mat(y(i+1,1));
        if k1>k2
        disp("Warning: You have missing lithology in between");
        disp("Please Select one of the option to fill the litholgy");
        disp(strcat("1:Top(",y(i,3),') Layer filling'));
        disp(strcat("2:Bottom(",y(i+1,3),') Layer filling'));
        prompt=strcat("Lithology Section from",string(y(i,2)),' to ',string(y(i+1,1)));
        x=input(prompt)
        switch x
            case 1
               y(i+1,1)=y(i,2);
            case 2 
                
               y(i,2)=y(i+1,1);
        end
        end
        
            
            
        
        if k1<k2
        disp("Warning: You have Overlapping lithology in between");
        disp("Please Select one of the options to fill the litholgy");
        disp(strcat("1:Top(",y(i,3),') Layer filling'));
        disp(strcat("2:Bottom(",y(i+1,3),') Layer filling'));
        prompt=strcat("Lithology Section from ",string(y(i+1,1)),' to ',string(y(i,2)));
        x=input(prompt)
        switch x
            case 1
               y(i+1,1)=y(i,2);
            case 2 
                
               y(i,2)=y(i+1,1);
        end  
        end
              
    end
    
    
    
    end
    log.section=y;
end