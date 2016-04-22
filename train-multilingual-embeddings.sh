export output_embeddings="new_location" #"/usr1/home/wammar/cca-embeddings/all_languages.cca.window_5+iter_10+size_40+threads_16"
export temp="/usr1/home/wammar/cca-embeddings/"
export utils="/usr1/home/wammar/wammar-utils/"
export word2vec="/usr1/home/wammar/incremental-word2vec/"

# create temp dir
mkdir $temp

# remove old embeddings if any
rm $output_embeddings

# process en
export corpus_en="/usr1/home/wammar/monolingual/combo.en"
$word2vec/word2vec -train $corpus_en -window 5 -iter 10 -size 40 -threads 16 -output $temp/embeddings_en.noprefix
python $utils/prefix_lines.py -i $temp/embeddings_en.noprefix -o $temp/embeddings_en.prefix -p en:
python $utils/strip_lines.py -i $temp/embeddings_en.prefix -o $temp/embeddings_en

# process bg
export corpus_bg="/usr1/home/wammar/monolingual/combo.bg"
export dictionary_bg_en="/usr1/home/wammar/bilingual-dictionaries/word-aligned/parallel.fwdxbwd-dict.filter_at_0p1.prefixed/parallel.fwdxbwd-dict.bg-en"
$word2vec/word2vec -train $corpus_bg -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_bg.noprefix"
python $utils/prefix_lines.py -i $temp/embeddings_bg.noprefix -o $temp/embeddings_bg.prefix -p bg:
python $utils/strip_lines.py -i $temp/embeddings_bg.prefix -o $temp/embeddings_bg
./project_vectors_to_lang2.sh "$temp/embeddings_bg" "$temp/embeddings_en" $dictionary_bg_en "$temp/dummy" "$temp/embeddings_bg.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_bg.projected" >> $output_embeddings

# process cs
export corpus_cs="/usr1/home/wammar/monolingual/combo.cs"
export dictionary_cs_en="/usr1/home/wammar/bilingual-dictionaries/word-aligned/parallel.fwdxbwd-dict.filter_at_0p1.prefixed/parallel.fwdxbwd-dict.cs-en"
$word2vec/word2vec -train $corpus_cs -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_cs.noprefix"
python $utils/prefix_lines.py -i $temp/embeddings_cs.noprefix -o $temp/embeddings_cs.prefix -p cs:
python $utils/strip_lines.py -i $temp/embeddings_cs.prefix -o $temp/embeddings_cs
./project_vectors_to_lang2.sh "$temp/embeddings_cs" "$temp/embeddings_en" $dictionary_cs_en "$temp/dummy" "$temp/embeddings_cs.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_cs.projected" >> $output_embeddings

# process da
export corpus_da="/usr1/home/wammar/monolingual/combo.da"
export dictionary_da_en="/usr1/home/wammar/bilingual-dictionaries/word-aligned/parallel.fwdxbwd-dict.filter_at_0p1.prefixed/parallel.fwdxbwd-dict.da-en"
$word2vec/word2vec -train $corpus_da -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_da.noprefix"
python $utils/prefix_lines.py -i $temp/embeddings_da.noprefix -o $temp/embeddings_da.prefix -p da:
python $utils/strip_lines.py -i $temp/embeddings_da.prefix -o $temp/embeddings_da
./project_vectors_to_lang2.sh "$temp/embeddings_da" "$temp/embeddings_en" $dictionary_da_en "$temp/dummy" "$temp/embeddings_da.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_da.projected" >> $output_embeddings

# process de
export corpus_de="/usr1/home/wammar/monolingual/combo.de"
export dictionary_de_en="/usr1/home/wammar/bilingual-dictionaries/word-aligned/parallel.fwdxbwd-dict.filter_at_0p1.prefixed/parallel.fwdxbwd-dict.de-en"
$word2vec/word2vec -train $corpus_de -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_de.noprefix"
python $utils/prefix_lines.py -i $temp/embeddings_de.noprefix -o $temp/embeddings_de.prefix -p de:
python $utils/strip_lines.py -i $temp/embeddings_de.prefix -o $temp/embeddings_de
./project_vectors_to_lang2.sh "$temp/embeddings_de" "$temp/embeddings_en" $dictionary_de_en "$temp/dummy" "$temp/embeddings_de.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_de.projected" >> $output_embeddings

# process el
export corpus_el="/usr1/home/wammar/monolingual/combo.el"
export dictionary_el_en="/usr1/home/wammar/bilingual-dictionaries/word-aligned/parallel.fwdxbwd-dict.filter_at_0p1.prefixed/parallel.fwdxbwd-dict.el-en"
$word2vec/word2vec -train $corpus_el -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_el.noprefix"
python $utils/prefix_lines.py -i $temp/embeddings_el.noprefix -o $temp/embeddings_el.prefix -p el:
python $utils/strip_lines.py -i $temp/embeddings_el.prefix -o $temp/embeddings_el
./project_vectors_to_lang2.sh "$temp/embeddings_el" "$temp/embeddings_en" $dictionary_el_en "$temp/dummy" "$temp/embeddings_el.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_el.projected" >> $output_embeddings

# process es
export corpus_es="/usr1/home/wammar/monolingual/combo.es"
export dictionary_es_en="/usr1/home/wammar/bilingual-dictionaries/word-aligned/parallel.fwdxbwd-dict.filter_at_0p1.prefixed/parallel.fwdxbwd-dict.es-en"
$word2vec/word2vec -train $corpus_es -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_es.noprefix"
python $utils/prefix_lines.py -i $temp/embeddings_es.noprefix -o $temp/embeddings_es.prefix -p es:
python $utils/strip_lines.py -i $temp/embeddings_es.prefix -o $temp/embeddings_es
./project_vectors_to_lang2.sh "$temp/embeddings_es" "$temp/embeddings_en" $dictionary_es_en "$temp/dummy" "$temp/embeddings_es.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_es.projected" >> $output_embeddings

