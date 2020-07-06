% clear
close all;
metaseed=[4267,9889,13];
metalength=length(metaseed);
% for meta=1:metalength
%     seed=metaseed(meta);
%     Master;
% end
for meta=1:metalength
    str=['../data/','res_ker_pol',int2str(meta)];
    load(str);
    bootstrapping;
    hister
    save(['../data/datahistkerP',int2str(meta)],'F','error_por')
end
valor=zeros(1,metalength);
per=0.7;
for meta=1:metalength
    str= ['../data/datahistkerP',int2str(meta)];
    load(str);
   error_sort=sort(error_por);
   valor(meta)=error_sort(find(cumsum(error_sort)>=per*sum(error_sort),1));
end
expect=min(valor);
idx=1:metalength;
sug=idx(valor==expect);
fprintf("Predictor %d tiene %.2f%% prob de error<%.2f%%\n",...
    sug,per*100,expect*100)