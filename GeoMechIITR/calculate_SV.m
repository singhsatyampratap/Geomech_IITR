function log=calculate_SV(log)
    
     %this function calculates the vertical overburden stress
    
    %input parameters
    %Densitylog: in kg/m3
    %Depthlog: in m
    %lith_den:average density of rock above the starting point 
    %g: acceleration due to gravity
    
    %output parameter
    %Sv: vertical stress(in Pa)
               
    
    if isfield(log,'Density')==0;
        log=load_Density(log)
    end
    
            prompt = {'Average Lithology Density above starting Depth','g'};
            dlgtitle = 'Overburden Stress Calculation';
            dims = [1 50];
            definput = {'2700','9.8'};
            answer = inputdlg(prompt,dlgtitle,dims,definput);
            lith_den=str2num(answer{1});
            g=str2num(answer{2});
            log.g=g;
    
    l_density=length(log.Depth);
    log.Sv=zeros(l_density,1);
    log.Sv(1)=lith_den*g*log.Depth(1);

    for i=2:l_density
          log.Sv(i)=log.Sv(i-1)+log.Density(i)*g*(log.Depth(i)-log.Depth(i-1));
    end
    
    
    
    log.other=[log.other,{"SV"}]
    
    
end