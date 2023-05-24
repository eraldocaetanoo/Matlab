% SISTEMAS LINEARES 2023.1
% ANTONIO ERALDO CAETANO MARTINS - 415221

clc
clear
close all

% Questão 01:

n_x = 0:200; % número de pontos

x = sin(0.2*pi*n_x) + 1.5*sin(0.5*pi*n_x) + 0.5*sin(0.8*pi*n_x); % sinal

figure('Position', [200, 400, 400, 275]); % figura 1
stem(n_x, x, 'o', 'Color', 'b', 'LineWidth', 0.9, 'MarkerSize', 3.5, 'MarkerFaceColor', 'b');
grid on;
xlabel('n');
ylabel('x[n]');
title('Sinal x[n]');
axis([-5 205 -3.5 3.5]);


% Questão 02:

n_h = 0:30; % número de pontos

h = (sin(0.3*pi*(n_h-15)))./(pi*(n_h-15)); % resposta ao impulso
h(n_h == 15) = 0.3; 
h(isnan(h)) = 0; % Se h[n_h] não existir para valores de n_h ~= 0:30, h[n_h] = 0;


figure('Position', [750, 400, 400, 275]); % figura 2
stem(n_h, h, 'o', 'Color', [0, 0.4, 0], 'LineWidth', 0.9, 'MarkerSize', 3.5, 'MarkerFaceColor', [0, 0.4, 0]);
grid on;
xlabel('n');
ylabel('h[n]');
title('Resposta ao impulso');
axis([-1 31 -0.1 0.35]);


% Questão 03:

y = conv(x,h);
n_y = 0:length(y)-1;

figure('Position', [200, 50, 400, 275]); % figura 3
stem(n_y, y, 'o', 'Color', 'r', 'LineWidth', 0.9, 'MarkerSize', 3.5, 'MarkerFaceColor', 'r');
grid on;
xlabel('n');
ylabel('y[n]');
title('Convolução entre x[n] e h[n]');


% Mostrando todos os sinais no mesmo gráfico, para comparação
figure('Position', [750, 50, 400, 275]); % figura 4
stem(n_x, x, 'o', 'Color', 'b', 'LineWidth', 0.9, 'MarkerSize', 3.5, 'MarkerFaceColor', 'b');
hold on;
stem(n_h, h, 'o', 'Color', [0, 0.4, 0], 'LineWidth', 0.9, 'MarkerSize', 3.5, 'MarkerFaceColor', [0, 0.4, 0]);
hold on;
stem(n_y, y, 'o', 'Color', 'r', 'LineWidth', 0.9, 'MarkerSize', 3.5, 'MarkerFaceColor', 'r');
grid on;
xlabel('n');
ylabel('x[n], h[n] e y[n]');
title('x[n], h[n] e convolução entre x[n] e h[n]: y[n]');
legend('x[n]','h[n]','y[n]');
hold off;


% Questão 04:

% Tem-se um caso de convolução implementada diretamente a partir de uma
% função nativa do Matlab, conv, que é realizada com somas dos termos, já
% que é uma convolução de sinais no tempo discreto.

% Pode-se ver a convolução do sinal de entrada x[n_x] com a resposta ao
% impulso h[n_h]. Para essa operação ser computacionalmente possível é
% necessário que hajam limites máximos e mínimos definidos numericamente, 
% diferentes de infinito, no caso foram definidos de acordo com os limites de 
% x[n_x] e h[n_h].

% Pode-se observar que na filtragem feita, frequencias e componentes do
% sinal de entrada são atenuados ou amplificados de acordo com a resposta
% ao impulso dada.





