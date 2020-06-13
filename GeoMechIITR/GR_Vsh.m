function log=GR_Vsh(log)
    
    
    if isfield(log,"GR")==0
        log=load_GR(log);
    end
    
    model_list=["linear","Larionov_old","Clavier","Stieber","Larionov_tertiary"]; 
    
    [indx,tf] = listdlg('ListString',model_list,"Name","Select model for Vsh Calculation");
    model=model_list(indx);
    prompt = {'GR clean Sand','GR Shale'};
    dlgtitle = 'Enter the value';
    dims = [1 35];
    definput = {'25','120'};
    answer = inputdlg(prompt,dlgtitle,dims,definput);
    GRcl=str2num(answer{1});
    GRsh=str2num(answer{2});
   
    
    
    Ig=(log.GR-GRcl)/(GRsh-GRcl);
    %VSH IGR indicator, the Larionov model for older rocks, the Clavier model, the Stieber model, and the Larionov model for tertiary rocks:
    for i=1:length(model)
    switch model(i)
        case "linear"
            log.Vsh=Ig;
            
            
        case "Larionov_old"
            log.Vsh_Larionov_old=0.33*((2.^(2*Ig))-1);
            
        case "Clavier"
            log.Vsh_Clavier=1.7-sqrt(3.38-((Ig+0.7).^2));
            
        case "Stieber"
            log.Vsh_Steiber=Ig./(3-2*Ig);
            
            
        case "Larionov_tertiary"
            log.Vsh_Larionov_tertiary=0.083*(2.^(3.7*Ig)-1);
            
    end
    
    end
    
    
    
end