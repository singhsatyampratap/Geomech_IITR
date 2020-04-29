function [Data,name_unit]=las_to_sat(log_las)
    
    %This function create data which can be used in the GeoMech_IITR
    %it is a bridge between las to GeoMech_IITR format 
    % in order to use this first use Seislab's read_las_function to read the las file 
    % and then run this code code to create the specified format
    
    
    
    % input parameter 
    % log_las: log file created by Seislab 
    % 
    
    %Output
    %
    %Data: a data matrix corresponding to various log data in specific
    %order
    
    %                1.borehole_depth
    %                2.Density    
    %                3.dtco
    %                4.dtsm
    %                5.GR
    %                6.Resistivity
    %                7.SP
    %
    
    
    
    
    
    %you may need few modification before using this 
    %like editing the the type of resistivity data you want to use etc
    
    %just edit the log type you want to read in the log type
    
    % in addition you also have to edit data_loader.m as folows              
            %log.Depth=data(:,1);
            %log.Density=data(:,2);
            %log.dtco=data(:,3);
            %log.dtsm=data(:,4);
            %log.GR=data(:,5);
            %log.Resistivity=data(:,6);
            %log.SP=data(:,7);
            %log.newlogtype=data(:,8);
            %log.newlogtype=data(:,9);
            %  and so on....
            %
    
    
    
    
    
    
    
    
    filename=log_las.wellname;
    filename_data=strcat(filename,'_data.xlsx');
    filename_name_unit=strcat(filename,'_name_unit.txt');
    
    % edit here to add/modify log file you want to load here
    %log_type={"borehole-depth","rhoz","dt","dtsm","gr","rla1","sp","newlogtype"......};
    log_type={"borehole-depth","rhoz","dt","dtsm","gr","rla1","sp"};
    
    log_unit={};
    
    
    len=length(log_las.curves(:,1));
    n_log=length(log_type);
    A=nan(len,n_log);
    n_cell=length(log_las.curve_info);
    
    for i=1:7 
    Index = find(contains(log_las.curve_info,log_type{i}));
    if ~isempty(Index)
    Data(:,i)=log_las.curves(:,Index(1));
    log_unit{i}=log_las.curve_info{Index+n_cell};
    end
    end
    name_unit=[log_type;log_unit];
    writecell(Data,filename_data);
    writecell(name_unit,filename_name_unit);
   
    
    
    
end