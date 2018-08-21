# Cross-lingual Word Vectors Projection Using CCA
Manaal Faruqui, manaalfar@gmail.com

This tool can be used to project vectors of two different languages
in the same space where they are maximally correlated. This tool is
associated with (Faruqui and Dyer, 2014). These projected vectors are
found to be much better than the original vectors on a variety of 
lexical semantic evaluation tasks.

### Requirements:-

1. Python 2.7
2. Matlab accessible from the shell

### Data you need:-
1. Language1 Word Vector File 
2. Language2 Word Vector File
3. Word Alignment File

Each vector file should have one word vector per line as follows (space delimited):-

```the -1.0 2.4 -0.3 ...```

The word alignment file should have the following format (one word pair per line):-

```lang1word ||| lang2word```

Look at the ```en-sample.txt de-sample.txt``` (uncompress them) and ```align-sample.txt```

### Projecting the embeddings in both languages to a shared space:

```./project_vectors.sh Lang1VectorFile Lang2VectorFile WordAlignFile OutFile Ratio```

```./project_vectors.sh en-sample.txt de-sample.txt align-sample.txt out 0.5```

where, Ratio is a float from 1 to 0. It is the fraction of the original
vector length that you want your projected vectors to have.

#### Output
Two files of names: ```OutFile_orig1_projected.txt```, ```OutFile_orig2_projected.txt```

which are you new projected word vectors, enjoy ! :D

### Projecting the embeddings of language 1 to the vector space of language 2:
```./project_vectors_to_lang2.sh Lang1VectorFile Lang2VectorFile WordAlignFile ProjectionFromLang1SpaceToLang2Space Lang1WordEmbeddingsProjectedToLang2Space```

```./project_vectors.sh en-sample.txt de-sample.txt align-sample.txt en-de-projection projected-en-word-embeddings```

Unlike ``project_vectors.sh``, the number of columns (i.e., size of word embeddings) in ``Lang1VectorFile`` and ``Lang2VectorFile`` must match when using ``project_vectors_to_lang2.sh``. The number of rows (i.e., vocabulary size) may be different. Otherwise, the input files to ``project_vectors_to_lang2.sh`` are identical to those of ``project_vectors.sh``.

#### Output
``ProjectionFromLang1SpaceToLang2Space`` is a serialization of a squared matrix with each dimension equal to the word embeddings length in ``Lang1VectorFile`` (or ``Lang2VectorFile``; they must match). The standard canonical correlation analysis returns two matrices (A, B) which represent the linear transformation from language 1 vector space to the shared space, and from language 2 vector space to the shared space, respectively. The matrix in this file is the result of AB<sup>-1</sup>.

``Lang1WordEmbeddingsProjectedToLang2Space`` consists of word embeddings for language 1 words (as read from Lang1VectorFile), projected to the vector space in which language 2 vectors live.

### Reference

```
@InProceedings{faruqui-dyer:2014:EACL,
  author    = {Faruqui, Manaal  and  Dyer, Chris},
  title     = {Improving Vector Space Word Representations Using Multilingual Correlation},
  booktitle = {Proceedings of EACL},
  year      = {2014}
}
```
