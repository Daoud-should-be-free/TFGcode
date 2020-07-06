%% Create Data
close all;
rng(42);
x=(0:0.001:3);
y=0.25*x.^2+0.05*randn(1,size(x,2));
lx=length(x);

%% Create predictors
%generamos dos juegos de datos
sampler(1).samps=30;

sampler(1).perm=randperm(lx,sampler(1).samps);
sampler(1).x=x(sampler(1).perm);
sampler(1).y=y(sampler(1).perm);

sampler(2).samps=sampler(1).samps;

sampler(2).perm=randperm(lx,sampler(2).samps);
sampler(2).x=x(sampler(2).perm);
sampler(2).y=y(sampler(2).perm);

sampler(1).parab.v=[sampler(1).x'.^2,sampler(1).x',...
    ones(sampler(1).samps,1)]\sampler(1).y';

sampler(2).parab.v=[sampler(2).x'.^2,sampler(2).x',...
    ones(sampler(2).samps,1)]\sampler(2).y';

sampler(1).parab.predictor=@(x)(sampler(1).parab.v(1).*(x.^2)+...
    sampler(1).parab.v(2).*x+sampler(1).parab.v(3));

sampler(2).parab.predictor=@(x)(sampler(2).parab.v(1).*(x.^2)+...
    sampler(2).parab.v(2).*x+sampler(2).parab.v(3));
%% Crossvalidate
for ii=1:2
    fprintf('$%5g$&',sampler(ii).parab.v);fprintf('\b\\\\\n');
end
fprintf('$%5g$&',abs(sampler(1).parab.v-sampler(2).parab.v));
fprintf('\b\\\\\n');
plotter