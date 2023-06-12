
% TRABALHO 02 DE INTELIGÊNCIA COMPUTACIONAL 2022.2
% ANTONIO ERALDO CAETANO MARTINS - 415221

% Classifique o conjunto de dados Vertebral Column Data set (disponível em
% (https://archive.ics.uci.edu/ml/datasets/Vertebral+Column) usando as redes neurais
% MLP e RBF. Utilize a estratégia de validação hold-out (70% das amostras para treino e
% o restante para teste) e efetue 10 execuções. O resultado deve ser a acurácia média.
% Obs.: É permitido usar funções já disponíveis para a rede neural MLP. A rede RBF deverá ser implementada.


clear;

% Contador para soma de acurácias;
s = 0;

disp("Aguarde...");

for a=1:10    
    
    % Pegando dados do arquivo
    base = load('column_3C.dat');
    
    % Separando coluna de dados de entrada de coluna de classes
    B = base(:,1:6);
    D = base(:,7);
    
    % Quantidade de classes
    classes = 3;
    
    % Obtendo tamanho de B
    [N, p] = size(B);   % N = 310 
    
    cont = 0;
    
    % Transformando classes em saídas binárias
    D_aux = zeros(N, classes);
    
    for i=1:N
        if (D(i,1) == 1)
            D_aux(i,:) = [1 0 0];
        end
        if (D(i,1) == 2)
            D_aux(i,:) = [0 1 0];
        end
        if (D(i,1) == 3)
            D_aux(i,:) = [0 0 1];
        end
    end
    
    % normalizando dados de entrada
    B = (B - min(B)) ./ (max(B) - min(B));

    % Quantidade de neurônios
    q = 45;
    
    % Definição aleatória para centróides
    C = randn(q,p);
    
    sigma = 1;
    
    % Matriz de ativação de centróides ocultos
    ativacao = zeros(q,(217-1));
    

    % Separando dados para treino e teste
    D_auxx = D_aux;
    B_auxx = B;

    B_auxTreino = zeros(217,6);
    B_auxTeste = zeros(93,6);
    
    D_auxTreino = zeros(217,3);
    D_auxTeste = zeros(93,3);
    
    % holdout
    % 70% de amostras para treino
    % 30% de amostras para teste
    Val = randsample(310,310);   % sorteando as linhas do conjunto de amostras
    
    for r=1:217   % 217 equivale a 70% de N
        B_auxTreino(r,:) = B_auxx(Val(r,:),:);   % 70% das linhas das entradas para treino
        D_auxTreino(r,:) = D_auxx(Val(r,:),:);   % 70% das linhas das saídas para treino
    end

    for r=218:310   % (310+1)-218 = 93 equivale a 30% de N
        B_auxTeste(r-217,:) = B_auxx(Val(r-217,:),:);   % 30% das linhas das entradas para teste
        D_auxTeste(r-217,:) = D_auxx(Val(r-217,:),:);   % 30% das linhas das saídas para teste
    end

    % holdout
    for k=1:217

        B_treino = B_auxTreino;
        D_treino = D_auxTreino;

        % Remove amostra k do conjunto de dados
        B_treino(k,:) = [];
        D_treino(k,:) = [];
        
        % Definindo a ativação dos centroides ocultos com a função gaussiana
        for i=1:q
            dist = B_treino - C(i,:);
            for j=1:(217-1)
                norma = sum(dist(j,:).^2)^(1/2);
                ativacao(i,j) = exp(-(norma^2) / (2*sigma^2) );
            end
        end
    end


    % Adicionando bias
    ativacao = [ones(1, (217-1)); ativacao];
 
    % Calculando pesos
    M = D_treino' * ativacao' * (ativacao*ativacao')^(-1);
  
    % Removendo bias
    ativacao(1,:) = [];  
    
    % Calculando a ativação da rede para o dado removido
    ativ_teste = zeros(q, 1);

    % holdout
    for t=1:93
        d_teste = D_auxTeste(t,:);
        for i=1:q
            dist = B_auxTeste(t,:) - C(i,:);
            norma = sum(dist.^2)^(1/2);
            ativ_teste(i,1) = exp(-(norma^2) / (2*sigma^2) );
        end
        
        % Adicionando bias
        ativ_teste = [1; ativ_teste];
        
        % Calculando a previsão da rede para o dado t
        previsao = ativ_teste' * M';
        
        % t é removido do treinamento
        ativ_teste(1,:) = [];
        
        % Verificando e contando acertos da rede
        [W,X] = max(previsao);
        [Y,Z] = max(d_teste);
        
        if (X == Z)
            cont = cont + 1;
        end
    end

    % Soma das acurácias
    s = cont/93 + s;
    cont = 0;

end

% Mostrando a acurácia média
disp("A acurácia média é: " + s/10);
