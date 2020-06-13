function log=calculate_porosity(log)
    
    
         if isfield(log,"litho")==0
                log=load_lithology(log);
            end
              a=[];
              len_lithotype=length(log.litho);
              for i=1:len_lithotype
                  a=[a, log.litho(i,3)];
              end
              a=unique(a);
            
    
    
    opts=questdlg("Select the log for calculating Porosity","Select","Sonic","Density","Density");
    switch opts
        case "Sonic"
            len_a=length(a);
                    prompt = a;
                    dlgtitle = "Please Enter Matrix DT Value" ;
                    %dims = [1 35];
                    %definput = {'20','hsv'};
                    answer = inputdlg(prompt,dlgtitle);
                    answer=answer';
                    for i=1:length(log.litho)
                        [~,indx1,indx2]=closest_point(-log.Depth, ...
                        [cell2mat(log.litho(i,1)),cell2mat(log.litho(i,2))]);
                    for j=1:len_a
                        if strcmpi(cell2mat(log.litho(i,3)),cell2mat(a(j)))
                            matdt(indx1:indx2)=str2double(answer(j));
                        end
                                                   
                     end
                      
                    end
       
            
            
            
            
            
            
            
            if isfield(log,'Fluid_DT')==0
                log=load_Fluid_DT(log);
            end
            log.Porosity=(log.dtco-matdt)./(log.Fluid_dt-matdt);
        
        
        
        case "Density"
            
            
            len_a=length(a);
            prompt = a;
            dlgtitle = "Please Enter Matrix Density Value" ;
            %dims = [1 35];
            % %definput = {'20','hsv'};
            answer = inputdlg(prompt,dlgtitle);
            answer=answer';
            for i=1:length(log.litho)
                [~,indx1,indx2]=closest_point(-log.Depth, ...
                    [cell2mat(log.litho(i,1)),cell2mat(log.litho(i,2))]);
                for j=1:len_a
                    if strcmpi(cell2mat(log.litho(i,3)),cell2mat(a(j)))
                        matden(indx1:indx2)=str2double(answer(j));
                    end
                end
            end
            
            
            
            
            
            if isfield(log,'Fluid_Density')==0
                log=load_Fluid_Density(log)
            end
            log.Porosity=(matden-log.Density)./(matden-log.Fluid_Density);
    
    
    log.other=[log.other,{"Porosity"}];
    
end