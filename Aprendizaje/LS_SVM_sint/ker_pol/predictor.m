function res=predictor(x,p,train_data,dimensions,b,c,d)
    ker_tot=kernel_pol(train_data(:,(1:dimensions))',x(1:dimensions,:),c,d);
    res_or=p'*ker_tot+b;
    res_1=res_or>0;
    res_2=-1*(res_or<0);
    res=res_1+res_2;
end
