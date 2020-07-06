%% Figura
fig=figure;
fig.Color=[1,1,1];
fig.Units='normalized';
fig.Position=[0,0,1,1];
%% Ejes
ax=axes;
ax.Position=[0.1,0.1,0.85,0.8];

%% Plot
hold on;
surfer=surf(GAMMA,C,error_por);
surfer.EdgeColor='none';
surfer.FaceColor='flat';
surfer.FaceLighting='flat';
colorbar;
view(2);
hold off;
%% Retocar ejes
ax.XLabel.Interpreter='latex';
ax.XLabel.FontSize=18;
ax.XLabel.String='$\gamma$';

ax.XScale='log';
ax.XLim=[min(gamma_vec) max(gamma_vec)];

ax.YLabel.Interpreter='latex';
ax.YLabel.FontSize=18;
ax.YLabel.String='$c$';

ax.YScale='log';
ax.YLim=[min(c_vec) max(c_vec)];
ax.Box='off';
%% Title
ax.Title.Interpreter='latex';
ax.Title.String='$Error(\gamma,c)$';
ax.Title.FontSize=20;

%% Save
str=[name_data,'ker_pol_err_broad',num2str(seed)];
fig.PaperOrientation='landscape';
print(str,'-depsc2','-opengl','-tiff');
% pause;
close(fig);
clear surfer fig ax;
