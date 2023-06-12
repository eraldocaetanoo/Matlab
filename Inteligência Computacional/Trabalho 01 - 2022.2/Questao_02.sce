
// TRABALHO 01 DE INTELIGÊNCIA COMPUTACIONAL 2022.2

// ANTONIO ERALDO CAETANO MARTINS  -  415221

// QUESTÃO 02
// Usando o conjunto de dados do aerogerador (variável de entrada: velocidade do vento – m/s, 
// variável de saída: potência gerada – kWatts), determine os modelos de regressão
// polinomial (graus 2 a 7) com parâmetros estimados pelo método_ dos mínimos quadrados. (3,0 pontos)
// Avalie a qualidade de cada modelo pela métrica R2 e R2aj (equações 48 e 49, slides sobre
// Regressão Múltipla).

base = fscanfMat('aerogerador.dat');

x = base(:,1);
y = base(:,2);

n = length(y);

printf("\n");
g = input('Digite o grau (2 a 7) ou 0 para sair: ');

if g == 1 then
    
    plot(x,y,'.');
    X = [ones(n, 1) x ];
    
    beta_= (X' * X) \ X' * y; // mínimos quadrados pela equação: X' * X * beta_ = X' * y 

    
    y_ = beta_(1) + beta_(2) * X(:,2);
    plot(x,y_, 'r-');
    
    [l, c] = size(X); //quantidade de linhas e colunas
    k = c - 1; //quantidade de termos
    p = k + 1;
    
    
    R2 = 1 -((sum((y-y_).^2))/(sum((y-mean(y)).^2)));
    
    R2aj = 1 - ((sum((y-y_).^2))/(n-p)) / ((sum((y-mean(y)).^2))/ (n - 1));
    
elseif g == 2 then
    
    plot(x,y,'.');
    X = [ones(n, 1) x x.^2];
    beta_= (X' * X) \ X' * y; // mínimos quadrados

    y_ = beta_(1) + beta_(2) * X(:,2) + beta_(3) * X(:,3);
    plot(x,y_, 'r-');
    
    [l, c] = size(X); //quantidade de linhas e colunas
    k = c - 1; //quantidade de termos
    p = k + 1;
    
    
    R2 = 1 -((sum((y-y_).^2))/(sum((y-mean(y)).^2))); // R2
    
    R2aj = 1 - ((sum((y-y_).^2))/(n-p)) / ((sum((y-mean(y)).^2))/ (n - 1)); // R2aj
    
elseif g == 3 then
    
    plot(x,y,'.');
    X = [ones(n, 1) x x.^2 x.^3];
    beta_= (X' * X) \ X' * y; // mínimos quadrados

    y_ = beta_(1) + beta_(2) * X(:,2) + beta_(3) * X(:,3) + beta_(4) * X(:,4);
    plot(x,y_, 'r-');
    
        
    [l, c] = size(X); //quantidade de linhas e colunas
    k = c - 1; //quantidade de termos
    p = k + 1;
    
    
    R2 = 1 -((sum((y-y_).^2))/(sum((y-mean(y)).^2)));
    
    R2aj = 1 - ((sum((y-y_).^2))/(n-p)) / ((sum((y-mean(y)).^2))/ (n - 1));
    
elseif g == 4 then
    
    plot(x,y,'.');
    X = [ones(n, 1) x x.^2 x.^3 x.^4];
    beta_= (X' * X) \ X' * y; // mínimos quadrados

    y_ = beta_(1) + beta_(2) * X(:,2) + beta_(3) * X(:,3) + beta_(4) * X(:,4) + beta_(5) * X(:,5);
    plot(x,y_, 'r-');
    
    [l, c] = size(X); //quantidade de linhas e colunas
    k = c - 1; //quantidade de termos
    p = k + 1;
    
    
    R2 = 1 -((sum((y-y_).^2))/(sum((y-mean(y)).^2)));
    
    R2aj = 1 - ((sum((y-y_).^2))/(n-p)) / ((sum((y-mean(y)).^2))/ (n - 1));
    
elseif g == 5 then
    
    plot(x,y,'.');
    X = [ones(n, 1) x x.^2 x.^3 x.^4 x.^5];
    beta_= (X' * X) \ X' * y; // mínimos quadrados

    y_ = beta_(1) + beta_(2) * X(:,2) + beta_(3) * X(:,3) + beta_(4) * X(:,4) + beta_(5) * X(:,5) + beta_(6) * X(:,6);
    plot(x,y_, 'r-');
    
        
    [l, c] = size(X); //quantidade de linhas e colunas
    k = c - 1; //quantidade de termos
    p = k + 1;
    
    
    R2 = 1 -((sum((y-y_).^2))/(sum((y-mean(y)).^2)));
    
    R2aj = 1 - ((sum((y-y_).^2))/(n-p)) / ((sum((y-mean(y)).^2))/ (n - 1));
    
elseif g == 6 then
    
    plot(x,y,'.');
    X = [ones(n, 1) x x.^2 x.^3 x.^4 x.^5 x.^6];
    beta_= (X' * X) \ X' * y; // mínimos quadrados

    y_ = beta_(1) + beta_(2) * X(:,2) + beta_(3) * X(:,3) + beta_(4) * X(:,4) + beta_(5) * X(:,5) + beta_(6) * X(:,6) + beta_(7) * X(:,7);
    plot(x,y_, 'r-');
    
        
    [l, c] = size(X); //quantidade de linhas e colunas
    k = c - 1; //quantidade de termos
    p = k + 1;
    
    R2 = 1 -((sum((y-y_).^2))/(sum((y-mean(y)).^2)));
    
    R2aj = 1 - ((sum((y-y_).^2))/(n-p)) / ((sum((y-mean(y)).^2))/ (n - 1));
    
elseif g == 7 then
    
    plot(x,y,'.');
    X = [ones(n, 1) x x.^2 x.^3 x.^4 x.^5 x.^6 x.^7];
    beta_= (X' * X) \ X' * y; // mínimos quadrados

    y_ = beta_(1) + beta_(2) * X(:,2) + beta_(3) * X(:,3) + beta_(4) * X(:,4) + beta_(5) * X(:,5) + beta_(6) * X(:,6) + beta_(7) * X(:,7) + beta_(8) * X(:,8);
    plot(x,y_, 'r-');
    
        
    [l, c] = size(X); //quantidade de linhas e colunas
    k = c - 1; //quantidade de termos
    p = k + 1;
    
    
    R2 = 1 -((sum((y-y_).^2))/(sum((y-mean(y)).^2)));
    
    R2aj = 1 - ((sum((y-y_).^2))/(n-p)) / ((sum((y-mean(y)).^2))/ (n - 1));
    
elseif g == 0 then
    abort;
    
else 
    printf("INVÁLIDO!!!\n");
    abort;
end

printf("-------------------------------------------------------------------------------\n");
printf("Para obter o valor para a métrica R2, digite ""R2"" na linha de comando.\n");
printf("Para obter o valor para a métrica R2aj, digite ""R2aj"" na linha de comando.\n");
printf("-------------------------------------------------------------------------------\n");
