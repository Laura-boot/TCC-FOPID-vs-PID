% Função para Adicionar Ruído à Entrada

function entrada_ruidosa = adicionarRuido(entrada, amplitude_ruido)
    % Adiciona ruído gaussiano ao sinal de entrada.
    % Parâmetros:
    %   entrada: Sinal de entrada original
    %   amplitude_ruido: Amplitude do ruído
    % Retorno:
    %   entrada_ruidosa: Sinal de entrada com ruído
    ruido = amplitude_ruido * randn(size(entrada));
    entrada_ruidosa = entrada + ruido;
end
