clear;
close;
clc;

% ścieżka robota - elementy
x1 = linspace(5, 15, 50);
y1 = 5*ones(1, 50);
x2 = 15*ones(1, 50);
y2 = linspace(5, 15, 50);
x3 = linspace(15, 20, 50);
y3 = 15*ones(1, 50);
x4 = 20*ones(1, 50);
y4 = linspace(15, 20, 50);

% ścieżka robota - całość
x = [x1, x2, x3, x4];
y = [y1, y2, y3, y4];

% ścieżka robota - struktury z czasem
X.time = linspace(0, 200, length(x))';
signal.values = x';
X.signals = signal;

Y.time = linspace(0, 200, length(y))';
signal.values = y';
Y.signals = signal;

% zapis do .mat pliku
save("sciezka_bez_przeszkod_2.mat", "X", "Y");

% wizualizacja
figure();
plot(X.signals.values, Y.signals.values, 'k');
xlabel('x');
ylabel('y');
title("Ścieżka bez przeszkód 2");
axis([0 25 0 25]);
legend("Ścieżka");