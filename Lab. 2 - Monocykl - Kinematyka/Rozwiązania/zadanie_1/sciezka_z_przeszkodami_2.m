clear;
close;
clc;

% ścieżka robota - elementy
x1 = linspace(7.5, 10, 50);
y1 = linspace(7.5, 10, 50);
x2 = linspace(10, 12.5, 50);
y2 = linspace(10, 7.5, 50);
x3 = linspace(12.5, 10, 50);
y3 = linspace(7.5, 5, 50);
x4 = linspace(10, 7.5, 50);
y4 = linspace(5, 7.5, 50);

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

% przeszkody - elementy
theta = 0:(1/32*pi):2*pi;
rho = ones(1, length(theta));

% konwersja ze wsp. biegunowych na wsp. kartezjańskie
[x, y] = pol2cart(theta, rho);

% przeszkody - całość
obj_X1 = x + 13*ones(1, length(theta));
obj_Y1 = y + 11*ones(1, length(theta));
obj_X2 = x + 7*ones(1, length(theta));
obj_Y2 = y + 11*ones(1, length(theta));
obj_X3 = x + 13*ones(1, length(theta));
obj_Y3 = y + 4*ones(1, length(theta));
obj_X4 = x + 7*ones(1, length(theta));
obj_Y4 = y + 4*ones(1, length(theta));

% zapis ścieżki do .mat pliku
save("sciezka_z_przeszkodami_2.mat", "X", "Y");

% wizualizacja
figure();
hold on;
plot(X.signals.values, Y.signals.values, 'k'); % ścieżka
plot(obj_X1, obj_Y1, 'b'); % przeszkody
plot(obj_X2, obj_Y2, 'b');
plot(obj_X3, obj_Y3, 'b');
plot(obj_X4, obj_Y4, 'b');
hold off;
xlabel('x');
ylabel('y');
title("Ścieżka z przeszkodami 2");
axis([0 25 0 25]);
legend("Ścieżka", "Przeszkody");