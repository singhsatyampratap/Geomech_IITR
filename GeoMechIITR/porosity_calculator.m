function log=porosity_calculator(log)
    
    
    
    log.Porosity=zeros(length(log.Depth),1);
    log.Fluid_Density=1000*ones(length(log.Depth),1);
    log.Fluid_dt=0.00071326676*ones(length(log.Depth),1);
    
    disp("To calculate Porosity you will need either density or dt log along with fluid density log");
    disp("Please select one f the options to calculate porosity log")
    disp("1: Use density" + ...
        "  2:Use dt");
    
    prompt="Select an option ?";
    opts=input(prompt);
    
    switch opts
        case 1
            disp("For Calculating porosity using desnity you will need density of matrix?");
            disp("Do you want different Lithology data for matrix density calculation?");
            disp("1:Yes");
            disp("2: No(I will use a single matrix density data for the complete log)");
            prompt="select an option";
            k=input(prompt);
            switch k
                case 1
                    disp("For option this you will need lithology data");
                    disp("Lithology data is .txt file which has following format");
                    disp("starting_depth,end_depth,lithology_type");
                    disp("e.g -100,-200,carbonate");
                    disp("    -200,-800,shale ");
                    disp("    Only three type of lithology is supported");
                    disp("You can either write it manually or use our standard interpretation library to generated text file");
                    prompt="1: Load File or 2: Create lithology file using standard interpretation library";
                    in=input(prompt);
                    switch in
                        case 1
                            prompt='Please enter the lithology data file ("loc/filename.txt")';
                            lith_file_loc=input(prompt);
                            log=read_litho_data(lith_file_loc,log)
                            a=[];
                            len_lithotype=length(log.litho);
                            for i=1:len_lithotype
                                a=[a, log.litho(i,3)];
                            end
                            a=unique(a);
                    
                        case 2
                            log=litho_divider(log,["GR"],'manual',"new_lith.txt");
                            prompt='Please enter the lithology data file ("loc/filename.txt")';
                            lith_file_loc=input(prompt);
                            log=read_litho_data(lith_file_loc,log)
                            a=[];
                            len_lithotype=length(log.litho);
                            for i=1:len_lithotype
                                a=[a, log.litho(i,3)];
                            end
                            a=unique(a);
                    end
                    len_a=length(a);
                    prompt = a;
                    dlgtitle = "Please Enter Matrix Desnity Value" ;
                    %dims = [1 35];
                    %definput = {'20','hsv'};
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
                    disp("Matrix Density Successfully Calculated"); 
                    log.Porosity=(matden-log.Density)./(matden-log.Fluid_Density);
                    disp("porsoity successfully calculated")
                
                case 2
                    prompt="Enter the matrix Density value";
                    matden=input(prompt);
                    matden=matden*ones(length(log.Depth),1);
                    log.Porosity=(matden-log.Density)./(matden-log.Fluid_Density);
                    disp("porosity Successfully Calculated");
            end
        
        case 2      %opts
            disp("For Calculating porosity using dt you will need matrix dt?");
            disp("Do you want different Lithology data for matrix density calculation?");
            disp("1:Yes");
            disp("2: No(I will use a single matrix density data for the complete log)");
            prompt="select an option";
            k=input(prompt);
            switch k
                case 1
                    disp("For option this you will need lithology data");
                    disp("Lithology data is .txt file which has following format");
                    disp("starting_depth,end_depth,lithology_type");
                    disp("e.g -100,-200,carbonate");
                    disp("    -200,-800,shale ");
                    disp("    Only three type of lithology is supported");
                    disp("You can either write it manually or use our standard interpretation library to generated text file");
                    prompt="1: Load File or 2: Create lithology file using standard interpretation library";
                    in=input(prompt);
                    switch in
                        case 1
                            prompt='Please enter the lithology data file ("loc/filename.txt")';
                            lith_file_loc=input(prompt);
                            log=read_litho_data(lith_file_loc,log)
                            a=[];
                            len_lithotype=length(log.litho);
                            for i=1:len_lithotype
                                a=[a, log.litho(i,3)];
                            end
                            a=unique(a);
                    
                        case 2
                            log=litho_divider(log,["GR"],'manual',"new_lith.txt");
                            prompt='Please enter the lithology data file ("loc/filename.txt")';
                            lith_file_loc=input(prompt);
                            log=read_litho_data(lith_file_loc,log)
                            a=[];
                            len_lithotype=length(log.litho);
                            for i=1:len_lithotype
                                a=[a, log.litho(i,3)];
                            end
                            a=unique(a);
                    end
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
                    disp("Matrix DT Successfully Calculated"); 
                    log.Porosity=(log.dtco-log.Fluid_dt)./(matdt-log.Fluid_dt);
                    disp("porosity Successfully Calculated");
                
                case 2
                    prompt="Enter the matrix DT value";
                    matdt=input(prompt);
                    
                    matdt=matdt*ones(length(log.Depth),1);
                    log.Porosity=(log.dtco-matdt)./(log.Fluid_dt-matdt);
                    disp("porosity Successfully Calculated");
            end            
            
                   
            
        
    
    
    end
end