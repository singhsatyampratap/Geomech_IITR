function log=calculate_horizontal_stresses(log)
    
    if isfield(log,"v")==0
        log=calculate_poisson_ratio(log);
    end
    
   if isfield(log,"Sv")==0
        log=calculate_SV(log);
    end
    
    if isfield(log,"PP")==0
        log=calculate_Pore_Pressure(log);
    end
    
    if isfield(log,"E_sta")==0
        log=calculate_youngs_modulus(log);
    end
    if isfield(log,"ex")==0
        log=calculate_strain(log);
    end    
    
    if isfield(log,'biot')==0
             prompt = "enter a constant Biot's coeff. value ";
             dlgtitle = "Biot's Coefficient" ;
    
            %definput = {'others'};
            ans = inputdlg(prompt,dlgtitle);
            biot=str2num(ans{1});
          
            
            log.biot=biot*ones(length(log.Depth),1);
        
    end
    
    c=(log.v./(1-log.v)).*(log.Sv-(log.biot.*log.PP))+(log.biot .* log.PP);
    
    
    log.Shmin=c+(log.E_sta./(1-(log.v).^2)).*(log.ex+log.v.*log.ey);
    
    log.SHmax=c+(log.E_sta./(1-(log.v).^2)).*(log.ey+log.v.*log.ex);
    
    log.Shmin=smoothdata(log.Shmin);
    log.SHmax=smoothdata(log.SHmax);
    
    log.other=[log.other,{"Shmin","SHmax"}]
    
    
end