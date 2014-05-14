#!/bin/sh

# -w1 : foreign language word vectors
# -w2 : English word vectors(whom we want to project)
# -a  : Alignment counts from Foreign language to English 
# -o  : Output file with the subset and the aligned vectors (two diff files)
# $5  : Ratio of home much of the top correlation should be preserved

# Exit if any of the below listed command fails
set -e

# Get the aligned vectors from lang1 for English (lang2)
echo "Aligning vectors..."
python alignVectors.py -w1 $1 -w2 $2 -a $3 -o $4

# Project all the English vectors (lang2) using CCA 
echo "Projecting vectors..."
matlab -nodesktop -nosplash -nojvm -nodisplay -r "project_vectors('$1','$2','$4_orig_subset.txt','$4_new_aligned.txt','$4_orig2_projected.txt','$4_orig1_projected.txt', $5); exit"

# Do some post-processing for English
echo "Some post-processing..."
cut -f1 -d" " $2 > $4_words2.txt
python paste.py -1 $4_words2.txt -2 $4_orig2_projected.txt -o $4_inter_orig2_projected.txt -d" "
rm -f $4_words2.txt
rm -f $4_orig2_projected.txt
mv $4_inter_orig2_projected.txt $4_orig2_projected.txt
rm -f $4_orig_subset.txt
rm -f $4_new_aligned.txt

echo "Projected vectors of Lang2 saved in " $4_orig2_projected.txt

# Do some post-processing for Foreing language
cut -f1 -d" " $1 > $4_words1.txt
python paste.py -1 $4_words1.txt -2 $4_orig1_projected.txt -o $4_inter_orig1_projected.txt -d" "
rm -f $4_words1.txt
rm -f $4_orig1_projected.txt
mv $4_inter_orig1_projected.txt $4_orig1_projected.txt

echo "Projected vectors of Lang1 saved in " $4_orig1_projected.txt