# process fi
export corpus_fi="/usr1/home/wammar/monolingual/combo.fi"
export dictionary_fi_en="/usr1/home/wammar/bilingual-dictionaries/word-aligned/parallel.fwdxbwd-dict.filter_at_0p1.prefixed/parallel.fwdxbwd-dict.fi-en"
$word2vec/word2vec -train $corpus_fi -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_fi.noprefix"
python $utils/prefix_lines.py -i $temp/embeddings_fi.noprefix -o $temp/embeddings_fi.prefix -p fi:
python $utils/strip_lines.py -i $temp/embeddings_fi.prefix -o $temp/embeddings_fi
./project_vectors_to_lang2.sh "$temp/embeddings_fi" "$temp/embeddings_en" $dictionary_fi_en "$temp/dummy" "$temp/embeddings_fi.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_fi.projected" >> $output_embeddings

# process fr
export corpus_fr="/usr1/home/wammar/monolingual/combo.fr"
export dictionary_fr_en="/usr1/home/wammar/bilingual-dictionaries/word-aligned/parallel.fwdxbwd-dict.filter_at_0p1.prefixed/parallel.fwdxbwd-dict.fr-en"
$word2vec/word2vec -train $corpus_fr -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_fr.noprefix"
python $utils/prefix_lines.py -i $temp/embeddings_fr.noprefix -o $temp/embeddings_fr.prefix -p fr:
python $utils/strip_lines.py -i $temp/embeddings_fr.prefix -o $temp/embeddings_fr
./project_vectors_to_lang2.sh "$temp/embeddings_fr" "$temp/embeddings_en" $dictionary_fr_en "$temp/dummy" "$temp/embeddings_fr.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_fr.projected" >> $output_embeddings

# process hu
export corpus_hu="/usr1/home/wammar/monolingual/combo.hu"
export dictionary_hu_en="/usr1/home/wammar/bilingual-dictionaries/word-aligned/parallel.fwdxbwd-dict.filter_at_0p1.prefixed/parallel.fwdxbwd-dict.hu-en"
$word2vec/word2vec -train $corpus_hu -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_hu.noprefix"
python $utils/prefix_lines.py -i $temp/embeddings_hu.noprefix -o $temp/embeddings_hu.prefix -p hu:
python $utils/strip_lines.py -i $temp/embeddings_hu.prefix -o $temp/embeddings_hu
./project_vectors_to_lang2.sh "$temp/embeddings_hu" "$temp/embeddings_en" $dictionary_hu_en "$temp/dummy" "$temp/embeddings_hu.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_hu.projected" >> $output_embeddings

# process italian
export corpus_it="/usr1/home/wammar/monolingual/combo.it"
export dictionary_it_en="/usr1/home/wammar/bilingual-dictionaries/word-aligned/parallel.fwdxbwd-dict.filter_at_0p1.prefixed/parallel.fwdxbwd-dict.it-en"
$word2vec/word2vec -train $corpus_it -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_it.noprefix"
python $utils/prefix_lines.py -i $temp/embeddings_it.noprefix -o $temp/embeddings_it.prefix -p it:
python $utils/strip_lines.py -i $temp/embeddings_it.prefix -o $temp/embeddings_it
./project_vectors_to_lang2.sh "$temp/embeddings_it" "$temp/embeddings_en" $dictionary_it_en "$temp/dummy" "$temp/embeddings_it.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_it.projected" >> $output_embeddings

# process sv
export corpus_sv="/usr1/home/wammar/monolingual/combo.sv"
export dictionary_sv_en="/usr1/home/wammar/bilingual-dictionaries/word-aligned/parallel.fwdxbwd-dict.filter_at_0p1.prefixed/parallel.fwdxbwd-dict.sv-en"
$word2vec/word2vec -train $corpus_sv -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_sv.noprefix"
python $utils/prefix_lines.py -i $temp/embeddings_sv.noprefix -o $temp/embeddings_sv.prefix -p sv:
python $utils/strip_lines.py -i $temp/embeddings_sv.prefix -o $temp/embeddings_sv
./project_vectors_to_lang2.sh "$temp/embeddings_sv" "$temp/embeddings_en" $dictionary_sv_en "$temp/dummy" "$temp/embeddings_sv.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_sv.projected" >> $output_embeddings

# process af
export corpus_af="/usr1/home/wammar/monolingual/combo.af"
export dictionary_af_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.af-en.prefixed"
$word2vec/word2vec -train $corpus_af -window 5 -iter 10 -size 40 -threads 16 -output $temp/embeddings_af.noprefix
python $utils/prefix_lines.py -i $temp/embeddings_af.noprefix -o $temp/embeddings_af.prefix -p af:
python $utils/strip_lines.py -i $temp/embeddings_af.prefix -o $temp/embeddings_af
./project_vectors_to_lang2.sh "$temp/embeddings_af" "$temp/embeddings_en" $dictionary_af_en "$temp/dummy" "$temp/embeddings_af.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_af.projected" >> $output_embeddings

# process ar
export corpus_ar="/usr1/home/wammar/monolingual/combo.ar"
export dictionary_ar_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.ar-en.prefixed"
$word2vec/word2vec -train $corpus_ar -window 5 -iter 10 -size 40 -threads 16 -output $temp/embeddings_ar.noprefix
python $utils/prefix_lines.py -i $temp/embeddings_ar.noprefix -o $temp/embeddings_ar.prefix -p ar:
python $utils/strip_lines.py -i $temp/embeddings_ar.prefix -o $temp/embeddings_ar
./project_vectors_to_lang2.sh $temp/embeddings_ar $temp/embeddings_en $dictionary_ar_en $temp/dummy $temp/embeddings_ar.projected $temp/embeddings_en.projected
cat $temp/embeddings_ar.projected >> $output_embeddings

