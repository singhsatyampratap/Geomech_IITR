function converted_log=SI_unit_converter(log)
    
    
    %this fuction converts the log in from imperial to SI unit
    %only following log are converted to SI unit to facilitate the calculation
    %1.Depth
    %2.Density
    %3.dtco
    %4.dtsm
    
    %input parameter
    %log: struct of log array created from data_loader.m (see it for more info)
    
    %output 
    %converted_log: struct with converted unit 
    
    l=length(log.unit);
    %converted_log.unit=log.unit;
    converted_log=log
    if strcmpi(log.unit{l+1},'ft')
        converted_log.Depth=0.3048*log.Depth;
        converted_log.unit{l+1}='m';
    end
    if strcmpi(log.unit{l+2},'g/cm3')
        converted_log.Density=1000*log.Density;
        converted_log.unit{l+2}='kg/m3';
    end
    if strcmpi(log.unit{l+3},'us/ft')
        converted_log.dtco=log.dtco/304800;
        converted_log.unit{l+3}='s/m';
    end
    if strcmpi(log.unit{l+4},'us/ft')
        converted_log.dtsm=log.dtsm/304800;
        converted_log.unit{l+4}='s/m';
    end
    
    
end