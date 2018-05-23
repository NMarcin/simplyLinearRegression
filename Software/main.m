% MAIN
close all;
clear all;
clc;
%% ============================ Wczytywanie danych =============================
data = load("dataset.txt");
y = data(:, 1);
X = data(:, 2);
m = length(y);    % ilość testowych danych

%% ================================ Wykres y(X) ================================
figure;
plot(X, y, 'rx', 'MarkerSize', 10);
ylabel('Cena mieszkania [zł]');
xlabel('Powierzchnia [m^2]');

%% ================================ Wykres y/X =================================
figure;
z = y./X;     % cena za metr kwadratowy
plot(z, 0, 'rx', 'MarkerSize', 10);
hold on;
s = sum(z) / m;      % średnia cena za metr kwadratowy
plot(s, 0, 'bo', 'MarkerSize', 15);
xlabel('Cena za metr kwadratowy [zł/m^2]');

%% ================================= Filtracja =================================
for i = 1:3
  z = y./X;     % cena za metr kwadratowy
  s = sum(z) / m;      % średnia cena za metr kwadratowy
  f_yX = abs(z-s);    % odchylenie od średniej ceny za metr kwadratowy
  d = find(f_yX == max(f_yX));   % zwraca indeks granicznej zmiennej
  X(d) = [];      % usuwanie granicznej pary (X, y)
  y(d) = [];
  m = length(X);    % aktualizowanie ilości par danych
end

%% ================================ Wykres y(X) ================================
figure;
plot(X, y, 'rx', 'MarkerSize', 10);
ylabel('Cena mieszkania [zł]');
xlabel('Powierzchnia [m^2]');

%% ===================== Inicjalizacja danych pomocniczych =====================
X = [ones(m, 1), X];    % dodanie kolumny jedynek dla x_0 przy theta_0
theta = zeros(2, 1);      % początkowe wartości dopasowania
alpha = 0.00001;     % alpha odpowiada za "wielkość" kroków spadku gradientowego
iterations = 1500000;      % maksymalna ilosc iteracji spadku gradientowego

%   1.0473e+04 = 10473
%   6.2825e+03 = 6282.5
%% ============================ Spadek gradientowy =============================

[theta J_history theta_history]= gradientDescent(X, y, theta, alpha, iterations);
theta

figure;
plot(X(:,2), y, 'rx', 'MarkerSize', 10);
ylabel('Cena mieszkania [zł]');
xlabel('Powierzchnia [m^2]');
hold on;

f_r = theta(1)*X(:,1) + theta(2)*X(:,2);
plot(X(:,2), f_r);