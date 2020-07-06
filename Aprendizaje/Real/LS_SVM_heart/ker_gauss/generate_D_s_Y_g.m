
%% Generate Tau(i)
s=sqrt(ones(train_data_size,1));
s=s+1*(train_data(:,end)==1);
D=diag(s);

%%
Y=train_data(:,end);