% Função para Simular o Sistema e Calcular os Índices de Desempenho.

function [saida, erro, indices] = simularSistema(tipo, G, C, entrada, tempo)
    % Simula o sistema em malha fechada e calcula os índices de desempenho.
    % Parâmetros:
    %   tipo: Tipo do controlador ('PI', 'PID', 'FOPID')
    %   G: Função de transferência do processo
    %   C: Função de transferência do controlador
    %   entrada: Sinal de entrada (com ou sem ruído)
    %   tempo: Vetor de tempo da simulação
    % Retornos:
    %   saida: Resposta do sistema
    %   erro: Erro entre entrada e saída
    %   indices: Estrutura contendo os índices de desempenho
    % Sistema em malha fechada
    sistema_malha_fechada = feedback(C * G, 1);
    % Simular a resposta
    saida = lsim(sistema_malha_fechada, entrada, tempo);
    % Ajustar dimensões de entrada e saída para serem consistentes
    entrada = entrada(:); % Transforma em coluna, se necessário
    saida = saida(:);     % Transforma em coluna, se necessário
    % Calcular o erro
    erro = entrada - saida;
    % Calcular índices de desempenho
    indices.ISE = trapz(tempo, erro.^2);
    indices.IAE = trapz(tempo, abs(erro));
    indices.ITAE = trapz(tempo, tempo' .* abs(erro));
    % Exibir os resultados dos índices de desempenho
    switch tipo
        case 'PI'
            fprintf('Indices de Desempenho do controlador PI: \n');
        case 'PID'
            fprintf('Indices de Desempenho do controlador PID: \n');
        case 'FOPID'
            fprintf('Indices de Desempenho do controlador FOPID: \n');
        otherwise
            error('Tipo de controlador inválido. Use "PI", "PID" ou "FOPID".');
    end
    fprintf('ISE = %.4e\n', indices.ISE);
    fprintf('IAE = %.4e\n', indices.IAE);
    fprintf('ITAE = %.4e\n', indices.ITAE);
    fprintf('\n');
end
