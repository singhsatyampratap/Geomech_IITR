function log=calculate_UCS(log)
    if isfield(log,"litho")==0
        log=load_lithology(log);
    end
    
    log.other=[log.other,{"UCS"}];
    log.UCS=zeros(length(log.Depth),1);
    a=[];
    len_lithotype=length(log.litho);
    for i=1:len_lithotype
        a=[a, log.litho(i,3)];
    end
    a=unique(a);
    len_a=length(a);
    prompt = a;
    dlgtitle = "Please the enter respective equation" ;
    %dims = [1 35];
    definput = cell(1,len_a);
    %definput(:)={"2.28+4.1089*log.E_sta"}
    
    
    
    
     answer = inputdlg(prompt,dlgtitle);
     answer=answer';
     for i=1:length(log.litho)
         [~,indx1,indx2]=closest_point(-log.Depth, ...
             [cell2mat(log.litho(i,1)),cell2mat(log.litho(i,2))]);
         for j=1:len_a
             if strcmpi(cell2mat(log.litho(i,3)),cell2mat(a(j)))
                 data=eval(answer{j});
                 log.UCS(indx1:indx2)=data(indx1:indx2);
                 
             end
         end
     end
    %data=data';
    disp("UCS data can be accessed as log.UCS");
end