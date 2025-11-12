function reduced_mat = preprocess(mat, min_reviews)

  [n, m] = size(mat);

  reduced_mat = [];

  %{
    We take the number of nonzero results on each line
    and if this total is greater than the minimum required
    we add it to the final reduced_mat
  %}

  for i = 1:n
    curr_review_count = sum(mat(i, :) != 0);
    if curr_review_count >= min_reviews
      reduced_mat = [reduced_mat; mat(i, :)];
    endif
  endfor

endfunction

