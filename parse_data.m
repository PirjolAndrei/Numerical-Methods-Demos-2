function [x, y] = parse_data(filename)

    % Open the file
    fin = fopen(filename, 'r');

    % Read n, x, y from the file
    n = fscanf(fin, '%d', 1);
    x = fscanf(fin, '%f', n + 1);
    y = fscanf(fin, '%f', n + 1);

    % Close the file
    fclose(fin);

endfunction

