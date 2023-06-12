
clear;

temperatura = input("Digite a temperatura: \n");
umidade = input("Digite a umidade: \n");
proximidade = input("Digite a proximidade: \n");
industrializacao = input("Digite a industrialização: \n");

if (temperatura >= 0 && temperatura <=100 && umidade >= 0 && umidade <=100 && industrializacao >= 0 && industrializacao <=100 && proximidade >= 0 && proximidade <= 50)
    
    % Funções de pertinência para os conjuntos nebulosos, fornecidas pelo livro.

    % Temperatura alta.

    if (temperatura >= 25)
        ta = (temperatura-25)/75;
    elseif (temperatura < 25)
        ta = 0;
    end
    
    % Temperatura baixa.

    if (temperatura <= 75)
        tb = 1 - (temperatura/75);
    elseif (temperatura > 75)
        tb = 0;
    end

    % Umidade alta.

    ua = umidade/100;

    % Umidade baixa.
    
    ub = 1 - (umidade/100);

    % Proximidade perto.

    if (proximidade < 10)
        pp = 1;
    elseif (proximidade >= 10 && proximidade < 40)
        pp = (40 - proximidade)/30;
    elseif (proximidade >= 40)
        pp = 0;
    end

    % Proximidade longe.

    if (proximidade < 10)
        pl = 0;
    elseif (proximidade >= 10 && proximidade < 40)
        pl = (proximidade - 10)/30;
    elseif (proximidade >= 40)
        pl = 1;
    end

    % Industrialização alta.
    
    if (industrializacao < 10)
        ia = 0;
    elseif (industrializacao >= 10 && industrializacao < 20)
        ia = (industrializacao - 10)/10;
    elseif (industrializacao >= 20)
        ia = 1;
    end

    % Industrialização baixa.
    
    if (industrializacao < 10)
        ib = 1;
    elseif (industrializacao >= 10 && industrializacao < 20)
        ib = (20 - industrializacao)/10;
    elseif (industrializacao >= 20)
        ib = 0;
    end
    
    % Regras nebulosas.
    % Ao se tomar o mínimo entre os valores estaremos realizando a operação AND entre os valores.
    % Ao se tomar o máximo entre os valores estaremos realizando a operação OR entre os valores.

    vreg1 = [ta ua pp ib];
    reg1 = min(vreg1); % Regra 1.

    vreg2 = ia;
    reg2 = min(vreg2); % Regra 2.

    vreg3 = [ua ta max(ib,pp)];
    reg3 = min(vreg3); % Regra 3.
    
    vreg4 = [tb ub];
    reg4 = min(vreg4); % Regra 4.


    dose_muito_baixa = reg4;
    dose_baixa = reg2;
    dose_alta = max(reg1,reg3); % Como temos duas regras com a mesma saída tomamos o valor máximo dessas regras.

    v = zeros(1,100); % Vetor para os valores das saídas nebulosas para as doses
    
    % Três WHILE para preenchimento do vetor com os valores nebulosos para dose alta,
    % dose baixa e dose muito baixa.

    % Valores tomados a partir do valor mínimo entre as doses encontradas a
    % partir das regras e as dose encontradas a partir dos conjuntos
    % nebulosos definidos pelo livro, conjuntos esses usados para descrever
    % a saída do sistema para cada dose.
    
    % Range definido em [1,100].

    i = 1;
    while i<=100
        valor = min(dose_alta,max(0,(i-40)/60));
        v(i) = valor;
        i=i+5;
    end

    i = 1;
    while i<=100
        valor = min(dose_baixa,max((50-i)/50,0)); 
        aux = max(valor,v(i));
        v(i) = aux;
        i=i+5;
    end

    i = 1;
    while i<=100
        valor = min(dose_muito_baixa,max((10-i)/10,0)); 
        aux = max(valor,v(i));
        v(i) = aux;
        i=i+5;
    end
    
    % FOR usado para limitar as casas decimais dos valores de 1 a 42 do vetor v.

    for i=1:42  
        v(:,i) = floor(v(1,i)*10)/10;
    end
    
    % Cálculo do centróide.
    
    % Variáveis somatórias.

    s1 = 0; 
    s2 = 0;

    i=1;
    while i<=100
        s1 = (i+5)*v(i) + s1; % Soma realizada com incrementos de 5 assim como descrito no livro.
        s2 = v(i) + s2;
        i=i+5;
    end
    
    dose = (floor(s1)-5)/(round(s2*10)/10); % Formatação do valor de saída para a dose recomendada.

    disp(" ");
    disp(" ");
    %disp("A dose recomendada será de: ");
    fprintf("A dose recomendada será de: %.2f\n\n", dose);
    %disp(dose); % Mostra a dose recomendada.
     
else
    disp("Digite valores válidos!");
end







