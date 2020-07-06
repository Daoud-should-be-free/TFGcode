function [ret]=kernel_gauss(x_a,x_b,sigma)
    S_A=size(x_a);
    S_B=size(x_b);
    x_a=x_a(:)*ones(1,S_B(2));
    x_b=repmat(x_b,S_A(2),1);
    res=(x_a-x_b);
    res_2=res(:);
    res=zeros(numel(res)/S_A(1),S_A(1));
    for iii=1:S_A(1)
        res(:,iii)=res_2(iii:S_A(1):end);
    end
    res=res';
    res=reshape(sum(res.^2),S_A(2),S_B(2));
    ret=exp(-abs(res)./(sigma^2));
end