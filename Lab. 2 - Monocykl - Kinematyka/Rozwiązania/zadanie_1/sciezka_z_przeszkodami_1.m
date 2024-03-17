clear;
close;
clc;

% ścieżka robota - elementy
x1 = linspace(1, 7.5, 50);
y1 = ones(1, 50);
x2 = 7.5*ones(1, 50);
y2 = linspace(1, 20, 50);
x3 = linspace(7.5, 17.5, 50);
y3 = 20*ones(1, 50);
x4 = 17.5*ones(1, 50);
y4 = linspace(20, 1, 50);
x5 = linspace(17.5, 24, 50);
y5 = ones(1, 50);

% ścieżka robota - całość
x = [x1, x2, x3, x4, x5];
y = [y1, y2, y3, y4, y5];

% ścieżka robota - struktury z czasem
X.time = linspace(0, 200, length(x))';
signal.values = x';
X.signals = signal;

Y.time = linspace(0, 200, length(y))';
signal.values = y';
Y.signals = signal;

% przeszkoda - elementy
x1 = linspace(10, 15, 50);
y1 = 10*ones(1, 50);
x2 = 15*ones(1, 50);
y2 = linspace(10, 15, 50);
x3 = linspace(15, 10, 50);
y3 = 15*ones(1, 50);
x4 = 10*ones(1, 50);
y4 = linspace(15, 10, 50);

% przeszkoda - całość
obj_X = [x1, x2, x3, x4];
obj_Y = [y1, y2, y3, y4];

% zapis ścieżki do .mat pliku
save("sciezka_z_przeszkodami_1.mat", "X", "Y");

% wizualizacja
figure();
hold on;
plot(X.signals.values, Y.signals.values, 'k'); % ścieżka
plot(obj_X, obj_Y, 'b'); % przeszkoda
hold off;
xlabel('x');
ylabel('y');
title("Ścieżka z przeszkodami 1");
axis([0 25 0 25]);
legend("Ścieżka", "Przeszkody");