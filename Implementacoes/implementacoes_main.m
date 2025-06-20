% Código Principal para as Implementações

%% IMPLEMENTAÇÕES - CONTROLES PI, PID e FOPID
%   Importação dos dados obtidos nas implementações
%   Cálculo dos Índices de Desempenho
%   Plotagem do resultado das implementações dos controles PI, PID e FOPID

% Limpar tela e variáveis
clc; clear all; close all;
% Carregar os dados das implementações
controladores = {'PI', 'PID', 'FOPID'};
arquivos = {'data_implementacao_pi.mat', 'data_implementacao_pid.mat', 'data_implementacao_fopid.mat'};
set_point_val = 75; % Setpoint do nível do tanque desejado
for i = 1:length(controladores)
    % Carregar os dados
    controlador = controladores{i};
    load(arquivos{i});  % Carrega 'tout', 'PTQ4.Data' e 'pot_bomba.Data'
    % Extração dos dados
    tempo = tout;                            % Vetor de tempo
    nivel_tanque = PTQ4.Data;                % Nível do tanque
    potencia_bomba = pot_bomba.Data;         % Potência da bomba
    % Calcular e exibir os índices de desempenho
    indices = calcularIndicesDesempenho(tempo, nivel_tanque, set_point_val, potencia_bomba, …
                     controlador);
    % Gerar os gráficos
    gerarPlots(tempo, nivel_tanque, potencia_bomba, set_point_val, controlador);
end
