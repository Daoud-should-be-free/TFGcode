index_1=(1:train_data_size)';
Ker=kernel_pol(train_data(index_1,(1:dimensions))',train_data(index_1,(1:dimensions))',c,d);
clear index_1