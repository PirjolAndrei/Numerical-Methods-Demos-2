function similarity = cosine_similarity(A, B)

  %{
   We only take the norms,
   because we normalize with the similarity formula
  %}

  normA = norm(A, 2);
  normB = norm(B, 2);

  similarity = dot(A, B) / (normA * normB);

endfunction

