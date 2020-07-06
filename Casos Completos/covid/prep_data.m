close all;
clear;clc;
rng(4267)
set_d='time_series_covid19_deaths_global';
set_c='time_series_covid19_confirmed_global';
name_data={sprintf('data/%s',set_c),sprintf('data/%s',set_d)};
clear set_d set_c;
%% Paises seleccionados poblaciones
Con.Name={'United Kingdom','France',...,'Spain',47007367
        'Germany','Ireland','Italy'};
Con.Pop=[66796807,67067000,83149300,4761865,60317116]/10^4;
Con.Num=length(Con.Name);
Con.Order=cell(Con.Num,2);
dias=6;
load_name=[name_data{1},'.csv'];
sz=size(readtable(load_name));
init=32;
mat=zeros(Con.Num*(sz(2)-init-dias),dias);
for meta=1:2
    load_name=[name_data{meta},'.csv'];
    T=readtable(load_name);
    T=table2cell(T);
    sz=size(T);
    idx=0;
    Taux=cell(Con.Num,sz(2)-init);
    for jj=1:sz(1)
        cond=0;
        for ii=1:Con.Num
            cond=(strcmp(T{jj,2},Con.Name{ii})&&strcmp(T{jj,1},''));
            if cond
                idx=idx+1;
                Con.Order{idx,meta}=T{jj,2};
                for kk=init+1:sz(2)
                    Taux{idx,kk-init}=str2double(T{jj,kk})/Con.Pop(ii);
                end
                break
            end
        end
    end
    clear T idx ii jj kk load_name ;
    Taux=cell2mat(Taux);
    sz=size(Taux);
    figure;plot(Taux');
    legend(Con.Order{:,meta},'Location','best');
    Tdatos=Taux(:,2:end)-Taux(:,1:end-1);
    for ii=1:sz(2)-dias
        mat((ii-1)*Con.Num+1:ii*Con.Num,...
        (meta-1)*dias+1:dias*meta)=Tdatos(:,ii:ii+dias-1);
    end
end
mat=[mat(:,1:dias-1),mat(:,dias+1:2*dias),mat(:,dias)];
clear Taux Tdatos meta dias sz ii init;
save('data/covid_datos','mat');