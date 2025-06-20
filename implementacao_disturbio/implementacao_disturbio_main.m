% Código Principal para as Implementações com Distúrbio

%% RESPOSTAS DAS IMPLEMENTAÇÕES PI PID E FOPID COM DISTÚRBIO
% Limpar Command Window e Workspace
clc; clear all; close all;
% Carregar os dados das implementações
load('data_pi_disturbio.mat');              % Dados do controlador PI
nivel_tanque_PI = PTQ4.Data;                % Nível do tanque
pot_bomba1_PI = pot_bomba1.Data;    % Potência da bomba 1
load('data_pid_disturbio.mat');             % Dados do controlador PID
nivel_tanque_PID = PTQ4.Data;               % Nível do tanque
pot_bomba1_PID = pot_bomba1.Data;           % Potência da bomba 1
load('data_fopid_disturbio.mat');           % Dados do controlador FOPID
nivel_tanque_FOPID = PTQ4.Data;             % Nível do tanque
pot_bomba1_FOPID = pot_bomba1.Data;         % Potência da bomba 1
pot_bomba2 = pot_bomba2.Data;               % Carregar dados da potência da bomba 2
tempo = pot_bomba1.Time;                    % Vetor de tempo
set_point = 75;                             % Definir o setpoint
% Cálcular os índices de desempenho para o nível do tanque (saída) e potencia do motor (controle)
calcularIndicesDesempenho(tempo, nivel_tanque_FOPID, set_point, pot_bomba1_FOPID, 'FOPID');
calcularIndicesDesempenho(tempo, nivel_tanque_PID, set_point, pot_bomba1_PID, 'PID');
calcularIndicesDesempenho(tempo, nivel_tanque_PI, set_point, pot_bomba1_PI, 'PI');
% Figura para a resposta do sistema com disturbio 
figure;
% Subplot 1: Resposta do sistema
subplot(2,1,1);
hold on;
plot(tempo, nivel_tanque_PI, 'b', 'LineWidth', 1.5);
plot(tempo, nivel_tanque_PID, 'g', 'LineWidth', 1.5);
plot(tempo, nivel_tanque_FOPID, 'm', 'LineWidth', 1.5);
plot(tempo, repmat(set_point, size(tempo)), 'r--', 'LineWidth', 1.5); % Linha do setpoint
title('Resposta do Sistema com Controladores PI, PID e FOPID');
xlabel('Tempo (s)');
ylabel('Nível do Tanque (%)');
legend('Nível PI', 'Nível PID', 'Nível FOPID', 'Setpoint');
grid on;
% Subplot 2: Potência das bombas
subplot(2,1,2);
hold on;
plot(tempo, pot_bomba1_PI, 'b', 'LineWidth', 1.5);
plot(tempo, pot_bomba1_PID, 'g', 'LineWidth', 1.5);
plot(tempo, pot_bomba1_FOPID, 'm', 'LineWidth', 1.5);
plot(tempo, pot_bomba2, 'k:', 'LineWidth', 1.5); % Potência da bomba 2
title('Sinal de Controle - Potência das Bombas');
xlabel('Tempo (s)');
ylabel('Potência da Bomba (%)');
legend('Bomba 1 (PI)', 'Bomba 1 (PID)', 'Bomba 1 (FOPID)', 'Bomba 2 (Comum)');
grid on;
hold off;
