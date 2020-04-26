function [data_n,data,x]=lab_data_model(equation_type,c,x,per_noise)
    %possible equation type
    %  1.linear             data= c1*x+c2
    %  2.Exponential        data= c1*exp(c2*x)
    %  3.Power law          data=c1*x^c2
    %  4.Quadratic          data=c1*(1-c2*x)^2 
    %  5.Other form 1       data=sin-1((x-c1)/(x+c2)) 
    
    if equation_type==1
        data=c(1)*x+c(2);
    elseif equation_type==2
        data=c(1)*exp(c(2)*x);
    elseif equation_type==3
        data=c(1)*x.^c(2);
    elseif equation_type==4
        data=c(1)*(1-c(2)*x).^2;
    else
        data=asin((x-c(1)/(x+c(2))));
    end
    data_n=data.*(1+per_noise*randn(1,length(x)));
end
