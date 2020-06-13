function log=calculate_bulk_modulus(log)
    
    
    log.other=[log.other,{"K_sta","G_sta"}];
    
    if isfield(log,'E_sta')==0
        log=calculate_youngs_modulus(log);
    end
    if isfield(log,"v")==0
        log=calculate_poisson_ratio(log);
    end
    
    log.G_sta=log.E_sta./(2*(1+log.v));
    log.K_sta=log.E_sta./(3*(1-2*log.v));
    
    disp("Bulk Modulus Data can now be accessed as log.K_sta and log.G_sta");
    
    
end