function log=loaddata()
    f = helpdlg({'You will need  atleast one of the following log data for successfully executing this code';"1.Density";"2.Vp/dt";"3.Vs/dtsm";"4.log.Resisitivty"; ...
    "In case you don't have all the data you can generated synthetic data using our libraries"},"Loading File");
    uiwait(f)
    f= helpdlg({"Additonal File like:";"Caliper log";"GR";"lithology_type"; "might be quite useful for visualisation"});
    uiwait(f)
    
    opts=questdlg("Do you input file( .xlsx and .txt files)",'Select','Yes','No(create using .las file)',"Yes");
    
    
    switch opts
        case "Yes"
            log=get_file_gui();
        case "No(create using .las file)"
            [fl1,fl2]=las_2_sat();
            f = msgbox({'Two file has been successfully generated';fl1;fl2},"Success");
            log=get_file_gui();
    end
    
   %loading Depth 
   log=load_Depth(log);
   
   answer = questdlg('Select any one of the log data you have to continue?',"Primary log Data",'Density','dt',"Density");
   switch answer
    case 'Density'
        log=load_Density(log);
      


    case 'dt'
        log=load_dtco(log);
   
   
   end
   
   
   
   if strcmpi(answer,"Density") 
    ans= questdlg('Do you have Vp data or do you want to create a synthetic Data?',"Load VP Data", ...
        "Use Garderner Relation","Load Data","Load Data");
    switch ans
        case "Use Garderner Relation"
            log=synthetic_VP(log);
        case "Load Data"
            log=load_dtco(log);
    end
   end
   
   if strcmpi(answer,"dt")
       ans= questdlg('Do you have Density data or do you want to create a synthetic Data?',"Load Density Data", ...
        "Use Garderner Relation","Load Data","Load Data");
    switch ans
        case "Use Garderner Relation"
            log=synthetic_Density(log);
        case "Load Data"
            log=load_Density(log);

    end
   end
   
   
   ans= questdlg('Do you have Shear Velocity data or do you want to create a synthetic Data?',"Load VS Data", ...
        "Use Greenberg and Castagna correlations","Load Data","Load Data");
    switch ans
        case "Use Greenberg and Castagna correlations"
            log=synthetic_VS(log);
        case "Load Data"
            log=load_dtsm(log);
         
    
            log.VS=1./log.dtsm;
            f = msgbox("dtsm Data can now be accessed as log.dtsm and Vs data as log.VS","Success");

            
    end
    
    
   
   
   
   
   
   
   
   
 ans= questdlg('Do you want to load addtional data for visualisation(e.g. GR, Lithology,BoreHole Shape etc)?',"Select", ...
        "Yes","No","Yes");   
   switch ans
       case 'Yes'
           log=load_GR(log);
           log=load_BS(log);
           log=load_lithology(log);
   end
   
   
    
            
    
    
end