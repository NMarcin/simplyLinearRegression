function [theta, J_history, theta_history] = gradientDescent(X, y, theta, alpha, num_iters)

% Inicjalizacja przydatnych wartości
m = length(y); % ilość danych tetowych
J_history = zeros(num_iters, 1);
theta_history = zeros(num_iters, 2);

% Działanie Funkcji
for iter = 1:num_iters

    h = theta' .* X;
    h_sum = h(:, 1) + h(:, 2);
    e_1 = (h_sum - y)'*X(:, 1);
    s_1 = sum(e_1);
    e_2 = (h_sum - y)'*X(:, 2);
    s_2 = sum(e_2);
    temp_0 = theta(1) - alpha*(1/m)* s_1;
    temp_1 = theta(2) - alpha*(1/m)* s_2;
    theta = [temp_0 ; temp_1];

    % Zapisywanie przydatnych danych do    
    J_history(iter) = computeCost(X, y, theta);
    theta_history(iter, 1) = theta(1);
    theta_history(iter, 2) = theta(2);
end

end % function
