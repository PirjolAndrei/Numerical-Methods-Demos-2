function y_interp = P_vandermonde (coef, x_interp)

    n = length(x_interp);
    y_interp = zeros(n, 1);

    % We calculate P_vandermonde(x_i) for each line
    for i = 1:n
        val = 0;
        for j = 1:length(coef)
            val = val + coef(j) * x_interp(i)^(j - 1);
        endfor
        y_interp(i) = val;
    endfor

endfunction

