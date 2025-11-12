function coef = vandermonde(x, y)

    n = length(x) - 1;
    Vandermonde = zeros(n + 1, n + 1);

    % Fill the Vandermonde matrix as described in the task
    for i = 1:n + 1
        for j = 1:n + 1
            Vandermonde(i, j) = x(i)^(j - 1);
        endfor
    endfor

    % Solve for coef
    coef = Vandermonde \ y;

endfunction

