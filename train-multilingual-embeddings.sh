export output_embeddings="/usr1/home/wammar/cca-embeddings/all_languages.cca.window_5+iter_10+size_40+threads_16"
export temp="/usr1/home/wammar/cca-embeddings/"
export utils="/usr1/home/wammar/wammar-utils/"
export word2vec="/usr1/home/wammar/incremental-word2vec/"

# create temp dir
mkdir $temp

# remove old embeddings if any
rm $output_embeddings

# # process en
# export corpus_en="/usr1/home/wammar/monolingual/combo.en"
# $word2vec/word2vec -train $corpus_en -window 5 -iter 10 -size 40 -threads 16 -output $temp/embeddings_en.noprefix
# python $utils/prefix_lines.py -i $temp/embeddings_en.noprefix -o $temp/embeddings_en.prefix -p en:
# python $utils/strip_lines.py -i $temp/embeddings_en.prefix -o $temp/embeddings_en

# # process bg
# export corpus_bg="/usr1/home/wammar/monolingual/combo.bg"
# export dictionary_bg_en="/usr1/home/wammar/bilingual-dictionaries/word-aligned/parallel.fwdxbwd-dict.filter_at_0p1.prefixed/parallel.fwdxbwd-dict.bg-en"
# $word2vec/word2vec -train $corpus_bg -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_bg.noprefix"
# python $utils/prefix_lines.py -i $temp/embeddings_bg.noprefix -o $temp/embeddings_bg.prefix -p bg:
# python $utils/strip_lines.py -i $temp/embeddings_bg.prefix -o $temp/embeddings_bg
# ./project_vectors_to_lang2.sh "$temp/embeddings_bg" "$temp/embeddings_en" $dictionary_bg_en "$temp/dummy" "$temp/embeddings_bg.projected" "$temp/embeddings_en.projected"
# cat "$temp/embeddings_bg.projected" >> $output_embeddings

# process cs
# export corpus_cs="/usr1/home/wammar/monolingual/combo.cs"
# export dictionary_cs_en="/usr1/home/wammar/bilingual-dictionaries/word-aligned/parallel.fwdxbwd-dict.filter_at_0p1.prefixed/parallel.fwdxbwd-dict.cs-en"
# $word2vec/word2vec -train $corpus_cs -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_cs.noprefix"
# python $utils/prefix_lines.py -i $temp/embeddings_cs.noprefix -o $temp/embeddings_cs.prefix -p cs:
# python $utils/strip_lines.py -i $temp/embeddings_cs.prefix -o $temp/embeddings_cs
#./project_vectors_to_lang2.sh "$temp/embeddings_cs" "$temp/embeddings_en" $dictionary_cs_en "$temp/dummy" "$temp/embeddings_cs.projected" "$temp/embeddings_en.projected"
# cat "$temp/embeddings_cs.projected" >> $output_embeddings

# # process da
# export corpus_da="/usr1/home/wammar/monolingual/combo.da"
# export dictionary_da_en="/usr1/home/wammar/bilingual-dictionaries/word-aligned/parallel.fwdxbwd-dict.filter_at_0p1.prefixed/parallel.fwdxbwd-dict.da-en"
# $word2vec/word2vec -train $corpus_da -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_da.noprefix"
# python $utils/prefix_lines.py -i $temp/embeddings_da.noprefix -o $temp/embeddings_da.prefix -p da:
# python $utils/strip_lines.py -i $temp/embeddings_da.prefix -o $temp/embeddings_da
# ./project_vectors_to_lang2.sh "$temp/embeddings_da" "$temp/embeddings_en" $dictionary_da_en "$temp/dummy" "$temp/embeddings_da.projected" "$temp/embeddings_en.projected"
# cat "$temp/embeddings_da.projected" >> $output_embeddings

