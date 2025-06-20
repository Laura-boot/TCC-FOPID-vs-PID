% Função para Gerar os Gráficos de Nível do Tanque e Sinal de Controle.

function gerarPlots(tempo, nivel_tanque, potencia_bomba, set_point, controlador)
    % Gera os gráficos de nível do tanque e sinal de controle.
    % Parâmetros:
    %   tempo: Vetor de tempo
    %   nivel_tanque: Sinal de nível do tanque
    %   potencia_bomba: Sinal de controle (potência da bomba)
    %   set_point: Valor do setpoint
    %   controlador: Nome do controlador para identificação nos gráficos
    % Plotando o nível do tanque e o setpoint
    figure;
    subplot(2,1,1);
    plot(tempo, nivel_tanque, 'b', 'LineWidth', 1.5); hold on;
    plot(tempo, repmat(set_point, size(tempo)), 'r--', 'LineWidth', 1.5);
    title(['Nível do Tanque com Controle ', controlador]);
    xlabel('Tempo (s)');
    ylabel('Nível do Tanque (%)');
    legend(['Nível do Tanque (', controlador, ')'], 'Setpoint');
    grid on;
    % Plotando o sinal de controle (potência da bomba)
    subplot(2,1,2);
    plot(tempo, potencia_bomba, 'g', 'LineWidth', 1.5);
    title(['Sinal de Controle - Potência da Bomba (Controle ', controlador, ')']);
    xlabel('Tempo (s)');
    ylabel('Potência da Bomba (%)');
    legend(['Potência da Bomba (', controlador, ')']);
    grid on;
end
