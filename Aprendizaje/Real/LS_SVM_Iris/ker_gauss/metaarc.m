load_data
donothing=@(varargin)(0);
sav=struct;
for meta=1:3
    total_data=tdata(meta).var;
    data_size=size(total_data,1);
    
    train_data_size=round(data_size*(50/100));
    data_validation=total_data;
    perm=randperm(data_size,train_data_size);
    data_validation(perm,:)=[];
    train_data=total_data(perm,:);
    donothing(train_data,data_validation);
    data_validation=total_data;
    perm=randperm(data_size,train_data_size);
    data_validation(perm,:)=[];
    train_data=total_data(perm,:);
    Master;
    %% Save
    sav(meta).trdata=train_data;
    sav(meta).gamma=gamma;
    sav(meta).p=p;
    sav(meta).b=b;
    sav(meta).sigma=sigma;
end
clear all_gammas b* B* c* da* de* D e* g* G* i* Ker* Mat o* p* res s si*;
clear S* st* total* train* Y;
out=metapredictor(meta_total_data,dimensions,sav);
errors=abs((out-meta_total_data(:,end)))';
errors=errors>0;
error=sum(errors);
error_por=error/150;

fprintf('Error is %g%%  \n',error_por*100);