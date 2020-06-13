function data=create_log_data(log)
    if isfield(log,"litho")==0
        log=load_lithology(log);
    end
    
    a=[];
    len_lithotype=length(log.litho);
    for i=1:len_lithotype
        a=[a, log.litho(i,3)];
    end
    a=unique(a);
    len_a=length(a);
    prompt = a;
    dlgtitle = "Please Enter Value" ;
    %dims = [1 35];
    %definput = {'20','hsv'};
     answer = inputdlg(prompt,dlgtitle);
     answer=answer';
     for i=1:length(log.litho)
         [~,indx1,indx2]=closest_point(-log.Depth, ...
             [cell2mat(log.litho(i,1)),cell2mat(log.litho(i,2))]);
         for j=1:len_a
             if strcmpi(cell2mat(log.litho(i,3)),cell2mat(a(j)))
                 data(indx1:indx2)=str2double(answer(j));
             end
         end
     end
    data=data';
    
    
end