%% Get Data
[bootsize,dimensions]=size(boot_data);
dimensions=dimensions-1;%Last column is the solution

boot_iter=10000;
error=zeros(1,boot_iter);
error_por=zeros(1,boot_iter);
false_pos=zeros(1,boot_iter);
false_neg=zeros(1,boot_iter);

for ii =1:boot_iter
    boot_iter_data=boot_data(randi(bootsize,[bootsize,1]),:);
    out=predictor(boot_iter_data',...
        p,...
        train_data,...
        dimensions,...
        b*ones(1,bootsize),...
        c,d);
    errors=out~=boot_iter_data(:,end)';
    error(ii)=sum(errors);
    error_por(ii)=error(ii)/bootsize;
    false_neg(ii)=numel(find(boot_iter_data(errors,end)== 1))/bootsize;
    false_pos(ii)=numel(find(boot_iter_data(errors,end)==-1))/bootsize;
end