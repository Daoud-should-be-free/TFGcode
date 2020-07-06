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
F.plo4=plot(sampler.x,sampler.y);
F.plo4.Marker='x';
F.plo4.LineStyle='none';
F.plo4.LineWidth=1.5;
F.plo4.Color=[1 0 1];
hold off
%% Retocar ejes
F.ax.XLabel.FontSize=18;
F.ax.XLabel.FontName='Open_Sans';
F.ax.XLabel.String='x';

F.ax.XLim=[min(x) max(x)];

F.ax.YLabel.FontSize=18;
F.ax.YLabel.FontName='Open_Sans';
F.ax.YLabel.String='y';

if min(x)<max(y)
    F.ax.YLim=[min(y) max(y)];
end
F.ax.Box='off';
%% Title
F.ax.Title.String='Medidas';
F.ax.Title.FontName='Open_Sans';
F.ax.Title.FontSize=20;
%% Save
str='grafs/xyorig';
F.fig.PaperOrientation='landscape';
print(str,'-depsc2','-opengl','-tiff');
%close(F.fig);
clear F