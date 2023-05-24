% SISTEMAS LINEARES 2023.1
% ANTONIO ERALDO CAETANO MARTINS  -  415221

% Vou chamar n de nx
% Definindo o intervalo 0 >= nx >= 40
n_0 = 0;
n_n = 40;
nx = n_0:n_n;

% Com a função degrau unitário teremos apenas valores positivos de n para 
% que x seja diferente de 0, já que u[n] = 1 para n >= 0 e u[n] = 0 para
% n < 0:

% Sinal x[n]:
x = ((1/4).^nx) .* (nx >= 0);

% Sinal w[n]:
w = fliplr(x); % invertendo x
nw = (-1)*nx; % transformando em negativos
nw = fliplr(nw); % invertendo vetor de negativos

% Sinal g[n]:
g = x; 
ng = nx+(-5); % trazendo o vetor nx para a esquerda

% Plotando os sinais
figure('Position', [85, 70, 1200, 600])
stem(nx, x, 's', 'Color', 'red', 'LineWidth', 1.2, 'MarkerSize', 5.5, 'MarkerFaceColor', 'red');
hold on;
stem(nw, w, 'o', 'Color', 'green', 'LineWidth', 1.2, 'MarkerSize', 5.5, 'MarkerFaceColor', 'green');
hold on;
stem(ng, g, 'd', 'Color', 'blue', 'LineWidth', 1.2, 'MarkerSize', 5.5, 'MarkerFaceColor', 'blue');
hold off;

grid on;
legend('x[n]', 'w[n]', 'g[n]');
axis([-45 45 -0.1 1.1]);

title('x[n] = ((1/4)^n)*u[n],     w[n] = x[-n],     g[n] = x[n+5]');
xlabel('n');
ylabel('x[n], w[n], g[n]');
