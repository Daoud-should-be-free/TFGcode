function [ret]=kernel_pol(x_a,x_b,c,d)
    ret=(c+x_a'*x_b).^d;
end