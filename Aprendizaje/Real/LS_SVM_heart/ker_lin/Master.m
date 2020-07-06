%clc;
clear;
load_data;
inttic=tic;
generateKermatrix;
error_por=[];
generate_D_s_Y_g;

bus_dec=20;%busquedas por década
dec_num=4;%numero de decadas
index=(1:bus_dec*dec_num);%#busquedas
centering=1/2;
gamma_vec=10.^((index-centering*dec_num*bus_dec)./bus_dec);

for gamma=gamma_vec
    Eqsys;
    validator;
end
ploterrorgamma;

gamma_vec=gamma_vec(error_por==min(error_por));
if length(gamma_vec)>10
    gamma_vec=gamma_vec(1:10);
end
disp('Looking closer');

error_por=[];
steps=30;
gamma_s=min(gamma_vec);
all_gammas=[linspace(gamma_s-gamma_s*log(10)/bus_dec,gamma_s,steps/2),linspace(gamma_s,gamma_s+gamma_s*log(10)/bus_dec,steps/2)];

fprintf('Got all potential gammas\n');

for gamma=all_gammas
    Eqsys;
    validator;
end
ploterrorgamma2;
gamma=min(all_gammas(error_por==min(error_por)));

fprintf('Gamma selected: %f\n',gamma);
error_por=[];
Eqsys;
validator;
str=[name_data,'res_ker_lin'];
time_elapsed=toc(inttic);
fprintf('%f minutes have passed\n',time_elapsed/60);
fprintf('Error proportion:\t%f\n',error_por*100);
fake_neg=numel(find(data_validation(errors,end)== 1))/data_validation_size;
fake_pos=numel(find(data_validation(errors,end)==-1))/data_validation_size;
fprintf('Final total error rate:\t%f\n',error_por);
fprintf('Final fake positive error rate:\t%f\n',fake_pos);
fprintf('Final fake negative error rate:\t%f\n',fake_neg);
save(str,'gamma','errors','error_por','p','b','fake_pos','fake_neg');