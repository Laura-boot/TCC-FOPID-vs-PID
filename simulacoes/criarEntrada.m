% Função para Criar a Entrada da Simulação

function entrada = criarEntrada(tempo, valor_inicial, valor_intermediario, valor_final, tempo1, tempo2)
    % Cria um sinal de entrada degrau com transições em tempos especificados.
    % Parâmetros:
    %   tempo: Vetor de tempo
    %   valor_inicial: Valor antes do primeiro degrau
    %   valor_intermediario: Valor durante o degrau
    %   valor_final: Valor após o degrau
    %   tempo1: Tempo da primeira transição
    %   tempo2: Tempo da segunda transição
    % Retorno:
    %   entrada: Sinal de entrada criado
    entrada = valor_inicial * ones(size(tempo));
    entrada(tempo >= tempo1 & tempo < tempo2) = valor_intermediario;
    entrada(tempo >= tempo2) = valor_final;
end