# process be
export corpus_be="/usr1/home/wammar/monolingual/combo.be"
export dictionary_be_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.be-en.prefixed"
$word2vec/word2vec -train $corpus_be -window 5 -iter 10 -size 40 -threads 16 -output $temp/embeddings_be.noprefix
python $utils/prefix_lines.py -i $temp/embeddings_be.noprefix -o $temp/embeddings_be.prefix -p be:
python $utils/strip_lines.py -i $temp/embeddings_be.prefix -o $temp/embeddings_be
./project_vectors_to_lang2.sh $temp/embeddings_be "$temp/embeddings_en" $dictionary_be_en "$temp/dummy" "$temp/embeddings_be.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_be.projected" >> $output_embeddings

# process bn
export corpus_bn="/usr1/home/wammar/monolingual/combo.bn"
export dictionary_bn_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.bn-en.prefixed"
$word2vec/word2vec -train $corpus_bn -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_bn.noprefix"
python $utils/prefix_lines.py -i $temp/embeddings_bn.noprefix -o $temp/embeddings_bn.prefix -p bn:
python $utils/strip_lines.py -i $temp/embeddings_bn.prefix -o $temp/embeddings_bn
./project_vectors_to_lang2.sh "$temp/embeddings_bn" "$temp/embeddings_en" $dictionary_bn_en "$temp/dummy" "$temp/embeddings_bn.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_bn.projected" >> $output_embeddings

# process bs
export corpus_bs="/usr1/home/wammar/monolingual/combo.bs"
export dictionary_bs_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.bs-en.prefixed"
$word2vec/word2vec -train $corpus_bs -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_bs.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_bs.noprefix" -o $temp/embeddings_bs.prefix -p bs:
python $utils/strip_lines.py -i $temp/embeddings_bs.prefix -o $temp/embeddings_bs
./project_vectors_to_lang2.sh "$temp/embeddings_bs" "$temp/embeddings_en" $dictionary_bs_en "$temp/dummy" "$temp/embeddings_bs.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_bs.projected" >> $output_embeddings

# process ca
export corpus_ca="/usr1/home/wammar/monolingual/combo.ca"
export dictionary_ca_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.ca-en.prefixed"
$word2vec/word2vec -train $corpus_ca -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_ca.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_ca.noprefix" -o $temp/embeddings_ca.prefix -p ca:
python $utils/strip_lines.py -i $temp/embeddings_ca.prefix -o $temp/embeddings_ca
./project_vectors_to_lang2.sh "$temp/embeddings_ca" "$temp/embeddings_en" $dictionary_ca_en "$temp/dummy" "$temp/embeddings_ca.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_ca.projected" >> $output_embeddings

# process gm
export corpus_gm="/usr1/home/wammar/monolingual/combo.gm"
export dictionary_gm_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.gm-en.prefixed"
$word2vec/word2vec -train $corpus_gm -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_gm.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_gm.noprefix" -o $temp/embeddings_gm.prefix -p gm:
python $utils/strip_lines.py -i $temp/embeddings_gm.prefix -o $temp/embeddings_gm
./project_vectors_to_lang2.sh "$temp/embeddings_gm" "$temp/embeddings_en" $dictionary_gm_en "$temp/dummy" "$temp/embeddings_gm.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_gm.projected" >> $output_embeddings

# process cy
export corpus_cy="/usr1/home/wammar/monolingual/combo.cy"
export dictionary_cy_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.cy-en.prefixed"
$word2vec/word2vec -train $corpus_cy -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_cy.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_cy.noprefix" -o $temp/embeddings_cy.prefix -p cy:
python $utils/strip_lines.py -i $temp/embeddings_cy.prefix -o $temp/embeddings_cy
./project_vectors_to_lang2.sh "$temp/embeddings_cy" "$temp/embeddings_en" $dictionary_cy_en "$temp/dummy" "$temp/embeddings_cy.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_cy.projected" >> $output_embeddings

# process et
export corpus_et="/usr1/home/wammar/monolingual/combo.et"
export dictionary_et_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.et-en.prefixed"
$word2vec/word2vec -train $corpus_et -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_et.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_et.noprefix" -o $temp/embeddings_et.prefix -p et:
python $utils/strip_lines.py -i $temp/embeddings_et.prefix -o $temp/embeddings_et
./project_vectors_to_lang2.sh "$temp/embeddings_et" "$temp/embeddings_en" $dictionary_et_en "$temp/dummy" "$temp/embeddings_et.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_et.projected" >> $output_embeddings

# process fa
export corpus_fa="/usr1/home/wammar/monolingual/combo.fa"
export dictionary_fa_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.fa-en.prefixed"
$word2vec/word2vec -train $corpus_fa -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_fa.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_fa.noprefix" -o $temp/embeddings_fa.prefix -p fa:
python $utils/strip_lines.py -i $temp/embeddings_fa.prefix -o $temp/embeddings_fa
./project_vectors_to_lang2.sh "$temp/embeddings_fa" "$temp/embeddings_en" $dictionary_fa_en "$temp/dummy" "$temp/embeddings_fa.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_fa.projected" >> $output_embeddings

# process ga
export corpus_ga="/usr1/home/wammar/monolingual/combo.ga"
export dictionary_ga_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.ga-en.prefixed"
$word2vec/word2vec -train $corpus_ga -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_ga.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_ga.noprefix" -o $temp/embeddings_ga.prefix -p ga:
python $utils/strip_lines.py -i $temp/embeddings_ga.prefix -o $temp/embeddings_ga
./project_vectors_to_lang2.sh "$temp/embeddings_ga" "$temp/embeddings_en" $dictionary_ga_en "$temp/dummy" "$temp/embeddings_ga.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_ga.projected" >> $output_embeddings

