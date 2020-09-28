from ruffus import *
from ruffus.combinatorics import *
import sys
import os
from cgatcore import pipeline as P


PARAMS = P.get_parameters(
    ["%s/pipeline.yml" % os.path.splitext(__file__)[0],
     "../pipeline.yml",
     "pipeline.yml"])

@originate(['a_originate.tsv', 'b_originate.tsv'])
def exampleOriginate(outfile):
    '''
    Example of ruffus originate decorator.

    @originate generates new files from scratch (0 to many operation)

    Here, this function generates two new files:
    a_originate.tsv
    b_originate.tsv

    '''
    out = open(outfile, "w")
    out.write("I am %s - generated using @originate" % outfile)
    out.close()

@follows(exampleOriginate)
def full():
    '''
    All cgat pipelines should end with a full() function which updates,
    if needed, all branches of the pipeline.
    The @follows statement should ensure that all functions are covered,
    either directly or as prerequisites.
    '''


def main(argv=None):
    if argv is None:
        argv = sys.argv
    P.main(argv)


if __name__ == "__main__":
    sys.exit(P.main(sys.argv))
