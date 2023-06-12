
// TRABALHO 01 DE INTELIGÊNCIA COMPUTACIONAL 2022.2

// ANTONIO ERALDO CAETANO MARTINS  -  415221

// QUESTÃO 03
// Dada a base de dados abaixo, na qual a primeira e segunda colunas são as variáveis
// regressoras (x1 e x2) e a terceira coluna é a variável dependente (y), determine o modelo
// de regressão múltipla (plano) com parâmetros estimados pelo método_ dos mínimos
// quadrados. Avalie a qualidade do modelo pela métrica R2. (3,0 pontos)

D =[122 139 0.115;
    114 126 0.120;
    086 090 0.105;
    134 144 0.090;
    146 163 0.100;
    107 136 0.120;
    068 061 0.105;
    117 062 0.080;
    071 041 0.100;
    098 120 0.115];
    
x1 = D(:,1);
x2 = D(:,2);
y = D(:,3);

X = [ones(10,1) x1 x2];  // cria matriz X com 1s na primeira coluna, com a primeira coluna de D na segunda coluna e com a segunda coluna de D na terceira coluna

beta_= (X' * X) \ X' * y;

// plota y
scatter3d(x1,x2,y,'.'); 
  
x11=x1;
x22=x2;
[x1,x2] = meshgrid(1:0.5:200,1:0.5:200); 

y1 = beta_(1) + beta_(2).*(x11) + beta_(3).*(x22); // usado para calcular R2
y_ = beta_(1) + beta_(2).*(x1) + beta_(3).*(x2); // usado para plotar

mesh (x1,x2,y_); // plota o plano

R2= 1-((sum((y-y1).^2))/(sum((y-mean(y)).^2)));

printf("\nPara obter o valor para a métrica R2, digite ""R2"" na linha de comando.\n");




