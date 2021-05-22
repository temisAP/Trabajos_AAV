clear all
clc

%% LEER DATOS

filename = '../Resultados.xlsx';

DATA = struct();

% Read xls sheet
data = xlsread(filename);

% Assign struct fields
DATA.angulo = data(1,2:end);

DATA.cd = data(2,2:end);
DATA.cl = data(3,2:end);
DATA.cm = data(4,2:end);

DATA.p_max = data(5,2:end);
DATA.t_max = data(6,2:end);

DATA.E = data(7,2:end);
DATA.p_norm = data(8,2:end);


save('DATA.mat', 'DATA');