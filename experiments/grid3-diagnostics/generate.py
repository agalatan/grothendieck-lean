#!/usr/bin/env python3
"""Generate independent native-decide probes outside the project source tree."""
import argparse
from pathlib import Path

parser = argparse.ArgumentParser()
parser.add_argument('output', type=Path, help='new, dedicated output directory')
args = parser.parse_args()
args.output.mkdir(parents=True, exist_ok=False)
for node in (186, 204):
    for piece in range(4):
        source = f'''import Grothe.LowerAnalytic.CapPieceRange
import Grothe.LowerAnalytic.CapPieces.D12x{node}
open Grothe.LowerAnalytic
example : pieceOneOK pieceTables pieceNode_12x{node} {piece} = true := by native_decide
'''
        (args.output / f'Node{node}Piece{piece}.lean').write_text(source)
print('generated eight individual probes in', args.output)
