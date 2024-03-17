clear;
close;
clc;

% ścieżka robota - elementy
theta = 0:(1/32*pi):2*pi;
rho = 5*ones(1, length(theta));

% konwersja ze wsp. biegunowych na wsp. kartezjańskie
[x, y] = pol2cart(theta, rho);

% ścieżka robota - całość
x = x + 12.5*ones(1, length(theta));
y = y + 12.5*ones(1, length(theta));

% ścieżka robota - struktury z czasem
X.time = linspace(0, 200, length(x))';
signal.values = x';
X.signals = signal;

Y.time = linspace(0, 200, length(y))';
signal.values = y';
Y.signals = signal;

% zapis do .mat pliku
save("sciezka_bez_przeszkod_3.mat", "X", "Y");

% wizualizacja
figure();
plot(X.signals.values, Y.signals.values, 'k');
xlabel('x');
ylabel('y');
title("Ścieżka bez przeszkód 3");
axis([0 25 0 25]);
legend("Ścieżka");