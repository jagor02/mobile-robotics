% Parametry symulowanego uk. fizycznego

clear;

assignin('base', 'm', 1); % masa [kg]
assignin('base', 'k', 0.5); % wsp. sprężystonści [N/m]
assignin('base', 'a', 0.01); % [N/(m^3)]
assignin('base', 'x_prim_0', 0); % pocz. wart. prędkości [m/s]
assignin('base', 'x_0', 0.5); % pocz. wart. położenia [m]
assignin('base', 'w_0', 0);

% Optymalizacja z ograniczeniami - fmincon
start_parameters = [0, 0, 0]; % pocz. wartości parametrów (odpowiednio - alfa, beta K) dla fmincon
lb = [1e-10, 1e-10, 1e-10]; % alfa >= 1e-10, beta >= 1e-10, K >= 1e-10
opt_parameters = fmincon(@optymalizacja, start_parameters, [], [], [], [], lb, [], []);

assignin('base', 'alfa', opt_parameters(1));
assignin('base', 'beta', opt_parameters(2));
assignin('base', 'K', opt_parameters(3));