clear;
clc;

% parametry
assignin('base', 'm', 10); % masa koła [kg]
assignin('base', 'R', 0.1); % promień koła [m]
assignin('base', 'g', 9.81); % przyspieszenie ziemskie [m/s^2]
assignin('base', 'N_max', 10); % maksymalna wartość bezwzględna momentu napędowego [Nm]

% wczytanie wybranej ścieżki
load("sciezka_bez_przeszkod_1.mat");

% optymalizacja z ograniczeniami - fmincon
start_parameters = [1, 1, 1, 0]; % pocz. wartości parametrów (odpowiednio - Kp_v, Kp_w, Kp_dyn, Ki_dyn) dla fmincon
lb = [1e-10, 1e-10, 1e-10, 1e-10]; % Kp_v >= 1e-10, Kp_w >= 1e-10, Kp_dyn >= 1e-10, Ki_dyn >= 1e-10
opt_parameters = fmincon(@opty, start_parameters, [], [], [], [], lb, []);

% przypisanie parametrów regulatorów
assignin('base', 'Kp_v', opt_parameters(1));
assignin('base', 'Kp_w', opt_parameters(2));
assignin('base', 'Kp_dyn', opt_parameters(3));
assignin('base', 'Ki_dyn', opt_parameters(4));