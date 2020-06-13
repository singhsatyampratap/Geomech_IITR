function fitting_tool(log)
    
    options=2;
    list=["GR","Density","DTCO","DTSM","VP","VS",log.other];
    [indxa,tf] = listdlg('ListString',list,"Name","Select the data for x axis","SelectionMode","single");

   
    %opts="Yes";
    [indxb,tf] = listdlg('ListString',list,"Name","Select the data for","SelectionMode","single");
    xlabel(list(indxa));
    ylabel(list(indxb));
    
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
    
    ftype=questdlg("Select Fittype","Fittype","Linear","Expontential","Power","Linear");
    switch ftype
        case "Linear"
            fittype="poly1";
            f=fit(data1,data2,fittype);
            plot(f,data1,data2);
            title(strcat("y=",num2str(f.p1),"x+",num2str(f.p2)));
        case "Exponential"
            fittype="a+b*exp(c*x)";
            title(strcat("y=",num2str(f.a),"+",num2str(f.b),"e^",num2str(f.c),'x'));
            f=fit(data1,data2,fittype);
            plot(f,data1,data2);
        case "Power"
            fittype="b*x^m";
            f=fit(data1,data2,fittype);
            plot(f,data1,data2);
            
            title(strcat("y=",num2str(f.b),"x^",num2str(f.m)));
            
   
    
    legend
    hold on;
    
    %opts=questdlg("Do you add another section to data","Add section","Yes","No","Yes");
    %end
    
            
    
     
    
    
    
    
end