function res=predictor(x,p,train_data,dimensions,b,sigma)
    ker_tot=kernel_gauss(train_data(:,(1:dimensions))',x(1:dimensions,:),sigma);
    res_or=p'*ker_tot+b;
    res_1=-1*(res_or<-0.5);
    res_2=1*(res_or>0.5);
    res_3=0*(res_or>0.5&res_or<0.5);
    res=res_1+res_2+res_3;
end
