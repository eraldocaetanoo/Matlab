% SISTEMAS LINEARES 2023.1
% ANTONIO ERALDO CAETANO MARTINS - 415221 

clc
clear
close all

% Questão 02:

n = 0:5; % Intervalo de valores de n = {0,1,2,3,4,5}
x = zeros(size(n)); 
x(n+1) = 1; % Atribuindo o valor 1 para os valores de x[n]

figure('Position', [50, 100, 600, 500]);
stem(n, x, 'o', 'Color', 'r', 'LineWidth', 0.9, 'MarkerSize', 3.5, 'MarkerFaceColor', 'r');
grid on;
xlabel('n');
ylabel('x[n]');
title('Sinal de entrada x[n]');
axis([-10 10 -0.5 1.5]);


% Questão 03:

% Coeficientes da equação de diferenças: y[n] - y[n-1] = x[n] + x[n-1]
B = [1 1];
A = [1 -1];

% Filtrando o sinal de entrada usando a equação de diferenças
y = filter(B,A,x);

figure('Position', [700, 100, 600, 500]);
stem(n, y, 'o', 'Color', [0, 0.4, 0], 'LineWidth', 0.9, 'MarkerSize', 3.5, 'MarkerFaceColor', [0, 0.4, 0]);
grid on;
xlabel('n');
ylabel('y[n]');
title('Sinal filtrado y[n]');
axis([-10 10 -0.5 12]);
