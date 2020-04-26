function [Shmin]= Shmin_calculator(Sv, PP,v,win_type,win_len)
    
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
    
    
    
    
    if win_type=="None" 
       Shmin=PP+(Sv-PP).*(v)./(1-v);
    else
       Shmin=PP+(Sv-PP).*(v)./(1-v);
       Shmin=smoothdata(Shmin,win_type,win_len);

end
