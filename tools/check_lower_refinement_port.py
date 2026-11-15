# tools/check_lower_refinement_port.py
"""Compare Lean's original box values with every exact Python port value."""
import argparse
from fractions import Fraction
from pathlib import Path

from lower_refinement import data, evaluate, strings
from verify_lower_refinement import require, source_check


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('lean_values', type=Path)
    args = parser.parse_args()
    source_check()
    lines = args.lean_values.read_text().splitlines()
    require(len(lines) == len(strings), 'Wrong number of Lean box values')
    for index, (line, source) in enumerate(zip(lines, strings)):
        fields = line.split()
        require(len(fields) == 2 and fields[0] == str(index),
                f'Malformed or reordered Lean box value at {index}')
        require(Fraction(fields[1]) == evaluate(data(source)),
                f'Lean/Python box value mismatch at {index}')
    print(f'PASS all {len(strings)} original Lean/Python box values agree exactly')


if __name__ == '__main__':
    main()
