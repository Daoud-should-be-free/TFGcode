%% Init

clc;
clear;
internaltic=tic;
load_data;
error_por=[];
generate_D_s_Y_g;

%% Búsqueda general
d=2;

bus_dec=10;%busquedas por década
dec_num=10;%numero de decadas
index=(1:bus_dec*dec_num);%#busquedas
centering=1/2;
gamma_vec=10.^((index-centering*dec_num*bus_dec)./bus_dec);

bus_dec_c=10;%busquedas por década
dec_num_c=10;%numero de decadas
index_c=(1:bus_dec_c*dec_num_c);%#busquedas
centering_c=1/2;
c_vec=10.^((index_c-centering_c*dec_num_c*bus_dec_c)./bus_dec_c);

[GAMMA,C]=meshgrid(gamma_vec,c_vec);
Bag_vals=[GAMMA(:),C(:)]';

fprintf('Getting in the stuff\n');

for index=1:length(Bag_vals)
    gamma=Bag_vals(1,index);
    c=Bag_vals(2,index);
    generateKermatrix;
    Eqsys;
    validator;
end

fprintf('Finished_mesh\n');

error_por=reshape(error_por,size(GAMMA));
ploterrorsigma;
fprintf('error mínimo aprox:\t%f\n',min(error_por(:)));

%% Construcción de paso siguiente
gamma_vec=GAMMA(error_por(:)==min(error_por(:)))';
c_vec=C(error_por(:)==min(error_por(:)))';
index_not=gamma_vec.*c_vec==min(gamma_vec.*c_vec); % nos  quedamos con el de menor peso cruzado
gamma_vec=gamma_vec(index_not);
c_vec=c_vec(index_not);
clear index_not GAMMA SIGMA Bag_vals
gamma_vec=gamma_vec(1);
c=c_vec(1);

generateKermatrix;%Sigma is now selected. I have noticed the system is more robust against changes in sigma

%% Nit-pick gamma
fprintf('Looking closer\nChosen sigma is:\t%f\n',c);
error_por=[];
steps=30;
all_gammas=zeros(length(gamma_vec),steps);
index=1;

for gamma_s=gamma_vec
    all_gammas(index,1:steps)=[linspace(gamma_s-gamma_s*log(10)/bus_dec,gamma_s,steps/2),linspace(gamma_s,gamma_s+gamma_s*log(10)/bus_dec,steps/2)];
    index=index+1;
end
all_gammas=all_gammas(:)';

fprintf('Got all gammas\n');

for gamma=all_gammas
    Eqsys;
    validator;
end
gamma=min(all_gammas(error_por==min(error_por)));
ploterrorgamma;
fprintf('Gamma selected:\t%f\n',gamma);

%% Mapeado Superficie

error_por=[];
Eqsys;
validator;
str=[name_data,'res_ker_pol',num2str(d)];
save(str,'gamma','errors','error_por','p','b','c');
grapher;
time_elapsed=toc(internaltic);
fprintf('%f minutes have passed\n',time_elapsed/60);