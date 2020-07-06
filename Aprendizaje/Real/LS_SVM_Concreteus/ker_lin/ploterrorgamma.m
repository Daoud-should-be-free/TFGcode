%% Figura
fig=figure;
fig.Color=[1,1,1];
fig.Units='normalized';
fig.Position=[0,0,1,1];
%% Ejes
ax=axes;
ax.Position=[0.15,0.1,0.70,0.8];

%% Plot
hold on;
plo=plot(gamma_vec,error_por);
plo.Marker='x';
plo.LineStyle='-';
plo.LineWidth=1.5;
plo.MarkerEdgeColor=[1 0 0];

hold off;
%% Retocar ejes
ax.XScale='log';
ax.XLabel.Interpreter='latex';
ax.XLabel.FontSize=18;
ax.XLabel.String='$\gamma$';

ax.XLim=[min(gamma_vec) max(gamma_vec)];

ax.YLabel.FontSize=18;
ax.YLabel.FontName='Open_Sans';
ax.YLabel.String='Error';


if(min(error_por)<max(error_por))
    ax.YLim=[min(error_por) max(error_por)];
end
ax.Box='off';
%% Title
ax.Title.Interpreter='latex';
ax.Title.String='$Error(\gamma)$';
ax.Title.FontSize=20;

%% Save
str=[name_data,'ker_lin_err_broad'];
fig.PaperOrientation='landscape';
print(str,'-depsc2','-opengl','-tiff');
close(fig);
clear plo fig ax