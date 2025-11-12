function mat = read_mat(path)

  % We read the mat and exclude the headers
  mat = csvread(path, 1, 1);

endfunction

