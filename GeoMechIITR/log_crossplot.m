function log_crossplot(log)
    
    options=2;
    list=["GR","Density","DTCO","DTSM","VP","VS",log.other];
    [indxa,tf] = listdlg('ListString',list,"Name","Select the data for x axis","SelectionMode","single");

   
    opts="Yes";
    [indxb,tf] = listdlg('ListString',list,"Name","Select the data for","SelectionMode","single");
    xlabel(list(indxa));
    ylabel(list(indxb));
    
    while strcmpi(opts,"Yes")
                        prompt = {'Name '};
                        dlgtitle = 'Enter Name  for this Section';
                        dims = [1 35];
                        definput = {'Section A'};
                        answer = inputdlg(prompt,dlgtitle,dims,definput);
                       
    
                y=select_well_section(options);
    [~,indx1,indx2]=closest_point(-log.Depth,y);
     eval(strcat("data1=log.",list(indxa),"(indx1:indx2);"));

    
    eval(strcat("data2=log.",list(indxb),"(indx1:indx2);"));
    DN=strcat(answer{1},'(',num2str(-log.Depth(indx1)),"-",num2str(-log.Depth(indx2)),')');
    xlabel(list(indxa));
    ylabel(list(indxb));
    plot(data1,data2,'.',"DisplayName",DN);
    legend
    hold on;
    
    opts=questdlg("Do you add another section to data","Add section","Yes","No","Yes");
    end
    
            
    
     
    
    
    
    
end