function [log,original_log]=data_loader1(file_loc_data,file_loc_unit)
    %this file load the data into a struct data type
    %the input file should have a specified structure so that it can be read 
    %this function
    
    %there are two file which are read by this function
    % this file can be created from las file using las_to_sat function (see the function for more info) 
    % a) data file: a numeric data matrix with 7 columns and data arranged in the following order
    %                1.borehole_depth
    %                2.Density    
    %                3.dtco
    %                4.dtsm
    %                5.GR
    %                6.Resistivity
    %                7.SP
    %
    %  b) unit file: a 7 x 2 cell which consist of log_type and their respective unit info
    
    
    
    % Input parameter:
    % file_loc_data:filename(with location) of data file 
    % file_loc_unit:filename(with location) of unit file
    
    %output parameter
    %log: a struct datatype log in SI unit
    %original_log: a struct datatype in th original unit
    
    %Structure of Log(struct data) 
    %
    %
    %       log.unit= a 7 x 2 cell array with columns of log type and the units
    %       log.Depth= store the Depth Data(a double array)
    %       log.Density store the Density Data(a double array)
    %       log.dtco= store the dtco/dt Data(a double array)
    %       log.dtsm= store the dtsm Data(a double array) 
    %       log.GR= store the GR Data(a double array)
    %       log.Resistivity= store the Resistivity Data(a double array)
    %       log.VP=to store the P-wave velocity Data(a double array)
    %       log.VS=to store the S-wave Data(a double array)    
    %       log.Sv=to store the vertical overburden stress Data(a double array)    
    %       log.Shmax=to store the maximum overburden stress Data(a double array)  
    %       log.Shmin=to store the minimum horizontal stress Data(a double array)  
    %       log.PP=to store the Pore Pressure  Data(a double array)    
    
            data=readmatrix(file_loc_data);
            unit=readcell(file_loc_unit);
            original_log.unit=unit';

            
            original_log.Depth=data(:,1);
            original_log.Density=data(:,2);
            original_log.dtco=data(:,3);
            original_log.dtsm=data(:,4)
            original_log.GR=data(:,5);
            original_log.Resistivity=data(:,6);
            original_log.SP=data(:,7);
            
            
            log=SI_unit_converter(original_log);
            
            
            l_den=length(log.Density);
            log.Sv=nan(l_den,1);
            log.PP=nan(l_den,1);
            log.Shmin=nan(l_den,1);
            log.Shmax=nan(l_den,1);
            log.VP=1./log.dtco
            log.VS=1./log.dtsm
            

             
end