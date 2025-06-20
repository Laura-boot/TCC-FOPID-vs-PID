function entrada = criarEntrada(tempo, valor_inicial, valor_intermediario, valor_final, tempo1, tempo2)
    % Cria um sinal de entrada degrau com transições em tempos especificados.
    entrada = valor_inicial * ones(size(tempo));
    entrada(tempo >= tempo1 & tempo < tempo2) = valor_intermediario;
    entrada(tempo >= tempo2) = valor_final;
end
