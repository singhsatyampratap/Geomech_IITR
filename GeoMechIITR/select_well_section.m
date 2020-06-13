function section=select_well_section(options)
    
    
    switch options
        case 1

            pts=ginput(2);
            section=[pts(1,2),pts(2,2)];
        case  2
           prompt = {'Start Depth:','Ending Depth:'};
           dlgtitle = 'Input';
           dims = [1 35];
           definput = {'-400','-600'};
           answer = inputdlg(prompt,dlgtitle,dims,definput);
           section = [str2num(answer{1}),str2num(answer{2})];
    end
   
end