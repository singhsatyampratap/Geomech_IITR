function GeoMechIITR()
    
    clc;
    clear all;
    close all;
    %log=struct();
    fig1 = figure("Name","GeoMech IITR","NumberTitle","off");
    set(fig1,'MenuBar','none')
    %ax1 = axes('Position',[0.3 0.1 0.6 0.6]);
    
    %p = uipanel(f,'Position',[0.3 0.1 0.65 0.5]);
    %c = uicontrol(p,'Style','text',"String","Satyam");
    %c2 = uicontrol(p,'Style','text',"String","Pratap");
    
    
    sgt=sgtitle("GeoMech IITR",'Color','red');
    sgt.FontSize = 20;
    
    %main menu
    
    m1 = uimenu(fig1,'Text','&File');
    m2= uimenu(fig1,'Text', '&Load Data');
    m3=uimenu(fig1,'Text', '&Lithology');
    m4= uimenu(fig1,'Text',"&Synthetic Data");
    m5= uimenu(fig1,'Text', '&Calculate Data');
    m8=uimenu(fig1,'Text',"&Stress");
    m6= uimenu(fig1,'Text', '&Plot');      
    m7= uimenu(fig1,'Text',"&Tools");
    
    
    tabgp = uitabgroup(fig1);
    tab1 = uitab(tabgp,'Title','Primary');
    axes('parent',tab1);
        sgt=sgtitle("GeoMech IITR",'Color','red');
    sgt.FontSize = 20;
    
%%    
    %menu Item one 
    %File
    
    
    
    
    %New
    
    m1l1 = uimenu(m1,'Text','&New');
    m1l1.Accelerator = 'N';
    m1l1.MenuSelectedFcn = @new;
    
 
    function new(src,event)
        
        log=struct();
        set(gcf,'Position',[10 10 500 500])
        cla reset;
        %axes('Position',[0.1 .1 0.9 0.9],'Box','on')
        
        
        
        f=msgbox("Welcome to  GeoMech IITR! New File Successfully created ","Success");
        uiwait(f);
        setappdata(fig1,'logobj',log);
        
    end
    
    
    
    
    %create data from las
    m1l2 = uimenu(m1,'Text','&Create Data from Las');
    %m1l2.Accelerator = 'L';
    m1l2.MenuSelectedFcn = @las;
    
    function las(src,event)
        [a,b]=las_2_sat();
        f = msgbox({'Two file has been successfully generated';a;b},"Success");
        uiwait(f);
    end
    
    
    
    
    
    %load data
    m1l3 = uimenu(m1,'Text','&Import Data File');
    m1l3.Accelerator = 'L';
    m1l3.MenuSelectedFcn = @load;
    
    function load(src,event)
        log=get_file_gui();
        setappdata(fig1,'logobj',log);
        f=msgbox("Data and unit file are successfully loaded as log.data and log.unit ","Success");
        uiwait(f);
    end
    
    
    %export image
    m1l4 = uimenu(m1,'Text','&Save as JPG');
    m1l4.Accelerator = 'S';
    m1l4.MenuSelectedFcn = @save;
    
    function save(src,event)
      DirectoryPath = uigetdir();
      if DirectoryPath~=0
          whereToStore=fullfile(DirectoryPath,['filename' num2str(i) '.png']);
          saveas(gcf, whereToStore);
