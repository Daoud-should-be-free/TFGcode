
%% Generate Tau(i)
%%Usamos tau cte=2 se podría penalizar tau de forma relacionada con el
%%radio a la media de la muestra
s=sqrt(ones(train_data_size,1));
D=diag(s);

%%
Y=train_data(:,end);