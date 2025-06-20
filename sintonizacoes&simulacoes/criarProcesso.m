% Função para Criar a Função de Transferência do Processo

function G = criarProcesso(tipo, params)
    % Cria a função de transferência do processo com base no tipo e parâmetros.
    % Parâmetros:
    %   tipo: Tipo do modelo ('primeira_ordem', 'segunda_ordem')
    %   params: Estrutura contendo os parâmetros específicos do modelo
    % Retorno:
    %   G: Função de transferência do processo
    switch tipo
        case 'primeira_ordem'
            G = tf(params.k, [params.tau, 1]); % Primeira ordem
        case 'segunda_ordem'
            G = tf(params.k, [params.w1, params.w2, 1]); % Segunda ordem
        otherwise
            error('Tipo de modelo inválido. Use "primeira_ordem" ou "segunda_ordem".');
    end
end
