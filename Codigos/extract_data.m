clear all
clc

%% LEER DATOS

filename = '../Resultados.xlsx';

DATA = struct();

% Read xls sheet
data = xlsread(filename);

% Assign struct fields
DATA.angulo = data(1,:);

DATA.cd = data(2,:);
DATA.cl = data(3,:);
DATA.cm = data(4,:);

DATA.p_max = data(5,:);
DATA.t_max = data(6,:);

DATA.E = data(7,:);
DATA.p_norm = data(8,:);


save('DATA.mat', 'DATA');