export output_embeddings="/home/wammar/temp/en_da_it+cca+window_3+iter_10+size_40"
export temp_dir="/home/wammar/temp/"

# remove old embeddings if any
rm $output_embeddings

# process english
export corpus_en="/home/gmulc/corpora/monolingual-total/en/combo.en"
/home/wammar/incremental-word2vec/word2vec -train $corpus_en -window 3 -iter 10 -size 40 -output "$temp/embeddings_en.noprefix"
python /home/wammar/wammar-utils/prefix_lines.py -i "$temp/embeddings_en.noprefix" -o "$temp/embeddings_en" -p en:

# process danish
export corpus_da="/home/gmulc/corpora/monolingual-total/da/combo.da"
export dictionary_da_en="/home/wammar/europarl-dictionaries/parallel.fwdxbwd-dict.da-en.prefixed"
/home/wammar/incremental-word2vec/word2vec -train $corpus_da -window 3 -iter 10 -size 40 -output "$temp/embeddings_da.noprefix"
python /home/wammar/wammar-utils/prefix_lines.py -i "$temp/embeddings_da.noprefix" -o "$temp/embeddings_da" -p da:
/home/wammar/crosslingual-cca/project_vectors_to_lang2.sh "$temp/embeddings_da" "$temp/embeddings/en" $dictionary_da_en "$temp/dummy" "$temp/embeddings_da.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_da.projected" >> $output_embeddings

# process italian
export corpus_it="/home/gmulc/corpora/monolingual-total/it/combo.it"
export dictionary_it_en="/home/wammar/europarl-dictionaries/parallel.fwdxbwd-dict.it-en.prefixed"
/home/wammar/incremental-word2vec/word2vec -train $corpus_it -window 3 -iter 10 -size 40 -output "$temp/embeddings_it.noprefix"
python /home/wammar/wammar-utils/prefix_lines.py -i "$temp/embeddings_it.noprefix" -o "$temp/embeddings_it" -p it:
/home/wammar/crosslingual-cca/project_vectors_to_lang2.sh "$temp/embeddings_it" "$temp/embeddings/en" $dictionary_it_en "$temp/dummy" "$temp/embeddings_it.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_it.projected" >> $output_embeddings

# finally, concatenate normalized english embeddings
cat "$temp/embeddings_en.projected" >> $output_embeddings
