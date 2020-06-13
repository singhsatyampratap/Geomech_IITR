function log=load_well_section(log)
    
        [file,path] = uigetfile('*.txt','Select the lithology file(.txt) ');
        if isequal(file,0)
            disp('User selected Cancel');
        else
            filename=fullfile(path,file);
        end
        log=read_well_section(filename,log);
        %f = msgbox("Litholgy can now be accessed as log.litho","Success");
        %uiwait(f);
        
end