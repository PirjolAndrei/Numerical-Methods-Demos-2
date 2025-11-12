function x = oscillator(freq, fs, dur, A, D, S, R)

  % time vector
  step = 1 / fs;
  t = 0:step:dur;
  t(end) = [];

  % the sine wave
  x = sin(2 * pi * freq * t)';

  % Compute the number of attack samples
  attack_samples = floor(A * fs);
  % Compute the number of decay samples
  decay_samples = floor(D * fs);
  % Compute the number of release samples
  release_samples = floor(R * fs);
  % Compute the number of sustain samples
  total_samples = length(x);
  sustain_samples = total_samples - (attack_samples + decay_samples + release_samples);

  % Compute the attack_envelope
  attack_envelope = linspace(0, 1, attack_samples);
  % Compute the decay_envelope
  decay_envelope = linspace(1, S, decay_samples);
  % Compute the sustain_envelope
  sustain_envelope = S * ones(1, sustain_samples);
  % Compute the release_envelope
  release_envelope = linspace(S, 0, release_samples);

  % Create the final_envelope
  final_envelope = [attack_envelope, decay_envelope, sustain_envelope, release_envelope]';

  x = x .* final_envelope;

endfunction

