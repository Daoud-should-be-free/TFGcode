%% Figura
fig=figure;
fig.Color=[1,1,1];
fig.Units='normalized';
fig.Position=[0,0,1,1];
%% Ejes
ax=axes;
ax.Position=[0.05,0.1,0.90,0.8];

%% Plot
hold on;
plo=plot(all_gammas,error_por);
plo.Marker='x';
plo.LineStyle='-';
plo.LineWidth=1.5;
plo.MarkerEdgeColor=[1 0 0];

hold off;
%% Retocar ejes
ax.XLabel.Interpreter='latex';
ax.XLabel.FontSize=18;
ax.XLabel.String='$\gamma$';

ax.XLim=[min(all_gammas) max(all_gammas)];

ax.YLabel.FontSize=18;
ax.YLabel.FontName='Open_Sans';
ax.YLabel.String='Error';

ax.YLim=[min(error_por) max(error_por)];
ax.Box='off';
%% Title
ax.Title.Interpreter='latex';
ax.Title.String='$Error(\gamma)$';
ax.Title.FontSize=20;

%% Save
str=[name_data,'ker_gauss_err_thin'];
fig.PaperOrientation='landscape';
print(str,'-depsc2','-opengl','-tiff');
close(fig);
clear plo fig ax