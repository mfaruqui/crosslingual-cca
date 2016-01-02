function project_vectors_to_lang2(lang1_words_in_lang1_space_filename, lang2_words_in_lang2_space_filename, aligned_lang1_words_in_lang1_space_filename, aligned_lang2_words_in_lang2_space_filename, lang1_space_to_lang2_space_filename, lang1_words_in_lang2_space_outfile, lang2_words_in_lang2_space_outfile)

% first column is words, hence not being read. first row is meta data, hence not read. 
lang1_words_in_lang1_space = dlmread(lang1_words_in_lang1_space_filename, ' ', 1, 1);
lang2_words_in_lang2_space = dlmread(lang2_words_in_lang2_space_filename, ' ', 1, 1);
% first column is words, hence not read.
aligned_lang1_words_in_lang1_space = dlmread(aligned_lang1_words_in_lang1_space_filename, ' ', 0, 1);
aligned_lang2_words_in_lang2_space = dlmread(aligned_lang2_words_in_lang2_space_filename, ' ', 0, 1);

% Normalize all the matrices by rows
lang1_words_in_lang1_space = normr(lang1_words_in_lang1_space);
lang2_words_in_lang2_space = normr(lang2_words_in_lang2_space);
aligned_lang1_words_in_lang1_space = normr(aligned_lang1_words_in_lang1_space);
aligned_lang2_words_in_lang2_space = normr(aligned_lang2_words_in_lang2_space);

% Perform CCA on the subset of the aligned vectors
[A, B] = canoncorr(aligned_lang1_words_in_lang1_space, aligned_lang2_words_in_lang2_space);

% Project lang1 words from the lang1 space to the lang2 space
lang1_words_count = size(lang1_words_in_lang1_space, 1);
% TODO: since B is an orthogonal matrix, inv(B) = B'
lang1_space_to_lang2_space = A * inv(B);
lang1_words_in_lang2_space = (lang1_words_in_lang1_space - repmat(mean(lang1_words_in_lang1_space), lang1_words_count, 1)) * lang1_space_to_lang2_space;
lang1_words_in_lang2_space = normr(lang1_words_in_lang2_space);

% Write output files
dlmwrite(lang1_space_to_lang2_space_filename, lang1_space_to_lang2_space, ' ');
dlmwrite(lang1_words_in_lang2_space_outfile, lang1_words_in_lang2_space, ' ');
dlmwrite(lang2_words_in_lang2_space_outfile, lang2_words_in_lang2_space, ' ');

% Delete all matrices from memory
clear;
