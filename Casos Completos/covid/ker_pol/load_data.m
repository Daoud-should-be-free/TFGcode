rng(seed);
load('../data/covid_datos.mat');
total_data=mat;
name_data='../data/';


perm1=randperm(length(total_data),200);

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