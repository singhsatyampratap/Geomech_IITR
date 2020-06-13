function data=linear_fit(x,y,Depthlog)
    x=log(x);
    f=fittype("a+b*x")
    f0=fit(y,x,f);
    %f0.a;
    %f0.b;
    data=exp(f0.a+f0.b*-Depthlog);

    
    
end