%% plot hists
%% Figura
F.fig=figure;
%F.fig.Visible='off';
F.fig.Color=[1,1,1];
F.fig.Units='normalized';
F.fig.Position=[0,0,1,1];
%% Ejes
F.ax=axes;
F.ax.Position=[0.05,0.075,0.9,0.8];
%% Plot
hold on;
F.plo=histogram(F.ax,error_por(1,:));
F.plo.EdgeAlpha=0;
F.plo.NumBins=100;
hold off
F.ax.Box='off';
%% Title
F.ax.Title.String='Histograma ';
F.ax.Title.FontName='Open_Sans';
F.ax.Title.FontSize=15;
%% Save
str=['../skin/hist',num2str(meta)];
F.fig.PaperOrientation='landscape';
print(str,'-depsc2','-opengl','-tiff');
%close(F.fig);