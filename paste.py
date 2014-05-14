import re
import time
import io
import sys
import argparse
from collections import defaultdict

# parse/validate arguments
argParser = argparse.ArgumentParser()
argParser.add_argument("-d", "--delimiter", type=str, default='\t', help="delimiter defaults to \t")
argParser.add_argument("-1", "--firstFilename", type=str)
argParser.add_argument("-2", "--secondFilename", type=str)
argParser.add_argument("-o", "--outputFilename", type=str)
argParser.add_argument("-ie", "--input_encoding", type=str, default='utf8')
argParser.add_argument("-oe", "--output_encoding", type=str, default='utf8')
args = argParser.parse_args()

firstFile = io.open(args.firstFilename, encoding=args.input_encoding, mode='r')
secondFile = io.open(args.secondFilename, encoding=args.input_encoding, mode='r')
outputFile = io.open(args.outputFilename, encoding=args.output_encoding, mode='w')

counter = 0
for firstLine in firstFile:
  secondLine = secondFile.readline()
  if len(secondLine) == 0:
    print 'error: second file is shorter than first file at line {0}'.format(counter)
    exit(1)
  outputFile.write(u'{0}{1}{2}'.format(firstLine.strip(), args.delimiter, secondLine))
  counter += 1
  
firstFile.close()
secondFile.close()
outputFile.close()
