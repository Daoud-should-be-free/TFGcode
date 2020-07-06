index_1=(1:train_data_size)';
Ker=kernel_gauss(train_data(index_1,(1:dimensions))',train_data(index_1,(1:dimensions))',sigma);
clear index_1