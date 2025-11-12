function y_interp = P_spline (coef, x, x_interp)

  % Number of intervals
  n = length(x) - 1;
  y_interp = zeros(size(x_interp));

  % For each interpolation point
  for k = 1:length(x_interp)
    x_val = x_interp(k);

    i = 1;
    while i <= length(x) - 1 && !((x_val) >= x(i) && x_val <= x(i + 1))
      i++;
    endwhile

    % Get coefficients for this interval
    a = coef(4 * (i - 1) + 1);
    b = coef(4 * (i - 1) + 2);
    c = coef(4 * (i - 1) + 3);
    d = coef(4 * (i - 1) + 4);

    % Evaluate the spline polynomial
    dx = x_val - x(i);
    y_interp(k) = a + b * dx + c * dx^2 + d * dx^3;
  endfor

endfunction

