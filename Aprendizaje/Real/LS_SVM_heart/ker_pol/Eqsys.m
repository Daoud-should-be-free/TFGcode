% disp('be me be here')
Mat=[   0   s';
        s   D*Ker*D+eye(train_data_size)/gamma];
res=[0;D*Y];
% disp('gonna solve some');
% alphabet=Mat\res;
opts.SYM=true;
alphabet=linsolve(Mat,res,opts);
alpha=alphabet(2:end);
b=alphabet(1);
clear alphabet Mat res opts;
p=D*alpha;
clear alpha; 