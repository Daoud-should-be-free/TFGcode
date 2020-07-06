% clear
metaseed=[4267,9889,13];
metalength=length(metaseed);
for meta=1:metalength
    seed=metaseed(meta);
    Master;
end
for meta=1:metalength
    str=['../skin/data','res_ker_gauss',int2str(meta)];
    load(str);
    bootstrapping;
    hister
    save(['../skin/datahistkerG',int2str(meta)],'F','error_por')
end
