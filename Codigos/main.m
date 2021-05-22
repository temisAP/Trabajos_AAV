clear all
close all
clc
fig = 1;

%% Importar datos

load('DATA.mat', 'DATA');

%% Gráficas

coeficientes = 'y';
coeficientes_ajuste = 'y';
eficiencia = 'y';
PT = 'y';

colors = [0, 0.4470, 0.7410;
          [220,20,6]/255;
          [255,140,0]/255;
          [139,0,139]/255;
          [50,205,50]/255];

%% Coeficientes aerodinámicos

% Primer plot
if coeficientes == 'y'
    h = figure(fig); set(h, 'Visible', 'off')
    hold on
    plot(DATA.angulo, DATA.cd, 'o-',...
        'LineWidth', 1.5, 'Color', colors(1,:), 'DisplayName', "cd")
    plot(DATA.angulo, DATA.cl, 'o-',...
        'LineWidth', 1.5, 'Color', colors(2,:), 'DisplayName', "cl")
    plot(DATA.angulo, DATA.cm, 'o-',...
        'LineWidth', 1.5, 'Color', colors(3,:), 'DisplayName', "cm")
    
    grid on; box on;
    legend('Interpreter', 'Latex', 'Location', 'Best')
    xlabel('Ángulo de ataque [º]','Interpreter','latex');
    Save_as_PDF(h, ['Figures/','coeficientes'],'horizontal', 0, 0);
    close
    fig = fig+1;
end