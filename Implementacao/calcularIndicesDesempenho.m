% Função para Calcular e Exibir os índices de Desempenho

function calcularIndicesDesempenho(tempo, nivel_tanque, set_point, potencia_bomba, nome_controlador)
    % Função para calcular e exibir os índices de desempenho para controle e sinal de controle.
    % Parâmetros:
    %   tempo: Vetor de tempo (em segundos)
    %   nivel_tanque: Nível do tanque ao longo do tempo
    %   set_point: Valor de referência do nível do tanque
    %   potencia_bomba: Sinal de controle (potência da bomba)
    %   nome_controlador: Nome do controlador ('PI', 'PID', 'FOPID')
    % Calcular o erro entre o nível do tanque e o setpoint
    erro = set_point - nivel_tanque;
    % Calcular os índices de desempenho do erro (nível)
    ISE = trapz(tempo, erro.^2);                        % Integral do Erro ao Quadrado
    IAE = trapz(tempo, abs(erro));                      % Integral do Erro Absoluto
    ITAE = trapz(tempo, tempo .* abs(erro));            % Integral do Erro Absoluto Ponderado pelo Tempo
    % Calcular os índices de desempenho do sinal de controle (potência da bomba)
    ISE_controle = trapz(tempo, potencia_bomba.^2);             % Integral do Esforço ao Quadrado
    IAE_controle = trapz(tempo, abs(potencia_bomba));           % Integral do Esforço Absoluto
    ITAE_controle = trapz(tempo, tempo .* abs(potencia_bomba)); % Integral do Esforço Absoluto Ponderado pelo Tempo
    % Exibir os índices de desempenho no Command Window
    fprintf('\nÍndices de Desempenho Saída do Controle (%s):\n', nome_controlador);
    %fprintf('Erro:\n');
    fprintf('  ISE = %.4e\n', ISE);
    fprintf('  IAE = %.4e\n', IAE);
    fprintf('  ITAE = %.4e\n', ITAE);
    fprintf('\nSinal de Controle (Potência da Bomba):\n');
    fprintf('  ISE_controle = %.4e\n', ISE_controle);
    fprintf('  IAE_controle = %.4e\n', IAE_controle);
    fprintf('  ITAE_controle = %.4e\n', ITAE_controle);
end
