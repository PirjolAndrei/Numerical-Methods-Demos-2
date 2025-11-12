function [S, f, t] = spectrogram(signal, fs, window_size)

  % We compute the number of windows
  signal_size = length(signal);
  windows = floor(signal_size / window_size);

  S = zeros(window_size, windows);

  hann_window = hanning(window_size);

  for i = 1:windows
    %{
      we take each window
      ex.: 1:window_size and so on
    %}

    start_idx = (i - 1) * window_size + 1;
    end_idx = start_idx + window_size - 1;

    % We apply hann function
    % We apply hann function
    curr_window = signal(start_idx:end_idx);
    new_window = curr_window .* hann_window;

    % We compute the fft with a resolution of 2 * window_size
    fft_result = fft(new_window, 2 * window_size);

    % Then only take the first window_size elements
    S(:, i) = abs(fft_result(1:window_size));
  endfor

  % Only the first half, hence (fs / 2) / window_size
  f = (0:window_size - 1)' * (fs / (2 * window_size));
  t = (0:windows - 1)' * (window_size / fs);

endfunction

