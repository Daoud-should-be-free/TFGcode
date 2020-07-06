%% Datos
s1.center=0.5;
s1.var=0.5;
s1.x=randn(1,100).*s1.var+s1.center;
s2.center=2;
s2.var=0.5;
s2.x=randn(1,100).*s2.var+s2.center;
%% Figura
a=figure;
a.Color=[1,1,1];
a.Units='normalized';
a.Position=[0,0,1,1];
%% Ejes
b=axes;
b.Position=[0.05,0.1,0.90,0.8];
%% Plot
plo=plot(b,s1.x,zeros(size(s1.x)));
plo.LineStyle='none';
plo.LineWidth=2;
plo.Marker='x';
plo.MarkerEdgeColor=[1,0,0];
plo.MarkerSize=4;
hold on;
plo1=plot(b,s2.x,ones(size(s2.x)));
plo1.LineStyle='none';
plo1.LineWidth=2;
plo1.Marker='x';
plo1.MarkerEdgeColor=[0,0,1];
plo1.MarkerSize=4;
%% Nombres ejes
xlab=xlabel('Dato');
xlab.FontName='Open_Sans';
xlab.FontSize=18;
xlab.FontSmoothing='on';
ylab=ylabel('Objetivo');
ylab.FontName='Open_Sans';
ylab.FontSize=18;
ylab.FontSmoothing='on';
b.Box='off';
b.YLim=[-2,2];
%% Title
tit=title('Inspección de Correlación');
tit.FontSize=20;
%% Save;
a.PaperOrientation='landscape';
print('corrdata','-depsc2','-opengl','-tiff');
close(a);
%% Clear
clear xlab ylab tit plo* intro index gamma_vec formula centering ;
clear bus_dec dec_num a b
%% Datos
s1.center=0.5;
s1.var=0.5;
s1.x=randn(1,100).*s1.var+s1.center;
s2.center=0.4;
s2.var=0.5;
s2.x=randn(1,100).*s2.var+s2.center;
%% Figura
a=figure;
a.Color=[1,1,1];
a.Units='normalized';
a.Position=[0,0,1,1];
%% Ejes
b=axes;
b.Position=[0.05,0.1,0.90,0.8];
%% Plot
plo=plot(b,s1.x,zeros(size(s1.x)));
plo.LineStyle='none';
plo.LineWidth=2;
plo.Marker='x';
plo.MarkerEdgeColor=[1,0,0];
plo.MarkerSize=4;
hold on;
plo1=plot(b,s2.x,ones(size(s2.x)));
plo1.LineStyle='none';
plo1.LineWidth=2;
plo1.Marker='x';
plo1.MarkerEdgeColor=[0,0,1];
plo1.MarkerSize=4;
%% Nombres ejes
xlab=xlabel('Dato');
xlab.FontName='Open_Sans';
xlab.FontSize=18;
xlab.FontSmoothing='on';
ylab=ylabel('Objetivo');
ylab.FontName='Open_Sans';
ylab.FontSize=18;
ylab.FontSmoothing='on';
b.Box='off';
b.YLim=[-2,2];
%% Title
tit=title('Inspección de Correlación');
tit.FontSize=20;
%% Save;
a.PaperOrientation='landscape';
print('overdata','-depsc2','-opengl','-tiff');
close(a);
%% Clear
clear xlab ylab tit plo* intro index gamma_vec formula centering ;
clear bus_dec dec_num a b