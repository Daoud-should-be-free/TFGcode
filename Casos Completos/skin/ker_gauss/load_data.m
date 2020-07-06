rng(seed);
set_datos='skin';
name_data=sprintf('../%s/data',set_datos);
load_name=[name_data,'.mat'];
load(load_name);

perm1=randperm(length(total_data),500);

boot_data=total_data;
boot_data(perm1,:)=[];

machine_data=total_data(perm1,:);

data_size=size(machine_data,1);

dimensions=size(machine_data,2)-1;

train_data_size=round(data_size*(60/100));

data_validation=machine_data;
perm=randperm(data_size,train_data_size);
data_validation(perm,:)=[];
train_data=machine_data(perm,:);
clear perm* set_datos load_name