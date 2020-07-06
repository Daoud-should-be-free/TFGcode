%% Create Data
close all;
rng(42);
x=(0:0.001:3);
y=0.25*x.^2+0.05*randn(1,size(x,2));
lx=length(x);

%% Create predictors
%dividimos los datos en entrenamiento y bootstrapping limpio
sampler.samps=100;
sampler.perm=randperm(lx,sampler.samps);
sampler.x=x(sampler.perm);
sampler.y=y(sampler.perm);
sampler.boot.samps=lx-sampler.samps;
sampler.boot.x=x;
sampler.boot.y=y;
sampler.boot.x(sampler.perm)=[];
sampler.boot.y(sampler.perm)=[];


sampler.rect.v=[sampler.x',ones(sampler.samps,1)]\sampler.y';
sampler.parab.v=[sampler.x'.^2,sampler.x',ones(sampler.samps,1)]\sampler.y';

sampler.rect.predictor=@(x)(sampler.rect.v(1).*x+sampler.rect.v(2));
sampler.parab.predictor=@(x)(sampler.parab.v(1).*(x.^2)+...
    sampler.parab.v(2).*x+sampler.parab.v(2));

%% Bootstrapping
boot_iter=1000000;
error=zeros(2,boot_iter);
for ii =1:boot_iter
    boot=randi(sampler.samps,[sampler.samps,1]);
    boot_iter_data=[sampler.x(boot)',sampler.y(boot)'];
    out1=sampler.rect.predictor(boot_iter_data(:,1)')';
    out2=sampler.parab.predictor(boot_iter_data(:,1)')';
    errors1=abs(out1-boot_iter_data(:,end));
    errors2=abs(out2-boot_iter_data(:,end));
    error(1,ii)=sum(errors1)/sampler.samps;
    error(2,ii)=sum(errors2)/sampler.samps;
end
errorboot=zeros(2,boot_iter);
boot_iter=1000000;
for ii =1:boot_iter
    boot=randi(sampler.boot.samps,[sampler.samps,1]);
    boot_iter_data=[sampler.boot.x(boot)',sampler.boot.y(boot)'];
    out1=sampler.rect.predictor(boot_iter_data(:,1)')';
    out2=sampler.parab.predictor(boot_iter_data(:,1)')';
    errorsboot1=abs(out1-boot_iter_data(:,end));
    errorsboot2=abs(out2-boot_iter_data(:,end));
    errorboot(1,ii)=sum(errorsboot1)/sampler.samps;
    errorboot(2,ii)=sum(errorsboot2)/sampler.samps;
end
plotter2;
plotter;
hister;
hister2