# process gl
export corpus_gl="/usr1/home/wammar/monolingual/combo.gl"
export dictionary_gl_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.gl-en.prefixed"
$word2vec/word2vec -train $corpus_gl -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_gl.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_gl.noprefix" -o $temp/embeddings_gl.prefix -p gl:
python $utils/strip_lines.py -i $temp/embeddings_gl.prefix -o $temp/embeddings_gl
./project_vectors_to_lang2.sh "$temp/embeddings_gl" "$temp/embeddings_en" $dictionary_gl_en "$temp/dummy" "$temp/embeddings_gl.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_gl.projected" >> $output_embeddings

# process gu
export corpus_gu="/usr1/home/wammar/monolingual/combo.gu"
export dictionary_gu_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.gu-en.prefixed"
$word2vec/word2vec -train $corpus_gu -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_gu.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_gu.noprefix" -o $temp/embeddings_gu.prefix -p gu:
python $utils/strip_lines.py -i $temp/embeddings_gu.prefix -o $temp/embeddings_gu
./project_vectors_to_lang2.sh "$temp/embeddings_gu" "$temp/embeddings_en" $dictionary_gu_en "$temp/dummy" "$temp/embeddings_gu.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_gu.projected" >> $output_embeddings

# process hi
export corpus_hi="/usr1/home/wammar/monolingual/combo.hi"
export dictionary_hi_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.hi-en.prefixed"
$word2vec/word2vec -train $corpus_hi -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_hi.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_hi.noprefix" -o $temp/embeddings_hi.prefix -p hi:
python $utils/strip_lines.py -i $temp/embeddings_hi.prefix -o $temp/embeddings_hi
./project_vectors_to_lang2.sh "$temp/embeddings_hi" "$temp/embeddings_en" $dictionary_hi_en "$temp/dummy" "$temp/embeddings_hi.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_hi.projected" >> $output_embeddings

# process hr
export corpus_hr="/usr1/home/wammar/monolingual/combo.hr"
export dictionary_hr_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.hr-en.prefixed"
$word2vec/word2vec -train $corpus_hr -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_hr.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_hr.noprefix" -o $temp/embeddings_hr.prefix -p hr:
python $utils/strip_lines.py -i $temp/embeddings_hr.prefix -o $temp/embeddings_hr
./project_vectors_to_lang2.sh "$temp/embeddings_hr" "$temp/embeddings_en" $dictionary_hr_en "$temp/dummy" "$temp/embeddings_hr.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_hr.projected" >> $output_embeddings

# process ht
export corpus_ht="/usr1/home/wammar/monolingual/combo.ht"
export dictionary_ht_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.ht-en.prefixed"
$word2vec/word2vec -train $corpus_ht -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_ht.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_ht.noprefix" -o $temp/embeddings_ht.prefix -p ht:
python $utils/strip_lines.py -i $temp/embeddings_ht.prefix -o $temp/embeddings_ht
./project_vectors_to_lang2.sh "$temp/embeddings_ht" "$temp/embeddings_en" $dictionary_ht_en "$temp/dummy" "$temp/embeddings_ht.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_ht.projected" >> $output_embeddings

# process hy
export corpus_hy="/usr1/home/wammar/monolingual/combo.hy"
export dictionary_hy_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.hy-en.prefixed"
$word2vec/word2vec -train $corpus_hy -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_hy.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_hy.noprefix" -o $temp/embeddings_hy.prefix -p hy:
python $utils/strip_lines.py -i $temp/embeddings_hy.prefix -o $temp/embeddings_hy
./project_vectors_to_lang2.sh "$temp/embeddings_hy" "$temp/embeddings_en" $dictionary_hy_en "$temp/dummy" "$temp/embeddings_hy.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_hy.projected" >> $output_embeddings

# process id
export corpus_id="/usr1/home/wammar/monolingual/combo.id"
export dictionary_id_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.id-en.prefixed"
$word2vec/word2vec -train $corpus_id -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_id.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_id.noprefix" -o $temp/embeddings_id.prefix -p id:
python $utils/strip_lines.py -i $temp/embeddings_id.prefix -o $temp/embeddings_id
./project_vectors_to_lang2.sh "$temp/embeddings_id" "$temp/embeddings_en" $dictionary_id_en "$temp/dummy" "$temp/embeddings_id.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_id.projected" >> $output_embeddings

# process is
export corpus_is="/usr1/home/wammar/monolingual/combo.is"
export dictionary_is_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.is-en.prefixed"
$word2vec/word2vec -train $corpus_is -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_is.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_is.noprefix" -o $temp/embeddings_is.prefix -p is:
python $utils/strip_lines.py -i $temp/embeddings_is.prefix -o $temp/embeddings_is
./project_vectors_to_lang2.sh "$temp/embeddings_is" "$temp/embeddings_en" $dictionary_is_en "$temp/dummy" "$temp/embeddings_is.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_is.projected" >> $output_embeddings

# process iw
export corpus_iw="/usr1/home/wammar/monolingual/combo.iw"
export dictionary_iw_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.iw-en.prefixed"
$word2vec/word2vec -train $corpus_iw -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_iw.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_iw.noprefix" -o $temp/embeddings_iw.prefix -p iw:
python $utils/strip_lines.py -i $temp/embeddings_iw.prefix -o $temp/embeddings_iw
./project_vectors_to_lang2.sh "$temp/embeddings_iw" "$temp/embeddings_en" $dictionary_iw_en "$temp/dummy" "$temp/embeddings_iw.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_iw.projected" >> $output_embeddings

# process ja
export corpus_ja="/usr1/home/wammar/monolingual/combo.ja"
export dictionary_ja_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.ja-en.prefixed"
$word2vec/word2vec -train $corpus_ja -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_ja.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_ja.noprefix" -o $temp/embeddings_ja.prefix -p ja:
python $utils/strip_lines.py -i $temp/embeddings_ja.prefix -o $temp/embeddings_ja
./project_vectors_to_lang2.sh "$temp/embeddings_ja" "$temp/embeddings_en" $dictionary_ja_en "$temp/dummy" "$temp/embeddings_ja.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_ja.projected" >> $output_embeddings

