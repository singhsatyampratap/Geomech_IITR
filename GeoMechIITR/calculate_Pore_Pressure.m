function log=calculate_Pore_Pressure(log)
        %This Function calculates the pore pressure log 
    
    %input parameter
    %Depthlog: Depthlog array(in m)
    %log.Fluid_Density: fluid density array or a constant value(kg/m3)
    %g: acceleration due to gravity(in m/s2)
    %type: hydrostatic or overpressure
    
    %Sv: Overburden Stress
    
    %Output parameter
    %PP: pore pressure array(in Pa)
    list={};
l=length(log.unit);
for i=1:l 
    list=[list,log.unit(i,1)];
end

    
    if isfield(log,'Sv')==0
        
            %prompt = {'Average Litho Density(Above Starting Depth) ','g'};
            %dlgtitle = 'Overburden Stress Calculation';
            %dims = [1 35];
            %definput = {'2700','9.8'};
            %answer = inputdlg(prompt,dlgtitle,dims,definput);
            %a=str2num(answer{1});
            %b=str2num(answer{2});
        
        log=calculate_SV(log);
    
        
    end
    Sv=log.Sv;
    
    if isfield(log,"Fluid_Density")==0
        log=load_Fluid_Density(log);
    end
        
    
    
    
    
    
    
    
    len=length(log.Depth);
    %disp("Have you already computed Sv?")
     %prompt="1:Yes 2:No";
     %sv_bool=input(prompt);
     %sv_bool=questdlg("Have You already Computed","Sv Calculator","Yes","No","Yes"); 
     %if strcpmi(sv_bool,"Yes")
     %    Sv=log.Sv;
     %else
     %     Sv=Sv_calculator(log.Density,log.Depth,2700,9.8,'a');
      %end
    
    PP=(log.Fluid_Density).*log.Depth*log.g;
    if length(log.Fluid_Density)==1
        log.Fluid_Density=log.Fluid_Density*ones(length(log.Depth),1);
    end
    type=questdlg("Please Select type of Pore Pressure Analysis","Pore Pressure Type","Hydrostatic","Overpressure","Hydrostatic");
    if strcmpi(type,"Hydrostatic")
    PP=(log.Fluid_Density).*log.Depth*log.g;
    
    else
    
    %disp("Please select the log type for Pore Pressure Prediction");
    %disp("1:Sonic");
    %disp("2:Resistvity");
    %prompt="Select the number corresponding your option:";
    %log_type=input(prompt);
    
    log_type=questdlg("Please select the log type for Pore Pressure Prediction","Select log Type","Sonic","Resistivity","Sonic");
    
    switch log_type
        case "Sonic"
            
            if isfield(log,'dtco')==0
                log=load_dtco(log);
    
            end
            
            
            
            method=questdlg("Please select one of the following Method for", ...
                "Method","Equivalent Depth Method","Ratio Method","Eaton's Method","Eaton's Method");
            %disp("Please Select one of the following Method for");
            %disp("1: Equivalent Depth Method");
            %disp("2: Ratio method");
            %disp("3: Eaton's Method");
            %prompt="Select the number corresponding your Selection";
            %method=input(prompt);
            switch method
                case "Equivalent Depth Method"
                    ty="Try once again";
                    while strcmpi(ty,"Try once again")==1
                    
                        %disp("Please select no of points for computing NCT  ")
                        %disp("n should be atleast 6")
                        %prompt="n?";
                        %n=input(prompt);
                        %n;
                        prompt = {'n'};
                        dlgtitle = '# of Point for Fiiting Curve ';
                        dims = [1 35];
                        definput = {'6'};
                        answer = inputdlg(prompt,dlgtitle,dims,definput);
                        n=str2num(answer{1});
                                
                   
                    plot_dtco(log.dtco,-log.Depth,n);
                    
                    [x,y]=select_points(n);
                    %[~,index1,index2]=closest_point(-log.Depth,y)
                    %x=log.dtco(index1:index2);
                    %y=-log.Depth(index1:index2);
                    data=linear_fit(x,y,log.Depth);
                    hold on
                    plot(data,-log.Depth);
                    set(gca, 'XScale', 'log');
                    f=msgbox("Please Select the Depth where overpressure starts");
                    uiwait(f);

                    [~,y1]=select_points(1);
                   [~ ,index1,~]=closest_point(-log.Depth,[y1,y1]);
                
                   for i=index1:len 
                   PP(i)=PP(index1)+(Sv(i)-Sv(index1));
                   end
                  subplot(1,2,2)
                  plot(PP,-log.Depth,'-k');

    
                  xlabel("Pore Pressure") ;
                  ylabel("Depth(m)");  
                  %disp("1: Try once again?");
                  %disp("2: Save");
                  %prompt="Select a options?"
                  %ty=input(prompt);
                  ty=questdlg("Select an Options","Select","Try once again", ...
                      "Save","Save");
                  
                    end
                    
                    
                    
                    
                case "Ratio Method"
                     ty="Try once again";
                    while strcmpi(ty,"Try once again")==1
                    
                        %disp("Please select no of points for computing NCT  ")
                        %disp("n should be atleast 6")
                        %prompt="n?";
                        %n=input(prompt);
                        %n;
                        prompt = {'n'};
                        dlgtitle = '# of Point for Fiiting Curve ';
                        dims = [1 35];
                        definput = {'6'};
                        answer = inputdlg(prompt,dlgtitle,dims,definput);
                        n=str2num(answer{1});
                                
                   
                    plot_dtco(log.dtco,-log.Depth,n);
                    
                    [x,y]=select_points(n);
                    %[~,index1,index2]=closest_point(-log.Depth,y)
                    %x=log.dtco(index1:index2);
                    %y=-log.Depth(index1:index2);
                    data=linear_fit(x,y,log.Depth);
                    hold on
                    plot(data,-log.Depth);
                    set(gca, 'XScale', 'log');
                    f=msgbox("Please Select the Depth where overpressure starts");
                    uiwait(f);
                    
                    [~,y1]=select_points(1);
                   [~ ,index1,~]=closest_point(-log.Depth,[y1,y1]);
                   
                   
                  for i=index1:len 
                   PP(i)=PP(i)*(log.dtco(i)/data(i));
                  end
                  
                  smooth_bool=questdlg("Do want to smooth data?","Select","Yes", ...
                      "Yes","No");
                  %disp("Do want to smooth data?");
                  %prompt="1:Yes 2:No";
                  %smooth_bool=input(prompt); 
                  if strcmpi(smooth_bool,'Yes')==1
                                           
                      PP=smoothdata(PP,"gaussian",50)
                  end
                  
                  
                  
                  subplot(1,2,2)
                  plot(PP,-log.Depth,'-k')

    
                  xlabel("Pore Pressure") ;
                  ylabel("Depth(m)");  
                  ty=questdlg("Select an Options","Select","Try once again", ...
                      "Save","Save");
                    end
                    
                    
               case "Eaton's Method"
                     ty="Try once again";
                    while strcmpi(ty,"Try once again")==1
                    
                        %disp("Please select no of points for computing NCT  ")
                        %disp("n should be atleast 6")
                        %prompt="n?";
                        %n=input(prompt);
                        %n;
                        prompt = {'n'};
                        dlgtitle = '# of Point for Fiiting Curve ';
                        dims = [1 35];
                        definput = {'6'};
                        answer = inputdlg(prompt,dlgtitle,dims,definput);
                        n=str2num(answer{1});
                                
                   
                   
                    plot_dtco(log.dtco,-log.Depth,n);
                    
                    [x,y]=select_points(n);
                    %[~,index1,index2]=closest_point(-log.Depth,y)
                    %x=log.dtco(index1:index2);
                    %y=-log.Depth(index1:index2);
                    data=linear_fit(x,y,log.Depth);
                    hold on
                    plot(data,-log.Depth);
                    set(gca, 'XScale', 'log');
                    f=msgbox("Please Select the Depth where overpressure starts");
                    uiwait(f);
                    [~,y1]=select_points(1)
                   [~ ,index1,~]=closest_point(-log.Depth,[y1,y1]);
                   
                   
                  % 
                  % PP(i)=PP(i)*(log.dtco(i)/data(i));
                  %
                  pans=inputdlg("n","Eaton's Coeffiecient",dims,{'3'})
                  p=str2num(pans{1})
                  for i=index1:len
                  PP(i)=Sv(i)-(Sv(i)-PP(i))*((data(i)/log.dtco(i))^p);
                  end
                  smooth_bool=questdlg("Do want to smooth data?","Select","Yes", ...
                      "Yes","No");
                  %disp("Do want to smooth data?");
                  %prompt="1:Yes 2:No";
                  %smooth_bool=input(prompt); 
                  if strcmpi(smooth_bool,'Yes')==1
                                           
                      PP=smoothdata(PP,"gaussian",50);
                  end
                  
                  
                  
                  subplot(1,2,2)
                  plot(PP,-log.Depth,'-k')

    
                  xlabel("Pore Pressure") ;
                  ylabel("Depth(m)");  
                  ty=questdlg("Select an Options","Select","Try once again", ...
                      "Save","Save");
                    end
            end
            

            
            
        case "Resistivity"
            
            
            
            if isfield(log,'Resistvity')==0
                    if isfield(log,'unit')==0
                        log=get_file_gui();
                    end
                     list={};
                     l=length(log.unit);
                     for i=1:l 
                         list=[list,log.unit(i,1)];
                     end
                     [indx,tf] = listdlg('ListString',list,"Name","Select Borehole Resistivity Data");
                     log.Resistivity=log.data(:,indx);
    
            end
            
            
            
            method=questdlg("Please select one of the following Method for", ...
                "Method","Ratio Method","Eaton's Method","Eaton's Method");
            %disp("Please Select one of the following Method for");
            %disp("1: Equivalent Depth Method");
            %disp("2: Ratio method");
            %disp("3: Eaton's Method");
            %prompt="Select the number corresponding your Selection";
            %method=input(prompt);
            switch method
               
                    
                    
                    
                case "Ratio Method"
                     ty="Try once again";
                    while strcmpi(ty,"Try once again")==1
                    
                        %disp("Please select no of points for computing NCT  ")
                        %disp("n should be atleast 6")
                        %prompt="n?";
                        %n=input(prompt);
                        %n;
                        prompt = {'n'};
                        dlgtitle = '# of Point for Fiiting Curve ';
                        dims = [1 35];
                        definput = {'6'};
                        answer = inputdlg(prompt,dlgtitle,dims,definput);
                        n=str2num(answer{1});
                                
                   
                    plot_PPres(log.Resistivity,-log.Depth,n);
                    
                    [x,y]=select_points(n);
                    %[~,index1,index2]=closest_point(-log.Depth,y)
                    %x=log.dtco(index1:index2);
                    %y=-log.Depth(index1:index2);
                    data=linear_fit(x,y,log.Depth);
                    hold on
                    plot(data,-log.Depth);
                    set(gca, 'XScale', 'log');
                    f=msgbox("Please Select the Depth where overpressure starts");
                    uiwait(f);
                    
                    [~,y1]=select_points(1);
                   [~ ,index1,~]=closest_point(-log.Depth,[y1,y1]);
                   
                   
                  for i=index1:len 
                   PP(i)=PP(i)*(log.Resistivity(i)/data(i));
                  end
                  
                  smooth_bool=questdlg("Do want to smooth data?","Select","Yes", ...
                      "Yes","No");
                  %disp("Do want to smooth data?");
                  %prompt="1:Yes 2:No";
                  %smooth_bool=input(prompt); 
                  if strcmpi(smooth_bool,'Yes')==1
                                           
                      PP=smoothdata(PP,"gaussian",50)
                  end
                  
                  
                  
                  subplot(1,2,2)
                  plot(PP,-log.Depth,'-k')

    
                  xlabel("Pore Pressure") ;
                  ylabel("Depth(m)");  
                  ty=questdlg("Select an Options","Select","Try once again", ...
                      "Save","Save");
                    end
                    
                    
               case "Eaton's Method"
                     ty="Try once again";
                    while strcmpi(ty,"Try once again")==1
                    
                        %disp("Please select no of points for computing NCT  ")
                        %disp("n should be atleast 6")
                        %prompt="n?";
                        %n=input(prompt);
                        %n;
                        prompt = {'n'};
                        dlgtitle = '# of Point for Fiiting Curve ';
                        dims = [1 35];
                        definput = {'6'};
                        answer = inputdlg(prompt,dlgtitle,dims,definput);
                        n=str2num(answer{1});
                                
                   
                   
                    plot_PPres(log.Resistivity,-log.Depth,n);
                    
                    [x,y]=select_points(n);
                    %[~,index1,index2]=closest_point(-log.Depth,y)
                    %x=log.Resistivity(index1:index2);
                    %y=-log.Depth(index1:index2);
                    data=linear_fit(x,y,log.Depth);
                    hold on
                    plot(data,-log.Depth);
                    set(gca, 'XScale', 'log');
                    f=msgbox("Please Select the Depth where overpressure starts");
                    uiwait(f);
                    [~,y1]=select_points(1)
                   [~ ,index1,~]=closest_point(-log.Depth,[y1,y1]);
                   
                   
                  % 
                  % PP(i)=PP(i)*(log.Resistivity(i)/data(i));
                  %
                  pans=inputdlg("n","Eaton's Coeffiecient",dims,{'1.2'})
                  p=str2num(pans{1})
                  for i=index1:len
                  PP(i)=Sv(i)-(Sv(i)-PP(i))*((data(i)/log.Resistivity(i))^p);
                  end
                  smooth_bool=questdlg("Do want to smooth data?","Select","Yes", ...
                      "Yes","No");
                  %disp("Do want to smooth data?");
                  %prompt="1:Yes 2:No";
                  %smooth_bool=input(prompt); 
                  if strcmpi(smooth_bool,'Yes')==1
                                           
                      PP=smoothdata(PP,"gaussian",50);
                  end
                  
                  
                  
                  subplot(1,2,2)
                  plot(PP,-log.Depth,'-k')

    
                  xlabel("Pore Pressure") ;
                  ylabel("Depth(m)");  
                  ty=questdlg("Select an Options","Select","Try once again", ...
                      "Save","Save");
                    end
            end                    
            
            
    
    
    end
    end
    log.PP=PP
    
    log.other=[log.other,{"PP"}]
    
end