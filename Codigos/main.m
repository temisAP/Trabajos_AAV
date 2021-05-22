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
    xlabel("$\alpha$ [$\mathrm{^o}$]",'Interpreter','latex');
    Save_as_PDF(h, ['Figures/','coeficientes'],'horizontal', 0, 0);
    close
    fig = fig+1;
end

% Ajuste de segundo orden

n=2;

DATA.cd_a = polyfit(DATA.angulo,DATA.cd,n);
DATA.cl_a = polyfit(DATA.angulo,DATA.cd,n);
DATA.cm_a = polyfit(DATA.angulo,DATA.cd,n);

try
    DATA.RMSE_cd = sqrt(mean((DATA.cd_a - DATA.cd).^2));
    DATA.RMSE_cl = sqrt(mean((DATA.cd_a - DATA.cd).^2));
    DATA.RMSE_cm = sqrt(mean((DATA.cd_a - DATA.cd).^2));
catch 
    disp('error')
end

% Segundo plot

if coeficientes_ajuste == 'y'
    h = figure(fig); set(h, 'Visible', 'off')
    hold on
    
    plot(DATA.angulo, DATA.cd, 'o',...
        'LineWidth', 1.5, 'Color', colors(1,:), 'DisplayName', "cd (experimentales")
    plot(DATA.angulo, polyval(DATA.cd_a,DATA.angulo), '-',...
        'LineWidth', 1.5, 'Color', colors(1,:), 'DisplayName', "cd (ajuste)")
    
    plot(DATA.angulo, DATA.cl, 'o',...
        'LineWidth', 1.5, 'Color', colors(2,:), 'DisplayName', "cl (experimentales)")
    plot(DATA.angulo, polyval(DATA.cl_a,DATA.angulo), '-',...
        'LineWidth', 1.5, 'Color', colors(2,:), 'DisplayName', "cl (ajuste)")
    
    plot(DATA.angulo, DATA.cm, 'o',...
        'LineWidth', 1.5, 'Color', colors(3,:), 'DisplayName', "cm (experimentales)")
    plot(DATA.angulo, polyval(DATA.cm_a,DATA.angulo), '-',...
        'LineWidth', 1.5, 'Color', colors(3,:), 'DisplayName', "cm (ajuste)")
    
    grid on; box on;
    legend('Interpreter', 'Latex', 'Location', 'Best')
    xlabel("$\alpha$ [$\mathrm{^o}$]",'Interpreter','latex');
    Save_as_PDF(h, ['Figures/','coeficientes_ajustados'],'horizontal', 0, 0);
    close
    fig = fig+1;
end

%% Eficiencia aerodinámica

if eficiencia == 'y'
    h = figure(fig); set(h, 'Visible', 'off')
    hold on
    plot(DATA.angulo, DATA.E, 'o-',...
        'LineWidth', 1.5)
    grid on; box on;
    ylabel('$E$','Interpreter','latex');
    xlabel("$\alpha$ [$\mathrm{^o}$]",'Interpreter','latex');
    Save_as_PDF(h, ['Figures/','eficiencia'],'horizontal', 0, 0);
    close
    fig = fig+1;
end

%% Presión y temperatura

if eficiencia == 'y'
    h = figure(fig);% set(h, 'Visible', 'off')
    hold on
    
    yyaxis left
    plot(DATA.angulo, DATA.p_norm, 'o-',...
        'LineWidth', 1.5)
    ylabel('$P_{norm}$','Interpreter','latex');
    
    yyaxis right
    plot(DATA.angulo, DATA.t_max, 'o-',...
        'LineWidth', 1.5)
    ylabel('$T$','Interpreter','latex');
        
    grid on; box on;
    xlabel("$\alpha$ [$\mathrm{^o}$]",'Interpreter','latex');
    Save_as_PDF(h, ['Figures/','PT'],'horizontal', 1, 1);
    close
    fig = fig+1;
end



