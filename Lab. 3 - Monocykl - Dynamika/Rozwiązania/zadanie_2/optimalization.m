clear;
clc;

% wczytanie wybranej ścieżki
load("sciezka_bez_przeszkod_1.mat");

% wczytanie stałej czasowej tau
assignin('base', 'tau', 1);

% wybrany regulator - regulator P

% Optymalizacja z ograniczeniami - fmincon
start_parameters = [1, 1]; % pocz. wartości parametrów (odpowiednio - Kp_v, Kp_w) dla fmincon
lb = [1e-10, 1e-10]; % Kp_v >= 1e-10, Kp_w >= 1e-10
opt_parameters = fmincon(@opty, start_parameters, [], [], [], [], lb, []);

% przypisanie parametrów
assignin('base', 'Kp_v', opt_parameters(1));
assignin('base', 'Kp_w', opt_parameters(2));