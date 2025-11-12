Task 1 - Numerical Music:
The problem focuses on functions for audio signal processing. It includes tools for basic audio manipulation, synthesis, filtering, visualization, and effects (such as high_pass and reverb).

The whole code performs transformations on audio signals to analyze or enhance them. Starting from raw stereo input, the stereo_to_mono function simplifies the data into a normalized mono channel. The spectrogram function gives a time-frequency representation of signals while the oscillator can generate a sine wave tone with an Attack, Decay, Sustain and Release envelope.

Some observations on the figures made by the studio.m function:

Figure 1: (Plain Loop) the one from the task, the loop we will apply different effects on
Figure 2: (Plain Sound) it seems to be more "empty" than the "Plain Loop" suggesting it's a single
tone or sound without additional instruments
Figure 3: (High Pass Sound) it's the "Plain Sound" after applying a high-pass filter
Figure 4: (Reverb Sound) Reverb added to the plain sound, making the sound more active

Task 2 - Robotzii:
parse_data:
Reads interpolation data from a file, which contains the number of intervals and 
the x and y coordinates of the interpolation points.

spline_c2:
Computes the coefficients for a natural cubic spline interpolation. It forms and solves a tridiagonal system A ⋅ c = B to determine the second derivatives at the internal nodes and uses these to compute the full cubic polynomial coefficients for each subinterval.

P_spline:
Evaluates the spline interpolation at custom points x_interp using the coefficients from spline_c2.

vandermonde:
Constructs a Vandermonde matrix for the given points and solves a linear system to find the coefficients of the unique polynomial that interpolates all points.

P_vandermonde:
Evaluates the Vandermonde interpolation polynomial at the provided x_interp points.

Task 3 - Recommendations
read_mat:
Loads the dataset from a CSV file while skipping headers, returning the matrix.

preprocess:
Filters the data by removing users (rows) who have rated fewer themes than a given threshold.

cosine_similarity:
Computes the cosine similarity between two vectors.

recommendations:
1. Loads and preprocesses the data.
2. Applies reduced SVD to extract latent features.
3. Measures similarity between the liked theme and all others.
4. Returns the top num_recoms most similar themes, excluding the liked one.
