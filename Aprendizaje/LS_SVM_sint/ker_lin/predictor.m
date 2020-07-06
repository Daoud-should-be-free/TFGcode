function res=predictor(x,p,train_data,dimensions,b)
    ker_tot=kernel_lin(train_data(:,(1:dimensions))',x(1:dimensions,:));
    res_or=p'*ker_tot+b;
    res_1=res_or>0;
    res_2=-1*(res_or<0);
    res=res_1+res_2;
end
