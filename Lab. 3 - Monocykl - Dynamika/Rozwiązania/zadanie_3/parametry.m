clear;
clc;

% parametry
assignin('base', 'm', 10); % masa koła [kg]
assignin('base', 'R', 0.1); % promień koła [m]
assignin('base', 'g', 9.81); % przyspieszenie ziemskie [m/s^2]
assignin('base', 'N_max', 10); % maksymalna wartość bezwzględna momentu napędowego [Nm]

% przykładowy przebieg zadanej prędkości v_Q
v_Q = [0:0.2:1, ones(1, 5)];

U.time = linspace(0, 5, length(v_Q))';
signal.values = v_Q';
U.signals = signal;

% optymalizacja z ograniczeniami - fmincon
start_parameters = [1, 0]; % pocz. wartości parametrów (odpowiednio - Kp_dyn, Ki_dyn) dla fmincon
lb = [1e-10, 1e-10]; % Kp_dyn >= 1e-10, Ki_dyn >= 1e-10
opt_parameters = fmincon(@opty, start_parameters, [], [], [], [], lb, []);

% przypisanie parametrów regulatora
assignin('base', 'Kp_dyn', opt_parameters(1));
assignin('base', 'Ki_dyn', opt_parameters(2));