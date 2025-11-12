function signal = apply_reverb(signal, impulse_response)

  % we make sure the impulse_respose is mono
  impulse_response = stereo_to_mono(impulse_response);

  % we do the convolution usign fftconv
  signal = fftconv(signal, impulse_response);

  %Normalize
  signal = signal / max(abs(signal));

endfunction

