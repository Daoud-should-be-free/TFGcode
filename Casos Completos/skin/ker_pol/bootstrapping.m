[bootsize,dimensions]=size(boot_data);
dimensions=dimensions-1;%Last column is the solution

boot_iter=5000;
error=zeros(1,boot_iter);
error_por=zeros(1,boot_iter);

for ii =1:boot_iter
    boot_iter_data=boot_data(randi(bootsize,[bootsize,1]),:);
    out=predictor(boot_iter_data',...
        p,...
        train_data,...
        dimensions,...
        b*ones(1,bootsize),...
        c,d);
    errors=abs(out'-boot_iter_data(:,end));
    errors=errors./abs(boot_iter_data(:,end));
    errors(errors>0.01)=1;
    error=sum(abs(errors));
    error_por(ii)=error/bootsize;
end