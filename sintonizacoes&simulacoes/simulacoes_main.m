% Código Principal para as Sintonizações e Simulações

% Limpar tela e variáveis
clear all; close all; clc
% Parâmetros comuns do processo
tau = 2.725;          % Constante de tempo da FT de primeira ordem
k = 1.027;            % Ganho do sistema
w1 = 0.022;           % Multiplicação das constantes de tempo da FT de segunda ordem
w2 = 2.732;           % Soma das constantes de tempo da FT de segunda ordem
% Parâmetros comuns para simulação
tempo = 0:0.1:1600;
amplitude_ruido = 0.05;
% Criar entrada
entrada = criarEntrada(tempo, 70, 72, 70, 400, 1200);
entrada_ruidosa = adicionarRuido(entrada, amplitude_ruido);
% Simulação para PI
tau_c_PI = 3 * tau; % Critério de desempenho para o IMC
params_PI = struct('k', k, 'tau', tau, 'tau_c', tau_c_PI, 'kp', tau / (k * tau_c_PI), 'ki', 1 / tau_c_PI);
G_PI = criarProcesso('primeira_ordem', params_PI);
C_PI = criarControlador('PI', params_PI);
[saida_PI, erro_PI, indices_PI] = simularSistema('PI', G_PI, C_PI, entrada_ruidosa, tempo);
% Simulação para PID
tau_c_PID = 0.1 * tau; % Critério de desempenho para o PID
params_PID = struct('k', k, 'w1', w1, 'w2', w2, 'tau', tau, 'tau_c', tau_c_PID, ...
                    'kp', w2 / (k * tau_c_PID), 'ki', w2, 'kd', w1 / w2);
G_PID = criarProcesso('segunda_ordem', params_PID);
C_PID = criarControlador('PID', params_PID);
[saida_PID, erro_PID, indices_PID] = simularSistema('PID', G_PID, C_PID, entrada_ruidosa, ….
                     tempo);
% Simulação para FOPID
tau_c_FOPID = 0.1 * tau; % Critério de desempenho para o FOPID
params_FOPID = struct('k', k, 'w1', w1, 'w2', w2, 'tau', tau, 'tau_c', tau_c_FOPID, ...
                      'kp', 50 * w2 / (k * tau_c_FOPID), 'ki', 15 * w2, 'kd', w1 / w2, ...
                      'lambda', 0.7, 'mu', 0.5, 'N', 7, 'w_low', 1e-3, 'w_high', 1e3);
G_FOPID = criarProcesso('segunda_ordem', params_FOPID);
C_FOPID = criarControlador('FOPID', params_FOPID);
[saida_FOPID, erro_FOPID, indices_FOPID] = simularSistema('FOPID', G_FOPID, C_FOPID, …
entrada_ruidosa, tempo);
% Plot da Simulação com Controle PI
figure;
plot(tempo, entrada_ruidosa, 'b', 'LineWidth', 1.0); hold on;
plot(tempo, saida_PI, 'r', 'LineWidth', 1.5);
title('Resposta do Sistema com Controlador PI e Entrada Ruidosa');
xlabel('Tempo (s)');
ylabel('Nível de Saída e Entrada');
ylim([60 80]);
grid on;
legend('Entrada Ruidosa', 'Saída do Sistema com Controlador PI');
% Plot da Simulação com Controle PID
figure;
plot(tempo, entrada_ruidosa, 'b', 'LineWidth', 1.0); hold on;
plot(tempo, saida_PID, 'r', 'LineWidth', 1.5);
title('Resposta do Sistema com Controlador PID e Entrada Ruidosa');
xlabel('Tempo (s)');
ylabel('Nível de Saída e Entrada');
ylim([60 80]);
grid on;
legend('Entrada Ruidosa', 'Saída do Sistema com Controlador PID');
% Plot da Simulação com Controle FOPID
figure;
plot(tempo, entrada_ruidosa, 'b', 'LineWidth', 1.0); hold on;
plot(tempo, saida_FOPID, 'r', 'LineWidth', 1.5);
title('Resposta do Sistema com Controlador FOPID e Entrada Ruidosa');
xlabel('Tempo (s)');
ylabel('Nível de Saída e Entrada');
ylim([60 80]);
grid on;
legend('Entrada Ruidosa', 'Saída do Sistema com Controlador PID');
