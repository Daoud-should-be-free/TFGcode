close all;
%% Extracción
rng(4267)
set_datos='Iris';
name_data=sprintf('../%s/%s',set_datos,set_datos);
load_name=[name_data,'.csv'];
T=readtable(load_name);

meta_total_data=table2array(T);
clear T;
meta_data_size=size(meta_total_data,1);

%% Procesado

meta_total_data=meta_total_data(:,(2:end));

peel=meta_total_data(:,end);
meta_total_data(:,end)=[];
peel(peel==0)=-1;
peel(peel==1)=0;
peel(peel==2)=1;
meta_total_data=[meta_total_data,peel];

tdata(1).var=meta_total_data(peel==1|peel==-1,:);
tdata(2).var=meta_total_data(peel==1|peel==0,:);
tdata(3).var=meta_total_data(peel==-1|peel==0,:);

dimensions=size(meta_total_data,2)-1;