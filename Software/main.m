% MAIN
close all;
clear all;
clc;
%% ============================ Wczytywanie danych =============================
data = load('dataset.txt');
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
end
m = length(X);    % aktualizowanie ilości par danych

%% ================================ Wykres y(X) ================================
figure;
plot(X, y, 'rx', 'MarkerSize', 10);
ylabel('Cena mieszkania [zł]');
xlabel('Powierzchnia [m^2]');

%% ==================== Wczytywanie danych ====================
# Reszta, funkcja kosztu, rysowanie paraboli, spadek gradientowy itd.