%% Datos
bus_dec=10;%busquedas por década
dec_num=10;%numero de decadas
index=(1:bus_dec*dec_num);%#busquedas
centering=1/2;
intro=(index-centering*dec_num*bus_dec)./bus_dec;
gamma_vec=10.^((index-centering*dec_num*bus_dec)./bus_dec);
%% Figura
a=figure;
a.Color=[1,1,1];
a.Units='normalized';
a.Position=[0,0,1,1];
%% Ejes
b=axes;
b.Position=[0.05,0.1,0.90,0.8];
%% Plot
plo=plot(intro,gamma_vec,'-');
plo.LineWidth=2;
plo.Marker='x';
plo.MarkerEdgeColor=[1,0,0];
plo.MarkerSize=4;
%% Nombres ejes
xlab=xlabel('Exponente');
xlab.FontName='Open_Sans';
xlab.FontSize=18;
xlab.FontSmoothing='on';
ylab=ylabel('Hiperparámetro');
ylab.FontName='Open_Sans';
ylab.FontSize=18;
ylab.FontSmoothing='on';
b.Box='off';
%% Fórmula
% formula=text(0.5,0.5,'$10^{Exponente}$');
% formula.FontName='Open_Sans';
% formula.FontSize=25;
% formula.Interpreter='latex';
% formula.Units='normalized';
% formula.Position=[1/3 2/3 0];
%% Title
tit=title('Búsquedas');
tit.FontSize=20;
%% Save;
a.PaperOrientation='landscape';
print('busquedaexp','-depsc2','-opengl','-tiff');
close(a);
%% Figura
a=figure;
a.Color=[1,1,1];
a.Units='normalized';
a.Position=[0,0,1,1];
%% Ejes
b=axes;
b.Position=[0.05,0.1,0.90,0.8];
%% Plot
plo=plot(intro,gamma_vec);
plo.LineWidth=2;
plo.Marker='x';
plo.MarkerEdgeColor=[1,0,0];
plo.MarkerSize=4;
%% Nombres ejes
xlab=xlabel('Exponente');
xlab.FontName='Open_Sans';
xlab.FontSize=18;
ylab=ylabel('Hiperparámetro');
ylab.FontName='Open_Sans';
ylab.FontSize=18;
b.YScale='log';
b.Box='off';
%% Fórmula
% formula=text(0.5,0.5,'$10^{Exponente}$');
% formula.FontName='Open_Sans';
% formula.FontSize=25;
% formula.Interpreter='latex';
% formula.Units='normalized';
% formula.Position=[1/8 3/4 0];
%% Title
tit=title('Búsquedas');
tit.FontSize=20;
%% Save
a.PaperOrientation='landscape';
print(a,'busquedaexplogscale','-depsc2','-opengl','-tiff');
close(a);
%% Clear
clear xlab ylab tit plo intro index gamma_vec formula centering ;
clear bus_dec dec_num a b