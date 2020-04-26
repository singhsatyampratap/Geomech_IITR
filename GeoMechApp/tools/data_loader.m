function [log]=data_loader(file_loc)
            data=xlsread(file_loc);
           
            
            log.Depth=0.3048*data(:,1);
            log.Density=data(:,2)*1000;
            log.VP=3.048*10^5./data(:,3);
            log.VS=3.048*10^5./data(:,4);
            l_den=length(log.Density);
            log.Sv=zeros(l_den,1);
            log.PP=zeros(l_den,1);
            log.Shmin=zeros(l_den,1);
            log.Shmax=zeros(l_den,1);
            

             
end