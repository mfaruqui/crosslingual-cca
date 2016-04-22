#!/bin/sh

# -w1 : language1 words in the language1 vector space 
# -w2 : language2 words in the language2 vector space
# -a  : language1-language2 word alignments
# -p  : projection matrix (from lang1 vector space to lang2 vector space)
# -o1  : language1 words in the language2 vector space
# -o2  : language2 words in the language2 vector space (normalized, so this may be differen than the input embeddings as provided in -w2)

# Exit if any of the below listed command fails.
set -e

# Get the aligned vectors from lang1 for English (lang2).
echo "Aligning vectors..."
python alignVectors.py -w1 $1 -w2 $2 -a $3 -o $4
# alignVectors.py writes two files: $4_orig_subset.txt, $4_new_aligned.txt.
# Give them better names.
mv $4_orig_subset.txt $4_aligned_lang2_embeddings
mv $4_new_aligned.txt $4_aligned_lang1_embeddings

# Find a "shared" vector space such that the projected words from lang1 vector
# space and the projected of aligned words in lang2 vector space are maximally
# correlated. Assume linear transformations. Then, project all lang1 word
# vectors from the lang1 vector space to lang2 vector space (via the shared 
# space).
echo "Projecting vectors..."
matlab -nodesktop -nosplash -nojvm -nodisplay -r "project_vectors_to_lang2('$1','$2', '$4_aligned_lang1_embeddings', '$4_aligned_lang2_embeddings', '$4', '$4_lang1_words_in_lang2_space', '$4_lang2_words_in_lang2_space'); exit"

# Do some post-processing for English
echo "Some post-processing..."
cut -f1 -d" " $1 | sed -n '1!p' > $4_lang1_words
cut -f1 -d" " $2 | sed -n '1!p' > $4_lang2_words
python paste.py -1 $4_lang1_words -2 $4_lang1_words_in_lang2_space -o $5 -d" "
python paste.py -1 $4_lang2_words -2 $4_lang2_words_in_lang2_space -o $6 -d" "
#rm -f $4_*

echo "The linear projection matrix between lang1->lang2 spaces can be found at " $4
echo "Embeddings of lang1 words, projected to lang2 space, can be found at " $5
echo "Embeddings of lang2 words, normalized in the lang2 space, can be found at " $6
