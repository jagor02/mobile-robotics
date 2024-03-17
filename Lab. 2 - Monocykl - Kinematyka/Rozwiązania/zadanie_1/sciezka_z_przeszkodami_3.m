clear;
close;
clc;

% ścieżka robota
x = linspace(1, 24, 1000);
y = linspace(1, 24, 1000);

% ścieżka robota - struktury z czasem
X.time = linspace(0, 200, length(x))';
signal.values = x';
X.signals = signal;

Y.time = linspace(0, 200, length(y))';
signal.values = y';
Y.signals = signal;

% przeszkody - elementy
theta = 0:(1/32*pi):2*pi;
rho = 3*ones(1, length(theta));

% konwersja ze wsp. biegunowych na wsp. kartezjańskie
[x, y] = pol2cart(theta, rho);

% przeszkody - całość
obj_X1 = x + 17*ones(1, length(theta));
obj_Y1 = y + 10*ones(1, length(theta));
obj_X2 = x + 10*ones(1, length(theta));
obj_Y2 = y + 17*ones(1, length(theta));

% zapis ścieżki do .mat pliku
save("sciezka_z_przeszkodami_3.mat", "X", "Y");

% wizualizacja
figure();
hold on;
plot(X.signals.values, Y.signals.values, 'k'); % ścieżka
plot(obj_X1, obj_Y1, 'b'); % przeszkody
plot(obj_X2, obj_Y2, 'b');
hold off;
xlabel('x');
ylabel('y');
title("Ścieżka z przeszkodami 3");
axis([0 25 0 25]);
legend("Ścieżka", "Przeszkody");