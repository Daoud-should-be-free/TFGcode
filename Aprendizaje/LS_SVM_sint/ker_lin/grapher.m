step=0.05;
[X,W]=meshgrid(min(total_data(:,1)):step:max(total_data(:,1)),min(total_data(:,2)):step:max(total_data(:,2)));
mat_size=ones(length(X(:)),1);
vector=[X(:),W(:)];
out=predictor(vector',...
    p,...
    train_data,...
    dimensions,...
    b*mat_size');
Z=reshape(out,size(X));
%% Plot Data
%% Figura
fig=figure;
fig.Color=[1,1,1];
fig.Units='normalized';
fig.Position=[0,0,1,1];

%% Ejes
ax=axes;
ax.Position=[0.05,0.1,0.90,0.8];

%% Plot
hold on
surfer=surf(X,W,Z);
surfer.EdgeColor='none';
surfer.FaceColor='flat';
surfer.FaceLighting='flat';
colormap([0,0.7,1;0.7,0,1]);

datos1=plot3(data_1(:,1),data_1(:,2),data_1(:,3));
datos1.Marker='x';
datos1.LineStyle='none';
datos1.MarkerEdgeColor=[0 1 0];
datos1.MarkerSize=5;
datos1.LineWidth=1.5;

datos2=plot3(data_2(:,1),data_2(:,2),ones(size(data_2(:,3))));
datos2.Marker='x';
datos2.LineStyle='none';
datos2.MarkerEdgeColor=[1 0 0];
datos2.MarkerSize=5;
datos2.LineWidth=1.5;

view(2);

hold off;

%% Retocar ejes
ax.XLabel.FontSize=18;
ax.XLabel.String='x';

ax.XLim=[min(total_data(:,1)) max(total_data(:,1))];

ax.YLabel.FontSize=18;
ax.YLabel.String='y';

ax.YLim=[min(total_data(:,2)) max(total_data(:,2))];

ax.Box='off';

%% Title
ax.Title.String='Mapa de clasificación';
ax.Title.FontSize=20;

%% Save
str=[name_data,'ker_lin'];
fig.PaperOrientation='landscape';
print(str,'-depsc2','-opengl','-tiff');
close(fig);