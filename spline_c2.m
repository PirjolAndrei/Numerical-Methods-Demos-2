function coef = spline_c2(x, y)

  % n = number of intervals -> n + 1 points
  n = length(x) - 1;

  % Initialize spline coefficient arrays
  % a_i = f(x_i) = y_i, i = 0:n
  a = y(1:end);
  b = zeros(n, 1);
  % A * c = B so c_i is from 0 to n
  c = zeros(n + 1, 1);
  d = zeros(n, 1);

  h = zeros(n, 1);
  for i = 1:n
    h(i) = x(i + 1) - x(i);
  endfor

  % Start intializing A and B in order to solve A * c = B
  A = zeros(n + 1, n + 1);
  B = zeros(n + 1, 1);

  % A is tridiagonal
  A(1, 1) = 1;
  A(n + 1, n + 1) = 1;

  for i = 2:n
      A(i, i - 1) = h(i - 1);
      A(i, i) = 2 * (h(i - 1) + h(i));
      A(i, i + 1) = h(i);

      B(i) = 3 * ((a(i + 1) - a(i)) / h(i) - (a(i) - a(i - 1)) / h(i - 1));
  endfor

  c = A \ B;

  %{
   Now that we have c,
   we calculate b and d which have formulas based on c
  %}

  for i = 1:n
      d(i) = (c(i + 1) - c(i)) / (3 * h(i));
      b(i) = (a(i + 1) - a(i)) / h(i) - h(i) * (2 * c(i) + c(i + 1)) / 3;
  endfor

  % Prepare a, only take 1->n - 1
  a = a(1:end - 1);

  coef = zeros(4 * n, 1);
  for i = 1:n
      coef(4 * (i - 1) + 1) = a(i);
      coef(4 * (i - 1) + 2) = b(i);
      coef(4 * (i - 1) + 3) = c(i);
      coef(4 * (i - 1) + 4) = d(i);
  endfor

endfunction

