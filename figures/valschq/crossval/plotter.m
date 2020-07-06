%% plotsome
%% Figura
F.fig=figure;
F.fig.Color=[1,1,1];
F.fig.Units='normalized';
F.fig.Position=[0,0,1,1];
%% Ejes
F.ax=axes;
F.ax.Position=[0.05,0.1,0.90,0.8];
%% Plot
hold on;
F.plo=plot(x,0.25*x.^2);
F.plo.Marker='none';
F.plo.LineStyle='-';
F.plo.LineWidth=3;
F.plo.Color=[0 1 0];
F.plo2=plot(x,sampler(1).parab.predictor(x));
F.plo2.Marker='none';
F.plo2.LineStyle='-';
F.plo2.LineWidth=1.5;
F.plo2.Color=[1 0.5 0];
F.plo3=plot(x,sampler(2).parab.predictor(x));
F.plo3.Marker='none';
F.plo3.LineStyle='-';
F.plo3.LineWidth=1.5;
F.plo3.Color=[0 0.5 1];
F.plo4=plot(sampler(1).x,sampler(1).y);
F.plo4.Marker='x';
F.plo4.LineStyle='none';
F.plo4.LineWidth=1.5;
F.plo4.Color=[1 0.5 0.5];
F.plo5=plot(sampler(2).x,sampler(2).y);
F.plo5.Marker='x';
F.plo5.LineStyle='none';
F.plo5.LineWidth=1.5;
F.plo5.Color=[0.5 0.5 1];
hold off
%% Retocar ejes
F.ax.XLabel.FontSize=15;
F.ax.XLabel.FontName='Open_Sans';
F.ax.XLabel.String='x';

F.ax.XLim=[min(x) max(x)];

F.ax.YLabel.FontSize=15;
F.ax.YLabel.FontName='Open_Sans';
F.ax.YLabel.String='y';

if min(x)<max(y)
    F.ax.YLim=[min(y) max(y)];
end
%% Legend
F.leg=legend('Fenómeno real','Parábola 1','Parábola 2','Puntos 1','Puntos 2');
F.leg.FontSize=10;
F.leg.FontName='Open_Sans';
F.leg.Box='off';
F.leg.Location='northwest';
%% Title
F.ax.Title.String='Regresores';
F.ax.Title.FontName='Open_Sans';
F.ax.Title.FontSize=20;
%% Save
str='grafs/reg';
F.fig.PaperOrientation='landscape';
print(str,'-depsc2','-opengl','-tiff');
%close(F.fig);
clear F