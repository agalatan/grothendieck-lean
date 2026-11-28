#!/bin/bash
# Stage 0 (b): the recorded gate pipeline (code/degree5-gate/pipeline) for one game, unchanged scripts.
# usage: b_game.sh NAME E1 ETA TARGET      (run in ~/claude-b9ee-stage0/gateb; N)
cd "$(dirname "$0")"; G=$1; E1=$2; ETA=$3; TGT=$4; PY=$PWD/../venv/bin/python
export OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 MKL_NUM_THREADS=1 VECLIB_MAXIMUM_THREADS=1 RAYON_NUM_THREADS=1
TS=0.70,0.72,0.74,0.76,0.78,0.79,0.80,0.81,0.82,0.83,0.84,0.845,0.85,0.855,0.86,0.865,0.87,0.875,0.88,0.886
SEL=0.80,0.82,0.84,0.845,0.85,0.855,0.86,0.865,0.87,0.875
mkdir -p thresholds/games/$G/out logs
bash stage1.sh $G $E1 $ETA lo 0.70,0.72,0.74,0.76,0.78,0.79,0.80,0.81,0.82,0.83 &
bash stage1.sh $G $E1 $ETA hi 0.84,0.845,0.85,0.855,0.86,0.865,0.87,0.875,0.88,0.886 &
wait
cat thresholds/games/$G/rows_lo.lines thresholds/games/$G/rows_hi.lines > thresholds/games/$G/rows_all.lines
rm -rf gate_$G; cp -R gate gate_$G; rm -rf gate_$G/out gate_$G/regress
$PY - <<P
import json
rows = sorted([json.loads(l) for l in open('thresholds/games/$G/rows_all.lines') if l.strip()], key=lambda r: r['t'])
assert len(rows) == 20, len(rows)
open('gate_$G/rows5.lines', 'w').write('\n'.join(json.dumps({k: r[k] for k in ('t', 'l', 'beta', 'bA', 'bB', 'sig', 'nu5', 'branch', 'row', 'plain', 'driver')}) for r in rows) + '\n')
P
(cd thresholds && ALLOW_PY=$PY ALLOW_TS=$TS D5_TARGET=$TGT $PY band5.py $G $E1 $ETA $SEL > games/$G/band5.out 2>&1) &
for ch in "1 2 3 4 5" "6 7 8 9 10" "11 12 13 14 15" "16 17 18 19 20"; do
  (cd gate_$G && D5_E1=$E1 D5_ETA=$ETA bash run_gate_all.sh $PY - "$ch" spike) &
done
(cd gate_$G && D5_E1=$E1 D5_ETA=$ETA bash run_gate_all.sh $PY - '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20') &
wait
(cd gate_$G && D5_E1=$E1 D5_ETA=$ETA $PY collect_gate.py exact > ../logs/gate_$G.md 2>&1)
echo "DONE $G" >> logs/done.log