end
    end
    
    
        %load data
    m1l6 = uimenu(m1,'Text','&Clear Screen');
    m1l6.Accelerator = 'C';
    m1l6.MenuSelectedFcn = @cs;
    
    function cs(src,event)
        subplot(1,1,1)
        set(gcf,'Position',[10 10 500 500])
        plot(randn(10,1),randn(10,1));
        cla reset
        
    end
    
    
    m1l7 = uimenu(m1,'Text','&Add Tab');
    m1l7.Accelerator = 'T';
    m1l7.MenuSelectedFcn = @at;
    
    function at(src,event)
    prompt = {'Name '};
    dlgtitle = 'Enter Name  for this Section';
    dims = [1 35];
    definput = {'New Tab'};
    answer = inputdlg(prompt,dlgtitle,dims,definput);
    tab2 = uitab(tabgp,'Title',answer{1});
    axes('parent',tab2);
    sgt=sgtitle("GeoMech IITR",'Color','red');
    sgt.FontSize = 20;
        
    end

    
    
    
    
    
    
    
    
    
    
    
    %export image
    m1l4 = uimenu(m1,'Text','&Exit');
    m1l4.Accelerator = 'E';
    m1l4.MenuSelectedFcn = @exit;
    
    function exit(src,event)
        f=questdlg("Do you really want to exit?","Exit","Yes","No","No");
        if strcmpi(f,"Yes")
            close(fig1);
        end
       
    end
    
    
    
    
    
    
    
 %%   
    
    
        %load Density
    m2l1 = uimenu(m2,'Text','&Density');
    
    m2l1.MenuSelectedFcn = @denm2;
    
    function denm2(src,event)
        log=getappdata(fig1,'logobj');
        log=load_Density(log);
        f=msgbox("Density can be accessed as log.Density ","Success");
        uiwait(f);
        setappdata(fig1,'logobj',log);
        
    end
    
    
    %load Borehole Shape 
    m2l2 = uimenu(m2,'Text','&Borehole Shape');
    
    m2l2.MenuSelectedFcn = @bsm2;
    
    function bsm2(src,event)
        log=getappdata(fig1,'logobj');
        log=load_BS(log);
        f=msgbox("Borehole Shape can be accessed as log.BS ","Success");
        uiwait(f);
        setappdata(fig1,'logobj',log);
        
    end
    
    
    %load dtco 
    m2l3 = uimenu(m2,'Text','&dtco');
    
    m2l3.MenuSelectedFcn = @dtcom2;
    
    function dtcom2(src,event)
        log=getappdata(fig1,'logobj');
        log=load_dtco(log);
        f=msgbox("dt Data can now be accessed as log.dtco and Vp data as log.VP","Success");
        uiwait(f);
        setappdata(fig1,'logobj',log);
        
    end
    
        %load dtsm 
    m2l4 = uimenu(m2,'Text','&dtsm');
    
    m2l4.MenuSelectedFcn = @dtsmm2;
    
    function dtsmm2(src,event)
        log=getappdata(fig1,'logobj');
        log=load_dtsm(log);
        f=msgbox("Shear Velocity Data can now be accessed as log.dtsm and VS data as log.VS","Success");
        uiwait(f);
        setappdata(fig1,'logobj',log);
        
    end
    
    
    
    
    m2l5 = uimenu(m2,'Text','&GR');
    
    m2l5.MenuSelectedFcn = @GRm2;
    
    function GRm2(src,event)
        log=getappdata(fig1,'logobj');
        log=load_GR(log);
        f=msgbox("GR data can be accessed as log.GR","Success");
        uiwait(f);
        setappdata(fig1,'logobj',log);
        
    end
    
    
    
    m2l6 = uimenu(m2,'Text','&Resistivity');
    
    m2l6.MenuSelectedFcn = @Resm2;
    
    function Resm2(src,event)
        log=getappdata(fig1,'logobj');
        f=helpdlg("Select one or more Resistivity log");
        uiwait(f);
        log=load_Resisitivity(log);
        f=msgbox("Resistivity data successfully loaded","Success");
        uiwait(f);
        setappdata(fig1,'logobj',log);
        
        
    end
    
    
    
    
    m2l8 = uimenu(m2,'Text','&Fluid');
    
    
    m2l8l1=uimenu(m2l8,'Text','&Density');
    m2l8l2=uimenu(m2l8,'Text','&DT');
    
    
    m2l8l1.MenuSelectedFcn = @flden;
    
    function flden(src,event)
        log=getappdata(fig1,'logobj');
        
        
        log=load_Fluid_Density(log);
        f=msgbox("Fluid Density data can be accessed as log.Fluid_Density","Success");
        uiwait(f);
        setappdata(fig1,'logobj',log);
        
        
    end
    
    m2l8l2.MenuSelectedFcn = @fldt;
       function fldt(src,event)
        log=getappdata(fig1,'logobj');

        log=load_Fluid_DT(log);
        f=msgbox("Fluid Density data can be accessed as log.Fluid_DT","Success");
        uiwait(f);
        setappdata(fig1,'logobj',log);
        
        
    end
    
    
    
    
    
   m2l7 = uimenu(m2,'Text','&Load other log data');
    
    m2l7.MenuSelectedFcn = @otherm2;
    
    function otherm2(src,event)
        log=getappdata(fig1,'logobj');
        log=load_other(log);
        
        setappdata(fig1,'logobj',log);
        
    end
    
    
    
    
    
    
    
    
    
    
 %%   
    
    
    
    m3l1 = uimenu(m3,'Text','&Create Lithology Data');
    
    m3l1.MenuSelectedFcn = @create_litho;
    
    function create_litho(src,event)
        log=getappdata(fig1,'logobj');
        log=create_litho_file(log);
        setappdata(fig1,'logobj',log);
    end
    
    
    
    
    
    
    m3l2 = uimenu(m3,'Text','&Load Lithology Data');
    
    m3l2.MenuSelectedFcn = @litho;
    
    function litho(src,event)
        log=getappdata(fig1,'logobj');
        log=load_lithology(log);
        setappdata(fig1,'logobj',log);
    end
    
    
    
    
    %% Synthetic data
    
    m4l5 = uimenu(m4,'Text','&Create synthetic log');
    
    m4l5l1=uimenu(m4l5,'Text','&Constant log');
    m4l5l2=uimenu(m4l5,'Text','&Equation Modeler');
    
    
    m4l5l1.MenuSelectedFcn = @create_syn;
    function create_syn(src,event)
        log=getappdata(fig1,'logobj');
        
        
        
         prompt = "Enter the name for log";
         dlgtitle = "Log Name" ;
    
        %definput = {'others'};
        answer = inputdlg(prompt,dlgtitle); 
        
        ques=questdlg("Do you want to use lithology file to create log data?","Select","Yes","No","Yes");
        if strcmpi(ques,"No")
            prompt = "Constant";
            dlgtitle = "Enter The Constant Value" ;
    
        %definput = {'others'};
            ans = inputdlg(prompt,dlgtitle);
            ans=str2num(ans{1});
            
            str=strcat("log.",answer{1},'=ans*ones(length(log.Depth),1)');
            eval(str);
            

            log.other=[log.other,{answer{1}}];
        end
        
        
        if strcmpi(ques,"Yes")
            
            str=strcat("log.",answer{1},'=create_log_data(log)');
            eval(str);
            log.other=[log.other,{answer{1}}];
            
        end
        
        
        
        setappdata(fig1,'logobj',log);
        f=msgbox(strcat("Synthetic ", answer{1}, " data successful calculated and can be accessed as log.",answer{1}),"Success");
        uiwait(f);
    end
    
    
    
    
    %m4l5l1=uimenu(m4l5,'Text','&Constant log');
    %m4l5l2=uimenu(m4l5,'Text','&Using Other log data');
    
    
    m4l5l2.MenuSelectedFcn = @create_eq;
    function create_eq(src,event)
        log=getappdata(fig1,'logobj');
        
        f = helpdlg({'Welcome to GeoMEchIITR log data modeler';"This will help you to create new log data using other log data in simple step"; ...
            "Step 1: Make sure you have all the data already loaded for using it in equation"; ...
            "Step 2:Enter the log name(e.g:Porosity)"; ...
            "Step 3:Choose whether you want to use lithology(it allows to use different set of equation for different lithology/formation "; ...
            "Step 4:Enter the expression e.g. (2700-log.Density)/(2700-1000)"});
            
    uiwait(f)
    f= helpdlg({"GUIDE TO Writing THE EXPRESSION";"1. log data can be accessed as log.(respective name) e.g log.Density,log.v etc "; ...
        "2.Use standard matlab operator like";"Addition Operator (+)"; "Subtraction operator (-)"; "Scalar Multiplication (*)"; ...
        "Array Multiplication(.*)";"Array power (.^)";"Division (/)";"Array right division (./)"; ...
        "Example Expression: 0.04*(log.Density .* (log.VP).^2)});"});
    uiwait(f)
    
        
        
        
        
         prompt = "Enter the name for log";
         dlgtitle = "Log Name" ;
    
        %definput = {'others'};
        answer = inputdlg(prompt,dlgtitle); 
        
        ques=questdlg("Do you want to use lithology file to create log data?","Select","Yes","No","Yes");
        if strcmpi(ques,"No")
            prompt = strcat("log.",answer{1},"=");
            dlgtitle = "Write the expression" ;
    
        %definput = {'others'};
            ans = inputdlg(prompt,dlgtitle);
            %ans=str2num(ans{1});
            
            str=strcat("log.",answer{1},'=',ans{1});
            eval(str);
            

            log.other=[log.other,{answer{1}}];
        end
        
        
        if strcmpi(ques,"Yes")
            
            str=strcat("log.",answer{1},'=model_log_equation(log)');
            eval(str);
            log.other=[log.other,{answer{1}}];
            
        end
        
        
        
        setappdata(fig1,'logobj',log);
        f=msgbox(strcat("Synthetic ", answer{1}, " data successful calculated and can be accessed as log.",answer{1}),"Success");
        uiwait(f);
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
%%    
    
    m4l1 = uimenu(m4,'Text','&Density(using Gardner)');
    m4l1.MenuSelectedFcn = @den_syn;
    function den_syn(src,event)
        log=getappdata(fig1,'logobj');
        log=synthetic_Density(log);
        setappdata(fig1,'logobj',log);
        f=msgbox("Synthetic Density successful calculate and can be accessed as log.Density","Success");
        uiwait(f);
    end
    
    
    m4l2 = uimenu(m4,'Text','&VP(using Gardener)');
    m4l2.MenuSelectedFcn = @den_VP;
    function den_VP(src,event)
        log=getappdata(fig1,'logobj');
        log=synthetic_VP(log);
        setappdata(fig1,'logobj',log);
        f=msgbox("Synthetic VP successful calculated and can be accessed as log.VP","Success");
        uiwait(f);
    end
    
    
    m4l3 = uimenu(m4,'Text','&VS(using Greenberg and Castagna)');
    m4l3.MenuSelectedFcn = @den_VS;
    function den_VS(src,event)
        log=getappdata(fig1,'logobj');
        log=synthetic_VS(log);
        setappdata(fig1,'logobj',log);
        f=msgbox("Synthetic VS successful calculated and can be accessed as log.VS","Success");
        uiwait(f);
    end
    
    m4l4 = uimenu(m4,'Text','&Poisson Ratio using lithology');
    m4l4.MenuSelectedFcn = @den_poisson;
    function den_poisson(src,event)
        log=getappdata(fig1,'logobj');
        log=synthetic_poisson(log);
        setappdata(fig1,'logobj',log);
        f=msgbox("Synthetic Poisson successful calculated and can be accessed as log.v","Success");
        uiwait(f);
    end
    
    
    
    
    
  %%
      m5l1 = uimenu(m5,'Text','&Equation Modeler');
      m5l1.MenuSelectedFcn = @create_eq;
      
      
          
    m5l2=uimenu(m5,'Text','&Porosity');
    m5l2.MenuSelectedFcn = @poro;
    function poro(src,event)
        log=getappdata(fig1,'logobj');
        log=calculate_porosity(log);
        setappdata(fig1,'logobj',log);
       f=msgbox("Porosity successfully calculated and can be accessed as log.Porosity","Success");
    end
    
    m5l2=uimenu(m5,'Text','&Poisson Ratio');
    m5l2.MenuSelectedFcn = @pr;
    function pr(src,event)
        log=getappdata(fig1,'logobj');
        log=calculate_poisson_ratio(log);
        setappdata(fig1,'logobj',log);
        f=msgbox("Poisson Ratio successful calculated and can be accessed as log.v","Success");
    end
    
    
    m5l3=uimenu(m5,'Text',"&Young's Modulus");
    m5l3.MenuSelectedFcn = @ym;
    function ym(src,event)
        log=getappdata(fig1,'logobj');
        log=calculate_youngs_modulus(log);
        setappdata(fig1,'logobj',log);
        f=msgbox("Static Youngs Data can now be accessed as log.E_sta and dynamic data as log.E_dyn","Success");
    end
    
    
    
    
    m5l4=uimenu(m5,'Text','&Bulk Modulus');
    m5l4.MenuSelectedFcn = @bm;
    function bm(src,event)
        log=getappdata(fig1,'logobj');
        log=calculate_bulk_modulus(log);
        setappdata(fig1,'logobj',log);
        f=msgbox("UCS data can be accessed as log.UCS","Success");
    end
    
    
    m5l5=uimenu(m5,'Text','&UCS');
    m5l5.MenuSelectedFcn = @ucs;
    function ucs(src,event)
        log=getappdata(fig1,'logobj');
        log=calculate_UCS(log);
        setappdata(fig1,'logobj',log);
        %f=msgbox("Synthetic Poisson successful calculated and can be accessed as log.v","Success");
    end
      
  
