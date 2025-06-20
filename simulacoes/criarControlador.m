% Função para Criar a Função de Transferência do Controlador

function C = criarControlador(tipo, params)
    % Cria a função de transferência do controlador com base no tipo.    % Parâmetros:
    %   tipo: Tipo do controlador ('PI', 'PID', 'FOPID')
    %   params: Estrutura contendo os parâmetros específicos do controlador    % Retorno:
    %   C: Função de transferência do controlador    switch tipo
        case 'PI'
            % Controlador PI na forma paralela
            C = tf([params.kp, params.ki], [1, 0]);
        case 'PID'
            % Controlador PID na forma paralela
            C = tf([params.kd, params.kp, params.ki], [1, 0]);
        case 'FOPID'
            % Aproximação de Oustaloup para termos fracionários
            [int_numerator, int_denominator] = oustaloupApprox(-params.lambda, params.N, …
                                                                          params.w_low, params.w_high);
            I_frac = tf(int_numerator, int_denominator);
            [der_numerator, der_denominator] = oustaloupApprox(params.mu, params.N, …
                                                                             params.w_low, params.w_high);
            D_frac = tf(der_numerator, der_denominator);
            % Controlador FOPID como combinação dos termos
            C = params.kp + params.ki * I_frac + params.kd * D_frac;
        otherwise
            error('Tipo de controlador inválido. Use "PI", "PID" ou "FOPID".');
    end
end