# process jw
export corpus_jw="/usr1/home/wammar/monolingual/combo.jw"
export dictionary_jw_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.jw-en.prefixed"
$word2vec/word2vec -train $corpus_jw -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_jw.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_jw.noprefix" -o $temp/embeddings_jw.prefix -p jw:
python $utils/strip_lines.py -i $temp/embeddings_jw.prefix -o $temp/embeddings_jw
./project_vectors_to_lang2.sh "$temp/embeddings_jw" "$temp/embeddings_en" $dictionary_jw_en "$temp/dummy" "$temp/embeddings_jw.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_jw.projected" >> $output_embeddings

# process ka
export corpus_ka="/usr1/home/wammar/monolingual/combo.ka"
export dictionary_ka_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.ka-en.prefixed"
$word2vec/word2vec -train $corpus_ka -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_ka.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_ka.noprefix" -o $temp/embeddings_ka.prefix -p ka:
python $utils/strip_lines.py -i $temp/embeddings_ka.prefix -o $temp/embeddings_ka
./project_vectors_to_lang2.sh "$temp/embeddings_ka" "$temp/embeddings_en" $dictionary_ka_en "$temp/dummy" "$temp/embeddings_ka.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_ka.projected" >> $output_embeddings

# process kk
export corpus_kk="/usr1/home/wammar/monolingual/combo.kk"
export dictionary_kk_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.kk-en.prefixed"
$word2vec/word2vec -train $corpus_kk -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_kk.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_kk.noprefix" -o $temp/embeddings_kk.prefix -p kk:
python $utils/strip_lines.py -i $temp/embeddings_kk.prefix -o $temp/embeddings_kk
./project_vectors_to_lang2.sh "$temp/embeddings_kk" "$temp/embeddings_en" $dictionary_kk_en "$temp/dummy" "$temp/embeddings_kk.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_kk.projected" >> $output_embeddings

# process kn
export corpus_kn="/usr1/home/wammar/monolingual/combo.kn"
export dictionary_kn_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.kn-en.prefixed"
$word2vec/word2vec -train $corpus_kn -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_kn.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_kn.noprefix" -o $temp/embeddings_kn.prefix -p kn:
python $utils/strip_lines.py -i $temp/embeddings_kn.prefix -o $temp/embeddings_kn
./project_vectors_to_lang2.sh "$temp/embeddings_kn" "$temp/embeddings_en" $dictionary_kn_en "$temp/dummy" "$temp/embeddings_kn.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_kn.projected" >> $output_embeddings

# process ko
export corpus_ko="/usr1/home/wammar/monolingual/combo.ko"
export dictionary_ko_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.ko-en.prefixed"
$word2vec/word2vec -train $corpus_ko -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_ko.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_ko.noprefix" -o $temp/embeddings_ko.prefix -p ko:
python $utils/strip_lines.py -i $temp/embeddings_ko.prefix -o $temp/embeddings_ko
./project_vectors_to_lang2.sh "$temp/embeddings_ko" "$temp/embeddings_en" $dictionary_ko_en "$temp/dummy" "$temp/embeddings_ko.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_ko.projected" >> $output_embeddings

# process la
export corpus_la="/usr1/home/wammar/monolingual/combo.la"
export dictionary_la_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.la-en.prefixed"
$word2vec/word2vec -train $corpus_la -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_la.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_la.noprefix" -o $temp/embeddings_la.prefix -p la:
python $utils/strip_lines.py -i $temp/embeddings_la.prefix -o $temp/embeddings_la
./project_vectors_to_lang2.sh "$temp/embeddings_la" "$temp/embeddings_en" $dictionary_la_en "$temp/dummy" "$temp/embeddings_la.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_la.projected" >> $output_embeddings

# process lt
export corpus_lt="/usr1/home/wammar/monolingual/combo.lt"
export dictionary_lt_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.lt-en.prefixed"
$word2vec/word2vec -train $corpus_lt -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_lt.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_lt.noprefix" -o $temp/embeddings_lt.prefix -p lt:
python $utils/strip_lines.py -i $temp/embeddings_lt.prefix -o $temp/embeddings_lt
./project_vectors_to_lang2.sh "$temp/embeddings_lt" "$temp/embeddings_en" $dictionary_lt_en "$temp/dummy" "$temp/embeddings_lt.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_lt.projected" >> $output_embeddings

# process lv
export corpus_lv="/usr1/home/wammar/monolingual/combo.lv"
export dictionary_lv_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.lv-en.prefixed"
$word2vec/word2vec -train $corpus_lv -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_lv.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_lv.noprefix" -o $temp/embeddings_lv.prefix -p lv:
python $utils/strip_lines.py -i $temp/embeddings_lv.prefix -o $temp/embeddings_lv
./project_vectors_to_lang2.sh "$temp/embeddings_lv" "$temp/embeddings_en" $dictionary_lv_en "$temp/dummy" "$temp/embeddings_lv.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_lv.projected" >> $output_embeddings

# process mg
export corpus_mg="/usr1/home/wammar/monolingual/combo.mg"
export dictionary_mg_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.mg-en.prefixed"
$word2vec/word2vec -train $corpus_mg -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_mg.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_mg.noprefix" -o $temp/embeddings_mg.prefix -p mg:
python $utils/strip_lines.py -i $temp/embeddings_mg.prefix -o $temp/embeddings_mg
./project_vectors_to_lang2.sh "$temp/embeddings_mg" "$temp/embeddings_en" $dictionary_mg_en "$temp/dummy" "$temp/embeddings_mg.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_mg.projected" >> $output_embeddings

