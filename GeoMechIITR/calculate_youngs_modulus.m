function log=calculate_youngs_modulus(log)
    
    
    log.other=[log.other,{"E_dyn","E_sta"}];
    
    if isfield(log,'v')==0
        log=calculate_poisson_ratio(log);
    end
    
    if isfield(log,'VP')==0
        
         opts=questdlg("Do you want to load data or Create Synthetic Data?","Select","Load data","Synthetic VP","Load data");
        switch opts
            case "Load data"
                log=load_dtco(log);
            case "Synthetic VP"
                log=synthetic_VP(log);
        end
    end
    if isfield(log,'VS')==0
        opts=questdlg("Do you want to load data or Create Synthetic Data?","Select","Load data","Synthetic VS","Load data");
        switch opts
            case "Load data"
                log=load_dtsm(log);
            case "Synthetic VS"
                log=synthetic_VS(log);
        end
        
                
            
    end
   if isfield(log,'Density')==0
        opts=questdlg("Do you want to load data or Create Synthetic Data?","Select","Load data","Synthetic Density","Load data");
        switch opts
            case "Load data"
                log=load_Density(log);
            case "Synthetic VS"
                log=synthetic_Density(log);
        end
        
                
            
    end
    
    
    
    
    
    log.E_dyn=((log.Density .* ((log.VS).^2)).*(3*(log.VP .^2)-4*(log.VS .^2)))./((log.VP.^2)-(log.VS .^2));
    
    
    opts=questdlg("Select any one of the equation to calculate the dynamic properties", ...
        "Select","E_sta=0.4145*E_dyn-1.0593","E_sta=E_dyn(-2.21*phi+0.963)","E_sta=0.4145*E_dyn-1.0593")


            
    switch opts
        case "E_sta=0.4145*E_dyn-1.0593"
            log.E_sta=0.4145*log.E_dyn-1.0593;
        case "E_sta=E_dyn(-2.21*phi+0.963)"
            if isfield(log,'Porosity')
                log=calculate_porosity(log);
            end
            
            log.E_sta=log.E_dyn .*(-2.21*log.Porosity+0.963);
    end
    disp("Static Youngs Data can now be accessed as log.E_sta and dynamic data as log.E_dyn");

    
    
end