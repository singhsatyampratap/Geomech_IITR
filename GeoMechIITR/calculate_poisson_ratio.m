function log= calculate_poisson_ratio(log)
    
    %This function calculates thr elastic paramater like young's modulus, poisson's ratio
    %and shear modulus
    
    
    %input parameter
    % Vplog:P wave velocity array(in m/s)
    % Vslog:S wave velocity array(in m/s)
    % Densitylog:Density log array(in kg/m3)
    
    
    %outptut
    % v = ½ (VP^2 − 2VS^2) / (VP^2 − VS^2)
    % G= density*VS^2
    % E= 2*G.*(1+v)
    % M= density*VP^2
    
    log.other=[log.other,{"v"}];
    log.v=zeros(length(log.Depth),1);
    
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
    
 
        log.v=0.5*((((log.VP ./ log.VS).^2)-2)./(((log.VP ./log.VS).^2)-1));
        disp("poisson Data can now be accessed as log.v ");
   
    
        
    
    
    

end