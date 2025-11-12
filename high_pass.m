function signal = high_pass(signal, fs, cutoff_freq)

  % Compute the Fourier Transform of the signal
  fourier = fft(signal);
  signal_size = length(signal);

  % Compute the frequency vector
  fr = (0:signal_size - 1)' * fs / signal_size;

  % Create mask, 1 for fr > cutoff_freq, 0 otherwise
  mask = (fr > cutoff_freq);

  % Apply the Hadamard product
  hadamard = fourier .* mask;

  hadamard(signal_size:-1:1) = hadamard(signal_size:-1:1) .* mask;

  % Inverse FFT to get the filtered signal
  signal = ifft(hadamard);

  % Normalize the signal
  signal = signal / max(abs(signal));

endfunction

