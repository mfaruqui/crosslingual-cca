import os
import re
import time
import io
import sys
import argparse
from collections import defaultdict
import random

def compute_shared_prefix_length(bitstring1, bitstring2):
  common_prefix_length = 0
  for i in xrange(min(len(bitstring1), len(bitstring2))):
    if bitstring1[i] == bitstring2[i]:
      common_prefix_length += 1
    else:
      break
  return common_prefix_length

# parse/validate arguments
argparser = argparse.ArgumentParser()
argparser.add_argument("-c", "--clusters_filename", help='word types and their corresponding cluster bitstrings', required=True)
argparser.add_argument("-d", "--synonyms_filename", help='pairs of words which should fall in the same cluster', required=True)
argparser.add_argument("-s", "--sample_size", help='number of word samples to compare against for each synonym pair', default=10, type=float)
args = argparser.parse_args()

print "Reading word cluster bitstrings..."
word_to_bitstring = {}
with io.open(args.clusters_filename, encoding='utf8') as clusters_file:
  for line in clusters_file:
    word, bitstring = line.strip().split(' ')
    word_to_bitstring[word] = bitstring
word_list = word_to_bitstring.keys()

print "Reading synonyms..."
word_to_synonyms = defaultdict(set)
with io.open(args.synonyms_filename, encoding='utf8') as synonyms_file:
  for line in synonyms_file:
    word1, word2 = line.strip().split(' ||| ')
    if word1 not in word_to_bitstring or word2 not in word_to_bitstring: continue
    word_to_synonyms[word1].add(word2)
    word_to_synonyms[word2].add(word1)

print "Evaluating clusters..."
correct, incorrect = 0, 0
for word in word_to_synonyms.keys():
  word_synonyms = list(word_to_synonyms[word])
  word_nonsynonyms = random.sample(word_list, args.sample_size)
  similarity_to_synonyms = 0.0
  for word_synonym in word_synonyms:
    similarity_to_synonyms += compute_shared_prefix_length(word_to_bitstring[word], word_to_bitstring[word_synonym])
  average_similarity_to_synonyms = similarity_to_synonyms * 1.0 / len(word_synonyms)
  similarity_to_nonsynonyms = 0.0
  for word_nonsynonym in word_nonsynonyms:
    similarity_to_nonsynonyms += compute_shared_prefix_length(word_to_bitstring[word], word_to_bitstring[word_nonsynonym])
  average_similarity_to_nonsynonyms = similarity_to_nonsynonyms * 1.0 / len(word_nonsynonyms)
  print u'{}: {} (avg of {}) > {} (avg of {}) ?'.format(word, similarity_to_synonyms, len(word_synonyms), average_similarity_to_nonsynonyms, len(word_nonsynonyms))
  if average_similarity_to_synonyms > average_similarity_to_nonsynonyms:
    correct += 1
  else:
    incorrect += 1

print 'correct = {}, incorrect = {}, accuracy = {}'.format(correct, incorrect, 1.0 * correct / (correct + incorrect))
