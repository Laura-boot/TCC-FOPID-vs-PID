%Função para Aproximação de Oustaloup

function [num, den] = oustaloupApprox(alpha, N, w_low, w_high)
    % Aproximação de Oustaloup para s^alpha
    % alpha: ordem fracionária
    % N: ordem da aproximação
    % w_low: limite inferior de frequência
    % w_high: limite superior de frequência
    % Inicializar os polinômios de numerador e denominador
    num = 1;
    den = 1;
    % Calcular os polos e zeros da aproximação
    for k = -N:N
        omega_k = w_low * (w_high / w_low)^((k + N + 0.5) / (2 * N + 1));
        % Constrói cada termo da aproximação e multiplica no polinômio
        num = conv(num, [1, omega_k^alpha]);
        den = conv(den, [1, omega_k^(1 - alpha)]);
    end
end