# process mi
export corpus_mi="/usr1/home/wammar/monolingual/combo.mi"
export dictionary_mi_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.mi-en.prefixed"
$word2vec/word2vec -train $corpus_mi -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_mi.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_mi.noprefix" -o $temp/embeddings_mi.prefix -p mi:
python $utils/strip_lines.py -i $temp/embeddings_mi.prefix -o $temp/embeddings_mi
./project_vectors_to_lang2.sh "$temp/embeddings_mi" "$temp/embeddings_en" $dictionary_mi_en "$temp/dummy" "$temp/embeddings_mi.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_mi.projected" >> $output_embeddings

# process mk
export corpus_mk="/usr1/home/wammar/monolingual/combo.mk"
export dictionary_mk_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.mk-en.prefixed"
$word2vec/word2vec -train $corpus_mk -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_mk.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_mk.noprefix" -o $temp/embeddings_mk.prefix -p mk:
python $utils/strip_lines.py -i $temp/embeddings_mk.prefix -o $temp/embeddings_mk
./project_vectors_to_lang2.sh "$temp/embeddings_mk" "$temp/embeddings_en" $dictionary_mk_en "$temp/dummy" "$temp/embeddings_mk.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_mk.projected" >> $output_embeddings

# process ml
export corpus_ml="/usr1/home/wammar/monolingual/combo.ml"
export dictionary_ml_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.ml-en.prefixed"
$word2vec/word2vec -train $corpus_ml -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_ml.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_ml.noprefix" -o $temp/embeddings_ml.prefix -p ml:
python $utils/strip_lines.py -i $temp/embeddings_ml.prefix -o $temp/embeddings_ml
./project_vectors_to_lang2.sh "$temp/embeddings_ml" "$temp/embeddings_en" $dictionary_ml_en "$temp/dummy" "$temp/embeddings_ml.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_ml.projected" >> $output_embeddings

# process mn
export corpus_mn="/usr1/home/wammar/monolingual/combo.mn"
export dictionary_mn_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.mn-en.prefixed"
$word2vec/word2vec -train $corpus_mn -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_mn.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_mn.noprefix" -o $temp/embeddings_mn.prefix -p mn:
python $utils/strip_lines.py -i $temp/embeddings_mn.prefix -o $temp/embeddings_mn
./project_vectors_to_lang2.sh "$temp/embeddings_mn" "$temp/embeddings_en" $dictionary_mn_en "$temp/dummy" "$temp/embeddings_mn.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_mn.projected" >> $output_embeddings

# process mr
export corpus_mr="/usr1/home/wammar/monolingual/combo.mr"
export dictionary_mr_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.mr-en.prefixed"
$word2vec/word2vec -train $corpus_mr -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_mr.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_mr.noprefix" -o $temp/embeddings_mr.prefix -p mr:
python $utils/strip_lines.py -i $temp/embeddings_mr.prefix -o $temp/embeddings_mr
./project_vectors_to_lang2.sh "$temp/embeddings_mr" "$temp/embeddings_en" $dictionary_mr_en "$temp/dummy" "$temp/embeddings_mr.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_mr.projected" >> $output_embeddings

# process ms
export corpus_ms="/usr1/home/wammar/monolingual/combo.ms"
export dictionary_ms_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.ms-en.prefixed"
$word2vec/word2vec -train $corpus_ms -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_ms.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_ms.noprefix" -o $temp/embeddings_ms.prefix -p ms:
python $utils/strip_lines.py -i $temp/embeddings_ms.prefix -o $temp/embeddings_ms
./project_vectors_to_lang2.sh "$temp/embeddings_ms" "$temp/embeddings_en" $dictionary_ms_en "$temp/dummy" "$temp/embeddings_ms.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_ms.projected" >> $output_embeddings

# process ne
export corpus_ne="/usr1/home/wammar/monolingual/combo.ne"
export dictionary_ne_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.ne-en.prefixed"
$word2vec/word2vec -train $corpus_ne -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_ne.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_ne.noprefix" -o $temp/embeddings_ne.prefix -p ne:
python $utils/strip_lines.py -i $temp/embeddings_ne.prefix -o $temp/embeddings_ne
./project_vectors_to_lang2.sh "$temp/embeddings_ne" "$temp/embeddings_en" $dictionary_ne_en "$temp/dummy" "$temp/embeddings_ne.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_ne.projected" >> $output_embeddings

# process nl
export corpus_nl="/usr1/home/wammar/monolingual/combo.nl"
export dictionary_nl_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.nl-en.prefixed"
$word2vec/word2vec -train $corpus_nl -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_nl.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_nl.noprefix" -o $temp/embeddings_nl.prefix -p nl:
python $utils/strip_lines.py -i $temp/embeddings_nl.prefix -o $temp/embeddings_nl
./project_vectors_to_lang2.sh "$temp/embeddings_nl" "$temp/embeddings_en" $dictionary_nl_en "$temp/dummy" "$temp/embeddings_nl.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_nl.projected" >> $output_embeddings

# process pl
export corpus_pl="/usr1/home/wammar/monolingual/combo.pl"
export dictionary_pl_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.pl-en.prefixed"
$word2vec/word2vec -train $corpus_pl -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_pl.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_pl.noprefix" -o $temp/embeddings_pl.prefix -p pl:
python $utils/strip_lines.py -i $temp/embeddings_pl.prefix -o $temp/embeddings_pl
./project_vectors_to_lang2.sh "$temp/embeddings_pl" "$temp/embeddings_en" $dictionary_pl_en "$temp/dummy" "$temp/embeddings_pl.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_pl.projected" >> $output_embeddings

# process pt
export corpus_pt="/usr1/home/wammar/monolingual/combo.pt"
export dictionary_pt_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.pt-en.prefixed"
$word2vec/word2vec -train $corpus_pt -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_pt.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_pt.noprefix" -o $temp/embeddings_pt.prefix -p pt:
python $utils/strip_lines.py -i $temp/embeddings_pt.prefix -o $temp/embeddings_pt
./project_vectors_to_lang2.sh "$temp/embeddings_pt" "$temp/embeddings_en" $dictionary_pt_en "$temp/dummy" "$temp/embeddings_pt.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_pt.projected" >> $output_embeddings

