% input is word embeddings (using the word2vec format, without the header file).
% output is a file with the first line = number of word embeddings, the remaining lines
% are the output of the matlab linkage function. http://www.mathworks.com/help/stats/linkage.html
function cluster_embeddings(input_word_embeddings, output_branchings)

% first column is words, hence not being read.
% first row is metadata
embeddings = dlmread(input_word_embeddings, ' ', 1, 1);

% word2vec embeddings have a trailing space which matlab parses as an additional
% column of all zeros. If the last column is all zeros, remove it.
embeddings_cols = size(embeddings, 2);
embeddings_rows = size(embeddings, 1);
if norm(embeddings(:, embeddings_cols)) == 0
  embeddings_cols = embeddings_cols - 1;
  embeddings = embeddings(:, 1:embeddings_cols);
end;

% cluster.
branchings = linkage(embeddings, 'ward', 'euclidean');

% write output file
dlmwrite(output_branchings, embeddings_rows, ' ');
dlmwrite(output_branchings, branchings, '-append', ...
         'delimiter', ' ', 'precision', 10);

% Delete all matrices from memory
clear;
