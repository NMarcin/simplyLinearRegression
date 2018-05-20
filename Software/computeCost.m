function J = computeCost(X, y, theta)

% Inicjalizacja przydatnych wartości
m = length(y); % ilość danych tetowych
J = 0;

% Działanie Funkcji
h = theta' .* X;
h_sum = h(:, 1) + h(:, 2);
e = (h_sum - y).^2;
s = sum(e);
J = 1/(2*m) * s;

end % function