# process ro
export corpus_ro="/usr1/home/wammar/monolingual/combo.ro"
export dictionary_ro_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.ro-en.prefixed"
$word2vec/word2vec -train $corpus_ro -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_ro.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_ro.noprefix" -o $temp/embeddings_ro.prefix -p ro:
python $utils/strip_lines.py -i $temp/embeddings_ro.prefix -o $temp/embeddings_ro
./project_vectors_to_lang2.sh "$temp/embeddings_ro" "$temp/embeddings_en" $dictionary_ro_en "$temp/dummy" "$temp/embeddings_ro.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_ro.projected" >> $output_embeddings

# process ru
export corpus_ru="/usr1/home/wammar/monolingual/combo.ru"
export dictionary_ru_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.ru-en.prefixed"
$word2vec/word2vec -train $corpus_ru -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_ru.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_ru.noprefix" -o $temp/embeddings_ru.prefix -p ru:
python $utils/strip_lines.py -i $temp/embeddings_ru.prefix -o $temp/embeddings_ru
./project_vectors_to_lang2.sh "$temp/embeddings_ru" "$temp/embeddings_en" $dictionary_ru_en "$temp/dummy" "$temp/embeddings_ru.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_ru.projected" >> $output_embeddings

# process si
export corpus_si="/usr1/home/wammar/monolingual/combo.si"
export dictionary_si_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.si-en.prefixed"
$word2vec/word2vec -train $corpus_si -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_si.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_si.noprefix" -o $temp/embeddings_si.prefix -p si:
python $utils/strip_lines.py -i $temp/embeddings_si.prefix -o $temp/embeddings_si
./project_vectors_to_lang2.sh "$temp/embeddings_si" "$temp/embeddings_en" $dictionary_si_en "$temp/dummy" "$temp/embeddings_si.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_si.projected" >> $output_embeddings

# process sl
export corpus_sl="/usr1/home/wammar/monolingual/combo.sl"
export dictionary_sl_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.sl-en.prefixed"
$word2vec/word2vec -train $corpus_sl -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_sl.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_sl.noprefix" -o $temp/embeddings_sl.prefix -p sl:
python $utils/strip_lines.py -i $temp/embeddings_sl.prefix -o $temp/embeddings_sl
./project_vectors_to_lang2.sh "$temp/embeddings_sl" "$temp/embeddings_en" $dictionary_sl_en "$temp/dummy" "$temp/embeddings_sl.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_sl.projected" >> $output_embeddings

# process so
export corpus_so="/usr1/home/wammar/monolingual/combo.so"
export dictionary_so_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.so-en.prefixed"
$word2vec/word2vec -train $corpus_so -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_so.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_so.noprefix" -o $temp/embeddings_so.prefix -p so:
python $utils/strip_lines.py -i $temp/embeddings_so.prefix -o $temp/embeddings_so
./project_vectors_to_lang2.sh "$temp/embeddings_so" "$temp/embeddings_en" $dictionary_so_en "$temp/dummy" "$temp/embeddings_so.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_so.projected" >> $output_embeddings

# process sr
export corpus_sr="/usr1/home/wammar/monolingual/combo.sr"
export dictionary_sr_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.sr-en.prefixed"
$word2vec/word2vec -train $corpus_sr -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_sr.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_sr.noprefix" -o $temp/embeddings_sr.prefix -p sr:
python $utils/strip_lines.py -i $temp/embeddings_sr.prefix -o $temp/embeddings_sr
./project_vectors_to_lang2.sh "$temp/embeddings_sr" "$temp/embeddings_en" $dictionary_sr_en "$temp/dummy" "$temp/embeddings_sr.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_sr.projected" >> $output_embeddings

# process sw
export corpus_sw="/usr1/home/wammar/monolingual/combo.sw"
export dictionary_sw_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.sw-en.prefixed"
$word2vec/word2vec -train $corpus_sw -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_sw.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_sw.noprefix" -o $temp/embeddings_sw.prefix -p sw:
python $utils/strip_lines.py -i $temp/embeddings_sw.prefix -o $temp/embeddings_sw
./project_vectors_to_lang2.sh "$temp/embeddings_sw" "$temp/embeddings_en" $dictionary_sw_en "$temp/dummy" "$temp/embeddings_sw.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_sw.projected" >> $output_embeddings

# process ta
export corpus_ta="/usr1/home/wammar/monolingual/combo.ta"
export dictionary_ta_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.ta-en.prefixed"
$word2vec/word2vec -train $corpus_ta -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_ta.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_ta.noprefix" -o $temp/embeddings_ta.prefix -p ta:
python $utils/strip_lines.py -i $temp/embeddings_ta.prefix -o $temp/embeddings_ta
./project_vectors_to_lang2.sh "$temp/embeddings_ta" "$temp/embeddings_en" $dictionary_ta_en "$temp/dummy" "$temp/embeddings_ta.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_ta.projected" >> $output_embeddings

# process te
export corpus_te="/usr1/home/wammar/monolingual/combo.te"
export dictionary_te_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.te-en.prefixed"
$word2vec/word2vec -train $corpus_te -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_te.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_te.noprefix" -o $temp/embeddings_te.prefix -p te:
python $utils/strip_lines.py -i $temp/embeddings_te.prefix -o $temp/embeddings_te
./project_vectors_to_lang2.sh "$temp/embeddings_te" "$temp/embeddings_en" $dictionary_te_en "$temp/dummy" "$temp/embeddings_te.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_te.projected" >> $output_embeddings