# # process de
# export corpus_de="/usr1/home/wammar/monolingual/combo.de"
# export dictionary_de_en="/usr1/home/wammar/bilingual-dictionaries/word-aligned/parallel.fwdxbwd-dict.filter_at_0p1.prefixed/parallel.fwdxbwd-dict.de-en"
# $word2vec/word2vec -train $corpus_de -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_de.noprefix"
# python $utils/prefix_lines.py -i $temp/embeddings_de.noprefix -o $temp/embeddings_de.prefix -p de:
# python $utils/strip_lines.py -i $temp/embeddings_de.prefix -o $temp/embeddings_de
# ./project_vectors_to_lang2.sh "$temp/embeddings_de" "$temp/embeddings_en" $dictionary_de_en "$temp/dummy" "$temp/embeddings_de.projected" "$temp/embeddings_en.projected"
# cat "$temp/embeddings_de.projected" >> $output_embeddings

# # process el
# export corpus_el="/usr1/home/wammar/monolingual/combo.el"
# export dictionary_el_en="/usr1/home/wammar/bilingual-dictionaries/word-aligned/parallel.fwdxbwd-dict.filter_at_0p1.prefixed/parallel.fwdxbwd-dict.el-en"
# $word2vec/word2vec -train $corpus_el -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_el.noprefix"
# python $utils/prefix_lines.py -i $temp/embeddings_el.noprefix -o $temp/embeddings_el.prefix -p el:
# python $utils/strip_lines.py -i $temp/embeddings_el.prefix -o $temp/embeddings_el
# ./project_vectors_to_lang2.sh "$temp/embeddings_el" "$temp/embeddings_en" $dictionary_el_en "$temp/dummy" "$temp/embeddings_el.projected" "$temp/embeddings_en.projected"
# cat "$temp/embeddings_el.projected" >> $output_embeddings

# # process es
# export corpus_es="/usr1/home/wammar/monolingual/combo.es"
# export dictionary_es_en="/usr1/home/wammar/bilingual-dictionaries/word-aligned/parallel.fwdxbwd-dict.filter_at_0p1.prefixed/parallel.fwdxbwd-dict.es-en"
# $word2vec/word2vec -train $corpus_es -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_es.noprefix"
# python $utils/prefix_lines.py -i $temp/embeddings_es.noprefix -o $temp/embeddings_es.prefix -p es:
# python $utils/strip_lines.py -i $temp/embeddings_es.prefix -o $temp/embeddings_es
# ./project_vectors_to_lang2.sh "$temp/embeddings_es" "$temp/embeddings_en" $dictionary_es_en "$temp/dummy" "$temp/embeddings_es.projected" "$temp/embeddings_en.projected"
# cat "$temp/embeddings_es.projected" >> $output_embeddings

# # process fi
# export corpus_fi="/usr1/home/wammar/monolingual/combo.fi"
# export dictionary_fi_en="/usr1/home/wammar/bilingual-dictionaries/word-aligned/parallel.fwdxbwd-dict.filter_at_0p1.prefixed/parallel.fwdxbwd-dict.fi-en"
# $word2vec/word2vec -train $corpus_fi -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_fi.noprefix"
# python $utils/prefix_lines.py -i $temp/embeddings_fi.noprefix -o $temp/embeddings_fi.prefix -p fi:
# python $utils/strip_lines.py -i $temp/embeddings_fi.prefix -o $temp/embeddings_fi
# ./project_vectors_to_lang2.sh "$temp/embeddings_fi" "$temp/embeddings_en" $dictionary_fi_en "$temp/dummy" "$temp/embeddings_fi.projected" "$temp/embeddings_en.projected"
# cat "$temp/embeddings_fi.projected" >> $output_embeddings

# # process fr
# export corpus_fr="/usr1/home/wammar/monolingual/combo.fr"
# export dictionary_fr_en="/usr1/home/wammar/bilingual-dictionaries/word-aligned/parallel.fwdxbwd-dict.filter_at_0p1.prefixed/parallel.fwdxbwd-dict.fr-en"
# $word2vec/word2vec -train $corpus_fr -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_fr.noprefix"
# python $utils/prefix_lines.py -i $temp/embeddings_fr.noprefix -o $temp/embeddings_fr.prefix -p fr:
# python $utils/strip_lines.py -i $temp/embeddings_fr.prefix -o $temp/embeddings_fr
# ./project_vectors_to_lang2.sh "$temp/embeddings_fr" "$temp/embeddings_en" $dictionary_fr_en "$temp/dummy" "$temp/embeddings_fr.projected" "$temp/embeddings_en.projected"
# cat "$temp/embeddings_fr.projected" >> $output_embeddings

