#!/bin/sh

# -w1 : language1 words in the language1 vector space 
# -w2 : language2 words in the language2 vector space
# -a  : language1-language2 word alignments
# -p  : projection matrix (from lang1 vector space to lang2 vector space)
# -o  : language1 words in the language2 vector space

# Exit if any of the below listed command fails.
set -e

# Get the aligned vectors from lang1 for English (lang2).
echo "Aligning vectors..."
python alignVectors.py -w1 $1 -w2 $2 -a $3 -o temp
# alignVectors.py writes two files: temp_orig_subset.txt, temp_new_aligned.txt.
# Give them better names.
mv temp_orig_subset.txt temp_aligned_lang1_embeddings
mv temp_new_aligned.txt temp_aligned_lang2_embeddings

# Find a "shared" vector space such that the projected words from lang1 vector
# space and the projected of aligned words in lang2 vector space are maximally
# correlated. Assume linear transformations. Finally, project all lang1 word
# vectors from the lang1 vector space to lang2 vector space (via the shared 
# space).
echo "Projecting vectors..."
matlab -nodesktop -nosplash -nojvm -nodisplay -r "project_vectors_to_lang2('$1','$2', 'temp_aligned_lang1_embeddings', 'temp_aligned_lang2_embeddings', '$4', 'temp_lang1_words_in_lang2_space'); exit"

# Do some post-processing for English
echo "Some post-processing..."
cut -f1 -d" " $1 | sed -n '1!p' > temp_lang1_words
python paste.py -1 temp_lang1_words -2 temp_lang1_words_in_lang2_space -o $5 \
    -d" "
#rm -f temp*

echo "The linear transformation lang1->lang2 spaces can be found at " $4
echo "Embeddings of lang1 words, projected to lang2 space can be found at " $5
