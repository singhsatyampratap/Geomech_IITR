function log=calculate_FP(log)
    
        %This function calculates the Minimum horizontal stress 
        
    %input parameter
    %Sv:Vertical overburden array (in Pa)
    %PP: pore Pressure array (in Pa)
    %v : Poisson's ratio array
    % win_type: Window type for smoothning the data
    %      'None': for no smoothing
    %     'movmean' — Moving average over each window of win_len. This method is useful for reducing periodic trends in data.
    %     'movmedian' — Moving median over each window of win_len. This method is useful for reducing periodic trends in data when outliers are present.
    %      'gaussian' — Gaussian-weighted moving average over each window of win_len.     
    
    
    if isfield(log,'Sv')==0
        log=calculate_SV(log);
    end
    if isfield(log,'PP')==0
        log=calculate_Pore_Pressure(log);
    end
    if isfield(log,'v')==0
        log=calculate_poisson_ratio(log);
    end
    
   
       log.FP=log.PP+(log.Sv-log.PP).*(log.v)./(1-log.v);
       
       log.FP=smoothdata(log.FP)
       %sh=PP+(Sv-PP).*(1.5*v)./(1-v);
       %sh=smoothdata(sh,win_type,win_len,'omitnan');
       log.other=[log.other,{"FP"}];
    
end