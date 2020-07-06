data_validation_size=data_size-train_data_size;
% disp('init_vali');
out=predictor(data_validation',...
    p,...
    train_data,...
    dimensions,...
    b*ones(1,data_validation_size));
errors=(out'-data_validation(:,end));
errors=errors./abs(data_validation(:,end));
errors(errors>0.15)=1;
errors(errors<=0.15&errors>-0.3)=0;
errors(errors<=-0.3)=1;
error=sum(abs(errors));
error_por=[error_por,error/data_validation_size];