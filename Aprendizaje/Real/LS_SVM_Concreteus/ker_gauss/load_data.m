close all;
rng(4267)
set_datos='Concrete_Data_Yeh';
name_data=sprintf('../%s/%s',set_datos,set_datos);
load_name=[name_data,'.csv'];
T=readtable(load_name);

total_data=table2array(T);
clear T;

data_size=size(total_data,1);

if(all(total_data(:,1)==(1:data_size)'))
    total_data=total_data(:,(2:end));
end

dimensions=size(total_data,2)-1;

train_data_size=round(data_size*(40/100));

data_validation=total_data;
perm=randperm(data_size,train_data_size);
data_validation(perm,:)=[];
train_data=total_data(perm,:);