# # process hu
# export corpus_hu="/usr1/home/wammar/monolingual/combo.hu"
# export dictionary_hu_en="/usr1/home/wammar/bilingual-dictionaries/word-aligned/parallel.fwdxbwd-dict.filter_at_0p1.prefixed/parallel.fwdxbwd-dict.hu-en"
# $word2vec/word2vec -train $corpus_hu -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_hu.noprefix"
# python $utils/prefix_lines.py -i $temp/embeddings_hu.noprefix -o $temp/embeddings_hu.prefix -p hu:
# python $utils/strip_lines.py -i $temp/embeddings_hu.prefix -o $temp/embeddings_hu
# ./project_vectors_to_lang2.sh "$temp/embeddings_hu" "$temp/embeddings_en" $dictionary_hu_en "$temp/dummy" "$temp/embeddings_hu.projected" "$temp/embeddings_en.projected"
# cat "$temp/embeddings_hu.projected" >> $output_embeddings

# # process italian
# export corpus_it="/usr1/home/wammar/monolingual/combo.it"
# export dictionary_it_en="/usr1/home/wammar/bilingual-dictionaries/word-aligned/parallel.fwdxbwd-dict.filter_at_0p1.prefixed/parallel.fwdxbwd-dict.it-en"
# $word2vec/word2vec -train $corpus_it -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_it.noprefix"
# python $utils/prefix_lines.py -i $temp/embeddings_it.noprefix -o $temp/embeddings_it.prefix -p it:
# python $utils/strip_lines.py -i $temp/embeddings_it.prefix -o $temp/embeddings_it
# ./project_vectors_to_lang2.sh "$temp/embeddings_it" "$temp/embeddings_en" $dictionary_it_en "$temp/dummy" "$temp/embeddings_it.projected" "$temp/embeddings_en.projected"
# cat "$temp/embeddings_it.projected" >> $output_embeddings

# # process sv
# export corpus_sv="/usr1/home/wammar/monolingual/combo.sv"
# export dictionary_sv_en="/usr1/home/wammar/bilingual-dictionaries/word-aligned/parallel.fwdxbwd-dict.filter_at_0p1.prefixed/parallel.fwdxbwd-dict.sv-en"
# $word2vec/word2vec -train $corpus_sv -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_sv.noprefix"
# python $utils/prefix_lines.py -i $temp/embeddings_sv.noprefix -o $temp/embeddings_sv.prefix -p sv:
# python $utils/strip_lines.py -i $temp/embeddings_sv.prefix -o $temp/embeddings_sv
# ./project_vectors_to_lang2.sh "$temp/embeddings_sv" "$temp/embeddings_en" $dictionary_sv_en "$temp/dummy" "$temp/embeddings_sv.projected" "$temp/embeddings_en.projected"
# cat "$temp/embeddings_sv.projected" >> $output_embeddings

# # finally, concatenate normalized english embeddings
# cat "$temp/embeddings_en.projected" >> $output_embeddings

# @george, please add the new languages below:

# process af
export corpus_af="/usr1/home/wammar/monolingual/combo.af"
export dictionary_af_en="/usr1/home/wammar/bilingual-dictionaries/word-aligned/parallel.fwdxbwd-dict.filter_at_0p1.prefixed/parallel.fwdxbwd-dict.af-en"
$word2vec/word2vec -train $corpus_af -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_af.noprefix"
python $utils/prefix_lines.py -i $temp/embeddings_af.noprefix -o $temp/embeddings_af.prefix -p af:
python $utils/strip_lines.py -i $temp/embeddings_af.prefix -o $temp/embeddings_af
./project_vectors_to_lang2.sh "$temp/embeddings_af" "$temp/embeddings_en" $dictionary_af_en "$temp/dummy" "$temp/embeddings_af.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_af.projected" >> $output_embeddings