%%

    
    %Stress
    
    m8l3=uimenu(m8,'Text','&Overburden Stress ');
    m8l3.MenuSelectedFcn = @obd;
    function obd(src,event)
        log=getappdata(fig1,'logobj');
        log=calculate_SV(log);
        setappdata(fig1,'logobj',log);
        f=msgbox("Overburden Stress successfully calculated and can be accessed as log.Sv","Success");
    end
    
    
    
    
    
    
    m8l1=uimenu(m8,'Text','&Pore Pressure');
    m8l1.MenuSelectedFcn = @pp;
    function pp(src,event)
        log=getappdata(fig1,'logobj');
        log=calculate_Pore_Pressure(log);
        setappdata(fig1,'logobj',log);
        f=msgbox("Pore pressure successfully calculated and can be accessed as log.PP","Success");
        uiwait(f);
        cla reset;
    end
    
    
    m8l2=uimenu(m8,'Text','&Strains');
    m8l2.MenuSelectedFcn = @strain;
    function strain(src,event)
        log=getappdata(fig1,'logobj');
        log=calculate_strain(log);
        setappdata(fig1,'logobj',log);
        f=msgbox("Strains  successfully calculated and can be accessed as log.ex and log.ey","Success");
        uiwait(f);
    end
    
 
    m8l5=uimenu(m8,'Text','&Fracture Pressure');
    m8l5.MenuSelectedFcn = @fp;
    function fp(src,event)
        log=getappdata(fig1,'logobj');
        log=calculate_FP(log);
        setappdata(fig1,'logobj',log);
        f=msgbox("Fracture Pressure successfully calculated and can be accessed as log.FP","Success");
        uiwait(f);
    end
    
    
    
    
    
    m8l4=uimenu(m8,'Text','&Horizontal Stresses');
    m8l4.MenuSelectedFcn = @hs;
    function hs(src,event)
        log=getappdata(fig1,'logobj');
        log=calculate_horizontal_stresses(log);
        setappdata(fig1,'logobj',log);
        f=msgbox("Maximum and Minimum Horizontal Stress successfully calculated and can be accessed as log.SHmax and Shmin","Success");
        uiwait(f); 
    end
    
    m8l7=uimenu(m8,'Text','&Plot Stresses');
    m8l7.MenuSelectedFcn = @pst;
    function pst(src,event)
        log=getappdata(fig1,'logobj');
        plot_stress(log);
 
    end
    
    
    
    m8l5=uimenu(m8,'Text','&Stresses Around Well');
    m8l5.MenuSelectedFcn = @saw;
    function saw(src,event)
        log=getappdata(fig1,'logobj');
        
        plot_kirsch_stress(log)
         setappdata(fig1,'logobj',log);
        %setappdata(fig1,'logobj',log);
        %f=msgbox("Maximum and Minimum Horizontal Stress successfully calculated and can be accessed as log.SHmax and Shmin","Success");
        %uiwait(f); 
    end
    
        
    m8l6=uimenu(m8,'Text','&C0 Required');
    m8l6.MenuSelectedFcn = @cr;
    function cr(src,event)
        log=getappdata(fig1,'logobj');
        
        C_required(log)
 
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
  %%  
    
    %menu item plot
    m6l1=uimenu(m6,'Text','&Multiple Plots');
    m6l1.Accelerator = 'P';
    m6l1.MenuSelectedFcn = @m_plot;
    
    function m_plot(src,event)
        log=getappdata(fig1,'logobj');
        %log=struct();
        %log=load_Depth(log)
        main_plot(log);
        
    end
    
    
    
        %menu item plot
    m6l2=uimenu(m6,'Text','&Density');
    
    m6l2.MenuSelectedFcn = @den_plot;
    
    function den_plot(src,event)
        log=getappdata(fig1,'logobj');
        %log=struct();
        %log=load_Depth(log)
        set(gcf,'Position',[10 10 300 2000])
        
        plot_Density(log);
        title("Density(kg/m^3")
        hold off;
        
    end
    
    
        m6l3=uimenu(m6,'Text','&DT');
        m6l3.MenuSelectedFcn = @dt_plot;
    
    function dt_plot(src,event)
        log=getappdata(fig1,'logobj');
        %log=struct();
        %log=load_Depth(log)
        set(gcf,'Position',[10 10 300 2000])
        
        plot_dt(log);
        title("dt(s/m)")
        hold off;
        
    end
    
    
    
        
        m6l4=uimenu(m6,'Text','&Velocity');
        m6l4.MenuSelectedFcn = @vel_plot;
    
    function vel_plot(src,event)
        log=getappdata(fig1,'logobj');
        %log=struct();
        %log=load_Depth(log)
        set(gcf,'Position',[10 10 300 2000])
        
        plot_Velocity(log);
        title("Velocity(m/s)")
        hold off;
        
    end
    
    
    
        m6l5=uimenu(m6,'Text','&Resistivity');
        m6l5.MenuSelectedFcn = @res_plot;
    
    function res_plot(src,event)
        log=getappdata(fig1,'logobj');
        %log=struct();
        %log=load_Depth(log)
        set(gcf,'Position',[10 10 300 2000])
        
        plot_Resistivity(log);
        title("Resistivity(Ohmm)")
        hold off;
        
    end
    
    
    
        m6l6=uimenu(m6,'Text','&GR');
        m6l6.MenuSelectedFcn = @GR_plot;
    
        function GR_plot(src,event)
        log=getappdata(fig1,'logobj');
        %log=struct();
        %log=load_Depth(log)
        set(gcf,'Position',[10 10 300 2000])
        
        plot_GR(log);
        title("GR(API)")
        hold off;
        
        end
        
        
        m6l7=uimenu(m6,'Text','&Shale Volume');
        m6l7.MenuSelectedFcn = @Vsh_plot;
    
        function Vsh_plot(src,event)
        log=getappdata(fig1,'logobj');
        %log=struct();
        %log=load_Depth(log)
        set(gcf,'Position',[10 10 300 2000])
        
        plot_Vsh(log);
        title("Vol Shale")
        hold off;
        
        end
        
        m6l8=uimenu(m6,'Text','&Other loaded/calculated log');
        m6l8.MenuSelectedFcn = @other;
    
        function other(src,event)
        log=getappdata(fig1,'logobj');
        %log=struct();
        %log=load_Depth(log)
        set(gcf,'Position',[10 10 300 2000])
        
        plot_other(log);
        
      
        
        end
 
        
        
        %%
        
        m7l1=uimenu(m7,'Text','&Create Well Section');
        m7l1.MenuSelectedFcn = @cws;
    
        function cws(src,event)
        log=getappdata(fig1,'logobj');
        log=create_well_section(log);
       setappdata(fig1,'logobj',log);
        
        
        end
        
        
        
        
                
        m7l2=uimenu(m7,'Text','&load Well Section');
        m7l2.MenuSelectedFcn = @lws;
    
        function lws(src,event)
        log=getappdata(fig1,'logobj');
        log=load_well_section(log);
        setappdata(fig1,'logobj',log);
        
        f=msgbox("Well Section successfully loaded as can be accessed as log.section",'Success');
        uiwait(f);
        end
        
        
        m7l3=uimenu(m7,'Text','&Plot Well Section');
        m7l3.MenuSelectedFcn = @pws;
    
        function pws(src,event)
        log=getappdata(fig1,'logobj');
        plot_well_section(log);
        setappdata(fig1,'logobj',log);
        hold off;
       
        end
        
        
        m7l4=uimenu(m7,'Text','&Plot Histogram');
        m7l4.MenuSelectedFcn = @ph;
    
        function ph(src,event)
        log=getappdata(fig1,'logobj');
        histoplotter(log);
        setappdata(fig1,'logobj',log);
        hold off;
       
        end
        
        
        m7l8=uimenu(m7,'Text','&Crossplot');
        m7l8.MenuSelectedFcn = @cp;
    
        function cp(src,event)
        log=getappdata(fig1,'logobj');
        log_crossplot(log);
        setappdata(fig1,'logobj',log);
        hold off;
       
        end
        
           
        m7l8=uimenu(m7,'Text','&Fitting Tool');
        m7l8.MenuSelectedFcn = @ft;
    
        function ft(src,event)
        log=getappdata(fig1,'logobj');
        fitting_tool(log);
        setappdata(fig1,'logobj',log);
        hold off;
       
        end
        
        
        
        
        
        
        
        
        
   
        
        

        
        
        
        
        
        
        
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
end


