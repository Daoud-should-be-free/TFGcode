%% Create Data
close all;
rng(42);
x=(0:0.001:3);
y=0.25*x.^2+0.05*randn(1,size(x,2));
lx=length(x);

%% Create predictors
%generamos dos juegos de datos
sps=[6,50];
for ii=1:length(sps)
    sampler(ii).samps=sps(ii);
    sampler(ii).perm=randperm(lx,sampler(ii).samps);
    sampler(ii).boot.samps=lx-sampler(ii).samps;
    sampler(ii).boot.x=x;
    sampler(ii).boot.y=y;
    sampler(ii).boot.x(sampler(ii).perm)=[];
    sampler(ii).boot.y(sampler(ii).perm)=[];
    sampler(ii).x=x(sampler(ii).perm);
    sampler(ii).y=y(sampler(ii).perm);
    sampler(ii).parab.v=[sampler(ii).x'.^2,sampler(ii).x',...
        ones(sampler(ii).samps,1)]\sampler(ii).y';
    sampler(ii).parab.predictor=@(x)(sampler(ii).parab.v(1).*(x.^2)+...
        sampler(ii).parab.v(2).*x+sampler(ii).parab.v(3));
end

%% Crossvalidate
for ii=1:2
    fprintf('Parámetros $%d$&',ii);fprintf('$%5g$&',sampler(ii).parab.v);
    fprintf('\b\\\\\n');
end
fprintf('Diferencia');fprintf('$%5g$&',...
    abs(sampler(1).parab.v-sampler(2).parab.v));
fprintf('\b\\\\\n');
plotter

%% Bootstrapping
boot_iter=1000000;
errorboot=zeros(2,boot_iter);
for jj=1:length(sps)
    for ii =1:boot_iter
        boot=randi(sampler(jj).boot.samps,[sampler(jj).samps,1]);
        out=sampler(jj).parab.predictor(sampler(jj).boot.x(boot))';
        errorsboot=abs(out-sampler(jj).boot.y(boot)');
        errorboot(jj,ii)=sum(errorsboot)/sampler(jj).samps;
    end
end
hister2