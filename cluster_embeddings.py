import os
import re
import time
import io
import sys
import argparse
from collections import defaultdict

# parse/validate arguments
argparser = argparse.ArgumentParser()
argparser.add_argument("-i", "--input_filename", help='input word vector representations.', required=True)
argparser.add_argument("-o", "--output_filename", help='output word cluster bitstrings.', required=True)
args = argparser.parse_args()

print "Clustering word vectors..."
os.system('matlab -nodesktop -nosplash -nojvm -nodisplay -r "cluster_embeddings({}, {}); exit"'.format("'"+args.input_filename+"'", "'"+args.output_filename + "temp'"))

# read branchings (bottom up)
print "Reading the hierarchy..."
parent_to_children_cluster_ids = {}
child_to_parent_and_direction = {}
with io.open(args.output_filename + "temp", encoding='utf8') as branchings_file:
  # first line consists of an integer, the number of vectors in input file
  vectors_count = int(branchings_file.readline())
  assert(vectors_count > 0)
  lines_counter = 1
  for line in branchings_file:
    parent_cluster_id = lines_counter + vectors_count
    left_cluster_id, right_cluster_id, distance = line.split()
    left_cluster_id, right_cluster_id, distance = int(left_cluster_id), int(right_cluster_id), float(distance)
    parent_to_children_cluster_ids[parent_cluster_id] = (left_cluster_id, right_cluster_id,)
    child_to_parent_and_direction[left_cluster_id] = (parent_cluster_id, 0)
    child_to_parent_and_direction[right_cluster_id] = (parent_cluster_id, 1)
    lines_counter += 1
assert(lines_counter == vectors_count)

# accumulate bit strings (top down)
print "Computing bitstrings..."
root_cluster_id = 2 * vectors_count - 1 
assert(root_cluster_id not in child_to_parent_and_direction)
assert(root_cluster_id in parent_to_children_cluster_ids)
cluster_id_to_bitstring = {root_cluster_id:''}
traversal_stack = [root_cluster_id]
nodes_counter = 0
while len(traversal_stack):
  print 'stack={}'.format(traversal_stack)
  current_cluster_id = traversal_stack.pop()
  print 'popped current_cluster_id={}'.format(current_cluster_id)
  # leaf?
  if current_cluster_id <= vectors_count:
    assert(current_cluster_id in child_to_parent_and_direction)
    assert(current_cluster_id not in parent_to_children_cluster_ids)   
    continue
  # compute children's bitstrings and add them to the stack
  assert(current_cluster_id in parent_to_children_cluster_ids)
  assert(current_cluster_id in cluster_id_to_bitstring)
  current_cluster_bitstring = cluster_id_to_bitstring[current_cluster_id]    
  left_cluster_id, right_cluster_id = parent_to_children_cluster_ids[current_cluster_id]
  left_cluster_bitstring, right_cluster_bitstring = current_cluster_bitstring + '0', current_cluster_bitstring + '1'
  cluster_id_to_bitstring[left_cluster_id], cluster_id_to_bitstring[right_cluster_id] = left_cluster_bitstring, right_cluster_bitstring
  traversal_stack.append(left_cluster_id)
  traversal_stack.append(right_cluster_id)
  print 'pushed left_cluster_id = {}'.format(left_cluster_id)
  print 'pushed right_cluster_id = {}'.format(right_cluster_id)
  nodes_counter += 1
  print('{} bitstrings computed, the last of which is {} for cluster id {}. stack size = {}'.format(nodes_counter, right_cluster_bitstring, right_cluster_id, len(traversal_stack)))
  if nodes_counter % 1000 == 0:
    raw_input("Hit the enter key to continue: ") 
assert(len(cluster_id_to_bitstring) == 2 * vectors_count - 1)

# persist.
print "Writing bitstrings to file..."
with io.open(args.input_filename, encoding='utf8') as word_vectors_file, io.open(args.output_filename, encoding='utf8', mode='w') as cluster_bitstrings_file:
  lines_counter = 1
  for line in word_vectors_file:
    current_word = line.split(' ')[0]
    current_bitstring = cluster_id_to_bitstring[lines_counter]
    cluster_bitstrings_file.write(u'{} {}\n'.format(current_word, current_bitstring))
    lines_counter += 1

print "Done."
