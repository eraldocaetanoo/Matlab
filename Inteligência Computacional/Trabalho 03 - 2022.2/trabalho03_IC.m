
% TRABALHO 03 DE INTELIGÊNCIA COMPUTACIONAL 2022.2
% Antonio Eraldo Caetano Martins - 415221

clc;

clear;
disp("Aguarde...");
maiornota = 0;

    M = [0 1 2 4 6 2 2 3 3 5 6 1 4 5;
         1 0 3 2 1 3 6 3 4 4 2 4 4 4;
         2 3 0 1 3 3 2 3 4 1 3 5 5 6;
         4 2 1 0 5 1 4 2 3 4 4 8 2 2;
         6 1 3 5 0 2 1 6 5 2 3 4 2 2;
         2 3 3 1 2 0 3 1 2 3 5 7 3 4;
         2 6 2 4 1 3 0 2 1 2 5 2 4 3;
         3 3 3 2 6 1 2 0 5 5 1 5 3 6;
         3 4 4 3 5 2 1 5 0 1 4 4 5 3;
         5 4 1 4 2 3 2 5 1 0 5 4 4 2;
         6 2 3 4 3 5 5 1 4 5 0 4 2 1;
         1 4 5 8 4 7 2 5 4 4 4 0 1 3;
         4 4 5 2 2 3 4 3 5 4 2 1 0 1;
         5 4 6 2 2 4 3 6 3 2 1 3 1 0];
    
    N = 100000; % quantidade de indivíduos
    NP = 300;   % quantidade de pais selecionados aleatoriamente a partir dos indivíduos
    
    populacao = zeros(N,14);

    % Seleção por Torneio
    for i=1:N
        populacao(i,:) = randsample(14,14); % criando população com valores aleatórios de 1 a 14
    end

for g=1:50 % Gerações   
    
    % Função que faz parte da Seleção por Torneio
    pais = funcaonotas(populacao,N,M,NP); % calculando a nota da população e retornando ordenado da maior para a menor nota
      
    paisAux = pais;
    
    % CROSSOVER A PARTIR DAQUI (CROSSOVER DE MAPEAMENTO PARCIAL)
 
    filhospCross = zeros(2,15);
    FILHOS = zeros(NP*2,15);
    F1 = zeros(NP,15);
    F2 = zeros(NP,15);

    % Adicionar for de tamanho NP pra fazer varios casos até encher população desejada
    for h=1:NP  % A quantidade de filhos gerados será NP*2, por que serão selecionados 2 pais por vez que irão gerar 2 filhos
        
        filhosAux = randsample(NP,2)'; % sorteando os 2 pais para gerar filhos
        for r=1:2
            filhospCross(r,:) = paisAux(filhosAux(1,r),:); % pegando os 2 pais
        end

        % os cortes para mapeamento foram feitos antes da posição 6 e depois da posição 10
        filhosmap = zeros(2,15);
        for r=1:2
            for i=5:10
               % colocando em filhomap os valores entre os cortes
               filhosmap(r,i) = filhospCross(r,i);
            end
        end

        filhosmap = flipud(filhosmap); % trocando a posição de um pai pela posição do outro para iniciar o mapeamento e a geração de filhos
        faux = filhosmap;

        for r=1:2
            for i=1:4
                % preenchendo as posições antes do 1º corte dos dois filhos com os valores que já não
                % estejam no intervalo feito pelos dois cortes, para cada filho a partir dos pais
                if isempty(find(faux(r,5:10) == filhospCross(r,i),1)) == 1
                    faux(r,i) = filhospCross(r,i);
                end
            end
            
            for i=11:14
                % preenchendo as posições depois do 2º corte dos dois filhos com os valores que já não
                % estejam no intervalo feito pelos dois cortes, para cada filho a partir dos pais
                if isempty(find(faux(r,5:10) == filhospCross(r,i),1)) == 1
                    faux(r,i) = filhospCross(r,i);
                end
            end

            % preenchendo os valores que faltam em cada filho com os valores
            % do intervalo do outro filho, que já não estejam no intervalo do
            % filho corrente
            for w=1:14
                if r == 1
                    for ww=5:10
                        if isempty(find(faux(r,:) == faux(r+1,ww),1)) == 1
                            if faux(r,w) == 0
                                faux(r,w) = faux(r+1,ww);
                            end
                        end
                    end
                end
                if r == 2
                    for ww=5:10
                        if isempty(find(faux(r,:) == faux(r-1,ww),1)) == 1
                            if faux(r,w) == 0
                                faux(r,w) = faux(r-1,ww);
                            end
                        end
                    end
                end   
            end
            
            % MUTAÇÃO (trocando dois valores de posição)
            for j=1:2
                mutAux = faux(j,7);
                faux(j,7) = faux(j,8);
                faux(j,8) = mutAux;
            end
        end

        % guardando em FILHOS os filhos mutados gerados
        for r=1:2
            if r == 1
                    F1(h,:) = faux(r,:);  
            end
            if r == 2
                    F2(h,:) = faux(r,:); 
            end
        end
        FILHOS = [F1;F2];
        faux = zeros(2,15); 
        filhosAux = 0;
    end
    [ss,tt] = size(FILHOS);
    result = funcaonotas(FILHOS,ss,M,1); % calculando a nota dos FILHOS e retornando o de maior nota
    if result(1,15) >= maiornota          % obtendo a maior nota e o caminho dessa nota
        maiornota = result(1,15);
        caminho = result(1,1:14);
        custo = round(1000/maiornota);
    end
end

clc;
disp("Melhor caminho encontrado: ");
disp(caminho);
disp("Custo de percurso: ");
disp(custo);