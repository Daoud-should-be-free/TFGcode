%% plot hists
%% Figura
F.fig=figure;
%F.fig.Visible='off';
F.fig.Color=[1,1,1];
F.fig.Units='normalized';
F.fig.Position=[0,0,1,1];
%% Ejes
F.ax=axes;
F.ax.Position=[0.05,0.05,0.4,0.8];
%% Plot
hold on;
F.plo=histogram(F.ax,errorboot(1,:));
F.plo.EdgeAlpha=0;
F.plo.NumBins=100;
hold off
F.ax.Box='off';
%% Title
F.ax.Title.String='Regresor: recta';
F.ax.Title.FontName='Open_Sans';
F.ax.Title.FontSize=15;
%% Ejes
F.ax1=axes;
F.ax1.Position=[0.55,0.05,0.4,0.8];
%% Plot
hold on;
F.plo1=histogram(F.ax1,errorboot(2,:));
F.plo1.EdgeAlpha=0;
F.plo1.NumBins=100;
hold off
F.ax1.Box='off';
%% Title
F.ax1.Title.String='Regresor: parábola';
F.ax1.Title.FontName='Open_Sans';
F.ax1.Title.FontSize=15;
%%
F.Title=sgtitle('Hola');
F.Title.String='Distribución de la media de errores en valor absoluto';
F.Title.FontSize=20;
F.Title.FontWeight='bold';
F.Title.FontName='Open Sans';
%% Save
str='grafs/histsbootlimpio';
F.fig.PaperOrientation='landscape';
print(str,'-depsc2','-opengl','-tiff');
%close(F.fig);
%clear F;