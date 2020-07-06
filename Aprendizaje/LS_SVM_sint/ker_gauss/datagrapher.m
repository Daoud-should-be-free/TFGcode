%% Figure
fig=figure;
fig.Color=[1,1,1];
fig.Units='normalized';
fig.Position=[0,0,1,1];
%% Ejes
ax=axes;
ax.Position=[0.05,0.1,0.90,0.8];
%% Plot
hold on;
set1=plot(ax,data_1(:,1),data_1(:,2),'+');
set2=plot(ax,data_2(:,1),data_2(:,2),'+');

set1.LineWidth=1.5;
set2.LineWidth=1.5;

hold off;
%% Retocar ejes
ax.Box='off';

ax.XLabel.FontSize=18;
ax.XLabel.String='x';


ax.YLabel.FontSize=18;
ax.YLabel.String='y';

%% Title
ax.Title.String='Datos';
ax.FontName='Open_Sans';
ax.Title.FontSize=20;

%% Save 
str=[name_data,'dataform'];
fig.PaperOrientation='landscape';
print(str,'-depsc2','-opengl','-tiff');

close(fig);
clear set1 set2 fig ax;