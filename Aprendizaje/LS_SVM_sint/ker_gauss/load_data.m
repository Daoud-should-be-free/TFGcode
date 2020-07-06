close all;
set_datos='colacao';
name_data=sprintf('../data/%s/%s',set_datos,set_datos);
load_name=[name_data,'.mat'];
load(load_name);
clear span_mu span_var mu_1 mu_2 var_1 var_2 ii perm load_name;
datagrapher;