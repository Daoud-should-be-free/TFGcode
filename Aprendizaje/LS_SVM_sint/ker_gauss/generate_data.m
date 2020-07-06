clear;
clc;
close all;
data_size=10^4;
data_size_1=data_size*(70/100);
data_size_2=data_size-data_size_1;

train_data_size=data_size*(10/100);

dimensions=2;

span_mu=10;
span_var=10;

mu_1=2*span_mu*rand(1,dimensions)-span_mu;
var_1=span_var*rand(1,dimensions);
mu_2=2*span_mu*rand(1,dimensions)-span_mu;
for ii=1:dimensions
    if(mu_1(ii)+var_1(ii)>mu_2(ii)&&mu_1(ii)-var_1(ii)<mu_2(ii))
        disp('displaced');
        if(mu_2(ii)>mu_1(ii))
            mu_2(ii)=mu_2(ii)+1*var_1(ii);
        else
            mu_2(ii)=mu_2(ii)-1*var_1(ii);
        end
    end
end
var_2=span_var*rand(1,dimensions);

data_1=(var_1.^(1/2)).*randn(data_size_1,dimensions)+mu_1;
data_2=(var_2.^(1/2)).*randn(data_size_2,dimensions)+mu_2;
data_1=[data_1, ones(data_size_1,1)];
data_2=[data_2,-1.*ones(data_size_2,1)];

plot(data_1(:,1),data_1(:,2),'+');
hold on;
plot(data_2(:,1),data_2(:,2),'+');

total_data=[data_1;data_2];
data_validation=total_data;
perm=randperm(data_size,train_data_size);
data_validation(perm,:)=[];
train_data=total_data(perm,:);