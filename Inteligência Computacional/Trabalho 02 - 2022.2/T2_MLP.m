
% TRABALHO 02 DE INTELIGÊNCIA COMPUTACIONAL 2022.2
% ANTONIO ERALDO CAETANO MARTINS - 415221

% Classifique o conjunto de dados Vertebral Column Data set (disponível em
% (https://archive.ics.uci.edu/ml/datasets/Vertebral+Column) usando as redes neurais
% MLP e RBF. Utilize a estratégia de validação hold-out (70% das amostras para treino e
% o restante para teste) e efetue 10 execuções. O resultado deve ser a acurácia média.
% Obs.: É permitido usar funções já disponíveis para a rede neural MLP. A rede RBF deverá ser implementada.


clear;

% Pegando dados do arquivo
base = load ('column_3C.dat');

disp("Aguarde...");

% Obtendo tamanho da base
[N, p] = size(base);

% Dados de entrada
B = base(:,1:6)';

% Criando matriz de dados de saída
D = [N 3];

% Quantidade de classes
classes = 3;

cont = 0;

% Transformando classes em saídas binárias
D_aux = zeros(N, classes);
for a=1:N
    
    if base(a, 7) == 1 
            D(a,1) = 1; D(a,2) = 0; D(a,3) = 0;
    end
    if base(a, 7) == 2
            D(a,1) = 0; D(a,2) = 1; D(a,3) = 0;
    end
    if base(a, 7) == 3 
            D(a,1) = 0; D(a,2) = 0; D(a,3) = 1;
    end
    
end

D = D';

D_auxx = D;
B_auxx = B;

B_auxTreino = zeros(6,217);
B_auxTeste = zeros(6,93);

D_auxTreino = zeros(3,217);
D_auxTeste = zeros(3,93);


% holdout
% 70% de amostras para treino
% 30% de amostras para teste
Val = randsample(310,310); % sorteando as linhas do conjunto de amostras

for r=1:217   % 217 equivale a 70% de N
    B_auxTreino(:,r) = B_auxx(:,Val(r,:))';   % 70% das linhas das entradas para treino
    D_auxTreino(:,r) = D_auxx(:,Val(r,:))';   % 70% das linhas das saídas para treino
end

for r=218:310   % (310+1)-218 = 93 equivale a 30% de N
    B_auxTeste(:,r-217) = B_auxx(:,Val(r,:))';   % 30% das linhas das entradas para teste
    D_auxTeste(:,r-217) = D_auxx(:,Val(r,:))';   % 30% das linhas das saídas para teste
end

for i=1:217
    B_treino = B_auxTreino;
    D_treino = D_auxTreino;
    
    % Remove a amostra i do conjunto de dados
    B_treino(:,i) = [];
    D_treino(:,i) = [];    
end

for ii=1:93
    B_teste = B_auxTeste(1:6,ii);
    D_teste = D_auxTeste(1:3,ii);

    net = feedforwardnet(10);
    net.trainParam.showWindow = false; % Não mostrar a janela de treinamento
    % Definindo a quantidade de épocas por função do Matlab
    net.trainParam.epochs = 10;

    % Treinando a rede
    net = train(net,B_treino,D_treino);
    previsao = net(B_teste);
    
    % Verificando e contando acertos da rede
    [W,X] = max(D_teste);
    [Y,Z] = max(previsao);

    if (X == Z)
        cont = cont + 1;
    end
end

% Mostrando a acurácia média
disp("A acurácia média é: " + cont/93);