# process tg
export corpus_tg="/usr1/home/wammar/monolingual/combo.tg"
export dictionary_tg_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.tg-en.prefixed"
$word2vec/word2vec -train $corpus_tg -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_tg.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_tg.noprefix" -o $temp/embeddings_tg.prefix -p tg:
python $utils/strip_lines.py -i $temp/embeddings_tg.prefix -o $temp/embeddings_tg
./project_vectors_to_lang2.sh "$temp/embeddings_tg" "$temp/embeddings_en" $dictionary_tg_en "$temp/dummy" "$temp/embeddings_tg.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_tg.projected" >> $output_embeddings

# process tl
export corpus_tl="/usr1/home/wammar/monolingual/combo.tl"
export dictionary_tl_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.tl-en.prefixed"
$word2vec/word2vec -train $corpus_tl -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_tl.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_tl.noprefix" -o $temp/embeddings_tl.prefix -p tl:
python $utils/strip_lines.py -i $temp/embeddings_tl.prefix -o $temp/embeddings_tl
./project_vectors_to_lang2.sh "$temp/embeddings_tl" "$temp/embeddings_en" $dictionary_tl_en "$temp/dummy" "$temp/embeddings_tl.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_tl.projected" >> $output_embeddings

# process tr
export corpus_tr="/usr1/home/wammar/monolingual/combo.tr"
export dictionary_tr_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.tr-en.prefixed"
$word2vec/word2vec -train $corpus_tr -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_tr.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_tr.noprefix" -o $temp/embeddings_tr.prefix -p tr:
python $utils/strip_lines.py -i $temp/embeddings_tr.prefix -o $temp/embeddings_tr
./project_vectors_to_lang2.sh "$temp/embeddings_tr" "$temp/embeddings_en" $dictionary_tr_en "$temp/dummy" "$temp/embeddings_tr.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_tr.projected" >> $output_embeddings

# process uk
export corpus_uk="/usr1/home/wammar/monolingual/combo.uk"
export dictionary_uk_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.uk-en.prefixed"
$word2vec/word2vec -train $corpus_uk -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_uk.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_uk.noprefix" -o $temp/embeddings_uk.prefix -p uk:
python $utils/strip_lines.py -i $temp/embeddings_uk.prefix -o $temp/embeddings_uk
./project_vectors_to_lang2.sh "$temp/embeddings_uk" "$temp/embeddings_en" $dictionary_uk_en "$temp/dummy" "$temp/embeddings_uk.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_uk.projected" >> $output_embeddings

process ur
export corpus_ur="/usr1/home/wammar/monolingual/combo.ur"
export dictionary_ur_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.ur-en.prefixed"
$word2vec/word2vec -train $corpus_ur -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_ur.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_ur.noprefix" -o $temp/embeddings_ur.prefix -p ur:
python $utils/strip_lines.py -i $temp/embeddings_ur.prefix -o $temp/embeddings_ur
./project_vectors_to_lang2.sh "$temp/embeddings_ur" "$temp/embeddings_en" $dictionary_ur_en "$temp/dummy" "$temp/embeddings_ur.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_ur.projected" >> $output_embeddings

# process uz
export corpus_uz="/usr1/home/wammar/monolingual/combo.uz"
export dictionary_uz_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.uz-en.prefixed"
$word2vec/word2vec -train $corpus_uz -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_uz.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_uz.noprefix" -o $temp/embeddings_uz.prefix -p uz:
python $utils/strip_lines.py -i $temp/embeddings_uz.prefix -o $temp/embeddings_uz
./project_vectors_to_lang2.sh "$temp/embeddings_uz" "$temp/embeddings_en" $dictionary_uz_en "$temp/dummy" "$temp/embeddings_uz.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_uz.projected" >> $output_embeddings

process yi
export corpus_yi="/usr1/home/wammar/monolingual/combo.yi"
export dictionary_yi_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.yi-en.prefixed"
$word2vec/word2vec -train $corpus_yi -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_yi.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_yi.noprefix" -o $temp/embeddings_yi.prefix -p yi:
python $utils/strip_lines.py -i $temp/embeddings_yi.prefix -o $temp/embeddings_yi
./project_vectors_to_lang2.sh "$temp/embeddings_yi" "$temp/embeddings_en" $dictionary_yi_en "$temp/dummy" "$temp/embeddings_yi.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_yi.projected" >> $output_embeddings

# process zh
export corpus_zh="/usr1/home/wammar/monolingual/combo.zh"
export dictionary_zh_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.zh-en.prefixed"
$word2vec/word2vec -train $corpus_zh -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_zh.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_zh.noprefix" -o $temp/embeddings_zh.prefix -p zh:
python $utils/strip_lines.py -i $temp/embeddings_zh.prefix -o $temp/embeddings_zh
./project_vectors_to_lang2.sh "$temp/embeddings_zh" "$temp/embeddings_en" $dictionary_zh_en "$temp/dummy" "$temp/embeddings_zh.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_zh.projected" >> $output_embeddings

# process zu
export corpus_zu="/usr1/home/wammar/monolingual/combo.zu"
export dictionary_zu_en="/usr1/home/wammar/bilingual-dictionaries/google-translate/train/google_dict.zu-en.prefixed"
$word2vec/word2vec -train $corpus_zu -window 5 -iter 10 -size 40 -threads 16 -output "$temp/embeddings_zu.noprefix"
python $utils/prefix_lines.py -i "$temp/embeddings_zu.noprefix" -o $temp/embeddings_zu.prefix -p zu:
python $utils/strip_lines.py -i $temp/embeddings_zu.prefix -o $temp/embeddings_zu
./project_vectors_to_lang2.sh "$temp/embeddings_zu" "$temp/embeddings_en" $dictionary_zu_en "$temp/dummy" "$temp/embeddings_zu.projected" "$temp/embeddings_en.projected"
cat "$temp/embeddings_zu.projected" >> $output_embeddings

# finally, concatenate normalized english embeddings
cat "$temp/embeddings_en.projected" >> $output_embeddings
