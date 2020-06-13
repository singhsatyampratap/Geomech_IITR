function log=get_file_gui()
    
[file,path] = uigetfile('*.xlsx','Select the data file(.xlsx) ');
if isequal(file,0)
   disp('User selected Cancel');
else
    file_loc_data=fullfile(path,file);
end

[file,path] = uigetfile('*.txt','Select the name unit file(.txt) ');
if isequal(file,0)
   disp('User selected Cancel');
else
    file_loc_unit=fullfile(path,file);
end




log.data=readmatrix(file_loc_data);
unit=readcell(file_loc_unit);
log.unit=unit';
log=load_Depth(log);
log.other=[]; 


end