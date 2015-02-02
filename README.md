#Cross-lingual Word Vectors Projection Using CCA
Manaal Faruqui, mfaruqui@cs.cmu.edu

This tool can be used to project vectors of two different languages
in the same space where they are maximally correlated. This tool is
associated with (Faruqui and Dyer, 2014). These projected vectors are
found to be much better than the original vectors on a variety of 
lexical semantic evaluation tasks.

###Requirements:-

1. Python 2.7
2. Matlab accessible from the shell

###Data you need:-
1. Language1 Word Vector File 
2. Language2 Word Vector File
3. Word Alignment File

Each vector file should have one word vector per line as follows (space delimited):-

```the -1.0 2.4 -0.3 ...```

The word alignment file should have the following format (one word pair per line):-

```lang2word ||| lang1word```

Look at the ```en-sample.txt de-sample.txt``` (uncompress them) and ```align-sample.txt```

###Running the projection program

```./project_vectors.sh Lang1VectorFile Lang2VectorFile WordAlignFile OutFile Ratio```

```./project_vectors.sh en-sample.txt de-sample.txt align-sample.txt out 0.5```

where, Ratio is a float from 1 to 0. It is the fraction of the original
vector length that you want your projected vectors to have.

###Output
Two files of names: ```OutFile_orig1_projected.txt```, ```OutFile_orig2_projected.txt```

which are you new projected word vectors, enjoy ! :D

###Reference

```
@InProceedings{faruqui-dyer:2014:EACL,
  author    = {Faruqui, Manaal  and  Dyer, Chris},
  title     = {Improving Vector Space Word Representations Using Multilingual Correlation},
  booktitle = {Proceedings of the 14th Conference of the European Chapter of the Association for Computational Linguistics},
  month     = {April},
  year      = {2014},
  address   = {Gothenburg, Sweden},
  publisher = {Association for Computational Linguistics},
  pages     = {462--471},
  url       = {http://www.aclweb.org/anthology/E14-1049}
}
```
