function recoms = recommendations(path, liked_theme, num_recoms, min_reviews, num_features)
  % Load the matrix using read_mat
  mat = read_mat(path);

  % Preprocess using the preprocess function
  mat = preprocess(mat, min_reviews);

  % Compute reduced SVD
  [U, S, V] = svds(mat, num_features);

  num_themes = size(V, 1);
  % We take only the liked_theme from V
  liked_vec = V(liked_theme, :)';
  similarities = zeros(num_themes, 1);

  % Compare each theme
  for i = 1:num_themes
    similarities(i) = cosine_similarity(liked_vec, V(i, :)');
  endfor

  %{
    Sort themes by similarity in descending order
    and set liked_theme on -Inf so it's the first one after sort
  %}

  similarities(liked_theme) = -Inf;
  [~, sorted_indices] = sort(similarities, "descend");

  % Get the recommendations from the sorted_indices
  recoms = sorted_indices(1:num_recoms);
  recoms = recoms';

endfunction

