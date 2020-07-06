function res=predictor(x,p,train_data,dimensions,b,c,d)
    ker_tot=kernel_pol(train_data(:,(1:dimensions))',x(1:dimensions,:),c,d);
    res=p'*ker_tot+b;
end
